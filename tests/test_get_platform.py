"""Unit tests for tools/get_platform.py.

The tool detects host platform + arch and returns a Platform with the
labels used in download_tool.py URL paths. Regressions would either:
  - Misclassify a known platform (CI break — wrong tool URL)
  - Silently drop an unknown platform (failure mode is `None` return)

Pinned cases mirror the platforms `tools/configure.py` is expected to
support: Linux x86_64, macOS arm64 (Apple Silicon), Windows x86_64.
The Linux-arm64 case exercises the dsd-only-ships-arm64-macOS edge
called out in the inline comment.
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path
from unittest import mock

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from get_platform import (  # noqa: E402
    Platform,
    get_platform,
)


def _patch(system: str, machine: str):
    """Patch `platform.system()` + `platform.machine()` together."""
    return mock.patch.multiple(
        "get_platform.platform",
        system=mock.MagicMock(return_value=system),
        machine=mock.MagicMock(return_value=machine),
    )


class TestGetPlatform(unittest.TestCase):
    def test_windows_x86_64(self):
        with _patch("Windows", "AMD64"):
            p = get_platform()
        self.assertIsInstance(p, Platform)
        self.assertEqual(p.system, "windows")
        self.assertEqual(p.machine, "x86_64")
        self.assertEqual(p.exe, ".exe")

    def test_linux_x86_64(self):
        with _patch("Linux", "x86_64"):
            p = get_platform()
        self.assertEqual(p.system, "linux")
        self.assertEqual(p.machine, "x86_64")
        self.assertEqual(p.exe, "")

    def test_macos_apple_silicon(self):
        with _patch("Darwin", "arm64"):
            p = get_platform()
        self.assertEqual(p.system, "macos")
        self.assertEqual(p.machine, "arm64")
        self.assertEqual(p.exe, "")

    def test_macos_aarch64_alias_normalises_to_arm64(self):
        # Inline comment says objdiff-cli/dsd ship "arm64" on macOS even
        # when `platform.machine()` reports "aarch64". Pin that.
        with _patch("Darwin", "aarch64"):
            p = get_platform()
        self.assertEqual(p.system, "macos")
        self.assertEqual(p.machine, "arm64")

    def test_linux_aarch64_stays_aarch64(self):
        # Same comment: dsd only ships arm64-macOS binaries; Linux arm
        # uses "aarch64". The system-aware mapping must not collapse
        # both to "arm64".
        with _patch("Linux", "aarch64"):
            p = get_platform()
        self.assertEqual(p.system, "linux")
        self.assertEqual(p.machine, "aarch64")

    def test_machine_lowercased(self):
        # `platform.machine()` returns "AMD64" on Windows; the match
        # arms expect lowercase.
        with _patch("Windows", "AMD64"):
            p = get_platform()
        self.assertEqual(p.machine, "x86_64")

    def test_unknown_system_returns_none(self):
        with _patch("FreeBSD", "x86_64"):
            p = get_platform()
        self.assertIsNone(p)

    def test_unknown_machine_returns_none(self):
        with _patch("Linux", "i386"):
            p = get_platform()
        self.assertIsNone(p)


class TestPlatformDataclass(unittest.TestCase):
    def test_constructor_assigns_fields(self):
        p = Platform(system="linux", machine="x86_64", exe="")
        self.assertEqual(p.system, "linux")
        self.assertEqual(p.machine, "x86_64")
        self.assertEqual(p.exe, "")


if __name__ == "__main__":
    unittest.main()
