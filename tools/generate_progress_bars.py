#!/usr/bin/env python3

"""Combined per-region progress-bar SVG (one card, three nested bars).

Shows TWO honest metrics per region on a shared 0-100% axis:
  - decompiled-to-C   (green)  — code recovered as real C source
  - byte-matched      (teal)   — code that rebuilds byte-identical from our
    source tree, INCLUDING `.s` assembly ships
The C slice is drawn on top of (leading) the byte-matched fill, so it reads
"C is the leading slice of total coverage" at a glance — making the gap
between real decompilation and assembly-placeholder coverage explicit.

This is the top-of-README progress visual; it replaces the three full-width
per-region heatmap SVGs (each ~0.7-1.9 MB) with one ~2 KB card. The per-region
heatmaps stay available (linked / behind a <details>) for the per-unit view.

Data source: committed `config/<ver>/**/delinks.txt` (no baserom / no build).
  * byte-matched + total: generate_heatmap.synthesize_report_from_delinks
  * C-only: sum of `.text` bytes for blocks whose source file is .c/.cpp

    python tools/generate_progress_bars.py        # -> assets/progress-combined.svg
"""

import argparse
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(Path(__file__).resolve().parent))
from generate_heatmap import (  # noqa: E402
    as_int,
    synthesize_report_from_delinks,
)
# c_code_bytes is the canonical "true C-decompiled bytes" scan (brief 561,
# improvement-swarm r3 REFRAME) — lives in progress.py (the root of this
# import chain: progress <- generate_heatmap <- generate_progress_bars) so
# progress.py's own text/JSON reporter can carry the same honest 4th metric.
# c_code_total_bytes is its paired `.text`-only denominator (brief 566,
# improvement-swarm r4 A3) — c_code_bytes' numerator never counts `.init`
# even for a .c-sourced TU that owns some, so dividing by the `.text`+
# `.init` total_code below would structurally cap this ratio under 100%.
from progress import c_code_bytes_by_class, c_code_total_bytes  # noqa: E402

# (config dir name, display label, game code)
REGIONS = [("eur", "EUR", "AYXP"), ("usa", "USA", "AYXE"), ("jpn", "JPN", "AYXJ")]

WIDTH = 760
HEADER_H = 46
ROW_H = 50
LEGEND_H = 34
LABEL_X = 22
BAR_X0 = 92
BAR_X1 = 560
TEXT_X = 572
BAR_H = 16
BG = "#1f2429"
TRACK = "#3a4048"
C_COLOR = "#3fb950"        # decompiled to C (green)
MATCHED_COLOR = "#2b6cb0"  # byte-matched incl. .s (blue)


def region_metrics(version: str) -> dict:
    report = synthesize_report_from_delinks(ROOT / "config" / version)
    m = report["measures"] if report else {}
    matched, total = as_int(m.get("matched_code")), as_int(m.get("total_code"))
    config_dir = ROOT / "config" / version
    c_split = c_code_bytes_by_class(config_dir)
    c = sum(c_split.values())
    c_total = c_code_total_bytes(config_dir)
    return {
        "matched_pct": matched / total if total else 0.0,
        "c_pct": c / c_total if c_total else 0.0,
        "matched": matched,
        "c": c,
        "c_total": c_total,
        "natural_c": c_split["natural-c"],
        "asm_c": c_split["asm-c"],
        "total": total,
    }


def render() -> str:
    height = HEADER_H + ROW_H * len(REGIONS) + LEGEND_H
    bar_w = BAR_X1 - BAR_X0
    out = [
        f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {WIDTH} {height}" '
        f'width="{WIDTH}" height="{height}" role="img" '
        f'aria-label="Decomp progress by region: decompiled-to-C vs byte-matched">',
        "<defs><style>"
        'text{font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,'
        "Helvetica,Arial,sans-serif;}"
        ".title{font-size:18px;font-weight:600;fill:#f5f5f5;}"
        ".reg{font-size:14px;font-weight:700;fill:#f5f5f5;}"
        ".pct{font-size:13px;fill:#d8dde2;}"
        ".lg{font-size:12px;fill:#b9c0c7;}"
        "</style></defs>",
        f'<rect x="0" y="0" width="{WIDTH}" height="{height}" rx="8" fill="{BG}"/>',
        f'<text x="{LABEL_X}" y="29" class="title">Decompilation progress</text>',
    ]
    for i, (ver, label, _code) in enumerate(REGIONS):
        mm = region_metrics(ver)
        cy = HEADER_H + i * ROW_H + ROW_H / 2
        y = cy - BAR_H / 2
        mw = max(0.0, bar_w * mm["matched_pct"])
        cw = max(0.0, bar_w * mm["c_pct"])
        out.append(f'<text x="{LABEL_X}" y="{cy + 5:.0f}" class="reg">{label}</text>')
        out.append(
            f'<rect x="{BAR_X0}" y="{y:.0f}" width="{bar_w}" height="{BAR_H}" '
            f'rx="{BAR_H // 2}" fill="{TRACK}"/>'
        )
        if mw > 0:
            out.append(
                f'<rect x="{BAR_X0}" y="{y:.0f}" width="{mw:.1f}" height="{BAR_H}" '
                f'rx="{BAR_H // 2}" fill="{MATCHED_COLOR}"/>'
            )
        if cw > 0:
            out.append(
                f'<rect x="{BAR_X0}" y="{y:.0f}" width="{max(cw, 2.0):.1f}" '
                f'height="{BAR_H}" rx="{BAR_H // 2}" fill="{C_COLOR}"/>'
            )
        out.append(
            f'<text x="{TEXT_X}" y="{cy + 5:.0f}" class="pct">'
            f'C {mm["c_pct"] * 100:.1f}% · matched {mm["matched_pct"] * 100:.0f}%'
            f"</text>"
        )
    ly = HEADER_H + ROW_H * len(REGIONS) + 18
    out.append(
        f'<rect x="{LABEL_X}" y="{ly - 9}" width="11" height="11" rx="2" fill="{C_COLOR}"/>'
        f'<text x="{LABEL_X + 17}" y="{ly}" class="lg">decompiled to C</text>'
        f'<rect x="{LABEL_X + 150}" y="{ly - 9}" width="11" height="11" rx="2" fill="{MATCHED_COLOR}"/>'
        f'<text x="{LABEL_X + 167}" y="{ly}" class="lg">byte-matched (incl. .s assembly)</text>'
    )
    out.append("</svg>")
    return "".join(out)


def main() -> None:
    ap = argparse.ArgumentParser(
        description="Generate the combined per-region progress-bar SVG"
    )
    ap.add_argument(
        "--out", type=Path, default=ROOT / "assets" / "progress-combined.svg"
    )
    args = ap.parse_args()
    svg = render()
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(svg, encoding="utf-8")
    print(f"wrote {args.out} ({args.out.stat().st_size} bytes)")
    for ver, label, _code in REGIONS:
        mm = region_metrics(ver)
        print(
            f"  {label}: Natural-C {mm['natural_c']}/{mm['c_total']} B, "
            f"asm-C {mm['asm_c']}/{mm['c_total']} B, "
            f"C {mm['c_pct'] * 100:.1f}%  |  byte-matched "
            f"{mm['matched_pct'] * 100:.1f}%  ({mm['c']}/{mm['matched']}/{mm['total']})"
        )


if __name__ == "__main__":
    main()
