#!/usr/bin/env python3

"""
ci_format_diff_reasons.py — render a before/after diff of diff_reasons output.

Consumes two objdiff `report.json` snapshots and renders a Markdown
delta showing which functions moved between buckets. Pairs with
`tools/diff_reasons.py` (PR #108) — that tool classifies a single
snapshot; this tool compares two.

Intended uses:

  1. **Local pre/post-merge checks by brain.** Run `ninja report`
     on main, save the `report.json`. Merge a PR locally, run
     `ninja report` again, save the second. Feed both to this tool
     → instantly see "this PR broke 3 previously-matched functions".
  2. **Eventual CI integration.** When `report.json` becomes
     available in CI (see "CI integration paths" section of the PR
     body), the same renderer feeds an upserted PR comment — same
     shape as `ci_format_worklist_diff.py`, `ci_format_diff.py`,
     and `ci_format_invariants.py`.

Diff semantics:

  - **Regression**: function moved to a worse bucket (higher-match
    → lower-match). Surfaced prominently as alarms.
  - **Improvement**: function moved to a better bucket. Celebrated.
  - **Stable**: same bucket, or same 100% match.
  - **New**: in after but not before (e.g. dsd added a TU carve).
  - **Dropped**: in before but not after (symbol removed / renamed).

A "bucket-transition matrix" summarises the complete movement graph
for readers who want the whole picture.

Usage:

    python tools/ci_format_diff_reasons.py \\
        before.json after.json > comment.md

    # Machine-readable.
    python tools/ci_format_diff_reasons.py \\
        before.json after.json --json > delta.json
"""

from __future__ import annotations

import argparse
import io
import json
import sys
from collections import defaultdict
from dataclasses import dataclass, field
from pathlib import Path


# Import the classifier from the sibling tool so the bucket boundaries
# stay in lockstep. If diff_reasons ever moves its BUCKET_ORDER, this
# import keeps us aligned.
sys.path.insert(0, str(Path(__file__).resolve().parent))
from diff_reasons import (  # noqa: E402
    BUCKET_ALMOST,
    BUCKET_CLOSE,
    BUCKET_LOW,
    BUCKET_MATCHED,
    BUCKET_MEDIUM,
    BUCKET_ORDER,
    BUCKET_ZERO,
    classify,
    load_report,
)


# Bucket ordered by match-depth (worst → best). Used to judge whether
# a movement is a regression (→ worse) or an improvement (→ better).
# Keep this LOCAL rather than re-using diff_reasons.BUCKET_ORDER because
# that one's order is display-ordering (almost-first), not match-depth.
_DEPTH_ORDER = [
    BUCKET_ZERO, BUCKET_LOW, BUCKET_MEDIUM,
    BUCKET_CLOSE, BUCKET_ALMOST, BUCKET_MATCHED,
]


def _depth_rank(bucket: str) -> int:
    try:
        return _DEPTH_ORDER.index(bucket)
    except ValueError:
        return -1


# --------------------------------------------------------------------------- #
# Extraction
# --------------------------------------------------------------------------- #

@dataclass(frozen=True)
class SnapshotEntry:
    """Minimal per-function record extracted from a report.json
    snapshot."""
    unit: str
    name: str
    size: int
    fuzzy_match_percent: float

    @property
    def key(self) -> tuple[str, str]:
        return (self.unit, self.name)

    @property
    def bucket(self) -> str:
        return classify(self.fuzzy_match_percent)


def extract_snapshot(report: dict) -> dict[tuple[str, str], SnapshotEntry]:
    """Flatten report.json → {(unit, name): SnapshotEntry}. Defensive
    against missing fields (mirrors diff_reasons.iter_function_entries
    in that regard)."""
    out: dict[tuple[str, str], SnapshotEntry] = {}
    for unit in report.get("units", []) or []:
        unit_name = unit.get("name", "<unknown>")
        for item in unit.get("functions", []) or []:
            fuzzy = item.get("fuzzy_match_percent", 0.0)
            if fuzzy is None:
                fuzzy = 0.0
            entry = SnapshotEntry(
                unit=unit_name,
                name=item.get("name", "<anon>"),
                size=int(item.get("size", 0) or 0),
                fuzzy_match_percent=float(fuzzy),
            )
            out[entry.key] = entry
    return out


# --------------------------------------------------------------------------- #
# Diffing
# --------------------------------------------------------------------------- #

@dataclass
class Movement:
    entry_before: SnapshotEntry | None
    entry_after: SnapshotEntry | None

    @property
    def bucket_before(self) -> str | None:
        return self.entry_before.bucket if self.entry_before else None

    @property
    def bucket_after(self) -> str | None:
        return self.entry_after.bucket if self.entry_after else None

    @property
    def is_new(self) -> bool:
        return self.entry_before is None and self.entry_after is not None

    @property
    def is_dropped(self) -> bool:
        return self.entry_before is not None and self.entry_after is None

    @property
    def pct_delta(self) -> float | None:
        if self.entry_before is None or self.entry_after is None:
            return None
        return (
            self.entry_after.fuzzy_match_percent
            - self.entry_before.fuzzy_match_percent
        )

    @property
    def is_regression(self) -> bool:
        if self.entry_before is None or self.entry_after is None:
            return False
        return _depth_rank(self.bucket_after) < _depth_rank(self.bucket_before)

    @property
    def is_improvement(self) -> bool:
        if self.entry_before is None or self.entry_after is None:
            return False
        return _depth_rank(self.bucket_after) > _depth_rank(self.bucket_before)


@dataclass
class DiffReasonsDelta:
    movements: list[Movement] = field(default_factory=list)
    # Bucket-to-bucket transition counts. `transitions[from][to]` = N.
    transitions: dict[str, dict[str, int]] = field(default_factory=dict)
    # Per-bucket before/after population counts.
    bucket_counts_before: dict[str, int] = field(default_factory=dict)
    bucket_counts_after: dict[str, int] = field(default_factory=dict)
    # New and dropped entries (not in bucket transitions).
    new_entries: list[SnapshotEntry] = field(default_factory=list)
    dropped_entries: list[SnapshotEntry] = field(default_factory=list)

    @property
    def regressions(self) -> list[Movement]:
        return [m for m in self.movements if m.is_regression]

    @property
    def improvements(self) -> list[Movement]:
        return [m for m in self.movements if m.is_improvement]


def compute_delta(
    before: dict[tuple[str, str], SnapshotEntry],
    after: dict[tuple[str, str], SnapshotEntry],
) -> DiffReasonsDelta:
    delta = DiffReasonsDelta()
    for b in BUCKET_ORDER:
        delta.transitions[b] = defaultdict(int)
        delta.bucket_counts_before[b] = 0
        delta.bucket_counts_after[b] = 0

    for key, entry in before.items():
        delta.bucket_counts_before[entry.bucket] += 1
        if key not in after:
            delta.dropped_entries.append(entry)
            delta.movements.append(Movement(entry_before=entry, entry_after=None))
            continue
        other = after[key]
        delta.transitions[entry.bucket][other.bucket] += 1
        if entry.bucket != other.bucket or (
            entry.fuzzy_match_percent != other.fuzzy_match_percent
        ):
            delta.movements.append(Movement(
                entry_before=entry, entry_after=other,
            ))

    for key, entry in after.items():
        delta.bucket_counts_after[entry.bucket] += 1
        if key not in before:
            delta.new_entries.append(entry)
            delta.movements.append(Movement(entry_before=None, entry_after=entry))

    # Convert defaultdicts for JSON-friendliness.
    delta.transitions = {
        k: dict(v) for k, v in delta.transitions.items()
    }
    return delta


# --------------------------------------------------------------------------- #
# Rendering
# --------------------------------------------------------------------------- #

_BUCKET_EMOJI = {
    BUCKET_MATCHED: "🟢",
    BUCKET_ALMOST:  "🟡",
    BUCKET_CLOSE:   "🟠",
    BUCKET_MEDIUM:  "🔴",
    BUCKET_LOW:     "⚫",
    BUCKET_ZERO:    "⚪",
}

_FOOTER = (
    "<sub>🤖 Generated by `tools/ci_format_diff_reasons.py`. "
    "Consumes two `report.json` snapshots from "
    "`objdiff-cli report generate`.</sub>"
)


def _fmt_movement(m: Movement) -> str:
    """Render one regression/improvement as a table row."""
    a = m.entry_after or m.entry_before
    b = m.entry_before or m.entry_after
    if a is None or b is None:
        return ""
    unit = a.unit
    name = a.name
    size = a.size
    size_s = f"`0x{size:x}`" if size else "`?`"
    before_bucket = m.bucket_before or ""
    after_bucket = m.bucket_after or ""
    before_emoji = _BUCKET_EMOJI.get(before_bucket, "")
    after_emoji = _BUCKET_EMOJI.get(after_bucket, "")
    pct_delta = m.pct_delta
    delta_str = (
        f"{pct_delta:+.2f}pp" if pct_delta is not None else "—"
    )
    return (
        f"| `{unit}` | `{name}` | {size_s} | "
        f"{before_emoji} `{before_bucket}` | "
        f"{after_emoji} `{after_bucket}` | "
        f"{b.fuzzy_match_percent:.2f}% → {a.fuzzy_match_percent:.2f}% | "
        f"{delta_str} |"
    )


def render_markdown(
    delta: DiffReasonsDelta, *,
    top_n: int = 25,
) -> str:
    out: list[str] = []
    out.append("## 📉 Match-depth delta")
    out.append("")

    reg_count = len(delta.regressions)
    imp_count = len(delta.improvements)
    new_count = len(delta.new_entries)
    dropped_count = len(delta.dropped_entries)

    # Headline.
    if reg_count == 0 and imp_count == 0 and new_count == 0 and dropped_count == 0:
        out.append("_No bucket movements — every function stayed in "
                   "the same match-depth bucket._")
        out.append("")
        out.append(_FOOTER)
        return "\n".join(out)

    banner_bits = []
    if reg_count:
        banner_bits.append(f"🛑 **{reg_count} regression(s)**")
    if imp_count:
        banner_bits.append(f"✅ **{imp_count} improvement(s)**")
    if new_count:
        banner_bits.append(f"🆕 {new_count} new")
    if dropped_count:
        banner_bits.append(f"🗑️ {dropped_count} dropped")
    out.append(", ".join(banner_bits) + ".")
    out.append("")

    # Bucket-count delta summary.
    out.append("### Bucket counts")
    out.append("")
    out.append("| Bucket | Before | After | Δ |")
    out.append("|--------|-------:|------:|--:|")
    for bucket in BUCKET_ORDER:
        b_count = delta.bucket_counts_before.get(bucket, 0)
        a_count = delta.bucket_counts_after.get(bucket, 0)
        if b_count == 0 and a_count == 0:
            continue
        net = a_count - b_count
        net_s = f"{net:+d}" if net else "0"
        if net:
            net_s = f"**{net_s}**"
        emoji = _BUCKET_EMOJI.get(bucket, "⚪")
        out.append(
            f"| {emoji} `{bucket}` | {b_count} | {a_count} | {net_s} |"
        )
    out.append("")

    # Regressions — the alarm list.
    if delta.regressions:
        out.append(f"### 🛑 Regressions ({reg_count})")
        out.append("")
        out.append(
            "_Functions that moved to a worse match-depth bucket. "
            "A regression almost always indicates this PR broke "
            "something that used to match — investigate each one "
            "before merging._"
        )
        out.append("")
        out.append("| Unit | Function | Size | From | To | Match % | Δ |")
        out.append("|------|----------|-----:|------|----|---------|--:|")
        # Sort worst regressions (biggest negative pct_delta) first.
        regs = sorted(
            delta.regressions,
            key=lambda m: (m.pct_delta or 0.0),
        )
        for m in regs[:top_n]:
            out.append(_fmt_movement(m))
        if len(regs) > top_n:
            out.append(
                f"- _…and {len(regs) - top_n} more regressions._"
            )
        out.append("")

    # Improvements — the celebration list.
    if delta.improvements:
        out.append(f"### ✅ Improvements ({imp_count})")
        out.append("")
        # Sort largest improvements first.
        imps = sorted(
            delta.improvements,
            key=lambda m: -(m.pct_delta or 0.0),
        )
        out.append("| Unit | Function | Size | From | To | Match % | Δ |")
        out.append("|------|----------|-----:|------|----|---------|--:|")
        for m in imps[:top_n]:
            out.append(_fmt_movement(m))
        if len(imps) > top_n:
            out.append(
                f"- _…and {len(imps) - top_n} more improvements._"
            )
        out.append("")

    # New / dropped — less common, briefer coverage.
    if delta.new_entries:
        out.append(f"### 🆕 New entries ({new_count})")
        out.append("")
        out.append(
            "_Functions in after but not before — dsd added a TU "
            "carve, or objdiff now sees a symbol it didn't before._"
        )
        out.append("")
        out.append("| Unit | Function | Size | Bucket | Match % |")
        out.append("|------|----------|-----:|--------|--------:|")
        for entry in delta.new_entries[:top_n]:
            size_s = f"`0x{entry.size:x}`" if entry.size else "`?`"
            emoji = _BUCKET_EMOJI.get(entry.bucket, "⚪")
            out.append(
                f"| `{entry.unit}` | `{entry.name}` | {size_s} | "
                f"{emoji} `{entry.bucket}` | "
                f"{entry.fuzzy_match_percent:.2f}% |"
            )
        if len(delta.new_entries) > top_n:
            out.append(
                f"- _…and {len(delta.new_entries) - top_n} more new._"
            )
        out.append("")

    if delta.dropped_entries:
        out.append(f"### 🗑️ Dropped entries ({dropped_count})")
        out.append("")
        out.append(
            "_Functions in before but not after — symbol was "
            "removed, renamed, or dsd no longer exports it. Verify "
            "each intentionally; an accidental drop is a common "
            "rename-breaks-everything footgun._"
        )
        out.append("")
        out.append("| Unit | Function | Size | Was bucket |")
        out.append("|------|----------|-----:|------------|")
        for entry in delta.dropped_entries[:top_n]:
            size_s = f"`0x{entry.size:x}`" if entry.size else "`?`"
            emoji = _BUCKET_EMOJI.get(entry.bucket, "⚪")
            out.append(
                f"| `{entry.unit}` | `{entry.name}` | {size_s} | "
                f"{emoji} `{entry.bucket}` |"
            )
        if len(delta.dropped_entries) > top_n:
            out.append(
                f"- _…and {len(delta.dropped_entries) - top_n} more dropped._"
            )
        out.append("")

    out.append(_FOOTER)
    return "\n".join(out)


def render_json(delta: DiffReasonsDelta) -> dict:
    def _entry_dict(e: SnapshotEntry | None) -> dict | None:
        if e is None:
            return None
        return {
            "unit": e.unit,
            "name": e.name,
            "size": e.size,
            "fuzzy_match_percent": e.fuzzy_match_percent,
            "bucket": e.bucket,
        }

    return {
        "bucket_counts_before": delta.bucket_counts_before,
        "bucket_counts_after": delta.bucket_counts_after,
        "transitions": delta.transitions,
        "regressions": [
            {
                "before": _entry_dict(m.entry_before),
                "after": _entry_dict(m.entry_after),
                "pct_delta": m.pct_delta,
            }
            for m in delta.regressions
        ],
        "improvements": [
            {
                "before": _entry_dict(m.entry_before),
                "after": _entry_dict(m.entry_after),
                "pct_delta": m.pct_delta,
            }
            for m in delta.improvements
        ],
        "new": [_entry_dict(e) for e in delta.new_entries],
        "dropped": [_entry_dict(e) for e in delta.dropped_entries],
    }


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def main() -> int:
    # Force UTF-8 on stdout so emoji headers survive on Windows cp1252
    # consoles. Same guard as ci_format_worklist_diff.py (PR #95).
    try:
        sys.stdout.reconfigure(encoding="utf-8", errors="replace")
    except (AttributeError, io.UnsupportedOperation):
        pass

    ap = argparse.ArgumentParser(
        description="Render a before/after diff of objdiff report.json "
                    "snapshots.",
    )
    ap.add_argument("before", type=Path,
                    help="Path to the base report.json (pre-change)")
    ap.add_argument("after", type=Path,
                    help="Path to the head report.json (post-change)")
    ap.add_argument("--top", type=int, default=25,
                    help="Max rows per section (default 25)")
    ap.add_argument("--json", action="store_true",
                    help="Emit JSON instead of Markdown")
    ap.add_argument("--out", type=Path,
                    help="Write output to this path (default: stdout)")
    args = ap.parse_args()

    before_payload = load_report(args.before)
    after_payload = load_report(args.after)
    # Tolerate missing snapshots — render a helpful note rather than
    # crash. Either file missing → we can still render *something*
    # (everything-new or everything-dropped), but that's rarely the
    # desired diff shape. Flag it visibly in the output.
    missing_notes: list[str] = []
    if before_payload is None:
        missing_notes.append(f"`before` snapshot missing at `{args.before}`")
    if after_payload is None:
        missing_notes.append(f"`after` snapshot missing at `{args.after}`")

    before_snap = extract_snapshot(before_payload or {})
    after_snap = extract_snapshot(after_payload or {})
    delta = compute_delta(before_snap, after_snap)

    if args.json:
        payload = render_json(delta)
        if missing_notes:
            payload["warnings"] = missing_notes
        out_text = json.dumps(payload, indent=2) + "\n"
    else:
        md = render_markdown(delta, top_n=args.top)
        if missing_notes:
            md = (
                "## ⚠️ Snapshot missing\n\n"
                + "\n".join(f"- {n}" for n in missing_notes)
                + "\n\n"
                + "Output below reflects a partial comparison.\n\n"
                + md
            )
        out_text = md

    if args.out:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(out_text, encoding="utf-8")
        print(f"Wrote {args.out}", file=sys.stderr)
    else:
        print(out_text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
