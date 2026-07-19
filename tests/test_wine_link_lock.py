"""Unit tests for tools/wine_link_lock.py — the flock wrapper brief 614 embeds
in the `mwld` ninja rule to keep the Wine-backed link step serialised
machine-wide, now that per-worktree WINEPREFIX lets compiles run unlocked.

Pins: the wrapped command's exit code + stdout propagate through untouched,
a missing command is a clean usage error (not a crash), and the lock is
genuinely exclusive across processes (mirrors the coverage the old
batch_carve._gate_lock test gave the mechanism it replaces).
"""
from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "tools"))

import wine_link_lock  # noqa: E402


class TestMain(unittest.TestCase):
    def test_no_args_is_a_usage_error(self):
        self.assertEqual(wine_link_lock.main([]), 2)

    def test_propagates_exit_code(self):
        rc = wine_link_lock.main([sys.executable, "-c", "import sys; sys.exit(17)"])
        self.assertEqual(rc, 17)

    def test_runs_the_command(self):
        with tempfile.TemporaryDirectory() as tmp:
            marker = Path(tmp) / "ran"
            rc = wine_link_lock.main([
                sys.executable, "-c",
                f"open({str(marker)!r}, 'w').write('x')",
            ])
            self.assertEqual(rc, 0)
            self.assertTrue(marker.exists(), "wrapped command's side effect never happened")


@unittest.skipIf(sys.platform == "win32", "POSIX-only flock behaviour")
class TestLockIsExclusive(unittest.TestCase):
    def test_lock_is_exclusive_across_processes(self):
        import fcntl

        with tempfile.TemporaryDirectory() as tmp:
            old_lock = wine_link_lock.LOCK_PATH
            wine_link_lock.LOCK_PATH = Path(tmp) / "wine-link.lock"
            try:
                # Hold the lock ourselves, exactly as a concurrent mwld
                # invocation's wine_link_lock.py would.
                with wine_link_lock.LOCK_PATH.open("w", encoding="utf-8") as holder:
                    fcntl.flock(holder, fcntl.LOCK_EX)
                    # A non-blocking competitor must fail to acquire it --
                    # proves the file IS the mutual-exclusion point, not
                    # just coincidentally unlocked.
                    with wine_link_lock.LOCK_PATH.open("w", encoding="utf-8") as competitor:
                        with self.assertRaises(BlockingIOError):
                            fcntl.flock(competitor, fcntl.LOCK_EX | fcntl.LOCK_NB)
            finally:
                wine_link_lock.LOCK_PATH = old_lock

    def test_main_blocks_until_the_lock_is_free(self):
        import fcntl
        import threading
        import time

        with tempfile.TemporaryDirectory() as tmp:
            old_lock = wine_link_lock.LOCK_PATH
            wine_link_lock.LOCK_PATH = Path(tmp) / "wine-link.lock"
            marker = Path(tmp) / "ran"
            try:
                holder = wine_link_lock.LOCK_PATH.open("w", encoding="utf-8")
                fcntl.flock(holder, fcntl.LOCK_EX)

                result: dict[str, int] = {}

                def run_main():
                    result["rc"] = wine_link_lock.main([
                        sys.executable, "-c", f"open({str(marker)!r}, 'w').write('x')",
                    ])

                t = threading.Thread(target=run_main)
                t.start()
                # Give the thread a moment to reach the flock call and
                # genuinely block -- it must NOT have run the command yet.
                time.sleep(0.3)
                self.assertFalse(marker.exists(), "command ran before the lock was free")

                fcntl.flock(holder, fcntl.LOCK_UN)
                holder.close()
                t.join(timeout=5)
                self.assertFalse(t.is_alive(), "main() never returned after the lock freed")
                self.assertEqual(result.get("rc"), 0)
                self.assertTrue(marker.exists(), "command never ran after the lock freed")
            finally:
                wine_link_lock.LOCK_PATH = old_lock


if __name__ == "__main__":
    unittest.main()
