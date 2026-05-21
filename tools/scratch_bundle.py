#!/usr/bin/env python3

"""
scratch_bundle.py — one-shot context assembler for a decomp target.

The "preparing to decompile function F" ritual currently involves
half-a-dozen tools: find_callsites for callers, find_callsites again
for callees, find_callsites a third time for data loads, a manual
grep through src/<module>/ for already-matched siblings, a manual
lookup of any named callees' NitroSDK signatures. 10-15 minutes per
function, repeated hundreds of times across the project.

This tool collapses that ritual into one command:

    python tools/scratch_bundle.py --version eur main 0x02093820 > scratch.md

Output is a single Markdown file with everything needed to draft C:

  - Target metadata (name, module, addr, size, tier, caller count)
  - Callers, callees, data loads (all resolved with names)
  - Adjacent matched siblings — `.c` files within ±0x1000 of the
    target address in `src/<module>/` — inlined as reference
  - NitroSDK type hints — if any callee is convention-named (OS_*,
    GX_*, etc.), point at the relevant libs/nitro/ header
  - Tier-classification note (easy leaf? medium with all named
    callees? hard?) so the drafter knows what shape to aim for

With `--prompt`, the bundle is wrapped with an LLM drafting
template: "here's the context; produce a first-pass C candidate
using mwcc-arm conventions; match the shape of the sibling
templates." Decomper pastes into their LLM of choice, iterates.

Pairs with:
  - tools/find_callsites.py — which this tool's context section
    essentially subsumes for the single-target case
  - tools/find_cascades.py — if the target is a high-cascade hit,
    draft + match it first
  - tools/nitro_suggest_renames.py — if the target has subsystem
    signal, the suggested candidates go in the bundle header
"""

from __future__ import annotations

import argparse
import sys
from dataclasses import dataclass, field
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import (  # noqa: E402
    CallGraph,
    ModuleData,
    ROOT,
    Symbol,
    SymbolKey,
    build_call_graph,
    classify,
    load_all,
)
from next_targets import (  # noqa: E402
    collect_matched_ranges,
    is_addr_matched,
)
from nitro_suggest_renames import (  # noqa: E402
    BARE_NAME_SUBSYSTEMS,
)


# Adjacent-sibling radius: we inline .c files whose parsed address
# sits within this window of the target. Same order-of-magnitude as
# bulk_rename_candidates.ADJACENCY_BONUS_WINDOW (±0x1000) — siblings
# from the same C template usually land within a couple of KB.
SIBLING_WINDOW = 0x1000

# Cap on how many sibling bodies we inline; beyond this the bundle
# gets too long to be useful.
MAX_SIBLINGS = 4


# --------------------------------------------------------------------------- #
# Module → src-dir name (kept local to avoid importing from
# propagate_template which has its own surface area).
# --------------------------------------------------------------------------- #

def module_dir_name(module: str) -> str:
    """Same convention as propagate_template._module_dir_name:
    main → main, ov005 → overlay005, etc."""
    if module in ("main", "itcm", "dtcm"):
        return module
    if module.startswith("ov") and module[2:].isdigit():
        n = int(module[2:])
        return f"overlay{n:03d}"
    return module  # fallback — shouldn't happen for known modules


# --------------------------------------------------------------------------- #
# Bundle model
# --------------------------------------------------------------------------- #

@dataclass
class Sibling:
    """A nearby matched .c file we think is a useful template."""

    path: Path
    addr: int | None  # parsed from filename, None if unparseable
    body: str
    distance: int     # bytes from target.addr (absolute value)


@dataclass
class Bundle:
    """Everything the drafter needs to work from. Passed to the
    renderer; render_markdown produces the Markdown."""

    target: Symbol
    tier: str                          # easy/medium/hard/etc. (from classify)
    tier_reason: str
    callers: list[Symbol] = field(default_factory=list)
    callees: list[Symbol] = field(default_factory=list)
    loads: list[Symbol] = field(default_factory=list)
    siblings: list[Sibling] = field(default_factory=list)
    matched: bool = False
    # NitroSDK header hints: (header_path, rationale) per hit.
    nitro_hints: list[tuple[str, str]] = field(default_factory=list)


# --------------------------------------------------------------------------- #
# Resolvers
# --------------------------------------------------------------------------- #

def _callers_of(
    key: SymbolKey, graph: CallGraph, modules: dict[str, ModuleData],
) -> list[Symbol]:
    out: list[Symbol] = []
    for (cm, ca), callees in graph.edges_call.items():
        if key not in callees:
            continue
        md = modules.get(cm)
        if md is None:
            continue
        sym = md.by_addr.get(ca)
        if sym is not None:
            out.append(sym)
    out.sort(key=lambda s: (s.module, s.addr))
    return out


def _callees_of(
    key: SymbolKey, graph: CallGraph, modules: dict[str, ModuleData],
) -> list[Symbol]:
    out: list[Symbol] = []
    for (cm, ca) in graph.edges_call.get(key, set()):
        md = modules.get(cm)
        if md is None:
            continue
        sym = md.by_addr.get(ca)
        if sym is not None:
            out.append(sym)
    out.sort(key=lambda s: (s.module, s.addr))
    return out


def _loads_of(
    key: SymbolKey, graph: CallGraph, modules: dict[str, ModuleData],
) -> list[Symbol]:
    out: list[Symbol] = []
    for (dm, da) in graph.edges_load.get(key, set()):
        md = modules.get(dm)
        if md is None:
            continue
        sym = md.by_addr.get(da)
        if sym is not None:
            out.append(sym)
    out.sort(key=lambda s: (s.module, s.addr))
    return out


def _parse_addr_from_filename(stem: str) -> int | None:
    """`ov005_021b16e4` / `func_02000800` / `sinit_ov002_022ca7e8` all
    end with an 8-hex-digit address. Return it or None."""
    import re
    m = re.search(r"([0-9a-fA-F]{6,8})$", stem)
    if m is None:
        return None
    try:
        return int(m.group(1), 16)
    except ValueError:
        return None


def _find_siblings(
    target: Symbol, src_root: Path,
    *, window: int = SIBLING_WINDOW, max_n: int = MAX_SIBLINGS,
) -> list[Sibling]:
    """Scan src/<module>/ for .c files whose parsed address falls
    within ±window of the target. Reads bodies, sorts by distance,
    returns up to `max_n`."""
    mod_dir = src_root / module_dir_name(target.module)
    if not mod_dir.is_dir():
        return []
    candidates: list[Sibling] = []
    for p in mod_dir.glob("*.c"):
        addr = _parse_addr_from_filename(p.stem)
        if addr is None:
            continue
        distance = abs(addr - target.addr)
        if distance > window or distance == 0:
            continue
        try:
            body = p.read_text(encoding="utf-8")
        except OSError:
            continue
        candidates.append(Sibling(
            path=p, addr=addr, body=body, distance=distance,
        ))
    candidates.sort(key=lambda s: s.distance)
    return candidates[:max_n]


# --------------------------------------------------------------------------- #
# NitroSDK hints
# --------------------------------------------------------------------------- #

_NITRO_SUBSYSTEM_HEADERS: dict[str, tuple[str, str]] = {
    "OS":   ("libs/nitro/include/nitro/os.h",
             "OS subsystem — arenas, heaps, ticks, IRQ, threads, lock words."),
    # Additional subsystem headers get wired in here as they land
    # under libs/nitro/include/nitro/.
}


def _nitro_hints(callees: list[Symbol]) -> list[tuple[str, str]]:
    """For each callee whose name maps to a NitroSDK subsystem —
    either via PREFIX_Name convention OR via the bare-name map
    (BIOS thunks like Halt/Div/WaitByLoop) — surface the header
    path + one-line rationale. Same signal graph as
    callee_subsystems() in nitro_suggest_renames."""
    hits: dict[str, tuple[str, str]] = {}
    for c in callees:
        if not c.is_named:
            continue
        head: str | None = None
        # PREFIX_Name convention: "OS_Foo" -> "OS".
        if "_" in c.name:
            maybe = c.name.split("_", 1)[0]
            if maybe.isupper() and maybe.isalpha() and 1 < len(maybe) <= 6:
                head = maybe
        # Bare-name BIOS thunk fallback.
        if head is None:
            head = BARE_NAME_SUBSYSTEMS.get(c.name)
        if head is None:
            continue
        header = _NITRO_SUBSYSTEM_HEADERS.get(head)
        if header is None:
            continue
        hits[head] = header
    return list(hits.values())


# --------------------------------------------------------------------------- #
# Bundle assembly
# --------------------------------------------------------------------------- #

def build_bundle(
    target: Symbol,
    modules: dict[str, ModuleData],
    graph: CallGraph,
    matched: dict[str, list[tuple[int, int]]],
    *,
    src_root: Path,
    sibling_window: int = SIBLING_WINDOW,
    max_siblings: int = MAX_SIBLINGS,
) -> Bundle:
    key: SymbolKey = (target.module, target.addr)
    callers = _callers_of(key, graph, modules)
    callees = _callees_of(key, graph, modules)
    loads = _loads_of(key, graph, modules)
    siblings = _find_siblings(
        target, src_root,
        window=sibling_window, max_n=max_siblings,
    )
    classify_result = classify(target, graph, modules)
    tier = classify_result.tier if classify_result is not None else "hard"
    tier_reason = (
        classify_result.reason if classify_result is not None else ""
    )
    nitro = _nitro_hints(callees)
    return Bundle(
        target=target,
        tier=tier,
        tier_reason=tier_reason,
        callers=callers,
        callees=callees,
        loads=loads,
        siblings=siblings,
        matched=is_addr_matched(matched, target.module, target.addr),
        nitro_hints=nitro,
    )


# --------------------------------------------------------------------------- #
# Rendering
# --------------------------------------------------------------------------- #

def _fmt_sym(s: Symbol) -> str:
    size = f"size=0x{s.size:x}" if s.size else "size=?"
    return f"`{s.module}|0x{s.addr:08x}` `{s.name}` ({size})"


def render_markdown(
    b: Bundle, *,
    include_sibling_bodies: bool = True,
    max_callers_shown: int = 15,
    max_callees_shown: int = 15,
) -> str:
    lines: list[str] = []
    lines.append(
        f"# Scratch bundle — `{b.target.name}` "
        f"({b.target.module}|0x{b.target.addr:08x})",
    )
    lines.append("")
    if b.matched:
        lines.append(
            "> ⚠️ Target sits inside an already-`complete` TU. "
            "Matching it a second time is usually wasted work — "
            "double-check this is what you want.",
        )
        lines.append("")

    # Metadata.
    lines.append("## Target")
    lines.append("")
    lines.append(f"- **Name**: `{b.target.name}`")
    lines.append(f"- **Module**: `{b.target.module}`")
    lines.append(
        f"- **Address**: `0x{b.target.addr:08x}`",
    )
    size = f"0x{b.target.size:x}" if b.target.size else "? (unknown)"
    lines.append(f"- **Size**: `{size}` bytes")
    lines.append(
        f"- **Mode**: `{b.target.mode}`"
        + (" — Thumb" if b.target.mode == "thumb" else ""),
    )
    lines.append(f"- **Tier**: `{b.tier}` — {b.tier_reason}")
    lines.append(
        f"- **Callers**: {len(b.callers)}  •  "
        f"**Callees**: {len(b.callees)}  •  "
        f"**Data loads**: {len(b.loads)}",
    )
    lines.append("")

    # NitroSDK header pointers (if any subsystem callees).
    if b.nitro_hints:
        lines.append("## NitroSDK context")
        lines.append("")
        for header, rationale in b.nitro_hints:
            lines.append(f"- `#include <{header.split('/include/')[1]}>` — {rationale}")
        lines.append("")

    # Callees — usually the most useful drafting context.
    if b.callees:
        lines.append("## Callees")
        lines.append("")
        shown = b.callees[:max_callees_shown]
        for c in shown:
            tag = " — **named**" if c.is_named else ""
            lines.append(f"- {_fmt_sym(c)}{tag}")
        if len(b.callees) > max_callees_shown:
            lines.append(
                f"- _(+{len(b.callees) - max_callees_shown} more elided)_",
            )
        lines.append("")

    # Callers — essential for inferring args/role.
    if b.callers:
        lines.append("## Callers")
        lines.append("")
        shown = b.callers[:max_callers_shown]
        for c in shown:
            tag = " — **named**" if c.is_named else ""
            lines.append(f"- {_fmt_sym(c)}{tag}")
        if len(b.callers) > max_callers_shown:
            lines.append(
                f"- _(+{len(b.callers) - max_callers_shown} more elided)_",
            )
        lines.append("")

    # Data loads.
    if b.loads:
        lines.append("## Data references")
        lines.append("")
        for d in b.loads:
            tag = " — **named**" if d.is_named else ""
            lines.append(f"- {_fmt_sym(d)}{tag}")
        lines.append("")

    # Adjacent siblings — most valuable for template-shape matching.
    if b.siblings:
        lines.append("## Adjacent matched siblings")
        lines.append("")
        lines.append(
            f"_Matched `.c` files within ±0x{SIBLING_WINDOW:x} of "
            f"the target in `src/{module_dir_name(b.target.module)}/`. "
            "Use these as templates for the draft._",
        )
        lines.append("")
        for s in b.siblings:
            dist_kb = s.distance / 1024 if s.distance else 0
            dir_ = (
                "+"
                if (s.addr or 0) > b.target.addr else "-"
            )
            lines.append(
                f"### `{s.path.name}` "
                f"({dir_}0x{s.distance:x} = {dist_kb:.2f} KB from target)",
            )
            if include_sibling_bodies:
                lines.append("")
                lines.append("```c")
                lines.append(s.body.rstrip())
                lines.append("```")
            lines.append("")
    else:
        lines.append("## Adjacent matched siblings")
        lines.append("")
        lines.append(
            f"_No matched `.c` files within ±0x{SIBLING_WINDOW:x} "
            f"of the target. This function is likely in a "
            "newly-carved region; the drafter is on their own for "
            "C-template shape._",
        )
        lines.append("")

    # Disassembly section — can't produce it from scaffolder, but
    # tell the reader how.
    lines.append("## Disassembly")
    lines.append("")
    lines.append(
        "_The `.s` for this function isn't inlined — scaffolder can't "
        "run `dsd delink` / `mwccarm`. Run locally:_",
    )
    lines.append("")
    lines.append("```bash")
    lines.append("ninja dis  # produces build/eur/**/*.s")
    lines.append(
        f"# Then look up {b.target.module}|0x{b.target.addr:08x} "
        "in the relevant .s file.",
    )
    lines.append("```")
    lines.append("")

    return "\n".join(lines)


# --------------------------------------------------------------------------- #
# Optional LLM drafting prompt wrapper
# --------------------------------------------------------------------------- #

_PROMPT_HEADER = """\
You are helping decompile a Nintendo DS game (Yu-Gi-Oh! GX Spirit
Caller) targeting CodeWarrior mwcc-arm. Produce a FIRST-PASS C
candidate for the target function, prioritising shape-match over
correctness: get the control flow and types plausible, accept that
it will take 2-20 iterations before objdiff hits 100%.

Guidelines:
- Use NitroSDK naming for callees + types (OS_*, GX_*, u32, s16, etc.).
- Match the shape of the sibling templates inlined below.
- Prefer `int` / `unsigned int` unless a sibling uses a narrower type.
- Don't invent constants — if you don't know a numeric literal, leave
  it as a TODO.
- Keep it minimal. Helpers / macros only if a sibling has them.

Context follows.
"""

_PROMPT_FOOTER = """\

Respond with the C draft only, no preamble. Emit a single fenced
```c block. The decomper will paste it into src/<module>/<name>.c
and iterate from there.
"""


def wrap_as_prompt(markdown: str) -> str:
    return _PROMPT_HEADER + "\n\n" + markdown + "\n" + _PROMPT_FOOTER


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def main() -> int:
    ap = argparse.ArgumentParser(
        description="Assemble a one-shot context bundle for a "
                    "decomp target. Use `--prompt` to wrap it in "
                    "an LLM drafting prompt.",
    )
    ap.add_argument("--version", default="eur")
    ap.add_argument("module", help="Module (main, ov005, …).")
    ap.add_argument("addr", help="Target address (hex).")
    ap.add_argument(
        "--prompt", action="store_true",
        help="Wrap the bundle with an LLM drafting prompt header "
             "+ footer. Paste the result into your LLM of choice.",
    )
    ap.add_argument(
        "--no-sibling-bodies", action="store_true",
        help="Elide the sibling .c file contents — show only the "
             "filenames + distances.",
    )
    ap.add_argument(
        "--max-siblings", type=int, default=MAX_SIBLINGS,
        help=f"Max sibling .c bodies to inline (default {MAX_SIBLINGS}).",
    )
    ap.add_argument(
        "--sibling-window", type=lambda s: int(s, 0),
        default=SIBLING_WINDOW,
        help=f"Distance window for siblings in bytes (default "
             f"0x{SIBLING_WINDOW:x}).",
    )
    ap.add_argument(
        "-o", "--out", type=Path, default=None,
        help="Write to this file (default stdout).",
    )
    args = ap.parse_args()

    config_dir = ROOT / "config" / args.version
    if not config_dir.is_dir():
        print(f"error: {config_dir} not found.", file=sys.stderr)
        return 2
    src_root = ROOT / "src"

    modules = load_all(config_dir)
    md = modules.get(args.module)
    if md is None:
        print(
            f"error: module `{args.module}` not found.",
            file=sys.stderr,
        )
        return 2
    addr = int(args.addr, 0)
    target = md.by_addr.get(addr)
    if target is None:
        print(
            f"error: no symbol at {args.module}|0x{addr:08x}.",
            file=sys.stderr,
        )
        return 2

    graph = build_call_graph(modules)
    matched = collect_matched_ranges(config_dir)

    bundle = build_bundle(
        target, modules, graph, matched,
        src_root=src_root,
        sibling_window=args.sibling_window,
        max_siblings=args.max_siblings,
    )
    md_text = render_markdown(
        bundle,
        include_sibling_bodies=not args.no_sibling_bodies,
    )
    if args.prompt:
        md_text = wrap_as_prompt(md_text)

    if args.out:
        args.out.write_text(md_text, encoding="utf-8")
    else:
        sys.stdout.write(md_text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
