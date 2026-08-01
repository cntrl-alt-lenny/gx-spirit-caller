#!/usr/bin/env python3

"""
gen_prototypes.py — evidence-only canonical prototype bank generator.

PR #1327's 2047-line bank was reverted: adversarial review found 59/102
sampled conflicts had a prototype that CONTRADICTED its own matched C
body (33 arity mismatches, 26 return-type mismatches), because it derived
signatures by majority-vote over scattered `extern` declarations instead
of reading the one source of truth — the matched body's own definition
line.

This tool does the opposite by construction: for every `.c`/`.cpp`
translation unit that `delinks.txt` marks `complete`, it parses that
file's own top-level function DEFINITIONS (never `extern` declarations)
and emits one `extern` prototype per function, with a provenance record
pointing straight back to the file it was read from. A function with no
matched body, or whose definition this parser can't confidently parse,
is silently skipped — never guessed.

Pointer-typed parameters/returns (including pointer-to-struct) are
normalized to `void *` (ABI-identical on ARM32 regardless of pointee,
and avoids needing to resolve every struct's full definition across
files); scalar types are kept verbatim. A BY-VALUE struct/union param
or return can't be normalized the same way -- its ABI depends on the
aggregate's actual size, not just "is it a pointer" -- so a function
using one is excluded entirely, same as an `asm`-bodied definition
(whose written parameter list isn't trustworthy arity evidence at all;
see parse_function_definitions). Arity and return class (void / scalar
/ pointer) always match the body exactly by construction for every
prototype that IS emitted, since they're read directly from it.

Usage:
    python tools/gen_prototypes.py --write
    python tools/gen_prototypes.py --json   # inspect without writing
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from parsers import parse_delinks_file  # noqa: E402
try:
    from tools.progress import _strip_c_comments_and_literals  # noqa: E402
except ModuleNotFoundError:  # direct ``python tools/gen_prototypes.py`` entry
    from progress import _strip_c_comments_and_literals  # noqa: E402

ROOT = Path(__file__).resolve().parent.parent
CONFIG_DIR = ROOT / "config" / "eur" / "arm9"
PROTOTYPES_H = ROOT / "include" / "game" / "prototypes.h"
PROVENANCE_JSON = ROOT / "docs" / "research" / "data" / "prototypes-provenance.json"

# Only look at the EUR baseline tree — src/usa|jpn/** are region ports of
# the same functions and would just re-derive identical or near-identical
# signatures; one canonical source avoids double-counting.
_REGION_PORT_PREFIXES = ("src/usa/", "src/jpn/")

_CONTROL_KEYWORDS = {
    "if", "while", "for", "switch", "return", "sizeof", "do", "else",
}

# Tokens that may legally appear in a return-type clause. `asm` is mwcc's
# own qualifier for a hand-written-instruction function body; it's stripped
# before the type is recorded since it's not part of the callable signature.
_TYPE_TOKEN_RE = re.compile(
    r"^(?:static|const|volatile|extern|unsigned|signed|struct|union|enum|"
    r"long|short|void|char|int|float|double|u8|u16|u32|u64|s8|s16|s32|s64|"
    r"[A-Za-z_]\w*)$"
)


def _strip_comments(text: str) -> str:
    """Blank comments and literals while preserving source positions."""
    return _strip_c_comments_and_literals(text)


def _find_matching_paren(text: str, open_pos: int) -> int | None:
    """Return the index of the `)` matching the `(` at open_pos, or None."""
    depth = 0
    for i in range(open_pos, len(text)):
        if text[i] == "(":
            depth += 1
        elif text[i] == ")":
            depth -= 1
            if depth == 0:
                return i
    return None


# Candidate signature start: column 0 (never indented — every top-level
# function definition in this codebase starts at column 0; nested control
# structures never do, so this alone rules them out without a keyword
# denylist doing the real work). The `asm` qualifier is captured in its
# own group (not discarded) — see the is_asm check below.
_CANDIDATE_RE = re.compile(r"(?m)^(?P<asm>asm\s+)?(?P<prefix>[^\n(){};]+?)\s*\(")

_AGGREGATE_TOKENS = {"struct", "union"}


def _is_byvalue_aggregate(type_clause: str) -> bool:
    """True if `type_clause` (already confirmed non-pointer) names a
    struct/union passed or returned BY VALUE.

    Unlike a pointer (always 4 bytes on ARM32, safely normalizable to
    `void *` regardless of what it points to), a by-value struct/union's
    ABI depends on its actual SIZE — how many registers/stack bytes the
    calling convention uses. There is no type-erased spelling that stays
    ABI-correct, the way `void *` does for pointers, so a function using
    one can't be banked without either duplicating that struct's real
    (often TU-local) definition into the shared header, or silently
    getting the calling convention wrong. Exclude rather than guess.
    """
    toks = type_clause.split()
    return bool(toks) and toks[0] in _AGGREGATE_TOKENS


# Two shapes of file-local `typedef`: a function-pointer alias (name
# inside `(*NAME)`) and a plain alias (name is the last identifier
# before `;`). The `[^;{]*?` middle deliberately excludes `{`, so a
# `typedef struct {...} Name;` (a real, evidenced anonymous-struct-with-
# tag pattern used elsewhere in this codebase) does NOT match either --
# a false negative there is safe (worst case: not detected as local,
# same as before this check existed), whereas a false positive would
# wrongly exclude a legitimate global type.
_TYPEDEF_FUNCPTR_NAME_RE = re.compile(r"typedef\b[^;{]*?\(\s*\*\s*([A-Za-z_]\w*)\s*\)\s*\([^;]*\)\s*;")
_TYPEDEF_SIMPLE_NAME_RE = re.compile(r"typedef\b[^;{]*?\b([A-Za-z_]\w*)\s*;")


def _file_local_typedef_names(text: str) -> set[str]:
    """Names this FILE's own `typedef`s introduce -- invisible outside
    the TU that declares them, so a param/return type using one can't
    be banked into a shared header (see func_02032074's real bug: its
    matched body spells a callback param `alloc_02032074_t`, a typedef
    for `void *(*)(int, int)` declared 3 lines above the function --
    the plain `if "(" in params_raw` function-pointer-parameter check
    doesn't catch this shape, since by the time it's used as a
    parameter type the `(` is hidden behind the typedef name).
    """
    names = {m.group(1) for m in _TYPEDEF_FUNCPTR_NAME_RE.finditer(text)}
    names |= {m.group(1) for m in _TYPEDEF_SIMPLE_NAME_RE.finditer(text)}
    return names


def parse_function_definitions(source_text: str, skipped: dict[str, list[str]] | None = None) -> list[dict]:
    """Return [{name, return_type, params: [type,...], is_void_return,
    is_pointer_return}] for every top-level function DEFINITION (not
    declaration) found. Best-effort: anything ambiguous is skipped, never
    guessed — false negatives are safe here, false positives are not.

    Three classes are skipped unconditionally, regardless of how cleanly
    they'd otherwise parse: `asm`-qualified definitions (their body is
    raw instructions with no C-visible parameter list, so a `(void)` or
    `(int)` written there is not trustworthy evidence of the REAL arity
    — the callee's register usage can reference arguments the written
    signature never mentions; q-prototypes-golive-fix found these banked
    with a wrong arity); any function whose return type or ANY parameter
    is a by-value struct/union (see _is_byvalue_aggregate); and any
    function whose return type or a non-pointer parameter names a
    `typedef` this SAME FILE introduces (see _file_local_typedef_names)
    — invisible outside the TU, so unbankable the same way a by-value
    TU-local struct is, most commonly a function-pointer alias hiding
    the exact "too complex, skip safely" shape the raw-`(` check below
    already handles for an UN-aliased function-pointer parameter.

    `skipped`, if given, gets `"asm"`, `"byvalue_struct"`, and
    `"local_typedef"` keys appended with the excluded function names,
    for a caller that wants to report exactly what was excluded and why
    (not just a count).
    """
    text = _strip_comments(source_text)
    local_typedefs = _file_local_typedef_names(text)
    out = []
    for m in _CANDIDATE_RE.finditer(text):
        is_asm = m.group("asm") is not None
        prefix = m.group("prefix").strip()
        open_paren = m.end() - 1
        close_paren = _find_matching_paren(text, open_paren)
        if close_paren is None:
            continue
        after = text[close_paren + 1:close_paren + 40]
        after_stripped = after.lstrip()
        if not after_stripped.startswith("{"):
            continue  # declaration (`;`) or something else, not a definition

        # Split "TYPE... NAME" into the trailing identifier (name) and
        # everything before it (the return-type clause).
        name_match = re.search(r"([A-Za-z_]\w*)\s*$", prefix)
        if not name_match:
            continue
        name = name_match.group(1)
        if name in _CONTROL_KEYWORDS:
            continue

        if is_asm:
            if skipped is not None:
                skipped.setdefault("asm", []).append(name)
            continue

        return_clause = prefix[:name_match.start()].strip()
        if not return_clause:
            continue  # no type at all before the name — not a real definition

        return_tokens = return_clause.replace("*", " * ").split()
        if not all(_TYPE_TOKEN_RE.match(t) or t == "*" for t in return_tokens):
            continue  # something we don't recognize (macro, attribute, ...) — skip
        is_pointer_return = "*" in return_tokens
        is_void_return = (not is_pointer_return) and return_tokens == ["void"]
        if not is_pointer_return:
            if _is_byvalue_aggregate(return_clause):
                if skipped is not None:
                    skipped.setdefault("byvalue_struct", []).append(name)
                continue
            if local_typedefs.intersection(return_tokens):
                if skipped is not None:
                    skipped.setdefault("local_typedef", []).append(name)
                continue

        params_raw = text[open_paren + 1:close_paren].strip()
        if "(" in params_raw:
            continue  # a function-pointer parameter — too complex, skip safely
        param_types: list[str] = []
        if params_raw and params_raw != "void":
            ok = True
            unbankable_reason: str | None = None
            for part in params_raw.split(","):
                part = part.strip()
                if not part:
                    ok = False
                    break
                is_ptr = "*" in part
                if is_ptr:
                    param_types.append("void *")
                    continue
                # Drop a trailing parameter name, keep the type: last
                # identifier token is the name, everything before is type.
                pm = re.search(r"([A-Za-z_]\w*)\s*$", part)
                if not pm:
                    ok = False
                    break
                ptype = part[:pm.start()].strip()
                if not ptype:
                    # A bare identifier with no type at all (K&R-style or
                    # something we don't understand) — skip this function.
                    ok = False
                    break
                ptoks = ptype.split()
                if not all(_TYPE_TOKEN_RE.match(t) for t in ptoks):
                    ok = False
                    break
                if _is_byvalue_aggregate(ptype):
                    unbankable_reason = "byvalue_struct"
                    break
                if local_typedefs.intersection(ptoks):
                    unbankable_reason = "local_typedef"
                    break
                param_types.append(ptype)
            if unbankable_reason is not None:
                if skipped is not None:
                    skipped.setdefault(unbankable_reason, []).append(name)
                continue
            if not ok:
                continue

        out.append({
            "name": name,
            "return_type": "void *" if is_pointer_return else return_clause,
            "is_void_return": is_void_return,
            "params": param_types,
        })
    return out


def collect_evidence_backed_signatures() -> dict[str, dict]:
    """{func_name: {source, return_type, is_void_return, params}} for every
    matched (delinks-`complete`) .c/.cpp TU's own function definitions.
    """
    signatures: dict[str, dict] = {}
    skipped_ambiguous = 0
    skipped: dict[str, list[str]] = {}
    for delinks in sorted(CONFIG_DIR.rglob("delinks.txt")):
        _, tus = parse_delinks_file(delinks)
        for tu in tus:
            src = tu.get("source", "")
            if tu.get("status") != "complete":
                continue
            if not (src.endswith(".c") or src.endswith(".cpp")):
                continue
            if src.startswith(_REGION_PORT_PREFIXES):
                continue
            path = ROOT / Path(src)
            try:
                text = path.read_text(encoding="utf-8")
            except OSError:
                continue
            funcs = parse_function_definitions(text, skipped=skipped)
            for fn in funcs:
                name = fn["name"]
                if name in signatures and signatures[name]["source"] != src:
                    # Same function name defined identically in two
                    # matched TUs would be a real ODR violation the build
                    # itself would already reject; if we see two DIFFERENT
                    # signatures for the same name, that's ambiguous —
                    # skip rather than pick one.
                    if signatures[name] != {**fn, "source": signatures[name]["source"]}:
                        skipped_ambiguous += 1
                    del signatures[name]
                    continue
                signatures[name] = {**fn, "source": src}
    if skipped_ambiguous:
        print(f"note: skipped {skipped_ambiguous} function name(s) with "
              f"conflicting signatures across TUs", file=sys.stderr)
    _skip_labels = {
        "asm": "asm-bodied (untrustworthy arity)",
        "byvalue_struct": "by-value struct/union param or return",
        "local_typedef": "param/return names a file-local typedef",
    }
    for reason, names in sorted(skipped.items()):
        label = _skip_labels.get(reason, reason)
        print(f"note: excluded {len(names)} function(s) [{label}]: "
              f"{', '.join(sorted(names))}", file=sys.stderr)
    return signatures


def render_prototype(name: str, sig: dict) -> str:
    if sig["params"]:
        params = ", ".join(sig["params"])
    else:
        params = "void"
    ret = "void" if sig["is_void_return"] else sig["return_type"]
    return f"extern {ret} {name}({params});"


def render_header(signatures: dict[str, dict]) -> str:
    lines = [
        "/* game/prototypes.h -- evidence-only canonical prototype bank.",
        " *",
        " * Generated by tools/gen_prototypes.py. Every declaration here is",
        " * derived directly from a MATCHED C function's own definition line",
        " * (never from a majority vote over scattered `extern`s, never",
        " * guessed for an unmatched function) -- see",
        " * docs/research/data/prototypes-provenance.json for the exact",
        " * source file each signature was read from, and",
        " * tools/check_prototypes_provenance.py to re-verify any entry.",
        " *",
        " * Do not hand-edit: rerun the generator instead, so provenance",
        " * stays accurate. Byte-neutral -- nothing #includes this yet.",
        " *",
        " * STRUCTURAL CONSTRAINT (verified, not yet hit because nothing",
        " * includes this header today): every pointer/struct-pointer",
        " * parameter and return here is normalized to `void *`, which is",
        " * ABI-safe for a CALLER but WRONG for the function's own",
        " * DEFINITION -- a TU that defines one of these functions with",
        " * its real (non-void*) parameter/return types would see this",
        " * header's `extern void *`-typed declaration first and get a",
        " * conflicting-types redefinition error. This header is safe to",
        " * include from caller-only TUs; NEVER from a TU that also",
        " * defines one of the functions declared below.",
        " */",
        "#ifndef GAME_PROTOTYPES_H_",
        "#define GAME_PROTOTYPES_H_",
        "",
        '#include "types.h"',
        "",
    ]
    for name in sorted(signatures):
        lines.append(render_prototype(name, signatures[name]))
    lines.append("")
    lines.append("#endif /* GAME_PROTOTYPES_H_ */")
    return "\n".join(lines) + "\n"


def render_provenance(signatures: dict[str, dict]) -> str:
    table = {
        name: {
            "source": sig["source"],
            "return_type": "void" if sig["is_void_return"] else sig["return_type"],
            "params": sig["params"],
        }
        for name, sig in sorted(signatures.items())
    }
    return json.dumps(table, indent=2, sort_keys=True) + "\n"


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--write", action="store_true",
                     help="Write include/game/prototypes.h and the provenance table")
    ap.add_argument("--json", action="store_true",
                     help="Print the collected signatures as JSON to stdout")
    args = ap.parse_args(argv)

    signatures = collect_evidence_backed_signatures()

    if args.json:
        print(render_provenance(signatures))

    if args.write:
        PROTOTYPES_H.write_text(render_header(signatures), encoding="utf-8", newline="\n")
        PROVENANCE_JSON.parent.mkdir(parents=True, exist_ok=True)
        PROVENANCE_JSON.write_text(render_provenance(signatures), encoding="utf-8", newline="\n")
        print(f"wrote {len(signatures)} evidence-backed prototypes to "
              f"{PROTOTYPES_H.relative_to(ROOT)}")
        print(f"provenance: {PROVENANCE_JSON.relative_to(ROOT)}")

    if not args.write and not args.json:
        print(f"{len(signatures)} evidence-backed signatures found "
              f"(pass --write to emit, --json to inspect)")

    return 0


if __name__ == "__main__":
    sys.exit(main())
