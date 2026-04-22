#!/usr/bin/env python3

"""
ci_format_worklist_diff.py — render a next_targets.py before/after diff.

Consumes two `next_targets.json` snapshots (the output of
`tools/next_targets.py`) and renders the delta as Markdown. Intended
for PR bodies / CI comments so a reviewer can see at a glance which
functions moved from "unmatched" to "matched" in a given change.

Pairs naturally with `tools/next_targets.py` (produces the snapshots)
and `tools/ci_format_diff.py` (renders analyze_symbols tier deltas,
a complementary lens). This tool answers "what progress did this PR
actually land?" while ci_format_diff answers "how did the analyzer's
classifications shift?".

Diff semantics:

  - **Matches landed** — items in `before.worklist` but NOT in
    `after.worklist` (by (module, addr)). These are the headline
    wins a PR should surface.
  - **New candidates** — items in `after.worklist` but NOT in
    `before.worklist`. Usually from `dsd init` additions or a rename
    promoting a symbol into a new tier.
  - **Tier migrations** — items in both snapshots but with a
    different `tier`. Happens when a function's classification shifts
    (e.g. all callees newly named → tier `medium` → `named`).
  - **Tier summary** — per-tier `matched` deltas computed from each
    snapshot's `tier_breakdown` table.

Usage:

    python tools/ci_format_worklist_diff.py \\
        /tmp/before.json /tmp/after.json > /tmp/comment.md

    # Write to file instead of stdout
    python tools/ci_format_worklist_diff.py \\
        /tmp/before.json /tmp/after.json -o /tmp/comment.md

The snapshots come from `tools/next_targets.py`'s default output
path, captured at two repo states:

    # Before — checkout base branch, run once, copy out
    git checkout <base>
    python tools/next_targets.py --version eur
    cp build/eur/analysis/next_targets.json /tmp/before.json

    # After — checkout PR head, run again
    git checkout <pr-head>
    python tools/next_targets.py --version eur
    cp build/eur/analysis/next_targets.json /tmp/after.json

(Or a future CI workflow runs both automatically against the PR's
base + head commits, same pattern as analyzer.yml's tier-delta job.)
"""

from __future__ import annotations

import json
import sys
from dataclasses import dataclass
from pathlib import Path


TIER_ORDER = ["trivial", "easy", "sinit", "named", "medium", "hard"]


@dataclass(frozen=True)
class WorklistEntry:
    """Subset of a `next_targets.json` worklist row we need for diffing.
    Keeps the tool tolerant of extra fields being added upstream."""
    tier: str
    module: str
    addr: int
    size: int
    name: str


def _parse_addr(v) -> int | None:
    """Accept either '0xNNNN' strings or ints from a JSON payload."""
    if isinstance(v, int):
        return v
    if isinstance(v, str):
        try:
            return int(v, 16) if v.startswith(("0x", "0X")) else int(v)
        except ValueError:
            return None
    return None


def _load_entries(path: Path) -> dict[tuple[str, int], WorklistEntry]:
    """Read a next_targets.json and return {(module, addr): entry}.
    Silently tolerates malformed rows so a corrupted snapshot doesn't
    blow up PR-comment rendering."""
    if not path.is_file():
        return {}
    with path.open() as f:
        payload = json.load(f)
    out: dict[tuple[str, int], WorklistEntry] = {}
    for row in payload.get("worklist", []):
        module = row.get("module")
        addr = _parse_addr(row.get("addr"))
        tier = row.get("tier", "")
        if module is None or addr is None:
            continue
        out[(module, addr)] = WorklistEntry(
            tier=tier,
            module=module,
            addr=addr,
            size=int(row.get("size") or 0),
            name=row.get("name", ""),
        )
    return out


def _load_breakdown(path: Path) -> dict[str, dict[str, int]]:
    """Read tier_breakdown from a snapshot. Returns an empty dict on
    missing / malformed input so the diff stays renderable."""
    if not path.is_file():
        return {}
    try:
        with path.open() as f:
            payload = json.load(f)
    except (OSError, json.JSONDecodeError):
        return {}
    return payload.get("tier_breakdown", {}) or {}


# --------------------------------------------------------------------------- #
# Diffing
# --------------------------------------------------------------------------- #

@dataclass
class WorklistDiff:
    # Items in `before` but not in `after` — the headline "matches landed".
    landed: list[WorklistEntry]
    # Items in `after` but not in `before` — new entries in the worklist.
    new: list[WorklistEntry]
    # Items in both snapshots whose tier changed.
    migrations: list[tuple[WorklistEntry, WorklistEntry]]
    # Matched-count delta per tier, from tier_breakdown.
    tier_summary: dict[str, tuple[int, int]]  # tier -> (before, after)


def compute_diff(
    before: dict[tuple[str, int], WorklistEntry],
    after: dict[tuple[str, int], WorklistEntry],
    before_breakdown: dict[str, dict[str, int]],
    after_breakdown: dict[str, dict[str, int]],
) -> WorklistDiff:
    landed: list[WorklistEntry] = []
    new: list[WorklistEntry] = []
    migrations: list[tuple[WorklistEntry, WorklistEntry]] = []

    for key, b in before.items():
        if key not in after:
            landed.append(b)
        else:
            a = after[key]
            if a.tier != b.tier:
                migrations.append((b, a))
    for key, a in after.items():
        if key not in before:
            new.append(a)

    # Sort for deterministic output. Landed / new: sort by tier-rank
    # (easiest-first), then size, then module+addr. Migrations: by
    # before-tier-rank, then after-tier-rank, then key.
    landed.sort(key=_entry_sort_key)
    new.sort(key=_entry_sort_key)
    migrations.sort(key=lambda p: (
        _tier_rank(p[0].tier),
        _tier_rank(p[1].tier),
        p[0].module, p[0].addr,
    ))

    # Tier summary: union of keys, (matched_before, matched_after).
    all_tiers = set(before_breakdown) | set(after_breakdown) | set(TIER_ORDER)
    summary: dict[str, tuple[int, int]] = {}
    for tier in all_tiers:
        b = int(before_breakdown.get(tier, {}).get("matched", 0) or 0)
        a = int(after_breakdown.get(tier, {}).get("matched", 0) or 0)
        summary[tier] = (b, a)

    return WorklistDiff(
        landed=landed, new=new, migrations=migrations,
        tier_summary=summary,
    )


def _tier_rank(tier: str) -> int:
    try:
        return TIER_ORDER.index(tier)
    except ValueError:
        return len(TIER_ORDER)


def _entry_sort_key(e: WorklistEntry) -> tuple:
    return (_tier_rank(e.tier), e.size, e.module, e.addr)


# --------------------------------------------------------------------------- #
# Rendering
# --------------------------------------------------------------------------- #

def _fmt_entry(e: WorklistEntry) -> str:
    size_s = f"`0x{e.size:x}`" if e.size else "`?`"
    return (
        f"| `{e.tier}` | `{e.module}` | `0x{e.addr:08x}` | "
        f"{size_s} | `{e.name}` |"
    )


def render(diff: WorklistDiff, *, limit_per_section: int = 25) -> str:
    out: list[str] = []
    out.append("## 📉 Worklist delta")
    out.append("")

    total_landed = len(diff.landed)
    total_new = len(diff.new)
    total_migrations = len(diff.migrations)

    if total_landed == 0 and total_new == 0 and total_migrations == 0:
        out.append("_No worklist changes — this PR didn't shift any "
                   "unmatched/matched state._")
        out.append("")
    else:
        out.append(
            f"**{total_landed} match(es) landed**, {total_new} new "
            f"candidate(s), {total_migrations} tier migration(s)."
        )
        out.append("")

    # Tier summary table — always render so readers see the state
    # snapshot even if nothing changed.
    meaningful = [
        t for t in TIER_ORDER
        if diff.tier_summary.get(t, (0, 0)) != (0, 0)
    ]
    if meaningful:
        out.append("### Tier matched-count delta")
        out.append("")
        out.append("| Tier | Before | After | Δ |")
        out.append("|------|-------:|------:|--:|")
        for tier in meaningful:
            before, after = diff.tier_summary[tier]
            delta = after - before
            delta_s = _signed(delta)
            # Bold non-zero deltas so the eye hits them first.
            delta_cell = f"**{delta_s}**" if delta != 0 else delta_s
            out.append(
                f"| `{tier}` | {before} | {after} | {delta_cell} |"
            )
        out.append("")

    # Headline: matches landed.
    if diff.landed:
        out.append(f"### ✅ Matches landed ({total_landed})")
        out.append("")
        out.append("| Tier | Module | Addr | Size | Name |")
        out.append("|------|--------|------|-----:|------|")
        for e in diff.landed[:limit_per_section]:
            out.append(_fmt_entry(e))
        if total_landed > limit_per_section:
            out.append(
                f"- _…and {total_landed - limit_per_section} more "
                f"matches landed_"
            )
        out.append("")

    # New candidates — less interesting but useful to flag.
    if diff.new:
        out.append(f"### 🆕 New worklist entries ({total_new})")
        out.append("")
        out.append(
            "_Usually from `dsd init` additions or rename promotions "
            "that introduced new decomp candidates._"
        )
        out.append("")
        out.append("| Tier | Module | Addr | Size | Name |")
        out.append("|------|--------|------|-----:|------|")
        for e in diff.new[:limit_per_section]:
            out.append(_fmt_entry(e))
        if total_new > limit_per_section:
            out.append(
                f"- _…and {total_new - limit_per_section} more new entries_"
            )
        out.append("")

    # Tier migrations — worth surfacing but usually quiet.
    if diff.migrations:
        out.append(f"### 🔀 Tier migrations ({total_migrations})")
        out.append("")
        out.append("| Module | Addr | Name | From | To |")
        out.append("|--------|------|------|------|----|")
        for b, a in diff.migrations[:limit_per_section]:
            out.append(
                f"| `{b.module}` | `0x{b.addr:08x}` | `{b.name}` | "
                f"`{b.tier}` | `{a.tier}` |"
            )
        if total_migrations > limit_per_section:
            out.append(
                f"- _…and {total_migrations - limit_per_section} more "
                f"migrations_"
            )
        out.append("")

    out.append(
        "<sub>🤖 Generated by `tools/ci_format_worklist_diff.py` from "
        "`next_targets.json` before/after snapshots.</sub>"
    )
    return "\n".join(out)


def _signed(n: int) -> str:
    if n > 0:
        return f"+{n}"
    return str(n)


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def main() -> int:
    args = sys.argv[1:]
    out_path: Path | None = None
    positional: list[str] = []
    i = 0
    while i < len(args):
        a = args[i]
        if a in ("-o", "--out"):
            if i + 1 >= len(args):
                print("error: -o requires a path", file=sys.stderr)
                return 2
            out_path = Path(args[i + 1])
            i += 2
            continue
        positional.append(a)
        i += 1

    if len(positional) != 2:
        print(
            "usage: ci_format_worklist_diff.py <before.json> <after.json> "
            "[-o <out.md>]",
            file=sys.stderr,
        )
        return 2

    before_path = Path(positional[0])
    after_path = Path(positional[1])

    before_entries = _load_entries(before_path)
    after_entries = _load_entries(after_path)
    before_breakdown = _load_breakdown(before_path)
    after_breakdown = _load_breakdown(after_path)

    diff = compute_diff(
        before_entries, after_entries,
        before_breakdown, after_breakdown,
    )
    md = render(diff)

    if out_path is not None:
        out_path.write_text(md, encoding="utf-8")
    else:
        print(md)
    return 0


if __name__ == "__main__":
    sys.exit(main())
