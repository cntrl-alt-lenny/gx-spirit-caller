#!/usr/bin/env python3
"""
check_delink_dupes.py — catch the duplicate-delink footgun before it burns a gate.

Failure mode (real incidents: PR #948, #198): a sweep PR carves a function at an
address some *other* file on `main` already delinks. After the merge the region's
`delinks.txt` lists that `.text start:ADDR` under two different source files, and
`dsd lcf` aborts with "overlaps with previous file" AT MERGE — while the PR's own
branch `ninja sha1` was green, so no agent self-catches it. The brain then spends
a full wine lane discovering it. This static scan finds it in milliseconds, with a
clear message naming the address + the two files, so the brain (running it on the
merged integration tree, e.g. as a gate3 preflight) fails fast instead.

Why a plain per-file address scan is correct and false-positive-FREE: a legitimate
`.s`->`.c` conversion REMOVES the `.s` entry and ADDS a `.c` entry at the same
address, so the address still appears exactly ONCE in the final file. Two entries
at one address only happens when two *different* files both claim it — which is
exactly the bug. No git-delta simulation needed.

Only `.text start:` lines that sit inside a `src/...:` or `libs/...:` source block are counted;
the module's top-of-file section headers (`.text/.rodata/...`) are ignored.

Usage:
    python3.13 tools/check_delink_dupes.py                 # scan all config/**/delinks.txt
    python3.13 tools/check_delink_dupes.py path/to/delinks.txt ...   # specific files

Exit codes:
    0   no duplicate .text addresses
    1   duplicate(s) found (message names address + files)
    2   usage / IO error
"""
from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
_FILE_RE = re.compile(r"^((?:src|libs)/\S+):\s*$")
_TEXT_RE = re.compile(r"\.text\s+start:(0x[0-9a-fA-F]+)\s+end:")


def find_dupes(text: str) -> dict[str, list[str]]:
    """Return {address: [files...]} for any .text start address claimed by more
    than one distinct source file in a single delinks.txt body."""
    by_addr: dict[str, list[str]] = {}
    cur: str | None = None
    for line in text.splitlines():
        m = _FILE_RE.match(line)
        if m:
            cur = m.group(1)
            continue
        if cur:
            t = _TEXT_RE.search(line)
            if t:
                by_addr.setdefault(t.group(1).lower(), []).append(cur)
                cur = None  # only the first .text of a src block is its function
    return {a: fs for a, fs in by_addr.items() if len(set(fs)) > 1}


def main(argv: list[str]) -> int:
    args = argv[1:]
    if args:
        paths = [Path(a) for a in args]
    else:
        paths = sorted((ROOT / "config").rglob("delinks.txt"))
    if not paths:
        print("check_delink_dupes: no delinks.txt found", file=sys.stderr)
        return 2

    total = 0
    for p in paths:
        try:
            dupes = find_dupes(p.read_text(encoding="utf-8"))
        except OSError as e:
            print(f"check_delink_dupes: {p}: {e}", file=sys.stderr)
            return 2
        for addr, files in sorted(dupes.items()):
            total += 1
            rel = p.relative_to(ROOT) if p.is_absolute() and ROOT in p.parents else p
            print(f"DUPLICATE .text {addr} in {rel}:")
            for f in sorted(set(files)):
                print(f"    {f}")
    if total:
        print(f"\ncheck_delink_dupes: {total} duplicate .text address(es) — "
              f"`dsd lcf` would fail 'overlaps with previous file' at merge.")
        return 1
    print(f"check_delink_dupes: OK ({len(paths)} delinks.txt, no duplicate .text addresses)")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
