#!/usr/bin/env python3

"""
ci_format_diff.py — render an analyzer diff as Markdown for a PR comment.

Consumes the JSON emitted by `analyze_symbols.py --diff-json <path>`
and prints a Markdown block suitable for piping into `gh pr comment`.

Shape of the JSON (from compute_diff):

    {
      "tier_delta":        {tier: int},
      "moved":             [[key, prev_tier, curr_tier], ...],
      "renamed":           [[key, prev_name, curr_name], ...],
      "newly_classified":  [[key, name, tier], ...],
      "removed":           [[key, name, tier], ...]
    }

Usage:
    python tools/ci_format_diff.py /tmp/diff.json > /tmp/comment.md
    gh pr comment $PR_NUMBER --body-file /tmp/comment.md
"""

from __future__ import annotations

import json
import sys
from collections import Counter
from pathlib import Path


TIER_ORDER = ["trivial", "easy", "sinit", "named", "medium", "hard"]


def fmt_signed(n: int) -> str:
    if n > 0:
        return f"+{n}"
    return str(n)


def render(diff: dict, *, limit: int = 15) -> str:
    out: list[str] = []
    out.append("## 📊 Analyzer tier delta")
    out.append("")
    out.append("Changes this PR would introduce vs `main`, as computed by "
               "`tools/analyze_symbols.py`. Bot-generated; regenerated on "
               "every push to the PR branch.")
    out.append("")

    tier_delta: dict = diff.get("tier_delta", {})
    nonzero = {t: d for t, d in tier_delta.items() if d != 0}
    if nonzero:
        out.append("### Tier counts")
        out.append("")
        out.append("| Tier | Δ |")
        out.append("|------|--:|")
        for tier in TIER_ORDER:
            d = nonzero.get(tier)
            if d is None:
                continue
            out.append(f"| `{tier}` | {fmt_signed(d)} |")
        out.append("")
    else:
        out.append("_Tier counts unchanged._")
        out.append("")

    renamed = diff.get("renamed", [])
    if renamed:
        out.append(f"### Renames ({len(renamed)})")
        out.append("")
        for entry in renamed[:limit]:
            key, old, new = entry
            out.append(f"- `{old}` → **`{new}`**  <sub>{key}</sub>")
        if len(renamed) > limit:
            out.append(f"- _…and {len(renamed) - limit} more_")
        out.append("")

    moved = diff.get("moved", [])
    if moved:
        # Group by (prev, curr) with counts.
        transitions = Counter()
        for entry in moved:
            _, prev, curr = entry
            transitions[(prev, curr)] += 1
        out.append(f"### Tier changes ({len(moved)})")
        out.append("")
        out.append("| From | To | Count |")
        out.append("|------|----|------:|")
        for (prev, curr), count in sorted(transitions.items(), key=lambda kv: -kv[1]):
            out.append(f"| `{prev}` | `{curr}` | {count} |")
        out.append("")

    newly = diff.get("newly_classified", [])
    if newly:
        out.append(f"### Newly classified ({len(newly)})")
        out.append("")
        for entry in newly[:limit]:
            key, name, tier = entry
            out.append(f"- `{name}` in `{tier}` tier  <sub>{key}</sub>")
        if len(newly) > limit:
            out.append(f"- _…and {len(newly) - limit} more_")
        out.append("")

    removed = diff.get("removed", [])
    if removed:
        out.append(f"### Removed ({len(removed)})")
        out.append("")
        for entry in removed[:limit]:
            key, name, tier = entry
            out.append(f"- `{name}` (was `{tier}`)  <sub>{key}</sub>")
        if len(removed) > limit:
            out.append(f"- _…and {len(removed) - limit} more_")
        out.append("")

    bg_new = diff.get("bulk_groups_new", [])
    bg_removed = diff.get("bulk_groups_removed", [])
    bg_changed = diff.get("bulk_groups_changed", [])
    bg_any = bool(bg_new or bg_removed or bg_changed)
    if bg_any:
        out.append(f"### Bulk groups "
                   f"({len(bg_new)} new, {len(bg_removed)} removed, "
                   f"{len(bg_changed)} changed)")
        out.append("")
        out.append("| Δ | Group | Count | Notes |")
        out.append("|---|-------|------:|-------|")

        def _notes(is_sinit: bool) -> str:
            return "`__sinit`" if is_sinit else "—"

        for key, count, is_sinit in bg_new[:limit]:
            out.append(f"| + | `{key}` | {count} | {_notes(is_sinit)} |")
        for key, count, is_sinit in bg_removed[:limit]:
            out.append(f"| − | `{key}` | {count} | {_notes(is_sinit)} |")
        for entry in bg_changed[:limit]:
            key, pc, cc, pf, cf = entry
            delta = cc - pc
            sign = "+" if delta > 0 else ""
            notes_bits: list[str] = []
            if pf != cf:
                if pf[0] != cf[0]:
                    notes_bits.append(f"`all_sinit` {pf[0]}→{cf[0]}")
                if pf[1] != cf[1]:
                    notes_bits.append(f"`all_placeholder` {pf[1]}→{cf[1]}")
            notes = "; ".join(notes_bits) if notes_bits else "—"
            out.append(
                f"| ~ | `{key}` | {pc}→{cc} ({sign}{delta}) | {notes} |"
            )
        total_bg = len(bg_new) + len(bg_removed) + len(bg_changed)
        shown = sum(min(limit, len(xs)) for xs in (bg_new, bg_removed, bg_changed))
        if total_bg > shown:
            out.append("")
            out.append(f"_…and {total_bg - shown} more bulk-group "
                       "changes (see `bulk.json`)._")
        out.append("")

    # If no section rendered, show a soothing idle message.
    has_content = nonzero or renamed or moved or newly or removed or bg_any
    if not has_content:
        out.append("_No classification changes — this PR doesn't touch "
                   "the analyzer's inputs._")
        out.append("")

    out.append("<sub>🤖 Posted by `.github/workflows/analyzer.yml` · "
               "rerun by pushing a new commit to this PR.</sub>")

    return "\n".join(out)


def main() -> int:
    if len(sys.argv) < 2:
        print("usage: ci_format_diff.py <diff.json> [-o <out.md>]",
              file=sys.stderr)
        return 2

    diff_path = Path(sys.argv[1])
    out_path: Path | None = None
    if "-o" in sys.argv:
        i = sys.argv.index("-o")
        if i + 1 < len(sys.argv):
            out_path = Path(sys.argv[i + 1])

    if not diff_path.is_file():
        # Graceful fallback — emit a short comment instead of failing
        # the workflow step when the diff is empty / missing.
        md = ("## 📊 Analyzer tier delta\n\n_No diff produced "
              "(likely first run on this branch)._")
    else:
        with diff_path.open() as f:
            diff = json.load(f)
        md = render(diff)

    if out_path is not None:
        out_path.write_text(md)
    else:
        print(md)
    return 0


if __name__ == "__main__":
    sys.exit(main())
