from __future__ import annotations

import subprocess
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TOOL = ROOT / "tools" / "generate_walls_index.py"
OUT = ROOT / "docs" / "research" / "codegen-walls-index.md"


def _run(*args: str) -> subprocess.CompletedProcess[str]:
    return subprocess.run(
        [sys.executable, str(TOOL), *args],
        cwd=ROOT, capture_output=True, text=True,
    )


class TestWallsIndex(unittest.TestCase):
    def test_committed_index_is_current(self) -> None:
        result = _run("--check")
        self.assertEqual(result.returncode, 0, result.stderr)

    def test_check_rejects_deliberately_stale_index(self) -> None:
        original = OUT.read_text(encoding="utf-8")
        try:
            OUT.write_text(original + "\nstale line\n", encoding="utf-8")
            result = _run("--check")
            self.assertEqual(result.returncode, 1)
            self.assertIn("out of date", result.stderr)
        finally:
            OUT.write_text(original, encoding="utf-8")

    def test_index_has_shape_without_pinning_catalog_cardinality(self) -> None:
        lines = OUT.read_text(encoding="utf-8").splitlines()
        rows = [line for line in lines if line.startswith("| [")]
        self.assertTrue(rows)
        self.assertTrue(all("codegen-walls.md#" in row for row in rows))
        self.assertTrue(all(row.count("|") >= 6 for row in rows))


if __name__ == "__main__":
    unittest.main()
