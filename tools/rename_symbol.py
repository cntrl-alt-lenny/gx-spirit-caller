#!/usr/bin/env python3

"""
rename_symbol.py — rename one symbol across the dsd config.

Every time the decomper matches a function, the placeholder name
(`func_020abcde`) gets promoted to a real name (e.g. `Duel_DrawCard`).
That means editing a line in exactly one `config/<ver>/**/symbols.txt`
file — easy to miss, easy to edit the wrong overlay's file by accident,
easy to clobber an existing symbol. This tool automates the edit with
safety checks so you can't silently corrupt the config.

Usage:
    python tools/rename_symbol.py <old_name> <new_name>
    python tools/rename_symbol.py <old_name> <new_name> --version eur
    python tools/rename_symbol.py <old_name> <new_name> --dry

Safety checks:
  - <old_name> must exist in exactly ONE symbols.txt under config/.
    If it's not found or ambiguous, the tool refuses to edit anything.
  - <new_name> must not already be used by any other symbol anywhere
    in config/ (collisions would break the linker / objdiff).
  - <new_name> must be a valid C identifier
    (`[A-Za-z_][A-Za-z0-9_]*`).

What this tool does NOT touch:
  - relocs.txt / delinks.txt — they reference addresses, not names;
    no rewrite needed.
  - src/*.c — if you wrote a function definition using the old name,
    update the .c file yourself. A future follow-up could grep-and-
    rewrite src/ too, but that's out of scope here.

Exit codes:
    0 - renamed (or --dry would have renamed)
    1 - validation error (bad identifier, collision)
    2 - <old_name> not found, or ambiguous across files
"""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CONFIG = ROOT / "config"

# mwldarm/mwccarm accept the full C identifier set; `.` also appears
# inside some dsd-synthetic names (e.g. `.L_02021008`), so we permit
# that as a leading character too — but the linker treats it as a local
# label, so renaming *into* `.L_*` makes no sense. Keep new_name strict.
IDENT_RE = re.compile(r"^[A-Za-z_][A-Za-z0-9_]*$")


def find_symbol(name: str, version_filter: str | None) -> list[tuple[Path, int]]:
    """Return (symbols_file, line_number) for every non-comment line
    in config/**/symbols.txt whose first whitespace-separated token is
    exactly `name`. Line numbers are 1-indexed."""
    scope = CONFIG / version_filter if version_filter else CONFIG
    if not scope.is_dir():
        return []
    hits: list[tuple[Path, int]] = []
    for symbols_file in scope.rglob("symbols.txt"):
        with symbols_file.open() as f:
            for line_no, line in enumerate(f, start=1):
                stripped = line.strip()
                if not stripped or stripped.startswith("#"):
                    continue
                first_token = stripped.split(None, 1)[0]
                if first_token == name:
                    hits.append((symbols_file, line_no))
    return hits


def rewrite_first_token(path: Path, line_no: int, old: str, new: str) -> None:
    """Replace the first token of line `line_no` (1-indexed) in `path`
    with `new`. Asserts the first token is `old`; everything after the
    first token is preserved verbatim."""
    content = path.read_text()
    lines = content.splitlines(keepends=True)
    target = lines[line_no - 1]
    lead_len = len(target) - len(target.lstrip())
    leading = target[:lead_len]
    after_old = target[lead_len + len(old):]
    assert target[lead_len:lead_len + len(old)] == old, (
        f"token mismatch at {path}:{line_no} "
        f"(expected {old!r} as first token)"
    )
    lines[line_no - 1] = leading + new + after_old
    path.write_text("".join(lines))


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Rename one symbol in dsd's config/**/symbols.txt"
    )
    ap.add_argument("old_name", help="Current symbol name, e.g. func_020abcde")
    ap.add_argument("new_name", help="Target symbol name, e.g. Duel_DrawCard")
    ap.add_argument(
        "--version",
        help="Limit search to config/<version>/ (e.g. eur)",
    )
    ap.add_argument(
        "--dry",
        action="store_true",
        help="Show the planned edit without writing",
    )
    args = ap.parse_args()

    if not IDENT_RE.match(args.new_name):
        print(
            f"ERROR: new name '{args.new_name}' is not a valid C identifier.",
            file=sys.stderr,
        )
        print(
            "  Must match [A-Za-z_][A-Za-z0-9_]*  (no dots, dashes, or "
            "leading digit).",
            file=sys.stderr,
        )
        return 1

    old_hits = find_symbol(args.old_name, args.version)
    if len(old_hits) == 0:
        scope = f"config/{args.version}/" if args.version else "config/"
        print(
            f"ERROR: symbol '{args.old_name}' not found under {scope}",
            file=sys.stderr,
        )
        return 2
    if len(old_hits) > 1:
        print(
            f"ERROR: symbol '{args.old_name}' found in multiple files:",
            file=sys.stderr,
        )
        for path, line in old_hits:
            print(f"  {path.relative_to(ROOT)}:{line}", file=sys.stderr)
        print(
            "  Narrow with --version, or edit the intended file by hand.",
            file=sys.stderr,
        )
        return 2

    new_hits = find_symbol(args.new_name, args.version)
    if new_hits:
        print(
            f"ERROR: target name '{args.new_name}' already in use:",
            file=sys.stderr,
        )
        for path, line in new_hits:
            print(f"  {path.relative_to(ROOT)}:{line}", file=sys.stderr)
        print(
            "  Symbol names must be globally unique. Pick another.",
            file=sys.stderr,
        )
        return 1

    path, line_no = old_hits[0]
    rel = path.relative_to(ROOT)

    if args.dry:
        print(
            f"[dry] would rename '{args.old_name}' -> '{args.new_name}' "
            f"in {rel}:{line_no}"
        )
        return 0

    rewrite_first_token(path, line_no, args.old_name, args.new_name)
    print(f"Renamed '{args.old_name}' -> '{args.new_name}' in {rel}:{line_no}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
