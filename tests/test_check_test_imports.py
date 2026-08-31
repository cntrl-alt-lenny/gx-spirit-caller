from __future__ import annotations

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools"))

from check_test_imports import (  # noqa: E402
    check_collection,
    check_source,
    scan_collection,
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


class TestUnittestCollectionParity(unittest.TestCase):
    def test_real_suite_has_no_collection_violations(self):
        module_count, violations, allowed = scan_collection(ROOT)
        self.assertGreater(module_count, 0)
        self.assertEqual(violations, [])
        # No test in this repo needs a pytest-only feature (yet); an
        # allow-listed test is a deliberate, reasoned exception, not a
        # place to silently redirect a lazy conversion.
        self.assertEqual(allowed, [])

    def test_module_level_test_function_fails_collection_parity(self):
        # This is the file-with-a-module-level-test-function the guard was
        # built to catch: seen failing (kind='function', name='test_hidden')
        # before tests/test_asm_void_counter.py et al. were converted.
        source = "def test_hidden():\n    assert True\n"
        violations = check_collection(source, Path("tests/test_synthetic_hidden.py"))
        self.assertEqual(len(violations), 1)
        self.assertEqual(violations[0].name, "test_hidden")
        self.assertEqual(violations[0].kind, "function")
        self.assertIn("unittest discover", violations[0].message())

    def test_pytest_style_class_fails_collection_parity(self):
        source = "class TestFoo:\n    def test_bar(self):\n        assert True\n"
        violations = check_collection(source, Path("tests/test_synthetic_class.py"))
        self.assertEqual(len(violations), 1)
        self.assertEqual(violations[0].name, "TestFoo")
        self.assertEqual(violations[0].kind, "class")

    def test_indirect_testcase_subclass_is_not_flagged(self):
        # Mirrors tests/test_worktree_gc.py's `_RepoCase(unittest.TestCase)`
        # base-class convention: the guard must resolve the chain rather
        # than only checking direct bases, or it would false-positive on
        # every file that uses a shared TestCase helper base.
        source = (
            "import unittest\n"
            "class _Base(unittest.TestCase):\n"
            "    pass\n"
            "class TestFoo(_Base):\n"
            "    def test_bar(self):\n"
            "        pass\n"
        )
        self.assertEqual(check_collection(source, Path("tests/test_synthetic_indirect.py")), [])

    def test_helper_class_without_test_methods_is_not_flagged(self):
        source = "class Helper:\n    def build(self):\n        pass\n"
        self.assertEqual(check_collection(source, Path("tests/test_synthetic_helper.py")), [])


if __name__ == "__main__":
    unittest.main()
