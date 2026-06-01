#!/usr/bin/env python3.13
"""asm_escape.py — generate a byte-exact `.s` escape hatch for a function
that mwcc compiles byte-identical-EXCEPT one commutative-operand-order
instruction (brief 290; the wall proven in brief 288).

The class: an accessor where `idx*20` is CSE'd (shared between the +0x30
`f30` read and a parallel `cf1a4`/`cf1a2` read), so mwcc canonicalises the
row-pointer add `cf16c + player*0x868 + idx*20` to put the CSE temp first
(`add ACC, idx20`) where the original puts the accumulator first. No C
form or permuter run reaches it (brief 288); only an `.s` does.

Pipeline (build-dependent, --version's build/ must exist):

    byte-near C  --mwcc-->  my.o  --objdump-->  my instrs
    delinked .o  --objdump-->  orig instrs
    diff -> classify: every divergence MUST be a commutative-operand swap
            (same op + dest, source operands a permutation); else REFUSE
            (it is a real mismatch — fix it in C, not here).
    emit mwasmarm .s from the ORIGINAL instructions (byte-exact by
            construction; the swap is "corrected" because we emit orig's
            operand order), in the project's `.s` syntax.
    assemble with mwasmarm + byte-verify the .o against the delinked orig.

The decomper ships the emitted `.s` (this tool does not commit it).

The PURE helpers (parse_objdump / to_mwasm / hex_imm / classify_fixes /
emit_asm) are unit-tested in tests/test_asm_escape.py with no build.
"""
from __future__ import annotations

import argparse
import os
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ARCH = "armv5te"
COMMUTATIVE = {"add", "and", "orr", "eor", "mul"}
CONDS = {"eq", "ne", "cs", "cc", "mi", "pl", "vs", "vc", "hi", "ls",
         "ge", "lt", "gt", "le", "al", "hs", "lo"}

# mwcc / mwasm invocations mirror the build.ninja `mwcc` + `mwasm` rules.
_CFLAGS = ("-O4,p -enum int -char signed -str noreuse -proc arm946e -gccext,on "
           "-fp soft -inline noauto -Cpp_exceptions off -RTTI off -interworking "
           "-w off -sym on -gccinc -nolink -msgstyle gcc -i include "
           "-i libs/runtime/include -i libs/nitro/include -lang=c").split()
_MWCC = "tools/mwccarm/2.0/sp1p5/mwccarm.exe"
_MWASM = "tools/mwccarm/2.0/sp1p5/mwasmarm.exe"


# ----------------------------------------------------------------------- pure

def parse_objdump(text: str, func: str) -> list[dict]:
    """Parse `objdump -d -r` output for one function into a list of words.

    Each entry: {addr, bytes (8 hex), mnem (normalised), reloc (symbol|None)}.
    Captures both instructions and literal-pool words; a reloc on the
    following line is attached to the word it relocates.
    """
    out: list[dict] = []
    cur = False
    for line in text.splitlines():
        if re.match(rf"^[0-9a-f]+ <{re.escape(func)}>:", line):
            cur = True
            continue
        if cur and re.match(r"^[0-9a-f]+ <func_", line):  # next function only
            break
        if not cur:
            continue
        mi = re.match(r"^\s+([0-9a-f]+):\t([0-9a-f]{8})(?:\s+(.*))?$", line)
        if mi:
            mn = mi.group(3) or ""
            mn = re.sub(r"\s*[@;].*$", "", mn)      # drop objdump comments
            mn = re.sub(r"\s*<[^>]*>", "", mn)      # drop <symbol+0x..> annot
            mn = re.sub(r"\s+", " ", mn).strip()
            out.append({"addr": int(mi.group(1), 16), "bytes": mi.group(2),
                        "mnem": mn, "reloc": None})
            continue
        rl = re.search(r"R_ARM_\S+\s+(\S+)", line)
        if rl and out:
            out[-1]["reloc"] = re.sub(r"[+-]0x[0-9a-f]+$", "", rl.group(1))
    return out


def hex_imm(mn: str) -> str:
    """mwasmarm wants hex immediates: `#20` -> `#0x14`."""
    return re.sub(r"#(\d+)\b", lambda m: f"#0x{int(m.group(1)):x}", mn)


def to_mwasm(mn: str) -> str:
    """Convert objdump ARM (UAL) syntax to the project's mwasmarm `.s` dialect.

    Covers the shapes both wave-9 generators handled (brief 292 consolidation):
    push/pop(+cond) -> stmdb/ldmia; lsl/lsr/asr/ror(+s)(+cond) -> the
    mov/movs(+cond) rD, rM, <shift> #imm form mwasmarm expects.
    """
    m = re.match(r"push\s+(\{.*\})$", mn)
    if m:
        return "stmdb sp!, " + m.group(1)
    m = re.match(r"pop([a-z]{2})?\s+(\{.*\})$", mn)
    if m:
        cc = m.group(1) if m.group(1) in CONDS else ""
        return f"ldm{cc}ia sp!, {m.group(2)}"
    # shift mnemonics (+ optional s flag, + optional condition) ->
    # mov/movs(+cond) rD, rM, <shift> #imm  (legacy mwasm form)
    m = re.match(r"(lsl|lsr|asr|ror)(s)?([a-z]{2})?\s+(\w+), (\w+), (#?\w+)$", mn)
    if m:
        sh, sflag, cc = m.group(1), m.group(2) or "", m.group(3) or ""
        if cc and cc not in CONDS:
            return mn          # not a condition we recognise — leave as-is
        mov = "movs" if sflag else "mov"
        return f"{mov}{cc} {m.group(4)}, {m.group(5)}, {sh} {m.group(6)}"
    return mn


def _operands(mnem: str) -> tuple[str, list[str]]:
    parts = mnem.split(None, 1)
    op = parts[0]
    args = [a.strip() for a in parts[1].split(",")] if len(parts) > 1 else []
    return op, args


def is_commutative_swap(my_mn: str, orig_mn: str) -> bool:
    """True iff the two differ ONLY by swapped commutative source operands:
    same op + destination, source operands a permutation of each other."""
    om, oa = _operands(my_mn)
    oo, ob = _operands(orig_mn)
    base = re.sub(r"(eq|ne|lt|gt|ge|le|ls|hi|cs|cc|mi|pl|vs|vc|s)$", "", om)
    if om != oo or base not in COMMUTATIVE:
        return False
    if len(oa) != len(ob) or len(oa) < 3:
        return False
    return oa[0] == ob[0] and oa[1:] != ob[1:] and sorted(oa[1:]) == sorted(ob[1:])


def pool_addrs(instrs: list[dict]) -> set[int]:
    """Addresses of literal-pool words = the targets of `ldr rX, [pc, #N]`.
    Robust across objdump renderings (orig delinked words decode as raw
    data / ASCII, my mwasm words as `.word`); the ldr target is invariant."""
    pool = set()
    for w in instrs:
        m = re.search(r"\[pc, #(\d+)\]", w["mnem"])
        if m:
            pool.add(w["addr"] + 8 + int(m.group(1)))
    return pool


def classify_fixes(mine: list[dict], orig: list[dict]) -> tuple[list[tuple], list[str]]:
    """Return (fixes, refusals). A fix is (index, my_mnem, orig_mnem) for a
    commutative-operand-order divergence. `refusals` lists any divergence
    that is NOT a clean swap — if non-empty, the caller MUST refuse (the
    function is not a canonicalisation hatch; fix it in C)."""
    fixes, refusals = [], []
    pm, po = pool_addrs(mine), pool_addrs(orig)
    code_m = [w for w in mine if w["addr"] not in pm]
    code_o = [w for w in orig if w["addr"] not in po]
    if len(code_m) != len(code_o):
        refusals.append(f"instruction count differs: C={len(code_m)} orig={len(code_o)}")
        return fixes, refusals
    for i, (a, b) in enumerate(zip(code_m, code_o, strict=False)):
        if a["reloc"] and b["reloc"]:
            if a["reloc"] != b["reloc"]:
                refusals.append(f"[{i}] reloc target {a['reloc']} vs {b['reloc']}")
            continue
        if a["bytes"] == b["bytes"]:
            continue
        if is_commutative_swap(a["mnem"], b["mnem"]):
            fixes.append((i, a["mnem"], b["mnem"]))
        else:
            refusals.append(f"[{i}] non-canonicalisation diff: '{a['mnem']}' vs '{b['mnem']}'")
    return fixes, refusals


def emit_asm(func: str, orig: list[dict], fixes: list[tuple]) -> str:
    """Emit the mwasmarm `.s` from the ORIGINAL instruction stream (byte-exact;
    the commutative fix is already in orig's operand order). Pool words become
    explicit `.word` slots referenced by `_LITn` labels."""
    lit: dict[int, str] = {}
    for w in orig:
        m = re.search(r"\[pc, #(\d+)\]", w["mnem"])
        if m:
            lit[w["addr"] + 8 + int(m.group(1))] = ""
    for i, a in enumerate(sorted(lit)):
        lit[a] = f"_LIT{i}"
    externs = sorted({w["reloc"] for w in orig if w["reloc"]})

    head = [f"; {func} — .s escape hatch (brief 290): mwcc is byte-identical except",
            "; the commutative add-operand order below (a CSE'd-temp wall, brief 288)."]
    for idx, my_mn, orig_mn in fixes:
        head.append(f";   fix [{idx}]: C emits `{my_mn}`; original is `{orig_mn}`.")
    head += ["", "        .text"]
    head += [f"        .extern {e}" for e in externs]
    head += [f"        .global {func}", "        .arm", f"{func}:"]

    body, pool = [], []
    for w in orig:
        if w["addr"] in lit:
            val = w["reloc"] if w["reloc"] else f"0x{int(w['bytes'], 16):08x}"
            pool.append(f"{lit[w['addr']]}: .word {val}")
            continue
        mn = to_mwasm(w["mnem"])
        pm = re.search(r"\[pc, #(\d+)\]", mn)
        if pm:
            mn = re.sub(r"\[pc, #\d+\]", lit[w["addr"] + 8 + int(pm.group(1))], mn)
        # external call/branch (b / bl / blx, PC24 reloc) -> use the symbol;
        # internal (conditional) branches carry no reloc and keep their target.
        bm = re.match(r"(bl|blx|b)(\S*)\s", mn)
        if bm and w["reloc"]:
            mn = f"{bm.group(1)}{bm.group(2)} {w['reloc']}"
        body.append("    " + hex_imm(mn))
    return "\n".join(head + body + pool) + "\n"


# ------------------------------------------------------------- build-dependent

def _run(cmd, **kw):
    return subprocess.run(cmd, capture_output=True, text=True, cwd=ROOT, **kw)


def disasm(obj: str) -> str:
    p = obj if os.path.isabs(obj) else str(ROOT / obj)
    return _run(["arm-none-eabi-objdump", "-d", "-r", f"--architecture={ARCH}", p]).stdout


def gap_object(version: str, func: str) -> str | None:
    """The delinked gap .o that defines `func` (build/<ver>/delinks)."""
    import glob
    delinks = ROOT / f"build/{version}/delinks"
    defre = re.compile(rf"F \.text\s+[0-9a-f]+ {re.escape(func)}\b")
    for o in sorted(glob.glob(str(delinks / "_dsd_gap@*.o"))):
        if defre.search(_run(["arm-none-eabi-objdump", "-t", o]).stdout):
            return o
    return None


def compile_c(c_file: str, version: str, out: str) -> bool:
    if os.path.exists(out):
        os.remove(out)
    _run(["wine", _MWCC, *_CFLAGS, "-d", version, "-c", os.path.abspath(c_file), "-o", out])
    return os.path.exists(out)


def assemble(s_file: str, out: str) -> bool:
    if os.path.exists(out):
        os.remove(out)
    _run(["wine", _MWASM, "-proc", "arm5TE", "-msgstyle", "gcc", "-g", "-o", out, s_file])
    return os.path.exists(out)


def bytes_match(a_obj: str, orig_obj: str, func: str) -> tuple[bool, list[str]]:
    """Byte-compare `func` in two objects, reloc words (bl/pool) modulo."""
    a = parse_objdump(disasm(a_obj), func)
    o = parse_objdump(disasm(orig_obj), func)
    diffs = []
    for i, (x, y) in enumerate(zip(a, o, strict=False)):
        if x["reloc"] and y["reloc"]:
            if x["reloc"] != y["reloc"]:
                diffs.append(f"[{i}] reloc {x['reloc']} vs {y['reloc']}")
            continue
        if x["reloc"] != y["reloc"] or x["bytes"] != y["bytes"]:
            # tolerate the trailing pool-word rendering difference (a reloc'd
            # word vs a literal); only flag a real code-byte mismatch.
            if x["mnem"].startswith(".word") or y["mnem"].startswith(".word") \
               or not x["mnem"] or not y["mnem"]:
                continue
            diffs.append(f"[{i}] {x['bytes']}({x['mnem']}) vs {y['bytes']}({y['mnem']})")
    return (not diffs), diffs


def generate(func: str, c_file: str, version: str, out: str | None) -> int:
    tmp = ROOT / "build" / "_asm_escape"
    tmp.mkdir(parents=True, exist_ok=True)
    my_o, asm_o = str(tmp / f"{func}.o"), str(tmp / f"{func}.asm.o")

    if not compile_c(c_file, version, my_o):
        print(f"error: {c_file} did not compile", file=sys.stderr)
        return 2
    orig_obj = gap_object(version, func)
    if not orig_obj:
        print(f"error: {func} not found in build/{version}/delinks "
              f"(already matched, or run `ninja` first?)", file=sys.stderr)
        return 2

    mine = parse_objdump(disasm(my_o), func)
    orig = parse_objdump(disasm(orig_obj), func)
    fixes, refusals = classify_fixes(mine, orig)
    if refusals:
        print(f"REFUSE {func}: not a pure canonicalisation hatch — fix in C:")
        for r in refusals:
            print("   ", r)
        return 1
    if not fixes:
        print(f"{func}: C is already byte-identical — no `.s` needed.")
        return 0

    s = emit_asm(func, orig, fixes)
    out_path = out or str(tmp / f"{func}.s")
    Path(out_path).write_text(s, encoding="utf-8")

    if not assemble(out_path, asm_o):
        print(f"error: emitted {out_path} did not assemble", file=sys.stderr)
        return 2
    ok, diffs = bytes_match(asm_o, orig_obj, func)
    if ok:
        print(f"{func}: ✅ .s byte-identical vs delinked .o "
              f"({len(fixes)} fix) -> {out_path}")
        return 0
    print(f"{func}: ❌ emitted .s did NOT verify:")
    for d in diffs[:8]:
        print("   ", d)
    return 1


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(
        description="Generate a byte-exact .s escape hatch from byte-near C "
                    "(commutative-operand-order canonicalisation wall).")
    ap.add_argument("function", help="func_ov002_XXXX")
    ap.add_argument("--c", required=True, help="byte-near C source for the function")
    ap.add_argument("--version", default="eur")
    ap.add_argument("--out", default=None, help="output .s path (default: build/_asm_escape/)")
    args = ap.parse_args(argv)
    return generate(args.function, args.c, args.version, args.out)


if __name__ == "__main__":
    raise SystemExit(main())
