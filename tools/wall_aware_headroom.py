#!/usr/bin/env python3
"""
wall_aware_headroom.py — TRUE readable-C headroom (walls subtracted).

The raw C% metric (progress.py) counts every not-yet-`.c` byte as "headroom",
including functions that are DOCUMENTED PERMANENT WALLS (the brief-294/302
GLOBAL_ASM-endgame reg-alloc class, C-32 cross-overlay-BL link walls, etc.).
That misled the queue refill into repeatedly seeding wall-saturated modules —
the CC Decomper burned a whole run re-confirming ov019/013/022/012/007 as 100%
walls (2026-07-21). This tool fixes the refill signal: it counts, per EUR module,
the `.s` functions that are NOT wall-marked — the genuinely convertible ones.

A `.s` file is a wall if its body carries any endgame/wall marker (GLOBAL_ASM
endgame, "brief 294"/"brief 302", "reg-alloc wall", "no C match", "C-32", "ship-
as-.s"). EUR baseline only (`src/main/`, `src/overlayNNN/` — no `src/usa|jpn/`
region ports, which aren't the readable-C frontier).

Usage:
    python3.13 tools/wall_aware_headroom.py            # per-module table
    python3.13 tools/wall_aware_headroom.py --json     # machine-readable
    python3.13 tools/wall_aware_headroom.py --min 5    # only modules with >=5 convertible
"""
from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
# EUR baseline module dirs only (region ports live under src/usa, src/jpn).
_MODULE_RE = re.compile(r"^src/(main|overlay\d+)/[^/]+\.s$")
_WALL_RE = re.compile(
    r"GLOBAL_ASM|brief[ _]?29[04]|brief[ _]?302|reg-?alloc wall|no C match|"
    r"\bC-32\b|ship-as-\.s|whole-function ship|permanent wall|endgame",
    re.I,
)


def is_wall(path: Path) -> bool:
    try:
        return bool(_WALL_RE.search(path.read_text(encoding="utf-8", errors="ignore")))
    except OSError:
        return False


def scan() -> dict[str, dict]:
    per: dict[str, dict] = {}
    for p in (ROOT / "src").rglob("*.s"):
        rel = p.relative_to(ROOT).as_posix()
        m = _MODULE_RE.match(rel)
        if not m:
            continue
        mod = m.group(1)
        d = per.setdefault(mod, {"total": 0, "wall": 0, "convertible": 0,
                                 "convertible_files": []})
        d["total"] += 1
        if is_wall(p):
            d["wall"] += 1
        else:
            d["convertible"] += 1
            d["convertible_files"].append(rel)
    return per


def main(argv: list[str]) -> int:
    ap = argparse.ArgumentParser(description="Wall-aware readable-C headroom.")
    ap.add_argument("--json", action="store_true")
    ap.add_argument("--min", type=int, default=0,
                    help="only show modules with >= this many convertible")
    args = ap.parse_args(argv[1:])
    per = scan()
    ranked = sorted(per.items(), key=lambda kv: kv[1]["convertible"], reverse=True)
    total_conv = sum(d["convertible"] for _, d in ranked)

    if args.json:
        print(json.dumps({"total_convertible": total_conv,
                          "modules": {m: {k: v for k, v in d.items()
                                          if k != "convertible_files"}
                                      for m, d in ranked}}, indent=1))
        return 0

    print(f"{'module':12} {'total.s':>8} {'wall':>6} {'convertible':>12}")
    print("-" * 40)
    for mod, d in ranked:
        if d["convertible"] < args.min:
            continue
        print(f"{mod:12} {d['total']:>8} {d['wall']:>6} {d['convertible']:>12}")
    print("-" * 40)
    print(f"TOTAL genuinely-convertible EUR .s remaining: {total_conv}")
    print("(walls subtracted; this is the real readable-C frontier, not the raw C% headroom)")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
