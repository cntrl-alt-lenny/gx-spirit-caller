#!/usr/bin/env python3
"""Find and repair unsafe line endings in tracked executable text files.

The framework installs executable scripts in more than one directory. Git's
index mode and the script shebang identify those files without maintaining a
list that an adapter can outgrow; the fixed ``.githooks`` root is included
because Git discovers hooks there even when a file's mode has not yet been
committed correctly.

``refresh`` changes only line-ending bytes in the files it found and stages
only those paths. It never uses a stash, restores a file from another
revision, or changes another worktree.
"""

from __future__ import annotations

import argparse
import os
import subprocess
import sys
from pathlib import Path

HOOK_ROOT = ".githooks/"
UNSAFE_WORKTREE_EOL = {b"w/crlf", b"w/mixed"}


def _git(root: Path, *args: str) -> subprocess.CompletedProcess[bytes]:
    return subprocess.run(
        ["git", "-C", str(root), *args],
        capture_output=True,
        check=False,
    )


def _tracked_modes(root: Path) -> dict[bytes, bytes]:
    proc = _git(root, "ls-files", "--stage", "-z", "--")
    if proc.returncode != 0:
        return {}
    modes: dict[bytes, bytes] = {}
    for record in proc.stdout.split(b"\0"):
        if not record:
            continue
        metadata, separator, path = record.partition(b"\t")
        if not separator:
            continue
        mode = metadata.split(maxsplit=1)[0]
        modes[path] = mode
    return modes


def _is_shebang(root: Path, path: bytes) -> bool:
    try:
        return (root / os.fsdecode(path)).read_bytes().startswith(b"#!")
    except (OSError, UnicodeError):
        return False


def tracked_unsafe_paths(root: Path) -> list[str]:
    """Return unsafe tracked executable text paths in one checkout.

    Executable files are discovered from the index rather than from adapter
    names. A shebang also counts because adoption uses it to mark installed
    scripts executable, and it catches a pre-commit worktree whose mode has
    not yet been recorded. The framework's Git hook root is always included.
    """
    eol = _git(root, "ls-files", "--eol", "-z", "--")
    if eol.returncode != 0:
        return []
    modes = _tracked_modes(root)
    unsafe: list[str] = []
    for record in eol.stdout.split(b"\0"):
        if not record:
            continue
        metadata, separator, path = record.partition(b"\t")
        if not separator or len(metadata.split()) < 2:
            continue
        fields = metadata.split()
        if fields[1] not in UNSAFE_WORKTREE_EOL:
            continue
        text_file = (
            modes.get(path) == b"100755"
            or path.startswith(HOOK_ROOT.encode())
            or _is_shebang(root, path)
        )
        if text_file:
            unsafe.append(os.fsdecode(path))
    return sorted(set(unsafe))


def refresh(root: Path, paths: list[str]) -> int:
    """Normalize and stage only ``paths``; preserve all other local state."""
    changed: list[str] = []
    for rel in paths:
        path = root / rel
        try:
            before = path.read_bytes()
        except (OSError, UnicodeError) as exc:
            print(f"line-endings: cannot read {rel}: {exc}", file=sys.stderr)
            return 2
        after = before.replace(b"\r\n", b"\n").replace(b"\r", b"\n")
        if after != before:
            try:
                path.write_bytes(after)
            except OSError as exc:
                print(f"line-endings: cannot write {rel}: {exc}", file=sys.stderr)
                return 2
            changed.append(rel)

    if not changed:
        print("line-endings: no unsafe files changed")
        return 0

    staged = _git(root, "add", "--renormalize", "--", *changed)
    if staged.returncode != 0:
        print(staged.stderr.decode(errors="replace"), end="", file=sys.stderr)
        return staged.returncode or 2
    print("line-endings: normalized and staged:")
    for rel in changed:
        print(f"  {rel}")
    print("line-endings: review the staged diff; no stash or other worktree was touched")
    return 0


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("action", choices=("check", "refresh"))
    parser.add_argument("--root", default=".")
    args = parser.parse_args(argv)
    root = Path(args.root).expanduser().resolve()
    paths = tracked_unsafe_paths(root)
    if args.action == "check":
        if paths:
            print("line-endings: unsafe tracked executable text files:")
            for rel in paths:
                print(f"  {rel}")
            return 1
        print("line-endings: no unsafe tracked executable text files found")
        return 0
    return refresh(root, paths)


if __name__ == "__main__":
    sys.exit(main())
