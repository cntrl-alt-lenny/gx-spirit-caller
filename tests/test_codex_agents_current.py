"""Guard against .codex/agents/*.toml drifting stale (Sol review, 2026-07-19).

The Codex agent definitions had gone ~2 months stale: scaffolder.toml told
Luna it had NO toolchain and must delegate verification, and brain/decomper
cited the obsolete "24/27 baseline" / `ninja rom` / `dsd check modules` gate
instead of the 3-region `gate3.py`. A standing role definition that contradicts
the kickoffs makes the agent do less and stop early. These checks fail loudly if
the false constraints or the obsolete gate return, and confirm each file still
parses and names the current gate.
"""

from __future__ import annotations

import tomllib
import unittest
from pathlib import Path

_AGENTS = Path(__file__).resolve().parent.parent / ".codex" / "agents"

# Phrasings that were the actual bug — they must never be present as instructions.
_FORBIDDEN = [
    "DO NOT have a local toolchain",
    "delegates final ROM verification",
    "cannot run `ninja`",
    "You CANNOT",  # the old scaffolder "You CANNOT: Run ninja rom" block
]


class TestCodexAgentsCurrent(unittest.TestCase):
    def _files(self):
        files = sorted(_AGENTS.glob("*.toml"))
        self.assertTrue(files, f"no agent .toml under {_AGENTS}")
        return files

    def test_all_parse(self):
        for f in self._files():
            with self.subTest(f=f.name):
                data = tomllib.load(f.open("rb"))
                self.assertIn("developer_instructions", data)
                self.assertIn("name", data)

    def test_no_false_toolchain_constraints(self):
        for f in self._files():
            body = f.read_text(encoding="utf-8")
            for phrase in _FORBIDDEN:
                with self.subTest(f=f.name, phrase=phrase):
                    self.assertNotIn(
                        phrase, body,
                        f"{f.name} reintroduced a stale false constraint "
                        f"({phrase!r}) — Codex agents DO have the full toolchain "
                        f"per-worktree; keep this in sync with AGENTS.md.")

    def test_names_the_current_gate(self):
        # gate3 is the current merge gate; every def should reference it so the
        # agent knows what "verified" means.
        for f in self._files():
            with self.subTest(f=f.name):
                self.assertIn("gate3", f.read_text(encoding="utf-8"),
                              f"{f.name} doesn't mention gate3.py — the 3-region "
                              f"merge gate. Did it revert to the old workflow?")


if __name__ == "__main__":
    unittest.main()
