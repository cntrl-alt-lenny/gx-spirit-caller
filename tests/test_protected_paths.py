"""Tests for tools/protected_paths.py and the two agent settings files that
enforce it (round 004)."""

from __future__ import annotations

import json
import subprocess
import sys
import unittest
from pathlib import Path

_ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(_ROOT / "tools"))

import protected_paths as pp  # noqa: E402

PROTECTED = [
    "gx-spirit-caller_eur.sha1",
    "orig/baserom_eur.nds",
    "orig/README.md",
    "build/eur/arm9.o",
    "extract/usa/arm9/arm9.bin",
    "build.ninja",
    "objdiff.json",
    "config/jpn/arm9/config.yaml",
    "tools/mwccarm/2.0/sp1p5/mwccarm.exe",
    "dsd.exe",
    ".claude/settings.json",
    ".codex/hooks.json",
    "tools/protected_paths.py",
    "tools/reference_baseline.txt",
    "tools/fake_match_baseline.txt",
]
FREE = [
    "src/main/func_02000000.c",
    "config/eur/arm9/symbols.txt",
    "config/eur/arm9/delinks.txt",
    "tools/gate3.py",
    "docs/rounds/004-trustworthy-checker/worker.md",
    "builds.md",
    "src/build/notes.c",
]


def patch(*headers: str) -> str:
    body = "".join(f"*** {h}\n@@\n-a\n+b\n" for h in headers)
    return f"*** Begin Patch\n{body}*** End Patch\n"


class TestPatterns(unittest.TestCase):
    def test_protected_paths_are_protected(self):
        for rel in PROTECTED:
            with self.subTest(rel=rel):
                self.assertIsNotNone(pp.protected_pattern(rel, cwd=pp.ROOT))

    def test_ordinary_paths_are_free(self):
        for rel in FREE:
            with self.subTest(rel=rel):
                self.assertIsNone(pp.protected_pattern(rel, cwd=pp.ROOT))

    def test_absolute_dotdot_and_outside_paths(self):
        self.assertEqual(pp.protected_pattern(str(pp.ROOT / "gx-spirit-caller_usa.sha1")), "**/*.sha1")
        self.assertEqual(pp.protected_pattern("../orig/x", cwd=pp.ROOT / "src"), "orig/**")
        self.assertIsNone(pp.protected_pattern("/somewhere/else/x.sha1"))


class TestWorktrees(unittest.TestCase):
    """Round 005: the same paths are protected inside `.worktrees/<seat>/`, whether
    the session started in the primary checkout (root = primary) or in the
    worktree (root = the worktree, whose own copy of the tools and settings runs)."""

    def test_from_the_primary_checkout(self):
        for rel in PROTECTED:
            with self.subTest(rel=rel):
                inside = f".worktrees/worker-005/{rel}"
                self.assertIsNotNone(pp.protected_pattern(inside, root=pp.ROOT, cwd=pp.ROOT))
                absolute = str(pp.ROOT / inside)
                self.assertIsNotNone(pp.protected_pattern(absolute, root=pp.ROOT))

    def test_from_inside_the_worktree(self):
        worktree = pp.ROOT / ".worktrees" / "worker-005"
        for rel in PROTECTED:
            with self.subTest(rel=rel):
                self.assertIsNotNone(pp.protected_pattern(rel, root=worktree, cwd=worktree))

    def test_ordinary_worktree_paths_stay_free(self):
        for rel in FREE:
            with self.subTest(rel=rel):
                self.assertIsNone(pp.protected_pattern(f".worktrees/worker-005/{rel}",
                                                       root=pp.ROOT, cwd=pp.ROOT))

    def test_only_a_seat_folder_is_unwrapped(self):
        # `.worktrees/build.ninja` is not inside a seat; nothing to unwrap, but
        # `build.ninja` protection is by name at the root only.
        self.assertIsNone(pp.protected_pattern(".worktrees/notes.txt", root=pp.ROOT, cwd=pp.ROOT))

    def test_hook_denies_a_worktree_path_from_the_primary_checkout(self):
        reason = pp.codex_hook({"cwd": str(pp.ROOT),
                                "tool_input": {"command": patch(
                                    "Update File: .worktrees/worker-005/build.ninja")}})
        self.assertIsNotNone(reason)
        self.assertIn("build.ninja", reason)


class TestCodexHook(unittest.TestCase):
    def _hook(self, payload: dict) -> subprocess.CompletedProcess:
        return subprocess.run(
            [sys.executable, str(_ROOT / "tools" / "protected_paths.py"), "--codex-hook"],
            input=json.dumps(payload), capture_output=True, text=True, check=False,
        )

    def test_patch_touching_a_checksum_is_denied(self):
        proc = self._hook({"tool_name": "apply_patch", "cwd": str(_ROOT),
                           "tool_input": {"command": patch("Update File: gx-spirit-caller_eur.sha1")}})
        self.assertEqual(proc.returncode, 2)
        self.assertIn("is protected (**/*.sha1)", proc.stderr)

    def test_every_patch_verb_is_checked(self):
        for header in ("Add File: orig/x.txt", "Delete File: build.ninja",
                       "Update File: src/a.c\n*** Move to: objdiff.json"):
            with self.subTest(header=header):
                reason = pp.codex_hook({"cwd": str(_ROOT),
                                        "tool_input": {"command": patch(header)}})
                self.assertIsNotNone(reason)

    def test_patch_to_source_is_allowed(self):
        proc = self._hook({"tool_name": "apply_patch", "cwd": str(_ROOT),
                           "tool_input": {"command": patch("Update File: src/main/a.c",
                                                           "Add File: docs/note.md")}})
        self.assertEqual(proc.returncode, 0, proc.stderr)

    def test_unreadable_input_fails_closed(self):
        proc = subprocess.run(
            [sys.executable, str(_ROOT / "tools" / "protected_paths.py"), "--codex-hook"],
            input="not json", capture_output=True, text=True, check=False)
        self.assertEqual(proc.returncode, 2)


class TestSettingsFiles(unittest.TestCase):
    def test_claude_settings_deny_exactly_the_list(self):
        settings = json.loads((_ROOT / ".claude" / "settings.json").read_text(encoding="utf-8"))
        self.assertEqual(settings["permissions"]["deny"], pp.claude_rules())
        self.assertNotIn("hooks", settings)  # rules only: nothing to run, nothing OS-specific

    def test_claude_rules_cover_the_worktrees(self):
        rules = pp.claude_rules()
        for pattern in pp.PATTERNS:
            self.assertIn(f"Edit(/{pattern})", rules)
            if not pattern.startswith("**/"):
                self.assertIn(f"Edit(/.worktrees/*/{pattern})", rules)

    def test_codex_hook_is_wired_for_both_shells(self):
        hooks = json.loads((_ROOT / ".codex" / "hooks.json").read_text(encoding="utf-8"))
        [entry] = hooks["hooks"]["PreToolUse"]
        self.assertIn("apply_patch", entry["matcher"].split("|"))
        [hook] = entry["hooks"]
        self.assertEqual(hook["command"], "python3 tools/protected_paths.py --codex-hook")
        self.assertEqual(hook["commandWindows"], "python tools/protected_paths.py --codex-hook")


if __name__ == "__main__":
    unittest.main()
