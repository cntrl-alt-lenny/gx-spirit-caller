#!/usr/bin/env python3

"""
build_struct_bank.py — mine field width/signedness/bitfield shape for one
`data_*` symbol from the delinked disassembly, and emit a canonical typed
struct (brief 609 / r7-1 prototype).

m2c --context (brief 555) is wired but starved: ov002_core.h has 16 real
structs serving 3,777 functions, so drafts emit `*(int*)(base+0xNN)`
instead of named fields. Field TYPE is match-critical, not cosmetic —
ov002_core.h:37-38 documents that a 13-bit field written as `(v<<19)>>19`
fails the byte match unless typed as a real bitfield. This tool mines the
*true* answer (what the compiler actually emits, everywhere the symbol is
touched) instead of relying on per-TU hand-guesses that can silently
disagree with each other (see `aggregate()`'s disagreement flag).

Method, per delinked `.o` (matched .c *and* unmatched `_dsd_gap@*.o` alike
— an unmatched function's disassembly is just as real a data point as a
matched one's C source):

  1. Find the pool slot(s) holding the symbol's address: an
     `R_ARM_ABS32 <symbol>` relocation at some `.L_xxx` label address.
  2. Find every `ldr rX, [pc, #N]` that resolves to that pool slot — rX
     now holds the symbol's base address at that program point.
  3. Walk forward from there (bounded window; stop early if rX is
     overwritten) collecting `{ldr,ldrh,ldrsh,ldrb,ldrsb,str,strh,strb}
     rY, [rX, #OFF]` — the real field accesses, one per (offset, width,
     signedness).
  4. If the destination register of a load is immediately narrowed by an
     `lsl rY,rY,#N` + `lsr/asr rY,rY,#M` pair (the pattern this project's
     own P-1/Ov002Slot precedent already treats as THE bitfield tell —
     mwcc folds `(v<<N)>>N` symmetric shifts to `and`, so a *surviving*
     asymmetric shift pair in the *target* orig is the signal a field is
     a bitfield, not a full word), record a bitfield width/shift instead
     of the raw load width.

Aggregate per offset across every site; where sites disagree on width or
signedness, flag it — brief 609's own honesty requirement: a disagreement
is a union or a miscall to go investigate, not something to silently
resolve by majority vote.

Usage:
    python tools/build_struct_bank.py --version eur data_ov002_022d016c \\
        --struct-name Ov002D016c > /tmp/bank.txt

Category: match-acceleration (struct/type bank; pairs with m2c_feed.py's
--fewshot and --context).
"""
from __future__ import annotations

import argparse
import re
import subprocess
import sys
from collections import defaultdict
from dataclasses import dataclass, field
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

# ldr/str family: (mnemonic, width in bytes, signed | None if N/A for the width)
_WIDTH_SIGN = {
    "ldr": (4, None), "str": (4, None),
    "ldrh": (2, False), "strh": (2, None),
    "ldrsh": (2, True),
    "ldrb": (1, False), "strb": (1, None),
    "ldrsb": (1, True),
}

_RELOC_RE = re.compile(r"^\s*([0-9a-f]+):\s+R_ARM_ABS32\s+(\S+)\s*$")
_LABEL_RE = re.compile(r"^([0-9a-f]+) <(\.L_\w+)>:")
_INSN_RE = re.compile(r"^\s*([0-9a-f]+):\t[0-9a-f]{8}(?: \t| )(\S+)\s*(.*)$")
_POOL_LOAD_RE = re.compile(r"^ldr\s+(r\d+|ip|lr|sp|pc|fp),\s*\[pc,\s*#-?\d+\]\s*@ ([0-9a-f]+) <(\.L_\w+)>")
_OFFSET_LOAD_RE = re.compile(
    r"^(\w+)\s+(r\d+|ip|lr),\s*\[(r\d+|ip|lr)(?:,\s*#(-?\d+))?\]"
)
_REG_DEST_RE = re.compile(r"^\w+\s+(r\d+|ip|lr),")
_SHIFT_RE = re.compile(r"^(lsl|lsr|asr)\s+(r\d+|ip|lr),\s*\1?\2?,?\s*#?(\d+)")
_MOV_SHIFT_RE = re.compile(r"^mov\w*\s+(r\d+|ip|lr),\s*(r\d+|ip|lr),\s*(lsl|lsr|asr)\s+#(\d+)")

# ARM condition-code suffixes (AL is the default/unconditional and is never
# spelled out by objdump, so it's excluded). Every ldr/str-family mnemonic
# below can be predicated (`streq`, `ldrhcc`, `ldrsble`, ...) -- the width/
# signedness lookup must see past that suffix or it silently drops every
# conditional access (found live: `streq r1,[r0,#3412]` was invisible until
# this normalization was added).
_CONDS = ("eq", "ne", "cs", "hs", "cc", "lo", "mi", "pl", "vs", "vc",
          "hi", "ls", "ge", "lt", "gt", "le")


def _base_mnemonic(mnemonic: str) -> str:
    """Strip a trailing ARM condition code, if `mnemonic` (with it removed)
    names a real ldr/str-family op we track. Tries the unconditional form
    first so an unconditional mnemonic is never mistakenly truncated."""
    if mnemonic in _WIDTH_SIGN:
        return mnemonic
    for cond in _CONDS:
        if mnemonic.endswith(cond) and mnemonic[:-len(cond)] in _WIDTH_SIGN:
            return mnemonic[:-len(cond)]
    return mnemonic


MAX_LOOKAHEAD = 24  # instructions to scan forward from a pool load before giving up


@dataclass(frozen=True)
class Access:
    """One observed touch of `offset` bytes into the symbol, at one site."""
    offset: int
    mnemonic: str          # ldr / ldrh / ldrsh / ldrb / ldrsb / str / strh / strb
    is_store: bool
    bitfield_width: int | None = None   # None = not a bitfield (plain load width)
    bitfield_shift: int | None = None   # bit offset within the loaded word
    site: str = ""          # "<obj>:<addr>" for provenance/debugging


@dataclass
class FieldInference:
    offset: int
    width: int              # bytes, of the DECLARED field (4/2/1)
    signed: bool | None      # None = width has no sign variant (word) or unobserved
    bitfield_width: int | None = None
    bitfield_shift: int | None = None
    n_sites: int = 0
    disagreement: str | None = None
    sites: list[str] = field(default_factory=list)

    def c_type(self) -> str:
        """The base type only -- NOT a full declaration. A bitfield's `:
        WIDTH` must follow the field NAME (`unsigned int f : 13;`), not
        the type (`unsigned int : 13 f;` is a differently-meaning
        anonymous-padding-bitfield declaration in real C) -- see
        `declaration()`."""
        if self.bitfield_width is not None:
            return "unsigned int" if self.width == 4 else "u16" if self.width == 2 else "u8"
        if self.width == 4:
            return "int"
        if self.width == 2:
            return "short" if self.signed else "u16"
        return "signed char" if self.signed else "u8"

    def declaration(self, name: str) -> str:
        """The full, syntactically-correct member declaration for `name`."""
        if self.bitfield_width is not None:
            return f"{self.c_type()} {name} : {self.bitfield_width}"
        return f"{self.c_type()} {name}"


_NON_WRITING = ("cmp", "cmn", "tst", "teq", "str", "strh", "strb", "push", "stmfd", "stmia")
_REGLIST_LOAD = ("pop", "ldmfd", "ldmia")  # write EVERY register named in {...}


def _instr_regs_written(mnemonic: str, operands: str) -> set[str]:
    """Best-effort: which register(s) does this instruction overwrite?
    Over-approximating is fine (it only ends base-pointer tracking early,
    never mis-attributes an access) -- but under-approximating is NOT: it
    would let a stale base_reg keep matching after e.g. `popeq {r0,pc}`
    reloaded it from the stack. `pop`/`ldm`-family loads are register-LIST
    writes, not the single-dest-operand shape `_REG_DEST_RE` expects, so
    they need their own check regardless of any condition-code suffix."""
    base = mnemonic
    for cond in _CONDS:
        if mnemonic.endswith(cond) and mnemonic[:-len(cond)] in (
                _NON_WRITING + _REGLIST_LOAD + ("b", "bl", "bx", "blx")):
            base = mnemonic[:-len(cond)]
            break
    if base in _REGLIST_LOAD:
        return set(re.findall(r"\b(r\d+|ip|lr|sp|pc|fp)\b", operands))
    if base in _NON_WRITING or base in ("b", "bl", "bx", "blx") or base.startswith("b"):
        return set()
    m = _REG_DEST_RE.match(f"{mnemonic} {operands}")
    return {m.group(1)} if m else set()


def parse_symbol_accesses(objdump_text: str, symbol: str) -> list[Access]:
    """PURE: one `objdump -d -r` text blob -> every observed Access to
    `symbol`, in this one object. No filesystem, no subprocess -- the
    whole reason this is split from `mine_object()` is to be directly
    unit-testable against a hand-written fixture string."""
    lines = objdump_text.splitlines()

    # 1. pool slots: label address -> True, only for slots the relocation
    #    table confirms hold OUR symbol's address.
    pool_labels: set[str] = set()
    pending_label = None
    for raw in lines:
        lm = _LABEL_RE.match(raw)
        if lm:
            pending_label = lm.group(2)
            continue
        rm = _RELOC_RE.match(raw)
        if rm and rm.group(2) == symbol and pending_label:
            pool_labels.add(pending_label)

    # 2. instruction stream with addresses, in order
    insns: list[tuple[int, str, str]] = []  # (addr, mnemonic, operands)
    for raw in lines:
        im = _INSN_RE.match(raw)
        if im:
            addr = int(im.group(1), 16)
            rest = im.group(2)
            operands = im.group(3)
            # objdump sometimes puts the whole "mnemonic operands" in group(2)
            # when there's no tab between them (thumb-density edge case);
            # `_INSN_RE`'s split point is the first run of non-space after
            # the byte-hex column, so mnemonic is always group(2) here.
            insns.append((addr, rest, operands))

    accesses: list[Access] = []
    for i, (_addr, mnemonic, operands) in enumerate(insns):
        pm = _POOL_LOAD_RE.match(f"{mnemonic} {operands}")
        if not pm or pm.group(3) not in pool_labels:
            continue
        base_reg = pm.group(1)
        # 3. walk forward: base_reg holds &symbol until overwritten
        for j in range(i + 1, min(i + 1 + MAX_LOOKAHEAD, len(insns))):
            a2, mn2, op2 = insns[j]
            om = _OFFSET_LOAD_RE.match(f"{mn2} {op2}")
            base_mn2 = _base_mnemonic(mn2) if om else None
            if om and om.group(3) == base_reg and base_mn2 in _WIDTH_SIGN:
                width, signed = _WIDTH_SIGN[base_mn2]
                is_store = base_mn2.startswith("str")
                dest_reg = om.group(2)
                bf_width = bf_shift = None
                if not is_store:
                    bf_width, bf_shift = _detect_bitfield(insns, j + 1, dest_reg, width)
                accesses.append(Access(
                    offset=int(om.group(4) or 0), mnemonic=base_mn2, is_store=is_store,
                    bitfield_width=bf_width, bitfield_shift=bf_shift,
                    site=f"0x{a2:x}",  # the access instruction's own address, not the pool load's
                ))
                continue
            if base_reg in _instr_regs_written(mn2, op2):
                break  # base pointer clobbered; stop this window
    return accesses


def _detect_bitfield(insns, start_idx, reg, load_width_bytes) -> tuple[int | None, int | None]:
    """Look at the 1-2 instructions right after a load of `reg` for the
    `lsl rN,#K1; lsr rN,#K2` (or single `mov rN,rN,lsl #K` + `mov
    rN,rN,lsr #K2`, objdump's alternate rendering of the same encoding)
    narrowing idiom. Includes the SYMMETRIC case (K1==K2): a bit-0-aligned
    field of width (32-K) extracts via `lsl#K;lsr#K` -- e.g.
    ov002_core.h:37-38's own documented ground truth, `Ov002Slot.id : 13`,
    is exactly `lsl#19;lsr#19`. This is NOT the same shape as brief 596's
    P-1 wall: P-1 is mwcc COLLAPSING a symmetric shift written as *C
    source* (`(v<<K)>>K`) to a single `and` -- it does not collapse the
    shift pair a real bitfield MEMBER access compiles to. So a surviving
    symmetric shift-pair in disassembly is if anything positive evidence
    for a bitfield (per P-1, no other C idiom reaches this shape without
    being folded away) -- the earlier draft of this function rejected
    K1==K2 on a backwards reading of that finding; ov002_core.h's own
    documented field is exactly the case it broke. Returns (width, shift)
    in bits, or (None, None) if this load is not a narrowed bitfield."""
    total_bits = load_width_bytes * 8
    window = insns[start_idx:start_idx + 2]
    shifts: list[tuple[str, int]] = []
    for _addr, mn, op in window:
        sm = _SHIFT_RE.match(f"{mn} {op}")
        if sm and sm.group(2) == reg:
            shifts.append((sm.group(1), int(sm.group(3))))
            continue
        mm = _MOV_SHIFT_RE.match(f"{mn} {op}")
        if mm and mm.group(1) == reg and mm.group(2) == reg:
            shifts.append((mm.group(3), int(mm.group(4))))
            continue
        break
    if len(shifts) != 2:
        return None, None
    (op1, k1), (op2, k2) = shifts
    if op1 != "lsl" or op2 not in ("lsr", "asr"):
        return None, None
    width = total_bits - k2
    shift = k2 - k1
    if width <= 0 or shift < 0:
        return None, None
    return width, shift


def aggregate(accesses: list[Access]) -> dict[int, FieldInference]:
    """PURE: per-offset Access list -> one FieldInference each, flagging
    any offset where sites disagree on width/signedness/bitfield shape."""
    by_offset: dict[int, list[Access]] = defaultdict(list)
    for a in accesses:
        by_offset[a.offset].append(a)

    out: dict[int, FieldInference] = {}
    for offset, group in by_offset.items():
        widths = {_WIDTH_SIGN[a.mnemonic][0] for a in group}
        signs = {_WIDTH_SIGN[a.mnemonic][1] for a in group if not a.is_store}
        signs.discard(None)
        loads = [a for a in group if not a.is_store]
        bitfields = {(a.bitfield_width, a.bitfield_shift) for a in loads if a.bitfield_width}
        plain_loads = [a for a in loads if not a.bitfield_width]

        disagreement = None
        if len(widths) > 1:
            disagreement = f"width disagreement: {sorted(widths)} bytes across sites"
        elif len(bitfields) > 1:
            disagreement = f"bitfield shape disagreement: {sorted(bitfields)}"
        elif bitfields and plain_loads:
            # SAME offset, same instruction width, but SOME loads narrow it
            # with a shift pair and OTHERS read it whole. Caught live at
            # ov002 +0xd44: only 1 of 142 loads narrows to 16 bits, the
            # other 141 (incl. the already-shipped func_ov002_021d1be4.c)
            # read it as a plain word -- the minority shape here, not the
            # majority a naive "any bitfield seen -> emit a bitfield" rule
            # would report. Neither reading is presumptively wrong (a
            # single narrowed read can be a genuine, deliberate sub-access
            # of an otherwise-plain field, or a real miscall) -- flag it
            # for a human to look at rather than picking one silently.
            n_bf = len(loads) - len(plain_loads)
            disagreement = (f"{len(plain_loads)}/{len(loads)} loads read the full word "
                            f"unnarrowed, {n_bf}/{len(loads)} narrow to {sorted(bitfields)}")
        elif len(signs) > 1:
            disagreement = f"signedness disagreement: {sorted(signs)}"

        width = max(widths)  # widest observed access wins when reporting a plain field
        # Majority vote when bitfield vs plain disagree, so the EMITTED type
        # tracks the dominant evidence, not "a bitfield exists somewhere" --
        # the disagreement string above still carries the minority count for
        # a human to check regardless of which way the vote fell.
        if bitfields and (len(bitfields) > 1 or len(loads) - len(plain_loads) <= len(plain_loads)):
            bf_width, bf_shift = None, None
        else:
            bf_width, bf_shift = next(iter(bitfields)) if len(bitfields) == 1 else (None, None)
        signed = next(iter(signs)) if len(signs) == 1 else None

        out[offset] = FieldInference(
            offset=offset, width=width, signed=signed,
            bitfield_width=bf_width, bitfield_shift=bf_shift,
            n_sites=len(group), disagreement=disagreement,
            sites=[a.site for a in group],
        )
    return out


def mine_object(obj: Path, symbol: str, objdump: str) -> list[Access]:
    text = subprocess.run(
        [objdump, "-d", "-r", "--architecture=armv5te", str(obj)],
        capture_output=True, text=True,
    ).stdout
    return [
        Access(a.offset, a.mnemonic, a.is_store, a.bitfield_width, a.bitfield_shift,
               site=f"{obj.name}:{a.site}")
        for a in parse_symbol_accesses(text, symbol)
    ]


def mine_object_text(text: str, obj: Path, symbols: list[str]) -> dict[str, list[Access]]:
    """Parse one objdump result for every requested symbol."""
    return {
        symbol: [
            Access(a.offset, a.mnemonic, a.is_store, a.bitfield_width,
                   a.bitfield_shift, site=f"{obj.name}:{a.site}")
            for a in parse_symbol_accesses(text, symbol)
        ]
        for symbol in symbols
    }


def mine_all(version: str, symbol: str, objdump: str, root: Path = ROOT) -> list[Access]:
    return mine_all_symbols(version, [symbol], objdump, root)[symbol]


def mine_all_symbols(version: str, symbols: list[str], objdump: str,
                     root: Path = ROOT) -> dict[str, list[Access]]:
    """Mine many symbols while running objdump only once per object."""
    delinks = root / f"build/{version}/delinks"
    if not delinks.is_dir():
        raise SystemExit(f"{delinks} missing -- run configure.py + `ninja delink` first")
    accesses = {symbol: [] for symbol in symbols}
    for obj in sorted(delinks.rglob("*.o")):
        text = subprocess.run(
            [objdump, "-d", "-r", "--architecture=armv5te", str(obj)],
            capture_output=True, text=True,
        ).stdout
        for symbol, object_accesses in mine_object_text(text, obj, symbols).items():
            accesses[symbol].extend(object_accesses)
    return accesses


def render_struct(fields: dict[int, FieldInference], struct_name: str, symbol: str) -> str:
    ordered = sorted(fields.values(), key=lambda f: f.offset)
    lines = [f"/* Mined by tools/build_struct_bank.py from {len(ordered)} observed "
             f"offsets across {sum(f.n_sites for f in ordered)} access sites (brief 613). */",
             f"struct {struct_name} {{"]
    cursor = 0
    pad_n = 0
    for index, f in enumerate(ordered):
        overlaps_later = any(
            later.offset < f.offset + f.width for later in ordered[index + 1:]
        )
        if overlaps_later:
            lines.append(f"    /* omitted overlapping field at +0x{f.offset:x} */")
            continue
        if f.offset > cursor:
            lines.append(f"    char _pad{pad_n}[{f.offset - cursor}];")
            pad_n += 1
            cursor = f.offset
        if f.offset < cursor:
            lines.append(f"    /* omitted overlapping field at +0x{f.offset:x} */")
            continue
        note = f"  /* +0x{f.offset:x}, {f.n_sites} site(s)" + \
               (f" -- {f.disagreement}" if f.disagreement else "") + " */"
        lines.append(f"    {f.declaration(f'f_{f.offset:x}')};{note}")
        cursor = f.offset + f.width
    lines.append("};")
    lines.append(f"extern struct {struct_name} {symbol};")
    return "\n".join(lines) + "\n"


def render_context_block(fields: dict[int, FieldInference], struct_name: str,
                        symbol: str, original_decl: str) -> str:
    """Render a context-only struct while preserving the real-build line."""
    struct = render_struct(fields, struct_name, symbol)
    return ("#ifdef M2C_CONTEXT_BUILD\n" + struct +
            "#else\n" + original_decl + "\n#endif")


def header_data_symbols(header: Path) -> list[str]:
    """Return data_ov002 symbols declared by an ov002 core header."""
    return sorted(set(re.findall(r"\b(data_ov002_[0-9a-f]+)\b", header.read_text())))


def update_header(header: Path, mined: dict[str, dict[int, FieldInference]]) -> int:
    """Add guarded mined blocks around plain data declarations.

    Existing context blocks are left untouched. The declaration copied into
    each new `#else` branch is the exact source line found in the header.
    """
    text = header.read_text()
    changed = 0
    for symbol, fields in mined.items():
        if not fields:
            continue
        context_blocks = list(re.finditer(
            r"(?ms)^#ifdef M2C_CONTEXT_BUILD\n.*?^#endif\s*$", text))
        existing = next((block for block in context_blocks if symbol in block.group(0)), None)
        if existing:
            if "Mined by tools/build_struct_bank.py" not in existing.group(0):
                continue
            else_decl = re.search(r"(?m)^#else\n([^\n]+)\n#endif", existing.group(0))
            if not else_decl:
                continue
            original = else_decl.group(1)
            struct_name = "".join(p.capitalize() for p in symbol.removeprefix("data_").split("_"))
            block = render_context_block(fields, struct_name, symbol, original)
            text = text[:existing.start()] + block + text[existing.end():]
            changed += 1
            continue
        match = re.search(rf"(?m)^(?P<decl>[^\n]*\b{re.escape(symbol)}\b[^\n]*;[^\n]*)$", text)
        if not match:
            continue
        original = match.group("decl").rstrip()
        struct_name = "".join(p.capitalize() for p in symbol.removeprefix("data_").split("_"))
        block = render_context_block(fields, struct_name, symbol, original)
        text = text[:match.start()] + block + text[match.end():]
        changed += 1
    if changed:
        header.write_text(text)
    return changed


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[1] if __doc__ else "")
    ap.add_argument("symbol", nargs="?", help="e.g. data_ov002_022d016c")
    ap.add_argument("--symbols", nargs="+", help="mine several symbols in one object-dump pass")
    ap.add_argument("--version", default="eur", choices=("eur", "usa", "jpn"))
    ap.add_argument("--struct-name", default=None, help="default: derived from the symbol name")
    ap.add_argument("--objdump", default="arm-none-eabi-objdump")
    ap.add_argument("--header", type=Path, help="update this header with guarded blocks")
    args = ap.parse_args(argv)

    symbols = args.symbols or ([args.symbol] if args.symbol else None)
    if not symbols:
        ap.error("provide SYMBOL or --symbols")
    all_accesses = mine_all_symbols(args.version, symbols, args.objdump)
    mined = {}
    for symbol in symbols:
        accesses = all_accesses[symbol]
        if not accesses:
            print(f"error: no accesses to {symbol} found under "
                  f"build/{args.version}/delinks/", file=sys.stderr)
            continue
        fields = aggregate(accesses)
        mined[symbol] = fields
        struct_name = args.struct_name if len(symbols) == 1 and args.struct_name else "".join(
            p.capitalize() for p in symbol.removeprefix("data_").split("_"))
        if not args.header:
            print(render_struct(fields, struct_name, symbol))
        disagreements = [f for f in fields.values() if f.disagreement]
        print(f"# {symbol}: {len(accesses)} total access sites, {len(fields)} distinct offsets, "
              f"{len(disagreements)} disagreement(s)", file=sys.stderr)
        for f in disagreements:
            print(f"#   +0x{f.offset:x}: {f.disagreement} ({f.sites})", file=sys.stderr)
    if args.header:
        print(f"# changed {update_header(args.header, mined)} context block(s)")
    if not mined:
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
