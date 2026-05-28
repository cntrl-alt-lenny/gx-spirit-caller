#!/usr/bin/env python3

"""
c42_family_hunter.py — cluster the unmatched C-42 cohort into exact
sibling families by canonicalized-disasm signature.

This is the productionized form of brief 249's `/tmp/scan_families.py`
prototype, which drove wave 6's +20 pp C-yield jump (93 % vs wave 5's
random-pick 73 %). The empirical finding — see
`docs/research/recipe-gotchas.md` § "Pick-selection strategy" — is that
yield correlates with sub-shape homogeneity, so draining whole sibling
families one recipe at a time beats sampling diverse shapes.

## Where this fits among the shape tools

  | Tool                        | Signal                         | Question answered                          |
  |-----------------------------|--------------------------------|--------------------------------------------|
  | `find_pattern_clusters.py`  | reloc signature (exact)        | Which matched anchor + unmatched siblings share a reloc sig RIGHT NOW? |
  | `find_shape_templates.py`   | opcode-class sequence (fuzzy)  | Which matched `.c` is the closest clone template for ONE target? |
  | `c42_family_hunter.py`      | canonicalized full-disasm (exact) | Across the unmatched C-42 cohort, which sibling families are LARGEST — what should the next drain wave exhaust first? |

`find_shape_templates` abstracts each line down to its base opcode for
fuzzy nearest-neighbour ranking. This tool keeps the full instruction
structure (operand shape, addressing mode, immediate slots) and only
abstracts the *values* — register names, branch/data symbols, local
labels, immediates — then hashes the result. Two functions land in the
same family iff their disasm is identical up to register allocation,
relocation targets, and literal values. That exact-match bucketing is
what makes a family a single-recipe drain.

## Algorithm

  1. `dsd dis` the region into the shared asm cache (reused from
     `find_shape_templates`; auto-rebuilt when symbols/relocs change).
  2. Load every C-42 prediction key from `wall_predictions.json`.
  3. Drop picks already covered by a `complete` TU in delinks.txt
     (the canonical "matched" signal — same as `next_targets`).
  4. Canonicalize each survivor's disasm body and SHA-1 the result.
  5. Bucket by hash, sort buckets by family size.
  6. Flag the families owned by another brief (Family 5 / Family 7 in
     brief 250) so the wave worklist skips them, but keep them in the
     histogram so the distribution stays honest.

## Output

  - stdout: cohort summary, family-size histogram, ranked worklist.
  - `--json PATH`: full machine-readable family dump.
  - `--out PATH`: Markdown worklist suitable for pasting into a brief.

## Usage

    # Ranked C-42 worklist + histogram for EUR (auto-runs dsd dis).
    python tools/c42_family_hunter.py --version eur

    # Reuse an existing asm tree, write the Markdown worklist.
    python tools/c42_family_hunter.py --version eur \\
        --asm-cache build/eur/find_shape_templates_cache/asm \\
        --out /tmp/c42-wave7-worklist.md --json /tmp/c42-families.json

    # Cluster a different wall, keep brief-250 families in the worklist.
    python tools/c42_family_hunter.py --version eur \\
        --wall C-23 --no-default-excludes
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import sys
from collections import Counter
from dataclasses import dataclass, field
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from find_shape_templates import (  # noqa: E402
    _module_from_asm_path,
    ensure_disasm,
)
from next_targets import (  # noqa: E402
    collect_matched_ranges,
    is_addr_matched,
)


ROOT = Path(__file__).resolve().parent.parent
DEFAULT_WALL = "C-42"
DEFAULT_TOP = 25

# Families another brief owns this round. Brief 250 is classifying
# Family 5 (packed stack-local struct) and Family 7 (`(unsigned char)`
# zero-extend → P-1), so brief 251's drain wave skips them. Seeds are
# the documented pilot members; the tool drops whichever family each
# seed lands in, so this stays correct even if the cohort reshuffles.
DEFAULT_EXCLUDE_SEEDS = (
    "ov016:0x021b3560",  # brief 249 Family 5 pilot
    "main:0x0201b690",   # brief 249 Family 7 pilot
)


# --------------------------------------------------------------------------- #
# Canonicalization (pure — unit-tested against synthetic bodies)
# --------------------------------------------------------------------------- #

def canonicalize_line(line: str) -> str:
    """Abstract one disasm instruction line to its structural signature.

    Registers, branch/data symbols, local labels, and immediates are
    replaced by placeholders; opcodes, addressing-mode punctuation, and
    operand structure are preserved. This is a verbatim port of brief
    249's `signature()` so family hashes stay comparable across waves.

        "ldr r2, [r0, #0x8]"          -> "ldr R, [R, #IMM]"
        "bl func_ov006_021b3804"      -> "bl FUNC"
        "ldr r0, .L_020918cc"         -> "ldr R, L"
        "stmdb sp!, {r4, r5, lr}"     -> "stmdb SP!, {R, R, LR}"
    """
    s = line
    # Registers. r10-r12 before r0-r9 so the two-digit names collapse
    # whole rather than leaving a stray digit.
    s = re.sub(r"\br1[0-2]\b", "R", s)
    s = re.sub(r"\br[0-9]\b", "R", s)
    s = re.sub(r"\bip\b", "R", s)
    s = re.sub(r"\bsp\b", "SP", s)
    s = re.sub(r"\blr\b", "LR", s)
    s = re.sub(r"\bpc\b", "PC", s)
    # Relocation targets and local labels.
    s = re.sub(r"\bfunc_(?:ov\d+_)?[0-9a-f]+", "FUNC", s)
    s = re.sub(r"\bdata_(?:ov\d+_)?[0-9a-f]+", "DATA", s)
    s = re.sub(r"\.L_[0-9a-f]+", "L", s)
    # Immediates (hex first, then decimal).
    s = re.sub(r"#0x[0-9a-f]+", "#IMM", s)
    s = re.sub(r"#[0-9]+", "#IMM", s)
    return s


def canonical_signature(body: list[str]) -> str:
    """Join a function body's canonicalized instruction lines."""
    return "\n".join(canonicalize_line(line) for line in body)


def signature_hash(signature: str) -> str:
    """12-hex-char SHA-1 of a canonical signature — the family key."""
    return hashlib.sha1(signature.encode()).hexdigest()[:12]


# --------------------------------------------------------------------------- #
# Asm-body extraction
# --------------------------------------------------------------------------- #

_FUNC_START_RE = re.compile(r"^\s*(?:arm|thumb)_func_start\s+(\S+)")
_FUNC_END_RE = re.compile(r"^\s*(?:arm|thumb)_func_end\s+(\S+)")
_LABEL_ADDR_RE = re.compile(r"^([\w$]+):\s*;\s*0x([0-9a-fA-F]+)")


def _is_instruction(stripped: str) -> bool:
    """True for a real instruction line — not a label, directive,
    comment, blank, or `arm_func_*` pseudo-op. Pool words (`.word …`)
    and local labels are directives/labels and so are excluded; this
    matches the prototype's `parse_body` line filter."""
    if not stripped:
        return False
    if stripped.startswith((".", ";", "//", "@")):
        return False
    if stripped.endswith(":"):
        return False
    if stripped.startswith(("arm_func_", "thumb_func_")):
        return False
    return True


@dataclass
class FunctionBody:
    """One function's instruction lines, keyed by (module, addr)."""

    name: str
    module: str
    addr: int
    body: list[str] = field(default_factory=list)


def parse_asm_bodies(path: Path, module: str) -> list[FunctionBody]:
    """Walk one `dsd dis` .s file, returning each function's body as the
    list of its (stripped, full-text) instruction lines."""
    try:
        text = path.read_text(encoding="utf-8")
    except OSError:
        return []
    out: list[FunctionBody] = []
    cur: FunctionBody | None = None
    awaiting_label = False
    for line in text.splitlines():
        m_start = _FUNC_START_RE.match(line)
        if m_start:
            cur = FunctionBody(name=m_start.group(1), module=module, addr=0)
            awaiting_label = True
            continue
        if _FUNC_END_RE.match(line) and cur is not None:
            out.append(cur)
            cur = None
            awaiting_label = False
            continue
        if cur is None:
            continue
        if awaiting_label:
            m_lab = _LABEL_ADDR_RE.match(line.strip())
            if m_lab and m_lab.group(1) == cur.name:
                cur.addr = int(m_lab.group(2), 16)
                awaiting_label = False
                continue
        stripped = line.strip()
        if _is_instruction(stripped):
            cur.body.append(stripped)
    return out


def extract_bodies(asm_root: Path) -> dict[tuple[str, int], FunctionBody]:
    """Index every function body under `asm_root` by (module, addr)."""
    out: dict[tuple[str, int], FunctionBody] = {}
    for asm_file in sorted(asm_root.rglob("*.s")):
        module = _module_from_asm_path(asm_file, asm_root)
        if module is None:
            continue
        for fn in parse_asm_bodies(asm_file, module):
            if fn.addr == 0:
                continue
            out[(fn.module, fn.addr)] = fn
    return out


# --------------------------------------------------------------------------- #
# Cohort assembly
# --------------------------------------------------------------------------- #

def load_wall_picks(predictions_path: Path, wall: str) -> list[tuple[str, int]]:
    """Return every (module, addr) keyed under a `wall` prediction."""
    data = json.loads(predictions_path.read_text(encoding="utf-8"))
    picks: list[tuple[str, int]] = []
    for key, preds in data.items():
        if not any(p.get("id") == wall for p in preds):
            continue
        module, _, addr_str = key.partition(":")
        picks.append((module, int(addr_str, 16)))
    return picks


def _sym_name(module: str, addr: int) -> str:
    """dsd-style placeholder name for a (module, addr) pick."""
    if module == "main":
        return f"func_{addr:08x}"
    return f"func_{module}_{addr:08x}"


@dataclass
class Family:
    sig_hash: str
    signature: str
    members: list[tuple[str, int]]      # (module, addr)
    body_len: int
    excluded_by: str | None = None      # seed key, if owned by another brief

    @property
    def size(self) -> int:
        return len(self.members)

    @property
    def modules(self) -> list[tuple[str, int]]:
        return Counter(m for m, _ in self.members).most_common()

    def to_json(self) -> dict:
        return {
            "sig_hash": self.sig_hash,
            "size": self.size,
            "body_len": self.body_len,
            "excluded_by": self.excluded_by,
            "modules": dict(self.modules),
            "members": [
                {"module": m, "addr": f"0x{a:08x}", "sym": _sym_name(m, a)}
                for m, a in self.members
            ],
            "signature": self.signature,
        }


@dataclass
class CohortReport:
    wall: str
    total_predicted: int
    matched: int
    unmatched: int
    body_missing: int
    families: list[Family]            # all, sorted by size desc

    @property
    def distinct_sigs(self) -> int:
        return len(self.families)

    @property
    def clustered_picks(self) -> int:
        return sum(f.size for f in self.families)

    def histogram(self) -> list[tuple[int, int, int]]:
        """(family_size, num_families, picks_covered), largest size first."""
        by_size: Counter[int] = Counter(f.size for f in self.families)
        return [
            (size, n, size * n)
            for size, n in sorted(by_size.items(), reverse=True)
        ]

    def worklist(self, *, min_size: int = 1) -> list[Family]:
        """Actionable families: not owned by another brief, size>=min."""
        return [
            f for f in self.families
            if f.excluded_by is None and f.size >= min_size
        ]


def build_cohort(
    picks: list[tuple[str, int]],
    bodies: dict[tuple[str, int], FunctionBody],
    matched_ranges: dict[str, list[tuple[int, int]]],
    *,
    wall: str = DEFAULT_WALL,
    exclude_seeds: list[tuple[str, int]] | None = None,
) -> CohortReport:
    """Cluster the unmatched picks into families and tag excluded ones."""
    wall_total = len(picks)
    matched = 0
    body_missing = 0
    buckets: dict[str, Family] = {}
    for module, addr in picks:
        if is_addr_matched(matched_ranges, module, addr):
            matched += 1
            continue
        fn = bodies.get((module, addr))
        if fn is None or not fn.body:
            body_missing += 1
            continue
        sig = canonical_signature(fn.body)
        h = signature_hash(sig)
        fam = buckets.get(h)
        if fam is None:
            fam = Family(sig_hash=h, signature=sig, members=[],
                         body_len=len(fn.body))
            buckets[h] = fam
        fam.members.append((module, addr))

    # Tag families owned by another brief, identified by seed membership.
    for seed in exclude_seeds or []:
        for fam in buckets.values():
            if seed in fam.members:
                fam.excluded_by = _sym_name(*seed)
                break

    families = sorted(
        buckets.values(),
        key=lambda f: (-f.size, f.sig_hash),
    )
    return CohortReport(
        wall=wall,
        total_predicted=wall_total,
        matched=matched,
        unmatched=wall_total - matched,
        body_missing=body_missing,
        families=families,
    )


# --------------------------------------------------------------------------- #
# Reporting
# --------------------------------------------------------------------------- #

def _member_line(module: str, addr: int) -> str:
    return f"{_sym_name(module, addr)}  ({module}:0x{addr:08x})"


def render_text(report: CohortReport, *, top: int, sig_lines: int) -> str:
    out: list[str] = []
    out.append(
        f"{report.wall} cohort: {report.total_predicted} predicted, "
        f"{report.matched} matched, {report.unmatched} unmatched "
        f"({report.body_missing} unmatched w/o disasm body)"
    )
    out.append(
        f"clustered {report.clustered_picks} picks into "
        f"{report.distinct_sigs} distinct signatures"
    )
    out.append("")
    out.append("Family-size histogram (full cohort):")
    out.append(f"  {'size':>4}  {'families':>8}  {'picks':>6}")
    cum = 0
    for size, n, covered in report.histogram():
        cum += covered
        out.append(f"  {size:>4}  {n:>8}  {covered:>6}   (cum {cum})")
    out.append("")

    worklist = report.worklist(min_size=2)
    singles = sum(1 for f in report.families
                  if f.excluded_by is None and f.size == 1)
    excluded = [f for f in report.families if f.excluded_by is not None]
    out.append(
        f"Worklist: {len(worklist)} multi-member families "
        f"(+{singles} singletons, {len(excluded)} families excluded)"
    )
    if excluded:
        for f in excluded:
            out.append(
                f"  excluded {f.sig_hash} (size {f.size}) "
                f"— owned by another brief via {f.excluded_by}"
            )
    out.append("")
    out.append(f"Top {min(top, len(worklist))} sibling families "
               f"(largest first, excludes owned families):")
    for i, fam in enumerate(worklist[:top], 1):
        out.append("")
        out.append(
            f"{i:>3}. family {fam.sig_hash}: {fam.size} picks, "
            f"{fam.body_len} insns  modules={fam.modules}"
        )
        for line in fam.signature.split("\n")[:sig_lines]:
            out.append(f"       | {line}")
        if fam.body_len > sig_lines:
            out.append(f"       | … ({fam.body_len - sig_lines} more)")
        for module, addr in fam.members[:8]:
            out.append(f"       - {_member_line(module, addr)}")
        if fam.size > 8:
            out.append(f"       - … ({fam.size - 8} more)")
    return "\n".join(out) + "\n"


def render_markdown(report: CohortReport, *, top: int) -> str:
    out: list[str] = []
    out.append("[//]: # (markdownlint-disable MD013 MD041)")
    out.append("")
    out.append(f"# {report.wall} sibling-family worklist")
    out.append("")
    out.append(
        f"Cohort: **{report.unmatched} unmatched** of "
        f"{report.total_predicted} predicted "
        f"({report.matched} already matched). "
        f"**{report.distinct_sigs} distinct signatures.**"
    )
    out.append("")
    out.append("## Family-size histogram")
    out.append("")
    out.append("| Family size | Families | Picks covered |")
    out.append("|---:|---:|---:|")
    for size, n, covered in report.histogram():
        out.append(f"| {size} | {n} | {covered} |")
    out.append("")
    out.append("## Ranked worklist (largest families first)")
    out.append("")
    out.append("| # | Sig | Picks | Body | Modules | Note |")
    out.append("|---|---|---:|---:|---|---|")
    worklist = report.worklist(min_size=2)
    for i, fam in enumerate(worklist[:top], 1):
        mods = ", ".join(f"{m}×{c}" for m, c in fam.modules)
        out.append(
            f"| {i} | `{fam.sig_hash}` | {fam.size} | {fam.body_len} "
            f"| {mods} | |"
        )
    excluded = [f for f in report.families if f.excluded_by is not None]
    if excluded:
        out.append("")
        out.append("## Excluded families (owned by another brief)")
        out.append("")
        out.append("| Sig | Picks | Owned via |")
        out.append("|---|---:|---|")
        for f in excluded:
            out.append(f"| `{f.sig_hash}` | {f.size} | `{f.excluded_by}` |")
    out.append("")
    return "\n".join(out) + "\n"


def render_json(report: CohortReport) -> str:
    payload = {
        "wall": report.wall,
        "total_predicted": report.total_predicted,
        "matched": report.matched,
        "unmatched": report.unmatched,
        "body_missing": report.body_missing,
        "distinct_sigs": report.distinct_sigs,
        "histogram": [
            {"size": s, "families": n, "picks": c}
            for s, n, c in report.histogram()
        ],
        "families": [f.to_json() for f in report.families],
    }
    return json.dumps(payload, indent=2) + "\n"


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def _parse_seed(s: str) -> tuple[str, int]:
    module, _, addr_str = s.partition(":")
    if not module or not addr_str:
        raise argparse.ArgumentTypeError(
            f"seed must be MODULE:ADDR, got {s!r}")
    return module, int(addr_str, 16)


def _default_predictions(version: str) -> Path:
    return ROOT / "build" / version / "analysis" / "wall_predictions.json"


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(
        description=(
            "Cluster the unmatched C-42 cohort into exact sibling "
            "families by canonicalized-disasm signature, and emit a "
            "size-ranked drain worklist + family-size histogram."
        ),
    )
    ap.add_argument("--version", default="eur",
                    help="Region key (eur / usa / jpn). Default eur.")
    ap.add_argument("--wall", default=DEFAULT_WALL,
                    help=f"Wall id to cluster (default {DEFAULT_WALL}).")
    ap.add_argument("--predictions", type=Path, default=None,
                    help="wall_predictions.json (default "
                         "build/<ver>/analysis/wall_predictions.json).")
    ap.add_argument("--asm-cache", type=Path, default=None,
                    help="Reuse a pre-built dsd-dis asm tree instead of "
                         "running dsd dis.")
    ap.add_argument("--force-disasm", action="store_true",
                    help="Re-run dsd dis even if the cache is fresh.")
    ap.add_argument("--top", type=int, default=DEFAULT_TOP,
                    help=f"Families shown in text/markdown (default "
                         f"{DEFAULT_TOP}).")
    ap.add_argument("--sig-lines", type=int, default=8,
                    help="Signature lines per family in text output.")
    ap.add_argument("--exclude-seed", type=_parse_seed, action="append",
                    metavar="MODULE:ADDR", default=None,
                    help="Drop the family containing this pick (repeatable). "
                         "Defaults to the brief-250 families.")
    ap.add_argument("--no-default-excludes", action="store_true",
                    help="Don't apply the default brief-250 exclusions.")
    ap.add_argument("--json", type=Path, default=None,
                    help="Write the full family dump to this JSON path.")
    ap.add_argument("--out", type=Path, default=None,
                    help="Write the Markdown worklist to this path.")
    args = ap.parse_args(argv)

    predictions = args.predictions or _default_predictions(args.version)
    if not predictions.is_file():
        print(f"error: predictions not found at {predictions}; run "
              f"tools/predict_walls.py first", file=sys.stderr)
        return 2

    config_dir = ROOT / "config" / args.version
    if not (config_dir / "arm9" / "config.yaml").is_file():
        print(f"error: config not found at {config_dir}/arm9/config.yaml",
              file=sys.stderr)
        return 2

    seeds: list[tuple[str, int]] = []
    if not args.no_default_excludes:
        seeds.extend(_parse_seed(s) for s in DEFAULT_EXCLUDE_SEEDS)
    if args.exclude_seed:
        seeds.extend(args.exclude_seed)

    asm_root = (
        args.asm_cache.resolve()
        if args.asm_cache is not None
        else ensure_disasm(args.version, force=args.force_disasm)
    )
    if not asm_root.is_dir():
        print(f"error: asm tree {asm_root} not found", file=sys.stderr)
        return 2

    picks = load_wall_picks(predictions, args.wall)
    bodies = extract_bodies(asm_root)
    matched_ranges = collect_matched_ranges(config_dir)
    report = build_cohort(picks, bodies, matched_ranges,
                          wall=args.wall, exclude_seeds=seeds)

    if args.json is not None:
        args.json.write_text(render_json(report), encoding="utf-8")
        print(f"wrote {args.json}", file=sys.stderr)
    if args.out is not None:
        args.out.write_text(render_markdown(report, top=args.top),
                            encoding="utf-8")
        print(f"wrote {args.out}", file=sys.stderr)

    sys.stdout.write(render_text(report, top=args.top,
                                 sig_lines=args.sig_lines))
    return 0


if __name__ == "__main__":
    sys.exit(main())
