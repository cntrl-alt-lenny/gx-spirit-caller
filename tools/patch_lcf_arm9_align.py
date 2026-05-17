#!/usr/bin/env python3

"""
patch_lcf_arm9_align.py — rewrite `ALIGNALL(4)` to `ALIGNALL(2)` in the
`.arm9` segment (and per-segment list) of a dsd-generated arm9.lcf.

Context: dsd's LCF template hardcodes `ALIGNALL(4)` per segment. For
the `.arm9` main code segment specifically, we need `ALIGNALL(2)` so
mwldarm permits Thumb .text sections whose `sh_addralign=2` (patched
by `tools/patch_section_align.py`) to land at 2-aligned addresses.
Without this post-process, mwldarm honors `ALIGNALL(4)` and re-raises
every section back to 4-alignment at link time, defeating the .o-level
fix and breaking `dsd check modules` for every module.

Scope: by default ONLY touches `.arm9`. Brief 131 added the ability to
target additional overlay segments (e.g. `.ov004`) via the
`--also-segments` flag — used by `configure.py` to fix the ov004
cascade where dsd-carved gap objects expose 2-aligned Thumb function
boundaries.

Invocation is appended to the `dsd lcf` ninja rule so the LCF is
always patched before mwldarm reads it. Idempotent — running on an
already-patched LCF is a no-op.

See also:
  - docs/research/thumb-align-wall.md — the root cause writeup
  - tools/patch_section_align.py — the companion .o-level patcher
  - docs/research/ov004-thunk-section-fix.md — brief 131 ov004 fix
    (`--also-segments` use case)

Usage:

    python tools/patch_lcf_arm9_align.py build/eur/arm9.lcf
    python tools/patch_lcf_arm9_align.py build/eur/arm9.lcf \\
        --also-segments .ov004
"""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path


# dsd-generated LCF structure (empirical; re-verify if dsd >=0.12
# changes template):
#
#   SECTIONS {
#       .arm9 {
#           ALIGNALL(4);
#           ... section definitions ...
#       }
#       .itcm {
#           ALIGNALL(4);
#           ...
#       }
#       .overlay_000 {
#           ALIGNALL(4);
#           ...
#       }
#       ...
#   }
#
# We find the `.arm9 {` block via a tight regex and rewrite the
# ALIGNALL value inside it. Don't be clever about nested blocks —
# dsd doesn't emit any.

_ARM9_BLOCK_START_RE = re.compile(
    # dsd emits either `.arm9 {` or `.arm9 : {` depending on version.
    # Both are valid LCF; accept either. PR #115 second-round found
    # the colon form was missed by the bare-brace-only regex,
    # silently no-op'ing this patcher and leaving ALIGNALL(4) intact.
    r"(^\s*\.arm9\s*:?\s*\{\s*$)",
    re.MULTILINE,
)
_ALIGNALL_RE = re.compile(r"\bALIGNALL\s*\(\s*\d+\s*\)\s*;")


def _block_start_re_for(segment: str) -> re.Pattern[str]:
    """Build the same `<segment> {` / `<segment> : {` block-start
    regex used for `.arm9`, but parameterised on the segment name.
    Caller passes the raw LCF identifier including its leading dot
    (e.g. ``.ov004``, ``.arm9``)."""
    # Escape any regex meta in the segment name (only `.` matters
    # for LCF identifiers in practice).
    pattern = (
        r"(^\s*" + re.escape(segment) + r"\s*:?\s*\{\s*$)"
    )
    return re.compile(pattern, re.MULTILINE)


def patch_lcf_text(
    text: str, *,
    target_alignall: int = 2,
    segments: tuple[str, ...] = (".arm9",),
) -> tuple[str, list[str]]:
    """Return (patched_text, segments_changed).

    For each segment name in `segments`, find the `<segment> {` block
    in `text`, locate the first ALIGNALL inside it, and rewrite the
    value to `target_alignall`. Returns `(text, [])` unchanged for
    any segment whose block or ALIGNALL isn't found, or whose value
    is already at the target.

    `segments` defaults to `(".arm9",)` to preserve the original
    single-segment behaviour. Brief 131 added `--also-segments` to
    cover ov004's Cat 4 alignment cascade.
    """
    changed: list[str] = []
    for segment in segments:
        block_re = _block_start_re_for(segment)
        m = block_re.search(text)
        if m is None:
            continue

        # Scan forward from the `{` character to find the matching `}`,
        # tracking brace depth. That's where the segment block ends.
        open_brace = text.index("{", m.end() - 1)
        depth = 1
        i = open_brace + 1
        while i < len(text) and depth > 0:
            c = text[i]
            if c == "{":
                depth += 1
            elif c == "}":
                depth -= 1
                if depth == 0:
                    break
            i += 1
        if depth != 0:
            # Unbalanced — don't guess; skip this segment.
            continue
        block_end = i

        block = text[open_brace:block_end + 1]
        new_block, n = _ALIGNALL_RE.subn(
            f"ALIGNALL({target_alignall});", block, count=1,
        )
        if n == 0 or new_block == block:
            continue
        text = text[:open_brace] + new_block + text[block_end + 1:]
        changed.append(segment)
    return text, changed


def patch_file(
    path: Path, *,
    target_alignall: int = 2,
    segments: tuple[str, ...] = (".arm9",),
) -> int:
    try:
        original = path.read_text(encoding="utf-8")
    except OSError as e:
        print(f"error: could not read {path}: {e}", file=sys.stderr)
        return 1

    new_text, changed_segments = patch_lcf_text(
        original,
        target_alignall=target_alignall,
        segments=segments,
    )
    if not changed_segments:
        # Not an error — either the requested segment(s) aren't present
        # in this LCF (e.g. a dev-only delink), the ALIGNALL is already
        # at target, or the file doesn't match the expected dsd
        # template. Silent success; the wider build will fail loudly
        # if the LCF is actually malformed.
        return 0

    try:
        path.write_text(new_text, encoding="utf-8")
    except OSError as e:
        print(f"error: could not write {path}: {e}", file=sys.stderr)
        return 1
    print(
        f"patched {path}: "
        f"ALIGNALL set to {target_alignall} in "
        f"{', '.join(changed_segments)}",
        file=sys.stderr,
    )
    return 0


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Rewrite ALIGNALL(N) inside the .arm9 segment "
                    "(and any extra segments) of a dsd-generated "
                    "arm9.lcf. Idempotent.",
    )
    ap.add_argument("path", type=Path, help="Path to arm9.lcf")
    ap.add_argument(
        "--target-alignall", type=int, default=2,
        help="ALIGNALL value to set inside the targeted segments "
             "(default: 2). Raising it would revert to the pre-patch "
             "state.",
    )
    ap.add_argument(
        "--also-segments", nargs="*", default=[],
        help="Additional LCF segment names (with leading dot, e.g. "
             "`.ov004`) to rewrite alongside `.arm9`. Used by brief "
             "131 to fix ov004's dsd-carved Thumb gap alignment "
             "cascade.",
    )
    args = ap.parse_args()
    segments = (".arm9",) + tuple(args.also_segments)
    return patch_file(
        args.path,
        target_alignall=args.target_alignall,
        segments=segments,
    )


if __name__ == "__main__":
    sys.exit(main())
