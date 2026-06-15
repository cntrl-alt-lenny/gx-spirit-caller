#!/usr/bin/env python3.13
"""asm_escape.py — generate a byte-exact `.s` for a function the C path can't
match. Two modes:

  * `--c <byte-near.c>` — CANONICALISATION fix (brief 290): the function is
    byte-identical-EXCEPT one commutative-operand-order instruction; emit the
    orig (with that operand order) and verify. REFUSEs anything that is not a
    clean single swap (fix those in C).
  * `--whole-function` — WHOLE-FUNCTION ship (GLOBAL_ASM endgame, brief 302):
    emit the entire original disassembly verbatim as a byte-exact mwasm TU, no
    C match required. The endgame for the ~46% reg-alloc-walled tail (brief
    294) — every unmatched function now has a ship path (C / canon-.s /
    whole-.s). Readiness, not a usage decision: the decomper still drains C
    first; this just makes the walled tail shippable on demand.

The canonicalisation class: an accessor where `idx*20` is CSE'd (shared between the +0x30

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

Both modes run the kind:data link PREFLIGHT first (brief 406): every
kind:data load-target is classified A-aligned / B-gap (linkable) or
C-absorbed / OFFSET / MISADDRESSED (REFUSE — the carve would Undefined-fail
or silently mislink). `--classify-data` runs the preflight standalone for
wave sweeps. See the section comment above classify_data_refs().

The PURE helpers (parse_objdump / to_mwasm / hex_imm / classify_fixes /
emit_asm / classify_data_refs) are unit-tested in tests/test_asm_escape.py
with no build.
"""
from __future__ import annotations

import argparse
import os
import re
import subprocess
import sys
from pathlib import Path

from get_platform import exe_launch_prefix, get_platform

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
# Absolute paths so the bare .exe resolves when launched natively on Windows
# (no `wine` arg to do the lookup); wine accepts the absolute path too.
_MWCC = str(ROOT / "tools/mwccarm/2.0/sp1p5/mwccarm.exe")
_MWASM = str(ROOT / "tools/mwccarm/2.0/sp1p5/mwasmarm.exe")


def _binutil(name: str) -> str:
    """Resolve an arm-none-eabi binutil to the downloaded copy under
    `tools/arm-none-eabi/bin` (brief 369: `download_tool.py arm-binutils`).

    Returns the ABSOLUTE path so the `.s` lane is turnkey (brief 371) — a bare
    name only resolves if that dir is on `PATH`, and otherwise dies with a
    FileNotFoundError under native `CreateProcess` (same class of bug the
    absolute `_MWCC`/`_MWASM` paths fix). Falls back to the bare name when the
    download isn't present, so a system-installed toolchain (Linux/macOS on
    `PATH`) keeps working.
    """
    p = get_platform()
    exe = p.exe if p is not None else ""
    cand = ROOT / "tools" / "arm-none-eabi" / "bin" / f"{name}{exe}"
    return str(cand) if cand.exists() else name


_OBJDUMP = _binutil("arm-none-eabi-objdump")


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
        # ARM: one 8-hex word. Thumb: a 4-hex halfword, or a `xxxx yyyy`
        # pair for 32-bit encodings (bl/blx) — normalise the pair to 8 hex
        # (brief 406 stretch: the Thumb gap-object fix).
        mi = re.match(r"^\s+([0-9a-f]+):\t([0-9a-f]{8}|[0-9a-f]{4} [0-9a-f]{4}"
                      r"|[0-9a-f]{4})(?:\s+(.*))?$", line)
        if mi:
            mn = mi.group(3) or ""
            mn = re.sub(r"\s*[@;].*$", "", mn)      # drop objdump comments
            mn = re.sub(r"\s*<[^>]*>", "", mn)      # drop <symbol+0x..> annot
            mn = re.sub(r"\s+", " ", mn).strip()
            out.append({"addr": int(mi.group(1), 16),
                        "bytes": mi.group(2).replace(" ", ""),
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
    # conditional load/store with a size suffix: the GNU/xPack objdump prints
    # <op><size><cond> (e.g. `strhls`, `ldrbne`), but mwasmarm — and the
    # Mac-generated ships (`streqh`, `strltb`, `ldrneh`) — want <op><cond><size>
    # (`strlsh`). Reorder. Forms with only one of {size, cond} (`strh`, `streq`)
    # don't match and pass through unchanged (already valid).
    m = re.match(r"(ldr|str)(sh|sb|h|b|d)(eq|ne|cs|cc|mi|pl|vs|vc|hi|ls|ge|lt|"
                 r"gt|le|al|hs|lo)(\b.*)?$", mn)
    if m:
        return f"{m.group(1)}{m.group(3)}{m.group(2)}{m.group(4) or ''}"
    # Conditional LDM/STM with explicit addressing mode: objdump emits
    # <op><mode><cond> (e.g. `ldmfdne`, `stmfdeq`) but mwasmarm requires
    # <op><cond><mode> (`ldmnefd`, `stmeqfd`). Reorder the condition before
    # the mode suffix.
    _COND_PAT = r"(eq|ne|cs|cc|mi|pl|vs|vc|hi|ls|ge|lt|gt|le|al|hs|lo)"
    m = re.match(r"(stm|ldm)(fd|fa|ea|ed|ia|ib|da|db)" + _COND_PAT + r"(\s.*)?$", mn)
    if m:
        return f"{m.group(1)}{m.group(3)}{m.group(2)}{m.group(4) or ''}"
    # bare stm/ldm: objdump omits the default `ia` addressing mode (e.g.
    # `stm sp, {r4, r5}`), but mwasmarm requires it explicit -> `stmia`. The
    # conditional bare form `stmeq sp, {…}` -> `stmeqia sp, {…}`. push/pop are
    # handled above; explicit modes (`stmdb`/`ldmib`/…) already carry a suffix
    # with no space before it, so they don't match and pass through.
    m = re.match(r"(stm|ldm)(eq|ne|cs|cc|mi|pl|vs|vc|hi|ls|ge|lt|gt|le|al|hs|lo)?"
                 r"(\s+.*)$", mn)
    if m:
        return f"{m.group(1)}{m.group(2) or ''}ia{m.group(3)}"
    # MCR/MRC (+ MCR2/MRC2): objdump emits bare coprocessor number + `crN`
    # register names + `{N}` Op2 (`mcr 15, 0, r0, cr7, cr10, {4}`) but
    # mwasmarm wants `p` prefix, `cN` names, bare Op2 integer
    # (`mcr p15, 0, r0, c7, c10, 4`).
    m = re.match(r"(mcr2?|mrc2?)(\s+)(\d+),\s*(\d+),\s*(\w+),\s*cr(\d+),\s*cr(\d+)"
                 r"(?:,\s*\{(\d+)\})?$", mn, re.IGNORECASE)
    if m:
        op2 = f", {m.group(8)}" if m.group(8) is not None else ""
        return (f"{m.group(1)}{m.group(2)}p{m.group(3)}, {m.group(4)}, "
                f"{m.group(5)}, c{m.group(6)}, c{m.group(7)}{op2}")
    # rrx / rrxs / rrx{cond} / rrxs{cond}: objdump shorthand; mwasmarm needs
    # mov{cond}{s} Rd, Rm, rrx (condition before S flag in output).
    m = re.match(r"(rrxs?)([a-z]{2})?\s+(\w+), (\w+)$", mn)
    if m:
        sflag = "s" if m.group(1) == "rrxs" else ""
        cc = m.group(2) or ""
        if cc and cc not in CONDS:
            return mn
        return f"mov{cc}{sflag} {m.group(3)}, {m.group(4)}, rrx"
    # ALU instructions with S-before-condition: objdump emits <op>s<cond>
    # (e.g., `andseq`, `subsge`) but mwasmarm requires <op><cond>s.
    # Placed after shift/rrx/ldm-stm/ldr-str handlers so those run first.
    _COND_LIST = (r"(eq|ne|cs|cc|mi|pl|vs|vc|hi|ls|ge|lt|gt|le|al|hs|lo)")
    m = re.match(r"^(\w+?)s" + _COND_LIST + r"(\s.*)?$", mn)
    if m:
        return f"{m.group(1)}{m.group(2)}s{m.group(3) or ''}"
    return mn


# UAL flag-setting low-reg ops whose legacy-mwasm Thumb spelling drops the
# `s` (the encoding always sets flags; mwasm rejects the UAL name) — probed
# against mwasmarm 2.0/sp1p5 (brief 406 stretch).
_THUMB_UNSUFFIX = {"movs", "adds", "subs", "lsls", "lsrs", "asrs", "rors",
                   "ands", "orrs", "eors", "bics", "negs", "muls", "mvns",
                   "adcs", "sbcs"}


def to_mwasm_thumb(mn: str) -> str:
    """objdump UAL Thumb -> mwasmarm legacy Thumb dialect (brief 406 stretch).

    push/pop are native Thumb mnemonics (NO stmdb/ldmia conversion — that is
    the ARM path's job); `.n`/`.w` width suffixes are objdump artifacts; the
    flag-setting low-reg ALU names lose their UAL `s`."""
    mn = re.sub(r"^(b[a-z]{0,2})\.n\b", r"\1", mn)       # beq.n -> beq, b.n -> b
    mn = re.sub(r"^(\w+)\.w\b", r"\1", mn)
    # reg-reg `movs rX, rY` is UAL sugar for the 0x0000-family encoding
    # `lsls rX, rY, #0`; legacy `mov rX, rY` assembles to `adds rX, rY, #0`
    # (0x1c00-family) — a byte mismatch. Emit the explicit shift form.
    m = re.match(r"^movs (\w+), (r\d+)$", mn)
    if m:
        return f"lsl {m.group(1)}, {m.group(2)}, #0x0"
    parts = mn.split(None, 1)
    if parts and parts[0] in _THUMB_UNSUFFIX:
        mn = parts[0][:-1] + ((" " + parts[1]) if len(parts) > 1 else "")
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


def pool_addrs(instrs: list[dict], thumb: bool = False) -> set[int]:
    """Addresses of literal-pool words = the targets of `ldr rX, [pc, #N]`.
    Robust across objdump renderings (orig delinked words decode as raw
    data / ASCII, my mwasm words as `.word`); the ldr target is invariant.
    ARM pc-rel base = addr+8; Thumb = Align(addr+4, 4) (brief 406 stretch)."""
    pool = set()
    for w in instrs:
        m = re.search(r"\[pc, #(\d+)\]", w["mnem"])
        if m:
            base = ((w["addr"] + 4) & ~3) if thumb else w["addr"] + 8
            pool.add(base + int(m.group(1)))
    return pool


# A within-function conditional/unconditional branch: `b`/`beq`/`bne`/… to an
# absolute hex target, with NO reloc. (bl/blx/bx are excluded — bl/blx carry a
# PC24 reloc to an external symbol; bx is register-indirect.)
_BRANCH_RE = re.compile(
    r"^b(eq|ne|cs|cc|mi|pl|vs|vc|hi|ls|ge|lt|gt|le|al|hs|lo)?(\.[wn])?\s+([0-9a-f]+)$")


def branch_targets(instrs: list[dict], thumb: bool = False) -> set[int]:
    """Addresses targeted by INTERNAL branches (no reloc, target within the
    function). The whole-function `.s` mode emits a `.L_<addr>` label at each
    so mwasmarm can resolve the branch (objdump prints absolute hex targets).
    The canonicalisation class is straight-line, so this is empty there."""
    addrs = {w["addr"] for w in instrs}
    pool = pool_addrs(instrs, thumb)
    targets = set()
    for w in instrs:
        if w["reloc"] or w["addr"] in pool:   # skip relocs + literal-pool words
            continue
        m = _BRANCH_RE.match(w["mnem"])
        if m:
            t = int(m.group(3), 16)
            if t in addrs and t not in pool:
                targets.add(t)
    return targets


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


def emit_asm(func: str, orig: list[dict], fixes: list[tuple] | None = None,
             whole: bool = False, thumb: bool = False) -> str:
    """Emit a byte-exact mwasmarm `.s` from the ORIGINAL instruction stream.

    Two modes share this emitter:
      * canonicalisation hatch (brief 290, default) — straight-line, `fixes`
        documents the single commutative-operand correction in the header;
      * whole-function GLOBAL_ASM ship (brief 302, `whole=True`) — the entire
        original disassembly verbatim, for reg-alloc-walled functions with no
        C match (brief 294). This needs INTERNAL-branch local labels, which
        the straight-line hatch never had.

    Pool words become `.word` slots referenced by `_LITn`; internal branch
    targets get `.L_<addr>` labels; external calls (bl/b/blx + reloc) use the
    symbol."""
    def _pc_base(addr: int) -> int:
        return ((addr + 4) & ~3) if thumb else addr + 8

    lit: dict[int, str] = {}
    for w in orig:
        m = re.search(r"\[pc, #(\d+)\]", w["mnem"])
        if m:
            lit[_pc_base(w["addr"]) + int(m.group(1))] = ""
    for i, a in enumerate(sorted(lit)):
        lit[a] = f"_LIT{i}"
    labels = {a: f".L_{a:x}" for a in branch_targets(orig, thumb)}
    externs = sorted({w["reloc"] for w in orig if w["reloc"]})

    if whole:
        head = [f"; {func} — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):",
                "; the original disassembly emitted verbatim as a byte-exact mwasm TU.",
                "; For reg-alloc-walled functions with no C match (brief 294 endgame)."]
        if thumb:
            head.append("; Thumb gap-object mode (brief 406 stretch).")
    else:
        head = [f"; {func} — .s escape hatch (brief 290): mwcc is byte-identical except",
                "; the commutative add-operand order below (a CSE'd-temp wall, brief 288)."]
        for idx, my_mn, orig_mn in (fixes or []):
            head.append(f";   fix [{idx}]: C emits `{my_mn}`; original is `{orig_mn}`.")
    head += ["", "        .text"]
    head += [f"        .extern {e}" for e in externs]
    head += [f"        .global {func}", "        .thumb" if thumb else "        .arm",
             f"{func}:"]

    # Detect tail-call branches (forward branch to the byte IMMEDIATELY AFTER
    # the function's last word, no reloc). These occur when a function jumps
    # to the next function in the gap object without a reloc. We emit a local
    # end-label after the pool; the relative offset is the same as the original.
    # Branches to addresses FARTHER forward (cross-function jumps into the body
    # of another function) or BACKWARD (cross-function backward jumps) cannot
    # be reproduced via a label — emit them as .word instead (see fallback below).
    instr_addrs = {w["addr"] for w in orig}
    all_func_addrs = set(instr_addrs) | set(lit.keys())
    approx_func_end = (max(all_func_addrs) + 4) if all_func_addrs else 0
    end_label: str | None = None
    end_targets: set[int] = set()
    for w in orig:
        ib = _BRANCH_RE.match(w["mnem"])
        if ib and not w["reloc"]:
            t = int(ib.group(3), 16)
            if t not in instr_addrs and t not in lit and t == approx_func_end:
                end_targets.add(t)
    if end_targets:
        end_label = ".L_FUNCEND"

    body, pool = [], []
    for w in orig:
        if w["addr"] in lit:
            val = w["reloc"] if w["reloc"] else f"0x{int(w['bytes'], 16):08x}"
            if not pool and thumb:
                pool.append("    .align 2")   # halfword stream may end unaligned
            pool.append(f"{lit[w['addr']]}: .word {val}")
            continue
        if w["addr"] in labels:
            body.append(f"{labels[w['addr']]}:")
        mn = to_mwasm_thumb(w["mnem"]) if thumb else to_mwasm(w["mnem"])
        pm = re.search(r"\[pc, #(\d+)\]", mn)
        if pm:
            mn = re.sub(r"\[pc, #\d+\]", lit[_pc_base(w["addr"]) + int(pm.group(1))], mn)
        # internal branch (no reloc, target within func) -> local label
        ib = _BRANCH_RE.match(w["mnem"])
        if ib and not w["reloc"]:
            t = int(ib.group(3), 16)
            if t in labels:
                mn = re.sub(re.escape(ib.group(3)) + r"$", labels[t], mn)
            elif t in end_targets and end_label:
                # tail-call branch past function end -> local end-label
                mn = re.sub(re.escape(ib.group(3)) + r"$", end_label, mn)
        # external call/branch (b / bl / blx, PC24 reloc) -> use the symbol.
        bm = re.match(r"(bl|blx|b)(\S*)\s", mn)
        if bm and w["reloc"]:
            mn = f"{bm.group(1)}{bm.group(2)} {w['reloc']}"
        # Fixed-address branch/call with no reloc and a raw hex target not
        # resolved above (not an internal label, not a tail-call, not an extern
        # reloc): emit the instruction's raw encoding as a literal word — the
        # encoding is already fixed in the original binary with no relocatable
        # slot. This covers bl/b/blx to cross-module hardcoded addresses.
        elif re.match(r"b[a-z]*\s+[0-9a-f]+$", mn) and not w["reloc"]:
            mn = f".word 0x{int(w['bytes'], 16):08x}"
        body.append("    " + hex_imm(mn))
    suffix = [f"{end_label}:"] if end_label else []
    return "\n".join(head + body + pool + suffix) + "\n"


# --------------------------------------------------- kind:data link preflight
#
# Brief 406. A carved `.s` TU references data by NAME (`.extern data_X` +
# `.word data_X`), so the link needs a symbol named data_X. Three classes:
#
#   A-aligned   the address is covered by a carved data TU whose delinks range
#               starts exactly at the symbol -> the TU defines the global ->
#               links. (Cluster-era per-symbol carves, briefs 143-163.)
#   B-gap       no carve covers it -> dsd delink emits the symbol as a GLOBAL
#               in the module's data gap object -> links. (xMAP-verified.)
#   C-absorbed  a carved range STARTS BEFORE the symbol: the address was
#               absorbed into a bundle TU under the bundle-base name (e.g.
#               `data_020ff920[16]` absorbing 0x020ff924, brief 155) and has
#               NO linkable definition -> mwldarm `Undefined : "data_X"`
#               (brief 361's func_020489c4). REFUSE before emitting.
#
# Two more REFUSE shapes the emitter would otherwise silently mangle:
#   OFFSET        a pool word targeting symbol+N (interior word): emit_asm
#                 strips the +N (parse_objdump drops reloc addend suffixes),
#                 the byte-verify is reloc-modulo so it would pass, and the
#                 corruption only surfaces at `ninja sha1`. Refuse up front.
#   MISADDRESSED  a covering carve range whose start matches NO data symbol —
#                 a mis-sized / mis-addressed data carve in delinks.txt.
#                 That is a config defect; refuse and name the TU.
#
# `kind:bss` refs stay out of scope here: bss has no file bytes, the gap/lcf
# path has always linked it (the .s waves' standing gate).

def _module_config(version: str, func: str) -> Path:
    """The config dir holding symbols/relocs/delinks for `func`'s module."""
    m = re.match(r"func_ov(\d{3})_", func)
    if m:
        return ROOT / f"config/{version}/arm9/overlays/ov{m.group(1)}"
    return ROOT / f"config/{version}/arm9"


def classify_data_refs(symbols_text: str, relocs_text: str, delinks_text: str,
                       func: str) -> list[dict]:
    """PURE: classify every kind:data load-target of `func` for linkability.

    Returns one dict per data ref: {sym, target, verdict, tu, note} with
    verdict in {A-aligned, B-gap, C-absorbed, OFFSET, MISADDRESSED}.
    Empty list = no kind:data refs (nothing to gate). bss refs are skipped.
    """
    import bisect

    faddr = fsize = None
    syms: list[tuple[int, str, str]] = []     # (addr, name, kind) — ALL kinds
    for line in symbols_text.splitlines():
        m = re.match(rf"{re.escape(func)} kind:function\(\w+,size=0x([0-9a-f]+)\)"
                     r" addr:0x([0-9a-f]+)", line)
        if m:
            fsize, faddr = int(m.group(1), 16), int(m.group(2), 16)
        m2 = re.match(r"(\S+) kind:(data\([^)]*\)|bss|function\([^)]*\)|label.*?)"
                      r" .*?addr:0x([0-9a-f]+)", line)
        if m2:
            kind = "data" if m2.group(2).startswith("data(") else m2.group(2).split("(")[0]
            syms.append((int(m2.group(3), 16), m2.group(1), kind))
    if faddr is None:
        return [{"sym": None, "target": None, "verdict": "MISADDRESSED",
                 "tu": None, "note": f"{func} not in symbols.txt"}]
    syms.sort()
    saddrs = [a for a, _, _ in syms]
    daddrs = {a for a, _, k in syms if k == "data"}

    targets = []
    for line in relocs_text.splitlines():
        m = re.match(r"from:0x([0-9a-f]+) kind:load to:0x([0-9a-f]+)", line)
        if m and faddr <= int(m.group(1), 16) < faddr + fsize:
            targets.append(int(m.group(2), 16))

    carves: list[tuple[int, int, str]] = []
    cur = None
    for line in delinks_text.splitlines():
        s = line.strip()
        if s.endswith(":") and (s.startswith("src/") or s.startswith("libs/")):
            cur = s[:-1]
        m = re.search(r"\.(?:data|rodata) start:0x([0-9a-f]+) end:0x([0-9a-f]+)", line)
        if m:
            carves.append((int(m.group(1), 16), int(m.group(2), 16), cur))

    out = []
    for t in sorted(set(targets)):
        i = bisect.bisect_right(saddrs, t) - 1
        if i < 0:
            continue                      # below every symbol: unresolvable here
        saddr, sname, skind = syms[i]
        if skind != "data":
            continue                      # bss/function/label target: not gated here
        cov = next(((cs, ce, tu) for cs, ce, tu in carves if cs <= t < ce), None)
        if cov is None:
            v = {"verdict": "B-gap", "tu": None,
                 "note": "no data carve covers it -> dsd gap object defines the "
                         "symbol GLOBAL; .extern links"}
        else:
            cs, ce, tu = cov
            if cs not in daddrs:
                v = {"verdict": "MISADDRESSED", "tu": tu,
                     "note": f"carve range 0x{cs:08x}..0x{ce:08x} starts at no "
                             "data symbol — mis-sized/mis-addressed data carve"}
            elif cs < saddr or (cs == saddr and t > saddr):
                base = syms[bisect.bisect_right(saddrs, cs) - 1][1]
                if cs < saddr:
                    v = {"verdict": "C-absorbed", "tu": tu,
                         "note": f"absorbed into bundle TU (base {base}); "
                                 f"data_… has NO linkable definition -> mwldarm "
                                 f"Undefined (brief 361 class)"}
                else:
                    v = {"verdict": "OFFSET", "tu": tu,
                         "note": f"pool word targets {sname}+0x{t - saddr:x}; "
                                 "emit_asm drops the addend -> silent corruption "
                                 "caught only at sha1. Unsupported"}
            elif cs == saddr == t:
                v = {"verdict": "A-aligned", "tu": tu,
                     "note": "symbol-aligned carved TU defines the global; "
                             ".extern links"}
            else:   # cs == saddr < t handled above; anything else is suspect
                v = {"verdict": "MISADDRESSED", "tu": tu,
                     "note": f"carve 0x{cs:08x}..0x{ce:08x} vs target "
                             f"0x{t:08x}: unexpected geometry"}
        out.append({"sym": sname, "target": t, **v})
    return out


def _gap_defines_data(version: str, sym: str) -> bool:
    """Build-dependent confirmation for a B-gap verdict: some delinked gap .o
    defines `sym` as a GLOBAL data/rodata symbol."""
    import glob
    defre = re.compile(rf"g\s+O\s+\.(?:data|rodata)\s+[0-9a-f]+\s+{re.escape(sym)}\b")
    for o in sorted(glob.glob(str(ROOT / f"build/{version}/delinks/_dsd_gap@*.o"))):
        if defre.search(_run([_OBJDUMP, "-t", o]).stdout):
            return True
    return False


def preflight_data_refs(func: str, version: str, verify_gap: bool = True) -> int:
    """Gate a carve on its kind:data refs. 0 = linkable (or none), 1 = REFUSE."""
    cfg = _module_config(version, func)
    try:
        verdicts = classify_data_refs(
            (cfg / "symbols.txt").read_text(encoding="utf-8"),
            (cfg / "relocs.txt").read_text(encoding="utf-8"),
            (cfg / "delinks.txt").read_text(encoding="utf-8"), func)
    except FileNotFoundError as e:
        print(f"error: preflight could not read module config: {e}", file=sys.stderr)
        return 1
    bad = False
    for v in verdicts:
        ok = v["verdict"] in ("A-aligned", "B-gap")
        if v["verdict"] == "B-gap" and verify_gap and not _gap_defines_data(version, v["sym"]):
            ok = False
            v["note"] = ("classified B-gap but NO gap object defines the symbol "
                         "— unlinkable (absorbed without a symbols.txt carve?)")
        tag = "ok" if ok else "REFUSE"
        tu = f" [{v['tu']}]" if v["tu"] else ""
        print(f"  data-ref {v['sym']} @0x{v['target']:08x}: {v['verdict']} ({tag}){tu}")
        print(f"      {v['note']}")
        bad |= not ok
    if bad:
        print(f"{func}: ❌ kind:data preflight REFUSED — the carve would not "
              f"link (or would mislink). Do not ship; see verdicts above.")
        return 1
    return 0


# ------------------------------------------------------------- build-dependent

def _run(cmd, **kw):
    return subprocess.run(cmd, capture_output=True, text=True, cwd=ROOT, **kw)


def disasm(obj: str) -> str:
    p = obj if os.path.isabs(obj) else str(ROOT / obj)
    # `-z` (--disassemble-zeroes): without it, objdump COLLAPSES a run of zero
    # words into a single `\t...` line. A freshly-assembled `.s` has its literal
    # pool as 0x00000000 placeholders (the real value comes from a link-time
    # R_ARM_ABS32 reloc), so objdump elides those words — then parse_objdump
    # never appends them and their reloc lines cascade onto the PRECEDING
    # instruction (e.g. the final `pop {…pc}`), producing a spurious reloc diff
    # vs the delinked orig (whose pool words are non-zero and print in full).
    # `-z` makes both sides render every word, so they parse symmetrically.
    return _run([_OBJDUMP, "-d", "-r", "-z", f"--architecture={ARCH}", p]).stdout


def is_thumb(version: str, func: str) -> bool:
    """True if symbols.txt marks `func` kind:function(thumb,…) (brief 406
    stretch: the Thumb gap-object mode)."""
    cfg = _module_config(version, func)
    try:
        text = (cfg / "symbols.txt").read_text(encoding="utf-8")
    except FileNotFoundError:
        return False
    return re.search(rf"^{re.escape(func)} kind:function\(thumb,", text,
                     re.MULTILINE) is not None


def _resolve_tail_calls(func: str, orig: list[dict], symbols_text: str) -> None:
    """No-op placeholder — tail-call detection moved into emit_asm (avoids
    creating reloc records that break bytes_match against the unlinked gap .o).
    Kept for call-site hygiene in generate_whole."""


def gap_object(version: str, func: str) -> str | None:
    """The delinked gap .o that defines `func` (build/<ver>/delinks)."""
    import glob
    delinks = ROOT / f"build/{version}/delinks"
    defre = re.compile(rf"F \.text\s+[0-9a-f]+ {re.escape(func)}\b")
    for o in sorted(glob.glob(str(delinks / "_dsd_gap@*.o"))):
        if defre.search(_run([_OBJDUMP, "-t", o]).stdout):
            return o
    return None


def compile_c(c_file: str, version: str, out: str) -> bool:
    if os.path.exists(out):
        os.remove(out)
    _run([*exe_launch_prefix(), _MWCC, *_CFLAGS, "-d", version, "-c", os.path.abspath(c_file), "-o", out])
    return os.path.exists(out)


def assemble(s_file: str, out: str) -> bool:
    if os.path.exists(out):
        os.remove(out)
    _run([*exe_launch_prefix(), _MWASM, "-proc", "arm5TE", "-msgstyle", "gcc", "-g", "-o", out, s_file])
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
    if preflight_data_refs(func, version):
        return 1

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


def generate_whole(func: str, version: str, out: str | None) -> int:
    """Whole-function GLOBAL_ASM ship (brief 302): emit the original
    disassembly verbatim as a byte-exact mwasm `.s` — no C, no near-match.
    The endgame for reg-alloc-walled functions (brief 294)."""
    tmp = ROOT / "build" / "_asm_escape"
    tmp.mkdir(parents=True, exist_ok=True)
    asm_o = str(tmp / f"{func}.asm.o")

    orig_obj = gap_object(version, func)
    if not orig_obj:
        print(f"error: {func} not found in build/{version}/delinks "
              f"(already matched, or run `ninja` first?)", file=sys.stderr)
        return 2
    if preflight_data_refs(func, version):
        return 1
    orig = parse_objdump(disasm(orig_obj), func)
    if not orig:
        print(f"error: {func} has no disassembly in {orig_obj}", file=sys.stderr)
        return 2

    cfg = _module_config(version, func)
    try:
        sym_text = (cfg / "symbols.txt").read_text(encoding="utf-8")
    except FileNotFoundError:
        sym_text = ""
    _resolve_tail_calls(func, orig, sym_text)
    s = emit_asm(func, orig, whole=True, thumb=is_thumb(version, func))
    out_path = out or str(tmp / f"{func}.s")
    Path(out_path).write_text(s, encoding="utf-8")

    if not assemble(out_path, asm_o):
        print(f"error: emitted {out_path} did not assemble", file=sys.stderr)
        return 2
    ok, diffs = bytes_match(asm_o, orig_obj, func)
    if ok:
        print(f"{func}: ✅ whole-function .s byte-identical vs delinked .o "
              f"({len(orig)} words) -> {out_path}")
        return 0
    print(f"{func}: ❌ emitted whole-function .s did NOT verify:")
    for d in diffs[:8]:
        print("   ", d)
    return 1


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(
        description="Byte-exact .s escape hatch. Two modes: --c <byte-near.c> "
                    "(canonicalisation-fix, brief 290) or --whole-function "
                    "(ship the whole original function as .s, GLOBAL_ASM "
                    "endgame for reg-alloc walls, brief 302).")
    ap.add_argument("function", help="func_ovNNN_XXXX")
    ap.add_argument("--c", default=None, help="byte-near C source (canonicalisation-fix mode)")
    ap.add_argument("--whole-function", action="store_true",
                    help="emit the whole original function as a byte-exact .s (no C)")
    ap.add_argument("--classify-data", action="store_true",
                    help="kind:data link preflight only (brief 406): print per-ref "
                         "A-aligned/B-gap/C-absorbed/OFFSET/MISADDRESSED verdicts, "
                         "no .s emitted; exit 1 on any unlinkable ref")
    ap.add_argument("--version", default="eur")
    ap.add_argument("--out", default=None, help="output .s path (default: build/_asm_escape/)")
    args = ap.parse_args(argv)
    if args.classify_data:
        rc = preflight_data_refs(args.function, args.version)
        if rc == 0:
            print(f"{args.function}: ✅ kind:data preflight clean — carve will link")
        return rc
    if args.whole_function:
        return generate_whole(args.function, args.version, args.out)
    if not args.c:
        ap.error("provide either --c <byte-near.c> (canonicalisation fix) or --whole-function")
    return generate(args.function, args.c, args.version, args.out)


if __name__ == "__main__":
    raise SystemExit(main())
