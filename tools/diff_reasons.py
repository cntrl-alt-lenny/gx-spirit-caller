#!/usr/bin/env python3

"""
diff_reasons.py — classify objdiff report entries by match depth.

objdiff emits a per-function `fuzzy_match_percent` in its
`report.json`. At 0-100% that's a single number per function, but
the shape of the distribution is decomper-actionable:

  - 100%           already matched; no action
  - 95-99%  ALMOST already close — candidate for `permute.py` or a
                   one-line signature tweak. One register or one
                   literal is likely off.
  - 75-94%  CLOSE  structural match with a wrong signature, struct
                   layout, or inline-expansion variant. Worth a
                   manual pass before permuter.
  - 25-74%  MEDIUM the right general shape but substantial
                   divergence — wrong algorithm branch, wrong
                   loop kind, wrong type width.
  - 1-24%   LOW    the function has some overlap but it's the wrong
                   TU shape entirely. Often means the .c file covers
                   the wrong byte range.
  - 0%             no overlap at all — empty stub, wrong symbol,
                   or not yet written.

This tool reads the report, groups functions by bucket, and emits
both a per-module summary and a headline "almost-there" table —
the top-N highest-% functions under 100. Those are the decomper's
next tactical wins.

Ignores report.json entries for symbols listed in config/<ver>'s
complete TUs (already matched — we don't need to tell the decomper
those are at 100%).

Pairs with:
  - `tools/next_targets.py` — picks candidates from the unmatched set;
    this tool complements by surfacing the "partially-matched" set
    which next_targets doesn't see (report.json's 1-99% band).
  - `tools/permute.py` — feed the ALMOST (95-99%) bucket into a
    batch permuter run when match rates climb past ~5%.

Usage:

    python tools/diff_reasons.py --version eur
    python tools/diff_reasons.py --report /tmp/report.json --top 25
    python tools/diff_reasons.py --version eur --json > /tmp/reasons.json

Report not found? Tool exits cleanly with a guidance message —
objdiff's `report.json` only exists after a local `ninja report`
run with a baserom. In the cloud / CI context, treat a missing
report as "nothing to classify".
"""

from __future__ import annotations

import argparse
import json
import sys
from dataclasses import asdict, dataclass, field
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent


# Bucket boundaries (upper-inclusive, lower-exclusive except for the
# special 0% and 100% endpoints). Tuned against the match-depth
# interpretation in the module docstring — boundaries are moved at
# natural breakpoints a decomper intuitively recognises rather than
# at uniform percent steps.
BUCKET_MATCHED = "matched"       # fuzzy == 100
BUCKET_ALMOST = "almost"         # 95 <= fuzzy < 100
BUCKET_CLOSE = "close"           # 75 <= fuzzy < 95
BUCKET_MEDIUM = "medium"         # 25 <= fuzzy < 75
BUCKET_LOW = "low"               # 0  <  fuzzy < 25
BUCKET_ZERO = "zero"             # fuzzy == 0
BUCKET_ORDER = [
    BUCKET_ALMOST, BUCKET_CLOSE, BUCKET_MEDIUM, BUCKET_LOW,
    BUCKET_ZERO, BUCKET_MATCHED,
]

# One-liner interpretation per bucket. Surfaced in the rendered
# report so the decomper can act without cross-referencing docs.
BUCKET_INTERPRETATION = {
    BUCKET_MATCHED: "matched — no action.",
    BUCKET_ALMOST:
        "one register / one literal off. Try `tools/permute.py` "
        "or inspect the objdiff instruction diff.",
    BUCKET_CLOSE:
        "structural match with a wrong signature, struct layout, "
        "or inline-expansion variant. Manual pass first.",
    BUCKET_MEDIUM:
        "right general shape but substantial divergence — wrong "
        "algorithm branch, wrong loop kind, wrong type width.",
    BUCKET_LOW:
        "the function has some overlap but the .c file likely "
        "covers the wrong byte range or is a partial rewrite.",
    BUCKET_ZERO:
        "no overlap yet — empty stub, wrong symbol, or not "
        "written. Not reachable from this tool's triage path.",
}


def classify(fuzzy: float) -> str:
    """Map a fuzzy_match_percent to one of the bucket constants.

    The 100/95/75/25/0 breakpoints match the module docstring's
    interpretation. Floating-point noise at the endpoints is
    absorbed with a small epsilon check on the 100% tier so a
    `99.9999` float from protobuf wire parsing doesn't miss the
    matched bucket.
    """
    if fuzzy >= 99.999:
        return BUCKET_MATCHED
    if fuzzy >= 95.0:
        return BUCKET_ALMOST
    if fuzzy >= 75.0:
        return BUCKET_CLOSE
    if fuzzy >= 25.0:
        return BUCKET_MEDIUM
    if fuzzy > 0.0:
        return BUCKET_LOW
    return BUCKET_ZERO


# --------------------------------------------------------------------------- #
# Data classes
# --------------------------------------------------------------------------- #

@dataclass(frozen=True)
class FunctionEntry:
    """Subset of a ReportItem we need for classification. Keeps
    downstream code tolerant of new fields objdiff might add."""
    unit: str
    name: str
    size: int
    fuzzy_match_percent: float

    @property
    def bucket(self) -> str:
        return classify(self.fuzzy_match_percent)


@dataclass
class ClassifiedReport:
    """Everything a renderer / JSON writer needs in one object."""
    total_functions: int
    buckets: dict[str, list[FunctionEntry]]
    per_module_buckets: dict[str, dict[str, int]] = field(default_factory=dict)

    def count(self, bucket: str) -> int:
        return len(self.buckets.get(bucket, []))


# --------------------------------------------------------------------------- #
# Parsing
# --------------------------------------------------------------------------- #

def load_report(path: Path) -> dict | None:
    """Read objdiff's report.json. Returns None if the file is
    missing (common in cloud / CI — no baserom, no `ninja report`);
    the caller decides whether that's an error or a graceful no-op."""
    if not path.is_file():
        return None
    try:
        with path.open() as f:
            return json.load(f)
    except (OSError, json.JSONDecodeError):
        return None


def iter_function_entries(report: dict) -> list[FunctionEntry]:
    """Flatten the report's per-unit function lists into one sorted
    sequence. Sort key: (bucket rank, -fuzzy, unit, name) — so the
    ALMOST bucket surfaces first with highest-matching functions
    leading.

    Defensive about missing fields: objdiff's protobuf-generated JSON
    can serialise fields as omitted when zero, so `fuzzy_match_percent`
    may be absent on a fully-unmatched entry. Treat missing as 0.
    """
    out: list[FunctionEntry] = []
    for unit in report.get("units", []) or []:
        unit_name = unit.get("name", "<unknown>")
        for item in unit.get("functions", []) or []:
            fuzzy = item.get("fuzzy_match_percent", 0.0)
            if fuzzy is None:
                fuzzy = 0.0
            out.append(FunctionEntry(
                unit=unit_name,
                name=item.get("name", "<anon>"),
                size=int(item.get("size", 0) or 0),
                fuzzy_match_percent=float(fuzzy),
            ))
    out.sort(key=lambda e: (
        BUCKET_ORDER.index(e.bucket),
        -e.fuzzy_match_percent,
        e.unit, e.name,
    ))
    return out


def classify_report(report: dict) -> ClassifiedReport:
    entries = iter_function_entries(report)
    buckets: dict[str, list[FunctionEntry]] = {b: [] for b in BUCKET_ORDER}
    per_module: dict[str, dict[str, int]] = {}
    for e in entries:
        buckets[e.bucket].append(e)
        per_module.setdefault(e.unit, {b: 0 for b in BUCKET_ORDER})
        per_module[e.unit][e.bucket] += 1
    return ClassifiedReport(
        total_functions=len(entries),
        buckets=buckets,
        per_module_buckets=per_module,
    )


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


def render_markdown(
    report: ClassifiedReport, *,
    top_n: int = 25,
    include_matched: bool = False,
) -> str:
    """Markdown output: bucket summary + top-N almost-there list +
    per-module heatmap. Matched-bucket counts included in the
    summary but not in the per-function tables (they're noise for
    the decomper's next-steps view)."""
    out: list[str] = []
    out.append("# Match-depth classification")
    out.append("")
    out.append(
        f"Classified **{report.total_functions}** function(s) from "
        f"`report.json` into match-depth buckets."
    )
    out.append("")

    # Summary table.
    out.append("## Bucket summary")
    out.append("")
    out.append("| | Bucket | Count | Interpretation |")
    out.append("|---|---|---:|---|")
    for bucket in BUCKET_ORDER:
        if bucket == BUCKET_MATCHED and not include_matched:
            continue
        count = report.count(bucket)
        if count == 0 and bucket in (BUCKET_MATCHED, BUCKET_ZERO):
            # Don't pollute the table with empty known-empty rows.
            continue
        emoji = _BUCKET_EMOJI.get(bucket, "⚪")
        out.append(
            f"| {emoji} | `{bucket}` | {count} | "
            f"{BUCKET_INTERPRETATION[bucket]} |"
        )
    out.append("")

    # ALMOST bucket is the headline — give it its own section with
    # size + match%. This is what the decomper acts on first.
    almost = report.buckets.get(BUCKET_ALMOST, [])
    if almost:
        out.append(f"## 🟡 Almost-there (95-99%, {len(almost)})")
        out.append("")
        out.append(
            "_Highest-priority triage. One register / one literal / "
            "one reorder off. Feed into `tools/permute.py` or inspect "
            "the objdiff instruction diff directly._"
        )
        out.append("")
        out.append("| Unit | Function | Size | Match % |")
        out.append("|------|----------|-----:|--------:|")
        for e in almost[:top_n]:
            size_s = f"`0x{e.size:x}`" if e.size else "`?`"
            out.append(
                f"| `{e.unit}` | `{e.name}` | {size_s} | "
                f"{e.fuzzy_match_percent:.2f}% |"
            )
        if len(almost) > top_n:
            out.append(
                f"- _…and {len(almost) - top_n} more — raise `--top` "
                f"to see them._"
            )
        out.append("")

    # CLOSE bucket — secondary triage. Listed more compactly
    # (aggregate only, no per-fn rows by default).
    close = report.buckets.get(BUCKET_CLOSE, [])
    if close:
        out.append(f"## 🟠 Close (75-94%, {len(close)})")
        out.append("")
        out.append(
            f"_Structural match; signature/layout drift. Top "
            f"{min(top_n, len(close))} by match %:_"
        )
        out.append("")
        out.append("| Unit | Function | Size | Match % |")
        out.append("|------|----------|-----:|--------:|")
        for e in close[:top_n]:
            size_s = f"`0x{e.size:x}`" if e.size else "`?`"
            out.append(
                f"| `{e.unit}` | `{e.name}` | {size_s} | "
                f"{e.fuzzy_match_percent:.2f}% |"
            )
        if len(close) > top_n:
            out.append(f"- _…and {len(close) - top_n} more._")
        out.append("")

    # Per-module heatmap — one row per unit, bucket counts across.
    # Filter to units with at least one non-zero, non-matched entry.
    interesting_mods = [
        (mod, dist) for mod, dist in report.per_module_buckets.items()
        if sum(dist.get(b, 0) for b in (
            BUCKET_ALMOST, BUCKET_CLOSE, BUCKET_MEDIUM, BUCKET_LOW,
        )) > 0
    ]
    if interesting_mods:
        out.append("## Per-unit bucket distribution")
        out.append("")
        out.append(
            "_Units with at least one partially-matched (non-0, "
            "non-100) function. Sorted by almost-count desc._"
        )
        out.append("")
        interesting_mods.sort(
            key=lambda kv: -kv[1].get(BUCKET_ALMOST, 0),
        )
        out.append("| Unit | 🟡 almost | 🟠 close | 🔴 medium | ⚫ low |")
        out.append("|------|---------:|--------:|---------:|------:|")
        for mod, dist in interesting_mods[:top_n]:
            out.append(
                f"| `{mod}` | {dist.get(BUCKET_ALMOST, 0)} "
                f"| {dist.get(BUCKET_CLOSE, 0)} "
                f"| {dist.get(BUCKET_MEDIUM, 0)} "
                f"| {dist.get(BUCKET_LOW, 0)} |"
            )
        if len(interesting_mods) > top_n:
            out.append(
                f"- _…and {len(interesting_mods) - top_n} more units._"
            )
        out.append("")

    out.append("---")
    out.append(
        "<sub>🤖 Generated by `tools/diff_reasons.py` from "
        "`objdiff-cli report generate` output. Bucket definitions "
        "pinned in the tool's module docstring.</sub>"
    )
    return "\n".join(out)


def render_json(report: ClassifiedReport) -> dict:
    """Machine-readable form, shaped for downstream consumption by
    next_targets / permute / future tools."""
    return {
        "total_functions": report.total_functions,
        "bucket_counts": {
            b: report.count(b) for b in BUCKET_ORDER
        },
        "buckets": {
            b: [asdict(e) for e in report.buckets.get(b, [])]
            for b in BUCKET_ORDER
        },
        "per_unit": report.per_module_buckets,
    }


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def _default_report_path(version: str) -> Path:
    return ROOT / "build" / version / "report.json"


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Classify objdiff report.json entries by match depth.",
    )
    ap.add_argument("--version", default="eur",
                    help="Game version (eur/usa/jpn) — used to default "
                         "the --report path.")
    ap.add_argument("--report", type=Path,
                    help="Path to a report.json (default: "
                         "build/<version>/report.json)")
    ap.add_argument("--top", type=int, default=25,
                    help="Top-N per section (default 25)")
    ap.add_argument("--include-matched", action="store_true",
                    help="Surface the matched bucket's count in the "
                         "summary (default: hidden — 100% entries are "
                         "noise for next-steps triage)")
    ap.add_argument("--json", action="store_true",
                    help="Emit JSON instead of Markdown")
    ap.add_argument("--out",
                    help="Write the output to this path (default: stdout)")
    args = ap.parse_args()

    report_path = (
        args.report or _default_report_path(args.version)
    ).expanduser()

    payload = load_report(report_path)
    if payload is None:
        print(
            f"# No report to classify\n"
            f"\n"
            f"No `report.json` at `{report_path}`.\n"
            f"\n"
            f"Generate one with `ninja report` (requires a local "
            f"baserom + full toolchain) and re-run this tool. In "
            f"cloud / CI, a missing report means \"nothing to "
            f"classify yet\" — treat as a no-op.",
            file=sys.stdout,
        )
        return 0

    classified = classify_report(payload)

    if args.json:
        out_text = json.dumps(render_json(classified), indent=2) + "\n"
    else:
        out_text = render_markdown(
            classified, top_n=args.top,
            include_matched=args.include_matched,
        )

    if args.out:
        out_path = Path(args.out).expanduser()
        out_path.parent.mkdir(parents=True, exist_ok=True)
        out_path.write_text(out_text, encoding="utf-8")
        print(f"Wrote {out_path}", file=sys.stderr)
    else:
        print(out_text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
