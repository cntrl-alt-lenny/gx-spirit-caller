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

External-reference handling (brief 144)
---------------------------------------

For every `.word <name>` reference the generator emits, `<name>`
must be visible to the assembler. Two cases:

  - `<name>` is defined inside this chunk (i.e. it's one of the
    chunk's `.global <name>` labels): nothing extra needed.
  - `<name>` is NOT defined inside this chunk (a cross-chunk or
    cross-module reference): the chunk needs a `.extern <name>`
    declaration so mwasmarm can resolve the reference at link time.

The generator now emits the required `.extern` lines automatically.
Externs appear after `.section .rodata` and before the first
`.global`, in the order of first occurrence, deduplicated. This
matches the hand-edited convention established by briefs 135 wave
1 + 139 wave 2 (which closed the gap manually post-generation).

Before brief 144, every Pattern 3 wave (14 chunks shipped) had to
hand-add 1-5 `.extern` lines per chunk. Brief 144 closes the gap.

Usage:

  python tools/cluster_c_pattern3_gen.py --version eur --module main \\
      --start 0x020c387c --end 0x020c398c

  python tools/cluster_c_pattern3_gen.py --version eur --module main \\
      --start 0x020b4720 --end 0x020b4740 --dry-run

Brief 125 deliverable. Brief 128 (decomper) wave applies the generator
across the ~50-90 cluster C residue chunks per brief 119's pool estimate.
Brief 144 added automatic `.extern` emission.
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


def _module_delinks_path(version: str, module: str) -> Path:
    """Where the module's `delinks.txt` lives. Split out from
    `_module_load_addr` so both load-address parsing and the
    `--section` auto-detection (brief 159 part 1) can share the
    resolution rule."""
    config_root = ROOT / "config" / version / "arm9"
    if module == "main":
        return config_root / "delinks.txt"
    if module in ("itcm", "dtcm"):
        return config_root / module / "delinks.txt"
    if module.startswith("ov"):
        return config_root / "overlays" / module / "delinks.txt"
    return config_root / module / "delinks.txt"


# Sentinel returned by `_parse_section_header` when the leading
# section block is absent (rare; e.g. unit-test fixtures or a
# module whose delinks.txt is empty).
_NO_SECTIONS: list[tuple[str, int, int]] = []


def _parse_section_header(delinks: Path) -> list[tuple[str, int, int]]:
    """Read the leading section table of a `delinks.txt` and return
    `[(section_name_without_dot, start, end), …]` in file order.

    Stops at the first non-section line (typically the blank line
    that precedes the TU stanzas). Returns an empty list if the
    file is absent or has no section header (load_addr derivation
    falls back to 0 in that case, matching prior behaviour)."""
    if not delinks.is_file():
        return list(_NO_SECTIONS)
    out: list[tuple[str, int, int]] = []
    with delinks.open() as f:
        for line in f:
            line = line.strip()
            if not line:
                # Trailing blank inside the header is tolerated;
                # the loop terminates on the FIRST non-section
                # non-blank line below.
                continue
            if not line.startswith("."):
                break
            m_name = re.match(r"\.(\w+)", line)
            m_start = re.search(r"start:0x([0-9a-fA-F]+)", line)
            m_end = re.search(r"end:0x([0-9a-fA-F]+)", line)
            if m_name and m_start and m_end:
                out.append((
                    m_name.group(1),
                    int(m_start.group(1), 16),
                    int(m_end.group(1), 16),
                ))
    return out


def _module_load_addr(version: str, module: str) -> int:
    """Load address of a module's binary. The first section in
    `delinks.txt`'s header table starts at the load address."""
    sections = _parse_section_header(_module_delinks_path(version, module))
    return sections[0][1] if sections else 0


def _detect_section(
    version: str,
    module: str,
    start: int,
    end: int,
) -> str | None:
    """Auto-detect which section name covers `[start, end)` for
    the given module, by scanning `delinks.txt`'s section header.
    Returns the section name without leading dot (e.g. `"data"` or
    `"rodata"`), or `None` if no section in the header fully
    contains the range — caller falls back to the explicit
    `section` argument or the `rodata` default.

    Brief 159 part 1: lets `--section` default to auto-detection
    instead of the brief 125 historical `rodata` hardcode. D-3
    chunks (`.data`) and cluster C chunks (`.rodata`) become
    distinguishable from the chunk's address alone, no flag
    needed at the call site."""
    for name, sec_start, sec_end in _parse_section_header(
        _module_delinks_path(version, module),
    ):
        if sec_start <= start and end <= sec_end:
            return name
    return None


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
# External-reference detection — find symbols referenced by `.word` that
# aren't defined inside the chunk (so they need `.extern` declarations).
# Brief 144.
# --------------------------------------------------------------------------- #

# Pattern matches the single-line `.word <name>` directives emitted by
# `_emit_directives_for_bytes`. The name token is anything up to
# whitespace / end-of-line — symbol names in `symbols.txt` are plain
# identifiers (no spaces, commas, etc.) so a non-whitespace run is
# unambiguous. We deliberately ignore numeric `.word 0x...` (which the
# generator never emits — unresolved pointers fall through to `.byte`).
_WORD_REF_RE = re.compile(r"^\s*\.word\s+([A-Za-z_][A-Za-z0-9_]*)\s*$")


def _collect_external_refs(
    directive_lines: list[str],
    local_names: set[str],
) -> list[str]:
    """Walk emitted directives and return the ordered, deduplicated
    list of `.word <name>` targets that are NOT defined in
    `local_names` (the chunk's own `.global` symbols).

    Output order matches the order of first occurrence in
    `directive_lines` — this matches the hand-edited convention
    established by briefs 135 / 139 (extern block at the top of the
    chunk, ordered by first reference)."""
    seen: set[str] = set()
    out: list[str] = []
    for line in directive_lines:
        m = _WORD_REF_RE.match(line)
        if m is None:
            continue
        name = m.group(1)
        if name in local_names or name in seen:
            continue
        seen.add(name)
        out.append(name)
    return out


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
    section: str = "rodata",
    modules: dict | None = None,
    bytes_source: bytes | None = None,
    load_addr: int | None = None,
) -> GeneratedChunk:
    """Top-level: generate the Pattern 3 chunk for [start, end) in
    `module`.

    `section` controls both the `.section .<name>` directive at the
    top of the generated `.s` and the `.<name>` line in the
    delinks.txt entry. Must be one of `"rodata"` (brief 125 default —
    cluster C) or `"data"` (brief 157 D-3). Brief 159 part 1 added
    the parameter + auto-detection in the CLI; library callers can
    set it directly.

    `modules`, `bytes_source`, `load_addr` are injectable for tests.
    In production they default to loading from the on-disk config +
    extract/ tree.

    Raises ValueError on alignment violations or if no symbols are
    found in the range."""
    if section not in ("rodata", "data"):
        raise ValueError(
            f"section={section!r} not supported; pass 'rodata' "
            f"(default, cluster C) or 'data' (cluster D-3)"
        )
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
    for md in modules.values():
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
    for s, sz in zip(syms, sizes, strict=True):
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

    # Emit per-symbol directives first so we can scan them for any
    # `.word <external_name>` references that need `.extern`
    # declarations (brief 144). Two-pass: pass 1 builds the symbol
    # block + collects directives; pass 2 prepends the extern block.
    local_names = {s.name for s in syms}
    all_directives: list[str] = []
    symbol_block: list[str] = []
    for s, sz in zip(syms, sizes, strict=True):
        off = s.addr - load_addr
        body = bytes_source[off:off + sz]
        symbol_block.append(f"        .global {s.name}")
        symbol_block.append(f"{s.name}:")
        directives = _emit_directives_for_bytes(body, s.addr, ctx)
        symbol_block.extend(directives)
        symbol_block.append("")
        all_directives.extend(directives)
    extern_names = _collect_external_refs(all_directives, local_names)

    # Assemble the .s file.
    lines: list[str] = []
    lines.append("; Cluster C Pattern 3 chunk — brief 125 generator output.")
    lines.append(";")
    lines.append(f"; Module: {module}")
    lines.append(f"; Range:  0x{start:08x}..0x{end:08x} "
                 f"({end - start} bytes, {len(syms)} symbols)")
    lines.append("; Generated by tools/cluster_c_pattern3_gen.py")
    lines.append("")
    lines.append(f"        .section .{section}")
    lines.append("")
    if extern_names:
        # Brief 144: `.word <name>` references to symbols defined
        # outside this chunk need explicit `.extern` declarations
        # so mwasmarm can resolve them at link time. Emitted in
        # first-occurrence order, deduplicated.
        for name in extern_names:
            lines.append(f"        .extern {name}")
        lines.append("")

    lines.extend(symbol_block)
    asm = "\n".join(lines)

    # delinks.txt entry.
    rel_asm = Path("src") / module / "data" / f"data_{start:08x}.s"
    delinks_entry = (
        f"{rel_asm}:\n"
        f"    complete\n"
        f"    .{section} start:0x{start:08x} end:0x{end:08x}\n"
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
    ap.add_argument(
        "--section",
        choices=("auto", "rodata", "data"),
        default="auto",
        help=(
            "Section to emit (controls both the `.section .X` "
            "directive in the .s and the `.X start:..` line in the "
            "delinks entry). `auto` (default) reads delinks.txt's "
            "section header and picks the section that fully "
            "contains [start, end). Falls back to `rodata` if no "
            "section in the header matches — preserves brief 125 / "
            "135 / 139 / 144 behaviour for cluster C callers. "
            "`rodata` and `data` force the choice explicitly "
            "(brief 159 part 1 added the flag; D-3 chunks live in "
            ".data, cluster C in .rodata)."
        ),
    )
    args = ap.parse_args()

    if args.section == "auto":
        detected = _detect_section(
            args.version, args.module, args.start, args.end,
        )
        if detected in ("rodata", "data"):
            section = detected
        else:
            section = "rodata"
            print(
                f"note: --section auto: no header section in "
                f"{_module_delinks_path(args.version, args.module)} "
                f"fully contains 0x{args.start:08x}..0x{args.end:08x}; "
                f"falling back to .rodata (brief 125 cluster C "
                f"default). Pass --section explicitly to override.",
                file=sys.stderr,
            )
    else:
        section = args.section

    try:
        chunk = generate_chunk(
            args.version, args.module, args.start, args.end,
            section=section,
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
