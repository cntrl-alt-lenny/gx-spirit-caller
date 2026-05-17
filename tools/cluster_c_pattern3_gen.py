#!/usr/bin/env python3

"""
cluster_c_pattern3_gen.py — generator for brief 119 cluster C Pattern 3.

Brief 119 identified 3 patterns for cluster C `.rodata` symbol carving:

  Pattern 1: claim a single symbol whose size is naturally 4-aligned
             (Pattern-1 hand-write via .c or .s; brief 122 shipped 37).
  Pattern 2: claim a contiguous group of symbols whose summed size is
             4-aligned AND whose last embedded symbol's deduced size
             fits within the chunk (brief 121 verified, 17 dsd-eligible
             runs in main .rodata).
  Pattern 3: chunk an entire .rodata region containing N symbols, with
             explicit byte content for each. Sidesteps the Pattern 2
             constraint by INCLUDING all bytes the last embedded
             symbol's deduced size covers.

This tool generates Pattern 3 `.s` chunks. Output:

  - `src/<module>/data/data_<start>.s` — mwasmarm `.section .rodata` +
    per-symbol `.global` + `.ascii` / `.word` / `.byte` directives.
  - Stdout: the delinks.txt TU entry to append to
    `config/<ver>/<module>/delinks.txt`.

Byte-pattern selection per symbol (in priority order):
  1. printable ASCII + null-term → `.ascii "..."` + `.byte 0x00`
  2. 4-byte value that resolves to a known symbol → `.word <name>`
  3. otherwise → `.byte 0xNN, 0xNN, ...`

Usage:

  python tools/cluster_c_pattern3_gen.py --version eur --module main \\
      --start 0x020c387c --end 0x020c398c

  python tools/cluster_c_pattern3_gen.py --version eur --module main \\
      --start 0x020b4720 --end 0x020b4740 --dry-run

Brief 125 deliverable. Brief 128 (decomper) wave applies the generator
across the ~50-90 cluster C residue chunks per brief 119's pool estimate.
"""

from __future__ import annotations

import argparse
import re
import sys
from dataclasses import dataclass
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import (  # noqa: E402
    ROOT,
    Symbol,
    load_all,
)


# --------------------------------------------------------------------------- #
# Module → binary path (matches data_worklist v2's mapping).
# --------------------------------------------------------------------------- #

def _extract_bin_path(version: str, module: str) -> Path:
    """Where dsd's extract step writes the per-module .bin (the
    authoritative byte source — distinct from `build/<ver>/build/`
    which is the freshly-linked output)."""
    extract_root = ROOT / "extract" / version / "arm9"
    if module == "main":
        return extract_root / "arm9.bin"
    if module in ("itcm", "dtcm"):
        return extract_root / f"{module}.bin"
    if module.startswith("ov"):
        # e.g. ov000 → arm9_ov000.bin
        return extract_root / f"arm9_{module}.bin"
    return extract_root / f"{module}.bin"


def _module_load_addr(version: str, module: str) -> int:
    """Load address of a module's binary. Parsed from the section
    header in config/<ver>/<module>/delinks.txt."""
    config_root = ROOT / "config" / version / "arm9"
    if module == "main":
        delinks = config_root / "delinks.txt"
    elif module in ("itcm", "dtcm"):
        delinks = config_root / module / "delinks.txt"
    elif module.startswith("ov"):
        delinks = config_root / "overlays" / module / "delinks.txt"
    else:
        delinks = config_root / module / "delinks.txt"
    if not delinks.is_file():
        return 0
    with delinks.open() as f:
        for line in f:
            line = line.strip()
            if line.startswith("."):
                # First section line — start address is the load addr.
                m = re.search(r"start:0x([0-9a-fA-F]+)", line)
                if m:
                    return int(m.group(1), 16)
            if line and not line.startswith("."):
                break
    return 0


# --------------------------------------------------------------------------- #
# Byte-pattern selection — pick the right mwasmarm directive per symbol.
# --------------------------------------------------------------------------- #

# Match a printable-ASCII run terminated by null. The directive
# generator uses this to decide `.ascii "..."` vs raw bytes.
_PRINTABLE_ASCII = bytes(b for b in range(0x20, 0x7f))


def _looks_like_ascii_string(b: bytes) -> bool:
    """True if `b` ends in a null and all preceding bytes are printable
    ASCII (≥1 printable byte). Brief 117's ASCII4 heuristic generalized
    to any length."""
    if len(b) < 2 or b[-1] != 0:
        return False
    body = b[:-1]
    if not body:
        return False
    return all(c in _PRINTABLE_ASCII or c in (0x09, 0x0a) for c in body)


def _is_pointer_target_known(
    word: int,
    sym_lookup: dict[int, str],
) -> str | None:
    """If `word` is the address of a known symbol, return that
    symbol's name. Otherwise None.

    The `sym_lookup` map is (addr → symbol_name) across ALL modules
    (so cross-module references resolve)."""
    return sym_lookup.get(word)


def _escape_ascii_for_asm(b: bytes) -> str:
    """Escape bytes for a `.ascii "..."` directive. Caller has
    already verified `b` is null-stripped printable ASCII (no null
    terminator inside `b`)."""
    out = []
    for c in b:
        if c == 0x22:  # double quote
            out.append('\\"')
        elif c == 0x5c:  # backslash
            out.append("\\\\")
        elif c == 0x09:
            out.append("\\t")
        elif c == 0x0a:
            out.append("\\n")
        elif 0x20 <= c <= 0x7e:
            out.append(chr(c))
        else:
            # Shouldn't happen given caller filter; defensive fallback.
            out.append(f"\\x{c:02x}")
    return "".join(out)


# --------------------------------------------------------------------------- #
# Per-symbol directive emit.
# --------------------------------------------------------------------------- #

@dataclass
class GenContext:
    """Inputs threaded through generation."""
    version: str
    module: str
    bytes_source: bytes              # entire extract/arm9.bin (or per-module)
    load_addr: int                   # base address of bytes_source
    sym_by_addr: dict[int, str]      # all named symbols across all modules
    indent: str = "        "         # 8-space mwasmarm convention


def _emit_directives_for_bytes(
    b: bytes,
    addr: int,
    ctx: GenContext,
) -> list[str]:
    """Render `b` (which lives at memory address `addr`) into mwasmarm
    directives. Per-symbol-aware: tries ASCII first, then 4-byte
    pointer-of-known-symbol, then raw bytes.

    Splits at internal pointer boundaries — e.g., a 16-byte block where
    bytes 0-3 are a pointer + bytes 4-15 are non-pointer becomes:
        .word data_X            ; the pointer
        .byte 0x..., 0x..., ... ; the rest
    """
    if not b:
        return []
    # Whole-block heuristics first.
    if _looks_like_ascii_string(b):
        # Trim the trailing null; emit body via .ascii + explicit null.
        body = b[:-1]
        return [
            f'{ctx.indent}.ascii "{_escape_ascii_for_asm(body)}"',
            f'{ctx.indent}.byte 0x00',
        ]
    # If size is exactly 4 and value is a known pointer, emit as .word.
    if len(b) == 4 and (addr % 4 == 0):
        word = int.from_bytes(b, "little")
        target = _is_pointer_target_known(word, ctx.sym_by_addr)
        if target is not None:
            return [f"{ctx.indent}.word {target}"]
    # For multi-word blocks, scan for 4-byte aligned pointer slots.
    if len(b) >= 4 and addr % 4 == 0:
        directives: list[str] = []
        i = 0
        byte_buf: list[int] = []
        while i < len(b):
            # Try 4-byte pointer at aligned offset.
            if i + 4 <= len(b) and (addr + i) % 4 == 0:
                word = int.from_bytes(b[i:i + 4], "little")
                target = _is_pointer_target_known(word, ctx.sym_by_addr)
                if target is not None:
                    if byte_buf:
                        directives.append(_render_byte_directive(byte_buf, ctx))
                        byte_buf = []
                    directives.append(f"{ctx.indent}.word {target}")
                    i += 4
                    continue
            byte_buf.append(b[i])
            i += 1
        if byte_buf:
            directives.append(_render_byte_directive(byte_buf, ctx))
        return directives
    # Fallback: raw bytes.
    return [_render_byte_directive(list(b), ctx)]


def _render_byte_directive(b: list[int], ctx: GenContext) -> str:
    """Render a `.byte 0x.., 0x.., ...` directive, wrapping at 8 bytes
    per line for readability when needed."""
    if len(b) <= 8:
        return f"{ctx.indent}.byte " + ", ".join(f"0x{c:02x}" for c in b)
    # Multi-line: 8 bytes per .byte directive.
    lines = []
    for i in range(0, len(b), 8):
        chunk = b[i:i + 8]
        lines.append(f"{ctx.indent}.byte " + ", ".join(f"0x{c:02x}" for c in chunk))
    return "\n".join(lines)


# --------------------------------------------------------------------------- #
# Chunk discovery — find symbols in a [start, end) range.
# --------------------------------------------------------------------------- #

def _symbols_in_range(
    modules: dict,
    module: str,
    start: int,
    end: int,
) -> list[Symbol]:
    """Return all data/bss symbols in the [start, end) range of
    `module`, sorted by address."""
    md = modules.get(module)
    if md is None:
        return []
    return sorted(
        [s for s in md.symbols
         if s.type in ("data", "bss") and start <= s.addr < end],
        key=lambda s: s.addr,
    )


def _deduce_sizes(
    syms: list[Symbol],
    end: int,
) -> list[int]:
    """For each symbol in `syms` (address-sorted), compute the deduced
    size = next_symbol_addr - this_addr, with the last symbol filling
    to `end`. Mirrors dsd's symbol-size deduction behavior."""
    sizes: list[int] = []
    for i, s in enumerate(syms):
        if i + 1 < len(syms):
            sizes.append(syms[i + 1].addr - s.addr)
        else:
            sizes.append(end - s.addr)
    return sizes


# --------------------------------------------------------------------------- #
# Top-level generation
# --------------------------------------------------------------------------- #

@dataclass
class GeneratedChunk:
    """Result of generating a Pattern 3 chunk."""
    asm_source: str                  # the .s file body
    delinks_entry: str               # the TU line block
    relative_asm_path: Path          # src/<module>/data/data_<addr>.s
    symbol_count: int


def _validate_chunk_alignment(start: int, end: int) -> None:
    """Pattern 3 chunks must be 4-aligned at both start and end (W6
    mitigation). Raise ValueError if not."""
    if start % 4 != 0:
        raise ValueError(
            f"chunk start 0x{start:08x} is not 4-aligned (W6 risk)"
        )
    if end % 4 != 0:
        raise ValueError(
            f"chunk end 0x{end:08x} is not 4-aligned (W6 risk)"
        )
    if end <= start:
        raise ValueError(
            f"chunk end 0x{end:08x} must be > start 0x{start:08x}"
        )


def generate_chunk(
    version: str,
    module: str,
    start: int,
    end: int,
    *,
    modules: dict | None = None,
    bytes_source: bytes | None = None,
    load_addr: int | None = None,
) -> GeneratedChunk:
    """Top-level: generate the Pattern 3 chunk for [start, end) in
    `module`.

    `modules`, `bytes_source`, `load_addr` are injectable for tests.
    In production they default to loading from the on-disk config +
    extract/ tree.

    Raises ValueError on alignment violations or if no symbols are
    found in the range."""
    _validate_chunk_alignment(start, end)

    if modules is None:
        modules = load_all(ROOT / "config" / version)
    if bytes_source is None:
        bin_path = _extract_bin_path(version, module)
        if not bin_path.is_file():
            raise ValueError(
                f"extract binary not found: {bin_path.relative_to(ROOT)}"
            )
        bytes_source = bin_path.read_bytes()
    if load_addr is None:
        load_addr = _module_load_addr(version, module)

    # Cross-module symbol lookup for pointer resolution.
    sym_by_addr: dict[int, str] = {}
    for mod_name, md in modules.items():
        for s in md.symbols:
            sym_by_addr.setdefault(s.addr, s.name)

    syms = _symbols_in_range(modules, module, start, end)
    if not syms:
        raise ValueError(
            f"no data/bss symbols found in 0x{start:08x}..0x{end:08x} "
            f"of {module}"
        )

    sizes = _deduce_sizes(syms, end)

    # Pre-flight: verify all symbol bytes can be read from the binary.
    for s, sz in zip(syms, sizes):
        off = s.addr - load_addr
        if off < 0 or off + sz > len(bytes_source):
            raise ValueError(
                f"symbol {s.name} at 0x{s.addr:08x} (size {sz}) "
                f"exceeds binary extent"
            )

    ctx = GenContext(
        version=version,
        module=module,
        bytes_source=bytes_source,
        load_addr=load_addr,
        sym_by_addr=sym_by_addr,
    )

    # Assemble the .s file.
    lines: list[str] = []
    lines.append(f"; Cluster C Pattern 3 chunk — brief 125 generator output.")
    lines.append(f";")
    lines.append(f"; Module: {module}")
    lines.append(f"; Range:  0x{start:08x}..0x{end:08x} "
                 f"({end - start} bytes, {len(syms)} symbols)")
    lines.append(f"; Generated by tools/cluster_c_pattern3_gen.py")
    lines.append(f"")
    lines.append(f"        .section .rodata")
    lines.append(f"")

    for s, sz in zip(syms, sizes):
        off = s.addr - load_addr
        body = bytes_source[off:off + sz]
        lines.append(f"        .global {s.name}")
        lines.append(f"{s.name}:")
        directives = _emit_directives_for_bytes(body, s.addr, ctx)
        lines.extend(directives)
        lines.append("")
    asm = "\n".join(lines)

    # delinks.txt entry.
    rel_asm = Path("src") / module / "data" / f"data_{start:08x}.s"
    delinks_entry = (
        f"{rel_asm}:\n"
        f"    complete\n"
        f"    .rodata start:0x{start:08x} end:0x{end:08x}\n"
    )

    return GeneratedChunk(
        asm_source=asm,
        delinks_entry=delinks_entry,
        relative_asm_path=rel_asm,
        symbol_count=len(syms),
    )


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def main() -> int:
    ap = argparse.ArgumentParser(
        description="Generate a cluster C Pattern 3 .s chunk per "
                    "brief 119's recipe.",
    )
    ap.add_argument("--version", default="eur",
                    help='Game version (default: "eur").')
    ap.add_argument("--module", required=True,
                    help="Module name (main / itcm / dtcm / ov000-ov023).")
    ap.add_argument("--start", required=True,
                    type=lambda s: int(s, 0),
                    help="Chunk start address (4-aligned). e.g. 0x020c387c")
    ap.add_argument("--end", required=True,
                    type=lambda s: int(s, 0),
                    help="Chunk end address (4-aligned). e.g. 0x020c398c")
    ap.add_argument("--dry-run", action="store_true",
                    help="Print the .s + delinks entry to stdout; don't write files.")
    args = ap.parse_args()

    try:
        chunk = generate_chunk(
            args.version, args.module, args.start, args.end,
        )
    except ValueError as e:
        print(f"error: {e}", file=sys.stderr)
        return 1

    if args.dry_run:
        print(f"=== .s file ({chunk.symbol_count} symbols) ===")
        print(chunk.asm_source)
        print()
        print("=== delinks.txt entry ===")
        print(chunk.delinks_entry)
        return 0

    # Write the .s file.
    asm_path = ROOT / chunk.relative_asm_path
    asm_path.parent.mkdir(parents=True, exist_ok=True)
    asm_path.write_text(chunk.asm_source, encoding="utf-8")
    print(f"Wrote {chunk.relative_asm_path}", file=sys.stderr)
    print()
    print("Append the following to "
          f"config/{args.version}/arm9/"
          f"{'' if args.module == 'main' else args.module + '/'}delinks.txt:")
    print()
    print(chunk.delinks_entry)
    return 0


if __name__ == "__main__":
    sys.exit(main())
