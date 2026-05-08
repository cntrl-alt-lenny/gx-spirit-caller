#!/usr/bin/env python3

"""
patch_objects_legacy.py — rewrite `func_X.o` -> `func_X.legacy.o` in
the dsd-generated objects.txt for any source ending in `.legacy.c`.

Context: brief 037 (PR #327) shipped per-TU dual-compiler routing
via the `*.legacy.c` filename convention. The mwcc_legacy ninja
rule produces `func_X.legacy.o` correctly, but `dsd lcf` emits an
inconsistent pair of files for `.legacy.c` sources:

    arm9.lcf:    func_X.legacy.o(.text)             ← what mwldarm wants
    objects.txt: build/<ver>/src/main/func_X.o      ← what dsd emits (BUG)

mwldarm reads objects.txt as its file-search list, then resolves
arm9.lcf's references against it. The lookup fails for every routed
TU because the `.legacy` suffix is missing in the search list.

Brief 038 (PR #328) escalated; brief 039 lands this post-process
fix. Same dsd-output-patcher pattern as
`tools/patch_lcf_arm9_align.py` and `tools/patch_section_align.py`.

Scope: ONLY rewrites entries whose corresponding source file (per
delinks.txt) ends in `.legacy.c`. Default `.c` and `.cpp` and
`.s` entries pass through unchanged. Idempotent — running on an
already-patched objects.txt is a no-op.

Invocation is appended to the `lcf` ninja rule so objects.txt is
patched before mwldarm reads it. See tools/configure.py.

See also:
  - docs/research/style-a-epilogue.md — the brief 036 research
    that motivated the dual-compiler routing
  - tools/configure.py LEGACY_C_SUFFIX / is_legacy_c() — the
    routing convention itself

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
# Mirror configure.py's LEGACY_C_SUFFIX constant. Kept duplicated
# rather than imported because configure.py runs argparse at module
# load — importing it from a small post-process script would force
# a synthetic argv dance just to use one string. The
# tests/test_patch_objects_legacy.py file has a regression check
# pinning the two constants in sync.


def collect_legacy_sources(config_dir: Path) -> list[Path]:
    """Walk every delinks.txt under `config_dir` and return the
    source-paths ending in `.legacy.c`.

    Each TU's `source` is the literal string from delinks.txt,
    e.g. `"src/main/func_0207cbbc.legacy.c"`.
    """
    out: list[Path] = []
    if not config_dir.is_dir():
        return out
    for delinks in sorted(config_dir.rglob("delinks.txt")):
        _module_sections, tus = parse_delinks_file(delinks)
        for tu in tus:
            source = tu.get("source", "")
            if source.endswith(LEGACY_C_SUFFIX):
                out.append(Path(source))
    return out


def buggy_and_fixed_suffixes(source: Path) -> tuple[str, str]:
    """For a `.legacy.c` source, return (buggy_suffix, fixed_suffix)
    — the path-tails that appear in the dsd-emitted objects.txt and
    the form mwldarm expects (matching arm9.lcf).

    Concretely, for `src/main/func_0207cbbc.legacy.c`:

        buggy_suffix  = "src/main/func_0207cbbc.o"
        fixed_suffix  = "src/main/func_0207cbbc.legacy.o"

    Suffixes are POSIX-style (forward-slash) regardless of host OS,
    matching the dsd / ninja output format. Both forms preserve the
    `src/main/` directory part — that's how we disambiguate same-
    stem files in different modules during the rewrite below.
    """
    name = source.name
    if not name.endswith(LEGACY_C_SUFFIX):
        raise ValueError(f"not a legacy-routed source: {source}")
    stem_no_legacy = name[: -len(LEGACY_C_SUFFIX)]      # "func_X"
    stem_with_legacy = stem_no_legacy + ".legacy"        # "func_X.legacy"
    parent = source.parent.as_posix()
    return (
        f"{parent}/{stem_no_legacy}.o",                  # buggy
        f"{parent}/{stem_with_legacy}.o",                # fixed
    )


def patch_objects_text(text: str, sources: list[Path]) -> tuple[str, int]:
    """Apply the suffix rewrite to the contents of objects.txt.

    Each line of objects.txt is a single .o path. We scan for any
    line ending in a buggy-suffix and replace its tail with the
    corresponding fixed-suffix. Returns (new_text, count_changed).

    A line that already ends in the fixed-suffix is left alone —
    that's the idempotent path; rerunning is safe.
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
        for buggy, fixed in rewrite_map.items():
            if line.endswith(buggy) and not line.endswith(fixed):
                # Replace exactly the trailing-suffix occurrence.
                # Anchored at end-of-line so a substring match
                # mid-path (e.g. `dir/func_X.o.bak`) cannot hit.
                head = line[: -len(buggy)]
                line = head + fixed
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
