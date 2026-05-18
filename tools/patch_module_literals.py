#!/usr/bin/env python3

"""
patch_module_literals.py — generic post-link literal-pool rewriter
(brief 134 companion to `patch_ov004_veneers.py`).

Context
-------

Brief 134's ov004 patcher splices spurious mwldarm interwork
veneers out of `arm9_ov004.bin`. But mwldarm's veneer-induced
`.data`/`.bss` shift ALSO cascades into OTHER modules:
specifically, ARM9 main holds 9 load-literal pointers whose
resolved targets land inside ov004's shifted `.bss` range
(orig+0x400). Those pointer values were frozen at link time
based on the *shifted* ov004 layout, so main's `.bin` ships with
"wrong" 4-byte values at those positions.

This tool reads `relocs.txt` (the dsd-recorded canonical reloc
list, with `to` fields giving the ORIG target VA for every
`kind:load` reloc) and rewrites the literal pool entries in the
target `.bin` to match those canonical values.

What it does
------------

For each `kind:load` reloc whose source falls inside the target
binary's VA range:

1. Compute file offset: `from_va - base_va`.
2. Read the current 4-byte LE value at that offset.
3. If the value differs from the reloc's `to_va`, write `to_va`
   in place.

That's it — no veneer splicing, no section-header surgery, no
BL re-encoding. Useful for modules whose binary needs cascade-
shifted literals reverted (e.g. ARM9 main after ov004 is patched).

Idempotent: running on an already-correct binary is a no-op.

Risk mitigation
---------------

- Uses `relocs.txt` as the AUTHORITATIVE whitelist of pointer
  positions. We never touch bytes that aren't at a registered
  `kind:load` reloc source. This eliminates false-positive
  rewrites for arbitrary 4-byte words that happen to look like
  shifted pointers.
- Only rewrites if the current value differs from the canonical
  `to_va`. This means a clean binary (e.g. orig) is untouched.

Usage
-----

    python tools/patch_module_literals.py \\
        --binary build/eur/build/arm9.bin \\
        --relocs config/eur/arm9/relocs.txt \\
        --base-va 0x02000000

Or for any other module — pass the module's `.bin`, its
`relocs.txt`, and the base VA from `delinks.txt`.
"""

from __future__ import annotations

import argparse
import re
import struct
import sys
from pathlib import Path


_RELOC_RE = re.compile(
    r"from:0x([0-9a-f]+)\s+kind:(\w+)\s+to:0x([0-9a-f]+)"
)


def _load_load_relocs(path: Path) -> list[tuple[int, int]]:
    """Parse `relocs.txt`, return list of (from_va, to_va) for
    `kind:load` entries only."""
    out: list[tuple[int, int]] = []
    for line in path.read_text(encoding="utf-8").splitlines():
        m = _RELOC_RE.match(line)
        if m is None:
            continue
        if m.group(2) != "load":
            continue
        out.append((int(m.group(1), 16), int(m.group(3), 16)))
    return out


def patch_literals(
    data: bytes | bytearray,
    relocs: list[tuple[int, int]],
    base_va: int,
) -> tuple[bytearray, int]:
    """Rewrite each load-literal in `data` to match its reloc's
    `to_va`. Returns (patched_bytes, change_count)."""
    buf = bytearray(data)
    n_changed = 0
    for from_va, to_va in relocs:
        fo = from_va - base_va
        if fo < 0 or fo + 4 > len(buf):
            continue
        current = struct.unpack_from("<I", buf, fo)[0]
        if current == to_va:
            continue
        struct.pack_into("<I", buf, fo, to_va)
        n_changed += 1
    return buf, n_changed


def main() -> int:
    ap = argparse.ArgumentParser(
        description=(
            "Rewrite load-literal pool entries in a flat module "
            "binary to match the canonical `to` field of every "
            "`kind:load` reloc. Idempotent; safe to chain into "
            "the build."
        ),
    )
    ap.add_argument(
        "--binary", type=Path, required=True,
        help="Flat module .bin to patch (e.g. arm9.bin, "
             "arm9_ov004.bin, itcm.bin).",
    )
    ap.add_argument(
        "--relocs", type=Path, required=True,
        help="dsd-generated relocs.txt for this module.",
    )
    ap.add_argument(
        "--base-va", type=lambda x: int(x, 0), required=True,
        help="Base VA of the module (e.g. 0x02000000 for main, "
             "0x021c9d60 for ov004). Read from delinks.txt's first "
             "section's start address.",
    )
    args = ap.parse_args()

    try:
        data = args.binary.read_bytes()
    except OSError as e:
        print(f"error: read {args.binary}: {e}", file=sys.stderr)
        return 1
    try:
        relocs = _load_load_relocs(args.relocs)
    except OSError as e:
        print(f"error: read {args.relocs}: {e}", file=sys.stderr)
        return 1

    patched, n_changed = patch_literals(data, relocs, args.base_va)
    if n_changed == 0:
        # Silent no-op — keeps ninja rebuilds quiet.
        return 0

    try:
        args.binary.write_bytes(bytes(patched))
    except OSError as e:
        print(f"error: write {args.binary}: {e}", file=sys.stderr)
        return 1

    print(
        f"patched {args.binary}: "
        f"rewrote {n_changed} load-literal pool entries "
        f"(from {len(relocs)} load relocs)",
        file=sys.stderr,
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
