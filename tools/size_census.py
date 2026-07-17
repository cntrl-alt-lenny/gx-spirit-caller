#!/usr/bin/env python3

"""
size_census.py — bucket every UNMATCHED function by size, per module.

Brief 277 found the cold-RE knee: functions ≲ 0x100 bytes / ~25
instructions hand-match in 5-15 min (the schedule + register allocation
are forced at that size); above it they wall on mwcc reg-alloc, which the
permuter (brief 276) doesn't crack. So the strategy is: drain the small
cohort by hand, defer the big cohort to a future reg-alloc tool. This
tool sizes that harvest project-wide so the decomper knows the runway and
the drain order.

"Unmatched" is read from committed config only (no build needed): a
function in `config/<ver>/**/symbols.txt` is MATCHED iff its address
falls inside a claimed `.text` range in the sibling `delinks.txt`
(every claimed range belongs to a `src/…` unit); UNMATCHED otherwise.
This equals the set of functions dsd delinks into `_dsd_gap@*` objects.

Buckets (brief 277's knee): `<0x100` (hand-matchable now),
`0x100-0x200` (marginal), `>0x200` (needs a reg-alloc tool).

Category: analysis (worklist sizing; pairs with `m2c_feed.py`).

Usage:
    python tools/size_census.py --version eur            # full table
    python tools/size_census.py --version eur --json     # machine-readable
    python tools/size_census.py --version eur --module ov002
"""
from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
VALID_REGIONS = ("eur", "usa", "jpn")

# Brief 277 knee. (label, lo_inclusive, hi_exclusive)
BUCKETS = (
    ("<0x100", 0, 0x100),
    ("0x100-0x200", 0x100, 0x200),
    (">0x200", 0x200, 1 << 30),
)

_FUNC_RE = re.compile(
    r"^(\S+) kind:function\((?:arm|thumb),size=0x([0-9a-f]+)\) addr:0x([0-9a-f]+)"
)
# Per-TU section lines are a single space between name and `start:` (e.g.
# "    .text start:0x...  end:0x..."); the module-level section-map header
# at the top of a delinks.txt uses multiple spaces + a `kind:`/`align:`
# suffix ("    .text       start:0x... end:0x... kind:code align:32") and is
# deliberately NOT matched here — only per-TU claims count as "matched".
# CODE_SECTIONS (progress.py) = {.text, .init}: a carved TU can occupy
# either, so both must count as "claimed" or .init-resident functions are
# reported as false-positive unmatched (verified independently: 71% of
# EUR's .text-only "unmatched" count was actually .init-claimed).
_CODE_RANGE_RE = re.compile(r"^\s+\.(?:text|init) start:0x([0-9a-f]+) end:0x([0-9a-f]+)")


def bucket_of(size: int) -> str:
    for label, lo, hi in BUCKETS:
        if lo <= size < hi:
            return label
    return BUCKETS[-1][0]


def parse_functions(symbols_text: str) -> list[tuple[str, int, int]]:
    """[(name, addr, size)] for every function in a symbols.txt."""
    out = []
    for line in symbols_text.splitlines():
        m = _FUNC_RE.match(line)
        if m:
            out.append((m.group(1), int(m.group(3), 16), int(m.group(2), 16)))
    return out


def parse_claimed_text(delinks_text: str) -> list[tuple[int, int]]:
    """Claimed code (`.text` + `.init`) intervals from a delinks.txt.

    Name kept as `parse_claimed_text` for the existing import surface
    (tests/test_size_census.py) even though it now scans both
    CODE_SECTIONS members, not `.text` alone."""
    out = []
    for line in delinks_text.splitlines():
        m = _CODE_RANGE_RE.match(line)
        if m:
            out.append((int(m.group(1), 16), int(m.group(2), 16)))
    return out


def is_claimed(addr: int, intervals: list[tuple[int, int]]) -> bool:
    return any(lo <= addr < hi for lo, hi in intervals)


# --- shape score (brief 284) --------------------------------------------
# Control-flow shape predicts cold-RE tractability better than byte size
# (brief 279/281): straight-line / accessor / dispatcher shapes hand-match;
# loops + multi-value liveness wall on mwcc reg-alloc (the permuter's wall).
_BRANCH_RE = re.compile(
    r"b(?:eq|ne|lt|gt|ge|le|ls|hi|cs|cc|mi|pl|vs|vc|al)?(?:\.[wn])?\s+([0-9a-f]+)\b"
)


def shape_features(insns: list[tuple[int, str]]) -> dict:
    """Count calls / branches / loops from (addr, mnemonic) instructions.

    A loop is a BACKWARD branch (target ≤ the branch's own address) — the
    cheap, reliable signal for the liveness wall. `bl`/`bx` are excluded
    from branches (they are calls / returns, not control flow within).
    """
    calls = branches = loops = 0
    for addr, m in insns:
        if re.match(r"blx?\b", m):
            calls += 1
            continue
        if m.startswith("bx"):
            continue
        mb = _BRANCH_RE.match(m)
        if mb:
            branches += 1
            if int(mb.group(1), 16) <= addr:
                loops += 1
    return {"insns": len(insns), "calls": calls, "branches": branches, "loops": loops}


def shape_class(feats: dict) -> str:
    """`simple` / `dispatcher` (both hand-drainable) vs `permuter` (loop)."""
    if feats["loops"]:
        return "permuter"          # loop / liveness — the reg-alloc wall
    if feats["branches"] <= 3:
        return "simple"            # straight-line / accessor
    return "dispatcher"            # many branches, no loop — still hand-matches


def unmatched(funcs: list[tuple[str, int, int]],
              intervals: list[tuple[int, int]]) -> list[tuple[str, int, int]]:
    return [f for f in funcs if not is_claimed(f[1], intervals)]


def aggregate(per_module: dict[str, list[tuple[str, int, int]]]) -> dict:
    """{module: [unmatched (name,addr,size)]} → census summary."""
    modules = {}
    for mod, fns in per_module.items():
        b = {label: {"count": 0, "bytes": 0} for label, _, _ in BUCKETS}
        for _name, _addr, size in fns:
            cell = b[bucket_of(size)]
            cell["count"] += 1
            cell["bytes"] += size
        modules[mod] = {
            "buckets": b,
            "total_count": sum(c["count"] for c in b.values()),
            "total_bytes": sum(c["bytes"] for c in b.values()),
            "small_count": b["<0x100"]["count"],
            "small_bytes": b["<0x100"]["bytes"],
        }
    totals = {label: {"count": 0, "bytes": 0} for label, _, _ in BUCKETS}
    for m in modules.values():
        for label, _, _ in BUCKETS:
            totals[label]["count"] += m["buckets"][label]["count"]
            totals[label]["bytes"] += m["buckets"][label]["bytes"]
    ranking = sorted(modules.items(), key=lambda kv: -kv[1]["small_count"])
    return {"modules": modules, "totals": totals,
            "ranking": [m for m, _ in ranking]}


def _module_paths(version: str):
    base = ROOT / f"config/{version}"
    yield "main", base / "arm9/symbols.txt", base / "arm9/delinks.txt"
    # ITCM/DTCM are separate delink-tier modules (their own symbols.txt +
    # delinks.txt under arm9/), previously never yielded here: DTCM carries
    # no kind:function entries in any region (data-only, harmless to
    # include), but ITCM does (14/region) and was silently excluded from
    # every census — verified independently: 11 EUR / 14 USA / 14 JPN of
    # those are still unmatched.
    yield "itcm", base / "arm9/itcm/symbols.txt", base / "arm9/itcm/delinks.txt"
    yield "dtcm", base / "arm9/dtcm/symbols.txt", base / "arm9/dtcm/delinks.txt"
    for d in sorted((base / "arm9/overlays").glob("ov*")):
        yield d.name, d / "symbols.txt", d / "delinks.txt"


def collect(version: str, only: str | None = None) -> dict[str, list[tuple[str, int, int]]]:
    per_module = {}
    for mod, sym, dl in _module_paths(version):
        if only and mod != only:
            continue
        if not sym.is_file():
            continue
        funcs = parse_functions(sym.read_text())
        intervals = parse_claimed_text(dl.read_text()) if dl.is_file() else []
        per_module[mod] = unmatched(funcs, intervals)
    return per_module


def collect_shapes(version: str, module: str, objdump: str = "arm-none-eabi-objdump") -> dict:
    """Shape-class the module's UNMATCHED functions from the delinked gap
    objects. Build-dependent (needs `build/<ver>/delinks` + objdump) — the
    shape needs instructions, unlike the byte-free size census. Returns
    {func: {**shape_features, "class": …, "size": …}}.
    """
    import subprocess
    delinks = ROOT / f"build/{version}/delinks"
    unm = {n: s for n, _, s in collect(version, module).get(module, [])}
    out = {}
    cur = None
    for obj in sorted(delinks.glob(f"_dsd_gap@{module}_*.o")):
        dis = subprocess.run([objdump, "-d", "--architecture=armv5te", str(obj)],
                             capture_output=True, text=True).stdout
        for line in dis.splitlines():
            h = re.match(r"^[0-9a-f]+ <(func_\S+)>:", line)
            if h:
                cur = h.group(1) if h.group(1) in unm and h.group(1) not in out else None
                if cur:
                    out[cur] = []
                continue
            if cur is None:
                continue
            mi = re.match(r"^\s+([0-9a-f]+):\t[0-9a-f ]{8,}\t(\S.*)", line)
            if mi:
                out[cur].append((int(mi.group(1), 16), mi.group(2).strip()))
    result = {}
    for fn, insns in out.items():
        feats = shape_features(insns)
        result[fn] = {**feats, "class": shape_class(feats), "size": unm.get(fn, 0)}
    return result


def render(summary: dict) -> str:
    lines = []
    t = summary["totals"]
    lines.append("Unmatched functions by size bucket (brief 277 knee):\n")
    hdr = f"{'module':<8} {'<0x100':>14} {'0x100-0x200':>16} {'>0x200':>16} {'total':>14}"
    lines.append(hdr)
    lines.append("-" * len(hdr))

    def cell(c):
        return f"{c['count']:>5} / {c['bytes']:#08x}"

    for mod in summary["ranking"]:
        m = summary["modules"][mod]
        b = m["buckets"]
        lines.append(
            f"{mod:<8} {cell(b['<0x100']):>14} {cell(b['0x100-0x200']):>16} "
            f"{cell(b['>0x200']):>16} {m['total_count']:>5} / {m['total_bytes']:#08x}"
        )
    lines.append("-" * len(hdr))
    lines.append(
        f"{'TOTAL':<8} {cell(t['<0x100']):>14} {cell(t['0x100-0x200']):>16} "
        f"{cell(t['>0x200']):>16}"
    )
    lines.append("")
    lines.append(
        f"Hand-matchable runway (<0x100): {t['<0x100']['count']} funcs, "
        f"{t['<0x100']['bytes']:#x} bytes. Drain order (richest <0x100 vein first): "
        + ", ".join(summary["ranking"][:8])
    )
    return "\n".join(lines) + "\n"


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description="Size-bucket unmatched functions per module.")
    ap.add_argument("--version", default="eur", choices=VALID_REGIONS)
    ap.add_argument("--module", default=None, help="restrict to one module (e.g. ov002)")
    ap.add_argument("--json", action="store_true", help="machine-readable output")
    ap.add_argument("--shape", action="store_true",
                    help="shape-class unmatched funcs (needs --module + a built "
                         "build/<ver>/delinks; simple/dispatcher = hand-drainable, "
                         "permuter = loop)")
    args = ap.parse_args(argv)

    if args.shape:
        if not args.module:
            print("error: --shape requires --module (e.g. --module ov002)", file=sys.stderr)
            return 1
        shapes = collect_shapes(args.version, args.module)
        if not shapes:
            print(f"error: no shapes for {args.module} (run `ninja` to build "
                  f"build/{args.version}/delinks first?)", file=sys.stderr)
            return 1
        if args.json:
            print(json.dumps(shapes, indent=2))
        else:
            dist = {}
            for v in shapes.values():
                dist[v["class"]] = dist.get(v["class"], 0) + 1
            hand = dist.get("simple", 0) + dist.get("dispatcher", 0)
            print(f"{args.module} unmatched shapes ({len(shapes)} funcs):")
            for cls in ("simple", "dispatcher", "permuter"):
                print(f"  {cls:11s} {dist.get(cls, 0):5d}")
            print(f"  {'hand-drainable':11s} {hand:5d}  (simple+dispatcher)")
        return 0

    per_module = collect(args.version, args.module)
    if not per_module:
        print(f"error: no config under config/{args.version} (wrong region?)", file=sys.stderr)
        return 1
    summary = aggregate(per_module)
    if args.json:
        print(json.dumps(summary, indent=2))
    else:
        sys.stdout.write(render(summary))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
