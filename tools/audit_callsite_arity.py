#!/usr/bin/env python3
"""audit_callsite_arity.py -- cross-check declared arity against real CALL SITES.

Ported from khdays-decomp's `tools/audit_callsite_arity.py`
(https://github.com/Yokimitsuro/khdays-decomp, CC0-1.0 -- see
docs/research/data/khdays-callsite-arity-report-2026-07-25.md for the
full attribution note this project's q-khdays-toolkit item recorded).
Core parsing (`split_args`, `call_sites`, the KEYWORDS denylist) is
kept close to verbatim -- it's project-agnostic C-text analysis. The
consensus-source and audit-target are re-pointed at THIS project's own
conventions:

  - khdays walks `src/**/nonmatching/*.c` (parked) vs everything else
    (matched) to build its consensus, using its own directory-based
    park/match split. This project has no such directory convention --
    "matched" here means a delinks.txt TU marked `complete`, exactly
    `gen_prototypes.py`'s own `collect_evidence_backed_signatures()`
    convention, reused here for consistency.
  - khdays flags PARKED FILES whose own call sites contradict the
    consensus. This project's actual blocker (q-prototypes-golive-fix)
    is DECLARED prototypes, not parked files -- so this port audits
    `docs/research/data/prototypes-provenance.json` (gen_prototypes.py's
    own evidence-only bank) against the same call-site consensus,
    directly answering "does this project's canonical prototype bank
    ever claim an arity that no real call site uses?"

WHY THIS MATTERS (from khdays' own docstring, the exact failure class
this project's own #1327/q-prototypes-golive-fix hit independently):
an `asm`-bodied function's own C-visible parameter list is not
trustworthy evidence of its real arity -- the real arguments just land
in whatever registers the ABI convention puts them, invisible to a
parser reading the written signature. Call sites are the ONLY
evidence for what a caller actually passes, independent of what the
callee's own (possibly wrong) declaration claims.

Usage:
    python tools/audit_callsite_arity.py             # contradictions in prototypes.h
    python tools/audit_callsite_arity.py --all       # print the full consensus per callee
    python tools/audit_callsite_arity.py --json       # machine-readable contradictions
"""
from __future__ import annotations

import argparse
import json
import re
import sys
from collections import defaultdict
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from parsers import parse_delinks_file  # noqa: E402

ROOT = Path(__file__).resolve().parent.parent
CONFIG_DIR = ROOT / "config" / "eur" / "arm9"
PROVENANCE_JSON = ROOT / "docs" / "research" / "data" / "prototypes-provenance.json"

# Region ports re-derive identical or near-identical call sites from the
# same EUR source -- counting them would just double (triple) every
# consensus entry without adding real evidence. Same exclusion
# gen_prototypes.py already applies to its own evidence collection.
_REGION_PORT_PREFIXES = ("src/usa/", "src/jpn/")

# A function's own confidence threshold before a missing arity counts as
# a real contradiction rather than sparse-data noise -- khdays' own
# value, kept as-is (their brief-cited incident needed 3+ consensus
# sites before trusting "the tree never does this").
_MIN_CONFIDENT_SITES = 3

IDENT = re.compile(r"\b([A-Za-z_]\w*)\s*\(")
# Things that take parens but are not calls.
KEYWORDS = {
    "if", "for", "while", "switch", "return", "sizeof", "do", "else",
    "int", "char", "short", "long", "unsigned", "signed", "void", "struct",
    "union", "enum", "const", "volatile", "static", "extern", "typedef",
    "float", "double", "register", "inline", "defined",
}


def split_args(s: str) -> list[str]:
    """Split a balanced argument string on top-level commas."""
    if not s.strip():
        return []
    out: list[str] = []
    depth = 0
    cur = ""
    for ch in s:
        if ch in "([{":
            depth += 1
        elif ch in ")]}":
            depth -= 1
        if ch == "," and depth == 0:
            out.append(cur)
            cur = ""
        else:
            cur += ch
    out.append(cur)
    return [a.strip() for a in out]


def call_sites(text: str):
    """Yield (callee, argcount) for every call in the file, skipping declarations."""
    # Strip comments and strings so their contents never parse as calls.
    text = re.sub(r"/\*.*?\*/", " ", text, flags=re.S)
    text = re.sub(r"//[^\n]*", " ", text)
    text = re.sub(r'"(\\.|[^"\\])*"', '""', text)
    for m in IDENT.finditer(text):
        name = m.group(1)
        if name in KEYWORDS:
            continue
        # Balanced scan for the closing paren.
        i = m.end() - 1
        depth = 0
        j = i
        while j < len(text):
            if text[j] == "(":
                depth += 1
            elif text[j] == ")":
                depth -= 1
                if depth == 0:
                    break
            j += 1
        if j >= len(text):
            continue
        inner = text[i + 1:j]
        # A declaration/definition, not a call.
        before = text[max(0, m.start() - 90):m.start()]
        if "extern" in before or "typedef" in before:
            continue
        after = text[j + 1:j + 3]
        if after.strip()[:1] == "{":  # function definition
            continue
        args = split_args(inner)
        yield name, len(args)


def build_consensus() -> dict[str, dict[int, int]]:
    """{callee: {argcount: site_count}} from every call site in every
    matched (delinks-`complete`) .c/.cpp TU. EUR baseline only."""
    consensus: dict[str, dict[int, int]] = defaultdict(lambda: defaultdict(int))
    for delinks in sorted(CONFIG_DIR.rglob("delinks.txt")):
        _sections, tus = parse_delinks_file(delinks)
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
                text = path.read_text(encoding="utf-8", errors="replace")
            except OSError:
                continue
            for name, n in call_sites(text):
                consensus[name][n] += 1
    return consensus


def load_declared_arities() -> dict[str, int]:
    """{name: declared_param_count} from gen_prototypes.py's own
    evidence-only provenance table (the canonical bank's source of
    truth) -- reading the committed JSON directly rather than
    re-parsing the generated header, since the JSON already carries
    exactly params/return_type/source with no rendering to undo."""
    if not PROVENANCE_JSON.is_file():
        return {}
    data = json.loads(PROVENANCE_JSON.read_text(encoding="utf-8"))
    return {name: len(entry.get("params", [])) for name, entry in data.items()}


def audit(consensus: dict[str, dict[int, int]], declared: dict[str, int]) -> list[dict]:
    """[{name, declared, tree_uses, site_count}] for every declared
    function whose bank arity the call-site tree, at >= _MIN_CONFIDENT_SITES
    confidence, never actually uses."""
    contradictions = []
    for name, decl_n in sorted(declared.items()):
        seen = consensus.get(name)
        if not seen:
            continue
        total = sum(seen.values())
        if total >= _MIN_CONFIDENT_SITES and decl_n not in seen:
            contradictions.append({
                "name": name,
                "declared": decl_n,
                "tree_uses": sorted(seen),
                "site_count": total,
            })
    return contradictions


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--all", action="store_true", help="print the full call-site consensus per callee")
    ap.add_argument("--json", action="store_true", help="machine-readable contradictions only")
    args = ap.parse_args(argv)

    consensus = build_consensus()

    if args.all:
        for name in sorted(consensus):
            print("%-34s %s" % (name, dict(consensus[name])))
        return 0

    declared = load_declared_arities()
    contradictions = audit(consensus, declared)

    if args.json:
        print(json.dumps(contradictions, indent=2))
        return 0

    for c in contradictions:
        print("!! %s: bank declares %d arg(s), tree call sites use %s (%d confident sites)"
              % (c["name"], c["declared"], c["tree_uses"], c["site_count"]))
    print("\n%d declared prototype(s) audited, %d with a CALL-SITE arity contradiction"
          % (len(declared), len(contradictions)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
