"""Installed by the agentic framework: the project hygiene checks.

Runs `check_project` from tools/fw.py -- state document budget, no stored
commit ids, tool entry files that point at AGENTS.md, a declared merge rule,
and no personal paths or email addresses in the documents agents read. Each
exists because the failure happened in a real project. Replaced by framework
updates; do not edit it here.
"""

from __future__ import annotations

import importlib.util
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
_SPEC = importlib.util.spec_from_file_location("fw", ROOT / "tools" / "fw.py")
fw = importlib.util.module_from_spec(_SPEC)
_SPEC.loader.exec_module(fw)


class FrameworkHygiene(unittest.TestCase):
    def test_project_checks(self) -> None:
        errors = [message for level, message in fw.check_project(ROOT) if level == "error"]
        self.assertEqual(errors, [], "\n" + "\n".join(errors))


if __name__ == "__main__":
    unittest.main()
