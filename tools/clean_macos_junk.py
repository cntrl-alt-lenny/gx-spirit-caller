#!/usr/bin/env python3

"""
clean_macos_junk.py — recursively remove OS-generated metadata
files (and optional directories) from a directory tree.

Context (brief 137 / brief 138)
-------------------------------

Brief 137's SHA1-gap scoping found that `.DS_Store` macOS
metadata files leaking into `extract/<region>/files/` accounted
for **99.995% of the post-brief-134 ROM diff** (100,805 bytes
on EUR). `dsd rom build` scans the file image directory and
indiscriminately includes every file it finds; the extra
`.DS_Store` entry shifts every FNT / FAT row, cascading
~100K bytes of byte-diff. Removing the file collapses EUR's
ROM diff to **5 bytes** — a three-orders-of-magnitude reduction
unlocked by this one-line filter.

What it removes
---------------

By default, the standard OS-metadata file set:

- `.DS_Store`         — macOS Finder per-directory metadata
- `._*`               — macOS AppleDouble resource forks
- `Thumbs.db`         — Windows Explorer thumbnail cache
- `desktop.ini`       — Windows folder customization

Pass `--include-dirs` to additionally remove these directory
trees (rare but possible on shared filesystems / Time Machine
volumes):

- `.AppleDouble/`     — AppleDouble resource fork directory
- `.fseventsd/`       — macOS file system events database
- `.Trashes/`         — per-volume trash on macOS
- `.Spotlight-V*/`    — macOS Spotlight index

How ninja consumes it
---------------------

Wired as a standalone `cleanup_macos_junk` rule in
`tools/configure.py` that runs before `dsd rom build` (brief
138). The rule uses a stamp-file output + `restat = 1` so ninja
only propagates downstream rebuilds when the cleanup actually
removed something (otherwise the rom-build cache stays warm).

Usage
-----

    # Plain cleanup (default file set), no stamp:
    python tools/clean_macos_junk.py --dir extract/eur/files

    # With stamp file (ninja integration):
    python tools/clean_macos_junk.py \\
        --dir extract/eur/files \\
        --stamp build/eur/cleanup_macos_junk.stamp

    # Include directories too:
    python tools/clean_macos_junk.py \\
        --dir extract/eur/files \\
        --include-dirs

Multiple `--dir` arguments are supported. Idempotent; safe to
chain into any build.
"""

from __future__ import annotations

import argparse
import shutil
import sys
from pathlib import Path

# Files we always remove. Exact-name match.
JUNK_FILE_NAMES: frozenset[str] = frozenset({
    ".DS_Store",
    "Thumbs.db",
    "desktop.ini",
})

# Files matching one of these prefixes get removed. Used for
# AppleDouble companion files (e.g. `._foo.bin`).
JUNK_FILE_PREFIXES: tuple[str, ...] = (
    "._",
)

# Directories removed only when `--include-dirs` is passed.
JUNK_DIR_NAMES: frozenset[str] = frozenset({
    ".AppleDouble",
    ".fseventsd",
    ".Trashes",
})

JUNK_DIR_PREFIXES: tuple[str, ...] = (
    ".Spotlight-",
)


def is_junk_file(name: str) -> bool:
    """Return True if `name` is a recognised OS-junk filename."""
    if name in JUNK_FILE_NAMES:
        return True
    for p in JUNK_FILE_PREFIXES:
        if name.startswith(p):
            return True
    return False


def is_junk_dir(name: str) -> bool:
    """Return True if `name` is a recognised OS-junk directory."""
    if name in JUNK_DIR_NAMES:
        return True
    for p in JUNK_DIR_PREFIXES:
        if name.startswith(p):
            return True
    return False


def clean_tree(
    root: Path,
    *,
    include_dirs: bool = False,
    verbose: bool = False,
) -> tuple[int, int]:
    """Recursively remove junk files (and optionally dirs) under
    `root`. Returns (files_removed, dirs_removed).

    Bottom-up traversal so directory removal happens after any
    files inside have been processed. Symbolic links are followed
    only for descent (we never traverse into linked dirs to avoid
    nuking unrelated trees)."""
    n_files = 0
    n_dirs = 0

    if not root.exists():
        return (0, 0)
    if not root.is_dir():
        # Single-file root: skip (we only sweep trees).
        return (0, 0)

    # Walk bottom-up so dirs can be removed after their contents.
    # `os.walk(topdown=False)` semantics via pathlib: collect all,
    # then iterate in reverse depth order.
    all_entries = sorted(
        root.rglob("*"),
        key=lambda p: (-len(p.parts), str(p)),
    )
    for entry in all_entries:
        try:
            if entry.is_symlink():
                # Don't follow symlinks into other trees. If the
                # symlink itself has a junky name, remove the link
                # but never its target.
                if is_junk_file(entry.name):
                    entry.unlink()
                    n_files += 1
                    if verbose:
                        print(
                            f"clean-junk: removed symlink {entry}",
                            file=sys.stderr,
                        )
                continue
            if entry.is_file() and is_junk_file(entry.name):
                entry.unlink()
                n_files += 1
                if verbose:
                    print(
                        f"clean-junk: removed file {entry}",
                        file=sys.stderr,
                    )
            elif entry.is_dir() and include_dirs and is_junk_dir(
                entry.name,
            ):
                shutil.rmtree(entry)
                n_dirs += 1
                if verbose:
                    print(
                        f"clean-junk: removed dir {entry}",
                        file=sys.stderr,
                    )
        except FileNotFoundError:
            # Concurrent removal — skip.
            continue
        except OSError as e:
            print(
                f"clean-junk: warning: could not remove {entry}: {e}",
                file=sys.stderr,
            )

    return (n_files, n_dirs)


def update_stamp(stamp: Path, force: bool) -> bool:
    """Touch `stamp` if `force` is True OR the stamp does not yet
    exist. Returns True if the stamp's mtime was modified (used
    by callers that want to know whether ninja's restat pass will
    propagate downstream)."""
    if force or not stamp.exists():
        stamp.parent.mkdir(parents=True, exist_ok=True)
        stamp.touch()
        return True
    return False


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(
        description=(
            "Recursively remove OS-generated metadata files "
            "(macOS .DS_Store / AppleDouble / etc., Windows "
            "Thumbs.db / desktop.ini) from one or more directory "
            "trees. Idempotent."
        ),
    )
    ap.add_argument(
        "--dir", action="append", type=Path, required=True,
        help="Directory tree to clean. Repeat for multiple trees.",
    )
    ap.add_argument(
        "--include-dirs", action="store_true",
        help="Also remove junk *directories* (.AppleDouble, "
             ".fseventsd, .Trashes, .Spotlight-V*).",
    )
    ap.add_argument(
        "--stamp", type=Path, default=None,
        help="Write/touch a stamp file when cleanup runs. With "
             "ninja's restat=1, the stamp's mtime only updates "
             "when this run actually removed something — keeping "
             "downstream rebuilds quiet otherwise. Created on "
             "first run even when no junk is present, so ninja "
             "always finds the declared output.",
    )
    ap.add_argument(
        "-v", "--verbose", action="store_true",
        help="Log every removal to stderr.",
    )
    args = ap.parse_args(argv)

    total_files = 0
    total_dirs = 0
    for d in args.dir:
        f, di = clean_tree(
            d,
            include_dirs=args.include_dirs,
            verbose=args.verbose,
        )
        total_files += f
        total_dirs += di

    if total_files or total_dirs:
        msg = f"clean-macos-junk: removed {total_files} file(s)"
        if total_dirs:
            msg += f", {total_dirs} dir(s)"
        msg += f" from {', '.join(str(d) for d in args.dir)}"
        print(msg, file=sys.stderr)

    if args.stamp is not None:
        update_stamp(
            args.stamp,
            force=(total_files > 0 or total_dirs > 0),
        )

    return 0


if __name__ == "__main__":
    sys.exit(main())
