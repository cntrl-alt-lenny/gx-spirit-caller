#!/usr/bin/env python3

"""
Generates an SVG treemap visualizing decomp progress per unit.

Reads build/<version>/report.json (objdiff-cli format) and writes
assets/progress-heatmap.svg. Each rectangle is one translation unit;
area is proportional to total bytes (code + data); fill color encodes
match percentage from red (0%) through orange/yellow to green (100%).

Run after `ninja report`:

    python tools/generate_heatmap.py --version eur
"""

import argparse
import json
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent

# Canvas
WIDTH = 1200
HEIGHT = 480
PAD = 1                  # gap between rectangles
HEADER_H = 44            # space for title bar

# Bottom progress-bar overlay. A cell's background is already tinted
# by match %, but at low percentages (1–5%) the tint is nearly
# indistinguishable from 0%. The bar shows the exact matched fraction
# so the decomper can see "something landed here" at a glance.
BAR_HEIGHT = 4           # px, at the bottom of each cell
BAR_COLOR = "#2f8a4f"    # darker green than the 100% fill
BAR_MIN_CELL_W = 28      # don't render bar on tiny cells


def as_int(v) -> int:
    return int(v) if v is not None else 0


def short_name(unit_name: str) -> str:
    """_dsd_gap@ov004_5 -> ov004; src/main/foo.c -> foo."""
    if unit_name.startswith("_dsd_gap@"):
        rest = unit_name[len("_dsd_gap@"):]
        return rest.split("_")[0]
    return unit_name.rsplit("/", 1)[-1].rsplit(".", 1)[0]


def match_pct(measures: dict) -> float:
    total = as_int(measures.get("total_code")) + as_int(measures.get("total_data"))
    matched = as_int(measures.get("matched_code")) + as_int(measures.get("matched_data"))
    return (matched / total) if total else 0.0


def color_for(pct: float) -> str:
    """Red (#d04848) -> orange -> yellow -> green (#3aa05a). Linear in HSL hue."""
    # Hue: 0 (red) at 0%, 120 (green) at 100%. Use slightly muted saturation.
    hue = 120.0 * pct
    sat = 55.0
    light = 48.0 + 6.0 * pct          # subtle brightening as % climbs
    return _hsl_to_hex(hue, sat, light)


def _hsl_to_hex(h: float, s: float, l: float) -> str:
    s /= 100.0
    l /= 100.0
    c = (1 - abs(2 * l - 1)) * s
    x = c * (1 - abs((h / 60.0) % 2 - 1))
    m = l - c / 2
    if   h < 60:  r, g, b = c, x, 0
    elif h < 120: r, g, b = x, c, 0
    elif h < 180: r, g, b = 0, c, x
    elif h < 240: r, g, b = 0, x, c
    elif h < 300: r, g, b = x, 0, c
    else:         r, g, b = c, 0, x
    rgb = [int(round((v + m) * 255)) for v in (r, g, b)]
    return "#{:02x}{:02x}{:02x}".format(*rgb)


def squarify(items, x, y, w, h):
    """
    Slice-and-dice treemap layout. items = list of (size, payload), sorted desc.
    Returns list of (x, y, w, h, payload).
    Cuts along the longer axis at each step so rectangles stay roughly squarish.
    """
    if not items:
        return []
    if len(items) == 1:
        return [(x, y, w, h, items[0][1])]

    total = sum(s for s, _ in items)
    # Take a chunk from the front whose summed area is ~half — gives a more
    # squarish first rect than peeling one at a time.
    half = total / 2.0
    acc = 0.0
    cut = 0
    for i, (s, _) in enumerate(items):
        acc += s
        cut = i + 1
        if acc >= half:
            break
    front = items[:cut]
    back = items[cut:]
    front_share = sum(s for s, _ in front) / total

    if w >= h:
        fw = w * front_share
        return (
            squarify(front, x, y, fw, h)
            + squarify(back, x + fw, y, w - fw, h)
        )
    else:
        fh = h * front_share
        return (
            squarify(front, x, y, w, fh)
            + squarify(back, x, y + fh, w, h - fh)
        )


def text_color_for_bg(hex_color: str) -> str:
    r = int(hex_color[1:3], 16)
    g = int(hex_color[3:5], 16)
    b = int(hex_color[5:7], 16)
    luminance = (0.299 * r + 0.587 * g + 0.114 * b) / 255.0
    return "#1a1a1a" if luminance > 0.55 else "#f5f5f5"


def render_svg(report: dict, version: str) -> str:
    units = list(report.get("units", []))
    # Filter empty units, attach size = total bytes.
    sized = []
    for u in units:
        m = u.get("measures", {})
        size = as_int(m.get("total_code")) + as_int(m.get("total_data"))
        if size > 0:
            sized.append((size, u))
    sized.sort(reverse=True, key=lambda t: t[0])

    rects = squarify(sized, 0, HEADER_H, WIDTH, HEIGHT - HEADER_H)

    root_m = report.get("measures", {})
    code_pct = (
        as_int(root_m.get("matched_code")) / as_int(root_m.get("total_code"))
        if as_int(root_m.get("total_code")) else 0.0
    ) * 100.0
    data_pct = (
        as_int(root_m.get("matched_data")) / as_int(root_m.get("total_data"))
        if as_int(root_m.get("total_data")) else 0.0
    ) * 100.0
    units_done = as_int(root_m.get("complete_code"))
    units_total = as_int(root_m.get("total_units"))

    out = []
    out.append(
        f'<svg xmlns="http://www.w3.org/2000/svg" '
        f'viewBox="0 0 {WIDTH} {HEIGHT}" width="{WIDTH}" height="{HEIGHT}" '
        f'role="img" aria-label="Decomp progress heatmap ({version})">'
    )
    out.append(
        '<defs><style>'
        'text { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", '
        'Roboto, Helvetica, Arial, sans-serif; }'
        '.title { font-size: 18px; font-weight: 600; fill: #f5f5f5; }'
        '.subtitle { font-size: 12px; fill: #c0c0c0; }'
        '.cell-label { font-size: 11px; font-weight: 600; }'
        '.cell-pct { font-size: 10px; }'
        '</style></defs>'
    )

    # Header bar
    out.append(f'<rect x="0" y="0" width="{WIDTH}" height="{HEADER_H}" fill="#1f2429"/>')
    out.append(
        f'<text x="14" y="22" class="title">'
        f'GX Spirit Caller — decomp progress ({version})'
        f'</text>'
    )
    out.append(
        f'<text x="14" y="38" class="subtitle">'
        f'code {code_pct:.2f}% • data {data_pct:.2f}% • '
        f'units {units_done}/{units_total} • '
        f'27 translation units sized by total bytes'
        f'</text>'
    )

    # Cells
    for x, y, w, h, unit in rects:
        m = unit.get("measures", {})
        pct = match_pct(m)
        fill = color_for(pct)
        size_bytes = as_int(m.get("total_code")) + as_int(m.get("total_data"))
        matched_bytes = as_int(m.get("matched_code")) + as_int(m.get("matched_data"))
        kb = size_bytes / 1024.0
        name = short_name(unit["name"])
        text_fill = text_color_for_bg(fill)

        cell_w = max(0.0, w - 2 * PAD)
        cell_h = max(0.0, h - 2 * PAD)
        out.append(
            f'<rect x="{x + PAD:.1f}" y="{y + PAD:.1f}" '
            f'width="{cell_w:.1f}" height="{cell_h:.1f}" '
            f'fill="{fill}" stroke="#1f2429" stroke-width="0.5">'
            f'<title>{unit["name"]} — {kb:.1f} KB — '
            f'{matched_bytes}/{size_bytes} B matched ({pct * 100:.2f}%)</title>'
            f'</rect>'
        )

        # Bottom progress bar — only render when the cell is wide
        # enough for the bar to be readable, and only when there's
        # a non-zero amount matched (so 0% cells stay clean).
        if pct > 0.0 and cell_w >= BAR_MIN_CELL_W and cell_h >= BAR_HEIGHT + 4:
            bar_w = cell_w * pct
            bar_y = y + PAD + cell_h - BAR_HEIGHT
            out.append(
                f'<rect x="{x + PAD:.1f}" y="{bar_y:.1f}" '
                f'width="{bar_w:.1f}" height="{BAR_HEIGHT}" '
                f'fill="{BAR_COLOR}" stroke="none" pointer-events="none"/>'
            )

        # Only render labels if the cell is large enough to fit them.
        if w >= 60 and h >= 28:
            cx = x + w / 2
            cy = y + h / 2
            out.append(
                f'<text x="{cx:.1f}" y="{cy - 4:.1f}" class="cell-label" '
                f'fill="{text_fill}" text-anchor="middle">{name}</text>'
            )
            out.append(
                f'<text x="{cx:.1f}" y="{cy + 9:.1f}" class="cell-pct" '
                f'fill="{text_fill}" text-anchor="middle">'
                f'{pct * 100:.1f}% · {kb:.0f} KB</text>'
            )
        elif w >= 40 and h >= 16:
            cx = x + w / 2
            cy = y + h / 2 + 4
            out.append(
                f'<text x="{cx:.1f}" y="{cy:.1f}" class="cell-label" '
                f'fill="{text_fill}" text-anchor="middle">{name}</text>'
            )

    out.append('</svg>')
    return "".join(out)


def main():
    parser = argparse.ArgumentParser(description="Generate decomp progress heatmap SVG")
    parser.add_argument("--version", default="eur", help="Version (eur/usa/jpn)")
    parser.add_argument("--report", type=Path, default=None,
                        help="Path to report.json (default: build/<version>/report.json)")
    parser.add_argument("--out", type=Path, default=None,
                        help="Path to output SVG (default: assets/progress-heatmap.svg)")
    args = parser.parse_args()

    report_path = args.report or (ROOT / "build" / args.version / "report.json")
    out_path = args.out or (ROOT / "assets" / "progress-heatmap.svg")

    if not report_path.exists():
        print(f"error: {report_path} not found — run `ninja report` first.", file=sys.stderr)
        sys.exit(1)

    with report_path.open("r", encoding="utf-8") as f:
        report = json.load(f)

    svg = render_svg(report, args.version)
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(svg, encoding="utf-8")
    print(f"wrote {out_path} ({out_path.stat().st_size} bytes, {len(report.get('units', []))} units)")


if __name__ == "__main__":
    main()
