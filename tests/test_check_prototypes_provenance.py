"""Fail-closed tests for the prototype provenance checker."""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "tools"))

import check_prototypes_provenance as cpp  # noqa: E402


class TestPrototypeProvenance(unittest.TestCase):
    def _check_with(self, fresh, committed, header_line=""):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            header = root / "prototypes.h"
            provenance = root / "provenance.json"
            header.write_text(header_line, encoding="utf-8")
            import json
            provenance.write_text(json.dumps(committed), encoding="utf-8")
            with patch.object(cpp, "PROTOTYPES_H", header), \
                    patch.object(cpp, "PROVENANCE_JSON", provenance), \
                    patch.object(cpp, "collect_evidence_backed_signatures", return_value=fresh), \
                    patch.object(cpp, "render_prototype", return_value=header_line.strip()):
                return cpp.check()

    def test_empty_bank_is_not_a_clean_provenance_check(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            header = root / "prototypes.h"
            provenance = root / "provenance.json"
            header.write_text("/* empty fixture */\n", encoding="utf-8")
            provenance.write_text("{}\n", encoding="utf-8")
            with patch.object(cpp, "PROTOTYPES_H", header), \
                    patch.object(cpp, "PROVENANCE_JSON", provenance), \
                    patch.object(cpp, "collect_evidence_backed_signatures", return_value={}):
                issues = cpp.check()
        self.assertEqual(len(issues), 1)
        self.assertIn("vacuous", issues[0].detail)

    def test_matching_nonempty_bank_still_passes(self):
        signature = {
            "source": "src/main/Foo.c",
            "is_void_return": True,
            "return_type": "void",
            "params": [],
        }
        committed = {
            "Foo": {
                "source": "src/main/Foo.c",
                "return_type": "void",
                "params": [],
            }
        }
        self.assertEqual(
            self._check_with({"Foo": signature}, committed, "void Foo(void);"),
            [],
        )

    def test_nonempty_mismatch_still_fails(self):
        signature = {
            "source": "src/main/Foo.c",
            "is_void_return": True,
            "return_type": "void",
            "params": [],
        }
        issues = self._check_with({"Foo": signature}, {})
        self.assertTrue(any("missing from committed" in i.detail for i in issues))


if __name__ == "__main__":
    unittest.main()
