"""Guard against .codex/agents/*.toml drifting stale.

Originally (Sol review, 2026-07-19) this pinned that the Codex agent
definitions named the current 3-region `gate3.py` merge gate and didn't
reintroduce a stale "no toolchain, delegate verification" constraint.

2026-09-21 framework adoption: each `.codex/agents/*.toml` was reduced to
launch mechanics only (adapters may not restate authority, gates, queues or
branches — see `docs/agents/adapters.md`), so the gate is no longer
described here at all; `AGENTS.md`'s evidence table is now the single
source of truth for what "verified" means. The false-toolchain-constraint
pin still applies (nothing about launch mechanics should ever say a seat
lacks its toolchain), and a new pin replaces the gate-naming one: each file
must point at its role contract under `docs/agents/roles/` and at
`AGENTS.md`, rather than re-describing either.
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

# role -> the contract file its toml must point at (brain has its own
# contract; decomper/scaffolder are the worker contract plus a scope
# statement in AGENTS.md — see docs/agents/adapters.md § Seats are per
# contract, not per declared role name).
_EXPECTED_CONTRACT = {
    "brain": "docs/agents/roles/brain.md",
    "decomper": "docs/agents/roles/worker.md",
    "scaffolder": "docs/agents/roles/worker.md",
}


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

    def test_points_at_its_role_contract_and_agents_md(self):
        for f in self._files():
            with self.subTest(f=f.name):
                data = tomllib.load(f.open("rb"))
                role = data["name"]
                body = f.read_text(encoding="utf-8")
                contract = _EXPECTED_CONTRACT[role]
                self.assertIn(
                    contract, body,
                    f"{f.name} must point at its role contract ({contract}) "
                    "rather than restating it.")
                self.assertIn(
                    "AGENTS.md", body,
                    f"{f.name} must point at AGENTS.md for project scope.")

    def test_does_not_restate_gate_authority_merge_or_queue_content(self):
        # An adapter may add launch mechanics; it may never restate gates,
        # merge rights, or queue/branch identity — docs/agents/adapters.md
        # § What an adapter may never contain.
        _RESTATED_CONTENT = ("gate3", "gh pr merge", "docs/queue/")
        for f in self._files():
            body = f.read_text(encoding="utf-8")
            for phrase in _RESTATED_CONTENT:
                with self.subTest(f=f.name, phrase=phrase):
                    self.assertNotIn(
                        phrase, body,
                        f"{f.name} restates gate/merge/queue content ({phrase!r}) "
                        "that belongs only in AGENTS.md and docs/agents/.")


if __name__ == "__main__":
    unittest.main()
