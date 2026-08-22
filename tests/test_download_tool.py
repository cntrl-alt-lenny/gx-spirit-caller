"""Tests for post-download runtime verification."""
from __future__ import annotations

import subprocess
import sys
import tempfile
import unittest
from pathlib import Path
from types import SimpleNamespace

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "tools"))
import download_tool  # noqa: E402


class TestVerifyDownloadedTool(unittest.TestCase):
    def _host(self):
        return SimpleNamespace(system="linux", machine="x86_64", exe="")

    def _write_binaries(self, root: Path):
        bindir = root / "bin"
        bindir.mkdir()
        (bindir / "arm-none-eabi-objdump").write_text("stub")
        (bindir / "arm-none-eabi-as").write_text("stub")

    def test_checks_every_extracted_arm_binutils_binary(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            self._write_binaries(root)
            calls = []

            def runner(command, **kwargs):
                calls.append((command, kwargs))
                return subprocess.CompletedProcess(command, 0, stdout="GNU version", stderr="")

            download_tool.verify_downloaded_tool("arm-binutils", root, self._host(), runner=runner)

            self.assertEqual(len(calls), 2)
            self.assertTrue(all(call[1]["timeout"] > 0 for call in calls))

    def test_surfaces_a_binary_that_exists_but_does_not_run(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            self._write_binaries(root)

            def runner(command, **kwargs):
                return subprocess.CompletedProcess(
                    command, 1, stdout="", stderr="Library not loaded: libzstd.1.dylib"
                )

            with self.assertRaisesRegex(RuntimeError, "libzstd.1.dylib"):
                download_tool.verify_downloaded_tool("arm-binutils", root, self._host(), runner=runner)


if __name__ == "__main__":
    unittest.main()
