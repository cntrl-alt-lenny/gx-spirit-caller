"""Tests for tools/emit_data_blob.py (brief 578).

Split to match batch_carve.py's own stated PURE-vs-IMPURE convention:
pure decision logic (name/size resolution, overlap check, .s rendering)
is tested directly on fixture text/bytes, no filesystem or ROOT
dependency. The I/O-touching paths (`extract/<version>/...` binary +
yaml reads) are tested against a synthetic temp tree with `ROOT`
monkeypatched — never against this repo's real (gitignored, not
present in CI) `extract/` directory. One end-to-end `emit()` test runs
the full pipeline (byte read -> .s render -> delinks insert -> sort ->
audit) against an all-temp fixture tree, decoding the emitted `.byte`
rows back to bytes to pin the single property that matters most: the
emitted file reproduces the input bytes exactly.
"""

from __future__ import annotations

import re
import sys
import tempfile
import unittest
from pathlib import Path
from unittest import mock

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

import emit_data_blob as edb  # noqa: E402
from emit_data_blob import (  # noqa: E402
    BlobError,
    check_not_already_claimed_in_text,
    module_binary_and_base,
    read_ground_truth_bytes,
    render_data_blob_s,
    resolve_name_and_declared_size_from_text,
    srcdir_for,
)


def _decode_byte_rows(s_text: str) -> bytes:
    """Test-only inverse of render_data_blob_s's .byte rows -> bytes,
    to assert a round-trip rather than eyeballing hex."""
    out = bytearray()
    for line in s_text.splitlines():
        m = re.match(r"\s*\.byte\s+(.+)$", line)
        if m:
            out.extend(int(tok.strip(), 16) for tok in m.group(1).split(","))
    return bytes(out)


class TestSrcdirFor(unittest.TestCase):
    def test_main(self):
        self.assertEqual(srcdir_for(None), "src/main")

    def test_overlay(self):
        self.assertEqual(srcdir_for("ov004"), "src/overlay004")


class TestRenderDataBlobS(unittest.TestCase):
    def test_round_trips_bytes_exactly(self):
        data = bytes(range(256)) * 2  # 512 bytes, exercises multiple full rows
        text = render_data_blob_s("func_020b2d2c", 0x020B2D2C, data)
        self.assertEqual(_decode_byte_rows(text), data)

    def test_non_row_aligned_size(self):
        data = bytes([0xAA, 0xBB, 0xCC])  # 3 bytes, not a full 16-byte row
        text = render_data_blob_s("func_deadbeef", 0xDEADBEEF, data)
        self.assertEqual(_decode_byte_rows(text), data)

    def test_header_has_section_global_and_label(self):
        text = render_data_blob_s("func_020b2d2c", 0x020B2D2C, b"\x00" * 4)
        self.assertIn("        .text", text)
        self.assertIn("        .global func_020b2d2c", text)
        self.assertIn("func_020b2d2c:", text)
        # no .arm directive — these bytes are emitted as data, not code
        self.assertNotIn(".arm", text)

    def test_header_documents_range(self):
        text = render_data_blob_s("func_020b2d2c", 0x020B2D2C, b"\x00" * 0x3B8)
        self.assertIn("0x020b2d2c..0x020b30e4", text)
        self.assertIn("952 bytes", text)

    def test_empty_data(self):
        text = render_data_blob_s("func_x", 0x02000000, b"")
        self.assertEqual(_decode_byte_rows(text), b"")
        self.assertIn("func_x:", text)


class TestResolveNameAndDeclaredSizeFromText(unittest.TestCase):
    SYMS = (
        "func_020b2d2c kind:function(arm,size=0x3b8) addr:0x020b2d2c\n"
        "func_020b3c78 kind:function(arm,size=0x544) addr:0x020b3c78\n"
        "VBlankIntrWait kind:function(arm,size=0x6) addr:0x02000086\n"
    )

    def test_exact_addr_match_returns_name_and_declared_size(self):
        name, size = resolve_name_and_declared_size_from_text(self.SYMS, 0x020B2D2C, None)
        self.assertEqual(name, "func_020b2d2c")
        self.assertEqual(size, 0x3B8)

    def test_second_entry_also_resolves(self):
        name, size = resolve_name_and_declared_size_from_text(self.SYMS, 0x020B3C78, None)
        self.assertEqual(name, "func_020b3c78")
        self.assertEqual(size, 0x544)

    def test_no_match_with_explicit_name_returns_it_with_no_declared_size(self):
        name, size = resolve_name_and_declared_size_from_text(self.SYMS, 0x02222222, "data_02222222")
        self.assertEqual(name, "data_02222222")
        self.assertIsNone(size)

    def test_no_match_no_explicit_name_raises(self):
        with self.assertRaises(BlobError):
            resolve_name_and_declared_size_from_text(self.SYMS, 0x02222222, None)

    def test_friendly_named_symbol_not_addr_indexed_by_this_helper(self):
        # parse_symbol_addrs (batch_carve.py) only indexes func_-prefixed
        # names by design (matches its own scope) — a renamed/friendly
        # symbol at the same address is invisible to it, same as an
        # unclaimed address, unless --name is supplied.
        with self.assertRaises(BlobError):
            resolve_name_and_declared_size_from_text(self.SYMS, 0x02000086, None)


class TestCheckNotAlreadyClaimedInText(unittest.TestCase):
    DELINKS = (
        "src/main/func_020b2cc4.s:\n"
        "    complete\n"
        "    .text start:0x020b2cc4 end:0x020b2d20\n"
        "\n"
        "src/main/func_020b30e4.s:\n"
        "    complete\n"
        "    .text start:0x020b30e4 end:0x020b3168\n"
    )

    def test_unclaimed_gap_addr_does_not_raise(self):
        check_not_already_claimed_in_text(self.DELINKS, 0x020B2D2C)  # no raise

    def test_claimed_addr_raises(self):
        with self.assertRaises(BlobError):
            check_not_already_claimed_in_text(self.DELINKS, 0x020B2CC4)

    def test_empty_text_never_raises(self):
        check_not_already_claimed_in_text("", 0x020B2D2C)  # no raise


class TestModuleBinaryAndBaseAndBytes(unittest.TestCase):
    """I/O paths — always against a synthetic temp tree with ROOT
    monkeypatched, never this repo's real (gitignored) extract/."""

    def _make_tree(self, tmp: str) -> Path:
        root = Path(tmp)
        arm9 = root / "extract" / "eur" / "arm9"
        arm9.mkdir(parents=True)
        (arm9 / "arm9.yaml").write_text("base_address: 33554432\nother_key: 7\n")
        (arm9 / "arm9.bin").write_bytes(bytes(range(256)) * 4)  # 1024 bytes
        return root

    def test_module_binary_and_base_main(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = self._make_tree(tmp)
            with mock.patch.object(edb, "ROOT", root):
                bin_path, base = module_binary_and_base("eur", None)
            self.assertEqual(base, 0x02000000)
            self.assertEqual(bin_path, root / "extract" / "eur" / "arm9" / "arm9.bin")

    def test_module_binary_and_base_missing_extract_raises(self):
        with tempfile.TemporaryDirectory() as tmp:
            with mock.patch.object(edb, "ROOT", Path(tmp)):
                with self.assertRaises(BlobError):
                    module_binary_and_base("eur", None)

    def test_read_ground_truth_bytes_exact_slice(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = self._make_tree(tmp)
            with mock.patch.object(edb, "ROOT", root):
                data = read_ground_truth_bytes("eur", None, 0x02000000 + 4, 8)
            self.assertEqual(data, bytes(range(4, 12)))

    def test_read_ground_truth_bytes_out_of_range_raises(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = self._make_tree(tmp)
            with mock.patch.object(edb, "ROOT", root):
                with self.assertRaises(BlobError):
                    read_ground_truth_bytes("eur", None, 0x02000000 + 2000, 8)


class TestEmitEndToEnd(unittest.TestCase):
    """Full pipeline against an all-temp fixture tree: extract/ + config/
    + src/. No wine/ninja/mwasm — just the byte read, .s render, delinks
    insert (via the real batch_carve.py + sort_delinks.py helpers), and
    audit. Confirms the emitted .s reproduces the ground-truth bytes
    exactly and the delinks entry lands clean (0 audit problems)."""

    def _make_tree(self, tmp: str) -> Path:
        root = Path(tmp)
        arm9_extract = root / "extract" / "eur" / "arm9"
        arm9_extract.mkdir(parents=True)
        blob_bytes = bytes((i * 7 + 3) % 256 for i in range(0x40))  # 64 bytes, deterministic
        (arm9_extract / "arm9.yaml").write_text("base_address: 33554432\n")
        # 0x100-byte binary; the 0x40-byte blob lives at file offset 0x80
        binary = bytearray(0x100)
        binary[0x80:0x80 + len(blob_bytes)] = blob_bytes
        (arm9_extract / "arm9.bin").write_bytes(bytes(binary))

        arm9_cfg = root / "config" / "eur" / "arm9"
        arm9_cfg.mkdir(parents=True)
        (arm9_cfg / "symbols.txt").write_text(
            "func_02000000 kind:function(arm,size=0x80) addr:0x02000000\n"
            "func_02000080 kind:function(arm,size=0x40) addr:0x02000080\n"
        )
        (arm9_cfg / "delinks.txt").write_text(
            "src/main/func_02000000.s:\n"
            "    complete\n"
            "    .text start:0x02000000 end:0x02000080\n"
            "\n"
            "src/main/func_020000c0.s:\n"
            "    complete\n"
            "    .text start:0x020000c0 end:0x02000100\n"
        )
        (root / "src" / "main").mkdir(parents=True)
        return root, blob_bytes

    def test_emit_writes_matching_bytes_and_clean_delinks(self):
        with tempfile.TemporaryDirectory() as tmp:
            root, blob_bytes = self._make_tree(tmp)
            with mock.patch.object(edb, "ROOT", root):
                result = edb.emit("eur", 0x02000080, 0x40)

            self.assertEqual(result["name"], "func_02000080")
            self.assertEqual(result["audit_problems"], [])

            s_path = root / "src" / "main" / "func_02000080.s"
            self.assertTrue(s_path.is_file())
            self.assertEqual(_decode_byte_rows(s_path.read_text()), blob_bytes)

            delinks_text = (root / "config" / "eur" / "arm9" / "delinks.txt").read_text()
            self.assertIn("src/main/func_02000080.s:", delinks_text)
            self.assertIn(".text start:0x02000080 end:0x020000c0", delinks_text)
            # sort_delinks.py must have placed it between the two existing
            # blocks in address order, not appended after both.
            self.assertLess(
                delinks_text.index("func_02000000"),
                delinks_text.index("func_02000080"),
            )
            self.assertLess(
                delinks_text.index("func_02000080"),
                delinks_text.index("func_020000c0"),
            )

    def test_emit_dry_run_writes_nothing(self):
        with tempfile.TemporaryDirectory() as tmp:
            root, _blob_bytes = self._make_tree(tmp)
            delinks_before = (root / "config" / "eur" / "arm9" / "delinks.txt").read_text()
            with mock.patch.object(edb, "ROOT", root):
                result = edb.emit("eur", 0x02000080, 0x40, dry_run=True)
            self.assertTrue(result["dry_run"])
            self.assertFalse((root / "src" / "main" / "func_02000080.s").exists())
            self.assertEqual(
                (root / "config" / "eur" / "arm9" / "delinks.txt").read_text(), delinks_before
            )

    def test_emit_refuses_size_mismatch(self):
        with tempfile.TemporaryDirectory() as tmp:
            root, _blob_bytes = self._make_tree(tmp)
            with mock.patch.object(edb, "ROOT", root):
                with self.assertRaises(BlobError):
                    edb.emit("eur", 0x02000080, 0x20)  # symbols.txt says 0x40

    def test_emit_refuses_already_claimed(self):
        with tempfile.TemporaryDirectory() as tmp:
            root, _blob_bytes = self._make_tree(tmp)
            with mock.patch.object(edb, "ROOT", root):
                with self.assertRaises(BlobError):
                    edb.emit("eur", 0x02000000, 0x80)  # already a TU in fixture delinks.txt


if __name__ == "__main__":
    unittest.main()
