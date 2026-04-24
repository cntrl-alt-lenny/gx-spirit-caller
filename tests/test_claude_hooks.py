"""Unit tests for .claude/hooks/{post_edit,pre_bash}.py.

Hooks run on every Edit and every Bash the agent makes. Regressions
either:
  - Silently pass a broken edit (defeats the point of the hook)
  - Block a valid Bash the agent needs to run (breaks the session)
  - Flood stderr with unrelated noise (drowns the real signal)

Pinned behaviours:

post_edit.py:
  - Passes silently on non-Python edits
  - Passes silently on Python edits outside tools/ + tests/
  - Runs ruff on tools/*.py + tests/*.py edits
  - Runs unittest when ruff is clean; skips when ruff fails
  - Tolerates malformed / missing stdin (returns 0)

pre_bash.py:
  - Passes silently on non-git-push Bash
  - Passes silently on `git push --no-verify` (user opt-out)
  - Blocks (exit 2) when invariants errors
  - Skips when SKIP_INVARIANTS_HOOK env var set
  - Output filter strips the complete_tu_rename backlog section
"""

from __future__ import annotations

import json
import subprocess
import sys
import unittest
from pathlib import Path

_HOOKS_DIR = Path(__file__).resolve().parent.parent / ".claude" / "hooks"

# Import the filter + regex directly — they're pure-function and
# worth unit-testing without subprocess overhead.
sys.path.insert(0, str(_HOOKS_DIR))

import post_edit  # noqa: E402
import pre_bash  # noqa: E402


def _run_hook(
    script: Path, payload: dict, env_extra: dict | None = None,
) -> tuple[int, str, str]:
    """Invoke one of the hooks as a subprocess, feeding payload as
    stdin JSON. Returns (returncode, stdout, stderr)."""
    import os
    env = dict(os.environ)
    if env_extra:
        env.update(env_extra)
    proc = subprocess.run(
        [sys.executable, str(script)],
        input=json.dumps(payload),
        capture_output=True,
        text=True,
        env=env,
    )
    return proc.returncode, proc.stdout, proc.stderr


class TestPostEditPathGating(unittest.TestCase):
    """post_edit.py's filter logic: which edits trigger the lint/
    test run at all."""

    def test_non_python_edit_passes_silently(self):
        rc, _out, err = _run_hook(
            _HOOKS_DIR / "post_edit.py",
            {"tool_name": "Edit", "tool_input": {
                "file_path": "docs/state.md",
            }},
        )
        self.assertEqual(rc, 0)
        self.assertEqual(err.strip(), "")

    def test_python_outside_tools_tests_passes(self):
        # E.g. `configure.py` at the repo root (hypothetical) —
        # our hook scope is strictly tools/ + tests/.
        rc, _out, err = _run_hook(
            _HOOKS_DIR / "post_edit.py",
            {"tool_name": "Edit", "tool_input": {
                "file_path": "scripts/build.py",
            }},
        )
        self.assertEqual(rc, 0)
        self.assertEqual(err.strip(), "")

    def test_non_edit_tool_passes(self):
        # Read / Grep / Bash / etc. shouldn't trigger the hook.
        rc, _out, err = _run_hook(
            _HOOKS_DIR / "post_edit.py",
            {"tool_name": "Read", "tool_input": {"file_path": "x.py"}},
        )
        self.assertEqual(rc, 0)
        self.assertEqual(err.strip(), "")

    def test_malformed_stdin_tolerated(self):
        # No JSON at all — hook returns 0 (can't do anything useful).
        proc = subprocess.run(
            [sys.executable, str(_HOOKS_DIR / "post_edit.py")],
            input="not-json-at-all",
            capture_output=True, text=True,
        )
        self.assertEqual(proc.returncode, 0)

    def test_missing_file_path_tolerated(self):
        rc, _out, _err = _run_hook(
            _HOOKS_DIR / "post_edit.py",
            {"tool_name": "Edit", "tool_input": {}},
        )
        self.assertEqual(rc, 0)


class TestPostEditInternal(unittest.TestCase):
    """Unit tests for the pure-function helpers in post_edit."""

    def test_extract_edited_path_edit(self):
        p = post_edit._extract_edited_path({
            "tool_name": "Edit",
            "tool_input": {"file_path": "tools/x.py"},
        })
        self.assertEqual(p, "tools/x.py")

    def test_extract_edited_path_write(self):
        p = post_edit._extract_edited_path({
            "tool_name": "Write",
            "tool_input": {"file_path": "tests/y.py"},
        })
        self.assertEqual(p, "tests/y.py")

    def test_extract_edited_path_multiedit(self):
        p = post_edit._extract_edited_path({
            "tool_name": "MultiEdit",
            "tool_input": {"file_path": "tools/z.py"},
        })
        self.assertEqual(p, "tools/z.py")

    def test_extract_edited_path_other_tool_returns_none(self):
        self.assertIsNone(post_edit._extract_edited_path({
            "tool_name": "Bash",
            "tool_input": {"command": "echo"},
        }))

    def test_relative_path_for_abs_inside_root(self):
        p = post_edit._relative_path(
            str(post_edit.ROOT / "tools" / "x.py"),
        )
        self.assertEqual(p, Path("tools") / "x.py")

    def test_relative_path_for_abs_outside_root_is_none(self):
        # A tmp file path Claude's Edit tool touched via a scratch.
        p = post_edit._relative_path("/tmp/elsewhere/x.py")
        self.assertIsNone(p)

    def test_relative_path_for_relative_passes_through(self):
        p = post_edit._relative_path("tools/x.py")
        self.assertEqual(p, Path("tools/x.py"))


class TestPreBashGating(unittest.TestCase):
    """pre_bash.py: what it passes vs blocks."""

    def test_non_bash_tool_passes(self):
        rc, _, _ = _run_hook(
            _HOOKS_DIR / "pre_bash.py",
            {"tool_name": "Edit", "tool_input": {}},
        )
        self.assertEqual(rc, 0)

    def test_bash_without_git_push_passes(self):
        rc, _, _ = _run_hook(
            _HOOKS_DIR / "pre_bash.py",
            {"tool_name": "Bash", "tool_input": {
                "command": "ls -la",
            }},
        )
        self.assertEqual(rc, 0)

    def test_bash_with_git_push_no_verify_passes(self):
        # User explicitly bypassed git hooks — respect that.
        rc, _, _ = _run_hook(
            _HOOKS_DIR / "pre_bash.py",
            {"tool_name": "Bash", "tool_input": {
                "command": "git push --no-verify",
            }},
        )
        self.assertEqual(rc, 0)

    def test_skip_env_var_bypasses_entirely(self):
        # Even with a bare `git push`, SKIP_INVARIANTS_HOOK=1 passes.
        rc, _, _ = _run_hook(
            _HOOKS_DIR / "pre_bash.py",
            {"tool_name": "Bash", "tool_input": {
                "command": "git push origin cloud/x",
            }},
            env_extra={"SKIP_INVARIANTS_HOOK": "1"},
        )
        self.assertEqual(rc, 0)

    def test_missing_tool_name_passes(self):
        rc, _, _ = _run_hook(
            _HOOKS_DIR / "pre_bash.py", {},
        )
        self.assertEqual(rc, 0)


class TestPreBashInternal(unittest.TestCase):
    """Regex + filter unit tests, no subprocess."""

    def test_git_push_match_basic(self):
        self.assertTrue(pre_bash._is_git_push("git push"))
        self.assertTrue(
            pre_bash._is_git_push("git push -u origin branch"),
        )
        self.assertTrue(
            pre_bash._is_git_push("  git push origin main  "),
        )

    def test_git_push_match_in_chain(self):
        self.assertTrue(
            pre_bash._is_git_push("git commit -m x && git push"),
        )
        self.assertTrue(
            pre_bash._is_git_push("true; git push origin x"),
        )

    def test_git_push_no_verify_not_matched(self):
        # Explicit bypass — we don't intercept.
        self.assertFalse(
            pre_bash._is_git_push("git push --no-verify"),
        )
        self.assertFalse(
            pre_bash._is_git_push(
                "git push --no-verify origin branch",
            ),
        )

    def test_non_push_git_commands_not_matched(self):
        self.assertFalse(pre_bash._is_git_push("git pull"))
        self.assertFalse(pre_bash._is_git_push("git status"))
        self.assertFalse(pre_bash._is_git_push("git add tools/"))

    def test_empty_and_whitespace_not_matched(self):
        self.assertFalse(pre_bash._is_git_push(""))
        self.assertFalse(pre_bash._is_git_push("   "))

    def test_filter_strips_complete_tu_rename_section(self):
        raw = (
            "Found 317 issue(s): 0 error(s), 317 warning(s).\n"
            "\n"
            "== missing_tu_source (1) ==\n"
            "  [error] foo/bar missing\n"
            "== complete_tu_rename (316) ==\n"
            "  [warn] x\n"
            "  [warn] y\n"
            "  [warn] z\n"
            "== other_section (0) ==\n"
            "  (nothing)\n"
        )
        out = pre_bash._filter_invariants_output(raw)
        self.assertIn("missing_tu_source", out)
        self.assertIn("foo/bar missing", out)
        self.assertIn("other_section", out)
        self.assertNotIn("complete_tu_rename", out)
        self.assertNotIn("[warn] x", out)

    def test_filter_preserves_text_without_skip_section(self):
        raw = "Found 0 issue(s).\n== other (0) ==\n  ok\n"
        out = pre_bash._filter_invariants_output(raw)
        self.assertEqual(out.strip(), raw.strip())


class TestSettingsJson(unittest.TestCase):
    """Pin the committed .claude/settings.json shape. The harness
    reads this exact file; a typo in the keys silently disables
    the hooks."""

    def setUp(self):
        self.settings_path = (
            _HOOKS_DIR.parent / "settings.json"
        )
        self.data = json.loads(
            self.settings_path.read_text(encoding="utf-8"),
        )

    def test_has_hooks_key(self):
        self.assertIn("hooks", self.data)

    def test_post_tool_use_wires_post_edit(self):
        entries = self.data["hooks"].get("PostToolUse", [])
        self.assertTrue(entries, "PostToolUse empty")
        any_match = any(
            any(
                "post_edit.py" in h.get("command", "")
                for h in e.get("hooks", [])
            )
            for e in entries
        )
        self.assertTrue(any_match,
                        "No PostToolUse entry invokes post_edit.py")

    def test_pre_tool_use_wires_pre_bash(self):
        entries = self.data["hooks"].get("PreToolUse", [])
        self.assertTrue(entries, "PreToolUse empty")
        any_match = any(
            any(
                "pre_bash.py" in h.get("command", "")
                for h in e.get("hooks", [])
            )
            for e in entries
        )
        self.assertTrue(any_match,
                        "No PreToolUse entry invokes pre_bash.py")

    def test_matchers_are_strings(self):
        # Matcher typos (e.g. "Edit|write" with wrong case) silently
        # fail. Pin that at least Edit is in the PostToolUse matcher.
        post = self.data["hooks"]["PostToolUse"][0]["matcher"]
        self.assertIn("Edit", post)


if __name__ == "__main__":
    unittest.main()
