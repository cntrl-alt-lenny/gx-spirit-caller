"""Tests for the P-series wall catalog/header cross-check."""
from __future__ import annotations

import tempfile
import unittest
from pathlib import Path
from unittest import mock

import sys

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "tools"))
import wall_catalog_check as w  # noqa: E402


class CatalogParsing(unittest.TestCase):
    def test_retracted_prose_after_affected_list_is_not_membership(self):
        catalog = """
### P-23. Example

**Affected picks (2):** `02251bb0`, `0224bd3c` (both ov002).
`02253304` (ov002) RETRACTED — do not re-add.

**Recipe status:** NONE.
"""
        with tempfile.TemporaryDirectory() as tmp:
            path = Path(tmp) / "catalog.md"
            path.write_text(catalog, encoding="utf-8")
            self.assertEqual(
                w.read_catalog(path),
                {
                    w.CatalogMember("0x02251bb0", "P-23"),
                    w.CatalogMember("0x0224bd3c", "P-23"),
                },
            )


class Audit(unittest.TestCase):
    def test_audit_separates_missing_mismatch_and_non_live(self):
        members = {
            w.CatalogMember("0x00000001", "P-1"),
            w.CatalogMember("0x00000002", "P-2"),
            w.CatalogMember("0x00000003", "P-3"),
        }
        sources = {
            "0x00000001": [w.LiveSource("0x00000001", "src/main/a.s", "; header\n")],
            "0x00000002": [w.LiveSource("0x00000002", "src/main/b.s", "; P-9\n")],
        }
        report = w.audit(members, sources)
        self.assertEqual(len(report["missing"]), 1)
        self.assertEqual(len(report["mismatched"]), 1)
        self.assertEqual(len(report["no_live"]), 1)

    def test_live_source_reader_uses_delinks_and_excludes_region_ports(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            baseline = root / "src/main/func_00000001.s"
            port = root / "src/usa/main/func_00000001.s"
            baseline.parent.mkdir(parents=True)
            port.parent.mkdir(parents=True)
            baseline.write_text("; header\n", encoding="utf-8")
            port.write_text("; header\n", encoding="utf-8")
            with mock.patch.object(w, "ROOT", root), mock.patch.object(
                w.wall_aware_headroom, "_live_sources", return_value={"src/main/func_00000001.s"}
            ):
                sources = w.read_live_sources(root)
            self.assertEqual([x.path for x in sources["0x00000001"]], ["src/main/func_00000001.s"])


if __name__ == "__main__":
    unittest.main()
