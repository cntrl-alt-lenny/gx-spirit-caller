#!/usr/bin/env python3.13
"""verify.py — byte-compare a compiled function against its dsd-delinked gap
object. The scaffolder's direct-mwcc per-pick gate (EUR objdiff 100%); the
brain reproduces the 3-region SHA1 on merge.

THE .L_ SPAN FIX (brief 349/351 — the reason this lives in tools/ now).
dsd splits each delinked function at its INTERNAL labels — `.L_xxxxxxxx` for
default-blocks, switch tails, and const pools — emitting them as separate
symbols in the gap object. A naive comparator that stops at the next
`<symbol>:` header captures only the FIRST sub-block of the original (e.g. 6 of
10 words) and reports a false count-mismatch DIFF against a whole-function `.o`.
Two wave-1 picks (`0201f0f4`, `0203402c`) were byte-identical all along but read
as near-misses until this was fixed. `parse_words` spans `.L_*` continuations so
whole-function matches read true. Keep it.

DUAL-COMPILE (brief 351). main (arm9) carries Style-A / legacy-codegen cohorts;
a near-miss under default mwcc 2.0 often matches under 1.2/sp2p3 (`.legacy.c`,
Style-A `pop {regs,lr};bx lr` + predicated guard-bodies) or 1.2/sp3
(`.legacy_sp3.c`, `sub sp,#4` prologue + Style-B `pop {pc}`). `--cc all` tries
every tier and reports which (if any) lands 100%.

The pure core (parse_words / strip_pool_tail / compare_words) is unit-tested in
tests/test_verify.py on synthetic objdump text — no wine/objdump, runs in CI.

Usage:
    tools/verify.py <cfile> <func> [--cc 2.0|legacy|sp3|all] [--module main]
                                   [--gap <gap_object.o>]
"""
from __future__ import annotations

import argparse
import glob
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# mwcc tiers — keep in sync with build.ninja rules mwcc / mwcc_legacy /
# mwcc_legacy_sp3 (they share every flag but the compiler binary).
_COMPILERS = {
    "2.0": "tools/mwccarm/2.0/sp1p5/mwccarm.exe",
    "legacy": "tools/mwccarm/1.2/sp2p3/mwccarm.exe",
    "sp3": "tools/mwccarm/1.2/sp3/mwccarm.exe",
}
_CFLAGS = (
    "-O4,p -enum int -char signed -str noreuse -proc arm946e -gccext,on "
    "-fp soft -inline noauto -Cpp_exceptions off -RTTI off -interworking "
    "-w off -sym on -gccinc -nolink -msgstyle gcc -i include "
    "-i libs/runtime/include -i libs/nitro/include -lang=c -d eur"
).split()

_HDR = re.compile(r"^[0-9a-f]+ <(\S+)>:")
_INSN = re.compile(r"^\s+([0-9a-f]+):\s+([0-9a-f]{8})\s")
_RELOC = re.compile(r"^\s+([0-9a-f]+):\s+R_ARM")


def parse_words(objdump_text: str, func: str) -> list[tuple[str, bool]]:
    """Return [(word_hex, is_reloc), ...] for `func` in `arm-none-eabi-objdump
    -d -r` output, SPANNING internal `.L_*` sublabels (the gap-object split).

    Once we enter `func`, keep accumulating across any subsequent header whose
    name starts with `.L` (an internal continuation); stop only at the next
    real function header.
    """
    words: list[list] = []
    relocs: set[int] = set()
    capturing = False
    for line in objdump_text.splitlines():
        m = _HDR.match(line)
        if m:
            name = m.group(1)
            if name == func:
                capturing = True
                words, relocs = [], set()
                continue
            if capturing and name.startswith(".L"):
                continue  # internal sublabel — span it
            if capturing:
                break  # next real function
            continue
        if not capturing:
            continue
        mi = _INSN.match(line)
        if mi:
            words.append([int(mi.group(1), 16), mi.group(2)])
            continue
        mr = _RELOC.match(line)
        if mr:
            relocs.add(int(mr.group(1), 16))
    return [(w, off in relocs) for off, w in words]


def strip_pool_tail(words: list[tuple[str, bool]]) -> list[tuple[str, bool]]:
    """Drop trailing const-pool words (reloc'd or all-zero) from both sides so
    the comparison is over code, not link-filled pool slots."""
    out = list(words)
    while out and (out[-1][1] or out[-1][0] == "00000000"):
        out = out[:-1]
    return out


def compare_words(
    mine: list[tuple[str, bool]], orig: list[tuple[str, bool]]
) -> tuple[bool, list[tuple[int, str, str]]]:
    """Compare two word lists; reloc'd words on either side are wildcards.
    Returns (is_match, diffs) where diffs is [(index, mine_hex, orig_hex), ...]."""
    m2, o2 = strip_pool_tail(mine), strip_pool_tail(orig)
    diffs: list[tuple[int, str, str]] = []
    for i in range(max(len(m2), len(o2))):
        mw = m2[i] if i < len(m2) else None
        ow = o2[i] if i < len(o2) else None
        if mw and ow and (mw[1] or ow[1]):
            continue  # reloc'd -> wildcard
        a = mw[0] if mw else "None"
        b = ow[0] if ow else "None"
        if a != b:
            diffs.append((i, a, b))
    return (not diffs and len(m2) == len(o2)), diffs


# ---- CLI (shells out to wine/objdump; not exercised in CI) ----


def _objdump(obj: str) -> str:
    return subprocess.run(
        ["arm-none-eabi-objdump", "-d", "-r", "--architecture=armv5te", obj],
        capture_output=True, text=True, cwd=ROOT,
    ).stdout


def _find_gap(func: str, module: str) -> str | None:
    for obj in sorted(glob.glob(
        os.path.join(ROOT, f"build/eur/delinks/_dsd_gap@{module}_*.o")
    )):
        out = subprocess.run(
            ["arm-none-eabi-objdump", "-t", obj], capture_output=True, text=True
        ).stdout
        if re.search(rf"\sF\s+\.text\s+[0-9a-f]+\s+{re.escape(func)}$", out, re.M):
            return obj
    return None


def _compile(cfile: str, out_o: str, tier: str) -> bool:
    env = {**os.environ, "WINEDEBUG": "-all", "MVK_CONFIG_LOG_LEVEL": "0"}
    subprocess.run(
        ["wine", _COMPILERS[tier], *_CFLAGS, "-c", cfile, "-o", out_o],
        capture_output=True, text=True, cwd=ROOT, env=env,
    )
    return os.path.exists(out_o)


def _verify_one(cfile: str, func: str, tier: str, gap: str) -> tuple[bool, str]:
    out_o = f"/tmp/_verify_{func}.o"
    if os.path.exists(out_o):
        os.remove(out_o)
    if not _compile(cfile, out_o, tier):
        return False, f"{func}: COMPILE FAILED ({tier})"
    mine = parse_words(_objdump(out_o), func)
    orig = parse_words(_objdump(gap), func)
    ok, diffs = compare_words(mine, orig)
    if ok:
        return True, f"{func}: OBJDIFF 100% ({tier}, {len(mine)} insns)"
    lines = [f"{func}: DIFF {len(strip_pool_tail(mine))}v{len(strip_pool_tail(orig))} ({tier})"]
    lines += [f"    [{i}] {a}/{b}" for i, a, b in diffs[:12]]
    return False, "\n".join(lines)


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("cfile")
    ap.add_argument("func")
    ap.add_argument("--cc", default="2.0", choices=[*_COMPILERS, "all"])
    ap.add_argument("--module", default="main")
    ap.add_argument("--gap", help="gap object path (else auto-located)")
    a = ap.parse_args(argv)
    gap = a.gap or _find_gap(a.func, a.module)
    if not gap:
        print(f"{a.func}: NOT-IN-GAP (already matched/absent)")
        return 2
    tiers = list(_COMPILERS) if a.cc == "all" else [a.cc]
    for tier in tiers:
        ok, msg = _verify_one(a.cfile, a.func, tier, gap)
        if ok:
            print(msg)
            return 0
        if a.cc != "all":
            print(msg)
            return 1
    print(f"{a.func}: WALL (no tier matched: {', '.join(tiers)})")
    return 1


if __name__ == "__main__":
    sys.exit(main())
