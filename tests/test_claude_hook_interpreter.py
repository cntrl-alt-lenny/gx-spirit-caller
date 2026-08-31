"""The interpreter named in `.claude/settings.json` must actually resolve.

Every hook command in that file starts with a bare interpreter name. If the
name does not resolve on PATH, Claude Code's hooks do not error loudly — they
degrade to no-ops, and the ruff/test/invariants gates they enforce stop
running with no signal that anything changed.

The assumption was also documented as a fact that is not true: the file used
to claim "Linux + Windows both have `python3` on PATH by convention". Windows
does not guarantee it. python.org installers ship `python.exe`; `python3.exe`
comes from the Microsoft Store build. On the machine where this test was
written, `python3.exe` existed only because someone had copied `python.exe` to
that name by hand — `python.exe` was dated with the installer, `python3.exe`
was dated months later and byte-identical in size.

So this test does two things:

  * pins every hook command to a single, consistent interpreter name, so the
    file cannot drift into a mix of `python` and `python3`
  * asserts that name resolves *here*, turning a silent hook failure into a
    loud test failure

It deliberately does NOT assert the name is `python3`. If the project later
adopts a launcher or a different name, this test should keep passing — what it
guards is "the thing you named is present", not a particular spelling.
"""

from __future__ import annotations

import json
import shutil
import unittest
from pathlib import Path

_ROOT = Path(__file__).resolve().parent.parent
_SETTINGS = _ROOT / ".claude" / "settings.json"


def _hook_commands(settings: dict) -> list[str]:
    """Every `command` string under any hook event, in file order."""
    found: list[str] = []
    hooks = settings.get("hooks", {})
    for event_entries in hooks.values():
        for entry in event_entries or []:
            for hook in entry.get("hooks", []) or []:
                cmd = hook.get("command")
                if isinstance(cmd, str) and cmd.strip():
                    found.append(cmd.strip())
    return found


class TestHookInterpreterResolves(unittest.TestCase):
    def setUp(self):
        if not _SETTINGS.exists():
            self.skipTest(f"{_SETTINGS} not present")
        self.settings = json.loads(_SETTINGS.read_text(encoding="utf-8"))
        self.commands = _hook_commands(self.settings)

    def test_there_are_hook_commands_to_check(self):
        """Guard the guard: an empty hook list would make this suite vacuous."""
        self.assertTrue(
            self.commands,
            "no hook commands found in .claude/settings.json — either the "
            "hooks were removed or the parser no longer matches the schema, "
            "and this test would silently pass either way",
        )

    def test_all_hooks_use_one_interpreter(self):
        interpreters = {c.split()[0] for c in self.commands}
        self.assertEqual(
            1,
            len(interpreters),
            "hook commands disagree on the interpreter: "
            f"{sorted(interpreters)}. A mixed set means some hooks run and "
            "others silently do not, depending on the machine.",
        )

    def test_the_named_interpreter_is_present_on_this_machine(self):
        interpreter = self.commands[0].split()[0]
        self.assertIsNotNone(
            shutil.which(interpreter),
            f"hook interpreter {interpreter!r} does not resolve on PATH. "
            "Claude Code hooks fail SILENTLY when this happens — the "
            "ruff/test/invariants gates stop running with no error. On "
            "Windows this is the expected failure when Python came from "
            "python.org (which ships python.exe only): install from the "
            "Microsoft Store, or put a python3 shim beside python.",
        )


if __name__ == "__main__":
    unittest.main()
