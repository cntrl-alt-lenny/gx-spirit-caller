from __future__ import annotations

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools"))

from check_test_imports import (  # noqa: E402
    check_source,
    scan_tests,
)


ROOT = Path(__file__).resolve().parents[1]


class TestUnittestImportParity(unittest.TestCase):
    def test_real_suite_has_no_third_party_imports(self):
        module_count, violations = scan_tests(ROOT)
        self.assertGreater(module_count, 0)
        self.assertEqual(violations, [])

    def test_third_party_import_fails_the_parity_check(self):
        violations = check_source(
            "import pytest\n",
            Path("tests/test_synthetic_third_party.py"),
            root=ROOT,
        )
        self.assertEqual(len(violations), 1)
        self.assertEqual(violations[0].line, 1)
        self.assertEqual(violations[0].module, "pytest")
        self.assertIn("ModuleNotFoundError", violations[0].message())

    def test_importerror_fallback_is_graceful(self):
        source = """
try:
    import pytest
except ImportError:
    pytest = None
"""
        self.assertEqual(check_source(source, Path("tests/test_optional.py"), root=ROOT), [])


if __name__ == "__main__":
    unittest.main()
