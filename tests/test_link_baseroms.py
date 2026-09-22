"""Tests for hard-linking the primary checkout's baseroms."""

from __future__ import annotations

import hashlib
import os
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))

import link_baseroms  # noqa: E402


class TestLinkBaseroms(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.root = Path(self.temp.name)
        self.primary = self.root / "primary"
        self.target = self.root / "target"
        (self.primary / "orig").mkdir(parents=True)
        self.target.mkdir()
        self.payloads = {
            "eur": b"EUR-ROM\0" * 3,
            "usa": b"USA-ROM\0" * 4,
            "jpn": b"JPN-ROM\0" * 5,
        }
        for region, payload in self.payloads.items():
            (self.primary / "orig" / f"baserom_{region}.nds").write_bytes(payload)
        self.hashes = {
            region: hashlib.sha1(payload).hexdigest()
            for region, payload in self.payloads.items()
        }

    def tearDown(self):
        self.temp.cleanup()

    def _run(self, **kwargs):
        return link_baseroms.link_baseroms(
            self.target,
            primary=self.primary,
            pinned_hashes=self.hashes,
            **kwargs,
        )

    def test_missing_target_files_are_hard_links(self):
        self._run()
        for region in self.payloads:
            self.assertTrue(
                os.path.samefile(
                    self.primary / "orig" / f"baserom_{region}.nds",
                    self.target / "orig" / f"baserom_{region}.nds",
                )
            )

    def test_same_file_is_a_no_op(self):
        source = self.primary / "orig/baserom_eur.nds"
        destination = self.target / "orig/baserom_eur.nds"
        destination.parent.mkdir()
        os.link(source, destination)
        before = destination.stat().st_ino
        self._run()
        self.assertEqual(before, destination.stat().st_ino)

    def test_copy_is_left_alone_without_replace_flag(self):
        destination = self.target / "orig/baserom_eur.nds"
        destination.parent.mkdir()
        destination.write_bytes(self.payloads["eur"])
        self._run()
        self.assertFalse(os.path.samefile(self.primary / "orig/baserom_eur.nds", destination))

    def test_copy_is_replaced_with_replace_flag(self):
        destination = self.target / "orig/baserom_eur.nds"
        destination.parent.mkdir()
        destination.write_bytes(self.payloads["eur"])
        self._run(replace_copies=True)
        self.assertTrue(os.path.samefile(self.primary / "orig/baserom_eur.nds", destination))

    def test_mismatched_target_is_refused(self):
        destination = self.target / "orig/baserom_eur.nds"
        destination.parent.mkdir()
        destination.write_bytes(b"not-the-ROM")
        with self.assertRaises(link_baseroms.LinkError):
            self._run(replace_copies=True)
        self.assertEqual(destination.read_bytes(), b"not-the-ROM")

    def test_missing_source_is_skipped(self):
        (self.primary / "orig/baserom_jpn.nds").unlink()
        self._run()
        self.assertFalse((self.target / "orig/baserom_jpn.nds").exists())
        self.assertTrue((self.target / "orig/baserom_eur.nds").exists())

    def test_hard_link_failure_falls_back_to_copy(self):
        def fail_link(_source, _destination):
            raise OSError("cross-device link")

        self._run(link=fail_link)
        source = self.primary / "orig/baserom_eur.nds"
        destination = self.target / "orig/baserom_eur.nds"
        self.assertEqual(source.read_bytes(), destination.read_bytes())
        self.assertFalse(os.path.samefile(source, destination))


if __name__ == "__main__":
    unittest.main()
