"""Synthetic subprocess tests for the activation invariant gate."""

from __future__ import annotations

import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TOOL = ROOT / "tools" / "check_activation_invariant.py"
_TEMP_DIRS: list[tempfile.TemporaryDirectory[str]] = []


def _run_git(repo: Path, *args: str) -> None:
    result = subprocess.run(
        ["git", "-C", str(repo), *args],
        text=True,
        capture_output=True,
        check=False,
    )
    if result.returncode:
        raise AssertionError(result.stderr)


def _fixture_repo(
    *, activate: bool, routed: bool = False, activation_name: str | None = None,
) -> tuple[Path, str]:
    tmp = tempfile.TemporaryDirectory()
    repo = Path(tmp.name)
    _run_git(repo, "init", "-q")
    _run_git(repo, "config", "user.email", "test@example.com")
    _run_git(repo, "config", "user.name", "activation-test")
    (repo / "src" / "main").mkdir(parents=True)
    (repo / "config" / "eur" / "arm9").mkdir(parents=True)
    (repo / "src" / "main" / "func_02000000.s").write_text("old\n", encoding="utf-8")
    (repo / "config" / "eur" / "arm9" / "delinks.txt").write_text(
        "    .text start:0x02000000 end:0x02000004 kind:code\n\n"
        "src/main/func_02000000.s:\n"
        "    .text start:0x02000000 end:0x02000004\n",
        encoding="utf-8",
    )
    _run_git(repo, "add", ".")
    _run_git(repo, "commit", "-qm", "base")
    c_name = "func_02000000.legacy_sp3.c" if routed else "func_02000000.c"
    (repo / "src" / "main" / c_name).write_text("new\n", encoding="utf-8")
    (repo / "src" / "main" / "func_02000000.s").unlink()
    if activate:
        text = (repo / "config" / "eur" / "arm9" / "delinks.txt").read_text(encoding="utf-8")
        text = text.replace("func_02000000.s:", f"{activation_name or c_name}:")
        (repo / "config" / "eur" / "arm9" / "delinks.txt").write_text(text, encoding="utf-8")
    _run_git(repo, "add", ".")
    _run_git(repo, "commit", "-qm", "sweep")
    head = subprocess.run(
        ["git", "-C", str(repo), "rev-parse", "HEAD"],
        text=True,
        capture_output=True,
        check=True,
    ).stdout.strip()
    # Keep the TemporaryDirectory alive for the duration of the test process.
    _TEMP_DIRS.append(tmp)
    return repo, head


def _data_fixture_repo() -> tuple[Path, str]:
    tmp = tempfile.TemporaryDirectory()
    repo = Path(tmp.name)
    _run_git(repo, "init", "-q")
    _run_git(repo, "config", "user.email", "test@example.com")
    _run_git(repo, "config", "user.name", "activation-test")
    (repo / "README").write_text("base\n", encoding="utf-8")
    _run_git(repo, "add", ".")
    _run_git(repo, "commit", "-qm", "base")
    (repo / "src" / "main").mkdir(parents=True)
    (repo / "src" / "main" / "data_02000000.c").write_text(
        "const unsigned char data_02000000[4] = {0};\n", encoding="utf-8"
    )
    _run_git(repo, "add", ".")
    _run_git(repo, "commit", "-qm", "data carve")
    head = subprocess.run(
        ["git", "-C", str(repo), "rev-parse", "HEAD"],
        text=True,
        capture_output=True,
        check=True,
    ).stdout.strip()
    _TEMP_DIRS.append(tmp)
    return repo, head


def _named_function_fixture_repo(*, activate: bool) -> tuple[Path, str]:
    """A named C function whose old assembly file keeps the address stem."""
    tmp = tempfile.TemporaryDirectory()
    repo = Path(tmp.name)
    _run_git(repo, "init", "-q")
    _run_git(repo, "config", "user.email", "test@example.com")
    _run_git(repo, "config", "user.name", "activation-test")
    src = repo / "src" / "usa" / "overlay015"
    cfg = repo / "config" / "usa" / "arm9" / "overlays" / "ov015"
    src.mkdir(parents=True)
    cfg.mkdir(parents=True)
    old_s = src / "func_ov015_021b1000.s"
    old_s.write_text("old\n", encoding="utf-8")
    (cfg / "symbols.txt").write_text(
        "Ov015_Foo kind:function(arm,size=0x20) addr:0x021b1000\n",
        encoding="utf-8",
    )
    (cfg / "delinks.txt").write_text(
        "src/usa/overlay015/func_ov015_021b1000.s:\n"
        "    complete\n"
        "    .text start:0x021b1000 end:0x021b1020\n",
        encoding="utf-8",
    )
    _run_git(repo, "add", ".")
    _run_git(repo, "commit", "-qm", "base")
    (src / "Ov015_Foo.c").write_text("void Ov015_Foo(void) {}\n", encoding="utf-8")
    old_s.unlink()
    if activate:
        text = (cfg / "delinks.txt").read_text(encoding="utf-8")
        (cfg / "delinks.txt").write_text(
            text.replace("func_ov015_021b1000.s", "Ov015_Foo.c"),
            encoding="utf-8",
        )
    _run_git(repo, "add", ".")
    _run_git(repo, "commit", "-qm", "named sweep")
    head = subprocess.run(
        ["git", "-C", str(repo), "rev-parse", "HEAD"],
        text=True,
        capture_output=True,
        check=True,
    ).stdout.strip()
    _TEMP_DIRS.append(tmp)
    return repo, head


class TestActivationInvariantCLI(unittest.TestCase):
    def _invoke(self, repo: Path, git_range: str) -> subprocess.CompletedProcess[str]:
        return subprocess.run(
            [sys.executable, str(TOOL), "--repo", str(repo), git_range],
            text=True,
            capture_output=True,
            check=False,
        )

    def test_missing_activation_fails(self):
        repo, head = _fixture_repo(activate=False)
        result = self._invoke(repo, f"HEAD~1..{head}")
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("MISSING delinks activation", result.stdout)

    def test_named_function_missing_activation_fails(self):
        repo, head = _named_function_fixture_repo(activate=False)
        result = self._invoke(repo, f"HEAD~1..{head}")
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("MISSING delinks activation", result.stdout)

    def test_named_function_activation_passes(self):
        repo, head = _named_function_fixture_repo(activate=True)
        result = self._invoke(repo, f"HEAD~1..{head}")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("function .c added:       1", result.stdout)

    def test_routed_activation_passes(self):
        repo, head = _fixture_repo(activate=True, routed=True)
        result = self._invoke(repo, f"HEAD~1..{head}")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("function .c added:       1", result.stdout)
        self.assertIn("delinks activations:     1", result.stdout)

    def test_same_address_wrong_c_basename_does_not_satisfy_activation(self):
        repo, head = _fixture_repo(
            activate=True,
            activation_name="func_02000000.legacy.c",
        )
        result = self._invoke(repo, f"HEAD~1..{head}")
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("MISSING delinks activation for added C", result.stdout)

    def test_data_addition_is_informational(self):
        repo, head = _data_fixture_repo()
        result = self._invoke(repo, f"HEAD~1..{head}")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("data .c additions:       1 (informational)", result.stdout)
        self.assertIn("no activation (informational)", result.stdout)

    def test_empty_range_fails_closed(self):
        repo, head = _data_fixture_repo()
        result = self._invoke(repo, f"{head}..{head}")
        self.assertEqual(result.returncode, 1)
        self.assertIn("no source or activation changes", result.stdout)


if __name__ == "__main__":
    unittest.main()
