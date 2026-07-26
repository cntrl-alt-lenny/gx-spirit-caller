#!/usr/bin/env python3
"""
check_ci_contract.py — prove the merge gates can actually gate.

Failure mode (real incident: PR #1365, and #1360 blocked by it): a status check
is marked REQUIRED in the branch-protection ruleset while its workflow carries a
`paths:` filter. A workflow skipped by a path filter does not report "success" —
it does not report AT ALL. GitHub holds the required check pending forever, so
the PR is BLOCKED with every real check green, and no amount of re-running helps.

This bit for months. `drift-check` was required and filtered to `tools/**.py` +
`docs/{briefs,research}/**.md`. Every worker PR happens to write a research
writeup, so the filter matched by luck and nobody noticed — until #1360 touched
only `docs/queue/*.md` and `tests/*.py` and deadlocked. `docs/state.md` asserted
drift-check was one of "the only 3 that run on EVERY PR"; that was never true.

The sibling failure is a rename: change a job's `name:` (or its id, when it has
no `name:`) and the required context it used to satisfy silently stops existing.
Same deadlock, different cause. Both shapes read as "fine" from the PR page,
which is exactly why they need a machine to notice.

What this checks, all statically (no network, no token):

  1. every required context resolves to a real job context in some workflow
  2. every workflow supplying a required context runs on EVERY pull request —
     no `paths` / `paths-ignore`, and no `branches` filter that could exclude
     the default branch
  3. no required context is supplied by two different workflows (ambiguous —
     GitHub matches by name, so whichever reports last wins)

The required-context list is committed at `.github/required-checks.txt` so this
runs offline and in CI. `--verify-ruleset` additionally diffs that file against
the live ruleset via `gh`, catching drift between the repo and GitHub's own
settings; it skips cleanly (exit 0) when `gh` is unavailable or unauthenticated,
so it never turns a network blip into a red gate.

Context-name derivation mirrors GitHub's own rules:
    job with no `name:`      -> context is the job id
    job with `name: Foo`     -> context is "Foo"
    matrix job `name: F (${{ matrix.r }})` with r: [a, b] -> "F (a)", "F (b)"
A `${{ ... }}` expression that is not a plain `matrix.KEY` reference cannot be
resolved statically; it is reported as UNRESOLVABLE rather than guessed at, so
this tool never invents a passing answer it cannot justify.

Usage:
    python3.13 tools/check_ci_contract.py                  # static checks
    python3.13 tools/check_ci_contract.py --verify-ruleset # also diff vs GitHub
    python3.13 tools/check_ci_contract.py --list           # show resolved contexts

Exit codes:
    0   configuration is coherent
    1   a required check can never report (deadlock) or is ambiguous
    2   usage / IO / parse error
"""
from __future__ import annotations

import argparse
import itertools
import json
import os
import re
import subprocess
import sys
from pathlib import Path

import yaml

ROOT = Path(__file__).resolve().parent.parent
WORKFLOW_DIR = ROOT / ".github" / "workflows"
CONTRACT = ROOT / ".github" / "required-checks.txt"

# A `paths:`/`paths-ignore:` filter can exclude a PR outright. A
# `branches:`/`branches-ignore:` filter can exclude the PR's *base*. Either one
# makes the workflow conditional, and a conditional workflow cannot satisfy a
# required check.
BLOCKING_FILTERS = ("paths", "paths-ignore", "branches", "branches-ignore")

_MATRIX_REF = re.compile(r"\$\{\{\s*matrix\.([A-Za-z_][A-Za-z0-9_-]*)\s*\}\}")
_ANY_EXPR = re.compile(r"\$\{\{.*?\}\}")


class ContractError(Exception):
    """Usage / IO / parse failure — exit 2, distinct from a real finding."""


def _trigger_block(doc: dict) -> dict | None:
    """Return the `on:` mapping.

    PyYAML resolves a bare `on` key to the boolean True (YAML 1.1 treats on/off
    as booleans), so the block can arrive under either key depending on whether
    the author quoted it. Both spellings are legal GitHub Actions and both are
    present in this repo's history, so handle both rather than normalising.
    """
    raw = doc.get(True) if True in doc else doc.get("on")
    if isinstance(raw, str):          # `on: pull_request`
        return {raw: None}
    if isinstance(raw, list):         # `on: [push, pull_request]`
        return {k: None for k in raw}
    return raw if isinstance(raw, dict) else None


def _pr_filters(doc: dict) -> tuple[bool, list[str]]:
    """(runs_on_pull_request, blocking_filter_keys).

    `pull_request:` with an empty body parses to None, which means "every PR" —
    NOT "absent". Conflating those two is the bug this whole tool exists to
    catch, so it is spelled out explicitly here.
    """
    trig = _trigger_block(doc)
    if not trig or "pull_request" not in trig:
        return False, []
    body = trig["pull_request"]
    if not isinstance(body, dict):    # None / empty -> unconditional
        return True, []
    return True, [k for k in BLOCKING_FILTERS if k in body]


def _matrix_combos(job: dict) -> list[dict[str, str]]:
    """Expand `strategy.matrix` into concrete key->value dicts.

    Only plain list-valued axes are expanded. `include`/`exclude` and
    expression-valued matrices are not modelled; callers treat an unexpanded
    `${{ }}` as UNRESOLVABLE rather than assuming a shape.
    """
    matrix = ((job or {}).get("strategy") or {}).get("matrix")
    if not isinstance(matrix, dict):
        return [{}]
    axes = {k: v for k, v in matrix.items()
            if k not in ("include", "exclude") and isinstance(v, list)}
    if not axes:
        return [{}]
    keys = list(axes)
    # strict=True is safe: product() yields one value per key by construction.
    return [dict(zip(keys, vals, strict=True))
            for vals in itertools.product(*(axes[k] for k in keys))]


def _contexts_for_job(job_id: str, job: dict) -> list[tuple[str, bool]]:
    """[(context, resolvable)] for one job, following GitHub's naming rules."""
    template = (job or {}).get("name") or job_id
    if not isinstance(template, str):
        return [(job_id, True)]
    out: list[tuple[str, bool]] = []
    for combo in _matrix_combos(job):
        # Bind `combo` as a default arg: a bare closure over the loop variable
        # would resolve to the LAST combination for every iteration (ruff B023).
        ctx = _MATRIX_REF.sub(
            lambda m, _c=combo: str(_c.get(m.group(1), m.group(0))), template
        )
        out.append((ctx, not _ANY_EXPR.search(ctx)))
    # Same job can yield duplicate contexts if the name ignores the matrix;
    # dedupe so a one-axis-unused matrix isn't reported as ambiguous.
    seen, uniq = set(), []
    for ctx, ok in out:
        if ctx not in seen:
            seen.add(ctx)
            uniq.append((ctx, ok))
    return uniq


def load_workflows(directory: Path | None = None) -> dict[str, dict]:
    """{filename: parsed_yaml} for every workflow, loudly on a parse error."""
    directory = directory or WORKFLOW_DIR
    if not directory.is_dir():
        raise ContractError(f"no workflow directory at {directory}")
    docs: dict[str, dict] = {}
    for path in sorted(itertools.chain(directory.glob("*.yml"),
                                       directory.glob("*.yaml"))):
        try:
            parsed = yaml.safe_load(path.read_text(encoding="utf-8"))
        except yaml.YAMLError as exc:
            raise ContractError(f"{path.name}: unparseable YAML: {exc}") from exc
        if isinstance(parsed, dict):
            docs[path.name] = parsed
    if not docs:
        raise ContractError(f"no workflows found in {directory}")
    return docs


def resolve_contexts(docs: dict[str, dict]) -> dict[str, list[dict]]:
    """context -> [{workflow, job, unconditional, filters, resolvable}]."""
    index: dict[str, list[dict]] = {}
    for fname, doc in docs.items():
        on_pr, filters = _pr_filters(doc)
        if not on_pr:
            continue          # cannot supply a PR check context at all
        for job_id, job in (doc.get("jobs") or {}).items():
            for ctx, resolvable in _contexts_for_job(job_id, job):
                index.setdefault(ctx, []).append({
                    "workflow": fname,
                    "job": job_id,
                    "unconditional": not filters,
                    "filters": filters,
                    "resolvable": resolvable,
                })
    return index


def load_contract(path: Path | None = None) -> list[str]:
    """Required contexts, one per line; `#` comments and blanks ignored."""
    path = path or CONTRACT
    if not path.is_file():
        raise ContractError(
            f"no required-check contract at {path}. Create it with one status-"
            f"check context per line (the exact string GitHub shows on the PR)."
        )
    out = []
    for line in path.read_text(encoding="utf-8").splitlines():
        line = line.split("#", 1)[0].strip()
        if line:
            out.append(line)
    if not out:
        raise ContractError(f"{path} lists no required checks — refusing to "
                            f"pass vacuously. Delete the file or populate it.")
    return out


def check(required: list[str], index: dict[str, list[dict]]) -> list[str]:
    """Return human-readable problems; empty list means coherent."""
    problems: list[str] = []
    for ctx in required:
        providers = index.get(ctx, [])
        if not providers:
            near = [c for c in index if c.lower() == ctx.lower()]
            hint = f" Did you mean {near[0]!r}? (contexts are case-sensitive)" \
                   if near else ""
            problems.append(
                f"REQUIRED CHECK NEVER REPORTS: {ctx!r} matches no job in any "
                f"workflow that runs on pull_request. Every PR will block "
                f"forever waiting for it.{hint} Fix: restore the job/name, or "
                f"drop it from {CONTRACT.name} AND the ruleset together."
            )
            continue
        if len(providers) > 1:
            where = ", ".join(f"{p['workflow']}:{p['job']}" for p in providers)
            problems.append(
                f"AMBIGUOUS REQUIRED CHECK: {ctx!r} is produced by {where}. "
                f"GitHub matches contexts by name, so the reported conclusion "
                f"depends on which finishes last. Rename one."
            )
        for p in providers:
            if not p["unconditional"]:
                problems.append(
                    f"REQUIRED CHECK IS CONDITIONAL: {ctx!r} comes from "
                    f"{p['workflow']}:{p['job']}, which filters pull_request on "
                    f"{p['filters']}. A filtered-out run never reports a "
                    f"conclusion, so any PR outside that filter blocks forever. "
                    f"Fix: remove the filter, or drop this check from the "
                    f"required list (both settings must change together)."
                )
            if not p["resolvable"]:
                problems.append(
                    f"UNRESOLVABLE CONTEXT: {p['workflow']}:{p['job']} builds "
                    f"its name from an expression this tool cannot evaluate "
                    f"statically. Verified nothing for {ctx!r} — give the job a "
                    f"literal `name:` so the contract is checkable."
                )
    return problems


def verify_ruleset(required: list[str]) -> tuple[bool, str]:
    """Diff the committed contract against the live ruleset via `gh`.

    Returns (ok, message). Any environment problem (no gh, not authenticated,
    no ruleset) yields ok=True with an explanatory message: this is a drift
    detector, and a missing token is not drift.
    """
    repo = os.environ.get("GITHUB_REPOSITORY")
    if not repo:
        try:
            repo = subprocess.run(
                ["gh", "repo", "view", "--json", "nameWithOwner",
                 "-q", ".nameWithOwner"],
                capture_output=True, text=True, timeout=30,
            ).stdout.strip()
        except (OSError, subprocess.SubprocessError):
            return True, "SKIP: `gh` unavailable — cannot diff live ruleset."
    if not repo:
        return True, "SKIP: could not determine repository."
    try:
        proc = subprocess.run(
            ["gh", "api", f"repos/{repo}/rulesets"],
            capture_output=True, text=True, timeout=60,
        )
    except (OSError, subprocess.SubprocessError) as exc:
        return True, f"SKIP: `gh api` failed ({exc})."
    if proc.returncode != 0:
        return True, ("SKIP: cannot read rulesets (needs admin scope) — "
                      f"{proc.stderr.strip()[:160]}")
    live: set[str] = set()
    try:
        for summary in json.loads(proc.stdout or "[]"):
            detail = subprocess.run(
                ["gh", "api", f"repos/{repo}/rulesets/{summary['id']}"],
                capture_output=True, text=True, timeout=60,
            )
            if detail.returncode != 0:
                continue
            for rule in json.loads(detail.stdout).get("rules", []):
                if rule.get("type") == "required_status_checks":
                    params = rule.get("parameters") or {}
                    for chk in params.get("required_status_checks") or []:
                        live.add(chk["context"])
    except (json.JSONDecodeError, KeyError, TypeError) as exc:
        return True, f"SKIP: unexpected ruleset payload ({exc})."
    if not live:
        return True, "SKIP: no required_status_checks rule found live."
    missing = live - set(required)
    extra = set(required) - live
    if missing or extra:
        lines = ["RULESET DRIFT — the committed contract disagrees with GitHub:"]
        for c in sorted(missing):
            lines.append(f"  required live but absent from {CONTRACT.name}: {c!r}")
        for c in sorted(extra):
            lines.append(f"  listed in {CONTRACT.name} but not required live: {c!r}")
        return False, "\n".join(lines)
    return True, f"live ruleset matches the contract ({len(live)} check(s))."


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(
        description="Prove every required status check can actually report."
    )
    ap.add_argument("--verify-ruleset", action="store_true",
                    help="also diff the contract against GitHub's live ruleset "
                         "(needs `gh` + admin scope; skips cleanly without)")
    ap.add_argument("--list", action="store_true",
                    help="print every resolved pull_request check context")
    args = ap.parse_args(argv)

    try:
        docs = load_workflows()
        index = resolve_contexts(docs)
        required = load_contract()
    except ContractError as exc:
        print(f"check_ci_contract: {exc}", file=sys.stderr)
        return 2

    if args.list:
        for ctx in sorted(index):
            for p in index[ctx]:
                flag = "" if p["unconditional"] else f"  [filtered: {p['filters']}]"
                print(f"{ctx}\t{p['workflow']}:{p['job']}{flag}")
        return 0

    problems = check(required, index)
    exit_code = 0
    if problems:
        print(f"Found {len(problems)} CI-contract problem(s):\n")
        for p in problems:
            print(f"  - {p}\n")
        exit_code = 1
    else:
        print(f"OK: all {len(required)} required check(s) resolve to a job that "
              f"runs on every pull request.")

    if args.verify_ruleset:
        ok, msg = verify_ruleset(required)
        print(f"\n{msg}")
        if not ok:
            exit_code = 1
    return exit_code


if __name__ == "__main__":
    sys.exit(main())
