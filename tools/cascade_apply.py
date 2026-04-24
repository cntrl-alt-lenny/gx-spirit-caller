#!/usr/bin/env python3

"""
cascade_apply.py — apply a batch of renames from a cascade decisions
file, atomically, with a commit-message / PR-body template emitted
for the result.

Complements two existing tools:

  - `tools/bulk_rename_candidates.py` (#153) produces the scouting
    JSON: "here are the sibling candidates of this named anchor."
  - `tools/rename_symbol.py` applies ONE rename at a time with full
    safety checks.

Gap: for a cascade wave like #165 (4 renames) or a future wave of
10+ siblings, running rename_symbol.py N times is tedious, error-
prone on dry-runs, and produces no audit trail beyond git history.

This tool consumes a decisions file like:

    {
      "brief": "016",
      "anchor": "Task_InvokeLocked",
      "source_scouting": "docs/research/cascade-3-scouting.md",
      "renames": [
        {
          "module": "main",
          "addr": "0x020067fc",
          "old": "func_020067fc",
          "new": "Task_Post",
          "rationale": "0.25 jaccard / 36 shared callers / size 0x74"
        },
        ...
      ]
    }

…validates every rename can apply (old name resolves, new name not
already taken, ident valid), then applies them in sequence. If ANY
validation fails, NOTHING is written (atomic semantics — no
half-applied state requiring manual rollback).

Emits a commit-message + PR-body template to stdout. The decomper
copies that into `git commit -m "$(cat template.md)"`.

Usage:

    # Dry-run first (default) — shows the plan without writing.
    python tools/cascade_apply.py cascades/brief-016.json

    # Apply the renames.
    python tools/cascade_apply.py cascades/brief-016.json --confirm

    # Limit to a single version (rare; default scans all of config/).
    python tools/cascade_apply.py cascades/brief-016.json --version eur

Exit codes:
  0 — applied (or --dry would have applied) cleanly
  1 — validation error (collision / missing / invalid ident)
  2 — usage / I/O error
"""

from __future__ import annotations

import argparse
import json
import sys
from dataclasses import dataclass
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from rename_symbol import (  # noqa: E402
    CONFIG,
    IDENT_RE,
    find_symbol,
    rewrite_first_token,
)


@dataclass(frozen=True)
class Rename:
    module: str
    addr: int
    old: str
    new: str
    rationale: str

    @classmethod
    def from_json(cls, d: dict) -> Rename:
        addr_raw = d.get("addr", "")
        if isinstance(addr_raw, str):
            addr = int(addr_raw, 0)
        elif isinstance(addr_raw, int):
            addr = addr_raw
        else:
            raise ValueError(f"bad addr type in {d!r}: {type(addr_raw)}")
        return cls(
            module=d.get("module", ""),
            addr=addr,
            old=d.get("old", ""),
            new=d.get("new", ""),
            rationale=d.get("rationale", ""),
        )


@dataclass(frozen=True)
class Decisions:
    brief: str
    anchor: str
    source_scouting: str
    renames: tuple[Rename, ...]

    @classmethod
    def from_json(cls, d: dict) -> Decisions:
        return cls(
            brief=str(d.get("brief", "")),
            anchor=str(d.get("anchor", "")),
            source_scouting=str(d.get("source_scouting", "")),
            renames=tuple(
                Rename.from_json(r) for r in d.get("renames", [])
            ),
        )


@dataclass(frozen=True)
class ValidationError:
    rename: Rename
    reason: str


def validate(
    decisions: Decisions,
    version: str | None,
) -> list[ValidationError]:
    """Return [] if the whole batch can apply, else a list of
    problems. Atomic semantics: callers abort if this returns
    anything non-empty.

    Checks per rename:
      - new name is a valid C identifier
      - old name exists in exactly one symbols.txt line
      - new name is NOT already used anywhere in config/
      - old name isn't already the target of another rename in the
        same batch (catches typos where the decisions file lists
        the same old-name twice)
      - new name isn't used by another rename in the same batch
        (same dedupe — prevents accidental two-to-one collisions)
    """
    errors: list[ValidationError] = []
    old_seen: set[str] = set()
    new_seen: set[str] = set()
    for r in decisions.renames:
        # Structural validation first.
        if not r.module:
            errors.append(ValidationError(
                r, "missing `module` field",
            ))
            continue
        if not r.old:
            errors.append(ValidationError(r, "missing `old` field"))
            continue
        if not r.new:
            errors.append(ValidationError(r, "missing `new` field"))
            continue
        if not IDENT_RE.match(r.new):
            errors.append(ValidationError(
                r, f"`new` name {r.new!r} is not a valid C identifier",
            ))
            continue
        # Batch-local collision checks.
        if r.old in old_seen:
            errors.append(ValidationError(
                r, f"`old` {r.old!r} referenced twice in this batch",
            ))
            continue
        old_seen.add(r.old)
        if r.new in new_seen:
            errors.append(ValidationError(
                r, f"`new` {r.new!r} used by two renames in this batch",
            ))
            continue
        new_seen.add(r.new)

        # Lookup old name in config/.
        old_hits = find_symbol(r.old, version)
        if len(old_hits) == 0:
            errors.append(ValidationError(
                r, f"`old` {r.old!r} not found in any symbols.txt",
            ))
            continue
        if len(old_hits) > 1:
            errors.append(ValidationError(
                r,
                f"`old` {r.old!r} appears in {len(old_hits)} "
                "symbols.txt files (ambiguous)",
            ))
            continue

        # Lookup new name to detect existing-name collisions. The
        # newly-renamed symbol will also match itself during the
        # batch simulation, but since the actual rename hasn't
        # happened yet, find_symbol returns only the pre-existing
        # collisions. A non-zero count = genuine conflict.
        new_hits = find_symbol(r.new, version)
        if new_hits:
            errors.append(ValidationError(
                r,
                f"`new` {r.new!r} already exists in config "
                f"({len(new_hits)} collision(s))",
            ))
            continue
    return errors


def apply(
    decisions: Decisions,
    version: str | None,
) -> list[tuple[Rename, Path, int]]:
    """Apply every rename. Returns (rename, path, line_no) for each
    so callers can render a summary. Assumes validation already
    passed — re-does the find_symbol lookup defensively but trusts
    there's exactly one hit."""
    applied: list[tuple[Rename, Path, int]] = []
    for r in decisions.renames:
        hits = find_symbol(r.old, version)
        assert len(hits) == 1, (
            f"post-validation invariant broken: {r.old} has "
            f"{len(hits)} hits, expected 1"
        )
        path, line_no = hits[0]
        rewrite_first_token(path, line_no, r.old, r.new)
        applied.append((r, path, line_no))
    return applied


def render_commit_template(decisions: Decisions) -> str:
    """Produce a commit-message + PR-body ready for `git commit -m
    "$(...)"`. Shape matches the cascade-wave precedent (PR #165 +
    #178)."""
    lines: list[str] = []
    lines.append(
        f"cascade wave (brief {decisions.brief}): {len(decisions.renames)} "
        f"renames around `{decisions.anchor}`",
    )
    lines.append("")
    lines.append(
        f"Anchor: `{decisions.anchor}`. Source: "
        f"`{decisions.source_scouting}`."
    )
    lines.append("")
    lines.append("## Renames")
    lines.append("")
    lines.append(
        "| Module | Addr | Old | New | Rationale |",
    )
    lines.append(
        "|--------|------|-----|-----|-----------|",
    )
    for r in decisions.renames:
        lines.append(
            f"| `{r.module}` | `0x{r.addr:08x}` | `{r.old}` | "
            f"`{r.new}` | {r.rationale or '—'} |",
        )
    lines.append("")
    lines.append("## Test plan")
    lines.append("")
    lines.append("- [ ] `./dsd check modules` — baseline preserved")
    lines.append(
        "- [ ] `python tools/check_match_invariants.py --version eur` — "
        "0 errors (clean cross-file drift)",
    )
    lines.append(
        "- [ ] `python tools/find_cascades.py --version eur` — "
        "measure downstream `hard → medium` promotions from this wave",
    )
    lines.append("- [ ] `ninja rom` clean")
    lines.append("")
    return "\n".join(lines)


def _load_decisions(path: Path) -> Decisions:
    try:
        raw = path.read_text(encoding="utf-8")
    except OSError as e:
        raise SystemExit(f"error: could not read {path}: {e}") from e
    try:
        data = json.loads(raw)
    except json.JSONDecodeError as e:
        raise SystemExit(
            f"error: {path} is not valid JSON: {e}",
        ) from e
    if not isinstance(data, dict):
        raise SystemExit(f"error: {path} must be a JSON object")
    try:
        return Decisions.from_json(data)
    except (ValueError, KeyError) as e:
        raise SystemExit(f"error: invalid decisions file: {e}") from e


def _print_validation_errors(errors: list[ValidationError]) -> None:
    print(
        f"❌ Validation failed: {len(errors)} problem(s). "
        "No files written.",
        file=sys.stderr,
    )
    for e in errors:
        r = e.rename
        print(
            f"  [{r.module}|0x{r.addr:08x}] "
            f"{r.old!r} → {r.new!r}: {e.reason}",
            file=sys.stderr,
        )


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Apply a batch of cascade renames atomically.",
    )
    ap.add_argument(
        "decisions", type=Path,
        help="Path to the cascade decisions JSON file.",
    )
    ap.add_argument(
        "--version", default=None,
        help="Limit search to config/<version>/ (e.g. eur). "
             "Default: scan all of config/.",
    )
    ap.add_argument(
        "--confirm", action="store_true",
        help="Actually apply the renames. Default is dry-run.",
    )
    args = ap.parse_args()

    if not args.decisions.is_file():
        print(
            f"error: decisions file {args.decisions} not found.",
            file=sys.stderr,
        )
        return 2

    decisions = _load_decisions(args.decisions)
    if not decisions.renames:
        print("error: decisions file has no renames.", file=sys.stderr)
        return 2

    errors = validate(decisions, args.version)
    if errors:
        _print_validation_errors(errors)
        return 1

    template = render_commit_template(decisions)

    if not args.confirm:
        print(
            f"✔ Dry-run: {len(decisions.renames)} rename(s) would "
            "apply cleanly.\n"
        )
        print("Commit-message template:\n")
        print(template)
        print()
        print(
            "Pass `--confirm` to apply. The commit template above "
            "is ready for:\n"
            "  git add config/**/symbols.txt\n"
            "  git commit -m \"$(python tools/cascade_apply.py ... "
            "| sed -n '/^cascade wave/,$p')\"",
            file=sys.stderr,
        )
        return 0

    applied = apply(decisions, args.version)
    print(
        f"✔ Applied {len(applied)} rename(s):\n",
    )
    for rename, path, line_no in applied:
        try:
            rel = path.relative_to(CONFIG.parent)
        except ValueError:
            rel = path
        print(
            f"  {rename.old:30s} → {rename.new:30s}  "
            f"({rel}:{line_no})",
        )
    print()
    print("Commit-message template:\n")
    print(template)
    return 0


if __name__ == "__main__":
    sys.exit(main())
