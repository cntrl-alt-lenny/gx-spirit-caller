"""Unit tests for tools/patch_module_literals.py (brief 134
companion tool — generic post-link load-literal rewriter).

Used to un-shift the 10 cascade-affected load-literal pointers
in EUR ARM9 main after the ov004 veneer patcher splices ov004.
A regression here would re-FAIL main on EUR.

Pinned behaviour:

- Per-reloc `kind:load` filter (skips arm_call / thumb_call)
- Writes `to_va` at file offset `from_va - base_va`
- No-op when current value already matches
- Out-of-range relocs silently skipped
"""

from __future__ import annotations

import struct
import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from patch_module_literals import (  # noqa: E402
    _load_load_relocs,
    patch_literals,
)


class TestPatchLiterals(unittest.TestCase):

    def test_rewrites_shifted_pointer(self) -> None:
        # main base 0x02000000, reloc from VA 0x02000010 → 0x0220b500
        # Current binary has shifted value 0x0220b900 — patch
        # rewrites to 0x0220b500.
        data = bytearray(0x100)
        struct.pack_into("<I", data, 0x10, 0x0220b900)
        relocs = [(0x02000010, 0x0220b500)]
        patched, n = patch_literals(data, relocs, base_va=0x02000000)
        self.assertEqual(n, 1)
        self.assertEqual(
            struct.unpack_from("<I", patched, 0x10)[0], 0x0220b500,
        )

    def test_idempotent_when_correct(self) -> None:
        data = bytearray(0x100)
        struct.pack_into("<I", data, 0x10, 0x0220b500)
        relocs = [(0x02000010, 0x0220b500)]
        patched, n = patch_literals(data, relocs, base_va=0x02000000)
        self.assertEqual(n, 0)
        self.assertEqual(
            struct.unpack_from("<I", patched, 0x10)[0], 0x0220b500,
        )

    def test_out_of_range_reloc_skipped(self) -> None:
        data = bytearray(0x100)
        # Reloc points past end of binary — should silently skip.
        relocs = [(0x02001000, 0x0220b500)]
        patched, n = patch_literals(data, relocs, base_va=0x02000000)
        self.assertEqual(n, 0)

    def test_handles_multiple_relocs(self) -> None:
        data = bytearray(0x100)
        struct.pack_into("<I", data, 0x10, 0xdead0000)
        struct.pack_into("<I", data, 0x20, 0xbeef0000)
        struct.pack_into("<I", data, 0x30, 0xcafe0000)
        relocs = [
            (0x02000010, 0x11111111),
            (0x02000020, 0x22222222),
            (0x02000030, 0x33333333),
        ]
        patched, n = patch_literals(data, relocs, base_va=0x02000000)
        self.assertEqual(n, 3)
        self.assertEqual(
            struct.unpack_from("<I", patched, 0x10)[0], 0x11111111,
        )
        self.assertEqual(
            struct.unpack_from("<I", patched, 0x20)[0], 0x22222222,
        )
        self.assertEqual(
            struct.unpack_from("<I", patched, 0x30)[0], 0x33333333,
        )


class TestLoadLoadRelocs(unittest.TestCase):

    def test_filters_to_load_kind_only(self) -> None:
        body = (
            "from:0x02000010 kind:load to:0x0220b500 module:overlay(4)\n"
            "from:0x02000020 kind:arm_call to:0x021d8640 module:overlay(4)\n"
            "from:0x02000030 kind:load to:0x021c9d60 module:overlay(4)\n"
            "from:0x02000040 kind:thumb_call to:0x021d4000 module:overlay(4)\n"
            "\n"
            "# comments and blank lines ignored\n"
        )
        with tempfile.NamedTemporaryFile(
            mode="w", suffix=".txt", delete=False,
        ) as f:
            f.write(body)
            path = Path(f.name)
        try:
            relocs = _load_load_relocs(path)
            self.assertEqual(len(relocs), 2)
            self.assertEqual(relocs[0], (0x02000010, 0x0220b500))
            self.assertEqual(relocs[1], (0x02000030, 0x021c9d60))
        finally:
            path.unlink()


if __name__ == "__main__":
    unittest.main()
