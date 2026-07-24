#!/usr/bin/env python3

"""
Reports decomp progress for Yu-Gi-Oh! GX Spirit Caller.

Three sources, in order of preference (descending fidelity):

  1. build/<version>/report.json produced by `ninja report`
     (i.e. `objdiff-cli report generate`). Post-decomp + post-build, this
     is the source of truth — reports matched code %, matched data %,
     complete-unit counts, etc. Requires the full toolchain to generate.

  2. config/<version>/**/delinks.txt produced by `dsd init` + hand-carved
     TU headers. Sums the byte ranges of TUs marked `complete` as matched
     code/data, against the module section maps as totals. No build
     required — works in CI where the baserom and toolchain aren't
     available. A "complete" TU in delinks is a strong signal that
     objdiff agrees the bytes match (that's what the decomper types in
     once they verify 100% match).

  3. config/<version>/**/symbols.txt — the list of every known symbol.
     Pre-carve fallback: just counts function entries so the denominator
     is non-zero. Matched is always 0 here. Used only when neither
     report.json nor any TU-carved delinks.txt exists.

All three produce the same top-level shape when `--json` is passed so
downstream tools (update_progress_badge.py, generate_heatmap.py) don't
need to know which source was used.
"""

import argparse
import json
import re
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent

# Section classifications for the delinks.txt tier. Matches objdiff's
# own categorisation (.text + .init count as code; everything else that
# carries actual bytes counts as data).
CODE_SECTIONS = {".text", ".init"}
DATA_SECTIONS = {".data", ".rodata", ".ctor", ".dtor", ".bss"}

# A data TU is considered typed-array readable only when its source contains
# a file-scope array declaration. This deliberately does not infer types from
# comments or from a `data_*` filename alone.
_DATA_ARRAY_DECL_RE = re.compile(
    r"(?m)^\s*(?:(?:static|const|volatile|unsigned|signed|long|short|"
    r"struct|union|enum|u?int\d*|[A-Za-z_]\w*)\s+)+"
    r"[A-Za-z_]\w*\s*\[[^\]]*\]\s*(?:=|;)")


def count_functions_in_symbols(symbols_file: Path) -> int:
    """Count how many symbols in a dsd symbols.txt file are functions.

    ds-decomp's symbols.txt uses a 'kind:function' field per line; if the
    schema changes this heuristic will under/over-count, which is fine for
    a 0% stub — replace with the real parser when it matters.
    """
    count = 0
    try:
        with symbols_file.open() as f:
            for line in f:
                line = line.strip()
                if not line or line.startswith("#"):
                    continue
                # Match both "kind:function" and "function" as token.
                if "kind:function" in line or " function " in f" {line} ":
                    count += 1
    except OSError:
        pass
    return count


def count_total_functions(config_dir: Path) -> int:
    total = 0
    for symbols in config_dir.rglob("symbols.txt"):
        total += count_functions_in_symbols(symbols)
    return total


# --------------------------------------------------------------------------- #
# delinks.txt tier
# --------------------------------------------------------------------------- #

def parse_delinks_file(delinks_file: Path) -> tuple[list[tuple[str, int, int]], list[dict]]:
    """Parse a dsd-produced delinks.txt.

    Returns a tuple `(module_sections, tus)`:

      module_sections: list of (section_name, start, end) tuples for the
        module-wide section map at the top of the file — the
        authoritative byte-range totals for this module.

      tus: list of TU dicts, each
          {"source": "src/...c" or "_dsd_gap@...",
           "status": "complete" | None,
           "sections": [(name, start, end), ...]}

    File layout:

        .text       start:0x... end:0x... kind:code align:32   <-- module map
        .rodata     start:...                                  <-- module map
        ...                                                    <-- blank line
        src/path/foo.c:                                        <-- TU header
            complete                                           <-- optional
            .text start:0x... end:0x...                        <-- section
        _dsd_gap@mod_N:                                        <-- gap TU
            .text start:...
    """
    module_sections: list[tuple[str, int, int]] = []
    tus: list[dict] = []
    current_tu: dict | None = None
    in_tu_section = False  # False while we're still in the leading module map

    if not delinks_file.is_file():
        return module_sections, tus

    try:
        with delinks_file.open() as f:
            for raw in f:
                line = raw.rstrip()
                stripped = line.strip()
                if not stripped or stripped.startswith("#"):
                    continue

                # TU header: `src/...:` or `_dsd_gap@...:`
                if stripped.endswith(":") and not stripped.startswith("."):
                    if current_tu is not None:
                        tus.append(current_tu)
                    current_tu = {
                        "source": stripped.rstrip(":"),
                        "status": None,
                        "sections": [],
                    }
                    in_tu_section = True
                    continue

                # Status line: `complete` (or other bare keyword). Only
                # meaningful once we're inside a TU.
                if in_tu_section and current_tu is not None and \
                   stripped in ("complete", "incomplete"):
                    current_tu["status"] = stripped
                    continue

                # Section line: starts with a dot.
                if stripped.startswith("."):
                    parts = stripped.split()
                    section_name = parts[0]
                    start = end = None
                    for p in parts[1:]:
                        if p.startswith("start:0x"):
                            start = int(p[len("start:0x"):], 16)
                        elif p.startswith("end:0x"):
                            end = int(p[len("end:0x"):], 16)
                    if start is None or end is None:
                        continue
                    if in_tu_section and current_tu is not None:
                        current_tu["sections"].append((section_name, start, end))
                    else:
                        module_sections.append((section_name, start, end))
                    continue
                # Any other line (unrecognised): leave TU context alone.
        if current_tu is not None:
            tus.append(current_tu)
    except OSError:
        pass
    return module_sections, tus


def _strip_c_comments_and_literals(source: str) -> str:
    """Blank comments and string/char literals without joining tokens.

    The readable-C classifier must not turn a documentation example such as
    ``/* asm void fake() */`` into ASM-C. Blanking rather than deleting keeps
    token boundaries and line structure stable for the small lexical scan.
    """
    out: list[str] = []
    i = 0
    state = "code"
    while i < len(source):
        ch = source[i]
        nxt = source[i + 1] if i + 1 < len(source) else ""
        if state == "code":
            if ch == "/" and nxt == "/":
                out.extend("  ")
                i += 2
                state = "line-comment"
            elif ch == "/" and nxt == "*":
                out.extend("  ")
                i += 2
                state = "block-comment"
            elif ch in ('"', "'"):
                out.append(" ")
                i += 1
                state = "string" if ch == '"' else "char"
            else:
                out.append(ch)
                i += 1
        elif state == "line-comment":
            if ch == "\n":
                out.append("\n")
                state = "code"
            else:
                out.append(" ")
            i += 1
        elif state == "block-comment":
            if ch == "*" and nxt == "/":
                out.extend("  ")
                i += 2
                state = "code"
            else:
                out.append("\n" if ch == "\n" else " ")
                i += 1
        else:  # string or character literal
            if ch == "\\" and i + 1 < len(source):
                out.extend("  ")
                i += 2
            elif (state == "string" and ch == '"') or (
                state == "char" and ch == "'"
            ):
                out.append(" ")
                i += 1
                state = "code"
            else:
                out.append("\n" if ch == "\n" else " ")
                i += 1
    return "".join(out)


def classify_c_source(source: str) -> str:
    """Return ``natural-c`` or ``asm-c`` for a C/C++ source body.

    The project uses Metrowerks' declaration-style ``asm`` escape hatch;
    retain a generic ``asm`` token fallback for non-void return types and
    statement-style/extension spellings. Comments and literals are blanked
    first so prose mentioning asm remains Natural-C.
    """
    clean = _strip_c_comments_and_literals(source)
    if re.search(r"\b(?:__asm|asm)\b", clean, flags=re.IGNORECASE):
        return "asm-c"
    return "natural-c"


def c_code_bytes_by_class(
    config_dir: Path, *, require_complete: bool = False,
) -> dict[str, int]:
    """Return readable-C `.text` bytes split into natural-C and ASM-C.

    This is deliberately the same delinks walk as :func:`c_code_bytes`;
    keeping the aggregate as the sum of these two buckets makes the metric
    split backward-compatible and mechanically sum-preserving.
    """
    totals = {"natural-c": 0, "asm-c": 0}
    source_classes: dict[str, str] = {}
    for delinks in config_dir.rglob("delinks.txt"):
        _module_sections, tus = parse_delinks_file(delinks)
        for tu in tus:
            source = tu.get("source", "")
            if not (source.endswith(".c") or source.endswith(".cpp")):
                continue
            if require_complete and tu.get("status") != "complete":
                continue
            category = source_classes.get(source)
            if category is None:
                source_path = ROOT / Path(source)
                try:
                    text = source_path.read_text(encoding="utf-8")
                except OSError:
                    # Preserve the old metric's behavior for synthetic or
                    # incomplete fixtures whose source body is unavailable.
                    category = "natural-c"
                else:
                    category = classify_c_source(text)
                source_classes[source] = category
            for name, start, end in tu.get("sections", []):
                if name == ".text":
                    totals[category] += max(0, end - start)
    return totals


def c_code_bytes(config_dir: Path, *, require_complete: bool = False) -> int:
    """Sum of `.text` bytes for TUs sourced from a `.c`/`.cpp` file (never
    `.s`) across every `config_dir/**/delinks.txt`.

    This is the metric `matched_code` (above) and `complete_units` CANNOT
    give you: both of those count a `.s` ship (a byte-identical assembly
    escape hatch, never hand-decompiled) identically to a real C match —
    see the improvement-swarm r3 report's REFRAME finding. `c_code_bytes`
    is the true "readable C" numerator; pair it against
    `c_code_total_bytes`'s `.text`-only denominator for the % line (NOT
    `summarize_delinks`'s `total_code`, which also includes `.init` —
    see `c_code_total_bytes`'s docstring for why that mismatch matters).

    Pass `require_complete=True` for the stricter "verified byte-
    matching only" view (gates on `status == "complete"`, the same
    status `summarize_delinks` requires for `matched_code`). The
    default (`False`) counts any `.c`/`.cpp`-sourced TU regardless of
    match state — an in-progress draft is still real C on disk,
    arguably readable, just not yet byte-verified.

    No build required — same delinks.txt-only data source as
    `summarize_delinks`. Originally lived in `generate_progress_bars.py`
    (which now imports it from here) — moved to `progress.py` so the
    headline text/JSON reporter can carry the same honest number, not
    just the SVG badge.

    Uses the canonical `parse_delinks_file` (brief 566 / improvement-
    swarm r4 A3) rather than a bespoke regex scan — the earlier regex
    tracked "current TU's source extension" as a variable that
    persisted across TU boundaries, so a `_dsd_gap@...` TU immediately
    following a `.c`/`.cpp` TU had its `.text` bytes silently
    misattributed to C (gap TU headers never match the src/libs regex,
    so the leaked `ext` value was never reset). Iterating `tus` gives
    each TU its own correctly-scoped `source` field, eliminating that
    leak by construction.
    """
    return sum(c_code_bytes_by_class(
        config_dir, require_complete=require_complete,
    ).values())


def c_code_total_bytes(config_dir: Path) -> int:
    """Sum of `.text`-only bytes from the MODULE-LEVEL section map
    across every `config_dir/**/delinks.txt` — the correct denominator
    for `c_code_bytes()`'s ratio (brief 566 / improvement-swarm r4 A3).

    `summarize_delinks`'s `total_code` sums `.text` + `.init`
    (`CODE_SECTIONS`), which is right for the "byte-matched" line
    (`.init` genuinely is code, and a `.s` or `.c` TU can occupy
    either section). But `c_code_bytes()`'s numerator only ever scans
    `.text` ranges — even for a `.c`/`.cpp` TU that also owns `.init`
    bytes (e.g. `sinit_*.c` static-initializer glue) — so pairing that
    numerator against a `.text`+`.init` denominator means the ratio
    can never reach 100% even at full decomp: it's structurally capped
    at `1 - init_bytes/total_code` (~99.907% for EUR at the time of
    writing). This function gives the `.text`-only total so both sides
    of the ratio count exactly the same section set.
    """
    total = 0
    for delinks in config_dir.rglob("delinks.txt"):
        module_sections, _tus = parse_delinks_file(delinks)
        for name, start, end in module_sections:
            if name == ".text":
                total += max(0, end - start)
    return total


def summarize_delinks(config_dir: Path) -> dict | None:
    """Walk every config/<ver>/**/delinks.txt and aggregate byte totals
    into a report.json-shaped dict. Returns None if no delinks.txt
    files are found.

    Totals come from the module section maps (authoritative). Matched
    sums sections from TUs whose status is `complete`.
    """
    all_delinks = list(config_dir.rglob("delinks.txt"))
    if not all_delinks:
        return None

    matched_code = total_code = matched_data = total_data = 0
    matched_units = total_units = 0

    for delinks in all_delinks:
        module_sections, tus = parse_delinks_file(delinks)

        # Totals — from the module-level section map.
        for name, start, end in module_sections:
            size = max(0, end - start)
            if name in CODE_SECTIONS:
                total_code += size
            elif name in DATA_SECTIONS:
                total_data += size

        # Matched — from TUs with status=complete. Gap entries
        # (`_dsd_gap@...`) are uncarved TUs that count toward the
        # denominator (they're chunks to eventually match) but never
        # toward matched (status=complete is typed by the decomper once
        # objdiff agrees).
        for tu in tus:
            total_units += 1
            if tu.get("source", "").startswith("_dsd_gap"):
                continue
            if tu.get("status") != "complete":
                continue
            matched_units += 1
            for name, start, end in tu.get("sections", []):
                size = max(0, end - start)
                if name in CODE_SECTIONS:
                    matched_code += size
                elif name in DATA_SECTIONS:
                    matched_data += size

    return {
        "source": "delinks",
        "measures": {
            # Match report.json's str-bytes convention for values that
            # could overflow JS safe-int range in downstream tooling.
            "matched_code":    str(matched_code),
            "total_code":      str(total_code),
            "matched_data":    str(matched_data),
            "total_data":      str(total_data),
            "complete_units":  matched_units,
            "total_units":     total_units,
        },
    }


def summarize_data_readability(config_dir: Path) -> dict[str, int | float]:
    """Return build-free data naming and typed-array readability metrics.

    Named-data is a symbol-count metric: only real names are counted, while
    ``data_*`` placeholders and dsd synthetic names are excluded from the
    denominator. Typed-array bytes are the DATA_SECTIONS bytes owned by a
    ``.c``/``.cpp`` TU whose source contains a file-scope typed-array
    declaration. Both walks use the same module-level delinks ranges as the
    existing data% fallback.
    """
    named_symbols = placeholder_symbols = 0
    for symbols_file in config_dir.rglob("symbols.txt"):
        try:
            lines = symbols_file.read_text(encoding="utf-8").splitlines()
        except OSError:
            continue
        for line in lines:
            if "kind:data" not in line:
                continue
            name = line.split(None, 1)[0]
            if name.startswith("data_"):
                placeholder_symbols += 1
            elif name.startswith(".p_") or name.startswith("SecureAreaData_"):
                continue
            else:
                named_symbols += 1

    data_total_bytes = typed_array_bytes = 0
    for delinks in config_dir.rglob("delinks.txt"):
        module_sections, tus = parse_delinks_file(delinks)
        data_total_bytes += sum(
            max(0, end - start)
            for name, start, end in module_sections
            if name in DATA_SECTIONS
        )
        for tu in tus:
            source = tu.get("source", "")
            if not (source.endswith(".c") or source.endswith(".cpp")):
                continue
            try:
                source_text = (ROOT / Path(source)).read_text(encoding="utf-8")
            except OSError:
                continue
            if not _DATA_ARRAY_DECL_RE.search(source_text):
                continue
            typed_array_bytes += sum(
                max(0, end - start)
                for name, start, end in tu.get("sections", [])
                if name in DATA_SECTIONS
            )

    total_symbols = named_symbols + placeholder_symbols
    return {
        "named_data_symbols": named_symbols,
        "total_data_symbols": total_symbols,
        "named_data_pct": (named_symbols / total_symbols * 100.0)
        if total_symbols else 0.0,
        "typed_array_bytes": typed_array_bytes,
        "data_total_bytes": data_total_bytes,
        "typed_array_pct": (typed_array_bytes / data_total_bytes * 100.0)
        if data_total_bytes else 0.0,
    }


# --------------------------------------------------------------------------- #
# Per-module breakdown (brief 587 / improvement-swarm r5)
# --------------------------------------------------------------------------- #

def _discover_module_delinks(config_dir: Path) -> list[tuple[str, Path]]:
    """[(module_name, delinks_path)] in main/itcm/dtcm/ovNNN order.

    Deliberately a small local walk rather than importing calcrom.py's
    own `discover_module_paths` (which additionally requires a sibling
    relocs.txt this function doesn't need): progress.py is the
    dependency root other tools import FROM (see `c_code_bytes`'s
    docstring and improvement-swarm r4 A3), not the reverse — pulling
    from calcrom here would invert that and risk a circular import if
    calcrom ever imports something from progress (it already sources
    its own `measures` from `summarize_delinks`, per r4's structural-fix
    note).
    """
    arm9 = config_dir / "arm9"
    out: list[tuple[str, Path]] = []
    if not arm9.is_dir():
        return out
    main_delinks = arm9 / "delinks.txt"
    if main_delinks.is_file():
        out.append(("main", main_delinks))
    for name in ("itcm", "dtcm"):
        d = arm9 / name / "delinks.txt"
        if d.is_file():
            out.append((name, d))
    ov_root = arm9 / "overlays"
    if ov_root.is_dir():
        for sub in sorted(ov_root.iterdir()):
            if sub.is_dir() and sub.name.startswith("ov"):
                d = sub / "delinks.txt"
                if d.is_file():
                    out.append((sub.name, d))
    return out


# --------------------------------------------------------------------------- #
# Honest metric: tractable-C ceiling, attainment, done-class (brief 615 /
# r7-14, r7-15, r7-16)
# --------------------------------------------------------------------------- #
#
# Headline byte-% has always been sold as the progress number, but the
# ceiling for READABLE C was never 100% of bytes — a `.s` ship byte-matches
# without ever becoming C, and two modules carry known, named reasons their
# remaining bytes will likely never convert. This section makes that
# ceiling a first-class, per-module estimate instead of an unstated
# assumption, so `attainment = C / ceiling` (not `C / total_bytes`) can be
# the honest rate-of-progress number (r7-13's "north-star").
#
# TIER 1 -- ASYMPTOTIC. Hard-coded set, not derived: {main, ov002}. This
# is a direct, repeated, "confirmed" (not merely "plausible") finding of
# the r7 swarm (rnd-swarm-r7-verified.md r7-14/r7-15) -- verified here by
# recomputing the denominator share independently rather than trusting the
# prose: as of this brief, main + ov002's `.text`-only totals are 738,080
# + 1,129,252 = 1,867,332 B of EUR's 2,385,948 B region-wide `.text`
# total -- 78.3%, matching r7-14's cited "78% of the denominator" exactly.
# Two DIFFERENT reasons collapse into one tier: main's residual is
# reg-alloc-wall-bound code (`docs/research/codegen-walls.md`'s C-/P-/W-
# classes, none of which have a known source-form fix); ov002's is a
# project-level PRIORITY decision, not a technical wall -- it is already
# byte-complete (100% code%, see the delinks.txt tier), and the ongoing
# c-match campaign deliberately converts it .s-to-C selectively
# (HIGH/MED tiers, containment-gated) rather than exhaustively, because
# at 1.1 MB it is by far the largest single module. Both reasons argue
# for the SAME operational answer: assume most, not all, of the
# remaining non-C bytes stay non-C.
#
# TIER 2 -- FINISHABLE. Every other module. r7-15 further narrows this to
# a curated "14 finishable modules (~92 kB .s)" subset via its own deeper
# per-module wall census (that census's raw data -- workflow journal
# `wf_05209332-366` -- isn't available to this brief, and isn't
# reproducible from committed data alone). This implementation uses the
# broader, simpler "every non-asymptotic module" definition instead --
# documented here as a KNOWN divergence, not a silent one: it is a
# coarser, more optimistic approximation than r7-15's curated subset (see
# docs/research/brief-615-honest-metric.md for the measured aggregate
# ceiling this produces and how it compares to r7-14's stated 14-24%
# band).
#
# Ceiling formula (both tiers, same shape): current C stays current;
# the REMAINING non-C bytes (c_total - c_bytes) convert at a fixed,
# named, per-tier headroom fraction. This -- not a flat percentage of
# c_total -- guarantees ceiling >= c_bytes always, so attainment can
# never read above 100% by construction, including for modules already
# well into their remaining headroom.
ASYMPTOTIC_MODULES = frozenset({"main", "ov002"})

# 10%: a deliberately small but nonzero fraction. Zero would make
# attainment tautologically 100% for these two modules forever (ceiling
# == current by definition) -- unfalsifiable and uninformative. 10%
# reflects that SOME further conversion keeps landing even here (e.g.
# brief 609's ov002 struct-bank work), just far slower than elsewhere.
ASYMPTOTIC_HEADROOM_FRACTION = 0.10

# 75%: most of a finishable module's remaining non-C bytes are assumed
# reachable, netting out ~25% for the permanent ISA-instruction floor
# named in docs/research/campaign-analytics/endgame-ledger.md (mcr/mrc/
# swi/msr/mrs-carrying .s, ~42 EUR / 26 USA / 26 JPN files project-wide
# -- genuinely inexpressible in C) plus per-module walls this simpler
# model doesn't individually census.
FINISHABLE_HEADROOM_FRACTION = 0.75


def done_class(module: str) -> str:
    """'asymptotic' (ASYMPTOTIC_MODULES) or 'finishable' (everything
    else) -- r7-15's module-tier "meaningfully done" classification."""
    return "asymptotic" if module in ASYMPTOTIC_MODULES else "finishable"


def tractable_ceiling_bytes(module: str, c_bytes: int, c_total: int) -> int:
    """Estimated realistic ceiling for readable-C bytes in `module`, given
    its current `c_bytes` / `.text`-only `c_total` (brief 615). Not a
    measurement -- see the module docstring above for the tier
    assumptions this rests on.

    `c_bytes <= ceiling <= c_total` always (headroom fractions are
    clamped to [0, 1] and applied to the non-negative remainder), so a
    caller computing `c_bytes / ceiling` can never see attainment > 100%.
    """
    if c_total <= 0:
        return 0
    frac = (ASYMPTOTIC_HEADROOM_FRACTION if module in ASYMPTOTIC_MODULES
            else FINISHABLE_HEADROOM_FRACTION)
    frac = max(0.0, min(1.0, frac))
    remaining = max(0, c_total - c_bytes)
    return c_bytes + round(frac * remaining)


def summarize_by_module(config_dir: Path) -> list[dict]:
    """Per-module code% (`matched_code`/`total_code`, `CODE_SECTIONS`)
    AND C% (`.text`-only, `.c`/`.cpp`-sourced `complete` TUs over
    `.text`-only total — the same ratio `c_code_bytes`/
    `c_code_total_bytes` already report region-wide, brief 566 /
    improvement-swarm r4 A3) — broken out per module instead of summed
    across the whole region. Reuses `parse_delinks_file`; build-free
    (no report.json needed).

    No tool previously reported C% per module at all (improvement-swarm
    r5): 78.3% of EUR's denominator is 2 modules (arm9 + ov002) sitting
    at 6.58% combined C, capping the *headline* number at 26.89% even if
    every OTHER module hit 100% C — invisible without this breakdown.

    Brief 615 (r7-16) adds three honest-metric columns on top of the
    same byte data: `tractable_ceiling` (a tiered, wall-enriched
    estimate — see `tractable_ceiling_bytes()`), `attainment` (`c_bytes`
    / `tractable_ceiling`, `None` if the ceiling is 0 — undefined, not
    zero, matching e.g. `dtcm`'s 0/0), and `done_class` ("asymptotic" /
    "finishable", `done_class()`).

    Returns one dict per module, in discovery order (main, itcm, dtcm,
    ov000..ovNNN):
        {"module": str, "matched_code": int, "total_code": int,
         "c_bytes": int, "c_total": int, "tractable_ceiling": int,
         "attainment": float | None, "done_class": str}
    Raw byte counts, not percentages — callers compute the ratio (JSON
    payloads should carry the same values report.json's `measures` do,
    not a lossy pre-divided float). `attainment` is the one exception
    (already a ratio, not a byte count) since it is undefined rather
    than a lossy re-derivable fraction when `tractable_ceiling` is 0.
    """
    rows: list[dict] = []
    for module, delinks in _discover_module_delinks(config_dir):
        module_sections, tus = parse_delinks_file(delinks)

        total_code = matched_code = 0
        c_total = 0
        for name, start, end in module_sections:
            size = max(0, end - start)
            if name in CODE_SECTIONS:
                total_code += size
            if name == ".text":
                c_total += size

        c_bytes = 0
        for tu in tus:
            source = tu.get("source", "")
            is_gap = source.startswith("_dsd_gap")
            complete = tu.get("status") == "complete"
            for name, start, end in tu.get("sections", []):
                size = max(0, end - start)
                if not is_gap and complete and name in CODE_SECTIONS:
                    matched_code += size
                if complete and name == ".text" and (
                    source.endswith(".c") or source.endswith(".cpp")):
                    c_bytes += size

        ceiling = tractable_ceiling_bytes(module, c_bytes, c_total)
        rows.append({
            "module": module,
            "matched_code": matched_code, "total_code": total_code,
            "c_bytes": c_bytes, "c_total": c_total,
            "tractable_ceiling": ceiling,
            "attainment": (c_bytes / ceiling) if ceiling else None,
            "done_class": done_class(module),
        })
    return rows


def print_by_module(version: str, rows: list[dict]) -> None:
    def pct(num: int, den: int) -> float:
        return (num / den * 100.0) if den else 0.0

    def attainment_str(row: dict) -> str:
        return f"{row['attainment'] * 100.0:6.2f}%" if row["attainment"] is not None else "    n/a"

    print(f"Yu-Gi-Oh! GX Spirit Caller ({version}) — per-module code% / C% "
          "/ honest metric (brief 615)")
    print()
    hdr = (f"  {'module':<8} {'code %':>7}  {'matched/total code (B)':>24}  "
           f"{'C %':>7}  {'C / .text-total (B)':>22}  "
           f"{'ceiling %':>9}  {'attainment':>10}  {'class':<11}")
    print(hdr)
    print("  " + "-" * (len(hdr) - 2))
    tot_matched = tot_total = tot_c = tot_ctotal = tot_ceiling = 0
    for row in rows:
        code_frac = f"{row['matched_code']}/{row['total_code']}"
        c_frac = f"{row['c_bytes']}/{row['c_total']}"
        print(f"  {row['module']:<8} {pct(row['matched_code'], row['total_code']):6.2f}%  "
              f"{code_frac:>24}  {pct(row['c_bytes'], row['c_total']):6.2f}%  {c_frac:>22}  "
              f"{pct(row['tractable_ceiling'], row['c_total']):8.2f}%  "
              f"{attainment_str(row):>10}  {row['done_class']:<11}")
        tot_matched += row["matched_code"]; tot_total += row["total_code"]
        tot_c += row["c_bytes"]; tot_ctotal += row["c_total"]
        tot_ceiling += row["tractable_ceiling"]
    print("  " + "-" * (len(hdr) - 2))
    tot_code_frac = f"{tot_matched}/{tot_total}"
    tot_c_frac = f"{tot_c}/{tot_ctotal}"
    tot_attainment = f"{tot_c / tot_ceiling * 100.0:6.2f}%" if tot_ceiling else "    n/a"
    print(f"  {'TOTAL':<8} {pct(tot_matched, tot_total):6.2f}%  "
          f"{tot_code_frac:>24}  {pct(tot_c, tot_ctotal):6.2f}%  {tot_c_frac:>22}  "
          f"{pct(tot_ceiling, tot_ctotal):8.2f}%  {tot_attainment:>10}  {'':<11}")
    print()
    print(f"  tractable-C ceiling: {tot_ceiling} / {tot_ctotal} bytes "
          f"({pct(tot_ceiling, tot_ctotal):.2f}% of .text-total) -- an ESTIMATE, "
          "not a measurement (see tractable_ceiling_bytes() for the tier "
          "assumptions); c.f. r7-14's independently-derived 14-24% band.")


# --------------------------------------------------------------------------- #
# CANARY: reconcile the by-module gap against the endgame ledger (brief 615)
# --------------------------------------------------------------------------- #
#
# docs/research/campaign-analytics/endgame-ledger.md (brief 583) is an
# independently-derived byte ledger: ov004's 3-region gap is 36.2% of the
# 3-region total (20,110 / 55,540 B at its 2026-07-16 snapshot, commit
# a9c4772d). It uses the SAME parse_delinks_file + CODE_SECTIONS method
# this module already implements (summarize_by_module's matched_code /
# total_code), so the two should reconcile near-exactly -- if they don't,
# either this file's byte accounting or the ledger's has drifted from
# reality, and the new honest-metric columns (built on this same data)
# would be silently wrong too. This function is the mandatory check for
# that, not merely a nice-to-have cross-reference.


def three_region_module_gaps(root: Path, regions: tuple[str, ...] = ("eur", "usa", "jpn")) -> dict[str, int]:
    """{module: 3-region-summed (total_code - matched_code)}, via the same
    `summarize_by_module` this file already uses for its per-region
    dashboard -- i.e. the SAME method (`parse_delinks_file` +
    `CODE_SECTIONS`) `docs/research/campaign-analytics/endgame-ledger.md`
    (brief 583) independently used, just called once per region and
    summed here instead of walked directly. Build-free."""
    gaps: dict[str, int] = {}
    for region in regions:
        for row in summarize_by_module(root / "config" / region):
            gaps[row["module"]] = gaps.get(row["module"], 0) + (row["total_code"] - row["matched_code"])
    return gaps


def canary_reconciliation(gaps: dict[str, int], module: str = "ov004",
                           expected_pct: float = 36.2, tolerance_pct: float = 1.0) -> dict:
    """Pure comparison: does `module`'s share of `gaps` fall within
    `tolerance_pct` percentage points of `expected_pct`? `gaps` is
    whatever `three_region_module_gaps()` (live) or a test fixture
    (pinned) produces -- kept separate from that I/O so the tolerance
    check itself is unit-testable without a real config/ tree.

    Returns {"module", "module_gap", "total_gap", "actual_pct",
    "expected_pct", "tolerance_pct", "delta_pct", "ok"}. `ok` is False
    (not an exception) on mismatch -- callers decide whether that's a
    hard stop (the CLI does) or just a warning to log.
    """
    total_gap = sum(gaps.values())
    module_gap = gaps.get(module, 0)
    actual_pct = (module_gap / total_gap * 100.0) if total_gap else 0.0
    delta = actual_pct - expected_pct
    return {
        "module": module, "module_gap": module_gap, "total_gap": total_gap,
        "actual_pct": actual_pct, "expected_pct": expected_pct,
        "tolerance_pct": tolerance_pct, "delta_pct": delta,
        "ok": abs(delta) <= tolerance_pct,
    }


def print_canary(result: dict) -> None:
    status = "OK" if result["ok"] else "MISMATCH"
    print(f"CANARY [{status}]: {result['module']} = {result['module_gap']} / "
          f"{result['total_gap']} B = {result['actual_pct']:.2f}% of the "
          f"3-region gap (ledger: {result['expected_pct']:.1f}%, "
          f"tolerance +/-{result['tolerance_pct']:.1f}pp, "
          f"delta {result['delta_pct']:+.2f}pp)")
    if not result["ok"]:
        print("  STOP: denominator does not reconcile with the endgame "
              "ledger (brief 583) within tolerance -- the honest-metric "
              "columns below rest on this same data and should not be "
              "trusted until this is root-caused.", file=sys.stderr)


def print_stub(version: str, total: int) -> None:
    if total == 0:
        print(f"{version}: no symbols.txt files found yet.")
        print("  run: python tools/configure.py <version> && ninja delink")
        return
    pct = 0.0
    print(f"Yu-Gi-Oh! GX Spirit Caller ({version}) — decomp progress")
    print()
    print(f"  functions matched:  0 / {total}  ({pct:5.2f}%)")
    print("  data matched:       (no report yet)")
    print()
    print("  Run `ninja report` after compiling any source to produce a real report.")


def print_report(version: str, report: dict, config_dir: Path | None = None) -> None:
    print(f"Yu-Gi-Oh! GX Spirit Caller ({version}) — decomp progress")
    print()
    measures = report.get("measures", {})

    def pct(matched, total):
        return (matched / total * 100.0) if total else 0.0

    # objdiff v2.7+ emits byte totals as strings (values exceed JS safe-int range).
    def as_int(v) -> int:
        return int(v) if v is not None else 0

    code_matched = as_int(measures.get("matched_code"))
    code_total   = as_int(measures.get("total_code"))
    data_matched = as_int(measures.get("matched_data"))
    data_total   = as_int(measures.get("total_data"))
    units_done   = as_int(measures.get("complete_units"))
    units_total  = as_int(measures.get("total_units"))

    print(f"  code:   {code_matched:>10} / {code_total:<10} bytes  ({pct(code_matched, code_total):5.2f}%)")
    print(f"  data:   {data_matched:>10} / {data_total:<10} bytes  ({pct(data_matched, data_total):5.2f}%)")
    print(f"  units:  {units_done:>10} / {units_total:<10}        ({pct(units_done, units_total):5.2f}%)")
    # 4th line (improvement-swarm r3 REFRAME): code/data/units above all
    # count a `.s` ship identically to a real C match, so none of them
    # can see the "readable C" goal. c_code_bytes is the true numerator.
    # Denominator is c_code_total_bytes (`.text`-only), NOT code_total
    # (`.text`+`.init`) — pairing the .text-only numerator against a
    # .text+.init denominator structurally caps the ratio below 100%
    # even at full decomp (brief 566 / improvement-swarm r4 A3).
    if config_dir is not None:
        c_split = c_code_bytes_by_class(config_dir)
        c_total = c_code_total_bytes(config_dir)
        c_matched = sum(c_split.values())
        print(f"  Natural-C:    {c_split['natural-c']:>10} / {c_total:<10} bytes  "
              f"({pct(c_split['natural-c'], c_total):5.2f}%)")
        print(f"  asm-C:        {c_split['asm-c']:>10} / {c_total:<10} bytes  "
              f"({pct(c_split['asm-c'], c_total):5.2f}%)")
        print(f"  C-decompiled: {c_matched:>10} / {c_total:<10} bytes  "
              f"({pct(c_matched, c_total):5.2f}%)  <- sum of Natural-C + asm-C")
        data_metric = summarize_data_readability(config_dir)
        print(f"  Named-data:   {data_metric['named_data_symbols']:>10} / "
              f"{data_metric['total_data_symbols']:<10} symbols  "
              f"({data_metric['named_data_pct']:5.2f}%)")
        print(f"  Typed-array:  {data_metric['typed_array_bytes']:>10} / "
              f"{data_metric['data_total_bytes']:<10} data bytes  "
              f"({data_metric['typed_array_pct']:5.2f}%)")
    print()

    if report.get("categories"):
        print("  by category:")
        for cat in report["categories"]:
            name = cat.get("name", "?")
            m = cat.get("measures", {})
            print(f"    {name:<20} code {pct(as_int(m.get('matched_code')), as_int(m.get('total_code'))):5.2f}%   "
                  f"data {pct(as_int(m.get('matched_data')), as_int(m.get('total_data'))):5.2f}%")


def main() -> int:
    ap = argparse.ArgumentParser(description="Report decomp progress")
    ap.add_argument("--version", default="usa", help='Game version (default: "usa")')
    ap.add_argument("--json", action="store_true", help="Emit machine-readable JSON")
    ap.add_argument("--by-module", action="store_true",
                    help="Per-module code%% AND C%% table (build-free, "
                         "delinks.txt tier only — brief 587), plus the "
                         "tractable-ceiling/attainment/done-class honest-"
                         "metric columns (brief 615)")
    ap.add_argument("--canary", action="store_true",
                    help="Reconcile the 3-region per-module gap against "
                         "the endgame ledger's ov004=36.2%% anchor "
                         "(brief 583/615); ignores --version, exits 1 "
                         "on mismatch")
    args = ap.parse_args()

    report_path = ROOT / "build" / args.version / "report.json"
    config_dir  = ROOT / "config" / args.version

    if args.canary:
        gaps = three_region_module_gaps(ROOT)
        result = canary_reconciliation(gaps)
        if args.json:
            json.dump(result, sys.stdout, indent=2)
            print()
        else:
            print_canary(result)
        return 0 if result["ok"] else 1

    if args.by_module:
        rows = summarize_by_module(config_dir)
        if not rows:
            print(f"error: no config under config/{args.version} (wrong region?)",
                  file=sys.stderr)
            return 1
        if args.json:
            json.dump({"version": args.version, "modules": rows}, sys.stdout, indent=2)
            print()
        else:
            print_by_module(args.version, rows)
        return 0

    # Tier 1 — objdiff-generated report.json. Highest fidelity; requires
    # a post-`ninja report` local build.
    if report_path.is_file():
        with report_path.open() as f:
            report = json.load(f)
        if args.json:
            payload = dict(report)
            c_split = c_code_bytes_by_class(config_dir)
            data_metric = summarize_data_readability(config_dir)
            payload["c_code_bytes"] = sum(c_split.values())
            payload["c_code_natural_bytes"] = c_split["natural-c"]
            payload["c_code_asm_bytes"] = c_split["asm-c"]
            payload["c_code_total_bytes"] = c_code_total_bytes(config_dir)
            payload.update(data_metric)
            json.dump(payload, sys.stdout, indent=2)
            print()
        else:
            print_report(args.version, report, config_dir)
        return 0

    # Tier 2 — delinks.txt-derived summary. Works in CI (no toolchain
    # or baserom needed); counts bytes in TUs the decomper has marked
    # `complete`. Approximate but correct-directional.
    delinks_summary = summarize_delinks(config_dir)
    if delinks_summary is not None and delinks_summary["measures"]["total_units"]:
        if args.json:
            # Merge a `state: delinks` tag so downstream tools can see
            # the provenance without changing their measures-reading code.
            c_split = c_code_bytes_by_class(config_dir)
            data_metric = summarize_data_readability(config_dir)
            payload = {"version": args.version, "state": "delinks",
                       "c_code_bytes": sum(c_split.values()),
                       "c_code_natural_bytes": c_split["natural-c"],
                       "c_code_asm_bytes": c_split["asm-c"],
                       "c_code_total_bytes": c_code_total_bytes(config_dir),
                       **data_metric,
                       **delinks_summary}
            json.dump(payload, sys.stdout, indent=2)
            print()
        else:
            print_report(args.version, delinks_summary, config_dir)
            print("  source: delinks.txt (approximate — run `ninja report` locally "
                  "for objdiff-verified numbers)")
        return 0

    # Tier 3 — pre-carve stub. Only runs when there is no delinks.txt
    # TU graph yet. Matched is always 0; just shows the denominator so
    # the badge says 0.00% of N functions instead of 0.00% of nothing.
    total = count_total_functions(config_dir)
    if args.json:
        json.dump({
            "version": args.version,
            "state": "stub",
            "total_functions": total,
            "matched_functions": 0,
        }, sys.stdout, indent=2)
        print()
    else:
        print_stub(args.version, total)
    return 0


if __name__ == "__main__":
    sys.exit(main())
