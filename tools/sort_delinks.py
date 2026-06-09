#!/usr/bin/env python3
"""sort_delinks.py — canonicalize a dsd ``delinks.txt`` by sorting its TU blocks
into ascending address order (brief 389).

WHY THIS EXISTS
---------------
``dsd delink`` reads exactly ONE ``delinks.txt`` per overlay: the ``delinks:``
field in ``config.yaml`` is a single path. A YAML *list* there makes dsd panic
(it deserialises a String), and a *directory* errors (``os error 5`` — it opens
the path as a file). So the two ``.s`` lanes cannot simply own separate files.

For ov002 the lanes split by address: the decomper owns the LOWER half
(``addr < 0x02234000``), the scaffolder the UPPER half. Both add carve blocks to
the SAME ``ov002/delinks.txt``. APPENDING each block to the end means every
co-merge of the two lanes collides on the same end-of-file lines — this left
unresolved git conflict markers in ``delinks.txt`` and broke ``main`` twice
(briefs 387 / 388).

THE FIX
-------
Sort the blocks by address. Each lane's blocks then land in DISJOINT line
regions (decomper low, scaffolder high), so a 3-way git merge of the two lanes'
PRs auto-resolves instead of conflicting. dsd does not care about block order,
so this is purely a source-control-hygiene transform — no build effect.

DISCIPLINE (both lanes, every wave)
-----------------------------------
After carving (append your block anywhere — end is fine), run::

    python tools/sort_delinks.py config/eur/arm9/overlays/ov002/delinks.txt

before committing. Idempotent: re-running on an already-sorted file is a no-op.

WHAT IS PRESERVED
-----------------
* The leading section-map header (the indented ``.text/.rodata/.init/...`` lines
  before the first TU) stays at the top, untouched.
* Each TU block keeps its EXACT text — directives and trailing blank lines — so
  only block *order* changes. A lossless-parse assertion guards against the
  sorter ever dropping or mangling a line.
"""
import re
import sys

# A TU block starts at a non-indented line ending in ':'  (e.g.
# "src/overlay002/func_ov002_021b085c.s:" or "libs/nitro/..legacy.c:").
# The section-map header lines are indented and end in "align:N", so they never
# match.
_TU_HEADER = re.compile(r"^\S.*:$")
_ADDR = re.compile(r"start:0x([0-9a-fA-F]+)")


def _addr_of(block):
    """First ``start:0x...`` address in a block (its sort key)."""
    for line in block:
        m = _ADDR.search(line)
        if m:
            return int(m.group(1), 16)
    return 0


def sort_delinks(path):
    with open(path, newline="") as f:
        text = f.read()
    nl = "\r\n" if "\r\n" in text else "\n"
    lines = text.split(nl)

    # Everything before the first TU header is the section-map header.
    first = next((i for i, l in enumerate(lines) if _TU_HEADER.match(l)), len(lines))
    header, body = lines[:first], lines[first:]

    # Split the body into blocks: each runs from one TU header to the next.
    blocks, cur = [], None
    for line in body:
        if _TU_HEADER.match(line):
            if cur is not None:
                blocks.append(cur)
            cur = [line]
        elif cur is not None:
            cur.append(line)
    if cur is not None:
        blocks.append(cur)

    # Lossless-parse guard: re-joining header + blocks in their ORIGINAL order
    # must reproduce the input byte-for-byte. If not, the parse lost something
    # and we must NOT write a corrupted config.
    roundtrip = nl.join(header + [l for blk in blocks for l in blk])
    assert roundtrip == text, f"{path}: delinks parse is not lossless — aborting"

    inv_before = sum(
        1 for i in range(1, len(blocks)) if _addr_of(blocks[i]) < _addr_of(blocks[i - 1])
    )
    blocks.sort(key=_addr_of)  # Python's sort is stable
    inv_after = sum(
        1 for i in range(1, len(blocks)) if _addr_of(blocks[i]) < _addr_of(blocks[i - 1])
    )

    out = nl.join(header + [l for blk in blocks for l in blk])
    if out != text:
        with open(path, "w", newline="") as f:
            f.write(out)
    status = "no-op (already sorted)" if out == text else "rewrote"
    print(
        f"{path}: {len(blocks)} blocks, {inv_before} inversions -> {inv_after}; {status}"
    )
    return inv_after


if __name__ == "__main__":
    if len(sys.argv) < 2:
        sys.exit("usage: python tools/sort_delinks.py <delinks.txt> [<delinks.txt> ...]")
    bad = 0
    for p in sys.argv[1:]:
        bad += sort_delinks(p)
    sys.exit(1 if bad else 0)
