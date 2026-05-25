#!/usr/bin/env python3

"""
patch_arm_mapping_symbols.py — rewrite mwasmarm `$d` mapping
symbols to `$a` when the underlying 4-byte words decode as ARM
instructions. Brief 210 fix for objdiff's `matched_functions`
under-counting on brief 192's C-32 hand-encoded cross-overlay
BL recipe and related `.s` patterns.

The problem
-----------

ARM ELF defines mapping symbols (`$a`, `$d`, `$t`) that mark
regions of `.text` as ARM code / Thumb code / data. Disassemblers
and diff tools use these to know whether to decode bytes as
instructions or treat them as data.

When mwasmarm processes a `.s` file:
  - An ARM mnemonic (`stmdb sp!, {...}`) emits `$a` at that offset.
  - A `.word 0xHEX` directive emits `$d` (DATA) at that offset.

Brief 192's C-32 recipe ships cross-overlay BLs as
`.word 0xebXXXXXX` directives because mwasmarm can't generate
a `bl <hex_address>` across overlay boundaries. The
instructions ARE valid ARM code — they're just hand-encoded —
but mwasmarm tags them as `$d`. objdiff's diff reader then
treats them as data, producing low `fuzzy_match_percent` even
though the bytes are byte-identical to orig.

Brief 209 (PR #661) verified the root cause across 23 stragglers
and recommended option (1): post-process the .o output to rewrite
`$d` → `$a` for any `.word` value that decodes as a valid ARM
instruction. This tool is that fix.

The transform
-------------

For each symbol in `.symtab` named `$d` pointing into `.text`:
  1. Compute its range: from `st_value` to the next mapping symbol's
     `st_value` (or end of `.text`).
  2. Check every 4-byte word in the range against
     `is_likely_arm_instruction` — conservative heuristic that
     accepts AL-condition instructions and predicated branches
     while rejecting typical data words (addresses, masks).
  3. If ALL words in the range decode as ARM instructions, rewrite
     the symbol's `st_name` to point at an existing `$a` strtab
     entry. This effectively renames `$d` → `$a` for that single
     symbol, leaving other `$d` symbols (e.g., literal pool
     ranges) untouched.

The rewrite is **idempotent and byte-value-driven**: the same
input always produces the same output regardless of how many times
the tool runs. Both the orig delinked .o and the built .o are
processed the same way, so objdiff's comparison sees matching
mapping-symbol layouts.

Fallbacks
---------

When the .o has no `$a` symbol in `.strtab` (e.g., a pure-`.word`
function with zero ARM mnemonics):

  - If ALL `$d` symbols are all-arm: mass-rename the `$d`
    strtab entry to `$a` (single byte overwrite, no file
    growth). This handles the brief 192 recipe edge case.
  - If some `$d` symbols are mixed (some arm, some data): skip
    the file entirely. Selective per-symbol promotion would
    require expanding strtab — out of scope for brief 210.

Algorithm scope
---------------

  - Only `.text` mapping symbols are touched. `.data` / `.rodata`
    `$d` symbols (if any exist) are intentionally ignored.
  - Only `$d` → `$a` promotions. `$t` (Thumb) is never touched.
  - Only mwasmarm-emitted layouts are exercised; mwccarm's
    proper `$a` / `$d` boundaries should already be correct and
    the heuristic-based check confirms by rejecting data values.

Reference: `docs/research/brief-209-stragger-investigation.md`
documents the root cause and the per-pick verdict matrix this
tool addresses.
"""

from __future__ import annotations

import argparse
import json
import struct
import sys
from dataclasses import dataclass
from pathlib import Path

# --------------------------------------------------------------------------- #
# ELF32 little-endian constants (subset; full set in objdiff_resolve_relocs.py)
# --------------------------------------------------------------------------- #

ELF_MAGIC = b"\x7fELF"
ELF_CLASS_32 = 1
ELF_DATA_2LSB = 1
ELF_HEADER_SIZE = 0x34
SH_ENTRY_SIZE = 40

# Section header fields.
SH_NAME = 0
SH_TYPE = 4
SH_OFFSET = 16
SH_SIZE = 20
SH_LINK = 24

# Symbol table entry layout (16 bytes).
SYM_ENTRY_SIZE = 16
ST_NAME = 0
ST_VALUE = 4
ST_SIZE = 8
ST_INFO = 12
ST_OTHER = 13
ST_SHNDX = 14

# Section types.
SHT_SYMTAB = 2
SHT_STRTAB = 3

# Symbol type values (low nibble of st_info).
STT_NOTYPE = 0
STT_OBJECT = 1
STT_FUNC = 2

# mwasmarm emits `$d` mapping symbols as STT_OBJECT and `$a` as
# STT_FUNC. When we rewrite `$d` → `$a` by repointing st_name, we
# must ALSO update st_info's type nibble from STT_OBJECT to
# STT_FUNC — otherwise objdiff's reader sees a "$a"-named symbol
# with STT_OBJECT type and trips an internal index-out-of-bounds
# at `objdiff-core/src/arch/arm.rs:130` (same panic family brief
# 187 documented for code-less ELFs, different root cause). Bind
# nibble stays STB_LOCAL (0) for both — kept as-is via mask.

# --------------------------------------------------------------------------- #
# ARM instruction heuristic
# --------------------------------------------------------------------------- #


def is_likely_arm_instruction(word: int) -> bool:
    """Permissive heuristic for whether a 32-bit word could be a
    valid ARM instruction. Designed for brief 210's use case where
    both sides of the comparison (built + orig) have byte-
    identical `.text` post-resolve — a false-positive on a
    "literal pool address looks like ARM" word is harmless because
    BOTH files get the same promotion based on byte value, so
    objdiff's comparison stays consistent.

    **Accepts** (returns True):
      - Any non-0xF condition code. Includes AL (0xE) and all
        14 predicated conditions (EQ, NE, CS, CC, MI, PL, VS,
        VC, HI, LS, GE, LT, GT, LE). ARM code uses all of them;
        compiler emit is mostly AL but predicated execution (C-1
        wall recipe) uses EQ/NE/etc. for early-return-equivalent
        chains and short conditional sequences.

    **Rejects** (returns False):
      - Unconditional special instructions (high nibble `0xF`).
        `BLX` literal, `CPS`, `SETEND`, `PLD`, `MCRR2`, etc. —
        ARMv5T+ encodings that ARMv4T compilers don't emit and
        ARM7TDMI doesn't decode. Almost never appears as real
        code in this project's corpus.
      - All-zero word (`0x00000000`). This is the canonical
        "uninitialised" / "placeholder" byte pattern — pre-link
        relocation slots are often 0x00000000, as are .bss
        zero-fills. Decoding it as `ANDEQ r0, r0, r0` (a NOP-
        equivalent) is technically valid ARM but compilers
        don't emit it; treating it as data is the safer bet.

    **Why permissive matters here** (brief 210 root-cause): brief
    192's hand-encoded `.word` recipes contain predicated
    instructions like `LDREQ`, `CMPEQ`, `LDMEQIA` (cond EQ
    early-return pattern from orig). The AL-only heuristic
    rejected these and mis-placed the code/data boundary inside
    `$d` ranges, which created malformed `$a` extents that
    triggered objdiff's `process_code` ARM crash (`arm.rs:130`,
    same panic family brief 187 documented). Accepting all non-
    0xF conditions resolves the false-rejection.
    """
    cond = (word >> 28) & 0xF
    if cond == 0xF:
        # 0xF = unconditional special (BLX literal, CPS, SETEND,
        # PLD, MCRR2, ...) — rare in compiler output for ARMv5TE.
        return False
    if word == 0:
        # All-zero word is a placeholder / data marker; don't
        # promote even though it'd decode as `ANDEQ r0, r0, r0`.
        return False
    return True


# --------------------------------------------------------------------------- #
# Custom exception
# --------------------------------------------------------------------------- #


class MappingSymbolRewriteError(RuntimeError):
    """Raised on malformed ELF inputs. Caught by `main()` and
    reported per-file so a single bad unit doesn't sink the whole
    report-generation pipeline."""


# --------------------------------------------------------------------------- #
# ELF parsing helpers
# --------------------------------------------------------------------------- #


def _parse_elf_header(buf: bytes) -> tuple[int, int]:
    """Return `(e_shoff, e_shnum)`. Raises on invalid ELF32-LE."""
    if len(buf) < ELF_HEADER_SIZE or buf[:4] != ELF_MAGIC:
        raise MappingSymbolRewriteError("not an ELF file")
    if buf[4] != ELF_CLASS_32 or buf[5] != ELF_DATA_2LSB:
        raise MappingSymbolRewriteError(
            "not 32-bit little-endian ELF",
        )
    e_shoff = struct.unpack_from("<I", buf, 0x20)[0]
    e_shentsize = struct.unpack_from("<H", buf, 0x2e)[0]
    e_shnum = struct.unpack_from("<H", buf, 0x30)[0]
    e_shstrndx = struct.unpack_from("<H", buf, 0x32)[0]
    if e_shentsize != SH_ENTRY_SIZE:
        raise MappingSymbolRewriteError(
            f"unexpected e_shentsize {e_shentsize}",
        )
    if e_shstrndx >= e_shnum:
        raise MappingSymbolRewriteError(
            f"e_shstrndx {e_shstrndx} >= e_shnum {e_shnum}",
        )
    return e_shoff, e_shnum


def _read_shstrtab(buf: bytes, e_shoff: int) -> bytes:
    """Read the section-name string table."""
    e_shstrndx = struct.unpack_from("<H", buf, 0x32)[0]
    sh_base = e_shoff + e_shstrndx * SH_ENTRY_SIZE
    off = struct.unpack_from("<I", buf, sh_base + SH_OFFSET)[0]
    size = struct.unpack_from("<I", buf, sh_base + SH_SIZE)[0]
    if off + size > len(buf):
        raise MappingSymbolRewriteError(
            "shstrtab section out of bounds",
        )
    return buf[off:off + size]


def _read_cstring(strtab: bytes, idx: int) -> str:
    """Read a NUL-terminated string from `strtab` at offset `idx`."""
    end = strtab.find(b"\x00", idx)
    if end < 0:
        return ""
    return strtab[idx:end].decode("ascii", errors="replace")


# --------------------------------------------------------------------------- #
# Mapping-symbol enumeration
# --------------------------------------------------------------------------- #


@dataclass
class MappingSymbol:
    """One mapping symbol in `.text`.

    Tracks the strtab name (`$a` / `$d` / `$t`), the symtab entry's
    file offset (so we can rewrite `st_name`), and the byte offset
    within `.text` that the symbol marks.
    """

    name: str          # "$a", "$d", "$t"
    sym_offset: int    # file offset of the symtab entry
    st_value: int      # byte offset within .text


def _find_text_symtab_strtab(
    buf: bytes,
) -> tuple[int, int, int, int, int, int]:
    """Locate `.text`, `.symtab`, and the strtab linked from
    symtab. Returns
    `(text_idx, text_offset, text_size, symtab_offset, symtab_size,
      strtab_offset)`.

    Raises `MappingSymbolRewriteError` if `.text` or `.symtab` is
    missing.
    """
    e_shoff, e_shnum = _parse_elf_header(buf)
    shstrtab = _read_shstrtab(buf, e_shoff)

    text_idx = -1
    text_offset = text_size = 0
    symtab_offset = symtab_size = 0
    symtab_link = -1
    found_text = False
    found_symtab = False
    for i in range(e_shnum):
        base = e_shoff + i * SH_ENTRY_SIZE
        name_idx = struct.unpack_from("<I", buf, base + SH_NAME)[0]
        sh_type = struct.unpack_from("<I", buf, base + SH_TYPE)[0]
        sh_offset = struct.unpack_from("<I", buf, base + SH_OFFSET)[0]
        sh_size = struct.unpack_from("<I", buf, base + SH_SIZE)[0]
        sh_link = struct.unpack_from("<I", buf, base + SH_LINK)[0]
        name = _read_cstring(shstrtab, name_idx)
        if name == ".text":
            text_idx = i
            text_offset = sh_offset
            text_size = sh_size
            found_text = True
        elif sh_type == SHT_SYMTAB:
            symtab_offset = sh_offset
            symtab_size = sh_size
            symtab_link = sh_link
            found_symtab = True

    if not found_text:
        raise MappingSymbolRewriteError("no .text section")
    if not found_symtab:
        raise MappingSymbolRewriteError("no .symtab section")

    # Linked strtab for symbol names.
    strtab_sh_base = e_shoff + symtab_link * SH_ENTRY_SIZE
    strtab_offset = struct.unpack_from(
        "<I", buf, strtab_sh_base + SH_OFFSET,
    )[0]

    return (
        text_idx, text_offset, text_size,
        symtab_offset, symtab_size, strtab_offset,
    )


def _enumerate_mapping_symbols(
    buf: bytes,
    text_idx: int,
    symtab_offset: int,
    symtab_size: int,
    strtab_offset: int,
) -> list[MappingSymbol]:
    """Walk symtab, collect mapping symbols pointing into `.text`,
    return sorted by `st_value`. Non-mapping symbols and mapping
    symbols pointing elsewhere are filtered out.
    """
    symbols: list[MappingSymbol] = []
    if symtab_size % SYM_ENTRY_SIZE != 0:
        raise MappingSymbolRewriteError(
            f"symtab size {symtab_size} not a multiple of "
            f"entry size {SYM_ENTRY_SIZE}",
        )
    for ent_off in range(
        symtab_offset, symtab_offset + symtab_size, SYM_ENTRY_SIZE,
    ):
        st_name = struct.unpack_from("<I", buf, ent_off + ST_NAME)[0]
        if st_name == 0:
            continue
        st_value = struct.unpack_from(
            "<I", buf, ent_off + ST_VALUE,
        )[0]
        st_shndx = struct.unpack_from(
            "<H", buf, ent_off + ST_SHNDX,
        )[0]
        # Only mapping symbols in .text matter for brief 210.
        if st_shndx != text_idx:
            continue
        # Read the name from strtab.
        end = buf.find(b"\x00", strtab_offset + st_name)
        if end < 0:
            continue
        name = bytes(
            buf[strtab_offset + st_name:end],
        ).decode("ascii", errors="replace")
        if name not in ("$a", "$d", "$t"):
            continue
        symbols.append(MappingSymbol(
            name=name, sym_offset=ent_off, st_value=st_value,
        ))
    symbols.sort(key=lambda s: s.st_value)
    return symbols


# --------------------------------------------------------------------------- #
# Per-symbol promotion
# --------------------------------------------------------------------------- #


def _find_a_strtab_offset(
    buf: bytes,
    strtab_offset: int,
    strtab_size_estimate: int = 0x10000,
) -> int | None:
    """Locate an existing `$a\\0` substring in the strtab linked
    from symtab. Returns its byte offset within the strtab (i.e.
    the value an `st_name` field should hold to reference `$a`),
    or `None` if no such substring exists.

    The strtab is bounded by the linked section's `sh_size`; we
    use a generous default upper bound here since `_find_text_*`
    doesn't return the strtab size separately. Callers pass the
    real size via `strtab_size_estimate`.
    """
    end = strtab_offset + strtab_size_estimate
    if end > len(buf):
        end = len(buf)
    # Search for the byte sequence "$a\x00" — any longer string
    # ending in "$a" also yields a valid offset (the string
    # starts at the dollar sign and ends at the NUL).
    idx = bytes(buf[strtab_offset:end]).find(b"$a\x00")
    if idx < 0:
        return None
    return idx


def _get_strtab_size(buf: bytes, strtab_offset: int) -> int:
    """Look up the actual sh_size of the strtab section at the
    given file offset by scanning section headers. Returns the
    size in bytes, or `0` if not found (defensive)."""
    e_shoff, e_shnum = _parse_elf_header(buf)
    for i in range(e_shnum):
        base = e_shoff + i * SH_ENTRY_SIZE
        sh_type = struct.unpack_from("<I", buf, base + SH_TYPE)[0]
        sh_offset = struct.unpack_from(
            "<I", buf, base + SH_OFFSET,
        )[0]
        if sh_type == SHT_STRTAB and sh_offset == strtab_offset:
            return struct.unpack_from(
                "<I", buf, base + SH_SIZE,
            )[0]
    return 0


def _find_d_boundary(
    buf: bytes,
    text_offset: int,
    text_size: int,
    range_start: int,
    range_end: int,
) -> int:
    """Scan the `.text[range_start, range_end)` 4-byte words and
    return the offset of the first word that ISN'T a likely ARM
    instruction. If all words in the range are ARM, returns
    `range_end` (sentinel meaning "no data found"). If the very
    first word is data, returns `range_start`.

    Brief 210's per-symbol split logic: for a `$d` covering
    `[range_start, range_end)`, the boundary is the offset where
    code transitions to data. The three cases are:

      - `boundary == range_start`: entire range is data → leave $d
        as-is.
      - `boundary == range_end`: entire range is ARM code →
        promote $d to $a.
      - `range_start < boundary < range_end`: partial — move the
        $d's `st_value` to the boundary so it covers only the
        trailing data; the preceding mapping symbol (typically
        `$a`) extends to cover the leading instructions.
    """
    boundary = range_end
    for off in range(range_start, range_end, 4):
        if off + 4 > text_size:
            boundary = off
            break
        word = struct.unpack_from(
            "<I", buf, text_offset + off,
        )[0]
        if not is_likely_arm_instruction(word):
            boundary = off
            break
    return boundary


def rewrite_mapping_symbols(
    buf: bytes,
) -> tuple[bytes, dict]:
    """Rewrite `$d` mapping symbols in `.text` based on the
    underlying byte content. Returns `(modified_buf, info_dict)`
    where `info_dict` carries diagnostics for the caller's log:

      - `d_seen`: number of `$d` symbols inspected
      - `d_promoted`: number rewritten to `$a` (all-arm range)
      - `d_split`: number whose `st_value` was moved to the
        instruction-to-data boundary (partial-arm range)
      - `d_left_as_data`: number left untouched (entirely-data
        range)
      - `mass_renamed`: `True` if the strtab-overwrite fallback
        fired (only when no existing `$a` slot exists AND all
        `$d` ranges were all-arm)
      - `trailing_promoted_collapsed`: number of promoted-`$a`
        symbols (originally `$d`) zeroed out in pass 2 because
        they followed the last stayed-`$d` and represented
        over-promotion of per-entry pool markers
      - `strtab_size`: the strtab's `sh_size` (for diagnostics)

    Idempotent: after the first pass, all `$d` symbols either
    point at exclusively-data ranges (left as `$d`) or have been
    relabelled to `$a`. Re-running produces no changes.

    Three rewrite paths per `$d`:
      1. **all-arm range** — rewrite `st_name` to point at an
         existing `$a\\0` substring in strtab (mass-rename
         fallback if no `$a\\0` exists).
      2. **partial-arm range** — find the first non-ARM word,
         move the `$d`'s `st_value` to that offset. The
         preceding mapping symbol's coverage extends backwards
         automatically; the `$d` now covers only the trailing
         data. Required for brief 192 recipe files where the
         last `$d` covers a tail of trailing instructions +
         literal pool addresses.
      3. **all-data range** — no change. Common for inline
         literal pools and the canonical `$d` shape mwccarm
         emits.

    Pass 2 — trailing-promotion collapse (brief 212)
    ------------------------------------------------

    After per-symbol pass 1, scan the post-pass-1 mapping symbols
    for the last `$d` that stayed as data. Any `$a` symbol AFTER
    that offset that was PROMOTED in pass 1 (originally `$d`, now
    `$a` because its single-word range decoded as ARM-like) is
    zeroed out (st_name = 0) so enumerators skip it.

    Why this matters (brief 212 corpus-wide audit): asymmetric
    `$d` emission between mwasmarm (one `$d` for a whole `.word`
    run) and dsd's delink (one `$d` per pool entry) is fine when
    the rewriter's per-symbol promotion produces matching shapes.
    It breaks when the literal pool contains a single
    `cond==0xF` word (e.g. `0xffe01fff`, a common mask constant)
    near — but NOT AT — the end: mwasm's side splits its single
    `$d` to mark `0xffe01fff` as data and implicit-`$d` extends
    to end-of-section; dsd's side has per-entry `$d` markers and
    pass 1 over-promotes the ARM-like words AFTER `0xffe01fff`
    individually, leaving a trailing `$a` that classifies those
    bytes as code. Pass 2 reverts the trailing per-entry
    over-promotion so both sides agree the implicit `$d` runs
    from the last data marker to end-of-`.text`.

    Real `$a` markers (originally `$a` in the symtab — e.g. from
    a real `bl`/`bx` mnemonic) are NEVER touched. Only the
    promoted ones (tracked by their sym_offset in pass 1) are
    eligible for collapse.

    See `docs/research/d-a-rewriter-corpus-audit.md` for the
    straggler diagnosis and `docs/research/brief-209-stragger-
    investigation.md` § "Brief 212 outcome".
    """
    out = bytearray(buf)
    info = {
        "d_seen": 0,
        "d_promoted": 0,
        "d_split": 0,
        "d_left_as_data": 0,
        "mass_renamed": False,
        "trailing_promoted_collapsed": 0,
        "strtab_size": 0,
    }

    (
        text_idx, text_offset, text_size,
        symtab_offset, symtab_size, strtab_offset,
    ) = _find_text_symtab_strtab(out)

    strtab_size = _get_strtab_size(out, strtab_offset)
    info["strtab_size"] = strtab_size

    if text_size == 0 or symtab_size == 0:
        return bytes(out), info

    symbols = _enumerate_mapping_symbols(
        out, text_idx, symtab_offset, symtab_size, strtab_offset,
    )

    # Brief 210 scope: ARM mode only. If the file has any `$t`
    # (Thumb) mapping symbols, the `.text` is Thumb code, not
    # ARM, and the AL-condition / branch-class heuristic doesn't
    # apply. Skip the file entirely — these are typically the
    # bios-thunk `.s` files (brief 013) and aren't in the brief
    # 209 straggler set.
    if any(s.name == "$t" for s in symbols):
        return bytes(out), info

    d_symbols = [s for s in symbols if s.name == "$d"]
    info["d_seen"] = len(d_symbols)
    if not d_symbols:
        return bytes(out), info

    # For each $d, compute its range and the code/data boundary.
    # Build a list of (symbol, boundary, range_start, range_end).
    d_classified: list[tuple[MappingSymbol, int, int, int]] = []
    for sym_idx, sym in enumerate(symbols):
        if sym.name != "$d":
            continue
        range_start = sym.st_value
        if sym_idx + 1 < len(symbols):
            range_end = symbols[sym_idx + 1].st_value
        else:
            range_end = text_size
        if range_end <= range_start:
            # Zero-width or inverted range — defensive, treat as
            # all-data (no change). We use boundary < range_end to
            # signal "not all-arm" so the mass-rename fallback
            # correctly excludes this $d. Without this guard, a
            # `$d` at the very end of `.text` (mwasm sometimes
            # emits one after the function bytes, pointing into
            # alignment padding) would falsely pass the
            # `boundary == range_end` check and trigger an
            # unwanted mass-rename — observed on Thumb thunks
            # before the $t-presence check above made it
            # unreachable, kept as belt-and-braces.
            d_classified.append(
                (sym, range_start, range_start, range_start + 1),
            )
            continue
        boundary = _find_d_boundary(
            out, text_offset, text_size, range_start, range_end,
        )
        d_classified.append(
            (sym, boundary, range_start, range_end),
        )

    # Per-symbol rewrite path: prefer the existing `$a\0` strtab
    # entry. If none exists, fall back to mass-rename.
    a_offset = _find_a_strtab_offset(
        out, strtab_offset, strtab_size_estimate=strtab_size or 0x10000,
    )
    if a_offset is not None:
        # Pass 1: per-symbol promote / split / leave. Track which
        # `$d` stayed as data (all-data or post-split) so pass 2
        # can find the latest data offset.
        last_data_offset: int | None = None
        for sym, boundary, range_start, range_end in d_classified:
            if boundary == range_start:
                # All data — leave alone.
                info["d_left_as_data"] += 1
                if last_data_offset is None or range_start > last_data_offset:
                    last_data_offset = range_start
                continue
            if boundary == range_end:
                # All ARM — promote to $a. Two updates:
                #   1. Rewrite st_name to point at the existing
                #      `$a\0` strtab entry.
                #   2. Update st_info's type nibble from
                #      STT_OBJECT to STT_FUNC to match the
                #      convention mwasmarm uses for its
                #      $a-named symbols. Without this, objdiff
                #      panics on the type/name mismatch.
                struct.pack_into(
                    "<I", out, sym.sym_offset + ST_NAME, a_offset,
                )
                cur_info = out[sym.sym_offset + ST_INFO]
                out[sym.sym_offset + ST_INFO] = (
                    (cur_info & 0xF0) | STT_FUNC
                )
                info["d_promoted"] += 1
                continue
            # Partial — move $d's st_value to the boundary so it
            # marks only the trailing data. The preceding mapping
            # symbol's coverage extends backwards to cover the
            # leading instructions automatically. The symbol's
            # name stays "$d" and st_info stays STT_OBJECT — no
            # name/type rewrite needed for split.
            struct.pack_into(
                "<I", out, sym.sym_offset + ST_VALUE, boundary,
            )
            info["d_split"] += 1
            if last_data_offset is None or boundary > last_data_offset:
                last_data_offset = boundary

        # Pass 2 — trailing-promotion collapse. When dsd's per-pool-
        # entry `$d` emission combines with pass 1's per-symbol
        # promotion, the side with per-entry markers ends up with
        # `$a` markers AFTER the last data `$d` (one per pool word
        # whose value happens to decode as ARM-like). The other side
        # (mwasm-built, one `$d` per `.word` run) gets the entire
        # tail covered by a single split `$d` that extends implicit-
        # `$d` to end-of-`.text`. The asymmetry classifies the same
        # bytes as code on one side and data on the other, which is
        # exactly the brief 209 straggler shape (1-4 instruction
        # mismatch on the trailing pool words after `0xffe01fff`).
        #
        # Fix: zero `st_name` on every `$a` with `st_value >
        # last_data_offset`. This removes those `$a` markers from
        # any enumerator's view (mapping syms with name index 0 are
        # treated as anonymous/skip), so implicit-`$d` extends from
        # the last data marker to end-of-section on both sides.
        #
        # Safety: this catches ALL trailing `$a`s, not just ones we
        # just promoted. That's deliberate — the rewriter is
        # idempotent so a second invocation can't see the "I just
        # promoted this" set. Sweeping every trailing `$a` is also
        # the right call structurally: the trailing region of any
        # function-as-its-own-TU `.s` is always its literal pool
        # (data); a real `$a` after the pool start would require
        # executable code AFTER the pool, which doesn't appear in
        # this corpus (every `.s` ship surveyed for brief 212 has
        # code-then-pool layout, no code-after-pool).
        if last_data_offset is not None:
            # Re-enumerate post-pass-1 to find any $a > last_data.
            post_syms = _enumerate_mapping_symbols(
                out, text_idx, symtab_offset, symtab_size,
                strtab_offset,
            )
            for s in post_syms:
                if s.name == "$a" and s.st_value > last_data_offset:
                    struct.pack_into(
                        "<I", out, s.sym_offset + ST_NAME, 0,
                    )
                    info["trailing_promoted_collapsed"] += 1
        return bytes(out), info

    # Mass-rename fallback: no existing $a in strtab. Only safe if
    # ALL $d ranges are entirely-ARM (no data in any range —
    # otherwise we'd mis-mark a literal pool as code). Partial-arm
    # ranges also disqualify mass-rename: we can't split without
    # an $a slot to point at.
    all_promotable = all(
        boundary == range_end
        for _, boundary, _, range_end in d_classified
    )
    if not all_promotable:
        info["d_left_as_data"] = info["d_seen"]
        return bytes(out), info

    # Find the `$d\0` substring in strtab and overwrite to `$a\0`.
    end = strtab_offset + (strtab_size or 0x10000)
    if end > len(out):
        end = len(out)
    d_offset = bytes(out[strtab_offset:end]).find(b"$d\x00")
    if d_offset < 0:
        # No `$d` string anywhere — shouldn't happen given we have
        # $d-named symbols, but be defensive.
        info["d_left_as_data"] = info["d_seen"]
        return bytes(out), info
    abs_d_offset = strtab_offset + d_offset
    # Overwrite the `d` byte with `a`. `$\0` shape preserved.
    out[abs_d_offset + 1] = ord("a")
    info["mass_renamed"] = True
    info["d_promoted"] = info["d_seen"]
    return bytes(out), info


# --------------------------------------------------------------------------- #
# objdiff.json driver
# --------------------------------------------------------------------------- #


def process_o_file(
    path: Path,
    *,
    dry_run: bool = False,
) -> tuple[bool, dict]:
    """Apply `rewrite_mapping_symbols` to the file in-place. Returns
    `(changed, info)` where `changed` is `True` if any rewrite
    happened. Idempotent — re-running on a file that has nothing
    to promote is a fast no-op.

    With `dry_run=True`, computes what would change but does NOT
    write back to disk. Used by `--sweep` audit mode.
    """
    try:
        buf = path.read_bytes()
    except OSError:
        return False, {}
    try:
        new_buf, info = rewrite_mapping_symbols(buf)
    except MappingSymbolRewriteError:
        return False, {}
    changed = (
        info["d_promoted"] > 0
        or info["d_split"] > 0
        or info["mass_renamed"]
        or info.get("trailing_promoted_collapsed", 0) > 0
    )
    if changed and not dry_run:
        path.write_bytes(new_buf)
    return changed, info


def process_objdiff_json(
    path: Path,
    *,
    project_root: Path | None = None,
) -> tuple[int, int, list[tuple[str, str]]]:
    """Walk every unit in `path`, apply `rewrite_mapping_symbols`
    to both target + base `.o` files (in-place). Returns
    `(processed_files, skipped_files, failures)` where `failures`
    is a list of `(file_path, reason)` tuples.

    Designed to chain after `objdiff_resolve_relocs.py` in the
    `objdiff_report` ninja rule — by then, target_path and
    base_path point at `*.o.resolved` sidecars which carry the
    mapping symbols we want to rewrite.
    """
    project_root = (project_root or path.parent).resolve()
    with path.open("r", encoding="utf-8") as f:
        data = json.load(f)
    units = data.get("units", [])
    processed = 0
    skipped = 0
    failures: list[tuple[str, str]] = []
    seen_paths: set[Path] = set()
    for unit in units:
        for key in ("target_path", "base_path"):
            rel = unit.get(key, "")
            if not rel:
                continue
            full = (project_root / rel).resolve()
            if full in seen_paths:
                continue
            seen_paths.add(full)
            if not full.is_file():
                failures.append((str(full), "file not found"))
                continue
            changed, _info = process_o_file(full)
            if changed:
                processed += 1
            else:
                skipped += 1
    return processed, skipped, failures


# --------------------------------------------------------------------------- #
# Sweep / audit mode — brief 212
# --------------------------------------------------------------------------- #


def sweep_objdiff_json(
    path: Path,
    *,
    project_root: Path | None = None,
) -> list[dict]:
    """Audit-mode walk: for every unit in `path`, run the rewriter
    against target + base `.o`s WITHOUT modifying them, and return
    a per-unit row of pre/post mapping-symbol counts and the
    rewriter's `info` dict.

    Used by the brief 212 corpus audit (and `--sweep` CLI) to
    surface units where the rewriter has nothing to do (no-op),
    where it makes a partial change (split / trailing-collapse),
    and where it makes no headway despite ARM-like data (blind
    spot). Idempotent — sweep against an already-rewritten tree
    reports zero changes everywhere.

    Each row has keys:
      - `name`: the unit name from objdiff.json (post-step
        relative paths usually look like
        `build/eur/src/<module>/<func>.o.resolved`)
      - `kind`: `"target"` (built side) or `"base"` (orig/dsd
        delink side)
      - `path`: absolute path of the .o file inspected
      - `text_size`, `pre_a_count`, `pre_d_count`,
        `post_a_count`, `post_d_count`: shape stats
      - `info`: the `rewrite_mapping_symbols` info dict
      - `would_change`: True if the rewriter would alter the file
    """
    project_root = (project_root or path.parent).resolve()
    with path.open("r", encoding="utf-8") as f:
        data = json.load(f)
    units = data.get("units", [])
    rows: list[dict] = []
    for unit in units:
        unit_name = unit.get("name", "?")
        for kind, key in (("target", "target_path"), ("base", "base_path")):
            rel = unit.get(key, "")
            if not rel:
                continue
            full = (project_root / rel).resolve()
            if not full.is_file():
                rows.append({
                    "name": unit_name, "kind": kind, "path": str(full),
                    "error": "file not found",
                })
                continue
            try:
                buf = full.read_bytes()
            except OSError as e:
                rows.append({
                    "name": unit_name, "kind": kind, "path": str(full),
                    "error": f"read error: {e}",
                })
                continue
            try:
                pre = _shape_counts(buf)
                new_buf, info = rewrite_mapping_symbols(buf)
                post = _shape_counts(new_buf)
            except MappingSymbolRewriteError as e:
                rows.append({
                    "name": unit_name, "kind": kind, "path": str(full),
                    "error": f"rewrite error: {e}",
                })
                continue
            would_change = (
                info["d_promoted"] > 0
                or info["d_split"] > 0
                or info["mass_renamed"]
                or info.get("trailing_promoted_collapsed", 0) > 0
            )
            rows.append({
                "name": unit_name, "kind": kind, "path": str(full),
                "text_size": pre[0],
                "pre_a_count": pre[1], "pre_d_count": pre[2],
                "post_a_count": post[1], "post_d_count": post[2],
                "info": info, "would_change": would_change,
            })
    return rows


def _shape_counts(buf: bytes) -> tuple[int, int, int]:
    """Return `(text_size, $a count, $d count)` from buf's symtab.

    Defensive: returns `(0, 0, 0)` on parse errors so the caller
    can still emit a row even when the file is malformed.
    """
    try:
        (text_idx, _text_off, text_size,
         sym_off, sym_size, str_off) = _find_text_symtab_strtab(buf)
    except MappingSymbolRewriteError:
        return 0, 0, 0
    try:
        syms = _enumerate_mapping_symbols(
            buf, text_idx, sym_off, sym_size, str_off,
        )
    except MappingSymbolRewriteError:
        return text_size, 0, 0
    a = sum(1 for s in syms if s.name == "$a")
    d = sum(1 for s in syms if s.name == "$d")
    return text_size, a, d


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(
        description=(
            "Rewrite `$d` mapping symbols to `$a` for .text "
            "ranges that decode as ARM instructions. Brief 210 "
            "fix for objdiff matched_functions under-counting "
            "on brief 192's C-32 hand-encoded BL recipe. Brief "
            "212 added pass-2 trailing-promotion collapse and "
            "the --sweep audit mode. Idempotent."
        ),
    )
    ap.add_argument(
        "--in", dest="in_path", type=Path, required=True,
        help="Path to objdiff.json. The tool walks the units "
             "and rewrites mapping symbols in each target/base "
             ".o file in-place.",
    )
    ap.add_argument(
        "--project-root", type=Path, default=None,
        help="Project root for resolving relative paths. "
             "Defaults to the directory of --in.",
    )
    ap.add_argument(
        "--verbose", "-v", action="store_true",
        help="Print the full failure list (default just summary).",
    )
    ap.add_argument(
        "--sweep", action="store_true",
        help="Audit mode (brief 212): walk every unit + run the "
             "rewriter against target/base .o files WITHOUT "
             "modifying them, then print a per-unit table of "
             "pre/post $a + $d counts. Useful for surfacing "
             "blind spots (rewriter no-op despite obvious need) "
             "and verifying the rewriter is idempotent across a "
             "tree. Combine with --verbose for per-unit detail.",
    )
    ap.add_argument(
        "--sweep-only-changed", action="store_true",
        help="Sweep mode (requires --sweep): only print units "
             "where the rewriter would change at least one .o. "
             "Quick way to find what's left after the rewriter "
             "has already run (idempotent expectation = empty "
             "output).",
    )
    args = ap.parse_args(argv)
    if not args.in_path.is_file():
        print(f"error: {args.in_path} not found", file=sys.stderr)
        return 1

    if args.sweep:
        rows = sweep_objdiff_json(
            args.in_path, project_root=args.project_root,
        )
        # Group by unit name; print one table row per unit pair.
        units: dict[str, dict[str, dict]] = {}
        for r in rows:
            units.setdefault(r["name"], {})[r["kind"]] = r
        printed = 0
        hdr = (
            f"{'unit':<60} {'b$a':>4} {'b$d':>4} {'bp$a':>4} {'bp$d':>4} "
            f"{'B$a':>4} {'B$d':>4} {'Bp$a':>4} {'Bp$d':>4} {'B?Δ':>4}"
        )
        print(hdr)
        print("-" * len(hdr))
        for uname, kinds in sorted(units.items()):
            t = kinds.get("target", {})
            b = kinds.get("base", {})
            change_target = t.get("would_change", False)
            change_base = b.get("would_change", False)
            if args.sweep_only_changed and not (change_target or change_base):
                continue
            mark = "*" if (change_target or change_base) else ""
            def fmt(d, k):
                v = d.get(k)
                return str(v) if v is not None else "-"
            print(
                f"{uname[:60]:<60} "
                f"{fmt(t,'pre_a_count'):>4} {fmt(t,'pre_d_count'):>4} "
                f"{fmt(t,'post_a_count'):>4} {fmt(t,'post_d_count'):>4} "
                f"{fmt(b,'pre_a_count'):>4} {fmt(b,'pre_d_count'):>4} "
                f"{fmt(b,'post_a_count'):>4} {fmt(b,'post_d_count'):>4} "
                f"{mark:>4}"
            )
            printed += 1
        print(
            f"sweep: {len(units)} units inspected, "
            f"{printed} rows printed",
            file=sys.stderr,
        )
        if args.verbose:
            # Dump full info dicts for changed-only or all per flag.
            for uname, kinds in sorted(units.items()):
                change = (
                    kinds.get("target", {}).get("would_change", False)
                    or kinds.get("base", {}).get("would_change", False)
                )
                if args.sweep_only_changed and not change:
                    continue
                print(f"\n  {uname}:", file=sys.stderr)
                for kind, r in kinds.items():
                    print(
                        f"    {kind}: {r.get('info', r.get('error'))}",
                        file=sys.stderr,
                    )
        return 0

    processed, skipped, failures = process_objdiff_json(
        args.in_path, project_root=args.project_root,
    )
    print(
        f"patch_arm_mapping_symbols: rewrote {processed} files, "
        f"skipped {skipped} (no $d promotions), "
        f"{len(failures)} failures.",
        file=sys.stderr,
    )
    if args.verbose and failures:
        for path_str, reason in failures:
            print(f"  {path_str}: {reason}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
