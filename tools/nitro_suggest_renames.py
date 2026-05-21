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

This is a scaffolding / recommendation tool. Scaffolder can run it, the
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
import re
import sys
from dataclasses import dataclass
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import (  # noqa: E402
    FAILING_MODULES,
    ROOT,
    ModuleData,
    Symbol,
    build_call_graph,
    load_all,
)
from next_targets import collect_matched_ranges, is_addr_matched  # noqa: E402


PLACEHOLDER_PREFIXES = ("func_", "data_", "_dsd_gap")


# Default filters — tuned against real config/eur to emit an
# actionable shortlist instead of a mile-long list of tiny stubs in
# failing modules. Override via CLI for deep-dive use.
DEFAULT_MIN_SIZE = 0x8      # skip 2/4-byte `bx lr` stubs (too ambiguous)
DEFAULT_MIN_CALLERS = 2     # skip 1-caller idiosyncratic helpers
DEFAULT_MAX_SIZE = 0x40     # retain the upper bound from v1
DEFAULT_MAX_OUT_DEGREE = 2  # retain the v1 out-degree cap


# Confidence tiers. Purely derived from score, score-gap, and
# shape-has-signal flags. Label surfaces in the report header and
# drives default rendering (LOW hidden unless --show-low-confidence).
CONF_HIGH = "HIGH"
CONF_MEDIUM = "MEDIUM"
CONF_LOW = "LOW"
CONF_ORDER = [CONF_HIGH, CONF_MEDIUM, CONF_LOW]


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
    # Non-stopword tokens drawn from the target's named callees'
    # names. Enables discriminator scoring within a subsystem tie-
    # group (PR #121 found the scorer capped at +3 with 5 alphabetised
    # ties; this adds up to +2 for name-token overlap).
    callee_name_tokens: frozenset[str] = frozenset()
    # Number of distinct callers in the current call graph. Used as
    # a signal for "widely-used helper" vs "one-off local": a function
    # with many callers is more likely to be a real SDK API, less
    # likely a module-internal thunk.
    caller_count: int = 0


def _count_callers(
    key: tuple[str, int], edges_call,
) -> int:
    return sum(1 for callees in edges_call.values() if key in callees)


def is_tractable(
    sym: Symbol,
    *,
    modules: dict[str, ModuleData],
    edges_call,
    matched: dict,
    max_size: int = DEFAULT_MAX_SIZE,
    min_size: int = DEFAULT_MIN_SIZE,
    max_out_degree: int = DEFAULT_MAX_OUT_DEGREE,
    min_callers: int = DEFAULT_MIN_CALLERS,
    include_failing_modules: bool = False,
) -> bool:
    """Filter unmatched symbols down to the ones worth recommending
    names for.

    Defaults (tuned against current config/eur to keep the output
    actionable; override any of them via the CLI):

      - min_size=0x8   skip tiny `bx lr` stubs; their shape is so
                       generic that every 0-arg/void Nitro function
                       scores identically (see brain's usability
                       feedback post-#97).
      - min_callers=2  skip functions called from only one place;
                       those are usually module-internal helpers
                       with idiosyncratic roles, not SDK API.
      - max_size=0x40  upper cap retained from v1 — larger means
                       subsystem inference from the call graph gets
                       noisy.
      - max_out_degree=2  v1 cap; retained.
      - include_failing_modules=False  skip main/dtcm/ov004 by
                       default. Those modules fail module-check for
                       structural reasons (placeholder-symbol
                       artifacts); renames there don't unblock
                       anything until the structural fix lands.

    Returns True if the symbol is worth scoring."""
    if not sym.is_function:
        return False
    if sym.size == 0:
        return False
    if sym.size < min_size or sym.size > max_size:
        return False
    if not sym.name.startswith(PLACEHOLDER_PREFIXES):
        return False
    if is_addr_matched(matched, sym.module, sym.addr):
        return False
    if not include_failing_modules and sym.module in FAILING_MODULES:
        return False
    out_deg = len(edges_call.get((sym.module, sym.addr), set()))
    if out_deg > max_out_degree:
        return False
    caller_count = _count_callers((sym.module, sym.addr), edges_call)
    if caller_count < min_callers:
        return False
    return True


# Bare-name → Nitro-subsystem mapping for project-local names that
# don't follow the PREFIX_Name convention but still carry subsystem
# signal. Curated per PR #114 research: every brief-011/013 BIOS SWI
# thunk lives in OS territory (NitroSDK has OS_Halt, OS_GetCRC16,
# OS_Sqrt, OS_LZ77UnCompReadNormalWrite8bit, etc.). Without this
# mapping the scorer gets no subsystem hint when a target calls
# these thunks, and HIGH-confidence suggestions can't materialise.
#
# Keep this list conservative: only add bare names whose subsystem
# identity is unambiguous in the NitroSDK ROM (i.e. the thunk
# wraps exactly that subsystem's OS_/GX_/whatever primitive). Don't
# add project-local names like `Entry` / `main` where the
# convention doesn't apply.
BARE_NAME_SUBSYSTEMS: dict[str, str] = {
    # Brief 011 BIOS SWI thunks — all dispatch to ARM9 BIOS, modelled
    # under `OS` in ntrtwl/NitroSDK.
    "SoftReset":                           "OS",
    "WaitByLoop":                          "OS",
    "IntrWait":                            "OS",
    "VBlankIntrWait":                      "OS",
    "Halt":                                "OS",
    "CpuSet":                              "OS",
    "CpuFastSet":                          "OS",
    "Sqrt":                                "OS",
    "Div":                                 "OS",
    "Mod":                                 "OS",
    "GetCRC16":                            "OS",
    "IsDebugger":                          "OS",
    "BitUnPack":                           "OS",
    "LZ77UnCompReadNormalWrite8bit":       "OS",
    "LZ77UnCompReadByCallbackWrite16bit":  "OS",
    "HuffUnCompReadByCallback":            "OS",
    "RLUnCompReadNormalWrite8bit":         "OS",
    "RLUnCompReadByCallbackWrite16bit":    "OS",
}


# Tokens that appear so commonly in both Nitro SDK names AND
# project-local placeholders that they contribute noise rather than
# signal when used for token-overlap scoring. `init` / `get` / `set` /
# `is` are the big offenders — almost every subsystem has dozens of
# them, so overlap on these boosts *every* candidate uniformly (which
# is the same as boosting none).
#
# Kept deliberately narrow: only add a token here after checking that
# it fires for > ~5% of name pairs AND doesn't discriminate. See
# PR #121's analysis for the scorer ceiling that this extension
# addresses.
TOKEN_OVERLAP_STOPWORDS: frozenset[str] = frozenset({
    "init", "get", "set", "is", "new", "fn", "func", "sub",
})


# Split at:
#   - underscore runs
#   - lowercase → uppercase boundary (`spinWait` → spin|Wait)
#   - uppercase-run → CamelCase (acronym: `OSHeap` → OS|Heap;
#     triggered by [A-Z] followed by [A-Z][a-z])
#
# Intentionally does NOT split at letter↔digit boundaries: that
# would break `ov005` → `ov` + `005`, which matters because the
# stem form shows up in placeholder names and we want single-token
# matching. Noisy numeric fragments get filtered below.
_TOKEN_SPLIT_RE = re.compile(
    r"[_]+|(?<=[a-z])(?=[A-Z])|(?<=[A-Z])(?=[A-Z][a-z])"
)


def _name_tokens(name: str) -> frozenset[str]:
    """Split a symbol name into lowercase tokens.

    `OS_SpinWait` → {'os', 'spin', 'wait'}
    `func_ov005_021b2334` → {'func', 'ov005'}  (021b2334 dropped)
    `__register_global_object` → {'register', 'global', 'object'}
    `GX_LoadBG0Char` → {'gx', 'load', 'bg0char'}

    Drops:
      - empty tokens (from multiple underscores / boundary edge cases)
      - pure-digit tokens (`005`, `123`) — addresses / indices,
        not discriminating
      - pure-hex tokens ≥ 4 chars (`021b`, `2334`, `abcd`) — address
        fragments that would overfit the overlap signal
    """
    out: set[str] = set()
    for raw in _TOKEN_SPLIT_RE.split(name):
        lo = raw.lower().strip("_")
        if not lo:
            continue
        if lo.isdigit():
            continue
        if len(lo) >= 4 and all(c in "0123456789abcdef" for c in lo):
            # Hex-addr fragment; not discriminating.
            continue
        out.add(lo)
    return frozenset(out)


def callee_name_tokens(
    sym: Symbol,
    modules: dict[str, ModuleData],
    edges_call,
) -> frozenset[str]:
    """Union of `_name_tokens` over every *named* direct callee.

    Used by the scorer to award a discriminator bonus when a Nitro
    candidate's name shares a non-stopword token with the target's
    callees. Example: a target that calls `WaitByLoop` should
    favour `OS_SpinWait` over `OS_AddToHeap`, because the former
    shares the `wait` token.

    Pre-PR #132, the scorer capped at +3 (subsystem match) for
    non-leaves — every OS_* candidate tied and the tool rendered an
    alphabetical tie-group. This token signal produces a real
    discriminator within the tie-group.
    """
    tokens: set[str] = set()
    for (mod, addr) in edges_call.get((sym.module, sym.addr), set()):
        md = modules.get(mod)
        if md is None:
            continue
        callee = md.by_addr.get(addr)
        if callee is None or callee.name.startswith(PLACEHOLDER_PREFIXES):
            continue
        tokens |= _name_tokens(callee.name)
    return frozenset(tokens) - TOKEN_OVERLAP_STOPWORDS


def callee_subsystems(
    sym: Symbol,
    modules: dict[str, ModuleData],
    edges_call,
) -> set[str]:
    """Return the set of NitroSDK-style subsystems this function's
    named callees belong to (e.g. {'OS', 'FS'}). Empty when all
    callees are still placeholder-named.

    Detects two forms of signal:
      - **`PREFIX_Name` convention** — `OS_Foo` → `OS`. Nitro SDK's
        canonical shape.
      - **Bare name in BARE_NAME_SUBSYSTEMS** — project-local names
        that still carry subsystem identity (BIOS SWI thunks like
        `Halt`, `Div`). PR #114 found the pre-existing scorer
        ignored these; re-running the suggester after brief 013's
        thunks landed produced 0 HIGH because the named callees
        didn't contribute signal. This lookup closes that gap.
    """
    subsystems: set[str] = set()
    for (mod, addr) in edges_call.get((sym.module, sym.addr), set()):
        md = modules.get(mod)
        if md is None:
            continue
        callee = md.by_addr.get(addr)
        if callee is None or callee.name.startswith(PLACEHOLDER_PREFIXES):
            continue
        # PREFIX_Name convention: "OS_Foo" -> "OS".
        # Skip "__register_global_object"-shaped names (no upper
        # prefix). The bare-name lookup below handles those that
        # do carry subsystem identity without a prefix.
        if "_" in callee.name:
            head = callee.name.split("_", 1)[0]
            if head.isupper() and head.isalpha() and 1 < len(head) <= 6:
                subsystems.add(head)
                continue
        # Bare-name BIOS thunk / project-local → subsystem lookup.
        bare_sub = BARE_NAME_SUBSYSTEMS.get(callee.name)
        if bare_sub is not None:
            subsystems.add(bare_sub)
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
    max_size: int = DEFAULT_MAX_SIZE,
    min_size: int = DEFAULT_MIN_SIZE,
    min_callers: int = DEFAULT_MIN_CALLERS,
    max_out_degree: int = DEFAULT_MAX_OUT_DEGREE,
    include_failing_modules: bool = False,
) -> list[Candidate]:
    out: list[Candidate] = []
    for md in modules.values():
        for sym in md.symbols:
            if not is_tractable(
                sym,
                modules=modules, edges_call=edges_call,
                matched=matched,
                max_size=max_size, min_size=min_size,
                min_callers=min_callers,
                max_out_degree=max_out_degree,
                include_failing_modules=include_failing_modules,
            ):
                continue
            key = (sym.module, sym.addr)
            out_deg = len(edges_call.get(key, set()))
            subs = callee_subsystems(sym, modules, edges_call)
            argc = infer_argcount(sym, out_deg)
            caller_count = _count_callers(key, edges_call)
            tokens = callee_name_tokens(sym, modules, edges_call)
            out.append(Candidate(
                target=sym,
                out_degree=out_deg,
                named_callee_subsystems=subs,
                inferred_argcount=argc,
                callee_name_tokens=tokens,
                caller_count=caller_count,
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

    # Name-token overlap: within a subsystem tie-group, prefer the
    # candidate whose name shares a non-stopword token with the
    # target's callees. Resolves the score-3 ceiling documented in
    # PR #121. Capped at +2 so it can complement (not overwhelm)
    # subsystem signal; a 1-token match (+1) or 2-token match (+2)
    # is plenty to break a 5-way alphabetical tie.
    if cand.callee_name_tokens:
        cand_tokens = _name_tokens(nitro_fn.get("name", ""))
        cand_tokens -= TOKEN_OVERLAP_STOPWORDS
        overlap = cand_tokens & cand.callee_name_tokens
        if overlap:
            score += min(len(overlap), 2)

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


def classify_confidence(
    cand: Candidate, ranked: list[tuple[int, dict]],
) -> str:
    """Derive a HIGH / MEDIUM / LOW label for a target + its ranked
    candidates.

    HIGH: top score ≥ 5 AND (score-gap to second ≥ 2 OR only one
          candidate clears filters) AND cand has at least one named
          callee subsystem OR ≥ 4 callers (there's discriminating
          signal, not just a generic-shape match).
    MEDIUM: top score ≥ 3, at least one shape signal present.
    LOW: everything else (generic shape, weak signal). Hidden from
         default output; surface via --show-low-confidence.
    """
    if not ranked:
        return CONF_LOW
    top_score = ranked[0][0]
    second_score = ranked[1][0] if len(ranked) > 1 else -1
    gap = top_score - second_score
    has_callee_signal = bool(cand.named_callee_subsystems)
    has_caller_signal = cand.caller_count >= 4

    if top_score >= 5 and (gap >= 2 or len(ranked) == 1) and \
            (has_callee_signal or has_caller_signal):
        return CONF_HIGH
    if top_score >= 3 and (has_callee_signal or has_caller_signal):
        return CONF_MEDIUM
    return CONF_LOW


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
    show_low_confidence: bool = False,
) -> str:
    """Render candidates as grouped-by-confidence Markdown.

    HIGH-confidence suggestions appear first, then MEDIUM. LOW are
    hidden unless `show_low_confidence=True` — that's the main
    usability fix over v1 (brain's feedback: tiny-stub LOW suggestions
    drowned out the real HIGH/MEDIUM signal)."""
    # Pre-rank everything once so we can both classify and render.
    scored: list[tuple[Candidate, list[tuple[int, dict]], str]] = []
    for cand in candidates:
        ranked = rank_nitro_candidates(cand, nitro_functions, max_candidates)
        conf = classify_confidence(cand, ranked)
        scored.append((cand, ranked, conf))

    by_conf: dict[str, list] = {c: [] for c in CONF_ORDER}
    for item in scored:
        by_conf[item[2]].append(item)
    counts = {c: len(by_conf[c]) for c in CONF_ORDER}

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
        f"**Confidence breakdown:** 🟢 **{counts[CONF_HIGH]} HIGH**, "
        f"🟡 **{counts[CONF_MEDIUM]} MEDIUM**, ⚪ "
        f"**{counts[CONF_LOW]} LOW**. "
        f"LOW suggestions are hidden by default — re-run with "
        f"`--show-low-confidence` to surface them."
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
        lines.append(
            "_No tractable candidates — current config/ has no "
            "small-leaf unmatched functions matching the default "
            "filters (size ≥ 0x8, ≥ 2 callers, outside failing "
            "modules). Try `--min-size 2 --min-callers 1 "
            "--include-failing-modules` to see the long tail._"
        )
        lines.append("")
        return "\n".join(lines)

    # Emit sections in confidence order. Within a section, sort by
    # (caller_count desc, size asc, module, addr) so widely-used
    # helpers surface first — those are the ones where getting the
    # name right has the most downstream signal.
    rendered_sections = 0
    for conf in CONF_ORDER:
        if conf == CONF_LOW and not show_low_confidence:
            continue
        bucket = by_conf[conf]
        if not bucket:
            continue
        bucket.sort(key=lambda t: (
            -t[0].caller_count, t[0].target.size,
            t[0].target.module, t[0].target.addr,
        ))

        section_limit = max(1, limit // max(1, len([
            c for c in CONF_ORDER
            if by_conf[c] and (c != CONF_LOW or show_low_confidence)
        ])))
        emoji = {"HIGH": "🟢", "MEDIUM": "🟡", "LOW": "⚪"}[conf]
        lines.append(
            f"## {emoji} {conf}-confidence "
            f"(showing {min(section_limit, len(bucket))} of {len(bucket)})"
        )
        lines.append("")

        for cand, ranked, _ in bucket[:section_limit]:
            lines.extend(_render_target(cand, ranked, conf))
        if len(bucket) > section_limit:
            lines.append(
                f"_…and {len(bucket) - section_limit} more "
                f"{conf}-confidence target(s). Raise --limit to see them._"
            )
            lines.append("")
        rendered_sections += 1

    if rendered_sections == 0:
        lines.append(
            "_Everything classified LOW-confidence under the current "
            "heuristic. Pass `--show-low-confidence` to surface the "
            "long tail, or widen the input filters._"
        )
        lines.append("")

    lines.append("---")
    lines.append(
        "<sub>🤖 Generated by `tools/nitro_suggest_renames.py`. "
        "Confidence labels derived from score gap + signal "
        "(callee subsystems, caller count) — see `classify_confidence` "
        "for the heuristic.</sub>"
    )
    return "\n".join(lines)


def _render_target(
    cand: Candidate, ranked: list[tuple[int, dict]], conf: str,
) -> list[str]:
    """Render one target + its candidate table. Factored out so both
    the grouped report and a future per-target query can reuse it."""
    sym = cand.target
    lines: list[str] = []
    lines.append(
        f"### `{sym.module}|0x{sym.addr:08x}` "
        f"`{sym.name}` — size=0x{sym.size:x}, "
        f"out_degree={cand.out_degree}, "
        f"callers={cand.caller_count}"
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

    if not ranked:
        lines.append(
            "_(no Nitro candidates cleared the filters — try "
            "broadening by dropping the arg-count hint, or wait "
            "for named callees to tighten inference.)_"
        )
        lines.append("")
        return lines

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
    return lines


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
    ap.add_argument("--max-size", type=int, default=DEFAULT_MAX_SIZE,
                    help=f"Only propose for functions of size ≤ this "
                         f"(default 0x{DEFAULT_MAX_SIZE:x})")
    ap.add_argument("--min-size", type=int, default=DEFAULT_MIN_SIZE,
                    help=f"Skip functions smaller than this. Default "
                         f"(0x{DEFAULT_MIN_SIZE:x}) drops `bx lr`-shape "
                         f"stubs whose signal is too generic. Pass "
                         f"`--min-size 2` to include them.")
    ap.add_argument("--min-callers", type=int, default=DEFAULT_MIN_CALLERS,
                    help=f"Skip functions with fewer than this many "
                         f"callers in the current graph (default "
                         f"{DEFAULT_MIN_CALLERS}). 1-caller helpers "
                         f"are usually idiosyncratic and hard to name.")
    ap.add_argument("--include-failing-modules", action="store_true",
                    help="Include main / dtcm / ov004 in the scan. "
                         "Off by default — those modules fail "
                         "module-check for structural reasons; "
                         "renames there don't unblock matching until "
                         "the structural fix lands.")
    ap.add_argument("--show-low-confidence", action="store_true",
                    help="Surface LOW-confidence suggestions too. "
                         "Off by default — LOW means generic-shape "
                         "targets with no discriminating signal, "
                         "which produce noise more than useful hints.")
    ap.add_argument("--max-candidates", type=int, default=5,
                    help="Top-K Nitro candidates per target (default 5)")
    ap.add_argument("--limit", type=int, default=50,
                    help="Max number of targets to report on across "
                         "all confidence tiers (default 50)")
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
        min_size=args.min_size,
        min_callers=args.min_callers,
        include_failing_modules=args.include_failing_modules,
    )

    md = render_report(
        candidates, nitro_functions,
        max_candidates=args.max_candidates,
        limit=args.limit,
        dict_source=dict_source,
        show_low_confidence=args.show_low_confidence,
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
