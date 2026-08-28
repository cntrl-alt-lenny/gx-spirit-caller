#!/usr/bin/env python3
"""READ-ONLY taxonomy of HIGH-floor cross-region port refusals (q-port-refusal-taxonomy).

`batch_port.py` only reports a coarse per-run count of refused candidates.
This tool replicates `port_to_region.py`'s own confidence-floor resolution
(`resolve_symbol()` / `FLOOR_RANK`, see that module's `main()`) over EVERY
symbol reference in a candidate's EUR source -- not just the ported function
itself -- for every `byte_sim==1.0` backlog row, and groups the refusals by
the SPECIFIC blocking symbol (not just a coarse confidence bucket). That
answers a question `batch_port.py`'s own `classify_port_refusal()` cannot:
do refusals cluster on a handful of recurring unresolved symbols, or are
they spread across many unrelated ones?

CAUTION -- read before trusting any OTHER dry-run of port_to_region.py:
`port_to_region.py --dry-run` SKIPS the confidence-floor rejection branch
entirely (`if failed and not args.dry_run:` in that module's `main()`), so
a naive dry-run reports candidates as PASSING that a real (non-dry-run) run
REFUSES. This tool never uses `--dry-run` semantics -- it calls the same
`resolve_symbol()` / floor-check / collision-check / needs-symbol-check
sequence `main()` uses, directly, so it sees exactly what the real tool
would refuse, without ever writing a file (verified against 5 real,
non-dry-run `port_to_region.py --output-path <scratch>` invocations while
this tool was built -- all 5 blockers matched exactly).

Usage:

    python tools/port_refusal_taxonomy.py --target usa
    python tools/port_refusal_taxonomy.py --target jpn --top 60

Writes `build/port_refusal_taxonomy_<target>.json` (one row per sim==1.0
backlog candidate: status + every blocking symbol) and
`build/port_refusal_blockers_<target>.json` (the ranked, aggregated table).
"""
from __future__ import annotations

import argparse
import json
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(Path(__file__).resolve().parent))

from batch_port import filter_sim1_backlog  # noqa: E402
from port_to_region import (  # noqa: E402
    SymbolRef,
    collect_new_symbols_txt_lines,
    derive_data_address_mapping,
    find_rename_collisions,
    function_symbol_for,
    is_placeholder_function_name,
    load_full_relocs,
    load_region_data_symbol_kinds,
    load_region_data_symbols,
    parse_filename_stem,
    parse_symbols_in_source,
    repair_rename_collisions,
    resolve_named_source_function,
    resolve_symbol,
)
from routing_suffixes import split_routing_suffix  # noqa: E402

FLOOR_RANK = {"HIGH": 3, "MEDIUM": 2, "LOW": 1, "NONE": 0,
              "EXACT_ADDR": 3, "SYNTHESIZED": 3}
FLOOR = FLOOR_RANK["HIGH"]


# --------------------------------------------------------------------------- #
# PURE: classify one candidate given already-loaded region data              #
# --------------------------------------------------------------------------- #

def classify_candidate(
    entry: dict,
    source_text: str,
    target: str,
    eur_regions: dict,
    target_regions: dict,
    target_data_symbols: dict,
    eur_full_relocs: dict,
    target_full_relocs: dict,
    eur_data_kinds: dict,
    named_functions: dict,
    find_siblings_fn,
) -> dict:
    """Replicate port_to_region.py main()'s per-file resolution + floor/
    collision/needs-symbol checks for one backlog entry. Returns
    {"tgt", "eur", "module", "size", "status", "blockers"} where `status`
    is one of "refused-floor" / "refused-collision" / "needs-symbol" /
    "clear" / "unresolvable-filename", mirroring the real tool's four exit
    paths (REFUSED-floor rc=2, REFUSED-collision rc=3, ok-with-new-symbols,
    ok-and-would-write)."""
    module = entry["module"]
    eur_rel = entry["eur"]
    file_stem = split_routing_suffix(Path(eur_rel).stem)[0]
    parsed = parse_filename_stem(file_stem)
    if parsed is None:
        named = resolve_named_source_function(file_stem, module, eur_regions)
        if named is None:
            return {"tgt": entry["tgt"], "eur": eur_rel, "module": module,
                     "size": entry["size"], "status": "unresolvable-filename",
                     "blockers": []}
        file_module, file_addr = module, named[1]
    else:
        _prefix, file_module, file_addr = parsed

    main_func_ref = SymbolRef(
        text=function_symbol_for(file_module, file_addr),
        kind="func", module=file_module, addr=file_addr,
    )
    consensus_cache: dict = {}
    main_res = resolve_symbol(
        main_func_ref, target, eur_regions, target_regions, target_data_symbols,
        find_siblings_fn, auto_promote_low=True, consensus_cache=consensus_cache,
    )

    data_addr_map: dict = {}
    if main_res.target_name is not None:
        eur_main_func = next((f for f in eur_regions.get(file_module, [])
                               if f.addr == file_addr), None)
        target_main_func = next((f for f in target_regions.get(file_module, [])
                                  if f.name == main_res.target_name), None)
        if eur_main_func and target_main_func:
            data_addr_map = derive_data_address_mapping(
                eur_main_func, target_main_func,
                eur_full_relocs.get(file_module, {}),
                target_full_relocs.get(file_module, {}),
            )

    refs = parse_symbols_in_source(source_text, default_module=module,
                                    named_functions=named_functions)
    refs[(main_func_ref.kind, main_func_ref.module, main_func_ref.addr)] = main_func_ref

    resolutions = []
    for ref in refs.values():
        if (ref.kind, ref.module, ref.addr) == (
                main_func_ref.kind, main_func_ref.module, main_func_ref.addr):
            resolutions.append(main_res)
        else:
            resolutions.append(resolve_symbol(
                ref, target, eur_regions, target_regions, target_data_symbols,
                find_siblings_fn, data_addr_map=data_addr_map,
                auto_promote_low=True, consensus_cache=consensus_cache,
                eur_data_kinds=eur_data_kinds,
            ))

    failed = [r for r in resolutions if FLOOR_RANK.get(r.confidence, 0) < FLOOR]
    failed = [r for r in failed if r.confidence not in ("EXACT_ADDR", "SYNTHESIZED")]

    if failed:
        blockers = [_blocker_dict(r) for r in failed]
        return {"tgt": entry["tgt"], "eur": eur_rel, "module": module,
                 "size": entry["size"], "status": "refused-floor",
                 "blockers": blockers}

    resolutions = repair_rename_collisions(
        resolutions, eur_regions, target_regions, find_siblings_fn, target)
    collisions = find_rename_collisions(resolutions)
    if collisions:
        blockers = [
            {**_blocker_dict(r), "notes": f"collision on target name {name}: {r.notes}"}
            for name, rs in collisions for r in rs
        ]
        return {"tgt": entry["tgt"], "eur": eur_rel, "module": module,
                 "size": entry["size"], "status": "refused-collision",
                 "blockers": blockers}

    if collect_new_symbols_txt_lines(resolutions):
        return {"tgt": entry["tgt"], "eur": eur_rel, "module": module,
                 "size": entry["size"], "status": "needs-symbol", "blockers": []}

    return {"tgt": entry["tgt"], "eur": eur_rel, "module": module,
             "size": entry["size"], "status": "clear", "blockers": []}


def _blocker_dict(r) -> dict:
    return {
        "text": r.eur_ref.text, "kind": r.eur_ref.kind,
        "module": r.eur_ref.module, "addr": f"0x{r.eur_ref.addr:08x}",
        "confidence": r.confidence, "notes": r.notes,
    }


# --------------------------------------------------------------------------- #
# PURE: reason classification + aggregation                                  #
# --------------------------------------------------------------------------- #

def reason_class(blocker: dict) -> str:
    """Classify one blocker dict (as produced by `_blocker_dict`) into a
    reason bucket describing WHY resolution stalled below HIGH, distinct
    from `batch_port.classify_port_refusal`'s coarser per-candidate
    confidence-shape classes."""
    notes = blocker["notes"]
    conf = blocker["confidence"]
    if "placeholder target twin" in notes:
        return "placeholder-twin"
    if "cross-region alias" in notes:
        return "cross-region-alias-refused"
    if blocker["kind"] == "data":
        return "data-unresolved-other"
    if "D2 v2 auto-promoted LOW" in notes and conf == "MEDIUM":
        return "func-medium-promoted-still-below-high"
    if "D2 v2 anti-match" in notes:
        return "func-low-anti-matched"
    if "D2 v2: no neighbor consensus" in notes:
        return "func-low-no-consensus"
    if "no candidate in" in notes:
        return "func-no-candidate-at-all"
    if "no EUR symbol at" in notes:
        return "func-no-eur-symbol"
    return f"other/{conf}"


def aggregate_blockers(refused: list[dict]) -> list[dict]:
    """Group every refused-floor candidate's blockers by the SPECIFIC
    (kind, module, addr) blocking symbol.

    `sole_*` counts a candidate only when that blocker is its ONLY blocker
    (a guaranteed unlock if that one symbol resolves). `total_*` counts
    every candidate the blocker merely appears in (an upper bound -- fixing
    it alone does not unlock a candidate that has other blockers too).
    Ranked by sole_bytes desc, then total_bytes desc.
    """
    by_key: dict[tuple[str, str, str], dict] = defaultdict(lambda: {
        "text": None, "candidates": set(), "bytes": 0,
        "sole_candidates": set(), "sole_bytes": 0,
        "confidences": Counter(), "reason_classes": Counter(),
    })
    for v in refused:
        tgt, size, blockers = v["tgt"], v["size"], v["blockers"]
        sole = len(blockers) == 1
        seen_keys = set()
        for b in blockers:
            key = (b["kind"], b["module"], b["addr"])
            if key in seen_keys:
                continue
            seen_keys.add(key)
            rec = by_key[key]
            rec["text"] = b["text"]
            if tgt not in rec["candidates"]:
                rec["candidates"].add(tgt)
                rec["bytes"] += size
            rec["confidences"][b["confidence"]] += 1
            rec["reason_classes"][reason_class(b)] += 1
            if sole and tgt not in rec["sole_candidates"]:
                rec["sole_candidates"].add(tgt)
                rec["sole_bytes"] += size

    out = []
    for (kind, module, addr), rec in by_key.items():
        out.append({
            "text": rec["text"], "kind": kind, "module": module, "addr": addr,
            "sole_candidates": len(rec["sole_candidates"]), "sole_bytes": rec["sole_bytes"],
            "total_candidates": len(rec["candidates"]), "total_bytes": rec["bytes"],
            "confidences": dict(rec["confidences"]),
            "reason_classes": dict(rec["reason_classes"]),
        })
    out.sort(key=lambda r: (-r["sole_bytes"], -r["total_bytes"]))
    return out


def sole_cause_rollup(refused: list[dict]) -> dict[str, dict[str, int]]:
    """Candidates with EXACTLY one blocker, grouped by that blocker's
    reason class -- the unambiguous ("this symbol alone is why") slice of
    the pool, as opposed to `aggregate_blockers`' per-symbol view."""
    out: dict[str, dict[str, int]] = defaultdict(lambda: {"candidates": 0, "bytes": 0})
    for v in refused:
        if len(v["blockers"]) == 1:
            rc = reason_class(v["blockers"][0])
            out[rc]["candidates"] += 1
            out[rc]["bytes"] += v["size"]
    return dict(out)


# --------------------------------------------------------------------------- #
# CLI driver (impure -- disk + region loading)                               #
# --------------------------------------------------------------------------- #

def _load_all(target: str):
    from find_region_siblings import find_siblings, load_region
    eur = load_region("eur")
    target_regions = load_region(target)
    target_data = load_region_data_symbols(target)
    eur_full_relocs = load_full_relocs("eur")
    target_full_relocs = load_full_relocs(target)
    eur_data_kinds = load_region_data_symbol_kinds("eur")
    named_functions = {
        f.name: (mod, f.addr)
        for mod, funcs in eur.items()
        for f in funcs
        if not is_placeholder_function_name(f.name)
    }
    return (eur, target_regions, target_data, eur_full_relocs,
            target_full_relocs, eur_data_kinds, named_functions, find_siblings)


def run(target: str, backlog_path: Path, limit: int | None = None) -> list[dict]:
    (eur, target_regions, target_data, eur_full_relocs, target_full_relocs,
     eur_data_kinds, named_functions, find_siblings) = _load_all(target)

    data = json.loads(backlog_path.read_text(encoding="utf-8"))
    backlog = data.get("backlog", {}).get(target, [])
    candidates = filter_sim1_backlog(backlog)
    if limit:
        candidates = candidates[:limit]

    out = []
    for entry in candidates:
        source_text = (ROOT / entry["eur"]).read_text(encoding="utf-8")
        out.append(classify_candidate(
            entry, source_text, target, eur, target_regions, target_data,
            eur_full_relocs, target_full_relocs, eur_data_kinds,
            named_functions, find_siblings,
        ))
    return out


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--target", required=True, choices=["usa", "jpn"])
    ap.add_argument("--backlog", type=Path, default=None,
                     help="override build/port_backlog.json path")
    ap.add_argument("--limit", type=int, default=None,
                     help="classify only the first N sim==1.0 candidates")
    ap.add_argument("--top", type=int, default=40,
                     help="how many ranked blockers to print (default 40)")
    args = ap.parse_args(argv)

    backlog_path = args.backlog or ROOT / "build" / "port_backlog.json"
    if not backlog_path.is_file():
        print(f"error: {backlog_path} not found -- run "
              f"`python tools/port_census.py` first", file=sys.stderr)
        return 2

    verdicts = run(args.target, backlog_path, limit=args.limit)
    status_counts = Counter(v["status"] for v in verdicts)
    print(f"{args.target}: {len(verdicts)} sim==1.0 candidates classified")
    print("status counts:", dict(status_counts))

    refused = [v for v in verdicts if v["status"] == "refused-floor"]
    if refused:
        ranked = aggregate_blockers(refused)
        print(f"\n{len(ranked)} distinct blocking symbols across "
              f"{len(refused)} refused-floor candidates "
              f"({sum(v['size'] for v in refused)} B)\n")
        header = (f"{'blocker':<28} {'kind/module':<14} {'sole(N/B)':<12} "
                  f"{'total(N/B)':<12} reason classes")
        print(header)
        for row in ranked[:args.top]:
            sole = f"{row['sole_candidates']}/{row['sole_bytes']}"
            total = f"{row['total_candidates']}/{row['total_bytes']}"
            print(f"{row['text']:<28} {row['kind']}/{row['module']:<9} "
                  f"{sole:<12} {total:<12} {row['reason_classes']}")

        rollup = sole_cause_rollup(refused)
        n_sole = sum(v["candidates"] for v in rollup.values())
        print(f"\nSOLE-cause rollup ({n_sole} of {len(refused)} candidates "
              f"have exactly 1 blocker):")
        for rc, agg in sorted(rollup.items(), key=lambda kv: -kv[1]["bytes"]):
            print(f"  {rc:<40} {agg['candidates']:>4}  {agg['bytes']:>6} B")

        blockers_out = ROOT / "build" / f"port_refusal_blockers_{args.target}.json"
        blockers_out.write_text(json.dumps(ranked, indent=1), encoding="utf-8")
        print("\nwrote", blockers_out)

    taxonomy_out = ROOT / "build" / f"port_refusal_taxonomy_{args.target}.json"
    taxonomy_out.write_text(json.dumps(verdicts, indent=1), encoding="utf-8")
    print("wrote", taxonomy_out)
    return 0


if __name__ == "__main__":
    sys.exit(main())
