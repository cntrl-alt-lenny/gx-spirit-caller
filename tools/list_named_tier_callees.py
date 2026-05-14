#!/usr/bin/env python3

"""
list_named_tier_callees.py — enumerate the upstream + local named
NitroSDK / MSL_C / libnns API surface.

Brief 065 wave 3 surfaced a class of port failures: a function in
the bulk-port pool calls something (e.g. `Fill32`, `MI_CpuFill32`,
`OS_GetTick`) that's already named upstream but unported in our
config. `port_to_region.py` rewrites the call's address-keyed
symbol via `find_region_siblings`, but if the linker expects the
**named** function (which our `delinks.txt` doesn't yet know about),
the build fails downstream.

The pre-port filter the decomper wires this tool into:

  1. For each EUR function in the wave's pool, list its callees.
  2. For each callee, look up its byte-fingerprint match (e.g.
     via `find_external_source.py --byte-scan` brief 068 output).
  3. If a callee fingerprint-matches a name in this tool's output
     AND that name isn't yet in our config / our delinks.txt,
     skip the port (the callee is upstream-named but not yet
     pulled in — port it first or accept the linker break).

This tool produces the "names that are upstream-API or already
local-named" set. Decomper consumes via JSON / CSV.

Sources:

  - Local: `config/<region>/**/symbols.txt` — names already in our
    own config (e.g. BIOS thunks: `Fill32`, `CpuSet`, `IntrWait`).
  - Upstream: vendored decomp repos in `tools/_vendor/<repo>/`,
    walked via the same `find_external_source.build_external_index()`
    infrastructure brief 066/068 ships.

Output is grouped by **family** (a short prefix like `MI_`, `OS_`,
`FS_`, etc.). Family-based grouping mirrors how the NitroSDK is
organized and helps the decomper scope wave-by-wave coverage
(e.g., "wave 4: any port whose callees only touch `MI_*` /
already-resolved" → smaller, more predictable wave).

Usage:

    # List everything (text, grouped by family)
    python tools/list_named_tier_callees.py

    # JSON output (decomper's pre-port filter consumes this)
    python tools/list_named_tier_callees.py --format json

    # Filter to one family (e.g. just MI_*)
    python tools/list_named_tier_callees.py --family MI

    # Local-only (skip upstream walk) — useful for "what's
    # already in our config that ports might collide with"
    python tools/list_named_tier_callees.py --no-upstream

    # Specific region (default: eur)
    python tools/list_named_tier_callees.py --region usa
"""

from __future__ import annotations

import argparse
import csv
import json
import re
import sys
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
CONFIG_DIR = ROOT / "config"


# Family prefix → human-readable group label. Order matters for
# the longest-prefix-wins family-of detection (`MATH_` before any
# imagined `M_`). Families pulled from a survey of pokediamond's
# arm9/lib/NitroSDK/src/ file prefixes + our own EUR config's
# named entries.
FAMILIES: list[tuple[str, str]] = [
    ("CARD_",  "card"),
    ("CTRDG_", "ctrdg"),
    ("MATH_",  "math"),
    ("MIi_",   "mi-internal"),  # before MI_ to win the prefix race
    ("MI_",    "mi"),
    ("OSi_",   "os-internal"),
    ("OS_",    "os"),
    ("FX_",    "fx"),
    ("FS_",    "fs"),
    ("GX_",    "gx"),
    ("G2_",    "g2"),
    ("G3_",    "g3"),
    ("PXI_",   "pxi"),
    ("RTC_",   "rtc"),
    ("SND_",   "snd"),
    ("WMi_",   "wm-internal"),
    ("WM_",    "wm"),
    ("CP_",    "cp"),
    ("NNS_",   "nns"),
    ("DC_",    "dc"),
    ("DGT_",   "dgt"),
    ("Task_",  "task"),
    ("IRQ_",   "irq"),
    ("DMA_",   "dma"),
]

# Symbols without a family prefix but that are still in the
# "named-tier" by virtue of being canonical NitroSDK names (BIOS
# thunks etc.). Hardcoded — these don't fit any prefix family.
UNPREFIXED_NAMED: frozenset[str] = frozenset({
    # BIOS / system thunks (named in our own config)
    "VBlankIntrWait", "IntrWait", "WaitByLoop", "Halt", "Sqrt",
    "SoftReset", "GetCRC16", "Mod", "Div", "Entry", "AutoloadCallback",
    "IsDebugger", "BuildInfo", "main",
    # Compress / decompress
    "CpuSet", "CpuFastSet", "BitUnPack",
    "LZ77UnCompReadByCallbackWrite16bit",
    "LZ77UnCompReadNormalWrite8bit",
    "HuffUnCompReadByCallback",
    "RLUnCompReadByCallbackWrite16bit",
    "RLUnCompReadNormalWrite8bit",
    # CPU-fill family (Fill32 is the brief-065 wave-3 trigger)
    "Fill32", "Copy32",
    # MSL_C / libc
    "strcmp", "strncmp", "strlen", "strcpy", "strncpy",
    "memcpy", "memset", "memcmp",
    "malloc", "free", "calloc", "realloc",
    "sprintf", "snprintf", "vsprintf", "vsnprintf",
    "abs", "atoi", "atol", "atof",
})


@dataclass(frozen=True)
class NamedSymbol:
    """One named-tier entry."""
    name: str
    family: str             # short slug ("mi", "os", "fs", "unprefixed", "other")
    source: str             # "local:<region>" or "upstream:<repo>"
    detail: str             # path / address depending on source

    def to_dict(self) -> dict:
        return {
            "name": self.name,
            "family": self.family,
            "source": self.source,
            "detail": self.detail,
        }


def family_of(name: str) -> str:
    """Pick the family slug for a given name. Longest-prefix wins
    (so `MATH_crc16` lands in `math`, not whatever shorter prefix
    might come first). Falls back to `unprefixed` for known
    BIOS-thunk-style names, `other` for everything else."""
    for prefix, slug in FAMILIES:
        if name.startswith(prefix):
            return slug
    if name in UNPREFIXED_NAMED:
        return "unprefixed"
    return "other"


# --------------------------------------------------------------------------- #
# Local source: walk config/<region>/**/symbols.txt
# --------------------------------------------------------------------------- #


# Lines in symbols.txt look like:
#   VBlankIntrWait kind:function(thumb,size=0x6) addr:0x02000086
#   func_02000950 kind:function(arm,size=0xac) addr:0x02000950
# We accept the first whitespace-separated token as the name and
# filter out lines that start with `func_` (still-unmatched
# placeholders — those are exactly what we're trying to *find*
# named upstream sources for, not include in the named-tier list).
_SYMBOLS_LINE_RE = re.compile(
    r"^(?P<name>[A-Za-z_][\w]*)\s+kind:function"
)


def collect_local_named(region: str) -> list[NamedSymbol]:
    """Walk all symbols.txt files under config/<region>/ and
    return every named function (i.e. NOT `func_<8hex>`)."""
    out: list[NamedSymbol] = []
    region_dir = CONFIG_DIR / region
    if not region_dir.is_dir():
        return out
    seen: set[str] = set()
    for sym_file in region_dir.rglob("symbols.txt"):
        try:
            rel = sym_file.relative_to(ROOT)
        except ValueError:
            # CONFIG_DIR mocked to a tmp path outside ROOT (test
            # harness); fall back to using the absolute path.
            rel = sym_file
        try:
            text = sym_file.read_text(encoding="utf-8")
        except OSError:
            continue
        for line in text.splitlines():
            m = _SYMBOLS_LINE_RE.match(line)
            if not m:
                continue
            name = m.group("name")
            # Skip the address-keyed placeholders that haven't been
            # named yet. Those are what brief 069 is trying to map.
            if name.startswith("func_"):
                continue
            if name in seen:
                continue
            seen.add(name)
            out.append(NamedSymbol(
                name=name,
                family=family_of(name),
                source=f"local:{region}",
                detail=str(rel),
            ))
    return out


# --------------------------------------------------------------------------- #
# Upstream source: walk vendored repos via find_external_source
# --------------------------------------------------------------------------- #


def collect_upstream_named() -> list[NamedSymbol]:
    """Re-use find_external_source's vendored-repo indexer. Each
    `.c`-defined function name becomes a named-tier entry tagged
    with `upstream:<repo>`."""
    # Lazy-import to keep startup cheap when --no-upstream is used.
    sys.path.insert(0, str(Path(__file__).resolve().parent))
    try:
        import find_external_source as fes  # noqa: E402
    except ImportError:
        return []
    out: list[NamedSymbol] = []
    seen: set[tuple[str, str]] = set()  # (repo, name) — dedupe within repo
    index = fes.build_external_index()
    for name, funcs in index.items():
        # `static` helpers and obvious internal scaffolding names
        # are not part of the public NitroSDK surface — but they
        # *are* still real callees that decomper might encounter
        # in a port. Include them; let the family filter sort the
        # noise.
        for fn in funcs:
            key = (fn.repo, name)
            if key in seen:
                continue
            seen.add(key)
            out.append(NamedSymbol(
                name=name,
                family=family_of(name),
                source=f"upstream:{fn.repo}",
                detail=f"{fn.file_rel}:{fn.line}",
            ))
    return out


# --------------------------------------------------------------------------- #
# Aggregation
# --------------------------------------------------------------------------- #


def collect_all(
    region: str = "eur", include_upstream: bool = True,
) -> list[NamedSymbol]:
    """Merge local + upstream. Returns a list sorted by family
    then name for stable diffing."""
    out: list[NamedSymbol] = []
    out.extend(collect_local_named(region))
    if include_upstream:
        out.extend(collect_upstream_named())
    out.sort(key=lambda s: (s.family, s.name, s.source))
    return out


def filter_by_family(
    symbols: list[NamedSymbol], family_prefix: str,
) -> list[NamedSymbol]:
    """Filter by family slug OR by raw prefix. Helps the decomper
    scope to one wave's worth of API surface."""
    # First try slug match (exact)
    by_slug = [s for s in symbols if s.family == family_prefix.lower()]
    if by_slug:
        return by_slug
    # Fall back to raw prefix match on name
    return [s for s in symbols
            if s.name.startswith(family_prefix)]


# --------------------------------------------------------------------------- #
# Output renderers
# --------------------------------------------------------------------------- #


def render_text(symbols: list[NamedSymbol]) -> str:
    """Grouped-by-family human-readable text. Counts per group."""
    if not symbols:
        return "(no named-tier symbols)\n"
    lines: list[str] = []
    # Group by family
    by_fam: dict[str, list[NamedSymbol]] = {}
    for s in symbols:
        by_fam.setdefault(s.family, []).append(s)
    families = sorted(by_fam.keys())
    total = len(symbols)
    lines.append(
        f"{total} named-tier symbol(s) across "
        f"{len(families)} famil{'ies' if len(families) != 1 else 'y'}:"
    )
    lines.append("")
    for fam in families:
        rows = by_fam[fam]
        # Dedupe names within family (same name can appear from
        # both local and upstream sources)
        unique_names = sorted({s.name for s in rows})
        lines.append(f"  {fam:<14}  ({len(unique_names)} unique)")
        for name in unique_names:
            sources = sorted({s.source for s in rows if s.name == name})
            lines.append(f"    {name:<40}  from: {', '.join(sources)}")
        lines.append("")
    return "\n".join(lines).rstrip() + "\n"


def render_json(symbols: list[NamedSymbol]) -> str:
    """Machine-readable JSON. Decomper's pre-port filter consumes
    this directly."""
    return json.dumps(
        [s.to_dict() for s in symbols],
        indent=2,
    ) + "\n"


def render_csv(symbols: list[NamedSymbol]) -> str:
    """CSV format for spreadsheets / grep."""
    buf: list[str] = []
    writer = csv.writer(_BufWriter(buf))
    writer.writerow(["name", "family", "source", "detail"])
    for s in symbols:
        writer.writerow([s.name, s.family, s.source, s.detail])
    return "".join(buf)


class _BufWriter:
    def __init__(self, buf: list):
        self.buf = buf

    def write(self, s: str) -> None:
        self.buf.append(s)


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #


def main(argv: list[str] | None = None) -> int:
    p = argparse.ArgumentParser(
        description="Enumerate the upstream + local named NitroSDK / "
                    "MSL_C / libnns API surface for the decomper's "
                    "pre-port filter (brief 065 wave 3 follow-up).",
    )
    p.add_argument("--region", default="eur",
                   help="Local config region (default: eur).")
    p.add_argument("--no-upstream", action="store_true",
                   help="Skip the vendored-repo walk; report only "
                        "local-named symbols.")
    p.add_argument("--family",
                   help="Filter to one family (slug like `mi` / `os` "
                        "or raw prefix like `MI_` / `OS_`).")
    p.add_argument("--format", choices=("text", "json", "csv"),
                   default="text",
                   help="Output format (default: text).")
    args = p.parse_args(argv)

    symbols = collect_all(
        region=args.region,
        include_upstream=not args.no_upstream,
    )
    if args.family:
        symbols = filter_by_family(symbols, args.family)

    if args.format == "json":
        sys.stdout.write(render_json(symbols))
    elif args.format == "csv":
        sys.stdout.write(render_csv(symbols))
    else:
        sys.stdout.write(render_text(symbols))
    return 0


if __name__ == "__main__":
    sys.exit(main())
