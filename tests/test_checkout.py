"""The installed first-action checkout check must fail closed.

MUST PASS FROM EVERY CHECKOUT THIS SUITE CAN RUN FROM -- the primary,
coordinating checkout, and every role's own linked worktree (e.g.
`.worktrees/worker`), because a project's own `python3 -m unittest discover`
is expected to run from any of them. A prior version of this test hardcoded
`brain` as the seat to claim, which only passes from the primary checkout and
fails the installed suite outright whenever it runs from a role worktree --
exactly the case `framework/git-and-isolation.md` documents as normal. This
version derives the checkout's own seat structurally, with
`checkout.checkout_seat`, the same function the checkout script's own guard
uses, and asserts against that -- so it passes everywhere the guard should
pass, and keeps a second case proving the guard can still fail.
"""

from __future__ import annotations

import subprocess
import sys
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))


class TestCheckoutCheck(unittest.TestCase):
    def _run(self, seat: str):
        return subprocess.run(
            [sys.executable, str(ROOT / "tools" / "checkout.py"), "--seat", seat],
            cwd=ROOT, capture_output=True, text=True,
        )

    def setUp(self):
        probe = subprocess.run(
            ["git", "rev-parse", "--show-toplevel"],
            cwd=ROOT, capture_output=True, text=True,
        )
        if probe.returncode:
            self.skipTest("adoption target is not a Git checkout")
        import checkout  # noqa: E402 -- tools/checkout.py, installed alongside this test
        try:
            self.actual_seat = checkout.checkout_seat(ROOT)
        except checkout.CheckoutError as exc:
            self.skipTest(f"this checkout's seat cannot be derived: {exc}")

    def test_the_checkout_running_this_suite_passes_its_own_seat(self):
        proc = self._run(self.actual_seat)
        self.assertEqual(proc.returncode, 0, proc.stdout + proc.stderr)

    def test_claiming_a_seat_this_checkout_does_not_own_fails_with_locations(self):
        """The guard can still fail: a seat guaranteed to differ from this
        checkout's own must always be rejected, whatever that own seat is."""
        wrong_seat = f"{self.actual_seat}-is-not-this-checkout"
        proc = self._run(wrong_seat)
        self.assertEqual(proc.returncode, 1)
        self.assertIn("current checkout", proc.stderr)
        self.assertIn(wrong_seat, proc.stderr)


if __name__ == "__main__":
    unittest.main()
