#!/usr/bin/env python3
"""READ-ONLY measurement: does any signal beyond size+reloc fingerprinting
separate a CORRECT cross-region sibling resolution from an INCORRECT one?
(q-fingerprint-promotion-evidence)

`q-port-refusal-taxonomy` (#1586) found that 95.3% of USA port refusals are
blocked by a same-size, no-relocation reference the fingerprint matcher can
only place at MEDIUM-or-below, and judged this "not recommended for a fix"
— a judgement, not a measurement. This tool turns it into one, using two
labelled sets built from committed, already-verified artifacts:

- KNOWN-CORRECT (`build_known_correct_set`): every EUR function whose
  target-region twin is currently a committed `.c` file, found HIGH via the
  SAME `find_siblings` fingerprint the live tool uses. Every one of these
  was gated through `batch_port.py`'s `--confidence-floor HIGH` + a ROM
  SHA1 gate before being committed, so the chosen target address is proven
  correct by construction. ⚠️ This reconstruction has the SAME blind spot
  as the tool it measures: when two different EUR sources both
  fingerprint-guess the same already-shipped target address, this method
  cannot tell which one actually shipped there — `dedupe_known_correct`
  drops both sides of any such collision rather than guess (9 EUR pairs /
  18 rows dropped as of the 2026-08-28 snapshot; see the research doc).
- KNOWN-WRONG (`KNOWN_WRONG`): 2 hand-verified historical incidents where
  the fingerprint matcher's own top pick was later proven wrong and
  corrected by hand — see each entry's `source` for the primary doc.

This tool NEVER writes to `src/`, NEVER runs `port_to_region.py`'s CLI (it
reuses its pure `resolve_symbol` function purely for measurement, exactly
like `port_refusal_taxonomy.py` does), and implements no promotion — see
`docs/research/campaign-analytics/fingerprint-signal-evidence.md` for the
full measurement and verdict.

    python tools/fingerprint_signal_evidence.py
    python tools/fingerprint_signal_evidence.py --live-refusals usa
"""
from __future__ import annotations

import argparse
import json
import re
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(Path(__file__).resolve().parent))

from port_to_region import (  # noqa: E402
    SymbolRef,
    is_placeholder_function_name,
    load_full_relocs,
    load_region_data_symbol_kinds,
    load_region_data_symbols,
    resolve_symbol,
    verified_neighbor_signal,
)

# verified_neighbor_signal imported from port_to_region, NOT duplicated here
# (cm-verified-neighbor-drain, reversing cm-verified-neighbor-tranche's
# earlier "keep two copies, this one is frozen evidence" call — FLOOR_RANK's
# own two copies had already drifted once before that precedent, and it cut
# the same way here). This file's two call sites below adapt to
# port_to_region's canonical (eur_addr, module, eur_regions, ...) signature
# by wrapping their pre-sliced per-module list in a single-key
# {module: [...]} dict -- `eur_regions.get(module, [])` inside the canonical
# function then returns exactly that list back out, so this is a pure
# calling-convention adapter, not an algorithm change. Verified
# before/after on the same tree: identical hard-population accuracy
# (2,974/2,974) and identical known-wrong accuracy (4/4).

CALL_KINDS = ("arm_call", "arm_call_thumb")
DATA_KINDS = ("load",)
REF_KINDS = CALL_KINDS + DATA_KINDS

# --------------------------------------------------------------------------- #
# Known-wrong set — hand-verified against primary docs (see each `source`).
# Both are historical incidents already corrected by hand; kept here as
# ground truth for measurement, not as evidence of a live bug.
# --------------------------------------------------------------------------- #

KNOWN_WRONG = [
    {
        "eur_module": "main", "eur_addr": 0x0209bb60, "size": 0x44,
        "wrong_target": {"usa": 0x0209bb2c, "jpn": 0x0209bb2c},
        "correct_target": {"usa": 0x0209ba6c, "jpn": 0x0209ba6c},
        "source": "docs/research/brief-673-epilogue-resweep-3.md:205-219",
        "note": ("func_0209bb60/func_0209bc20 sibling pair (identical shape, "
                 "shared callees, only their self-relative 'call my own "
                 "successor' edge differs) both auto-resolved to "
                 "func_0209bb2c at HIGH confidence; func_0209bc20's own "
                 "match to func_0209bb2c was independently confirmed "
                 "correct by the same neighbor-shift check. Still live "
                 "today: `find_siblings` still ranks func_0209bb2c top for "
                 "func_0209bb60 (verified by this tool's own already-"
                 "ported scan colliding on it)."),
    },
    {
        "eur_module": "main", "eur_addr": 0x020a73e8, "size": 0x2c,
        "wrong_target": {"usa": 0x020a7320, "jpn": 0x020a7320},
        "correct_target": {"usa": 0x020a72f4, "jpn": 0x020a72f4},
        "source": "docs/research/brief-675-main-128-drain.md:99-118",
        "note": ("func_020a73e8/func_020a7414 adjacent same-size pair (zero "
                 "relocations each — pure leaf functions) both "
                 "auto-resolved to func_020a7320; func_020a7414's own "
                 "match to func_020a7320 was correct. Not reproducible via "
                 "this tool's live already-ported scan today (the hand-"
                 "written correction no longer fingerprints as a HIGH "
                 "byte-identical match at all, so it never entered the "
                 "already-ported census) — used here purely as documented "
                 "historical ground truth."),
    },
]


# --------------------------------------------------------------------------- #
# PURE helpers
# --------------------------------------------------------------------------- #

def function_targets(module: str, addr: int, size: int, full_relocs: dict,
                      kinds: tuple[str, ...]) -> set[tuple[str, int]]:
    """Every (to_module, to_addr) a function's own instructions reference,
    restricted to reloc `kinds` (CALL_KINDS, DATA_KINDS, or REF_KINDS)."""
    out: set[tuple[str, int]] = set()
    relocs_by_from = full_relocs.get(module, {})
    for off in range(0, size, 2):
        for kind, to_addr, to_mod in relocs_by_from.get(addr + off, []):
            if kind in kinds:
                out.add((to_mod, to_addr))
    return out


def dedupe_known_correct(rows: list[dict]) -> tuple[list[dict], list[dict]]:
    """Split `rows` into (clean, dropped). Two different EUR addresses
    fingerprint-guessing the SAME (region, module, tgt_addr) is this
    reconstruction's own version of the bug under study — this method
    cannot tell which EUR source actually shipped there, so both sides of
    any such collision are dropped rather than guessed. Exact duplicate
    rows (same region+eur_addr+tgt_addr recorded twice, a `scan_eur_tree`
    dual-discovery-path artifact) are silently deduplicated, not dropped."""
    seen: set[tuple] = set()
    unique: list[dict] = []
    for r in rows:
        key = (r["region"], r["eur_module"], r["eur_addr"], r["tgt_addr"])
        if key in seen:
            continue
        seen.add(key)
        unique.append(r)

    by_target: dict[tuple, set[int]] = defaultdict(set)
    for r in unique:
        by_target[(r["region"], r["eur_module"], r["tgt_addr"])].add(r["eur_addr"])
    collided_targets = {k for k, v in by_target.items() if len(v) > 1}

    clean, dropped = [], []
    for r in unique:
        key = (r["region"], r["eur_module"], r["tgt_addr"])
        (dropped if key in collided_targets else clean).append(r)
    return clean, dropped


def call_graph_signal(
    eur_targets: set[tuple[str, int]],
    candidates: list[tuple[str, int]],
    verified_region_target_index: dict[tuple[str, int], int],
    candidate_target_fn,
) -> dict:
    """Score each candidate by how many of the EUR function's OWN reference
    targets (calls and/or data reads) are independently verified in THIS
    target region (via `verified_region_target_index`, keyed
    `(eur_module, eur_addr) -> tgt_addr` for ONE region) AND also appear
    among that candidate's own reference targets in the same region.

    This never compares an EUR address to a target address directly —
    every EUR reference is first translated through the verified index (a
    ground-truth EUR->target mapping from an already-shipped port) before
    being compared against a candidate's own target-region references. A
    reference with no verified translation contributes no evidence either
    way (it is simply dropped, not counted as a mismatch). Abstains
    (`predicted=None`) if no candidate scores > 0, or if the top score is
    tied across candidates.
    """
    verified_callee_targets: set[tuple[str, int]] = set()
    for (to_mod, to_addr) in eur_targets:
        tgt_addr = verified_region_target_index.get((to_mod, to_addr))
        if tgt_addr is not None:
            verified_callee_targets.add((to_mod, tgt_addr))

    scores: dict[tuple[str, int], int] = {}
    for cand in candidates:
        cand_targets = candidate_target_fn(*cand)
        scores[cand] = len(verified_callee_targets & cand_targets)
    best = max(scores.values(), default=0)
    winners = [c for c, s in scores.items() if s == best and best > 0]
    return {
        "scores": scores,
        "predicted": winners[0] if len(winners) == 1 else None,
        "tied": len(winners) > 1,
        "evidence_count": best,
        "verified_eur_targets": len(verified_callee_targets),
        "total_eur_targets": len(eur_targets),
    }


def exact_name_signal(eur_name: str, target_name_index: dict[str, int]) -> int | None:
    """A named (non-placeholder) EUR symbol whose exact name is already
    committed in the target region's own symbols.txt — ground truth, not a
    guess. None if the EUR symbol has no real name, or the name isn't
    found."""
    if is_placeholder_function_name(eur_name):
        return None
    return target_name_index.get(eur_name)


def cross_region_agreement_signal(
    usa_top_addr: int | None, jpn_top_addr: int | None, eur_addr: int,
) -> str:
    """Do independently-computed USA and JPN top candidates imply the SAME
    EUR->target address shift? 'agree' / 'disagree' / 'unavailable'."""
    if usa_top_addr is None or jpn_top_addr is None:
        return "unavailable"
    return "agree" if (usa_top_addr - eur_addr) == (jpn_top_addr - eur_addr) else "disagree"


# --------------------------------------------------------------------------- #
# Driver (impure — disk + region loading)
# --------------------------------------------------------------------------- #

def raw_top_guess(fn, target_region_funcs: list, find_siblings, region_name: str) -> int | None:
    """`find_siblings`' own top-ranked candidate address, at ANY
    confidence tier (including LOW) — the raw, possibly-wrong fingerprint
    guess, as opposed to `verified_index`'s proven-correct mapping. None
    if no same-size candidate exists at all."""
    same_size = [c for c in target_region_funcs if c.size == fn.size]
    if not same_size:
        return None
    matches = find_siblings(fn, {fn.module: same_size}, max_results=1,
                             source_region="eur", target_region_name=region_name,
                             byte_disambiguate=True)
    return matches[0].func.addr if matches else None


def _load_all():
    from find_region_siblings import find_siblings, load_region
    eur = load_region("eur")
    target_regions = {"usa": load_region("usa"), "jpn": load_region("jpn")}
    eur_full_relocs = load_full_relocs("eur")
    target_full_relocs = {r: load_full_relocs(r) for r in ("usa", "jpn")}
    return eur, target_regions, eur_full_relocs, target_full_relocs, find_siblings


def build_known_correct_set(eur, target_regions, find_siblings) -> list[dict]:
    """Every EUR function whose target twin is ALREADY a committed `.c`
    file, found HIGH via the same `find_siblings` fingerprint the live
    tool uses. Reuses `port_census.py`'s own tree scanners so
    "already-ported" is determined identically to the live census.
    Callers should pass this through `dedupe_known_correct` before
    treating it as ground truth."""
    import port_census as pc
    pc.ROOT = ROOT
    eur_c, _ = pc.scan_eur_tree(ROOT / "src")
    target_files = {r: pc.scan_tree(ROOT / "src" / r)[0] for r in ("usa", "jpn")}

    eur_idx = {(f.module, f.addr): f for funcs in eur.values() for f in funcs}
    buckets: dict[str, dict] = {r: defaultdict(list) for r in ("usa", "jpn")}
    for r, reg in target_regions.items():
        for mod, funcs in reg.items():
            for f in funcs:
                buckets[r][(mod, f.size)].append(f)

    out = []
    for mod, addr, path in eur_c:
        fn = eur_idx.get((mod, addr))
        if fn is None:
            continue
        for rname in ("usa", "jpn"):
            fake_region = {mod: buckets[rname].get((mod, fn.size), [])}
            matches = find_siblings(fn, fake_region, max_results=5,
                                     source_region="eur",
                                     target_region_name=rname,
                                     byte_disambiguate=True)
            if not matches or matches[0].confidence != "HIGH":
                continue
            top = matches[0]
            kinds = target_files[rname].get((mod, top.func.addr))
            if kinds and "c" in kinds:
                out.append({
                    "eur_module": mod, "eur_addr": addr,
                    "eur_path": str(path.relative_to(ROOT)),
                    "region": rname, "tgt_addr": top.func.addr,
                    "tgt_name": top.func.name, "confidence": top.confidence,
                    "rationale": top.rationale, "n_candidates": len(matches),
                    "candidate_addrs": [m.func.addr for m in matches],
                })
    return out


def _reloc_count(module: str, addr: int, size: int, full_relocs: dict) -> int:
    return len(function_targets(module, addr, size, full_relocs, REF_KINDS))


def evaluate_row(
    *, module: str, eur_addr: int, size: int, region: str,
    true_target: int, candidates: list[int],
    eur_full_relocs: dict, target_full_relocs: dict,
    eur_functions_sorted: list, eur_name: str | None,
    verified_region_target_index: dict[tuple[str, int], int],
    target_name_index: dict[str, int],
    usa_raw_top: int | None, jpn_raw_top: int | None,
) -> dict:
    """Run every signal on one (module, eur_addr) -> region resolution and
    report whether each one's prediction equals `true_target`."""
    eur_refs = function_targets(module, eur_addr, size, eur_full_relocs, REF_KINDS)
    cand_pairs = [(module, a) for a in candidates]

    def cand_target_fn(mod: str, addr: int) -> set[tuple[str, int]]:
        return function_targets(mod, addr, size, target_full_relocs, REF_KINDS)

    cg = call_graph_signal(eur_refs, cand_pairs, verified_region_target_index, cand_target_fn)
    cg_pred = cg["predicted"][1] if cg["predicted"] else None

    vn_pred, vn_shifts = verified_neighbor_signal(
        eur_addr, module, {module: eur_functions_sorted},
        verified_region_target_index)
    vn_pred_valid = vn_pred if vn_pred in candidates else None

    name_pred = exact_name_signal(eur_name, target_name_index) if eur_name else None

    cra = cross_region_agreement_signal(usa_raw_top, jpn_raw_top, eur_addr)

    return {
        "module": module, "eur_addr": eur_addr, "region": region,
        "true_target": true_target, "candidates": candidates,
        "n_candidates": len(candidates),
        "call_graph": {"predicted": cg_pred, "correct": cg_pred == true_target if cg_pred else None,
                        "evidence_count": cg["evidence_count"], "tied": cg["tied"],
                        "verified_eur_targets": cg["verified_eur_targets"],
                        "total_eur_targets": cg["total_eur_targets"]},
        "verified_neighbor": {"predicted": vn_pred_valid,
                               "correct": vn_pred_valid == true_target if vn_pred_valid else None,
                               "raw_predicted": vn_pred, "n_shifts_sampled": len(vn_shifts)},
        "exact_name": {"predicted": name_pred,
                        "correct": name_pred == true_target if name_pred else None},
        "cross_region_agreement": cra,
    }


def evaluate_live_refusals(
    target: str, eur, target_regions, eur_full_relocs, target_full_relocs,
    eur_sorted: dict, verified_index: dict, find_siblings,
) -> dict:
    """Exploratory extension, NOT part of the labelled-set measurement
    above: apply `verified_neighbor_signal` to every DISTINCT `func`-kind
    blocking symbol in the CURRENT live refusal population (reusing
    `port_refusal_taxonomy.py`'s own `classify_candidate`, unmodified) and
    report how many get a confident prediction, and whether that
    prediction AGREES with the symbol's current best (possibly MEDIUM/LOW)
    guess or points somewhere DIFFERENT. There is no ground truth for
    these — they are, by definition, still unresolved — so this reports
    COVERAGE and AGREEMENT only, never "correct"/"accuracy". Call-out:
    this snapshot is a live, moving population (see module docstring on
    provisional snapshots) — the driver stamps it with the census
    timestamp it was read from.
    """
    from batch_port import filter_sim1_backlog
    from port_refusal_taxonomy import classify_candidate

    backlog_path = ROOT / "build" / "port_backlog.json"
    if not backlog_path.is_file():
        return {"error": f"{backlog_path} not found — run port_census.py first"}
    data = json.loads(backlog_path.read_text(encoding="utf-8"))
    candidates = filter_sim1_backlog(data.get("backlog", {}).get(target, []))

    named_functions = {
        f.name: (mod, f.addr)
        for mod, funcs in eur.items() for f in funcs
        if not is_placeholder_function_name(f.name)
    }
    target_data = load_region_data_symbols(target)
    eur_data_kinds = load_region_data_symbol_kinds("eur")

    verdicts = []
    for entry in candidates:
        source_text = (ROOT / entry["eur"]).read_text(encoding="utf-8")
        verdicts.append(classify_candidate(
            entry, source_text, target, eur, target_regions[target], target_data,
            eur_full_relocs, target_full_relocs[target], eur_data_kinds,
            named_functions, find_siblings,
        ))
    refused = [v for v in verdicts if v["status"] == "refused-floor"]

    distinct: dict[tuple[str, int], dict] = {}
    for v in refused:
        for b in v["blockers"]:
            if b["kind"] != "func":
                continue
            key = (b["module"], int(b["addr"], 16))
            distinct.setdefault(key, b)

    eur_idx = {(f.module, f.addr): f for funcs in eur.values() for f in funcs}
    rows = []
    for (mod, addr), b in distinct.items():
        fn = eur_idx.get((mod, addr))
        if fn is None:
            continue
        vn_pred, vn_shifts = verified_neighbor_signal(
            addr, mod, {mod: eur_sorted[mod]}, verified_index[target])
        current = resolve_symbol(
            SymbolRef(text=b["text"], kind="func", module=mod, addr=addr),
            target, eur, target_regions[target], target_data, find_siblings,
            auto_promote_low=True,
        )
        current_addr = None
        if current.target_name:
            # Matches the address-keyed form (func_XXXXXXXX / func_ovNNN_
            # XXXXXXXX) that the vast majority of unresolved targets still
            # carry; a real (already-renamed) target name has no trailing
            # address to extract and is correctly left as None here.
            m = re.search(r"_([0-9a-fA-F]{8})$", current.target_name)
            if m:
                current_addr = int(m.group(1), 16)
        rows.append({
            "text": b["text"], "module": mod, "addr": addr,
            "current_confidence": current.confidence,
            "current_target_addr": current_addr,
            "verified_neighbor_predicted": vn_pred,
            "n_shifts_sampled": len(vn_shifts),
            "agrees_with_current": (
                vn_pred == current_addr if vn_pred is not None and current_addr is not None
                else None
            ),
        })
    return {
        "target": target, "refused_candidates": len(refused),
        "distinct_func_blockers": len(distinct), "rows": rows,
    }


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--hard-max-relocs", type=int, default=1,
                     help="max total relocs (calls+loads) for the 'hard' "
                          "evaluation population (default 1)")
    ap.add_argument("--live-refusals", choices=["usa", "jpn"], default=None,
                     help="also measure coverage/agreement (NOT accuracy — "
                          "no ground truth) against the CURRENT live "
                          "refusal population for this region; requires a "
                          "fresh build/port_backlog.json (run "
                          "port_census.py first)")
    ap.add_argument("--out-dir", type=Path, default=ROOT / "build")
    args = ap.parse_args(argv)

    eur, target_regions, eur_full_relocs, target_full_relocs, find_siblings = _load_all()

    print("building known-correct set (re-derives the already-ported "
          "census, ~1 min)...", file=sys.stderr)
    known_correct_raw = build_known_correct_set(eur, target_regions, find_siblings)
    known_correct, dropped_collisions = dedupe_known_correct(known_correct_raw)
    print(f"known-correct: {len(known_correct_raw)} raw rows -> "
          f"{len(known_correct)} clean, {len(dropped_collisions)} dropped "
          f"as unresolved fingerprint-collisions in this reconstruction")

    args.out_dir.mkdir(parents=True, exist_ok=True)
    (args.out_dir / "known_correct_set.json").write_text(
        json.dumps(known_correct, indent=1), encoding="utf-8")
    (args.out_dir / "known_correct_dropped_collisions.json").write_text(
        json.dumps(dropped_collisions, indent=1), encoding="utf-8")
    (args.out_dir / "known_wrong_set.json").write_text(
        json.dumps(KNOWN_WRONG, indent=1), encoding="utf-8")

    verified_index = {r: {} for r in ("usa", "jpn")}
    for row in known_correct:
        verified_index[row["region"]][(row["eur_module"], row["eur_addr"])] = row["tgt_addr"]

    target_name_index = {r: {} for r in ("usa", "jpn")}
    for r, reg in target_regions.items():
        for funcs in reg.values():
            for f in funcs:
                if not is_placeholder_function_name(f.name):
                    target_name_index[r][f.name] = f.addr

    eur_sorted = {mod: sorted(funcs, key=lambda f: f.addr) for mod, funcs in eur.items()}
    eur_name_by_addr = {(f.module, f.addr): f.name for funcs in eur.values() for f in funcs}
    eur_idx = {(f.module, f.addr): f for funcs in eur.values() for f in funcs}

    reloc_count_cache: dict[tuple[str, int], int] = {}

    def reloc_count(mod: str, addr: int) -> int:
        key = (mod, addr)
        if key not in reloc_count_cache:
            fn = eur_idx[key]
            reloc_count_cache[key] = _reloc_count(mod, addr, fn.size, eur_full_relocs)
        return reloc_count_cache[key]

    hard_pop = [
        r for r in known_correct
        if r["n_candidates"] >= 2
        and reloc_count(r["eur_module"], r["eur_addr"]) <= args.hard_max_relocs
    ]
    print(f"'hard' population (n_candidates>=2, total relocs<="
          f"{args.hard_max_relocs}): {len(hard_pop)} rows")

    results = {"hard": [], "easy_sample": [], "known_wrong": []}

    for row in hard_pop:
        fn = eur_idx[(row["eur_module"], row["eur_addr"])]
        region = row["region"]
        usa_top = raw_top_guess(fn, target_regions["usa"].get(row["eur_module"], []),
                                 find_siblings, "usa")
        jpn_top = raw_top_guess(fn, target_regions["jpn"].get(row["eur_module"], []),
                                 find_siblings, "jpn")
        results["hard"].append(evaluate_row(
            module=row["eur_module"], eur_addr=row["eur_addr"], size=fn.size,
            region=region, true_target=row["tgt_addr"],
            candidates=row["candidate_addrs"],
            eur_full_relocs=eur_full_relocs,
            target_full_relocs=target_full_relocs[region],
            eur_functions_sorted=eur_sorted[row["eur_module"]],
            eur_name=eur_name_by_addr.get((row["eur_module"], row["eur_addr"])),
            verified_region_target_index=verified_index[region],
            target_name_index=target_name_index[region],
            usa_raw_top=usa_top, jpn_raw_top=jpn_top,
        ))

    for kw in KNOWN_WRONG:
        fn = eur_idx.get((kw["eur_module"], kw["eur_addr"]))
        if fn is None:
            print(f"warning: known-wrong EUR function at "
                  f"{kw['eur_module']}/0x{kw['eur_addr']:08x} not found",
                  file=sys.stderr)
            continue
        for region in ("usa", "jpn"):
            fake_region = {kw["eur_module"]: [
                c for c in target_regions[region].get(kw["eur_module"], [])
                if c.size == fn.size
            ]}
            matches = find_siblings(fn, fake_region, max_results=10,
                                     source_region="eur",
                                     target_region_name=region,
                                     byte_disambiguate=True)
            candidates = [m.func.addr for m in matches]
            if kw["correct_target"][region] not in candidates:
                candidates.append(kw["correct_target"][region])
            usa_top = raw_top_guess(fn, target_regions["usa"].get(kw["eur_module"], []),
                                     find_siblings, "usa")
            jpn_top = raw_top_guess(fn, target_regions["jpn"].get(kw["eur_module"], []),
                                     find_siblings, "jpn")
            ev = evaluate_row(
                module=kw["eur_module"], eur_addr=kw["eur_addr"], size=fn.size,
                region=region, true_target=kw["correct_target"][region],
                candidates=candidates,
                eur_full_relocs=eur_full_relocs,
                target_full_relocs=target_full_relocs[region],
                eur_functions_sorted=eur_sorted[kw["eur_module"]],
                eur_name=eur_name_by_addr.get((kw["eur_module"], kw["eur_addr"])),
                verified_region_target_index=verified_index[region],
                target_name_index=target_name_index[region],
                usa_raw_top=usa_top, jpn_raw_top=jpn_top,
            )
            ev["wrong_target_originally_picked"] = kw["wrong_target"][region]
            ev["source"] = kw["source"]
            results["known_wrong"].append(ev)

    def summarize(rows: list[dict], label: str) -> None:
        print(f"\n=== {label} (n={len(rows)}) ===")
        for sig in ("call_graph", "verified_neighbor", "exact_name"):
            covered = [r for r in rows if r[sig]["predicted"] is not None]
            correct = [r for r in covered if r[sig]["correct"]]
            cov_pct = 100 * len(covered) / len(rows) if rows else 0
            acc_pct = 100 * len(correct) / len(covered) if covered else float("nan")
            print(f"  {sig:<18} coverage={len(covered)}/{len(rows)} "
                  f"({cov_pct:.1f}%)  accuracy-when-covered="
                  f"{len(correct)}/{len(covered)} ({acc_pct:.1f}%)")
        cra_counts = Counter(r["cross_region_agreement"] for r in rows)
        print(f"  cross_region_agreement: {dict(cra_counts)}")

    summarize(results["hard"], "HARD population (ambiguous, <=1 reloc)")
    summarize(results["known_wrong"], "KNOWN-WRONG cases")

    print("\n=== KNOWN-WRONG per-case detail ===")
    for r in results["known_wrong"]:
        print(f"  {r['module']}/0x{r['eur_addr']:08x} [{r['region']}] "
              f"true=0x{r['true_target']:08x} "
              f"originally-wrong=0x{r['wrong_target_originally_picked']:08x}")
        for sig in ("call_graph", "verified_neighbor", "exact_name"):
            p = r[sig]["predicted"]
            p_str = f"0x{p:08x}" if p else "abstain"
            print(f"    {sig:<18} predicted={p_str} correct={r[sig]['correct']}")
        print(f"    cross_region_agreement={r['cross_region_agreement']}")

    if args.live_refusals:
        print(f"\nmeasuring live refusal coverage for {args.live_refusals} "
              f"(exploratory — no ground truth, coverage/agreement only)...",
              file=sys.stderr)
        live = evaluate_live_refusals(
            args.live_refusals, eur, target_regions, eur_full_relocs,
            target_full_relocs, eur_sorted, verified_index, find_siblings,
        )
        results["live_refusals"] = live
        if "error" in live:
            print(f"live-refusals: {live['error']}")
        else:
            n = live["distinct_func_blockers"]
            covered = [r for r in live["rows"] if r["verified_neighbor_predicted"] is not None]
            agree = [r for r in covered if r["agrees_with_current"] is True]
            disagree = [r for r in covered if r["agrees_with_current"] is False]
            print(f"\n=== LIVE {args.live_refusals.upper()} refusals "
                  f"({live['refused_candidates']} refused candidates, "
                  f"{n} distinct func-kind blockers) ===")
            print(f"  verified_neighbor coverage: {len(covered)}/{n} "
                  f"({100*len(covered)/n:.1f}%)" if n else "  no func-kind blockers")
            print(f"  of covered: agrees with current best guess "
                  f"{len(agree)}, DISAGREES {len(disagree)}, "
                  f"unknown-current {len(covered)-len(agree)-len(disagree)}")
            if disagree:
                print("  disagreement cases (verified_neighbor predicts a "
                      "DIFFERENT address than the current best guess):")
                for r in disagree:
                    print(f"    {r['text']} [{r['module']}] current=0x"
                          f"{r['current_target_addr']:08x} "
                          f"({r['current_confidence']}) verified_neighbor="
                          f"0x{r['verified_neighbor_predicted']:08x}")

    out = args.out_dir / "fingerprint_signal_evidence.json"
    out.write_text(json.dumps(results, indent=1), encoding="utf-8")
    print(f"\nwrote {out}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
