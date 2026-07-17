#!/usr/bin/env python3
"""emit_data_blob.py — raw-byte data emitter (briefs 578 and 607).

WHY THIS EXISTS
---------------
`batch_carve.py` only carves FUNCTIONS: its `--whole-function` strategy
(`asm_escape.py --whole-function`) disassembles the original bytes into
ARM/Thumb instructions and re-emits them as a `.s` TU, then gates on
`ninja sha1` re-assembling to the identical bytes. That round-trip can
fail even for a perfectly ordinary-looking function body — some byte
sequences have more than one valid disassembly/re-encoding, and the
assembler doesn't always pick the same one the original compiler did.
When that happens the candidate is parked as `verify-fail`, forever,
because no amount of re-disassembling changes the outcome.

Brief 572 closed EUR's 79-function residual floor down to exactly 2 such
`verify-fail` parks: `func_020b2d2c` (0x3b8 bytes) and `func_020b3c78`
(0x544 bytes), both in `arm9/main`. Both disassemble as entirely
plausible ARM code (clean `push {lr}` / `bx lr` framing) — this is NOT
"this address secretly contains non-code data"; it is "the normal
disassemble-then-reassemble .s path cannot reproduce these particular
bytes losslessly." The fix that actually works, confirmed empirically
against this worktree's real `ninja sha1` gate before this tool was
written: emit the SAME bytes as raw `.byte` directives in a `.text`
section instead of as instructions. A byte-for-byte copy has no
translation step to introduce a mismatch, so it is byte-identical by
construction regardless of what the original encoding was.

Symbol identity is left untouched on purpose: the symbol keeps its
existing name and `kind:function(...)` entry in `symbols.txt` (verified
empirically — see the brief-578 report). Reclassifying to `kind:data`
and renaming to a `data_*` symbol was evaluated and rejected: it has
zero precedent anywhere in this repo (no `kind:data` symbol currently
receives an `arm_call`/`arm_branch` reloc), it would require rewriting
every caller's `.extern`/`bl` reference by name across however many
files reference it, and — critically — it isn't needed. The bytes ARE a
function (real ARM code, real callers); only the .s *emission strategy*
needed to become data-shaped, which is what "whole-function-as-data"
means here.

WHAT IT DOES
------------
1. Resolve the module's binary + RAM base address from
   `extract/<version>/arm9/arm9.yaml` (or `arm9_overlays/overlays.yaml`
   for a `--overlay ovNNN` target), read exactly `size` ground-truth
   bytes at `addr` from the matching `.bin`.
2. Resolve the symbol name at `addr` from `config/<version>/.../
   symbols.txt` (or accept an explicit `--name` override for an address
   with no existing symbol) and cross-check its declared size against
   `size`/`--end` — a mismatch aborts rather than silently carving the
   wrong range.
3. Refuse if `addr` is already claimed by an existing delinks.txt TU
   (a real overlap, not a gap) — this is the "document precisely and
   park, don't force" guardrail from the brief.
4. Emit `src/<srcdir>/<name>.s`: a header comment (this tool + range +
   why), then `.text` / `.global <name>` / `<name>:` / 16-bytes-per-row
   `.byte` directives — matching the header-comment convention already
   used by `func_*.s` whole-function ships (brief 302) and the
   `data_*.s` cluster convention (brief 125), but in `.text` (not
   `.rodata`/`.data`) because that's the section this address range
   actually belongs to per the module's own section map.
5. Insert the delinks.txt TU entry by reusing `batch_carve.py`'s own
   `delink_block` / `newline_guard`, appending, then re-sorting via
   `tools/sort_delinks.py`'s `sort_delinks()` and auditing the result
   with `batch_carve.py`'s `audit()` — the exact same canonical
   parse/sort/audit path batch_carve itself uses, so a blob's delinks
   entry looks indistinguishable from one batch_carve would have made.

This tool never touches symbols.txt and never runs a build itself —
call `python tools/configure.py <version> && ninja sha1` after, same as
any other source change.

Usage:
    python tools/emit_data_blob.py --version eur --addr 0x02000000 \
        --size 0x86 --name SecureAreaData_02000000 --from-orig --verify
    python tools/emit_data_blob.py --version eur --addr 0x020b2d2c --size 0x3b8
    python tools/emit_data_blob.py --version eur --addr 0x020b2d2c --end 0x020b30e4
    python tools/emit_data_blob.py --version eur --addr 0x020b2d2c --size 0x3b8 --dry-run
"""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(Path(__file__).resolve().parent))
from batch_carve import audit, carved_addrs, delink_block, newline_guard, parse_symbol_addrs, parse_symbols  # noqa: E402
from sort_delinks import sort_delinks  # noqa: E402

_BYTES_PER_ROW = 16
_ARM9_BASE = 0x02000000
_SECURE_AREA_RAM_END = 0x02000800
_SECURE_AREA_ROM_OFFSET = 0x4000


class BlobError(RuntimeError):
    """A precise, user-facing reason this blob can't be emitted — the
    brief's 'document precisely and park, don't force' guardrail."""


# --------------------------------------------------------------------------- #
# Ground-truth byte range resolution (no pyyaml — same hand-parse convention
# as find_region_siblings.py's _read_yaml_int / _read_overlay_base)
# --------------------------------------------------------------------------- #


def _read_yaml_int(path: Path, key: str) -> int | None:
    """Top-level `key: <int>` scalar reader — avoids a pyyaml dependency
    for the one field (`base_address`) this tool actually needs."""
    pattern = re.compile(rf"^{re.escape(key)}:\s*(\d+)\s*$")
    for line in path.read_text(encoding="utf-8", errors="replace").splitlines():
        m = pattern.match(line)
        if m:
            return int(m.group(1))
    return None


def _read_overlay_base(path: Path, overlay_id: int) -> int | None:
    """Hand-parsed `base_address` lookup for one entry of a list-of-
    mappings `overlays.yaml` (avoids pyyaml, same as find_region_siblings.py)."""
    current_id: int | None = None
    id_re = re.compile(r"^\s+-?\s*id:\s*(\d+)\s*$")
    base_re = re.compile(r"^\s+base_address:\s*(\d+)\s*$")
    for line in path.read_text(encoding="utf-8", errors="replace").splitlines():
        m = id_re.match(line)
        if m:
            current_id = int(m.group(1))
            continue
        m = base_re.match(line)
        if m and current_id == overlay_id:
            return int(m.group(1))
    return None


def module_binary_and_base(version: str, overlay: str | None) -> tuple[Path, int]:
    """(bin_path, ram_base_address) for arm9 main or one overlay."""
    extract_arm9 = ROOT / "extract" / version / "arm9"
    if overlay is None:
        yaml_path = extract_arm9 / "arm9.yaml"
        bin_path = extract_arm9 / "arm9.bin"
        if not (yaml_path.is_file() and bin_path.is_file()):
            raise BlobError(f"missing {yaml_path} or {bin_path} (is {version!r} extracted here?)")
        base = _read_yaml_int(yaml_path, "base_address")
        if base is None:
            raise BlobError(f"{yaml_path} has no base_address key")
        return bin_path, base

    overlay_id = int(overlay[2:])
    ov_dir = ROOT / "extract" / version / "arm9_overlays"
    yaml_path = ov_dir / "overlays.yaml"
    bin_path = ov_dir / f"overlay{overlay_id:04d}.bin"
    if not bin_path.is_file():
        # dsd's extracted overlay bin naming has varied historically; fall
        # back to a glob so a real mismatch is reported precisely instead
        # of just "file not found" on a guessed name.
        candidates = sorted(ov_dir.glob(f"overlay{overlay_id:04d}*.bin"))
        if not candidates:
            raise BlobError(f"no overlay bin for {overlay} under {ov_dir}")
        bin_path = candidates[0]
    if not yaml_path.is_file():
        raise BlobError(f"missing {yaml_path}")
    base = _read_overlay_base(yaml_path, overlay_id)
    if base is None:
        raise BlobError(f"{yaml_path} has no base_address entry for overlay id {overlay_id}")
    return bin_path, base


def read_ground_truth_bytes(version: str, overlay: str | None, addr: int, size: int) -> bytes:
    bin_path, base = module_binary_and_base(version, overlay)
    data = bin_path.read_bytes()
    offset = addr - base
    if offset < 0 or offset + size > len(data):
        raise BlobError(
            f"0x{addr:08x}+0x{size:x} is outside {bin_path} "
            f"(base 0x{base:08x}, {len(data)} bytes)"
        )
    return data[offset:offset + size]


def read_secure_area_bytes(version: str, addr: int, size: int) -> bytes:
    """Read secure-area bytes directly from the original ROM."""
    rom_path = ROOT / "orig" / f"baserom_{version}.nds"
    if not rom_path.is_file():
        raise BlobError(f"missing original ROM {rom_path}")
    offset = _SECURE_AREA_ROM_OFFSET + (addr - _ARM9_BASE)
    data = rom_path.read_bytes()
    if (addr < _ARM9_BASE or addr + size > _SECURE_AREA_RAM_END
            or offset < 0 or offset + size > len(data)):
        raise BlobError(
            f"0x{addr:08x}+0x{size:x} is outside secure area in {rom_path}"
        )
    return data[offset:offset + size]


# --------------------------------------------------------------------------- #
# Symbol + delinks resolution
# --------------------------------------------------------------------------- #


def symbols_txt_path(version: str, overlay: str | None) -> Path:
    arm9_dir = ROOT / "config" / version / "arm9"
    if overlay is None:
        return arm9_dir / "symbols.txt"
    return arm9_dir / "overlays" / overlay / "symbols.txt"


def delinks_txt_path(version: str, overlay: str | None) -> Path:
    arm9_dir = ROOT / "config" / version / "arm9"
    if overlay is None:
        return arm9_dir / "delinks.txt"
    return arm9_dir / "overlays" / overlay / "delinks.txt"


def srcdir_for(overlay: str | None) -> str:
    if overlay is None:
        return "src/main"
    return f"src/overlay{overlay[2:]}"


def resolve_name_and_declared_size_from_text(
    symbols_text: str, addr: int, explicit_name: str | None
) -> tuple[str, int | None]:
    """PURE: (name, declared_size_or_None) from already-read symbols.txt
    text. Prefers the real symbol at `addr`; `explicit_name` is only used
    when no symbol exists there. Raises BlobError with no usable name."""
    addrs = parse_symbol_addrs(symbols_text)
    sizes = parse_symbols(symbols_text)
    for name, sym_addr in addrs.items():
        if sym_addr == addr:
            return name, sizes.get(name)
    if explicit_name:
        return explicit_name, None
    raise BlobError(
        f"no kind:function symbol at 0x{addr:08x} in symbols.txt — "
        f"pass --name to label a genuinely un-symbolled address"
    )


def resolve_name_and_declared_size(
    version: str, overlay: str | None, addr: int, explicit_name: str | None
) -> tuple[str, int | None]:
    sym_path = symbols_txt_path(version, overlay)
    text = sym_path.read_text(encoding="utf-8") if sym_path.is_file() else ""
    try:
        return resolve_name_and_declared_size_from_text(text, addr, explicit_name)
    except BlobError:
        raise BlobError(
            f"no kind:function symbol at 0x{addr:08x} in {sym_path} — "
            f"pass --name to label a genuinely un-symbolled address"
        ) from None


def check_not_already_claimed_in_text(delinks_text: str, addr: int) -> None:
    """PURE: raises BlobError if `addr` is already claimed in delinks_text."""
    if addr in carved_addrs(delinks_text):
        raise BlobError(f"0x{addr:08x} is already claimed by a delinks.txt TU")


def check_not_already_claimed(delinks_path: Path, addr: int) -> None:
    text = delinks_path.read_text(encoding="utf-8") if delinks_path.is_file() else ""
    try:
        check_not_already_claimed_in_text(text, addr)
    except BlobError:
        raise BlobError(f"0x{addr:08x} is already claimed by a delinks.txt TU in {delinks_path}") from None


# --------------------------------------------------------------------------- #
# .s rendering
# --------------------------------------------------------------------------- #


def render_data_blob_s(
    name: str, addr: int, data: bytes, *, description: str | None = None
) -> str:
    end = addr + len(data)
    title = description or "whole-function-as-data emission (brief 578"
    lines = [f"; {name} — {title},", "; tools/emit_data_blob.py).", "",
             f"; Range: 0x{addr:08x}..0x{end:08x} ({len(data)} bytes)"]
    if description:
        lines.extend([
            "; Verbatim bytes copied from the original ROM secure area.",
            "; This is opaque encrypted data, not reverse-engineered source.",
        ])
    else:
        lines.extend([
            "; The ground-truth bytes at this address disassemble as plausible",
            "; ARM code but do not round-trip byte-identically through the normal",
            "; disassemble/reassemble .s path (batch_carve verify-fail, brief",
            "; 572) — emitted as raw .byte data instead of instructions so there",
            "; is no disassembler/assembler translation step left to mismatch.",
        ])
    lines.extend(["", "        .text", f"        .global {name}", f"{name}:"])
    for i in range(0, len(data), _BYTES_PER_ROW):
        row = data[i:i + _BYTES_PER_ROW]
        hexbytes = ", ".join(f"0x{b:02x}" for b in row)
        lines.append(f"        .byte {hexbytes}")
    lines.append("")
    return "\n".join(lines)


def decode_data_blob_s(s_text: str) -> bytes:
    """Decode the .byte directives emitted by render_data_blob_s."""
    out = bytearray()
    for line in s_text.splitlines():
        match = re.match(r"^\s*\.byte\s+(.+)$", line)
        if not match:
            continue
        for token in match.group(1).split(","):
            token = token.strip()
            if token:
                out.append(int(token, 0))
    return bytes(out)


# --------------------------------------------------------------------------- #
# delinks.txt insertion (reuses batch_carve.py's own block/sort/audit path)
# --------------------------------------------------------------------------- #


def insert_delinks_entry(
    delinks_path: Path, name: str, addr: int, size: int, srcdir: str,
    symbol_sizes: dict[str, int], comment: str | None = None,
) -> list[str]:
    """Append the new TU block, sort, and audit. Returns audit() problems
    (empty == clean). Does not write if dry-run is handled by the caller —
    this function always writes (callers gate on --dry-run themselves)."""
    text = newline_guard(delinks_path.read_text(encoding="utf-8") if delinks_path.is_file() else "")
    block = delink_block(name, addr, size, srcdir)
    if comment:
        block = block.replace("    .text start:", f"    # {comment}\n    .text start:")
    text += block
    delinks_path.write_text(text, encoding="utf-8")
    sort_delinks(str(delinks_path))
    return audit(delinks_path.read_text(encoding="utf-8"), symbol_sizes)


# --------------------------------------------------------------------------- #
# Driver
# --------------------------------------------------------------------------- #


def emit(
    version: str, addr: int, size: int, *, overlay: str | None = None,
    name: str | None = None, dry_run: bool = False, srcdir: str | None = None,
    from_orig: bool = False, verify: bool = False,
) -> dict:
    """Do the whole thing for one blob. Returns a result dict (also used
    directly by tests). Raises BlobError with a precise reason on any
    guardrail trip — callers should catch it and park, not force.

    `srcdir` (brief 577 autopsy) overrides `srcdir_for(overlay)`'s default
    EUR-baseline path (`src/main` / `src/overlayNNN`) — pass e.g.
    `src/usa/main` for a USA-region candidate, matching `batch_carve.py`'s
    own `--srcdir` convention, so a region-specific blob doesn't land in
    the region-neutral EUR tree and get pulled into every region's build."""
    delinks_path = delinks_txt_path(version, overlay)
    resolved_name, declared_size = resolve_name_and_declared_size(version, overlay, addr, name)
    if declared_size is not None and declared_size != size:
        raise BlobError(
            f"{resolved_name}: symbols.txt declares size 0x{declared_size:x}, "
            f"but 0x{size:x} was requested — refusing to carve a mismatched range"
        )
    check_not_already_claimed(delinks_path, addr)
    if from_orig and overlay is not None:
        raise BlobError("--from-orig is only valid for ARM9 main")
    data = (read_secure_area_bytes(version, addr, size)
            if from_orig else read_ground_truth_bytes(version, overlay, addr, size))
    srcdir = srcdir or srcdir_for(overlay)
    description = "secure-area raw-byte copy from orig (brief 607)" if from_orig else None
    s_text = render_data_blob_s(resolved_name, addr, data, description=description)
    if verify and decode_data_blob_s(s_text) != data:
        raise BlobError(f"{resolved_name}: emitted .byte data failed static round-trip")
    s_path = ROOT / srcdir / f"{resolved_name}.s"

    result = {
        "name": resolved_name, "addr": addr, "size": size,
        "s_path": str(s_path.relative_to(ROOT)),
        "delinks_path": str(delinks_path.relative_to(ROOT)),
    }
    if dry_run:
        result["dry_run"] = True
        return result

    s_path.parent.mkdir(parents=True, exist_ok=True)
    s_path.write_text(s_text, encoding="utf-8")

    sym_path = symbols_txt_path(version, overlay)
    sym_text = sym_path.read_text(encoding="utf-8") if sym_path.is_file() else ""
    comment = None
    if from_orig:
        comment = f"verbatim bytes copied from orig/baserom_{version}.nds; not decompiled source"
    problems = insert_delinks_entry(
        delinks_path, resolved_name, addr, size, srcdir, parse_symbols(sym_text), comment
    )
    result["audit_problems"] = problems
    if verify:
        emitted = s_path.read_text(encoding="utf-8")
        if decode_data_blob_s(emitted) != data:
            raise BlobError(f"{resolved_name}: written .s failed static round-trip")
        result["round_trip_verified"] = True
    return result


def _parse_hex(s: str) -> int:
    return int(s, 0)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--version", required=True)
    ap.add_argument("--overlay", default=None, help="ovNNN (omit for arm9 main)")
    ap.add_argument("--addr", required=True, type=_parse_hex)
    size_group = ap.add_mutually_exclusive_group(required=True)
    size_group.add_argument("--size", type=_parse_hex)
    size_group.add_argument("--end", type=_parse_hex)
    ap.add_argument("--name", default=None, help="override for an address with no existing symbol")
    ap.add_argument("--srcdir", default=None,
                    help="override .s output directory (default: src/main or "
                         "src/overlayNNN — the EUR baseline). Use src/usa/main or "
                         "src/jpn/main for a region-specific blob so it doesn't "
                         "land in the region-neutral EUR tree.")
    ap.add_argument("--from-orig", action="store_true",
                    help="read bytes from orig/baserom_<version>.nds (brief 607)")
    ap.add_argument("--verify", action="store_true",
                    help="decode emitted .byte directives and require exact byte round-trip")
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    size = args.size if args.size is not None else (args.end - args.addr)
    if size <= 0:
        print(f"error: non-positive size (0x{size:x})", file=sys.stderr)
        return 1

    try:
        result = emit(args.version, args.addr, size, overlay=args.overlay, name=args.name,
                      dry_run=args.dry_run, srcdir=args.srcdir,
                      from_orig=args.from_orig, verify=args.verify)
    except BlobError as e:
        print(f"REFUSE: {e}", file=sys.stderr)
        return 1

    if args.dry_run:
        print(f"[dry-run] would write {result['s_path']} + delinks entry in {result['delinks_path']}")
        return 0

    print(f"wrote {result['s_path']} ({result['size']} bytes) + delinks entry in {result['delinks_path']}")
    if result.get("round_trip_verified"):
        print(f"round-trip verified: {result['name']} byte-identical ({result['size']} bytes)")
    if result["audit_problems"]:
        print("AUDIT PROBLEMS:", file=sys.stderr)
        for p in result["audit_problems"]:
            print(f"  {p}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
