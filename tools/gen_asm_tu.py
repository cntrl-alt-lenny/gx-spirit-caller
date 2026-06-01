#!/usr/bin/env python3
"""gen_asm_tu.py — convert a m2c_feed GAS dump of an orig function into a
mwasmarm-assemblable .s translation unit (the brief-290 ".s escape hatch").

For residue functions that compile byte-identical to the orig except a
single mwcc-invariant instruction (gotcha-19 add-order / reg-numbering;
brief 288: no C lever), shipping the orig disassembly verbatim as a .s TU
is the byte-exact route (precedent func_ov002_021ff3bc.s, brief 207).

Reads m2c_feed GAS (UAL syntax) and emits the mwasm TU:
  * .extern per external symbol, .global, .arm
  * pool loads `ldr rX, =sym` -> `ldr rX, .Lpool_n` + trailing `.word`
  * UAL -> old-ARM: push/pop(+cond) -> stmdb/ldmia; lsl/lsr/asr(+s,+cond)
    -> mov/movs rD, rS, <shift> #n  (the mwasmarm dialect, per precedent)
"""
import re
import sys

CONDS = {"eq", "ne", "cs", "cc", "mi", "pl", "vs", "vc", "hi", "ls",
         "ge", "lt", "gt", "le", "al", "hs", "lo"}


def xlate(ln: str):
    """Return (translated_line, pool_value_or_None)."""
    m = re.match(r"(\s*)([a-z]+)(\s+.*)?$", ln)
    if not m:
        return ln, None
    ind, op, rest = m.group(1), m.group(2), (m.group(3) or "")
    rest = rest.strip()

    # pool load: ldr{cond} rX, =val
    pm = re.match(r"ldr(\w*)\s+(\w+),\s*=(\S+)$", op + " " + rest)
    if pm:
        return None, None  # handled by caller (needs pool index)

    # push/pop (+ optional condition)
    mm = re.match(r"(push|pop)([a-z]{2})?$", op)
    if mm:
        base, cc = mm.group(1), mm.group(2) or ""
        if cc and cc not in CONDS:
            cc = ""
        if base == "push":
            return f"{ind}stm{cc}db sp!, {rest}", None
        return f"{ind}ldm{cc}ia sp!, {rest}", None

    # lsl/lsr/asr (+ optional s) (+ optional cond) -> mov/movs rD, rS, <sh> #n
    sm = re.match(r"(lsl|lsr|asr)(s)?([a-z]{2})?$", op)
    if sm:
        sh, sflag, cc = sm.group(1), sm.group(2) or "", sm.group(3) or ""
        if cc and cc not in CONDS:
            cc = ""
        mov = "movs" if sflag else "mov"
        return f"{ind}{mov}{cc} {rest.split(',')[0]},{rest.split(',', 1)[1].rsplit(',', 1)[0]}, {sh} {rest.rsplit(',', 1)[1].strip()}", None
    return ln, None


def convert(gas: str) -> str:
    lines = gas.splitlines()
    fn = None
    body = []
    for ln in lines:
        m = re.match(r"\s*\.globl\s+(\S+)", ln)
        if m:
            fn = m.group(1)
            continue
        if re.match(r"\s*\.(text|align|type|size|globl)\b", ln):
            continue
        if fn and re.match(rf"\s*{re.escape(fn)}:", ln):
            continue
        if ln.strip():
            body.append(ln.rstrip())
    if fn is None:
        raise SystemExit("no .globl function found")

    pool, externs, out = [], [], []
    for ln in body:
        pm = re.match(r"(\s*)ldr(\w*)\s+(\w+),\s*=(\S+)", ln)
        if pm:
            ind, cc, reg, val = pm.groups()
            if val not in pool:
                pool.append(val)
            out.append(f"{ind}ldr{cc} {reg}, .L{fn}_p{pool.index(val)}")
            if not re.match(r"0x[0-9a-fA-F]+$|\d+$", val) and val not in externs:
                externs.append(val)
            continue
        cm = re.match(r"\s*(?:bl|blx|b)\s+(func\w+)", ln)
        if cm and cm.group(1) not in externs:
            externs.append(cm.group(1))
        tl, _ = xlate(ln)
        out.append(tl)

    o = ["        .text"]
    o += [f"        .extern {e}" for e in externs]
    o += [f"        .global {fn}", "        .arm", f"{fn}:"]
    o += out
    o += [f".L{fn}_p{i}: .word {v}" for i, v in enumerate(pool)]
    return "\n".join(o) + "\n"


if __name__ == "__main__":
    src = open(sys.argv[1]).read() if len(sys.argv) > 1 else sys.stdin.read()
    sys.stdout.write(convert(src))
