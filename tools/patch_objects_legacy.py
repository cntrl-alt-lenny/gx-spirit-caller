#!/usr/bin/env python3

"""
patch_objects_legacy.py — rewrite `func_X.o` -> `func_X.legacy.o`
(or `.legacy_sp3.o`) in the dsd-generated objects.txt for any
source ending in one of the legacy routing suffixes.

Context: brief 037 (PR #327) shipped per-TU dual-compiler routing
via the `*.legacy.c` filename convention; brief 045 added the
third tier `*.legacy_sp3.c` (mwcc 1.2/sp3, see
docs/research/sp3-routing-decision.md). The `mwcc_legacy` /
`mwcc_legacy_sp3` ninja rules produce `func_X.legacy.o` /
`func_X.legacy_sp3.o` correctly, but `dsd lcf` emits an
inconsistent pair of files for both suffixes:

    arm9.lcf:    func_X.legacy.o(.text)             ← what mwldarm wants
    objects.txt: build/<ver>/src/main/func_X.o      ← what dsd emits (BUG)

mwldarm reads objects.txt as its file-search list, then resolves
arm9.lcf's references against it. The lookup fails for every routed
TU because the `.legacy[_sp3]` qualifier is missing in the search
list.

Brief 038 (PR #328) escalated for the .legacy.c variant; brief 039
landed the post-process fix. Brief 045 extends it to `.legacy_sp3.c`
under the same dsd lcf bug. Same dsd-output-patcher pattern as
`tools/patch_lcf_arm9_align.py` and `tools/patch_section_align.py`.

Scope: ONLY rewrites entries whose corresponding source file (per
delinks.txt) ends in one of `LEGACY_SUFFIXES`. Default `.c` and
`.cpp` and `.s` entries pass through unchanged. Idempotent —
running on an already-patched objects.txt is a no-op.

Invocation is appended to the `lcf` ninja rule so objects.txt is
patched before mwldarm reads it. See tools/configure.py.

See also:
  - docs/research/style-a-epilogue.md — the brief 036 research
    that motivated the .legacy.c (sp2p3) routing
  - docs/research/sp3-routing-decision.md — brief 044 research
    that motivated the .legacy_sp3.c (sp3) routing
  - tools/configure.py LEGACY_C_SUFFIX / LEGACY_SP3_C_SUFFIX /
    is_legacy_c() / is_legacy_sp3_c() — the routing conventions

Usage:

    python tools/patch_objects_legacy.py \\
        --config-dir config/eur \\
        --objects build/eur/objects.txt
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

# Use the existing delinks parser from progress.py — same source-of-
# truth as collect_matched_ranges() / parse_delinks_file callers.
sys.path.insert(0, str(Path(__file__).resolve().parent))
from progress import parse_delinks_file  # noqa: E402


LEGACY_C_SUFFIX = ".legacy.c"
LEGACY_SP3_C_SUFFIX = ".legacy_sp3.c"
THUMB_C_SUFFIX = ".thumb.c"
# Mirror configure.py's LEGACY_C_SUFFIX / LEGACY_SP3_C_SUFFIX /
# THUMB_C_SUFFIX constants. Kept duplicated rather than imported
# because configure.py runs argparse at module load — importing it
# from a small post-process script would force a synthetic argv dance
# just to use a couple of strings. The
# tests/test_patch_objects_legacy.py file has regression checks
# pinning the duplications in sync.
#
# `.thumb.c` (brief 393) rides the same dsd-lcf objects.txt bug as the
# legacy tiers: its `mwcc_thumb` rule emits `func_X.thumb.o` but dsd
# writes `func_X.o` into objects.txt, so mwldarm can't find it. The
# generic rewrite below (qualifier = suffix minus `.c`) fixes
# `.thumb.c` the same way it fixes `.legacy[_sp3].c`.

# Order matters when checking which suffix a path ends with — the
# longer suffix (`.legacy_sp3.c`) must be checked BEFORE the shorter
# (`.legacy.c`) only if one were a tail of the other. They aren't
# (sp3 has `_sp3` between `legacy` and `.c`), so endswith() on
# either is unambiguous, but we sort longest-first for defensiveness
# in case a future tier adds a suffix that does overlap. (Despite the
# `LEGACY_` name this tuple is the full set of non-default routing
# suffixes — `.thumb.c` is not "legacy" but shares the objects.txt
# rewrite mechanism exactly.)
LEGACY_SUFFIXES: tuple[str, ...] = (
    LEGACY_SP3_C_SUFFIX,
    LEGACY_C_SUFFIX,
    THUMB_C_SUFFIX,
)


def _matching_legacy_suffix(name: str) -> str | None:
    """Return the LEGACY_SUFFIXES entry that `name` ends with, or
    None if `name` is not a legacy-routed source. Longest-first
    iteration so a hypothetical `.legacy_sp3.c` would never be
    misclassified as `.legacy.c` on a host whose endswith() short-
    circuits at the first match (`.legacy.c` is NOT a tail of
    `.legacy_sp3.c` — it's `_sp3.c` — so this is purely defensive).
    """
    for suf in LEGACY_SUFFIXES:
        if name.endswith(suf):
            return suf
    return None


def collect_legacy_sources(config_dir: Path) -> list[Path]:
    """Walk every delinks.txt under `config_dir` and return the
    source-paths ending in any LEGACY_SUFFIXES entry.

    Each TU's `source` is the literal string from delinks.txt,
    e.g. `"src/main/func_0207cbbc.legacy.c"` or
    `"src/main/func_020467f4.legacy_sp3.c"`.
    """
    out: list[Path] = []
    if not config_dir.is_dir():
        return out
    for delinks in sorted(config_dir.rglob("delinks.txt")):
        _module_sections, tus = parse_delinks_file(delinks)
        for tu in tus:
            source = tu.get("source", "")
            if _matching_legacy_suffix(source) is not None:
                out.append(Path(source))
    return out


def buggy_and_fixed_suffixes(source: Path) -> tuple[str, str]:
    """For a legacy-routed source, return (buggy_suffix,
    fixed_suffix) — the path-tails that appear in the dsd-emitted
    objects.txt and the form mwldarm expects (matching arm9.lcf).

    Concretely:

      `src/main/func_0207cbbc.legacy.c` →
        buggy_suffix  = "src/main/func_0207cbbc.o"
        fixed_suffix  = "src/main/func_0207cbbc.legacy.o"

      `src/main/func_020467f4.legacy_sp3.c` →
        buggy_suffix  = "src/main/func_020467f4.o"
        fixed_suffix  = "src/main/func_020467f4.legacy_sp3.o"

    Suffixes are POSIX-style (forward-slash) regardless of host OS,
    matching the dsd / ninja output format. Both forms preserve the
    `src/main/` directory part — that's how we disambiguate same-
    stem files in different modules during the rewrite below.
    """
    name = source.name
    suf = _matching_legacy_suffix(name)
    if suf is None:
        raise ValueError(f"not a legacy-routed source: {source}")
    stem_no_legacy = name[: -len(suf)]                  # "func_X"
    # Strip trailing ".c" from the suffix to get the qualifier
    # to splice into the .o filename: ".legacy" or ".legacy_sp3".
    legacy_qualifier = suf[: -len(".c")]
    stem_with_legacy = stem_no_legacy + legacy_qualifier
    parent = source.parent.as_posix()
    return (
        f"{parent}/{stem_no_legacy}.o",                 # buggy
        f"{parent}/{stem_with_legacy}.o",               # fixed
    )


def patch_objects_text(text: str, sources: list[Path]) -> tuple[str, int]:
    """Apply the suffix rewrite to the contents of objects.txt.

    Each line of objects.txt is a single .o path. We scan for any
    line ending in a buggy-suffix and replace its trailing basename
    with the corresponding fixed-suffix's basename. Returns
    (new_text, count_changed).

    A line that already ends in the fixed-suffix is left alone —
    that's the idempotent path; rerunning is safe.

    Path-separator handling (brief 059): `buggy_and_fixed_suffixes`
    returns POSIX-form suffixes (forward-slash) regardless of host
    because `dsd` on Linux/macOS emits POSIX paths. On Windows
    `dsd` emits backslash paths, so a literal `line.endswith(buggy)`
    misses every legacy entry — the symptom that brought down
    `ninja rom` at the final mwldarm step. The fix:

      1. Match on a POSIX-normalized copy of the line so the
         directory portion (`src/main/`) still disambiguates
         same-stem files in different modules — preserved from
         before this fix.
      2. Rewrite only the trailing basename, not the whole
         suffix. The buggy / fixed pair differs ONLY in the
         basename (`func_X.o` → `func_X.legacy.o`); the
         directory part is identical. So the directory and its
         native separator style stay verbatim in the output
         line. A Windows line stays all-backslash; a POSIX line
         stays all-forward-slash.

    This is Approach A from brief 059 — minimal change,
    separator-preserving. See tests for the platform matrix.
    """
    if not sources:
        return text, 0

    rewrite_map: dict[str, str] = {}
    for src in sources:
        buggy, fixed = buggy_and_fixed_suffixes(src)
        rewrite_map[buggy] = fixed

    out_lines: list[str] = []
    changed = 0
    for raw in text.splitlines(keepends=True):
        line = raw.rstrip("\n").rstrip("\r")
        line_norm = line.replace("\\", "/")
        for buggy, fixed in rewrite_map.items():
            if line_norm.endswith(buggy) and not line_norm.endswith(fixed):
                # Swap only the basename ("func_X.o" →
                # "func_X.legacy.o"). The directory portion stays
                # exactly as dsd emitted it — backslashes on
                # Windows, forward slashes on POSIX, mixed if
                # something upstream produced a mixed line.
                buggy_basename = buggy.rsplit("/", 1)[-1]
                fixed_basename = fixed.rsplit("/", 1)[-1]
                head = line[: -len(buggy_basename)]
                line = head + fixed_basename
                changed += 1
                break
        out_lines.append(line + "\n")
    return "".join(out_lines), changed


def patch_file(config_dir: Path, objects_path: Path) -> int:
    if not objects_path.is_file():
        # Not an error — some build configurations may not produce
        # an objects.txt yet (e.g. partial-tree builds). Silent
        # success; mwldarm will fail loudly downstream if it's
        # actually missing.
        return 0

    sources = collect_legacy_sources(config_dir)
    if not sources:
        return 0  # no .legacy.c files, no-op

    try:
        original = objects_path.read_text(encoding="utf-8")
    except OSError as e:
        print(f"error: could not read {objects_path}: {e}", file=sys.stderr)
        return 1

    new_text, changed = patch_objects_text(original, sources)
    if changed == 0:
        return 0

    try:
        objects_path.write_text(new_text, encoding="utf-8")
    except OSError as e:
        print(f"error: could not write {objects_path}: {e}", file=sys.stderr)
        return 1

    print(
        f"patched {objects_path}: {changed} legacy `.o` "
        f"entr{'y' if changed == 1 else 'ies'} rewritten",
        file=sys.stderr,
    )
    return 0


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Rewrite objects.txt entries for `.legacy.c` "
                    "sources so mwldarm finds the `.legacy.o` files "
                    "produced by the mwcc_legacy ninja rule. "
                    "Idempotent.",
    )
    ap.add_argument(
        "--config-dir", type=Path, required=True,
        help="Path to config/<version>/. Walked recursively for "
             "delinks.txt files.",
    )
    ap.add_argument(
        "--objects", type=Path, required=True,
        help="Path to build/<version>/objects.txt to patch in place.",
    )
    args = ap.parse_args()
    return patch_file(args.config_dir, args.objects)


if __name__ == "__main__":
    sys.exit(main())
