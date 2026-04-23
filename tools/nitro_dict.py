#!/usr/bin/env python3

"""
nitro_dict.py — build + query a Nintendo DS SDK function dictionary.

Ingests a Nintendo DS SDK header tree (typically `ntrtwl/NitroSDK`'s
`include/nitro/**/*.h`) into a searchable JSON database of function
signatures. The DB is consumed by `tools/nitro_suggest_renames.py` to
propose names for unmatched functions in our config, and can also be
queried directly for lookup.

Most unmatched code in an NDS decomp is Nitro SDK glue — OS_*, GX_*,
FS_*, MI_*, SND_*, etc. Having canonical names at hand lets the
decomper shortcut the "what role does this function play?" step.

This tool does NOT touch ROM bytes, assembly, or symbols.txt. It's
pure header-parsing + queries.

Usage:

    # Build the dictionary from a NitroSDK clone.
    python tools/nitro_dict.py build \\
        --nitro-sdk /path/to/NitroSDK \\
        [--out build/analysis/nitro_dict.json]

    # Stats: per-subsystem function count.
    python tools/nitro_dict.py stats --dict build/analysis/nitro_dict.json

    # Query: find functions by name substring or arg count.
    python tools/nitro_dict.py query --dict <path> --name-contains VBlank
    python tools/nitro_dict.py query --dict <path> --subsystem OS --argcount 0
    python tools/nitro_dict.py query --dict <path> --return-type void \\
        --argcount 1

Output schema (build):

    {
      "version":      1,
      "source":       "/abs/path/to/NitroSDK",
      "generated_at": "2026-04-22T...",
      "functions": [
        {
          "name":        "OS_WaitVBlankIntr",
          "return_type": "void",
          "args":        [],
          "arg_count":   0,
          "subsystem":   "OS",
          "header":      "include/nitro/os/emulator.h"
        },
        ...
      ]
    }

The dictionary is version-tagged (schema v1); downstream consumers
should check `version` before parsing.
"""

from __future__ import annotations

import argparse
import datetime as dt
import json
import re
import sys
from dataclasses import asdict, dataclass, field
from pathlib import Path


SCHEMA_VERSION = 1

# Subsystem prefix derived from the function name. NitroSDK uses all-
# caps prefix before the underscore: `OS_Foo`, `GX_LoadBG0`, etc.
# Functions that don't match this pattern (lowercase libc, `_sprintf`,
# etc.) get a subsystem of "misc".
_SUBSYSTEM_RE = re.compile(r"^([A-Z0-9]{1,6})_[A-Z]")

# Matches what we treat as a "function declaration" after comment
# stripping and line-joining. Extremely permissive on the return type
# (any run of identifiers / pointers) so we don't miss SDK typedefs
# like `FSFile *`, `GXRgb *`, etc.
#
# Captures:
#   return_type — everything up to the function name (identifier +
#                 qualifiers, no trailing `*` — the stars move into
#                 the `pointers` group so we don't confuse them with
#                 the name)
#   pointers    — zero or more `*`s between the type and the name
#   name        — the function identifier
#   args_raw    — everything between the parens, ending at the last
#                 `)` before `;`. Uses `[^;]*` + trailing `\)` so
#                 function-pointer args like `void (*cb)(u32)`
#                 survive (their inner `)` no longer terminates the
#                 match prematurely).
_FUNC_DECL_RE = re.compile(
    r"(?:^|[\s;}])"
    r"(?P<return_type>"
    r"(?:(?:const|volatile|static|inline|extern|struct|union|enum)\s+)*"
    r"[A-Za-z_][A-Za-z0-9_]*"
    r"(?:\s+(?:const|volatile))*"
    r")"
    r"\s*"
    r"(?P<pointers>\**)"
    r"\s*"
    r"(?P<name>[A-Za-z_][A-Za-z0-9_]*)"
    r"\s*\("
    r"(?P<args_raw>[^;]*)"
    r"\)\s*;"
)


@dataclass
class NitroFunction:
    name: str
    return_type: str
    args: list[str] = field(default_factory=list)
    subsystem: str = "misc"
    header: str = ""

    @property
    def arg_count(self) -> int:
        # `(void)` means zero args; an empty arg list also means zero
        # (C23 allows `()` to mean "no args" but NitroSDK uses `(void)`).
        if len(self.args) == 1 and self.args[0].strip() == "void":
            return 0
        if not self.args:
            return 0
        return len(self.args)


# --------------------------------------------------------------------------- #
# Parsing
# --------------------------------------------------------------------------- #

_BLOCK_COMMENT_RE = re.compile(r"/\*.*?\*/", re.DOTALL)
_LINE_COMMENT_RE = re.compile(r"//[^\n]*")


def _strip_comments(text: str) -> str:
    """Remove C block and line comments before tokenising. Keeps
    line count roughly accurate by preserving newlines from block
    comments — the parser doesn't report lineno yet, but might."""
    # Block comments: replace with equivalent newline count so lines
    # downstream still align with the source.
    def _replace_block(m):
        return "\n" * m.group(0).count("\n")
    text = _BLOCK_COMMENT_RE.sub(_replace_block, text)
    text = _LINE_COMMENT_RE.sub("", text)
    return text


def _subsystem_for_name(name: str) -> str:
    m = _SUBSYSTEM_RE.match(name)
    if m:
        return m.group(1)
    return "misc"


def _split_args(args_raw: str) -> list[str]:
    """Split a raw arg list on commas, respecting nested parens
    (function pointers like `void (*cb)(u32)` have a comma-rich
    inner arg list)."""
    out: list[str] = []
    depth = 0
    cur: list[str] = []
    for ch in args_raw:
        if ch == "(":
            depth += 1
        elif ch == ")":
            depth -= 1
        if ch == "," and depth == 0:
            out.append("".join(cur).strip())
            cur = []
        else:
            cur.append(ch)
    tail = "".join(cur).strip()
    if tail:
        out.append(tail)
    return out


def parse_header(
    text: str, *, relative_path: str = "",
) -> list[NitroFunction]:
    """Parse a single header file's body. Returns every function
    declaration found."""
    cleaned = _strip_comments(text)

    # Remove preprocessor directive bodies but keep newline counts.
    # A trailing '\\n' in the previous line continues a directive,
    # but NitroSDK rarely uses those outside macros. We strip the
    # whole line on #-prefix.
    cleaned = "\n".join(
        "" if line.lstrip().startswith("#") else line
        for line in cleaned.splitlines()
    )

    # Collapse whitespace to make the regex happier, but preserve
    # newlines so matches inside if/else-chains don't accidentally
    # cross function boundaries.
    cleaned = re.sub(r"[ \t]+", " ", cleaned)

    # Join continuation lines inside parens so multi-line arg lists
    # match. Simple heuristic: a balanced-paren walker.
    cleaned = _join_paren_lines(cleaned)

    out: list[NitroFunction] = []
    for m in _FUNC_DECL_RE.finditer(cleaned):
        return_type = m.group("return_type").strip()
        pointers = m.group("pointers") or ""
        name = m.group("name")
        args_raw = m.group("args_raw")

        # Reconstruct the full type as the user wrote it. `GXRgb *foo()`
        # gets return_type = "GXRgb *"; `void foo()` stays "void".
        if pointers:
            full_return = f"{return_type} {pointers}".strip()
        else:
            full_return = return_type

        # Skip obvious non-declarations: a C keyword landing as the
        # "name" means we misparsed (e.g. `int while`).
        if name in _C_KEYWORDS:
            continue
        # Skip static / inline bodies — those aren't external symbols
        # that `ld` would look up in our symbols.txt.
        if _looks_static_or_inline(return_type):
            continue
        # Skip return_type that's actually a keyword alone (parser
        # picked up something like `typedef`).
        last_token = return_type.split()[-1] if return_type.split() else ""
        if last_token in _C_KEYWORDS:
            continue
        # Skip obvious macro artifacts — SDK headers sometimes emit
        # a function-shaped declaration from a macro that we can't
        # parse the return type of. Conservative filter.
        if not re.match(r"^[A-Za-z_][A-Za-z0-9_\s\*]*$", return_type):
            continue

        out.append(NitroFunction(
            name=name,
            return_type=full_return,
            args=_split_args(args_raw),
            subsystem=_subsystem_for_name(name),
            header=relative_path,
        ))
    return out


_C_KEYWORDS = {
    "if", "else", "for", "while", "do", "switch", "case", "default",
    "return", "break", "continue", "goto", "sizeof", "typedef",
    "struct", "union", "enum", "const", "volatile", "static", "extern",
    "inline", "register", "auto", "signed", "unsigned",
}


def _looks_static_or_inline(return_type: str) -> bool:
    tokens = return_type.split()
    return any(t in ("static", "inline") for t in tokens)


def _join_paren_lines(text: str) -> str:
    """Walk the text and collapse all whitespace (including newlines)
    when inside unmatched parens. Lets `FOO_Bar(a,\\n   b);` become
    `FOO_Bar(a, b);` for the regex scan."""
    out: list[str] = []
    depth = 0
    for ch in text:
        if ch == "(":
            depth += 1
            out.append(ch)
        elif ch == ")":
            depth = max(0, depth - 1)
            out.append(ch)
        elif ch.isspace() and depth > 0:
            if not out or out[-1] != " ":
                out.append(" ")
        else:
            out.append(ch)
    return "".join(out)


# --------------------------------------------------------------------------- #
# Build
# --------------------------------------------------------------------------- #

def walk_headers(sdk_root: Path) -> list[Path]:
    """Enumerate header files under `<sdk_root>/include/nitro/**/*.h`.
    Falls back to `<sdk_root>/include/**/*.h` when the `nitro` subdir
    doesn't exist (mirrors often ship as `include/` without the
    namespace subdir)."""
    include_dir = sdk_root / "include"
    if (include_dir / "nitro").is_dir():
        root = include_dir / "nitro"
    elif include_dir.is_dir():
        root = include_dir
    else:
        return []
    return sorted(p for p in root.rglob("*.h") if p.is_file())


def build_dictionary(sdk_root: Path) -> dict:
    """Produce the JSON-shaped dict payload."""
    headers = walk_headers(sdk_root)
    if not headers:
        raise FileNotFoundError(
            f"no headers found under {sdk_root}/include/. "
            "Pass --nitro-sdk pointing at a NitroSDK clone that has "
            "an include/ (or include/nitro/) directory."
        )
    functions: list[NitroFunction] = []
    seen: set[str] = set()  # name-dedup across headers
    for header in headers:
        try:
            text = header.read_text(encoding="utf-8", errors="replace")
        except OSError:
            continue
        rel = str(header.relative_to(sdk_root))
        for fn in parse_header(text, relative_path=rel):
            if fn.name in seen:
                continue
            seen.add(fn.name)
            functions.append(fn)

    functions.sort(key=lambda f: (f.subsystem, f.name))
    return {
        "version":      SCHEMA_VERSION,
        "source":       str(sdk_root.resolve()),
        "generated_at": dt.datetime.now(dt.UTC).isoformat(
            timespec="seconds",
        ),
        "functions":    [_serialise(fn) for fn in functions],
    }


def _serialise(fn: NitroFunction) -> dict:
    d = asdict(fn)
    # Drop the property; include it as a simple field.
    d["arg_count"] = fn.arg_count
    return d


# --------------------------------------------------------------------------- #
# Query
# --------------------------------------------------------------------------- #

def _load_dict(path: Path) -> dict:
    if not path.is_file():
        raise FileNotFoundError(
            f"no dict at {path}. Build one with "
            f"`tools/nitro_dict.py build --nitro-sdk <path>` first."
        )
    with path.open() as f:
        payload = json.load(f)
    if payload.get("version") != SCHEMA_VERSION:
        raise ValueError(
            f"dict schema mismatch: got {payload.get('version')}, "
            f"expected {SCHEMA_VERSION}. Rebuild the dict."
        )
    return payload


def query(
    payload: dict,
    *,
    name_contains: str | None = None,
    subsystem: str | None = None,
    argcount: int | None = None,
    return_type: str | None = None,
) -> list[dict]:
    """Filter the functions list by any combination of predicates.
    Returns the raw dict records (not NitroFunction instances) so
    downstream CLI rendering is straightforward."""
    out: list[dict] = []
    for fn in payload.get("functions", []):
        if name_contains and name_contains.lower() not in fn["name"].lower():
            continue
        if subsystem and fn.get("subsystem", "") != subsystem:
            continue
        if argcount is not None and fn.get("arg_count", 0) != argcount:
            continue
        if return_type and fn.get("return_type", "") != return_type:
            continue
        out.append(fn)
    return out


def stats(payload: dict) -> dict[str, int]:
    counts: dict[str, int] = {}
    for fn in payload.get("functions", []):
        subsys = fn.get("subsystem", "misc")
        counts[subsys] = counts.get(subsys, 0) + 1
    return dict(sorted(counts.items(), key=lambda kv: (-kv[1], kv[0])))


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def _default_dict_path() -> Path:
    return Path(__file__).resolve().parent.parent / \
        "build" / "analysis" / "nitro_dict.json"


def cmd_build(args) -> int:
    sdk = Path(args.nitro_sdk).expanduser()
    if not sdk.is_dir():
        print(f"error: {sdk} is not a directory.", file=sys.stderr)
        return 2
    try:
        payload = build_dictionary(sdk)
    except FileNotFoundError as e:
        print(f"error: {e}", file=sys.stderr)
        return 2

    out_path = Path(args.out).expanduser() if args.out else _default_dict_path()
    out_path.parent.mkdir(parents=True, exist_ok=True)
    with out_path.open("w", encoding="utf-8") as f:
        json.dump(payload, f, indent=2)

    total = len(payload["functions"])
    subsys_count = len({f["subsystem"] for f in payload["functions"]})
    print(f"Wrote {out_path} — {total} function(s) across "
          f"{subsys_count} subsystem(s).")
    return 0


def cmd_stats(args) -> int:
    dict_path = Path(args.dict).expanduser() if args.dict else _default_dict_path()
    try:
        payload = _load_dict(dict_path)
    except (FileNotFoundError, ValueError) as e:
        print(f"error: {e}", file=sys.stderr)
        return 2
    total = len(payload.get("functions", []))
    print(f"Source: {payload.get('source', '?')}")
    print(f"Generated: {payload.get('generated_at', '?')}")
    print(f"Total functions: {total}")
    print()
    print("Per-subsystem counts:")
    for subsys, count in stats(payload).items():
        print(f"  {subsys:<8s} {count:>5d}")
    return 0


def cmd_query(args) -> int:
    dict_path = Path(args.dict).expanduser() if args.dict else _default_dict_path()
    try:
        payload = _load_dict(dict_path)
    except (FileNotFoundError, ValueError) as e:
        print(f"error: {e}", file=sys.stderr)
        return 2

    matches = query(
        payload,
        name_contains=args.name_contains,
        subsystem=args.subsystem,
        argcount=args.argcount,
        return_type=args.return_type,
    )
    if not matches:
        print("(no matches)")
        return 0
    if args.json:
        json.dump(matches, sys.stdout, indent=2)
        sys.stdout.write("\n")
        return 0
    for fn in matches[:args.limit]:
        args_s = ", ".join(fn.get("args", [])) or "void"
        print(f"{fn['name']:<40s} "
              f"{fn.get('return_type', ''):<10s} "
              f"({args_s})  [{fn.get('subsystem', 'misc')}]")
        print(f"    {fn.get('header', '')}")
    if len(matches) > args.limit:
        print(f"... and {len(matches) - args.limit} more "
              "(raise --limit or add filters)")
    return 0


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Build and query a Nintendo DS SDK function dictionary.",
    )
    sub = ap.add_subparsers(dest="cmd", required=True)

    ap_build = sub.add_parser(
        "build", help="Ingest a NitroSDK header tree into a JSON dict.",
    )
    ap_build.add_argument("--nitro-sdk", required=True,
                          help="Path to a NitroSDK clone (must contain "
                               "include/ or include/nitro/)")
    ap_build.add_argument("--out",
                          help="Output path (default: "
                               "build/analysis/nitro_dict.json)")
    ap_build.set_defaults(func=cmd_build)

    ap_stats = sub.add_parser(
        "stats", help="Print per-subsystem function counts from the dict.",
    )
    ap_stats.add_argument("--dict", help="Path to the dict JSON (default: "
                                         "build/analysis/nitro_dict.json)")
    ap_stats.set_defaults(func=cmd_stats)

    ap_query = sub.add_parser(
        "query", help="Search the dict by name / signature predicates.",
    )
    ap_query.add_argument("--dict")
    ap_query.add_argument("--name-contains", metavar="SUBSTR")
    ap_query.add_argument("--subsystem", metavar="PREFIX")
    ap_query.add_argument("--argcount", type=int)
    ap_query.add_argument("--return-type")
    ap_query.add_argument("--limit", type=int, default=30)
    ap_query.add_argument("--json", action="store_true")
    ap_query.set_defaults(func=cmd_query)

    args = ap.parse_args()
    return args.func(args)


if __name__ == "__main__":
    sys.exit(main())
