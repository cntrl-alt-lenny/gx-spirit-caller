#!/usr/bin/env python3

"""
nitro_suggest_renames.py — propose NitroSDK names for unmatched functions.

Consumes:
  - `tools/nitro_dict.py`'s JSON output (function signature DB)
  - `config/<version>` (our symbols + call graph via analyze_symbols)

Produces: a Markdown report listing each tractable unmatched function
alongside candidate NitroSDK names whose signature shape is plausible.
Decomper applies renames manually via `tools/rename_symbol.py` — this
tool is a recommender, not an auto-renamer (confidence isn't high
enough yet to auto-apply, and getting a rename wrong is a footgun).

"Tractable" here means:
  - Function still uses a `func_*` / `data_*` placeholder name (so
    a rename would actually add signal)
  - Outside a `complete` TU (we don't want to suggest renames for
    things the decomper already signed off on)
  - Size ≤ 0x40 bytes AND out-degree ≤ 2 (beyond that, ABI inference
    from the call graph alone gets noisy)

Candidate ranking:
  - Filter the Nitro dict by arg-count heuristic (derived from the
    target's apparent signature based on its callees) and by
    subsystem-plausibility (if the target calls another named
    function in subsystem X, candidate should probably be from X too)
  - Score by: signature simplicity (fewer args = easier to verify),
    subsystem match (+), leaf-ness match (+)
  - Emit top-K candidates per target

This is a scaffolding / recommendation tool. Cloud can run it, the
decomper reviews the report, applies the highest-confidence renames
by hand. As renames land, re-running the tool should narrow
remaining candidates (named callees make subsystem inference tighter).

Usage:

    # Build the dict first (one-off per NitroSDK update).
    python tools/nitro_dict.py build --nitro-sdk /path/to/NitroSDK

    # Generate the suggestion report.
    python tools/nitro_suggest_renames.py --version eur \\
        [--dict build/analysis/nitro_dict.json] \\
        [--max-candidates 5] \\
        [--limit 50]
"""

from __future__ import annotations

import argparse
import json
import sys
from dataclasses import dataclass
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import (  # noqa: E402
    ROOT,
    ModuleData,
    Symbol,
    build_call_graph,
    load_all,
)
from next_targets import collect_matched_ranges, is_addr_matched  # noqa: E402


PLACEHOLDER_PREFIXES = ("func_", "data_", "_dsd_gap")


# --------------------------------------------------------------------------- #
# Target filtering
# --------------------------------------------------------------------------- #

@dataclass
class Candidate:
    target: Symbol
    out_degree: int
    named_callee_subsystems: set[str]
    # Best-effort arg-count inference: currently 0 for leaf functions
    # (no outbound calls → likely no upstream register handoff), None
    # otherwise. Conservative — we don't have register analysis here.
    inferred_argcount: int | None


def is_tractable(
    sym: Symbol,
    *,
    modules: dict[str, ModuleData],
    edges_call,
    matched: dict,
    max_size: int,
) -> bool:
    """Filter unmatched symbols down to the ones worth recommending
    names for. Too-large / too-many-callees functions have too many
    Nitro candidates and the signal/noise is poor."""
    if not sym.is_function:
        return False
    if sym.size == 0 or sym.size > max_size:
        return False
    if not sym.name.startswith(PLACEHOLDER_PREFIXES):
        return False
    if is_addr_matched(matched, sym.module, sym.addr):
        return False
    out_deg = len(edges_call.get((sym.module, sym.addr), set()))
    if out_deg > 2:
        return False
    return True


def callee_subsystems(
    sym: Symbol,
    modules: dict[str, ModuleData],
    edges_call,
) -> set[str]:
    """Return the set of NitroSDK-style subsystems this function's
    named callees belong to (e.g. {'OS', 'FS'}). Empty when all
    callees are still placeholder-named."""
    subsystems: set[str] = set()
    for (mod, addr) in edges_call.get((sym.module, sym.addr), set()):
        md = modules.get(mod)
        if md is None:
            continue
        callee = md.by_addr.get(addr)
        if callee is None or callee.name.startswith(PLACEHOLDER_PREFIXES):
            continue
        # "OS_Foo" -> "OS", "__register_global_object" -> None
        if "_" in callee.name:
            head = callee.name.split("_", 1)[0]
            if head.isupper() and head.isalpha() and 1 < len(head) <= 6:
                subsystems.add(head)
    return subsystems


def infer_argcount(sym: Symbol, out_degree: int) -> int | None:
    """Very conservative arg-count inference. We don't have register
    analysis, so we lean on size + out_degree:

      - 0 callees + size ≤ 0x8 → almost certainly 0-arg (a `bx lr`
        stub or trivial getter)
      - Anything else → None (don't guess)
    """
    if out_degree == 0 and sym.size <= 0x8:
        return 0
    return None


def collect_candidates(
    modules: dict[str, ModuleData],
    edges_call,
    matched: dict,
    *,
    max_size: int,
) -> list[Candidate]:
    out: list[Candidate] = []
    for md in modules.values():
        for sym in md.symbols:
            if not is_tractable(
                sym,
                modules=modules, edges_call=edges_call,
                matched=matched, max_size=max_size,
            ):
                continue
            out_deg = len(edges_call.get((sym.module, sym.addr), set()))
            subs = callee_subsystems(sym, modules, edges_call)
            argc = infer_argcount(sym, out_deg)
            out.append(Candidate(
                target=sym,
                out_degree=out_deg,
                named_callee_subsystems=subs,
                inferred_argcount=argc,
            ))
    # Easiest-first: size asc, out_degree asc, module+addr
    out.sort(key=lambda c: (
        c.target.size, c.out_degree, c.target.module, c.target.addr,
    ))
    return out


# --------------------------------------------------------------------------- #
# Scoring against the Nitro dict
# --------------------------------------------------------------------------- #

def _score_nitro_fn(cand: Candidate, nitro_fn: dict) -> int:
    """Heuristic score. Higher = more plausible. Negative to exclude."""
    score = 0
    # Subsystem plausibility: if we know the target's named callees
    # are in {OS, FS}, reward candidates in those subsystems.
    if cand.named_callee_subsystems:
        if nitro_fn.get("subsystem") in cand.named_callee_subsystems:
            score += 3
        else:
            # Deprioritise cross-subsystem matches, but don't exclude —
            # a Nitro function can call into another subsystem.
            score -= 1

    # Arg-count plausibility.
    if cand.inferred_argcount is not None:
        if nitro_fn.get("arg_count", -1) == cand.inferred_argcount:
            score += 2
        else:
            # Hard filter: if we've inferred 0 args, skip any Nitro
            # function that takes args. Conservative — we don't want
            # to suggest a 3-arg wrapper for a `bx lr`-shaped stub.
            return -1

    # Size-vs-complexity heuristic: a 0-arg void-return Nitro function
    # (`OS_Init`, `OS_Reset`, etc.) matches a leaf stub better than a
    # pointer-returning allocator.
    if cand.target.size <= 0x8 and nitro_fn.get("return_type") == "void":
        score += 1

    return score


def rank_nitro_candidates(
    cand: Candidate,
    nitro_functions: list[dict],
    top_k: int,
) -> list[tuple[int, dict]]:
    scored: list[tuple[int, dict]] = []
    for fn in nitro_functions:
        s = _score_nitro_fn(cand, fn)
        if s < 0:
            continue
        scored.append((s, fn))
    scored.sort(
        key=lambda t: (-t[0], t[1].get("name", "")),
    )
    return scored[:top_k]


# --------------------------------------------------------------------------- #
# Report
# --------------------------------------------------------------------------- #

def render_report(
    candidates: list[Candidate],
    nitro_functions: list[dict],
    *,
    max_candidates: int,
    limit: int,
    dict_source: str,
) -> str:
    lines: list[str] = []
    lines.append("# NitroSDK rename suggestions")
    lines.append("")
    lines.append(
        f"Scanned **{len(candidates)}** tractable unmatched function(s) "
        f"against a dictionary of **{len(nitro_functions)}** "
        f"NitroSDK signatures."
    )
    lines.append("")
    lines.append(
        f"_Dict source: `{dict_source}`. Rebuild with "
        f"`python tools/nitro_dict.py build --nitro-sdk <path>` after "
        f"a NitroSDK update._"
    )
    lines.append("")
    lines.append(
        "**Interpreting this report**: these are recommendations, not "
        "decisions. The decomper still verifies each candidate by "
        "inspecting the extracted assembly and running a match "
        "attempt. A single high-confidence pick unlocks more signal "
        "(re-run this tool after renames to tighten downstream "
        "subsystem inference)."
    )
    lines.append("")

    if not candidates:
        lines.append("_No tractable candidates — config state doesn't "
                     "have any small-leaf unmatched functions right "
                     "now. Come back after the next unmatched batch lands._")
        lines.append("")
        return "\n".join(lines)

    lines.append(f"## Top {min(limit, len(candidates))} targets")
    lines.append("")
    lines.append("_Sorted by ascending size, then out-degree. Smallest "
                 "shapes are usually the easiest renames to verify._")
    lines.append("")

    empty_hit = 0
    for cand in candidates[:limit]:
        sym = cand.target
        lines.append(
            f"### `{sym.module}|0x{sym.addr:08x}` "
            f"`{sym.name}` — size=0x{sym.size:x}, "
            f"out_degree={cand.out_degree}"
        )
        lines.append("")
        facts: list[str] = []
        if cand.inferred_argcount is not None:
            facts.append(f"inferred args: **{cand.inferred_argcount}**")
        if cand.named_callee_subsystems:
            subs = ", ".join(sorted(cand.named_callee_subsystems))
            facts.append(f"callee subsystems: **{subs}**")
        if facts:
            lines.append("Shape hints: " + "; ".join(facts) + ".")
            lines.append("")

        ranked = rank_nitro_candidates(
            cand, nitro_functions, max_candidates,
        )
        if not ranked:
            empty_hit += 1
            lines.append(
                "_(no Nitro candidates cleared the filters — try "
                "broadening by dropping the arg-count hint, or wait "
                "for named callees to tighten inference.)_"
            )
            lines.append("")
            continue

        lines.append("| Score | Name | Subsystem | Return | Args |")
        lines.append("|------:|------|-----------|--------|------|")
        for score, fn in ranked:
            args_s = ", ".join(fn.get("args", [])) or "void"
            if len(args_s) > 60:
                args_s = args_s[:57] + "..."
            lines.append(
                f"| {score} | `{fn['name']}` | `{fn.get('subsystem','misc')}` "
                f"| `{fn.get('return_type', '')}` | `{args_s}` |"
            )
        lines.append("")
        lines.append(
            f"<sub>Rename hint: "
            f"`python tools/rename_symbol.py {sym.module} "
            f"0x{sym.addr:08x} <Candidate>`</sub>"
        )
        lines.append("")

    if len(candidates) > limit:
        lines.append(
            f"_…and {len(candidates) - limit} more tractable "
            "candidate(s). Raise --limit to see them._"
        )
        lines.append("")

    lines.append("---")
    lines.append(
        f"<sub>🤖 Generated by `tools/nitro_suggest_renames.py`. "
        f"{empty_hit} target(s) had no Nitro matches.</sub>"
    )
    return "\n".join(lines)


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def _default_dict_path() -> Path:
    return ROOT / "build" / "analysis" / "nitro_dict.json"


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Propose NitroSDK names for unmatched functions.",
    )
    ap.add_argument("--version", default="eur")
    ap.add_argument("--dict",
                    help="Path to a nitro_dict.json (default: "
                         "build/analysis/nitro_dict.json)")
    ap.add_argument("--max-size", type=int, default=0x40,
                    help="Only propose for functions of size ≤ this "
                         "(default 0x40)")
    ap.add_argument("--max-candidates", type=int, default=5,
                    help="Top-K Nitro candidates per target (default 5)")
    ap.add_argument("--limit", type=int, default=50,
                    help="Max number of targets to report on "
                         "(default 50)")
    ap.add_argument("--out",
                    help="Write the report to this Markdown file "
                         "(default: print to stdout)")
    args = ap.parse_args()

    dict_path = Path(args.dict).expanduser() if args.dict \
        else _default_dict_path()
    if not dict_path.is_file():
        print(
            f"error: no Nitro dict at {dict_path}. Build one first "
            f"with `python tools/nitro_dict.py build --nitro-sdk <path>`.",
            file=sys.stderr,
        )
        return 2
    with dict_path.open() as f:
        payload = json.load(f)
    nitro_functions = payload.get("functions", [])
    dict_source = payload.get("source", str(dict_path))

    config_dir = ROOT / "config" / args.version
    if not config_dir.is_dir():
        print(f"error: {config_dir} not found.", file=sys.stderr)
        return 2

    modules = load_all(config_dir)
    graph = build_call_graph(modules)
    matched = collect_matched_ranges(config_dir)
    candidates = collect_candidates(
        modules, graph.edges_call, matched,
        max_size=args.max_size,
    )

    md = render_report(
        candidates, nitro_functions,
        max_candidates=args.max_candidates,
        limit=args.limit,
        dict_source=dict_source,
    )

    if args.out:
        out_path = Path(args.out).expanduser()
        out_path.parent.mkdir(parents=True, exist_ok=True)
        out_path.write_text(md, encoding="utf-8")
        print(f"Wrote {out_path}")
    else:
        print(md)
    return 0


if __name__ == "__main__":
    sys.exit(main())
