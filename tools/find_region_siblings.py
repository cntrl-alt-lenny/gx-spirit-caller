#!/usr/bin/env python3

"""
find_region_siblings.py — find USA / JPN counterparts of an EUR symbol.

Given an EUR function (by address or name), prints candidate USA + JPN
sibling addresses using fingerprint matching against
`config/{usa,jpn}/**/symbols.txt` + `relocs.txt`.

Used during the multi-region porting workflow: an EUR match that
fingerprints HIGH-confidence to a single USA + JPN candidate can
likely port mechanically (same C source compiles to the same
relocated bytes in all 3 regions). LOW-confidence candidates
suggest region drift and need manual cross-check.

Usage:

    # Look up a single EUR function
    python tools/find_region_siblings.py main 0x02006164

    # Sample-validate N random matched EUR functions
    python tools/find_region_siblings.py --sample 20

    # JSON output for tool chaining
    python tools/find_region_siblings.py main 0x02006164 --json

Fingerprint dimensions (in confidence order):

1. **Same module** (overlay index): must match. EUR's `ov002` only
   pairs with USA's `ov002`.
2. **Same size** (byte length): must match.
3. **Reloc signature**: tuple of `(offset_within_function, kind,
   target_module)` for each relocation. Two functions with the
   same reloc pattern at the same internal offsets are almost
   certainly twins.
4. **Position-in-module rank**: when other signals tie, prefer
   the candidate whose ordinal position in its module matches
   the EUR original's.
5. **Byte-level disambiguation (v2):** when reloc fingerprint
   alone ties multiple HIGH candidates, read each candidate's
   raw bytes from the region's baserom, mask out reloc-affected
   slots, and score by Hamming similarity. Demote candidates
   whose byte-sim is below 0.99 if a perfect-or-near-perfect
   match exists elsewhere; demote candidates below 0.90 to
   LOW unconditionally.

Output classification:

- **HIGH**: same module + same size + reloc signature exactly
  matches AND (byte-sim ≥ 0.99 OR no better candidate exists).
- **MEDIUM**: same module + same size + reloc bag matches but
  offsets drift, OR byte-sim 0.90-0.99 when a higher-byte-sim
  candidate exists.
- **LOW**: same module + same size + reloc-count match but
  structure differs OR byte-sim < 0.90.
- **NONE**: no candidate matches even size + module.

Briefs 061 (prototype) + 064 (byte-level disambiguation
implementation) introduced this tool. Multi-region survey
output: `docs/research/multi-region-feasibility.md`.
"""

from __future__ import annotations

import argparse
import json
import random
import re
import sys
from collections import defaultdict
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
CONFIG_DIR = ROOT / "config"
EXTRACT_DIR = ROOT / "extract"
SRC_DIR = ROOT / "src"


# Cache module → (binary path, base address) lookups per region.
# Lazy-populated on first access; survives across find_siblings calls
# within a single tool invocation.
_MODULE_LOAD_CACHE: dict[tuple[str, str], tuple[Path, int] | None] = {}
# Cache module raw bytes per region.
_MODULE_BYTES_CACHE: dict[tuple[str, str], bytes] = {}


def _resolve_module_load(region: str, module: str) -> tuple[Path, int] | None:
    """Return (binary_path, base_address) for a module in a region.

    Returns None if the module is unknown or its extract data is
    missing. Caches results.
    """
    key = (region, module)
    if key in _MODULE_LOAD_CACHE:
        return _MODULE_LOAD_CACHE[key]

    result: tuple[Path, int] | None = None
    extract_arm9 = EXTRACT_DIR / region / "arm9"

    if module == "main":
        yaml_path = extract_arm9 / "arm9.yaml"
        bin_path = extract_arm9 / "arm9.bin"
        if yaml_path.is_file() and bin_path.is_file():
            base = _read_yaml_int(yaml_path, "base_address")
            if base is not None:
                result = (bin_path, base)
    elif module == "itcm" or module == "dtcm":
        yaml_path = extract_arm9 / f"{module}.yaml"
        bin_path = extract_arm9 / f"{module}.bin"
        if yaml_path.is_file() and bin_path.is_file():
            base = _read_yaml_int(yaml_path, "base_address")
            if base is not None:
                result = (bin_path, base)
    elif module.startswith("ov") and module[2:].isdigit():
        idx = int(module[2:])
        overlays_dir = EXTRACT_DIR / region / "arm9_overlays"
        yaml_path = overlays_dir / "overlays.yaml"
        bin_path = overlays_dir / f"ov{idx:03d}.bin"
        if yaml_path.is_file() and bin_path.is_file():
            # Look up base address by ID in the overlays list.
            base = _read_overlay_base(yaml_path, idx)
            if base is not None:
                result = (bin_path, base)

    _MODULE_LOAD_CACHE[key] = result
    return result


def _read_yaml_int(path: Path, key: str) -> int | None:
    """Lightweight YAML scalar reader for top-level `key: <int>`.

    We avoid pulling in pyyaml as a dependency since the only
    fields we need are integer scalars at the top level.
    """
    pattern = re.compile(rf"^{re.escape(key)}:\s*(\d+)\s*$")
    for line in path.read_text(encoding="utf-8", errors="replace").splitlines():
        m = pattern.match(line)
        if m:
            return int(m.group(1))
    return None


def _read_overlay_base(path: Path, overlay_id: int) -> int | None:
    """Find the base_address for `overlay_id` in overlays.yaml.

    Hand-parses the list-of-mappings structure to avoid pyyaml.
    """
    current_id: int | None = None
    base_re = re.compile(r"^\s+base_address:\s*(\d+)\s*$")
    id_re = re.compile(r"^\s+-?\s*id:\s*(\d+)\s*$")
    for line in path.read_text(encoding="utf-8", errors="replace").splitlines():
        m = id_re.match(line)
        if m:
            current_id = int(m.group(1))
            continue
        m = base_re.match(line)
        if m and current_id == overlay_id:
            return int(m.group(1))
    return None


def _module_bytes(region: str, module: str) -> bytes | None:
    """Return the full raw bytes of a module's binary, cached."""
    key = (region, module)
    if key in _MODULE_BYTES_CACHE:
        return _MODULE_BYTES_CACHE[key]
    load = _resolve_module_load(region, module)
    if load is None:
        return None
    bin_path, _base = load
    data = bin_path.read_bytes()
    _MODULE_BYTES_CACHE[key] = data
    return data


def _function_bytes(region: str, module: str, addr: int, size: int) -> bytes | None:
    """Read raw function bytes from the region's extracted ROM.

    Returns None if the module is unknown or the address is out of
    range. Returns exactly `size` bytes when the load region covers
    [addr, addr+size).
    """
    load = _resolve_module_load(region, module)
    if load is None:
        return None
    _bin_path, base = load
    data = _module_bytes(region, module)
    if data is None:
        return None
    offset = addr - base
    if offset < 0 or offset + size > len(data):
        return None
    return data[offset:offset + size]


def _mask_relocs(bytes_: bytes, func_addr: int,
                 reloc_offsets: list[int]) -> bytes:
    """Replace bytes at reloc-affected offsets with 0x00 (sentinel).

    `reloc_offsets` is the list of absolute reloc-from addresses
    that fall inside this function. For each, we zero the 4-byte
    word at the 4-aligned address — this safely covers:

    - ARM BL relocations (24-bit imm in a 4-byte instruction)
    - ARM `ldr ip, =label` pool slots (4-byte `.word`)
    - Thumb branch / load relocations (2 or 4 bytes)

    Slightly aggressive vs precise per-kind masking, but never
    leaks region-specific bytes that would falsely separate
    siblings.
    """
    out = bytearray(bytes_)
    for absolute in reloc_offsets:
        rel = absolute - func_addr
        # Align down to 4-byte boundary
        aligned = (rel // 4) * 4
        for i in range(aligned, aligned + 4):
            if 0 <= i < len(out):
                out[i] = 0x00
    return bytes(out)


def _byte_similarity(a: bytes, b: bytes) -> float:
    """Hamming similarity over equal positions; 0.0..1.0.

    Returns 1.0 if both empty. Returns 0.0 if lengths differ
    (a/b should be pre-aligned by the caller; this is a safety
    net).
    """
    if len(a) != len(b):
        return 0.0
    if not a:
        return 1.0
    eq = sum(1 for x, y in zip(a, b, strict=True) if x == y)
    return eq / len(a)


def function_byte_similarity(
    region_a: str, func_a: Function,
    region_b: str, func_b: Function,
) -> float | None:
    """Compare two cross-region function candidates by their raw
    bytes (with reloc slots masked).

    Returns a similarity in [0.0, 1.0], or None if either region's
    extract data isn't available (e.g. brain hasn't bootstrapped).
    """
    a_bytes = _function_bytes(region_a, func_a.module, func_a.addr,
                              func_a.size)
    b_bytes = _function_bytes(region_b, func_b.module, func_b.addr,
                              func_b.size)
    if a_bytes is None or b_bytes is None:
        return None

    a_reloc_offsets = [func_a.addr + ro for ro, _, _ in func_a.reloc_sig]
    b_reloc_offsets = [func_b.addr + ro for ro, _, _ in func_b.reloc_sig]
    a_masked = _mask_relocs(a_bytes, func_a.addr, a_reloc_offsets)
    b_masked = _mask_relocs(b_bytes, func_b.addr, b_reloc_offsets)
    return _byte_similarity(a_masked, b_masked)


@dataclass(frozen=True)
class Function:
    """A function entry from a region's symbols.txt + its
    region-stable reloc fingerprint."""
    addr: int
    size: int
    name: str
    ish: str  # 'arm' or 'thumb'
    module: str  # 'main', 'ov002', etc.
    rank: int  # ordinal position in module (0-based), used as tiebreaker
    # Region-stable reloc fingerprint: tuple of (offset_within_func,
    # kind, target_module). Absolute `to:0xADDR` is excluded
    # because that's region-specific; the target module is stable
    # across regions.
    reloc_sig: tuple[tuple[int, str, str], ...]


# --------------------------------------------------------------------------- #
# Loading
# --------------------------------------------------------------------------- #

SYMBOL_RE = re.compile(
    r"^(?P<name>\S+)\s+kind:function\((?P<ish>arm|thumb),"
    r"size=0x(?P<size>[0-9a-fA-F]+)\)\s+addr:0x(?P<addr>[0-9a-fA-F]+)"
)
RELOC_RE = re.compile(
    r"^from:0x(?P<from_addr>[0-9a-fA-F]+)\s+kind:(?P<kind>\S+)\s+"
    r"to:0x(?P<to_addr>[0-9a-fA-F]+)\s+module:(?P<to_mod>\S+)"
)


def parse_symbols(path: Path, module: str) -> list[tuple[int, int, str, str]]:
    """Return list of (addr, size, name, ish) for each function in
    `path`. Skips non-function entries."""
    if not path.is_file():
        return []
    out: list[tuple[int, int, str, str]] = []
    for line in path.read_text(encoding="utf-8", errors="replace").splitlines():
        m = SYMBOL_RE.match(line)
        if m:
            out.append((
                int(m.group("addr"), 16),
                int(m.group("size"), 16),
                m.group("name"),
                m.group("ish"),
            ))
    return out


def parse_relocs(path: Path) -> dict[int, list[tuple[int, str, str]]]:
    """Return dict mapping from-address → list of (from_addr, kind,
    to_module) tuples. Caller bucket-sorts these into functions."""
    if not path.is_file():
        return {}
    out: dict[int, list[tuple[int, str, str]]] = defaultdict(list)
    for line in path.read_text(encoding="utf-8", errors="replace").splitlines():
        m = RELOC_RE.match(line)
        if m:
            from_addr = int(m.group("from_addr"), 16)
            out[from_addr].append((
                from_addr,
                m.group("kind"),
                m.group("to_mod"),
            ))
    return dict(out)


def load_region(region: str) -> dict[str, list[Function]]:
    """Load all functions + reloc fingerprints for a region.

    Returns dict[module] = list[Function] sorted by address.
    """
    config_root = CONFIG_DIR / region / "arm9"
    if not config_root.is_dir():
        return {}

    out: dict[str, list[Function]] = {}

    # Main module
    main_symbols = parse_symbols(config_root / "symbols.txt", "main")
    main_relocs = parse_relocs(config_root / "relocs.txt")
    out["main"] = _build_functions("main", main_symbols, main_relocs)

    # Overlays
    overlays_dir = config_root / "overlays"
    if overlays_dir.is_dir():
        for ov_dir in sorted(overlays_dir.iterdir()):
            if not (ov_dir / "symbols.txt").is_file():
                continue
            mod = ov_dir.name
            ov_symbols = parse_symbols(ov_dir / "symbols.txt", mod)
            ov_relocs = parse_relocs(ov_dir / "relocs.txt")
            out[mod] = _build_functions(mod, ov_symbols, ov_relocs)

    return out


def _build_functions(
    module: str,
    symbols: list[tuple[int, int, str, str]],
    relocs: dict[int, list[tuple[int, str, str]]],
) -> list[Function]:
    """Combine per-function symbols with their internal relocs."""
    symbols_sorted = sorted(symbols, key=lambda t: t[0])
    funcs: list[Function] = []
    for rank, (addr, size, name, ish) in enumerate(symbols_sorted):
        # Relocs that fall within [addr, addr+size)
        sig: list[tuple[int, str, str]] = []
        for r_from in range(addr, addr + size, 2):
            # Walk every 2 bytes (Thumb min stride); reloc table
            # is sparse so this is cheap.
            if r_from in relocs:
                for from_addr, kind, to_mod in relocs[r_from]:
                    sig.append((from_addr - addr, kind, to_mod))
        sig_tup = tuple(sorted(sig))
        funcs.append(Function(
            addr=addr,
            size=size,
            name=name,
            ish=ish,
            module=module,
            rank=rank,
            reloc_sig=sig_tup,
        ))
    return funcs


# --------------------------------------------------------------------------- #
# Matching
# --------------------------------------------------------------------------- #

@dataclass
class Match:
    """A candidate sibling in another region."""
    func: Function
    confidence: str  # 'HIGH', 'MEDIUM', 'LOW', 'NONE'
    score: float     # 0.0..1.0
    rationale: str   # human-readable explanation


def find_siblings(
    eur_func: Function,
    target_region: dict[str, list[Function]],
    *,
    max_results: int = 5,
    source_region: str = "eur",
    target_region_name: str | None = None,
    byte_disambiguate: bool = True,
) -> list[Match]:
    """Find candidate twins of `eur_func` in the target region.

    Returns up to `max_results` candidates ranked by confidence.

    When `byte_disambiguate=True` (default) and the source +
    target region extract data is available, candidates with
    matching reloc fingerprints are additionally ranked by raw-
    byte Hamming similarity (with reloc slots masked). This
    resolves the v1 prototype's documented limitation: identical-
    reloc-fingerprint candidates that differ only in instruction-
    encoded immediates (e.g. `lsl #0x1e` vs `lsl #0x1d`) get
    disambiguated to a single winner.
    """
    # Restrict to same module
    candidates = target_region.get(eur_func.module, [])
    # Filter by exact size match (mandatory)
    size_matches = [c for c in candidates if c.size == eur_func.size]
    if not size_matches:
        return []

    scored: list[Match] = []
    for cand in size_matches:
        score, rationale, confidence = _score(eur_func, cand)
        # Apply position-rank discount: candidates far from EUR's
        # ordinal position are unlikely twins. EUR/USA/JPN have
        # near-identical function counts per module (within ±1
        # across waves), so rank is a strong signal.
        rank_delta = abs(cand.rank - eur_func.rank)
        if rank_delta > 50:
            # Far drift; could be a different function entirely
            score *= 0.3
            rationale = f"{rationale} | rank-drift={rank_delta} (suspicious)"
            if confidence == "HIGH":
                confidence = "MEDIUM"
            elif confidence == "MEDIUM":
                confidence = "LOW"
        elif rank_delta > 5:
            score *= 0.85
            rationale = f"{rationale} | rank-drift={rank_delta}"
        # rank_delta <= 5 keeps full score (within wave-iteration jitter)
        scored.append(Match(
            func=cand,
            confidence=confidence,
            score=score,
            rationale=rationale,
        ))

    # Byte-level disambiguation pass.
    # Disambiguates between candidates by comparing raw function
    # bytes with reloc slots masked out. Resolves the v1
    # limitation: identical-reloc-fingerprint candidates that
    # differ in instruction-encoded immediates get separated.
    if byte_disambiguate and target_region_name is not None:
        # Compute byte-similarity for ALL HIGH/MEDIUM candidates,
        # so the leaderboard is uniformly disambiguated rather
        # than only tied-at-top candidates.
        sims: list[float | None] = []
        for m in scored:
            if m.confidence in ("HIGH", "MEDIUM"):
                bsim = function_byte_similarity(
                    source_region, eur_func,
                    target_region_name, m.func,
                )
            else:
                bsim = None
            sims.append(bsim)
            if bsim is not None:
                m.rationale = f"{m.rationale} | byte-sim={bsim:.3f}"
                m.byte_sim = bsim

        # Find the best byte-sim across all HIGH/MEDIUM candidates.
        valid = [s for s in sims if s is not None]
        if valid:
            best_bsim = max(valid)
            for m, bsim in zip(scored, sims, strict=True):
                if bsim is None:
                    continue
                # Demotion rules:
                # - byte-sim ≥ 0.99 → keep HIGH (perfect-or-near-
                #   perfect twin)
                # - 0.90 ≤ byte-sim < 0.99 AND a better candidate
                #   exists → demote to MEDIUM (almost-twin but
                #   loser)
                # - byte-sim < 0.90 → demote to LOW (likely
                #   wrong shape despite matching reloc-bag)
                if bsim < 0.90:
                    if m.confidence == "HIGH":
                        m.confidence = "LOW"
                        m.score = m.score * 0.7
                    elif m.confidence == "MEDIUM":
                        m.confidence = "LOW"
                        m.score = m.score * 0.7
                elif bsim < 0.99 and best_bsim >= 0.99:
                    # There's a 0.99+ winner; this is a near-miss.
                    if m.confidence == "HIGH":
                        m.confidence = "MEDIUM"
                        m.score = m.score * 0.9
                # bsim >= 0.99 OR no better candidate: keep
                # current confidence.

    # Sort by score descending, then byte-sim descending,
    # then rank-proximity, then addr-proximity
    def _sort_key(m: Match) -> tuple:
        bsim = getattr(m, "byte_sim", -1.0)
        return (
            -m.score,
            -bsim,
            abs(m.func.rank - eur_func.rank),
            abs(m.func.addr - eur_func.addr),
        )
    scored.sort(key=_sort_key)
    return scored[:max_results]


def _score(eur: Function, cand: Function) -> tuple[float, str, str]:
    """Score a candidate against an EUR original. Returns
    (score, rationale, confidence-label)."""
    # Reloc-signature similarity. Compare bag-of-(kind, target_module)
    # tuples (ignoring exact offset) — same reloc kinds going to the
    # same target modules in the same count is a strong signal.
    eur_bag = sorted([(k, m) for _, k, m in eur.reloc_sig])
    cand_bag = sorted([(k, m) for _, k, m in cand.reloc_sig])

    if not eur_bag and not cand_bag:
        # No relocs in either — score by size + ish alone.
        if eur.ish == cand.ish:
            return (0.50, "size+ish match, no relocs to compare", "LOW")
        else:
            return (0.10, "size matches but ish differs", "NONE")

    if eur.ish != cand.ish:
        return (0.05, f"ish differs (eur={eur.ish}, cand={cand.ish})", "NONE")

    # Exact-offset-match for relocs (strongest signal): both the
    # offset within function AND the (kind, target_module) match.
    eur_full = sorted(eur.reloc_sig)
    cand_full = sorted(cand.reloc_sig)
    if eur_full == cand_full:
        return (1.0, f"exact reloc signature match ({len(eur_full)} relocs)", "HIGH")

    # Bag-match (offsets may have drifted but the reloc pattern is
    # otherwise identical):
    if eur_bag == cand_bag:
        return (0.85, f"reloc bag match ({len(eur_bag)} relocs, offsets drift)", "MEDIUM")

    # Jaccard similarity over the bags.
    if not eur_bag or not cand_bag:
        return (0.0, "one side has no relocs", "NONE")
    eur_set = set(eur_bag)
    cand_set = set(cand_bag)
    intersection = len(eur_set & cand_set)
    union = len(eur_set | cand_set)
    jaccard = intersection / union if union else 0.0

    if jaccard >= 0.80:
        return (jaccard * 0.85, f"reloc bag Jaccard {jaccard:.2f}", "MEDIUM")
    elif jaccard >= 0.50:
        return (jaccard * 0.6, f"reloc bag Jaccard {jaccard:.2f}", "LOW")
    else:
        return (jaccard * 0.3, f"reloc bag Jaccard {jaccard:.2f} (poor)", "NONE")


# --------------------------------------------------------------------------- #
# Sample validation
# --------------------------------------------------------------------------- #

def find_eur_matched() -> list[tuple[str, int]]:
    """Find all EUR matched functions via src/ filesystem.

    Returns list of (module, addr) for each `src/.../func_*.c`
    (or named .c file with an addressable name).
    """
    out: list[tuple[str, int]] = []
    addr_re = re.compile(r"(func_(?:ov\d+_)?)?([0-9a-fA-F]{8})")
    for src in SRC_DIR.rglob("*.c"):
        # Heuristic: skip *.legacy.c name's "legacy" suffix
        stem = src.stem
        if stem.endswith(".legacy") or stem.endswith(".legacy_sp3"):
            stem = stem.rsplit(".legacy", 1)[0]
        m = addr_re.search(stem)
        if not m:
            continue
        addr = int(m.group(2), 16)
        # Module from path: src/main/ → main, src/overlay002/ → ov002
        parts = src.relative_to(SRC_DIR).parts
        if not parts:
            continue
        if parts[0] == "main":
            mod = "main"
        elif parts[0].startswith("overlay"):
            mod = "ov" + parts[0][7:].zfill(3)
        else:
            continue
        out.append((mod, addr))
    return out


def lookup_eur_func(eur: dict[str, list[Function]], mod: str, addr: int) -> Function | None:
    for f in eur.get(mod, []):
        if f.addr == addr:
            return f
    return None


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def main() -> int:
    ap = argparse.ArgumentParser(
        description="Find USA / JPN counterparts of an EUR function.",
    )
    ap.add_argument("module", nargs="?", help="EUR module (main, ov002, ...)")
    ap.add_argument("addr", nargs="?", help="EUR function address (hex)")
    ap.add_argument("--sample", type=int, default=0,
                    help="Sample-validate N random matched EUR functions.")
    ap.add_argument("--seed", type=int, default=42,
                    help="Random seed for sampling.")
    ap.add_argument("--json", action="store_true",
                    help="Emit JSON output.")
    ap.add_argument("--max-results", type=int, default=5,
                    help="Max candidates per region (default 5).")
    ap.add_argument("--no-byte-disambiguate", action="store_true",
                    help="Disable v2 byte-level disambiguation pass. "
                         "Useful for comparison to v1 prototype output, "
                         "or when extract/<region>/ isn't available.")
    args = ap.parse_args()

    print("Loading EUR symbols...", file=sys.stderr)
    eur = load_region("eur")
    print("Loading USA symbols...", file=sys.stderr)
    usa = load_region("usa")
    print("Loading JPN symbols...", file=sys.stderr)
    jpn = load_region("jpn")

    if not eur:
        print("error: config/eur/ not found; run dsd init first", file=sys.stderr)
        return 1
    if not usa:
        print("error: config/usa/ not found; run dsd init for usa first", file=sys.stderr)
        return 1
    if not jpn:
        print("error: config/jpn/ not found; run dsd init for jpn first", file=sys.stderr)
        return 1

    if args.sample > 0:
        return _cmd_sample(eur, usa, jpn, args)

    if not args.module or not args.addr:
        ap.error("module + addr required (or --sample N)")

    addr = int(args.addr, 16)
    eur_func = lookup_eur_func(eur, args.module, addr)
    if eur_func is None:
        print(f"error: no EUR function at {args.module}/{args.addr}",
              file=sys.stderr)
        return 1

    usa_matches = find_siblings(
        eur_func, usa, max_results=args.max_results,
        source_region="eur", target_region_name="usa",
        byte_disambiguate=not args.no_byte_disambiguate,
    )
    jpn_matches = find_siblings(
        eur_func, jpn, max_results=args.max_results,
        source_region="eur", target_region_name="jpn",
        byte_disambiguate=not args.no_byte_disambiguate,
    )

    if args.json:
        out = {
            "eur": {
                "module": eur_func.module,
                "addr": f"0x{eur_func.addr:08x}",
                "size": eur_func.size,
                "name": eur_func.name,
                "n_relocs": len(eur_func.reloc_sig),
            },
            "usa": [_match_to_dict(m) for m in usa_matches],
            "jpn": [_match_to_dict(m) for m in jpn_matches],
        }
        print(json.dumps(out, indent=2))
    else:
        print(f"EUR  {eur_func.module}/{eur_func.name} @0x{eur_func.addr:08x}  "
              f"size={eur_func.size}  relocs={len(eur_func.reloc_sig)}")
        for region_name, matches in [("USA", usa_matches), ("JPN", jpn_matches)]:
            print(f"\n{region_name} candidates ({len(matches)}):")
            if not matches:
                print(f"  (no same-size candidates in {region_name}'s {eur_func.module})")
            for m in matches:
                print(f"  [{m.confidence}] {m.func.name} @0x{m.func.addr:08x}  "
                      f"score={m.score:.2f}  ({m.rationale})")

    return 0


def _match_to_dict(m: Match) -> dict:
    return {
        "name": m.func.name,
        "addr": f"0x{m.func.addr:08x}",
        "size": m.func.size,
        "confidence": m.confidence,
        "score": round(m.score, 3),
        "rationale": m.rationale,
    }


def _cmd_sample(
    eur: dict[str, list[Function]],
    usa: dict[str, list[Function]],
    jpn: dict[str, list[Function]],
    args: argparse.Namespace,
) -> int:
    """Sample-validate N random matched EUR functions."""
    matched = find_eur_matched()
    if not matched:
        print("error: no matched EUR functions found in src/", file=sys.stderr)
        return 1

    # Resolve to Function objects (skip missing entries)
    resolved: list[Function] = []
    for mod, addr in matched:
        f = lookup_eur_func(eur, mod, addr)
        if f:
            resolved.append(f)

    random.seed(args.seed)
    sample_size = min(args.sample, len(resolved))
    sample = random.sample(resolved, sample_size)

    # Tally
    confidence_buckets: dict[str, dict[str, int]] = {
        region: {"HIGH": 0, "MEDIUM": 0, "LOW": 0, "NONE": 0}
        for region in ("usa", "jpn")
    }
    per_match_records: list[dict] = []

    for eur_func in sample:
        usa_matches = find_siblings(
            eur_func, usa, max_results=1,
            source_region="eur", target_region_name="usa",
            byte_disambiguate=not args.no_byte_disambiguate,
        )
        jpn_matches = find_siblings(
            eur_func, jpn, max_results=1,
            source_region="eur", target_region_name="jpn",
            byte_disambiguate=not args.no_byte_disambiguate,
        )

        usa_conf = usa_matches[0].confidence if usa_matches else "NONE"
        jpn_conf = jpn_matches[0].confidence if jpn_matches else "NONE"

        confidence_buckets["usa"][usa_conf] += 1
        confidence_buckets["jpn"][jpn_conf] += 1

        per_match_records.append({
            "eur": eur_func.name,
            "module": eur_func.module,
            "size": eur_func.size,
            "n_relocs": len(eur_func.reloc_sig),
            "usa_conf": usa_conf,
            "usa_top": usa_matches[0].func.name if usa_matches else None,
            "jpn_conf": jpn_conf,
            "jpn_top": jpn_matches[0].func.name if jpn_matches else None,
        })

    if args.json:
        print(json.dumps({
            "sample_size": sample_size,
            "buckets": confidence_buckets,
            "records": per_match_records,
        }, indent=2))
    else:
        print(f"Sample-validated {sample_size} random EUR matches.\n")
        print(f'{"region":<8} {"HIGH":>6} {"MEDIUM":>8} {"LOW":>6} {"NONE":>6}')
        for region in ("usa", "jpn"):
            b = confidence_buckets[region]
            print(f"{region:<8} {b['HIGH']:>6} {b['MEDIUM']:>8} "
                  f"{b['LOW']:>6} {b['NONE']:>6}")
        print()
        # Show a few HIGH records as evidence
        high_records = [r for r in per_match_records if r["usa_conf"] == "HIGH"]
        if high_records:
            print(f"\nSample of HIGH USA pairings ({len(high_records)} found):")
            for r in high_records[:5]:
                print(f"  {r['module']:<6} {r['eur']:<32} size={r['size']:>4}  "
                      f"→ USA {r['usa_top']}  (relocs={r['n_relocs']})")
    return 0


if __name__ == "__main__":
    sys.exit(main())
