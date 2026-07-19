#!/usr/bin/env python3
"""wine_link_lock.py — serialise the Wine-backed mwld link step machine-wide.

Brief 608 (docs/research/brief-608-wineprefix-spike.md) measured
near-linear compile scaling once each worktree gets its own WINEPREFIX
(no shared wineserver left to fight over), but only 2-way concurrency for
the link itself, with no compile load running alongside it. That's not
enough margin to trust unlimited concurrent links, so brief 614 keeps the
`mwld` step serialised — this script is that lock, scoped by
tools/configure.py to wrap ONLY the `mwld` ninja rule's command, never the
compile rules.

Usage: wine_link_lock.py <command> [args...]
Acquires an exclusive lock, runs the given command (argv, no shell), waits
for it, and exits with its return code. The lock is released automatically
when this process exits (fcntl.flock is tied to the open file
description).

Cross-worktree, not per-worktree: the lock file lives in the shared system
temp dir (same path batch_carve.py's older gate-lock used) so concurrent
lanes in *different* worktrees still queue against each other, not just
against themselves.
"""
from __future__ import annotations

import subprocess
import sys
import tempfile
from pathlib import Path

if sys.platform != "win32":
    import fcntl
else:
    fcntl = None  # pragma: no cover — never invoked on Windows (see configure.py)

LOCK_PATH = Path(tempfile.gettempdir()) / "spirit-caller-gate.lock"


def main(argv: list[str]) -> int:
    if not argv:
        print("usage: wine_link_lock.py <command> [args...]", file=sys.stderr)
        return 2
    if fcntl is None:
        # Native Windows mwld has no wineserver/Rosetta contention to
        # serialise against; configure.py never wraps the mwld rule in
        # this script there, but stay a safe passthrough just in case.
        return subprocess.run(argv).returncode
    with LOCK_PATH.open("w", encoding="utf-8") as lock_file:
        fcntl.flock(lock_file, fcntl.LOCK_EX)
        return subprocess.run(argv).returncode


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
