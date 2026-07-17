#!/usr/bin/env python3

"""
sig_census.py — read-only `dsd sig new` / `sig apply --dry` census
prototype (brief 569 / improvement-swarm r4 A1).

Two measurements, both strictly read-only (never writes delinks.txt,
symbols.txt, or the ROM — `sig apply` is always invoked with `--dry`):

  1. INTERNAL CLONE CENSUS. For a sample of already-matched EUR
     functions, generate a byte-signature (`sig new`) and dry-apply it
     back against EUR's own whole-program config (main + all
     overlays, loaded together from one config.yaml). `dsd`'s
     `Signatures::apply` requires an UNAMBIGUOUS single match to do
     anything observable — and the source function is always present
     in its own region's search space — so this can only report a
     BOOLEAN "at least one additional clone exists somewhere in EUR"
     signal (via the `Multiple matching functions found` log line),
     never the clone's exact address. Confirmed empirically: applying
     a known 8-member VRAM-family member's signature back against EUR
     reliably reports "Multiple matching functions found" instead of
     naming the siblings. See the brief-569 report for the full
     writeup of why (masking makes many of our existing "sibling
     family" clusters byte-identical once bl-targets and pool
     constants are masked out).

  2. REGION-TWIN MAP. For the same sample, dry-apply the EUR signature
     against USA's and JPN's whole-program configs. Since the EUR
     source function itself isn't in those regions' search spaces, an
     unambiguous match reliably resolves to the exact twin address
     (parsed from the `Renamed function at 0xADDR ... to 'NAME'` log
     line) — UNLESS the EUR source belongs to a masked-identical
     sibling family (see #1), in which case the *whole family*
     matches in the target region too and the twin is similarly
     ambiguous (`Multiple matching functions found`). Verified against
     two independent known-ground-truth pairs from this campaign
     (func_0208f850 EUR -> USA, part of an 8-member family: correctly
     reports MultipleFound; func_02089134 EUR -> func_0208904c USA,
     a family-of-1: correctly resolves the exact address).

Guardrails (r3/r4, this brief):
  - Read-only measurement only — no delinks.txt/symbols.txt writes,
    no `--all` (`sig apply -a` would still be `--dry` here, but this
    tool never passes `-a`; it always targets one signature at a
    time so results stay attributable to a single sample function).
  - Skips tiny functions (`--min-size`, default 0x20 bytes) — small
    stub-shaped functions are far more prone to coincidental
    byte-pattern collisions.
  - `sig new`/`sig apply` operate via `-c <config.yaml>` (the whole
    ROM's module structure), not per-TU `.o` files, so the "linked
    arm9.o panics objdiff-cli" gotcha from brief 187/206 doesn't apply
    to this specific pair of subcommands.

Usage:
    python tools/sig_census.py --sample-size 40 \
        --out docs/research/sig-census-results.json

    # Cross-validate region-twin hits against port_to_region.py's
    # independent reloc-signature resolution (false-positive check):
    python tools/sig_census.py --sample-size 40 --cross-validate
"""

from __future__ import annotations

import argparse
import json
import random
import re
import subprocess
import sys
import time
from dataclasses import dataclass, field
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(Path(__file__).resolve().parent))
from get_platform import get_platform  # noqa: E402
from progress import parse_delinks_file  # noqa: E402
# brief 587: this tuple was the "seed" tools/routing_suffixes.py was
# promoted from (it predates the Thumb tier's other 3 consumers going
# stale) — now imports back from the shared module instead of keeping
# its own copy, so there is exactly one definition repo-wide.
from routing_suffixes import ROUTING_SUFFIXES as _ROUTING_SUFFIXES  # noqa: E402

_RENAME_FN_RE = re.compile(
    r"Renamed function at (0x[0-9a-fA-F]+) in (.+?) to '([^']+)'"
)
_RENAME_SYM_RE = re.compile(
    r"Renamed symbol at (0x[0-9a-fA-F]+) in (.+?) to '([^']+)'"
)
_NOT_FOUND_RE = re.compile(r"No matching function found")
_MULTIPLE_RE = re.compile(r"Multiple matching functions found")

_DSD_TIMEOUT_S = 30


def dsd_bin() -> Path:
    plat = get_platform()
    exe = plat.exe if plat else ""
    return ROOT / f"dsd{exe}"


# --------------------------------------------------------------------------- #
# Sampling — reuse the canonical delinks.txt parser (brief 566)
# --------------------------------------------------------------------------- #


def unit_symbol_name(source: str) -> str:
    """Derive the function symbol name from a TU's source path,
    stripping the file extension and any .legacy/.legacy_sp3/.thumb
    infix. Mirrors (and extends — see brief-569 report) .claude/hooks/
    post_edit.py's _unit_and_symbol (brief 566) — decomper convention
    keeps the filename in sync with the symbol name for both
    address-named (func_X) and renamed functions."""
    stem = Path(source).stem
    for suf in _ROUTING_SUFFIXES:
        if stem.endswith(suf):
            stem = stem[: -len(suf)]
            break
    return stem


def module_label(delinks_rel: Path) -> str:
    """'arm9/delinks.txt' -> 'main'; 'arm9/overlays/ov005/delinks.txt'
    -> 'ov005'; anything else -> the parent dir name, best-effort."""
    parts = delinks_rel.parts
    if "overlays" in parts:
        idx = parts.index("overlays")
        if idx + 1 < len(parts):
            return parts[idx + 1]
    if len(parts) >= 2 and parts[-2] == "arm9":
        return "main"
    return delinks_rel.parent.name or "main"


def sample_matched_functions(
    config_dir: Path, n: int, min_size: int, seed: int
) -> list[dict]:
    """Sample up to `n` already-matched (.c/.cpp, status==complete)
    functions across every config_dir/**/delinks.txt, skipping any
    whose .text size is below `min_size`. Deterministic given `seed`."""
    candidates: list[dict] = []
    for delinks in sorted(config_dir.rglob("delinks.txt")):
        _module_sections, tus = parse_delinks_file(delinks)
        for tu in tus:
            source = tu.get("source", "")
            if not (source.endswith(".c") or source.endswith(".cpp")):
                continue
            if tu.get("status") != "complete":
                continue
            text_sections = [
                (s, e) for name, s, e in tu.get("sections", []) if name == ".text"
            ]
            if not text_sections:
                continue
            start = min(s for s, _ in text_sections)
            end = max(e for _, e in text_sections)
            size = end - start
            if size < min_size:
                continue
            candidates.append({
                "name": unit_symbol_name(source),
                "addr": start,
                "size": size,
                "module": module_label(delinks.relative_to(config_dir)),
                "source": source,
            })
    rng = random.Random(seed)
    rng.shuffle(candidates)
    return candidates[:n]


# --------------------------------------------------------------------------- #
# dsd sig new / sig apply --dry wrappers
# --------------------------------------------------------------------------- #


def sig_new(config_yaml: Path, function_name: str) -> str | None:
    """Run `dsd sig new`, return the raw signature YAML text verbatim
    (never parsed in Python — just captured and later handed back to
    `sig apply -s`), or None on failure."""
    try:
        proc = subprocess.run(
            [str(dsd_bin()), "sig", "new", "-c", str(config_yaml),
             "-f", function_name],
            cwd=str(ROOT), capture_output=True, text=True,
            timeout=_DSD_TIMEOUT_S,
        )
    except (subprocess.TimeoutExpired, OSError):
        return None
    if proc.returncode != 0 or not proc.stdout.strip():
        return None
    return proc.stdout


@dataclass
class ApplyOutcome:
    # "applied_rename" | "applied_noop" | "not_found" | "multiple" | "error"
    kind: str
    renamed_function: tuple[str, str, str] | None = None  # (addr, module, name)
    renamed_symbols: list[tuple[str, str, str]] = field(default_factory=list)
    raw: str = ""


def parse_apply_output(returncode: int, combined_output: str) -> ApplyOutcome:
    """Classify a `dsd -d sig apply --dry` outcome by parsing its log
    output (pure — no subprocess/filesystem I/O, so this is unit-
    testable on captured text directly). `sig apply` prints nothing
    extra on a self-consistent match (already correctly named), an
    explicit error on ambiguity/no-match, or a "Renamed function..."
    line (still fires under --dry, since only the final file WRITE is
    skipped, not the in-memory rename+log) when the match resolves to
    a different address than its current name."""
    fn_match = _RENAME_FN_RE.search(combined_output)
    sym_matches = _RENAME_SYM_RE.findall(combined_output)
    if fn_match:
        return ApplyOutcome(
            "applied_rename",
            (fn_match.group(1), fn_match.group(2), fn_match.group(3)),
            sym_matches, combined_output,
        )
    if _MULTIPLE_RE.search(combined_output):
        return ApplyOutcome("multiple", raw=combined_output)
    if _NOT_FOUND_RE.search(combined_output):
        return ApplyOutcome("not_found", raw=combined_output)
    if returncode != 0:
        return ApplyOutcome("error", raw=combined_output)
    return ApplyOutcome("applied_noop", raw=combined_output)


def sig_apply_dry(config_yaml: Path, sig_yaml_text: str, scratch_dir: Path) -> ApplyOutcome:
    """Run `dsd -d sig apply --dry` with the given (already-generated)
    signature text against `config_yaml` and classify the outcome via
    parse_apply_output()."""
    scratch_dir.mkdir(parents=True, exist_ok=True)
    sig_path = scratch_dir / "probe.sig.yaml"
    sig_path.write_text(sig_yaml_text, encoding="utf-8")
    try:
        proc = subprocess.run(
            [str(dsd_bin()), "-d", "sig", "apply", "-c", str(config_yaml),
             "-s", str(sig_path), "--dry"],
            cwd=str(ROOT), capture_output=True, text=True,
            timeout=_DSD_TIMEOUT_S,
        )
    except subprocess.TimeoutExpired:
        return ApplyOutcome("error", raw="timed out")
    except OSError as e:
        return ApplyOutcome("error", raw=str(e))
    finally:
        sig_path.unlink(missing_ok=True)

    return parse_apply_output(proc.returncode, (proc.stdout or "") + (proc.stderr or ""))


# --------------------------------------------------------------------------- #
# Cross-referencing against the heuristic worklist
# --------------------------------------------------------------------------- #


def load_reference_texts() -> list[tuple[str, str]]:
    """(relpath, content) for every catalogue doc a clone-signal hit
    should be checked against before being called "new"."""
    out = []
    for relpath in (
        "docs/research/campaign-analytics/cmatch-sweep-queue.md",
        "docs/research/campaign-analytics/cmatch-sweep-queue-overlays.md",
        "docs/research/data/VtableDispatchPatterns.md",
    ):
        p = ROOT / relpath
        if p.is_file():
            out.append((relpath, p.read_text(encoding="utf-8", errors="ignore")))
    return out


def addr_in_references(addr: int, ref_texts: list[tuple[str, str]]) -> list[str]:
    """Which reference docs mention this address (8-hex-digit form,
    with or without 0x prefix)? Returns the list of matching relpaths
    (empty = not found in any catalogue => candidate NEW family)."""
    needles = (f"{addr:08x}", f"0x{addr:08x}")
    hits = []
    for relpath, text in ref_texts:
        low = text.lower()
        if any(n in low for n in needles):
            hits.append(relpath)
    return hits


# --------------------------------------------------------------------------- #
# Optional cross-validation against port_to_region.py
# --------------------------------------------------------------------------- #


def port_to_region_predicted_twin(source_c_path: Path, target: str) -> dict | None:
    """Run port_to_region.py --dry-run --json for the same function
    and return its main_func_resolution dict, or None if it errored
    (refused / not found / etc — those are reported, not silently
    dropped, by the caller)."""
    try:
        proc = subprocess.run(
            [sys.executable, "tools/port_to_region.py", "--target", target,
             "--confidence-floor", "LOW", "--dry-run", "--json", str(source_c_path)],
            cwd=str(ROOT), capture_output=True, text=True, timeout=60,
        )
    except (subprocess.TimeoutExpired, OSError):
        return None
    try:
        data = json.loads(proc.stdout)
    except json.JSONDecodeError:
        return None
    return data.get("main_func_resolution")


# Same convention as objdiff_resolve_relocs.py's _NAME_ADDR_RE: an
# address-based symbol name (`func_0208904c`, `func_ov002_0226af64`)
# embeds its own resolved address as an 8-hex-digit trailing suffix.
_TARGET_NAME_ADDR_RE = re.compile(r"_([0-9a-fA-F]{8})$")


def resolved_addr_from_target_name(target_name: str | None) -> int | None:
    """Extract the comparable target-region address from
    main_func_resolution['target_name']. NOTE: main_func_resolution's
    own 'addr' field is the EUR SOURCE address (identical across every
    target region — NOT the resolved twin), so it is never usable for
    cross-validation; target_name's hex suffix is the only field that
    actually carries the target-region address for address-named
    symbols. Returns None for a friendly (non-address-embedded) name —
    the caller treats that as 'no comparable prediction', not a
    disagreement."""
    if not target_name:
        return None
    m = _TARGET_NAME_ADDR_RE.search(target_name)
    if not m:
        return None
    return int(m.group(1), 16)


# --------------------------------------------------------------------------- #
# Main driver
# --------------------------------------------------------------------------- #


def run_census(
    sample_size: int,
    min_size: int,
    seed: int,
    regions: list[str],
    scratch_dir: Path,
    cross_validate: bool,
) -> dict:
    eur_config = ROOT / "config" / "eur" / "arm9" / "config.yaml"
    sample = sample_matched_functions(ROOT / "config" / "eur", sample_size, min_size, seed)

    ref_texts = load_reference_texts()
    results = []
    t0 = time.time()
    for i, cand in enumerate(sample, 1):
        name = cand["name"]
        print(f"[{i}/{len(sample)}] {name} @ {cand['addr']:#010x} ({cand['module']})",
              file=sys.stderr)

        sig_text = sig_new(eur_config, name)
        entry = {**cand, "sig_new_ok": sig_text is not None}
        if sig_text is None:
            results.append(entry)
            continue

        internal = sig_apply_dry(eur_config, sig_text, scratch_dir)
        entry["internal_census"] = internal.kind
        if internal.kind == "multiple":
            hits = addr_in_references(cand["addr"], ref_texts)
            entry["internal_clone_catalogued_in"] = hits
            entry["internal_clone_is_new"] = len(hits) == 0

        region_twins = {}
        for region in regions:
            region_config = ROOT / "config" / region / "arm9" / "config.yaml"
            if not region_config.is_file():
                region_twins[region] = {"kind": "region_config_missing"}
                continue
            outcome = sig_apply_dry(region_config, sig_text, scratch_dir)
            twin_entry = {"kind": outcome.kind}
            if outcome.renamed_function:
                twin_entry["twin_addr"] = outcome.renamed_function[0]
                twin_entry["twin_module"] = outcome.renamed_function[1]
            region_twins[region] = twin_entry

            if cross_validate and outcome.kind == "applied_rename":
                predicted = port_to_region_predicted_twin(
                    ROOT / cand["source"], region,
                )
                if predicted is not None:
                    predicted_addr = resolved_addr_from_target_name(
                        predicted.get("target_name")
                    )
                    twin_entry["port_to_region_target_name"] = predicted.get("target_name")
                    twin_entry["port_to_region_confidence"] = predicted.get("confidence")
                    if predicted_addr is not None:
                        twin_addr = int(outcome.renamed_function[0], 16)
                        twin_entry["port_to_region_predicted_addr"] = (
                            f"{predicted_addr:#010x}"
                        )
                        twin_entry["port_to_region_agrees"] = predicted_addr == twin_addr

        entry["region_twins"] = region_twins
        results.append(entry)

    elapsed = time.time() - t0
    return {
        "sample_size": len(sample),
        "min_size": min_size,
        "seed": seed,
        "regions": regions,
        "cross_validate": cross_validate,
        "elapsed_seconds": round(elapsed, 1),
        "results": results,
    }


def summarize(census: dict) -> str:
    results = census["results"]
    n = len(results)
    sig_new_fail = sum(1 for r in results if not r.get("sig_new_ok"))
    internal_counts: dict[str, int] = {}
    new_family_hits = []
    known_family_hits = 0
    for r in results:
        kind = r.get("internal_census")
        if kind:
            internal_counts[kind] = internal_counts.get(kind, 0) + 1
        if r.get("internal_clone_is_new"):
            new_family_hits.append(r)
        elif kind == "multiple":
            known_family_hits += 1

    lines = [
        f"Sampled: {n}  (sig_new failures: {sig_new_fail})",
        f"Elapsed: {census['elapsed_seconds']}s",
        "",
        "Internal clone census (boolean signal only — see tool docstring):",
    ]
    for kind, count in sorted(internal_counts.items()):
        lines.append(f"  {kind:16} {count}")
    lines.append(
        f"  -> {len(new_family_hits)} NOT in any known-family catalogue "
        f"(candidate new families), {known_family_hits} already catalogued"
    )

    lines.append("")
    lines.append("Region-twin map:")
    for region in census["regions"]:
        region_counts: dict[str, int] = {}
        agree = disagree = no_prediction = 0
        for r in results:
            twin = r.get("region_twins", {}).get(region)
            if not twin:
                continue
            region_counts[twin["kind"]] = region_counts.get(twin["kind"], 0) + 1
            if "port_to_region_agrees" in twin:
                if twin["port_to_region_agrees"]:
                    agree += 1
                else:
                    disagree += 1
            elif twin.get("kind") == "applied_rename" and census["cross_validate"]:
                no_prediction += 1
        lines.append(f"  {region}:")
        for kind, count in sorted(region_counts.items()):
            lines.append(f"    {kind:20} {count}")
        if census["cross_validate"]:
            lines.append(
                f"    cross-validated vs port_to_region.py: {agree} agree, "
                f"{disagree} disagree, {no_prediction} no prediction"
            )
    return "\n".join(lines)


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Read-only dsd sig new/apply --dry clone census + region-twin map"
    )
    ap.add_argument("--sample-size", type=int, default=40)
    ap.add_argument("--min-size", type=lambda x: int(x, 0), default=0x20,
                     help="Skip functions smaller than this (bytes). Default 0x20.")
    ap.add_argument("--seed", type=int, default=1)
    ap.add_argument("--regions", nargs="+", default=["usa", "jpn"])
    ap.add_argument("--cross-validate", action="store_true",
                     help="Also cross-check region-twin hits against "
                          "port_to_region.py's independent resolution "
                          "(slower — one extra subprocess per twin found).")
    ap.add_argument("--out", type=Path,
                     default=ROOT / "docs" / "research" / "sig-census-results.json")
    ap.add_argument("--scratch-dir", type=Path,
                     default=ROOT / "build" / "_sig_census_scratch")
    args = ap.parse_args()

    census = run_census(
        args.sample_size, args.min_size, args.seed, args.regions,
        args.scratch_dir, args.cross_validate,
    )

    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(census, indent=2), encoding="utf-8")
    print(f"wrote {args.out}", file=sys.stderr)
    print(summarize(census))
    return 0


if __name__ == "__main__":
    sys.exit(main())
