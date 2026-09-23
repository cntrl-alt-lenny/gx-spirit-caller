#!/usr/bin/env python3
"""fw.py -- the one tool the agentic framework installs into a project.

Every command works the same on Windows, macOS and Linux, in any AI tool that
can run git and Python 3.9+. Standard library only.

    python3 tools/fw.py status [--offline] [--leaving]
        Where things stand: framework release, rounds in flight, what this
        machine has not pushed, and the project checks. Brain's first command.
    python3 tools/fw.py start --role ROLE --round ID [--review BRANCH]
        First command of a Worker or Verifier session. Puts the session on its
        own branch at the right commit, from any clone or checkout.
    python3 tools/fw.py report --role ROLE --round ID [--push]
        Checks docs/rounds/ID/ROLE.md has the required sections, stamps it with
        the commit it describes, and commits (and pushes) only that file.
    python3 tools/fw.py delivery --round ID [--branch BRANCH]
        Whether a round's work is delivered, on which branch, at which commit.
    python3 tools/fw.py check
        The project hygiene checks. Exit 1 when one fails.

Add --cwd DIR to any command to run it against another checkout. If `python3`
is not found, use `py -3` (Windows) or `python`.

Why it is built this way: everything a later session needs travels through git
-- briefs and reports are committed files under docs/rounds/ -- so a round can
be started on one machine or tool and finished on another. Nothing here reads
a private folder, a chat transcript or a synced drive.
"""

from __future__ import annotations

import argparse
import datetime
import hashlib
import json
import os
import platform
import re
import subprocess
import sys
from pathlib import Path

ROUNDS = "docs/rounds"
MANIFEST = "docs/agents/framework.json"
STATE_DOC = "docs/state.md"
DEFAULT_STATE_WORDS = 1000
AGENTS_WORDS_WARNING = 2500
MERGE_RULES = ("owner-approves", "brain-merges")

ROUND_ID = re.compile(r"^[A-Za-z0-9][A-Za-z0-9._-]{0,79}$")
ROLE_NAME = re.compile(r"^[a-z][a-z0-9_-]{0,39}$")
WINDOWS_RESERVED = {"con", "prn", "aux", "nul"} | {
    f"{p}{n}" for p in ("com", "lpt") for n in range(1, 10)
}

#: Required report sections, by role. Any executor role (worker, builder, a
#: specialist) uses the default set.
REPORT_SECTIONS = {
    "verifier": ("Findings", "Not verified", "Verdict"),
}
DEFAULT_SECTIONS = ("Verified", "Not verified", "Changed", "Open questions")

HEADER_START = "<!-- fw-report"
HEADER_END = "-->"


class FwError(Exception):
    """A problem the user can act on; printed without a traceback."""


# --------------------------------------------------------------------------
# git plumbing


def git(args: list[str], cwd: Path, *, timeout: float | None = None,
        check: bool = False) -> subprocess.CompletedProcess:
    try:
        result = subprocess.run(
            ["git", *args], cwd=str(cwd), capture_output=True, text=True,
            encoding="utf-8", errors="replace", timeout=timeout,
        )
    except FileNotFoundError as exc:
        raise FwError("git is not installed or not on PATH") from exc
    except subprocess.TimeoutExpired:
        result = subprocess.CompletedProcess(["git", *args], 124, "", "timed out")
    if check and result.returncode != 0:
        raise FwError(f"git {' '.join(args)} failed: {result.stderr.strip()}")
    return result


def out(args: list[str], cwd: Path) -> str:
    return git(args, cwd, check=True).stdout.strip()


def ok(args: list[str], cwd: Path) -> bool:
    return git(args, cwd).returncode == 0


def repo_root(cwd: Path) -> Path:
    result = git(["rev-parse", "--show-toplevel"], cwd)
    if result.returncode != 0:
        raise FwError(f"{cwd} is not inside a git repository")
    return Path(result.stdout.strip())


def has_origin(root: Path) -> bool:
    return ok(["remote", "get-url", "origin"], root)


def fetch(root: Path) -> str | None:
    """Fetch origin; return a warning instead of failing when offline."""
    if not has_origin(root):
        return None
    result = git(["fetch", "--quiet", "--prune", "origin"], root, timeout=60)
    if result.returncode != 0:
        return f"could not fetch from origin ({result.stderr.strip() or 'offline?'}); using what this clone already has"
    return None


def default_branch(root: Path) -> str:
    result = git(["symbolic-ref", "--quiet", "--short", "refs/remotes/origin/HEAD"], root)
    if result.returncode == 0 and "/" in result.stdout:
        return result.stdout.strip().split("/", 1)[1]
    for name in ("main", "master"):
        if ok(["rev-parse", "--verify", "--quiet", f"refs/remotes/origin/{name}"], root) or ok(
            ["rev-parse", "--verify", "--quiet", f"refs/heads/{name}"], root
        ):
            return name
    return "main"


def base_ref(root: Path) -> str:
    name = default_branch(root)
    if ok(["rev-parse", "--verify", "--quiet", f"refs/remotes/origin/{name}"], root):
        return f"origin/{name}"
    return name


def current_branch(root: Path) -> str | None:
    result = git(["symbolic-ref", "--quiet", "--short", "HEAD"], root)
    return result.stdout.strip() if result.returncode == 0 else None


def is_ancestor(root: Path, older: str, newer: str) -> bool:
    return ok(["merge-base", "--is-ancestor", older, newer], root)


def dirty_paths(root: Path) -> list[str]:
    # Not out(): stripping the output would eat the first line's status column.
    lines = git(["status", "--porcelain", "--untracked-files=all"], root, check=True).stdout.splitlines()
    return [line[3:] for line in lines if line.strip()]


MAX_REFS = 2000


def branch_refs(root: Path) -> list[str]:
    """Local branches and origin's branches, for searching rounds (newest first)."""
    refs = out(
        ["for-each-ref", "--sort=-committerdate", "--format=%(refname:short)",
         "refs/heads", "refs/remotes/origin"], root
    ).splitlines()
    refs = [r for r in refs if r and r not in ("origin", "origin/HEAD")]
    if len(refs) > MAX_REFS:
        print(f"note: {len(refs)} branches; only the newest {MAX_REFS} were searched -- delete merged branches")
    return refs[:MAX_REFS]


def tree_files(root: Path, ref: str, path: str) -> dict[str, str]:
    """Map of file path -> blob id under ``path`` at ``ref``."""
    result = git(["ls-tree", "-r", ref, "--", path], root)
    files = {}
    for line in result.stdout.splitlines():
        meta, _, name = line.partition("\t")
        parts = meta.split()
        if len(parts) == 3 and parts[1] == "blob":
            files[name] = parts[2]
    return files


def show(root: Path, ref: str, path: str) -> str | None:
    result = git(["show", f"{ref}:{path}"], root)
    return result.stdout if result.returncode == 0 else None


# --------------------------------------------------------------------------
# names and reports


def check_round(value: str) -> str:
    if not ROUND_ID.match(value) or ".." in value:
        raise FwError(
            f"round id {value!r} must start with a letter or digit and use only "
            "letters, digits, '.', '_' or '-' (at most 80 characters)"
        )
    return value


def check_role(value: str) -> str:
    if not ROLE_NAME.match(value) or value in WINDOWS_RESERVED:
        raise FwError(
            f"role {value!r} must be lower-case letters, digits, '-' or '_', "
            "starting with a letter"
        )
    return value


def report_path(round_id: str, role: str) -> str:
    return f"{ROUNDS}/{round_id}/{role}.md"


def sections_for(role: str) -> tuple[str, ...]:
    return REPORT_SECTIONS.get(role, DEFAULT_SECTIONS)


def parse_header(text: str) -> dict[str, str] | None:
    stripped = text.lstrip("\ufeff")
    if not stripped.startswith(HEADER_START):
        return None
    end = stripped.find(HEADER_END)
    if end < 0:
        return None
    fields = {}
    for line in stripped[len(HEADER_START):end].splitlines():
        key, sep, value = line.partition(":")
        if sep:
            fields[key.strip()] = value.strip()
    return fields


def strip_header(text: str) -> str:
    stripped = text.lstrip("\ufeff")
    if stripped.startswith(HEADER_START):
        end = stripped.find(HEADER_END)
        if end >= 0:
            return stripped[end + len(HEADER_END):].lstrip("\r\n")
    return stripped


def missing_sections(body: str, role: str) -> list[str]:
    """Required ``## `` sections that are absent or empty."""
    found: dict[str, list[str]] = {}
    current = None
    for line in body.splitlines():
        if line.startswith("## "):
            current = line[3:].strip().rstrip(":").lower()
            found.setdefault(current, [])
        elif current is not None and line.strip():
            found[current].append(line)
    return [name for name in sections_for(role) if not found.get(name.lower())]


def describe_os() -> str:
    system = platform.system() or "unknown"
    if system == "Darwin":
        return f"macOS {platform.mac_ver()[0]}".strip()
    if system == "Linux":
        try:
            info = platform.freedesktop_os_release()  # Python 3.10+
            return info.get("PRETTY_NAME", "Linux")
        except (AttributeError, OSError):
            return "Linux"
    return f"{system} {platform.release()}".strip()


def python_hint() -> str:
    return "py -3 tools/fw.py" if os.name == "nt" else "python3 tools/fw.py"


# --------------------------------------------------------------------------
# report


def cmd_report(root: Path, role: str, round_id: str, push: bool) -> int:
    check_role(role)
    check_round(round_id)
    rel = report_path(round_id, role)
    path = root / rel
    if not path.is_file():
        raise FwError(
            f"write your report to {rel} first (sections: "
            f"{', '.join('## ' + s for s in sections_for(role))}), then run this again"
        )
    branch = current_branch(root)
    if branch is None:
        raise FwError("HEAD is detached; switch to your own branch before reporting")
    if branch == default_branch(root):
        raise FwError(f"you are on {branch}; reports are committed on your own branch, never on the default branch")
    others = [p for p in dirty_paths(root) if p.replace("\\", "/") != rel]
    if others:
        raise FwError(
            "commit (or discard) your other changes first -- the report must "
            "describe committed work. Uncommitted: " + ", ".join(others[:10])
        )
    body = strip_header(path.read_text(encoding="utf-8"))
    missing = missing_sections(body, role)
    if missing:
        raise FwError(
            f"{rel} is missing (or has empty) sections: "
            + ", ".join("## " + m for m in missing)
            + ". Write 'None.' in a section that genuinely has nothing."
        )
    head = out(["rev-parse", "HEAD"], root)
    stamp = datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")  # noqa: UP017 -- datetime.UTC needs 3.11
    header = "\n".join([
        HEADER_START,
        f"round: {round_id}",
        f"role: {role}",
        f"branch: {branch}",
        f"head: {head}",
        f"os: {describe_os()}",
        f"python: {platform.python_version()}",
        f"written: {stamp}",
        HEADER_END,
        "",
    ])
    path.write_bytes((header + body.replace("\r\n", "\n")).encode("utf-8"))
    git(["add", "--", rel], root, check=True)
    commit = git(["commit", "--quiet", "-m", f"Report for round {round_id} ({role})", "--", rel], root)
    if commit.returncode != 0:
        raise FwError(f"could not commit {rel}: {commit.stderr.strip() or commit.stdout.strip()}")
    sha = out(["rev-parse", "HEAD"], root)
    print(f"report committed: {rel} at {sha[:12]}; it describes {head[:12]} on {branch}")
    if push:
        if not has_origin(root):
            raise FwError("no 'origin' remote to push to; the report is committed locally")
        pushed = git(["push", "--quiet", "-u", "origin", branch], root, timeout=120)
        if pushed.returncode != 0:
            raise FwError(
                "the report is committed locally but NOT pushed: "
                + (pushed.stderr.strip() or "push failed")
            )
        print(f"pushed {branch} to origin")
    else:
        print("not pushed yet: push your branch so the round can continue from any machine")
    return 0


# --------------------------------------------------------------------------
# delivery


def round_files(root: Path, ref: str, round_id: str) -> dict[str, str]:
    return tree_files(root, ref, f"{ROUNDS}/{round_id}")


def evaluate_branch(root: Path, ref: str, round_id: str) -> dict:
    """Check every report for ``round_id`` on ``ref``.

    A report is valid when its header names this round and its own role, the
    commit it describes is an ancestor of the branch tip, and nothing but this
    round's own folder changed after that commit. Otherwise the branch moved on
    after the report and the report no longer describes it.
    """
    tip = out(["rev-parse", ref], root)
    prefix = f"{ROUNDS}/{round_id}/"
    result = {"ref": ref, "tip": tip, "reports": {}, "problems": []}
    for path in sorted(round_files(root, ref, round_id)):
        name = path[len(prefix):]
        if "/" in name or not name.endswith(".md") or name in ("brief.md", "README.md"):
            continue
        role = name[:-3]
        text = show(root, ref, path) or ""
        header = parse_header(text)
        if header is None:
            result["problems"].append(f"{path} has no fw.py stamp; the {role} must run fw.py report")
            continue
        head = header.get("head", "")
        if header.get("round") != round_id or header.get("role") != role:
            result["problems"].append(
                f"{path} is stamped for round {header.get('round')!r}, role {header.get('role')!r}; "
                f"the {role} must rewrite it for round {round_id}"
            )
            continue
        if not head or not ok(["cat-file", "-e", f"{head}^{{commit}}"], root) or not is_ancestor(root, head, tip):
            result["problems"].append(f"{path} describes {head[:12] or '?'}, which is not part of {ref}")
            continue
        # Only other seats' reports may change after a report; a changed brief
        # changes what the report was judged against.
        changed = [
            p for p in out(["diff", "--name-only", head, tip], root).splitlines()
            if p and not (p.startswith(prefix) and p not in (prefix + "brief.md", prefix + "README.md"))
        ]
        if changed:
            result["problems"].append(
                f"{ref} changed after the {role} report ({', '.join(changed[:5])}); "
                f"the report describes an older commit, so the {role} must rewrite it"
            )
            continue
        result["reports"][role] = header
    return result


def find_round_branches(root: Path, round_id: str) -> list[str]:
    """Branches carrying report files for ``round_id`` that the default branch lacks."""
    base = base_ref(root)
    base_files = round_files(root, base, round_id)
    found = []
    for ref in branch_refs(root):
        files = round_files(root, ref, round_id)
        extra = {
            p for p, blob in files.items()
            if base_files.get(p) != blob and not p.endswith(("/brief.md", "/README.md"))
        }
        if extra:
            found.append(ref)
    # prefer the remote copy when a local branch is identical to it
    tips = {}
    for ref in found:
        tips.setdefault(out(["rev-parse", ref], root), []).append(ref)
    unique = []
    for refs in tips.values():
        remote = [r for r in refs if r.startswith("origin/")]
        unique.append((remote or refs)[0])
    return sorted(unique)


def newest_only(root: Path, refs: list[str]) -> list[str]:
    """Drop refs whose tip is already contained in another ref's tip."""
    tips = {ref: out(["rev-parse", ref], root) for ref in refs}
    keep = []
    for ref in refs:
        if not any(
            other != ref and tips[other] != tips[ref] and is_ancestor(root, tips[ref], tips[other])
            for other in refs
        ):
            keep.append(ref)
    return keep


def flag_outdated_reviews(root: Path, evaluated: list[dict]) -> None:
    """A review is outdated when newer executor work for the round exists elsewhere."""
    for entry in evaluated:
        review = entry["reports"].get("verifier")
        if not review:
            continue
        for other in evaluated:
            for role, header in other["reports"].items():
                if role == "verifier" or other is entry:
                    continue
                if not is_ancestor(root, header.get("head", ""), review.get("head", "")):
                    entry["problems"].append(
                        f"newer {role} work is on {other['ref']} ({header.get('head', '')[:12]}); "
                        "this review is of an older commit"
                    )


def cmd_delivery(root: Path, round_id: str, branch: str | None, *, quiet_fetch: bool = False) -> int:
    check_round(round_id)
    warning = fetch(root)
    if warning and not quiet_fetch:
        print(f"note: {warning}")
    candidates = [branch] if branch else newest_only(root, find_round_branches(root, round_id))
    if branch and not ok(["rev-parse", "--verify", "--quiet", branch], root):
        remote = f"origin/{branch}"
        if ok(["rev-parse", "--verify", "--quiet", remote], root):
            candidates = [remote]
        else:
            print(f"not delivered yet: no branch {branch!r} here or on origin")
            return 1
    if not candidates:
        merged = round_files(root, base_ref(root), round_id)
        if any(not p.endswith(("/brief.md", "/README.md")) for p in merged):
            print(f"round {round_id} is already merged into {base_ref(root)}")
            return 0
        print(f"not delivered yet: no branch carries a report for round {round_id}")
        return 1
    evaluated = [evaluate_branch(root, ref, round_id) for ref in candidates]
    flag_outdated_reviews(root, evaluated)
    evaluated.sort(key=lambda e: (len(e["reports"]), -len(e["problems"])), reverse=True)
    for entry in evaluated:
        state = "delivered" if entry["reports"] and not entry["problems"] else "NOT delivered"
        print(f"{entry['ref']} ({entry['tip'][:12]}): {state}")
        for role, header in sorted(entry["reports"].items()):
            print(
                f"  {role}: report describes {header.get('head', '')[:12]} "
                f"(written {header.get('written', '?')} on {header.get('os', '?')})"
            )
        for problem in entry["problems"]:
            print(f"  problem: {problem}")
    best = evaluated[0]
    if best["reports"] and not best["problems"]:
        if len(evaluated) > 1:
            print(f"most complete: {best['ref']}")
        return 0
    return 1


# --------------------------------------------------------------------------
# start


def locate_brief(root: Path, round_id: str) -> str | None:
    """The commit holding this round's brief: HEAD, brain/<id>, or any branch."""
    path = f"{ROUNDS}/{round_id}/brief.md"
    candidates = ["HEAD", f"origin/brain/{round_id}", f"brain/{round_id}", base_ref(root)]
    candidates += [r for r in branch_refs(root) if r not in candidates]
    for ref in candidates:
        if ok(["rev-parse", "--verify", "--quiet", ref], root) and show(root, ref, path) is not None:
            return ref
    return None


def resume_point(root: Path, role: str, round_id: str) -> tuple[str, str]:
    """Where an executor starts: its own earlier pushed work, or else the brief.

    Earlier work is a branch named <role>/<round>, or any branch carrying this
    role's report for the round, but not a branch another seat has built on.
    """
    base_files = round_files(root, base_ref(root), round_id)
    mine = report_path(round_id, role)
    own = []
    for ref in branch_refs(root):
        files = round_files(root, ref, round_id)
        added = {p for p, blob in files.items() if base_files.get(p) != blob}
        prefix = f"{ROUNDS}/{round_id}/"
        others = {
            p for p in added
            if p.endswith(".md") and "/" not in p[len(prefix):]
            and p not in (mine, prefix + "brief.md", prefix + "README.md")
        }
        named = ref in (f"{role}/{round_id}", f"origin/{role}/{round_id}")
        if (named or mine in added) and not others:
            own.append(ref)
    own = newest_only(root, own)
    tips = {out(["rev-parse", r], root) for r in own}
    if len(tips) > 1:
        raise FwError(
            "more than one branch holds earlier work for this seat and round: "
            + ", ".join(own) + ". Ask Brain which to continue."
        )
    if own:
        remote = [r for r in own if r.startswith("origin/")]
        source = (remote or own)[0]
        print(f"  continuing earlier work from {source}")
        return source, out(["rev-parse", source], root)
    named = f"origin/{role}/{round_id}"
    if ok(["rev-parse", "--verify", "--quiet", named], root):
        print(f"  warning: {named} exists but another seat has built on it, so it was not continued")
    source = locate_brief(root, round_id)
    if source is None:
        raise FwError(
            f"no brief for round {round_id}: expected {ROUNDS}/{round_id}/brief.md "
            f"on brain/{round_id} or the default branch. Ask Brain to push it."
        )
    return source, out(["rev-parse", source], root)


def free_review_branch(root: Path, round_id: str, target: str) -> str:
    """verifier/<round>, or verifier/<round>-2, -3 ... when an earlier review of
    older work already uses the name. A branch that already contains the
    reviewed commit is this review, resumed."""
    name, number = f"verifier/{round_id}", 1
    while True:
        existing = [r for r in (f"origin/{name}", name) if ok(["rev-parse", "--verify", "--quiet", r], root)]
        if not existing or all(is_ancestor(root, target, r) for r in existing):
            return name
        number += 1
        name = f"verifier/{round_id}-{number}"


def cmd_start(root: Path, role: str, round_id: str, review: str | None) -> int:
    check_role(role)
    check_round(round_id)
    if role == "brain":
        return cmd_status(root, offline=False, leaving=False)
    warning = fetch(root)
    if warning:
        print(f"note: {warning}")
    dirty = dirty_paths(root)
    if dirty:
        raise FwError(
            "this checkout has uncommitted changes, so it is not a clean place to "
            "start a seat: " + ", ".join(dirty[:10])
            + ". Start in a fresh clone or checkout, or ask Brain."
        )
    if role == "verifier":
        if review:
            refs = [review] if ok(["rev-parse", "--verify", "--quiet", review], root) else [f"origin/{review}"]
        else:
            # Branches carrying an executor report and no review yet. A branch
            # that already holds a verifier report is an earlier review.
            refs = []
            for ref in find_round_branches(root, round_id):
                reports = evaluate_branch(root, ref, round_id)["reports"]
                if "verifier" not in reports and any(k != "verifier" for k in reports):
                    refs.append(ref)
        if not refs:
            print(f"not delivered yet: no executor report for round {round_id} on any branch")
            return 1
        if len(refs) > 1:
            print("more than one branch carries this round's work; rerun with --review <branch>:")
            for ref in refs:
                print(f"  {ref}")
            return 1
        entry = evaluate_branch(root, refs[0], round_id)
        executor = {k: v for k, v in entry["reports"].items() if k != "verifier"}
        if not executor or entry["problems"]:
            print(f"not delivered yet on {refs[0]}:")
            for problem in entry["problems"]:
                print(f"  {problem}")
            return 1
        target = entry["tip"]
        source = refs[0]
    else:
        source, target = resume_point(root, role, round_id)

    branch = current_branch(root)
    wanted = f"{role}/{round_id}"
    if role == "verifier":
        wanted = free_review_branch(root, round_id, target)
    if branch is None or branch == default_branch(root):
        if ok(["rev-parse", "--verify", "--quiet", f"refs/heads/{wanted}"], root):
            git(["switch", "--quiet", wanted], root, check=True)
        else:
            git(["switch", "--quiet", "-c", wanted, target], root, check=True)
        branch = wanted
    head = out(["rev-parse", "HEAD"], root)
    if head != target:
        if is_ancestor(root, head, target):
            git(["merge", "--quiet", "--ff-only", target], root, check=True)
        elif is_ancestor(root, target, head):
            pass  # this branch already holds the starting point and more
        elif not out(["rev-list", "HEAD", "--not", base_ref(root), target], root):
            # A branch with no work of its own (typically named by the tool,
            # cut from a newer default branch): move it to the starting point.
            git(["reset", "--quiet", "--keep", target], root, check=True)
        else:
            raise FwError(
                f"branch {branch} has commits of its own and has diverged from the round's "
                f"starting point {target[:12]} ({source}). Start from a fresh branch, or ask Brain."
            )
    head = out(["rev-parse", "HEAD"], root)
    print(f"seat ok: {role}, round {round_id}, branch {branch} at {head[:12]}")
    if not branch.startswith(f"{role}/"):
        print(f"  (branch name chosen by your tool rather than {wanted}; that is fine -- your report records it)")
    print(f"  brief: {ROUNDS}/{round_id}/brief.md")
    if role == "verifier":
        executor_reports = ", ".join(
            report_path(round_id, r) for r in evaluate_branch(root, "HEAD", round_id)["reports"] if r != "verifier"
        )
        print(f"  reviewing exactly {target} from {source}")
        print(f"  do not open {executor_reports} until your first pass is finished")
    print(f"  finish with: write {report_path(round_id, role)}, then {python_hint()} report --role {role} --round {round_id} --push")
    return 0


# --------------------------------------------------------------------------
# status


def sha256_file(path: Path) -> str:
    data = path.read_bytes().replace(b"\r\n", b"\n")
    return hashlib.sha256(data).hexdigest()


def load_manifest(root: Path) -> dict | None:
    path = root / MANIFEST
    if not path.is_file():
        return None
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except (OSError, ValueError) as exc:
        raise FwError(f"{MANIFEST} is unreadable: {exc}") from exc


def version_tuple(text: str) -> tuple[int, ...] | None:
    match = re.match(r"^v?(\d+)\.(\d+)\.(\d+)$", text.strip())
    return tuple(int(x) for x in match.groups()) if match else None


def latest_release(repository: str) -> tuple[str | None, str | None]:
    result = git(["ls-remote", "--tags", "--refs", repository], Path.cwd(), timeout=30)
    if result.returncode != 0:
        return None, (result.stderr.strip().splitlines() or ["unreachable"])[-1]
    versions = []
    for line in result.stdout.splitlines():
        tag = line.rpartition("refs/tags/")[2]
        parsed = version_tuple(tag)
        if parsed:
            versions.append((parsed, tag.lstrip("v")))
    if not versions:
        return None, "no release tags found"
    return max(versions)[1], None


def framework_lines(root: Path, offline: bool) -> list[str]:
    manifest = load_manifest(root)
    if manifest is None:
        if (root / "VERSION").is_file() and (root / "framework" / "FRAMEWORK.md").is_file():
            version = (root / "VERSION").read_text(encoding="utf-8").strip()
            return [f"this is the framework repository itself, at release {version}"]
        if (root / "docs/agents/CONSTITUTION.md").is_file():
            return [
                "2.x framework layout with no manifest: this project predates release 3.0.0.",
                "Plan an update round (the framework's CHANGELOG, release 3.0.0, says how).",
            ]
        return ["no framework manifest (docs/agents/framework.json) -- not adopted, or damaged"]
    info = manifest.get("framework", {})
    pinned = info.get("release", "?")
    repository = info.get("repository", "")
    lines = [f"pinned to agentic-framework {pinned} ({repository or 'repository unknown'})"]
    if offline or not repository:
        lines.append("newer releases: not checked")
    else:
        latest, problem = latest_release(repository)
        if latest is None:
            lines.append(f"newer releases: unknown ({problem}) -- carry on")
        else:
            here, there = version_tuple(pinned), version_tuple(latest)
            if here and there and there > here:
                kind = "major (contracts changed: update before the next round)" if there[0] > here[0] else "minor/patch (update when convenient)"
                lines.append(f"newer release available: {latest} -- {kind}")
            else:
                lines.append(f"up to date with the latest release ({latest})")
    edited = []
    for rel, entry in sorted(manifest.get("files", {}).items()):
        if entry.get("kind") != "copy":
            continue
        path = root / rel
        if not path.is_file():
            edited.append(f"{rel} (missing)")
        elif sha256_file(path) != entry.get("sha256"):
            edited.append(rel)
    if edited:
        lines.append("framework files changed locally (project rules belong in AGENTS.md): " + ", ".join(edited))
    return lines


def merge_rule(root: Path) -> str | None:
    path = root / "AGENTS.md"
    if not path.is_file():
        return None
    match = re.search(r"^\**Merge rule:?\**:?\s*`?([a-z-]+)`?", path.read_text(encoding="utf-8"), re.M)
    return match.group(1) if match else None


def rounds_lines(root: Path) -> list[str]:
    base = base_ref(root)
    on_base = {p.split("/")[2] for p in tree_files(root, base, ROUNDS) if p.count("/") >= 3}
    flight: dict[str, dict[str, list[str]]] = {}
    base_files = tree_files(root, base, ROUNDS)
    for ref in branch_refs(root):
        if ref in (base, default_branch(root)):
            continue
        for path, blob in tree_files(root, ref, ROUNDS).items():
            parts = path.split("/")
            if len(parts) != 4 or base_files.get(path) == blob:
                continue
            flight.setdefault(parts[2], {}).setdefault(parts[3][:-3], []).append(ref)
    lines = []
    for round_id in sorted(flight):
        pieces = []
        for name, refs in sorted(flight[round_id].items()):
            shown = sorted(set(refs), key=lambda r: (not r.startswith("origin/"), r))
            pieces.append(f"{name} on {shown[0]}" + (f" (+{len(shown) - 1} more)" if len(shown) > 1 else ""))
        lines.append(f"in flight: {round_id} -- " + "; ".join(pieces))
    if not lines:
        lines.append("nothing in flight")
    if on_base:
        lines.append(f"{len(on_base)} round(s) merged under {ROUNDS}/, latest by name: {sorted(on_base)[-1]}")
    legacy = root / "docs/briefs/active.md"
    if legacy.is_file():
        match = re.search(r"Brief-ID:\s*(\S+)", legacy.read_text(encoding="utf-8"))
        lines.append(
            "legacy docs/briefs/active.md present"
            + (f" (Brief-ID {match.group(1)})" if match else "")
            + " -- from before release 3.0.0; new rounds use docs/rounds/"
        )
    return lines


def machine_lines(root: Path) -> tuple[list[str], bool]:
    lines, safe = [], True
    branch = current_branch(root) or "(detached HEAD)"
    dirty = dirty_paths(root)
    lines.append(f"on {branch}; " + (f"{len(dirty)} uncommitted change(s)" if dirty else "no uncommitted changes"))
    if dirty:
        safe = False
    stashes = out(["stash", "list"], root).splitlines()
    if stashes:
        safe = False
        lines.append(f"{len(stashes)} stash(es) exist only on this machine")
    unpushed = []
    if has_origin(root):
        refs = out(["for-each-ref", "--format=%(refname)", "refs/"], root).splitlines()
        refs = [r for r in refs if not r.startswith(("refs/remotes/", "refs/stash"))]
        if current_branch(root) is None:
            refs.append("HEAD")
        for ref in refs:
            count = out(["rev-list", "--count", ref, "--not", "--remotes=origin"], root)
            if count and count != "0":
                label = ref.replace("refs/heads/", "").replace("refs/tags/", "tag ") if ref != "HEAD" else "the detached HEAD"
                unpushed.append(f"{label} ({count} commit(s))")
        for line in git(["submodule", "status", "--recursive"], root).stdout.splitlines():
            parts = line[1:].split()
            if line[:1] not in ("-", "") and len(parts) > 1 and (root / parts[1]).is_dir():
                sub = root / parts[1]
                count = git(["rev-list", "--count", "HEAD", "--not", "--remotes"], sub).stdout.strip()
                if count and count != "0":
                    unpushed.append(f"submodule {parts[1]} ({count} commit(s))")
    else:
        lines.append("no 'origin' remote: nothing here is backed up anywhere else")
        safe = False
    if unpushed:
        safe = False
        lines.append("not on GitHub yet: " + ", ".join(unpushed))
    for block in out(["worktree", "list", "--porcelain"], root).split("\n\n")[1:]:
        path = block.splitlines()[0].replace("worktree ", "", 1) if block.strip() else ""
        if path and Path(path).is_dir() and dirty_paths(Path(path)):
            safe = False
            lines.append(f"uncommitted changes in linked checkout {path}")
    missing = [
        line.split()[1] for line in git(["submodule", "status"], root).stdout.splitlines()
        if line.startswith("-") and len(line.split()) > 1
    ]
    if missing:
        lines.append(
            "submodule(s) not initialised here: " + ", ".join(missing)
            + " -- run: git submodule update --init (a search here would wrongly find those files missing)"
        )
    lines.append("safe to leave this machine: " + ("yes" if safe else "NO -- push or deal with the items above first"))
    return lines, safe


def cmd_status(root: Path, *, offline: bool, leaving: bool) -> int:
    warning = None if offline else fetch(root)
    print("Framework")
    for line in framework_lines(root, offline):
        print(f"  {line}")
    rule = merge_rule(root)
    print("Merge rule")
    print(f"  {rule or 'not declared in AGENTS.md (the framework default is owner-approves)'}")
    print("Rounds")
    if warning:
        print(f"  note: {warning}")
    for line in rounds_lines(root):
        print(f"  {line}")
    print("This machine")
    lines, safe = machine_lines(root)
    for line in lines:
        print(f"  {line}")
    findings = check_project(root)
    print("Checks")
    if not findings:
        print("  all project checks pass")
    for level, message in findings:
        print(f"  {level}: {message}")
    print(f"Command form on this machine: {python_hint()} <command>")
    return 1 if (leaving and not safe) else 0


# --------------------------------------------------------------------------
# check

PERSONAL = [
    (re.compile(r"(?<![A-Za-z0-9%])[A-Za-z]:(?:\\{1,2}|/)(?:Users|Documents and Settings)(?:\\{1,2}|/)", re.I), "a Windows user folder"),
    (re.compile(r"/Users/(?!<)[A-Za-z0-9._-]+/"), "a macOS home folder"),
    (re.compile(r"/home/(?!<|runner/|user/)[A-Za-z0-9._-]+/"), "a Linux home folder"),
    (re.compile(r"(?<![A-Za-z0-9%/])[D-Zd-z]:(?:\\{1,2}|/)[A-Za-z]"), "a Windows drive path"),
    (re.compile(r"/mnt/[a-z]/Users/", re.I), "a WSL Windows user folder"),
    (re.compile(r"~/Library/CloudStorage/"), "a synced-drive folder"),
    (re.compile(r"(?<![A-Za-z0-9._%+-])(?!git@|no-?reply@)[A-Za-z0-9._%+-]+@(?!users\.noreply\.github\.com|example\.(?:com|org|net)\b)[A-Za-z0-9-]+\.[A-Za-z]{2,}", re.I), "an email address"),
]
SHA40 = re.compile(r"\b[0-9a-f]{40}\b")


def words(text: str) -> int:
    return len(text.split())


def _live_docs(root: Path) -> list[Path]:
    docs = [root / name for name in ("AGENTS.md", "CLAUDE.md", "GEMINI.md", STATE_DOC)]
    docs += sorted((root / "docs/agents").rglob("*.md")) if (root / "docs/agents").is_dir() else []
    docs += sorted((root / ROUNDS).glob("*/*.md")) if (root / ROUNDS).is_dir() else []
    return [p for p in docs if p.is_file()]


def check_project(root: Path) -> list[tuple[str, str]]:
    """Hygiene checks for an adopted project. Returns (level, message) pairs.

    Each check exists because the failure it catches happened in a real
    project: a state document that grew into a second database, instructions
    one AI tool never loads, personal paths in public repositories.
    """
    findings: list[tuple[str, str]] = []
    manifest = None
    try:
        manifest = load_manifest(root)
    except FwError as exc:
        findings.append(("error", str(exc)))
    settings = (manifest or {}).get("settings", {})

    state = root / STATE_DOC
    if state.is_file():
        text = state.read_text(encoding="utf-8")
        budget = int(settings.get("state_words", DEFAULT_STATE_WORDS))
        if words(text) > budget:
            findings.append((
                "error",
                f"{STATE_DOC} is {words(text)} words; its budget is {budget}. Keep decisions, "
                "move history into docs/rounds/ or a dedicated document",
            ))
        outside = re.sub(r"(?ms)^## Historical anchors\s*$.*?(?=^## |\Z)", "", text)
        if SHA40.search(outside):
            findings.append((
                "error",
                f"{STATE_DOC} stores a full commit id outside '## Historical anchors'. "
                "Live state is derived with fw.py status, never stored",
            ))

    for name in ("CLAUDE.md", "GEMINI.md"):
        path = root / name
        if path.is_file() and "AGENTS.md" not in path.read_text(encoding="utf-8"):
            findings.append((
                "error",
                f"{name} does not point at AGENTS.md, so sessions that load only {name} "
                "never see the project's rules. Make it a pointer: '@AGENTS.md'",
            ))

    agents = root / "AGENTS.md"
    if agents.is_file():
        text = agents.read_text(encoding="utf-8")
        rule = merge_rule(root)
        if rule is None:
            findings.append(("warning", "AGENTS.md has no 'Merge rule:' line (owner-approves or brain-merges)"))
        elif rule not in MERGE_RULES:
            findings.append(("error", f"AGENTS.md merge rule {rule!r} is not one of {', '.join(MERGE_RULES)}"))
        if words(text) > AGENTS_WORDS_WARNING:
            findings.append(("warning", f"AGENTS.md is {words(text)} words; every session reads it, aim for under {AGENTS_WORDS_WARNING}"))
    elif manifest is not None:
        findings.append(("error", "AGENTS.md is missing"))

    for path in _live_docs(root):
        rel = path.relative_to(root).as_posix()
        for number, line in enumerate(path.read_text(encoding="utf-8", errors="replace").splitlines(), 1):
            for pattern, what in PERSONAL:
                if pattern.search(line):
                    findings.append(("error", f"{rel}:{number} contains {what}; tracked documents must work on every machine and are public"))
                    break

    attributes = root / ".gitattributes"
    if manifest is not None and (not attributes.is_file() or "eol=lf" not in attributes.read_text(encoding="utf-8")):
        findings.append(("warning", ".gitattributes lacks '* text=auto eol=lf'; scripts may break when checked out on Windows"))
    for rel in ("tools/fw.py", ".githooks/pre-push"):
        path = root / rel
        if path.is_file() and b"\r\n" in path.read_bytes():
            findings.append(("warning", f"{rel} has Windows line endings; run: git add --renormalize . && git status"))
    return findings


def cmd_check(root: Path) -> int:
    findings = check_project(root)
    for level, message in findings:
        print(f"{level}: {message}")
    errors = sum(1 for level, _ in findings if level == "error")
    print(f"{errors} error(s), {len(findings) - errors} warning(s)")
    return 1 if errors else 0


# --------------------------------------------------------------------------


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(prog="fw.py", description=__doc__.split("\n\n")[0])
    parser.add_argument("--cwd", default=None, help="run against this checkout instead of the current directory")
    sub = parser.add_subparsers(dest="command", required=True)

    p = sub.add_parser("status", help="where things stand")
    p.add_argument("--offline", action="store_true", help="do not contact origin or the framework repository")
    p.add_argument("--leaving", action="store_true", help="exit 1 unless this machine is safe to leave")

    p = sub.add_parser("start", help="first command of a Worker or Verifier session")
    p.add_argument("--role", required=True)
    p.add_argument("--round", required=True)
    p.add_argument("--review", default=None, help="Verifier: the branch to review, if more than one carries the round")

    p = sub.add_parser("report", help="stamp and commit docs/rounds/ID/ROLE.md")
    p.add_argument("--role", required=True)
    p.add_argument("--round", required=True)
    p.add_argument("--push", action="store_true", help="also push the branch")

    p = sub.add_parser("delivery", help="is a round delivered, and where")
    p.add_argument("--round", required=True)
    p.add_argument("--branch", default=None)

    sub.add_parser("check", help="project hygiene checks")

    args = parser.parse_args(argv)
    try:
        root = repo_root(Path(args.cwd or os.getcwd()).resolve())
        if args.command == "status":
            return cmd_status(root, offline=args.offline, leaving=args.leaving)
        if args.command == "start":
            return cmd_start(root, args.role, args.round, args.review)
        if args.command == "report":
            return cmd_report(root, args.role, args.round, args.push)
        if args.command == "delivery":
            return cmd_delivery(root, args.round, args.branch)
        return cmd_check(root)
    except FwError as exc:
        print(f"fw: {exc}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    sys.exit(main())
