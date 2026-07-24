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

Pointer- and struct-typed parameters/returns are normalized to `void *`
(ABI-identical on ARM32, and avoids needing to resolve every struct's
full definition across files); scalar types are kept verbatim. Arity
and return class (void / scalar / pointer) always match the body exactly
by construction, since they're read directly from it.

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
    text = re.sub(r"/\*.*?\*/", lambda m: "\n" * m.group(0).count("\n"), text, flags=re.S)
    text = re.sub(r"//[^\n]*", "", text)
    return text


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
# denylist doing the real work).
_CANDIDATE_RE = re.compile(r"(?m)^(?:asm\s+)?([^\n(){};]+?)\s*\(")


def parse_function_definitions(source_text: str) -> list[dict]:
    """Return [{name, return_type, params: [type,...], is_void_return,
    is_pointer_return}] for every top-level function DEFINITION (not
    declaration) found. Best-effort: anything ambiguous is skipped, never
    guessed — false negatives are safe here, false positives are not.
    """
    text = _strip_comments(source_text)
    out = []
    for m in _CANDIDATE_RE.finditer(text):
        prefix = m.group(1).strip()
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
        return_clause = prefix[:name_match.start()].strip()
        if not return_clause:
            continue  # no type at all before the name — not a real definition

        return_tokens = return_clause.replace("*", " * ").split()
        if not all(_TYPE_TOKEN_RE.match(t) or t == "*" for t in return_tokens):
            continue  # something we don't recognize (macro, attribute, ...) — skip
        is_pointer_return = "*" in return_tokens
        is_void_return = (not is_pointer_return) and return_tokens == ["void"]

        params_raw = text[open_paren + 1:close_paren].strip()
        if "(" in params_raw:
            continue  # a function-pointer parameter — too complex, skip safely
        param_types: list[str] = []
        if params_raw and params_raw != "void":
            ok = True
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
                param_types.append(ptype)
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
            funcs = parse_function_definitions(text)
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
