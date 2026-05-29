#!/usr/bin/env python3.13
"""Emit a candidate `.legacy.c` stub for a StyleA c94 5-arg helper-family
pick from its disassembly (brief 264, stretch goal).

The `func_02094c94` family is the largest regular shape in the over-fire
StyleA-real tier: a wrapper that tail-calls
`func_02094c94(CODE, a0, a1, 0, 0)` (r0=CODE, r1=a0, r2=a1, r3=0,
[sp]=0) and returns. Three arg-shapes, all from one source pattern:

    1-arg:  void f(int a0)         { func_02094c94(CODE, a0, 0, 0, 0); }
    no-arg: void f(void)           { func_02094c94(CODE, -1, 0, 0, 0); }
    2-arg:  void f(int a0, int a1) { func_02094c94(CODE, a0, a1, 0, 0); }

Brief 264 validated all three byte-identical on `.legacy.c` (mwcc
1.2/sp2p3). This emitter reads a pick's disasm, classifies the
arg-shape + extracts the CODE literal, and prints the `.legacy.c`
source — generating files with Python avoids the zsh word-splitting
trap brief 263 hit.

This is a HINT generator: it never ships, and the output must still be
compiled + `ninja sha1`-gated like any pick. It recognizes ONLY the
exact c94 shape and returns None otherwise (no guessing).

Usage:
    # from a gap-object disassembly piped in:
    arm-none-eabi-objdump -d --architecture=armv5te OBJ.o \\
        | python3.13 tools/stylea_c94_stub.py --func func_02094cec
"""
from __future__ import annotations

import argparse
import re
import sys

HELPER = "func_02094c94"


def _imm(mnemonic: str) -> int | None:
    """Decode the `#N` immediate from a `mov rX, #N` mnemonic."""
    m = re.search(r"#(-?\d+|0x[0-9a-f]+)", mnemonic)
    if not m:
        return None
    return int(m.group(1), 0)


def classify_c94(insns: list[str]) -> dict | None:
    """Classify a c94-family wrapper from its instruction mnemonics.

    Returns {"code": int, "shape": "1arg"|"noarg"|"2arg"} or None if the
    function is not the exact c94 5-arg-helper shape (a `bl func_02094c94`
    with the r0=CODE / r1=a0 / r2=a1 / r3=0 / str [sp] setup).
    """
    if not any(re.search(rf"\bbl\b.*\b{HELPER}\b", i) for i in insns):
        return None
    # The 5th arg is a stack store; required for the shape.
    if not any(re.search(r"\bstr\b\s+\w+,\s*\[sp\]", i) for i in insns):
        return None

    code = None
    a0_neg1 = False
    a0_from_arg = False  # `mov r1, r0`  -> a0 is the incoming first arg
    a1_from_arg = False  # `mov r2, r1`  -> a1 is the incoming second arg
    for i in insns:
        if re.search(r"\bmov\b\s+r0,\s*#", i):
            code = _imm(i)
        elif re.search(r"\bmvn\b\s+r1,\s*#0\b", i):
            a0_neg1 = True
        elif re.search(r"\bmov\b\s+r1,\s*r0\b", i):
            a0_from_arg = True
        elif re.search(r"\bmov\b\s+r2,\s*r1\b", i):
            a1_from_arg = True
    if code is None:
        return None

    if a1_from_arg and a0_from_arg:
        shape = "2arg"
    elif a0_neg1:
        shape = "noarg"
    elif a0_from_arg:
        shape = "1arg"
    else:
        return None
    return {"code": code, "shape": shape}


def emit_stub(func_name: str, info: dict) -> str:
    """Render the `.legacy.c` source for a classified c94 pick."""
    code = info["code"]
    shape = info["shape"]
    sig = {
        "1arg": "int a0",
        "noarg": "void",
        "2arg": "int a0, int a1",
    }[shape]
    args = {
        "1arg": f"{code}, a0, 0, 0, 0",
        "noarg": f"{code}, -1, 0, 0, 0",
        "2arg": f"{code}, a0, a1, 0, 0",
    }[shape]
    return (
        f"/* {func_name} — StyleA c94 family ({shape}); "
        f"ship as src/.../{func_name}.legacy.c */\n"
        f"extern int {HELPER}("
        "int code, int a0, int a1, int z3, int z4);\n\n"
        f"void {func_name}({sig}) {{\n"
        f"    {HELPER}({args});\n"
        "}\n"
    )


def _insns_for_func(disasm: str, func: str) -> list[str]:
    """Slice the mnemonic lines of `func` out of an objdump dump."""
    out: list[str] = []
    capturing = False
    for line in disasm.splitlines():
        h = re.match(r"^[0-9a-f]+ <(\S+)>:", line)
        if h:
            name = h.group(1)
            if name.startswith(".L"):
                continue  # internal label: keep accumulating
            capturing = name == func
            continue
        if not capturing:
            continue
        m = re.search(r":\t[0-9a-f]{8} \t(.*)", line)
        if m:
            out.append(m.group(1).strip())
    return out


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--func", required=True, help="function symbol, e.g. func_02094cec")
    ap.add_argument(
        "--disasm", help="disassembly file (default: stdin)",
    )
    args = ap.parse_args(argv)
    text = open(args.disasm).read() if args.disasm else sys.stdin.read()
    insns = _insns_for_func(text, args.func)
    if not insns:
        print(f"// {args.func}: not found in disasm", file=sys.stderr)
        return 2
    info = classify_c94(insns)
    if info is None:
        print(f"// {args.func}: not a c94 5-arg-helper shape", file=sys.stderr)
        return 1
    sys.stdout.write(emit_stub(args.func, info))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
