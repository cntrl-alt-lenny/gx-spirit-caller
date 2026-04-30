"""Unit tests for tools/transform_dep.py.

The tool rewrites mwcc-emitted `.d` files (Wine paths in
`Z:\\path\\...` form) into Unix paths so ninja can match the deps
to source files. Regressions would either:
  - Strip wine prefix incorrectly → ninja sees missing deps and
    over-rebuilds
  - Mangle the first line (target spec) → ninja misparses the rule
  - Break the WSL detection branch → Windows-via-WSL builds explode

The function exercised here is `import_d_file(in_file)` which reads
a path and returns the transformed text. We exercise the pure
string-mangling logic by providing tempfile inputs and checking
the output. Wineprefix lookup paths are stubbed via `os.path.realpath`
to avoid depending on whatever exists locally.
"""

from __future__ import annotations

import os
import sys
import tempfile
import unittest
from pathlib import Path
from unittest import mock

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from transform_dep import import_d_file  # noqa: E402


def _write_d(text: str) -> str:
    """Drop a .d file in a tempdir; return the path."""
    fd, path = tempfile.mkstemp(suffix=".d")
    with os.fdopen(fd, "w") as f:
        f.write(text)
    return path


class TestImportDFile(unittest.TestCase):
    """`Z:\\foo\\bar.c` is the wine-mapped form of `/foo/bar.c`. The
    transform must strip the drive letter + reverse the slashes."""

    def test_z_drive_path_stripped_to_unix(self):
        path = _write_d(
            "build/file.o:\\\n"
            " Z:\\home\\user\\src\\file.c \\\n"
            " Z:\\home\\user\\src\\file.h\n"
        )
        out = import_d_file(path)
        self.assertIn("/home/user/src/file.c", out)
        self.assertIn("/home/user/src/file.h", out)
        # The Z: prefix must NOT survive.
        self.assertNotIn("Z:", out)
        self.assertNotIn("z:", out)
        os.unlink(path)

    def test_first_line_target_preserves_unix_form(self):
        # First line is the "target.o: \\" header. mwcc usually emits
        # this with forward slashes already; the transform should keep
        # them intact and not mangle the target name.
        path = _write_d(
            "build/eur/file.o: \\\n"
            " Z:\\home\\user\\src\\file.c\n"
        )
        out = import_d_file(path)
        first_line = out.splitlines()[0]
        self.assertIn("build/eur/file.o", first_line)
        self.assertTrue(first_line.endswith("\\"))
        os.unlink(path)

    def test_first_line_no_continuation_handled(self):
        # Single-target-no-deps case (rare but legal).
        path = _write_d("build/file.o: \n")
        out = import_d_file(path)
        self.assertIn("build/file.o:", out)
        os.unlink(path)

    def test_continuation_backslash_preserved_on_dep_lines(self):
        # Each dep line ending in " \\" must keep the suffix so ninja
        # parses the rule as one logical line.
        path = _write_d(
            "build/file.o: \\\n"
            " Z:\\src\\a.c \\\n"
            " Z:\\src\\b.c\n"
        )
        out = import_d_file(path)
        lines = out.splitlines()
        # The continuation-backslash line ends with " \" (space+slash).
        self.assertTrue(any(line.endswith(" \\") for line in lines))
        os.unlink(path)

    def test_wsl_path_uses_mnt_prefix(self):
        # Under WSL, `Z:\foo\bar` must remap to `/mnt/z/foo/bar` (not
        # the wine-symlink path). The transform exposes WSL detection
        # via `in_wsl()` — patch it to return True and verify the
        # output uses /mnt/<drive>/.
        path = _write_d(
            "build/file.o: \\\n"
            " C:\\src\\file.c\n"
        )
        with mock.patch("transform_dep.in_wsl", return_value=True):
            out = import_d_file(path)
        # WSL form: /mnt/c/src/file.c
        self.assertIn("/mnt/c/src/file.c", out)
        os.unlink(path)

    def test_drive_letter_lowercased(self):
        # Both wine and WSL paths use lowercase drive letters
        # downstream; uppercase shouldn't leak.
        path = _write_d(
            "build/file.o: \\\n"
            " D:\\src\\file.c\n"
        )
        with mock.patch("transform_dep.in_wsl", return_value=True):
            out = import_d_file(path)
        self.assertIn("/mnt/d/", out)
        self.assertNotIn("/mnt/D/", out)
        os.unlink(path)


if __name__ == "__main__":
    unittest.main()
