#!/usr/bin/env python3

"""
scaffold_batch.py — pre-create src/ skeletons for N unmatched targets.

The decomp loop spends real time on per-function setup: pick the
target, look up its callers, figure out what file to put it in,
write the placeholder C, draft the signature. For the 1100+ easy-
tier leaves still ahead, that setup cost compounds.

This tool removes that friction. Given a batch of unmatched
function addresses (either from next_targets.json or live-computed
from the current config), it:

  1. Reads each target's callers, callees, and loads from
     analyze_symbols's call graph.
  2. Generates a `.c` file with a skeleton body plus a comment
     header listing the discovered context (who calls this, what
     it calls, what data it loads).
  3. Prints the delinks.txt TU header line the decomper pastes
     after they verify the match. We do NOT auto-modify
     delinks.txt — that's the decomper's carving territory.

The scaffolded skeleton is a starting-point artifact, not a
finished match. Decomper still iterates against objdiff to:
  - Correct the signature based on register-use patterns
  - Write the actual body
  - Mark `complete` once objdiff agrees

But the 5 minutes of "create directory, copy header template,
paste caller list" → 0 minutes.

Usage:

  # Scaffold the top 10 unmatched easy-tier leaves in ov006.
  python tools/scaffold_batch.py \\
      --version eur --tier easy --module ov006 --count 10

  # Scaffold from a next_targets.json snapshot (honours its filters).
  python tools/scaffold_batch.py \\
      --version eur \\
      --targets-from build/eur/analysis/next_targets.json \\
      --count 20

  # Actually write files (default is dry-run).
  python tools/scaffold_batch.py --version eur --count 5 --confirm

"""

from __future__ import annotations

import argparse
import json
import sys
from dataclasses import dataclass, field
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import (  # noqa: E402
    ROOT,
    CallGraph,
    ModuleData,
    Symbol,
    SymbolKey,
    TIER_ORDER,
    build_call_graph,
    load_all,
    rank_targets,
)
from next_targets import (  # noqa: E402
    build_worklist,
    collect_matched_ranges,
    is_addr_matched,
)


# --------------------------------------------------------------------------- #
# Skeleton payload
# --------------------------------------------------------------------------- #

@dataclass
class ScaffoldPlan:
    module: str
    addr: int
    name: str
    size: int
    tier: str
    output_path: Path
    text: str
    delinks_line: str
    warnings: list[str] = field(default_factory=list)


def _overlay_dir(module: str) -> str:
    """ov005 -> 'overlay005'; main -> 'main'; itcm -> 'itcm'."""
    if module.startswith("ov") and module[2:].isdigit():
        return f"overlay{int(module[2:]):03d}"
    return module


def _derive_output_path(sym: Symbol) -> Path:
    """Build the src/ path for a scaffold file.

    Placeholder-named functions (`func_ov006_021ba1f0`) get filed as
    `src/overlay006/ov006_021ba1f0.c` — drop the `func_` prefix so
    the filename stays short. Named functions use the name as the
    stem verbatim.
    """
    subdir = _overlay_dir(sym.module)
    stem = sym.name
    if stem.startswith("func_"):
        stem = stem[len("func_"):]
    return ROOT / "src" / subdir / f"{stem}.c"


def _resolved_key_list(
    keys: list[SymbolKey], modules: dict[str, ModuleData],
) -> list[tuple[str, int, str, int]]:
    """Return [(module, addr, name, size), ...] for keys that resolve
    to a current symbol. Keys whose dest module isn't loaded or whose
    addr doesn't map to a symbol are skipped."""
    out: list[tuple[str, int, str, int]] = []
    for (mod, addr) in keys:
        md = modules.get(mod)
        if md is None:
            continue
        sym = md.by_addr.get(addr)
        if sym is None:
            continue
        out.append((mod, addr, sym.name, sym.size))
    out.sort(key=lambda t: (t[0], t[1]))
    return out


def _callers_of(
    target: SymbolKey, graph: CallGraph,
) -> list[SymbolKey]:
    out: list[SymbolKey] = []
    for caller, callees in graph.edges_call.items():
        if target in callees:
            out.append(caller)
    return out


def _format_ref_list(
    refs: list[tuple[str, int, str, int]],
    *, label: str, empty_note: str,
) -> list[str]:
    if not refs:
        return [f" * {label} (0): {empty_note}"]
    lines = [f" * {label} ({len(refs)}):"]
    for (mod, addr, name, size) in refs:
        size_s = f"0x{size:x}" if size else "?"
        lines.append(f" *   - {mod}|0x{addr:08x}  size={size_s}  {name}")
    return lines


def render_skeleton(
    sym: Symbol,
    tier: str,
    callers: list[tuple[str, int, str, int]],
    callees: list[tuple[str, int, str, int]],
    loads: list[tuple[str, int, str, int]],
) -> str:
    """Build the .c file text for the target symbol."""
    size_hex = f"0x{sym.size:x}"
    lines: list[str] = []
    lines.append(
        f"/* {sym.name} — TODO decomp ({tier} tier, size={size_hex})."
    )
    lines.append(
        f" * Run `python tools/find_callsites.py --version eur "
        f"{sym.module} 0x{sym.addr:08x}` for live context."
    )
    lines.append(" *")
    lines.extend(_format_ref_list(
        callers, label="Callers",
        empty_note="(dead code / entry point / only reached via gap)",
    ))
    lines.append(" *")
    lines.extend(_format_ref_list(
        callees, label="Callees", empty_note="(leaf)",
    ))
    lines.append(" *")
    lines.extend(_format_ref_list(
        loads, label="Loads", empty_note="(no data loads via reloc)",
    ))
    lines.append(" *")
    lines.append(" * Suggested next steps:")
    lines.append(
        " *   1. Replace the signature below based on how callers "
        "pass arguments"
    )
    lines.append(
        " *      (r0=arg0, r1=arg1, etc. — see the objdiff disassembly)."
    )
    lines.append(
        " *   2. Write the body. Run `ninja && ninja objdiff` and "
        "iterate until 100% match."
    )
    lines.append(
        " *   3. Add the TU header to delinks.txt (printed by this "
        "tool) and mark `complete`"
    )
    lines.append(
        " *      once objdiff agrees. Rename the symbol via "
        "`tools/rename_symbol.py` if"
    )
    lines.append(" *      the function's role becomes clear.")
    lines.append(" */")
    lines.append("")
    lines.append("#include <nitro.h> /* TODO: trim or replace */")
    lines.append("")
    # Best-effort default signature: callers' arg-passing pattern
    # isn't visible without the assembly, so we emit void()->void
    # as the conservative starting point.
    lines.append(f"void {sym.name}(void) {{")
    lines.append("    /* TODO: body */")
    lines.append("}")
    lines.append("")
    return "\n".join(lines)


def build_scaffold_plan(
    sym: Symbol,
    tier: str,
    modules: dict[str, ModuleData],
    graph: CallGraph,
) -> ScaffoldPlan:
    key: SymbolKey = (sym.module, sym.addr)
    callers = _resolved_key_list(_callers_of(key, graph), modules)
    callees = _resolved_key_list(
        list(graph.edges_call.get(key, set())), modules,
    )
    loads = _resolved_key_list(
        list(graph.edges_load.get(key, set())), modules,
    )

    text = render_skeleton(sym, tier, callers, callees, loads)
    output = _derive_output_path(sym)

    try:
        rel = output.relative_to(ROOT)
    except ValueError:
        rel = output
    end = sym.addr + sym.size
    delinks_line = (
        f"{rel}:\n"
        f"    .text start:0x{sym.addr:08x} end:0x{end:08x}"
    )

    warnings: list[str] = []
    if output.exists():
        warnings.append(
            f"{rel} already exists — will be skipped on --confirm."
        )

    return ScaffoldPlan(
        module=sym.module, addr=sym.addr, name=sym.name, size=sym.size,
        tier=tier, output_path=output,
        text=text, delinks_line=delinks_line, warnings=warnings,
    )


# --------------------------------------------------------------------------- #
# Target selection
# --------------------------------------------------------------------------- #

def _load_targets_from_json(
    path: Path,
) -> list[tuple[str, int, str]]:
    """Read next_targets.json; return [(module, addr, tier), ...]."""
    payload = json.loads(path.read_text())
    out: list[tuple[str, int, str]] = []
    for entry in payload.get("worklist", []):
        mod = entry.get("module")
        addr_s = entry.get("addr", "")
        tier = entry.get("tier", "")
        try:
            addr = int(addr_s, 16) if isinstance(addr_s, str) else int(addr_s)
        except (TypeError, ValueError):
            continue
        out.append((mod, addr, tier))
    return out


def pick_targets(
    *,
    version: str,
    targets_from: Path | None,
    module_filter: str | None,
    tier_filter: str | None,
    count: int,
) -> tuple[list[tuple[str, int, str]], dict[str, ModuleData], CallGraph]:
    """Return [(module, addr, tier), ...] — already filtered / capped
    — plus the modules + graph for downstream plan-building."""
    config_dir = ROOT / "config" / version
    modules = load_all(config_dir)
    graph = build_call_graph(modules)

    if targets_from is not None:
        raw = _load_targets_from_json(targets_from)
        # Apply filters on top of the JSON input.
        filtered = [
            (m, a, t) for (m, a, t) in raw
            if (tier_filter is None or t == tier_filter)
            and (module_filter is None or m == module_filter)
        ]
    else:
        # Live-compute the worklist from current config state.
        targets = rank_targets(modules, graph)
        matched_ranges = collect_matched_ranges(config_dir)
        worklist = build_worklist(
            targets, matched_ranges,
            tier=tier_filter, module=module_filter,
        )
        filtered = [
            (t.symbol.module, t.symbol.addr, t.tier)
            for t in worklist
        ]

    return filtered[:count], modules, graph


def filter_scaffoldable(
    targets: list[tuple[str, int, str]],
    modules: dict[str, ModuleData],
    config_dir: Path,
) -> tuple[list[tuple[str, int, str]], list[tuple[tuple[str, int, str], str]]]:
    """Drop targets that are already matched (belt + braces even if
    the worklist claimed otherwise) or that resolve to zero-size
    placeholders or to symbols missing from modules. Returns
    (accepted, rejected_with_reason)."""
    accepted: list[tuple[str, int, str]] = []
    rejected: list[tuple[tuple[str, int, str], str]] = []
    matched = collect_matched_ranges(config_dir)
    for t in targets:
        mod, addr, tier = t
        md = modules.get(mod)
        if md is None:
            rejected.append((t, f"module `{mod}` not loaded"))
            continue
        sym = md.by_addr.get(addr)
        if sym is None:
            rejected.append((t, f"no symbol at {mod}|0x{addr:08x}"))
            continue
        if sym.size == 0:
            rejected.append((t, "size=0 (unresolved placeholder)"))
            continue
        if is_addr_matched(matched, mod, addr):
            rejected.append((t, "already inside a complete TU"))
            continue
        accepted.append(t)
    return accepted, rejected


# --------------------------------------------------------------------------- #
# Output
# --------------------------------------------------------------------------- #

def print_plans(plans: list[ScaffoldPlan]) -> None:
    if not plans:
        print("(no scaffoldable targets — try widening the filters "
              "or raising --count)")
        return
    print(f"Ready to scaffold {len(plans)} file(s):\n")
    for p in plans:
        print(f"  [{p.tier:<7s}] {p.module}|0x{p.addr:08x}  "
              f"size=0x{p.size:x}  -> {p.output_path.name}")
        if p.warnings:
            for w in p.warnings:
                print(f"    ! {w}")
    print()
    print("delinks.txt TU headers to paste (do this after objdiff "
          "agrees on the match):\n")
    for p in plans:
        # Derive the target delinks.txt path hint.
        target_delinks = _delinks_hint_for_module(p.module)
        print(f"  # add to config/<ver>/{target_delinks}:")
        for line in p.delinks_line.split("\n"):
            print(f"  {line}")
        print()


def _delinks_hint_for_module(module: str) -> str:
    if module == "main":
        return "arm9/delinks.txt"
    if module in ("itcm", "dtcm"):
        return f"arm9/{module}/delinks.txt"
    return f"arm9/overlays/{module}/delinks.txt"


def write_plans(plans: list[ScaffoldPlan]) -> int:
    """Write plans to disk; skip already-existing files. Returns
    count written."""
    written = 0
    for p in plans:
        if p.output_path.exists():
            continue
        p.output_path.parent.mkdir(parents=True, exist_ok=True)
        p.output_path.write_text(p.text, encoding="utf-8")
        written += 1
    return written


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def main() -> int:
    ap = argparse.ArgumentParser(
        description="Pre-create src/ skeletons for N unmatched targets.",
    )
    ap.add_argument("--version", default="eur")
    ap.add_argument("--targets-from", type=Path,
                    help="Read worklist from a next_targets.json snapshot. "
                         "Without this, the tool live-computes the worklist "
                         "from current config state.")
    ap.add_argument("--module",
                    help="Restrict scaffolding to a single module (e.g. ov006)")
    ap.add_argument("--tier", choices=TIER_ORDER,
                    help="Restrict to one tier (e.g. easy)")
    ap.add_argument("--count", type=int, default=10,
                    help="Max files to scaffold per run (default 10)")
    ap.add_argument("--confirm", action="store_true",
                    help="Actually write files (default is dry-run)")
    args = ap.parse_args()

    config_dir = ROOT / "config" / args.version
    if not config_dir.is_dir():
        print(f"error: {config_dir} not found. "
              f"Run `python tools/configure.py {args.version}` first.",
              file=sys.stderr)
        return 2

    targets, modules, graph = pick_targets(
        version=args.version,
        targets_from=args.targets_from,
        module_filter=args.module,
        tier_filter=args.tier,
        count=args.count,
    )

    accepted, rejected = filter_scaffoldable(targets, modules, config_dir)
    plans: list[ScaffoldPlan] = []
    for (mod, addr, tier) in accepted:
        sym = modules[mod].by_addr[addr]
        plans.append(build_scaffold_plan(sym, tier, modules, graph))

    if rejected:
        print(f"Rejected {len(rejected)}:")
        for (t, reason) in rejected:
            mod, addr, tier = t
            print(f"  {mod}|0x{addr:08x}  [{tier}]  — {reason}")
        print()

    print_plans(plans)

    if not args.confirm:
        print("Dry-run — nothing written. Pass --confirm to materialise.")
        return 0

    written = write_plans(plans)
    skipped = len(plans) - written
    msg = f"Wrote {written} file(s)"
    if skipped:
        msg += f"; skipped {skipped} already-existing"
    print(msg + ".")
    return 0


if __name__ == "__main__":
    sys.exit(main())
