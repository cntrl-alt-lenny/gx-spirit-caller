#!/usr/bin/env python3
"""declperm.py -- permute a function's leading local-declaration order and
measure each permutation against the ground truth.

Ported from khdays-decomp's `tools/declperm.py`
(https://github.com/Yokimitsuro/khdays-decomp, CC0-1.0 -- see
docs/research/data/khdays-callsite-arity-report-2026-07-25.md for the
full q-khdays-toolkit attribution note).

WHY (khdays' own reasoning -- ARM register allocation is the same
underlying mechanism regardless of project, so it applies identically
here): declaration order colors which local gets which callee-saved
register, and a residual that is PURELY a register-letter permutation
often falls once the declarations are reordered to match. Doing this
by hand costs one full compile+diff per guess; with 4-5 locals there
are 24-120 orderings, and an automated sweep takes seconds to minutes
instead. khdays closed a real park (their func_ov008_02069954) at
permutation 33 of 120.

ADAPTATION (this project has neither khdays' `match.py` nor its
prebuilt `build/func_index.json` ground-truth index): every permutation
is compiled and compared via THIS project's own `fastmatch.match_one()`
-- the real mwccarm/ninja toolchain plus dsd's gap-object resolution,
already proven throughout this campaign, reused here instead of
reimplementing khdays' infrastructure. One consequence is genuinely
simpler than the original: `fastmatch`'s own tier detection already
reads the `.legacy.c` / `.legacy_sp3.c` / `.thumb.c` filename suffix,
so this port needs no `--thumb`-style flag at all.

Detects the leading declaration block as consecutive lines at the top
of the function body that each declare ONE variable, with or without
an initializer -- an initialized declaration (`int x = 0;`) is split
into a bare declaration (permutable) plus an assignment (kept in its
ORIGINAL source order after the block), so only decl ORDER is ever
permuted, never evaluation order.

Usage:
    python tools/declperm.py eur src/main/func_X.c func_X
    python tools/declperm.py eur src/main/func_X.c func_X --max 50
"""
from __future__ import annotations

import argparse
import itertools
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import fastmatch  # noqa: E402

ROOT = Path(__file__).resolve().parent.parent

_BARE_DECL_RE = re.compile(r"^(\s+)([A-Za-z_][\w \*]*?\s+\*?)(\w+)\s*;\s*$")
_INIT_DECL_RE = re.compile(r"^(\s+)([A-Za-z_][\w \*]*?\s+\*?)(\w+)\s*=\s*(.+);\s*$")
_CONTROL_START = ("return", "if", "for", "while", "do", "switch")


def find_leading_decls(lines: list[str], body_start: int) -> tuple[list[str], list[str], int]:
    """From body_start (the line after the function's opening `{`), collect
    the leading declaration block. Returns (decls, inits, first_line_after_block)."""
    decls: list[str] = []
    inits: list[str] = []
    j = body_start
    while j < len(lines):
        # Bug fixed relative to khdays' original: `_BARE_DECL_RE` alone is
        # lexically ambiguous with a single-bare-identifier return
        # statement -- "return a;" parses as TYPE="return" NAME="a" just
        # as validly as a real declaration, since the regex has no
        # semantic notion of C keywords. khdays' own control-flow guard
        # (`not lines[j].lstrip().startswith(_CONTROL_START)`) was only
        # ever applied to the WITH-initializer branch below, leaving the
        # bare-declaration branch exposed to this exact ambiguity for the
        # extremely common `{ int a; int b; return a; }` shape (return a
        # single already-declared local, no expression). Applying the
        # same guard to both branches closes it.
        if lines[j].lstrip().startswith(_CONTROL_START):
            break
        m = _BARE_DECL_RE.match(lines[j])
        if m:
            decls.append(f"{m.group(1)}{m.group(2)}{m.group(3)};\n")
            j += 1
            continue
        m = _INIT_DECL_RE.match(lines[j])
        if m:
            decls.append(f"{m.group(1)}{m.group(2)}{m.group(3)};\n")
            inits.append(f"{m.group(1)}{m.group(3)} = {m.group(4)};\n")
            j += 1
            continue
        break
    return decls, inits, j


def find_function_body_start(lines: list[str], func: str) -> int | None:
    """Index of the first line AFTER the function's opening `{`, or None
    if `func`'s definition isn't found."""
    def_re = re.compile(r"^\w[\w \*]*\b" + re.escape(func) + r"\s*\(")
    for i, ln in enumerate(lines):
        if def_re.match(ln):
            j = i
            while "{" not in lines[j]:
                j += 1
            return j + 1
    return None


def run_sweep(
    c_path: Path, region: str, func: str, *, max_perms: int = 400,
) -> list[tuple[float, int, tuple[int, ...]]]:
    """Try every (capped) leading-declaration permutation, compiling and
    comparing each via fastmatch.match_one. Restores c_path's original
    content when done, regardless of outcome -- never leaves the tree in
    a half-permuted state. Returns [(match_percent, diff_count, perm)],
    best first."""
    original_text = c_path.read_text(encoding="utf-8")
    lines = original_text.splitlines(keepends=True)

    body_start = find_function_body_start(lines, func)
    if body_start is None:
        raise ValueError(f"no definition of {func!r} found in {c_path}")

    decls, inits, tail_start = find_leading_decls(lines, body_start)
    if len(decls) < 2:
        raise ValueError(f"fewer than 2 leading declarations in {func!r} -- nothing to permute")

    head = "".join(lines[:body_start])
    tail = "".join(inits) + "".join(lines[tail_start:])

    perms = list(itertools.permutations(range(len(decls))))
    if len(perms) > max_perms:
        print(f"{len(perms)} permutations, capping at {max_perms}", file=sys.stderr)
        perms = perms[:max_perms]

    results: list[tuple[float, int, tuple[int, ...]]] = []
    try:
        for p in perms:
            c_path.write_text(head + "".join(decls[k] for k in p) + tail, encoding="utf-8")
            outcome = fastmatch.match_one(c_path, region, func=func)
            if outcome["status"] != "ok":
                continue
            fn_results = [f for f in outcome.get("functions", []) if f["name"] == func]
            if not fn_results or fn_results[0]["status"] != "ok":
                continue
            fr = fn_results[0]
            results.append((fr["match_percent"], fr["diff_count"], p))
    finally:
        c_path.write_text(original_text, encoding="utf-8")

    results.sort(key=lambda r: (-r[0], r[1]))
    return results


def render_decl_order(decls: list[str], perm: tuple[int, ...]) -> str:
    return " ".join(decls[k].strip() for k in perm)


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("region", choices=("eur", "usa", "jpn"))
    ap.add_argument("c_path", type=Path)
    ap.add_argument("func", help="function name to permute within c_path")
    ap.add_argument("--max", type=int, default=400, help="cap on permutations tried")
    args = ap.parse_args(argv)

    c_path = args.c_path if args.c_path.is_absolute() else ROOT / args.c_path
    if not c_path.is_file():
        print(f"error: {c_path} not found", file=sys.stderr)
        return 2

    original_text = c_path.read_text(encoding="utf-8")
    lines = original_text.splitlines(keepends=True)
    body_start = find_function_body_start(lines, args.func)
    if body_start is None:
        print(f"error: no definition of {args.func} found in {c_path}", file=sys.stderr)
        return 2
    decls, _inits, _tail_start = find_leading_decls(lines, body_start)
    if len(decls) < 2:
        print(f"error: fewer than 2 leading declarations in {args.func} -- nothing to permute",
              file=sys.stderr)
        return 2

    try:
        results = run_sweep(c_path, args.region, args.func, max_perms=args.max)
    except ValueError as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 2

    if not results:
        print("no permutation compiled cleanly", file=sys.stderr)
        return 1

    for pct, diffs, p in results[:5]:
        print(f"{pct:6.2f}%  {diffs:3d} diff(s)  ->  {render_decl_order(decls, p)}")

    if results[0][0] >= 100.0:
        best_p = results[0][2]
        body_start2 = find_function_body_start(lines, args.func)
        decls2, inits2, tail_start2 = find_leading_decls(lines, body_start2)
        head = "".join(lines[:body_start2])
        tail = "".join(inits2) + "".join(lines[tail_start2:])
        match_path = c_path.with_name(c_path.name + ".MATCH")
        match_path.write_text(
            head + "".join(decls2[k] for k in best_p) + tail, encoding="utf-8"
        )
        print(f"MATCH written to {match_path}")
        return 0

    return 1


if __name__ == "__main__":
    sys.exit(main())
