#!/usr/bin/env python3

"""
port_external_source.py — drive the cross-project port from
brief 068 byte-fingerprint match to a compiled ported `.c`.

Brief 070 deliverable. Companion to `tools/external_obj.py`
(brief 068 fingerprint pipeline) and `tools/find_external_source.py`
(brief 066 name-based lookup + brief 068 byte-scan CSV).

The pipeline:

  brief 068 CSV row → upstream .c source file
                    → compile .o
                    → extract bytes + reloc table
                    → verify byte-identity vs our placeholder
                    → for each callee in upstream's reloc table:
                        find OUR local name via byte-fingerprint
                        (NO sort-pair heuristic — the brief 069
                        wave 1 failure mode)
                    → rewrite upstream .c body with our local names
                    → emit libs/nitro/<our_name>.legacy.c +
                      delinks.txt entry

Brief 070's four deliverables; this PR ships **D1** (callee remap
via .o reloc table). D2 (primitive header vendoring), D3 (struct
access support), D4 (data-reference reloc handling) are explicit
skip-reasons in the driver — the port refuses cleanly with a
named reason rather than silently emitting wrong output.

Usage:

    # Port one specific (repo, src.c, upstream_func) to our target
    python tools/port_external_source.py \\
        --repo pokediamond \\
        --src arm9/lib/NitroSDK/src/OS_tick.c \\
        --upstream-func OS_InitTick \\
        --our-addr 0x020931f8

    # Dry-run (preview rewritten source + delinks entry, no write)
    python tools/port_external_source.py --dry-run ...

    # Sweep brief 068 CSV — port every row whose driver-skip
    # reasons don't fire; report metrics
    python tools/port_external_source.py --sweep <brief068.csv>

    # JSON output for tool chaining
    python tools/port_external_source.py --format json ...

Skip-reason taxonomy (brief 070 D2/D3/D4 unlock):

  callee-unresolvable: upstream callee has no byte-fingerprint match
                       in our pool. Brief 069 wave 1 callee-mapping
                       trap surfaces here as `callee-unresolvable`
                       rather than as silent self-recursion.
  data-ref:            upstream function reads/writes a data symbol
                       (D4 — analogous to D1 but for data; deferred).
  struct-access:       upstream source uses ->member / .field syntax
                       (D3 — vendoring upstream struct defs).
  undefined-macro:     upstream source references an ALL_CAPS macro
                       not in our vendored headers (D2 — primitive
                       header vendoring).

Each refusal has the upstream function name + the specific
identifier that triggered it. Brief 071's bulk-port driver
aggregates these reasons for backlog metrics.
"""

from __future__ import annotations

import argparse
import csv
import json
import re
import sys
from dataclasses import dataclass, field
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
LIBS_NITRO = ROOT / "libs" / "nitro"
CONFIG_DIR = ROOT / "config"


# Brief 068 confidence threshold for callee remap. We require
# 1.0000 byte similarity (exact match) for the callee resolution
# to be safe — anything below could be a false positive that
# emits self-recursive or otherwise-broken code (the brief 069
# wave 1 failure mode that the rename-collision PR #434 ALSO
# detects, but at a later stage).
CALLEE_HIGH_THRESHOLD = 0.9999


@dataclass(frozen=True)
class PortRequest:
    repo: str               # "pokediamond"
    src_rel: str            # "arm9/lib/NitroSDK/src/OS_tick.c"
    upstream_func: str      # "OS_InitTick"
    our_region: str         # "eur"
    our_addr: int           # 0x020931f8
    our_name: str | None    # "func_020931f8" or already-renamed


@dataclass
class PortResult:
    status: str             # "ok" | "refused"
    reason: str             # skip-reason taxonomy entry or "ok"
    detail: str = ""        # specific identifier / context
    output_path: Path | None = None
    rewritten_source: str = ""
    delinks_entry: str = ""
    # For metrics: per-callee remap decisions
    callee_remaps: dict[str, str] = field(default_factory=dict)
    # Per-data-ref remap decisions (D4)
    data_remaps: dict[str, str] = field(default_factory=dict)

    def to_dict(self) -> dict:
        return {
            "status": self.status,
            "reason": self.reason,
            "detail": self.detail,
            "output_path": (str(self.output_path)
                            if self.output_path else None),
            "delinks_entry": self.delinks_entry,
            "callee_remaps": dict(self.callee_remaps),
            "data_remaps": dict(self.data_remaps),
            "rewritten_source": self.rewritten_source,
        }


# --------------------------------------------------------------------------- #
# Source parsing — strict skip-reason detection
# --------------------------------------------------------------------------- #


# Crude but specific detectors. D2/D3/D4 implementations will
# replace these with semantic analysis; for now they exist so the
# driver fails-fast with a named reason rather than emitting
# silently-wrong output.

_STRUCT_ARROW_RE = re.compile(r"->[a-zA-Z_]")
# Field access of the form `ident.field` — we have to exclude
# floating-point literals (`1.0`, `3.14`) so the heuristic isn't
# spammy. The regex requires a letter/underscore on both sides of
# the dot.
_STRUCT_DOT_RE = re.compile(r"[a-zA-Z_]\.[a-zA-Z_]")

# D3 — extract struct/union/enum tags + typedef'd struct-type uses
# from a source body. The set is what we'd need vendored.
#
# Patterns covered:
#   `struct CardCommon *p;`     → tag "CardCommon" (with `struct`)
#   `CARDiCommon *p;`            → typedef name (no `struct` prefix)
# Distinguishing them needs a parser; we conservatively collect ALL
# CamelCase or `<prefix>i_<rest>` identifiers in pointer/variable-
# declaration positions, then intersect with what's actually
# vendored in `libs/nitro/include/`.
_STRUCT_TYPE_HINT_RE = re.compile(
    # `Type *name`, `Type name[`, `(Type *)`, `Type name;` — heuristic
    # filter to typical typename shapes (CamelCase with at least one
    # internal underscore-or-lowercase transition).
    r"\b(?P<tag>[A-Z][a-zA-Z0-9]*[a-z][a-zA-Z0-9_]*)"
    r"(?=\s*[*]?\s*[a-zA-Z_][\w]*\s*[\[;,)=])"
)

# Macros / undefined identifiers from upstream:
#   1. ALL_CAPS_IDENTIFIER that isn't a function-call (4+ uppercase
#      chars rules out enum-tag false positives like `OK`).
#   2. NitroSDK MMIO register convention `reg_<UPPERCASE>` —
#      lowercase prefix but the body is the macro identifier.
#      Brief 069 wave 1 cited `reg_CP_DIVCNT`, `reg_OS_TM0CNT_L`
#      style as the dominant D2 trigger.
# The lookahead `(?!\s*\()` excludes function-call shapes; final
# filter excludes names already in the callees list.
_MACRO_LIKE_RE = re.compile(
    r"\b("
    r"[A-Z][A-Z0-9_]{3,}"        # ALL_CAPS macros (OS_CONSOLE_DEBUG)
    r"|"
    r"reg_[A-Z][A-Z0-9_]+"        # NitroSDK MMIO regs (reg_OS_TM0CNT_L)
    r")\b(?!\s*\()"
)
# Identifiers we know are not "macros" but match the ALL_CAPS
# pattern — types, qualifiers, control-flow.
_MACRO_ALLOWLIST: frozenset[str] = frozenset({
    "NULL", "TRUE", "FALSE", "OK", "FAIL",
    # Pokediamond/NitroSDK basic type aliases. The C source uses
    # these as types; they're typedef'd in nitro/types.h. Most
    # of them are mixed-case (u8, u16, etc.) but include the
    # uppercase variants too.
    "BOOL", "STATIC",
    # Common preprocessor sentinels
    "__cplusplus", "__STDC__",
})


# D2/D3 — Vendored identifier scanner.
#
# We don't try to fully parse `libs/nitro/include/**/*.h` — that
# would need a real C parser. Instead, scan with regexes that
# match the conventions decomper uses:
#
#   `#define MACRO ...`        → macro tag
#   `typedef ... NAME;`        → typedef tag (catches struct
#                                  typedef'd-pointers and enum
#                                  typedef'd-names)
#   `struct NAME { ... };`     → struct tag
#   `union  NAME { ... };`     → union tag
#   `enum   NAME { ... };`     → enum tag
#   `<ENUMERATOR>,` inside enum body → enum-value tag (treated as macro)
#
# Returns three sets: macros, struct_types, enum_values. Used by
# detect_skip_reasons to relax the macro / struct refusals when
# the needed identifiers are already vendored.

# MULTILINE on the start-of-line patterns so `^` matches each line,
# not just the first character of the file.
_HEADER_MACRO_RE = re.compile(
    r"^\s*#\s*define\s+(?P<name>[A-Za-z_]\w+)",
    re.MULTILINE,
)
_HEADER_TYPEDEF_RE = re.compile(
    # `typedef ... NAME;` — captures the final identifier before `;`
    r"\btypedef\s+[^;]+?\b(?P<name>[A-Za-z_]\w+)\s*;"
)
_HEADER_STRUCT_DEF_RE = re.compile(
    r"\b(?:struct|union)\s+(?P<name>[A-Za-z_]\w+)\s*\{"
)
_HEADER_ENUM_DEF_RE = re.compile(
    r"\benum\s+(?P<name>[A-Za-z_]\w+)?\s*\{"
)
_HEADER_ENUM_VALUE_RE = re.compile(
    # An enumerator: starts with letter+underscore name at start of
    # line (in an `enum { ... }` body), followed by `=`/`,`/`}`.
    r"^\s*(?P<name>[A-Z][A-Z0-9_]+)\s*[=,}]"
)


_VENDORED_CACHE: dict[Path, tuple[frozenset[str],
                                   frozenset[str],
                                   frozenset[str]]] = {}


def load_vendored_identifiers(
    libs_root: Path = LIBS_NITRO,
) -> tuple[frozenset[str], frozenset[str], frozenset[str]]:
    """Scan `libs/nitro/include/**/*.h` for vendored macros,
    struct/union/enum tags, and enum-value tags. Returns
    `(macros, struct_types, enum_values)`. Cached per-call.

    These three sets feed `detect_skip_reasons`'s D2/D3 checks —
    a macro / struct-type that's vendored is no longer a refusal
    trigger.
    """
    if libs_root in _VENDORED_CACHE:
        return _VENDORED_CACHE[libs_root]
    macros: set[str] = set()
    structs: set[str] = set()
    enum_values: set[str] = set()
    include_dir = libs_root / "include"
    if not include_dir.is_dir():
        out = (frozenset(), frozenset(), frozenset())
        _VENDORED_CACHE[libs_root] = out
        return out
    for header in include_dir.rglob("*.h"):
        try:
            text = header.read_text(encoding="utf-8", errors="replace")
        except OSError:
            continue
        for m in _HEADER_MACRO_RE.finditer(text):
            macros.add(m.group("name"))
        for m in _HEADER_TYPEDEF_RE.finditer(text):
            # typedef names are loaded as both macros and struct-
            # types: a typedef like `typedef struct CardiCommon
            # CARDiCommon;` makes `CARDiCommon` usable as a type
            # in source, and a `#define`-style allow.
            structs.add(m.group("name"))
            macros.add(m.group("name"))
        for m in _HEADER_STRUCT_DEF_RE.finditer(text):
            structs.add(m.group("name"))
        for m in _HEADER_ENUM_DEF_RE.finditer(text):
            n = m.group("name")
            if n:
                structs.add(n)
        # Enum-value approximation: ALL_CAPS identifier at start of
        # line followed by `=`/`,`/`}`. Conservative — overcounts
        # in the macros set is fine.
        for line in text.splitlines():
            mv = _HEADER_ENUM_VALUE_RE.match(line)
            if mv:
                enum_values.add(mv.group("name"))
    out = (frozenset(macros), frozenset(structs), frozenset(enum_values))
    _VENDORED_CACHE[libs_root] = out
    return out


def detect_skip_reasons(
    body: str, callees: list[str], data_refs: list[str],
    *,
    data_resolved: bool = False,
    libs_root: Path = LIBS_NITRO,
) -> tuple[str, str] | None:
    """Run cheap skip-reason detectors on the upstream source
    body. Returns `(reason, detail)` on first hit, or None if all
    detectors pass.

    Order matters — D4 data-ref check comes first because we know
    the exact upstream data names from the reloc table. With D4
    shipped, the caller resolves data refs via the parallel-reloc
    map and passes `data_resolved=True` to skip the refusal. The
    structural check (struct-access via `->` / `.field`) and macro
    heuristic still apply because those are source-text issues
    independent of the reloc map.

    D2 / D3 (brief 070 follow-up): consult vendored identifiers in
    `libs/nitro/include/` — macros and struct types that decomper
    has already vendored don't trigger refusals.
    """
    vendored_macros, vendored_structs, vendored_enums = (
        load_vendored_identifiers(libs_root)
    )

    # D4 — data reloc: only refuses if the caller hasn't resolved
    # them via the parallel-reloc map. (Pre-D4 behaviour was an
    # unconditional refusal.)
    if data_refs and not data_resolved:
        return ("data-ref", ", ".join(data_refs[:5]))

    # D3 — struct access via -> or .field, gated on whether the
    # struct types being accessed are vendored.
    if _STRUCT_ARROW_RE.search(body) or _STRUCT_DOT_RE.search(body):
        # Collect struct-type hints in the body (CamelCase tokens
        # in declaration position).
        hints = {m.group("tag") for m in
                 _STRUCT_TYPE_HINT_RE.finditer(body)}
        # Filter out callees that incidentally match the CamelCase
        # heuristic (e.g. `SomeFunc(arg)` shouldn't trip).
        hints -= set(callees)
        unvendored = hints - vendored_structs
        if unvendored:
            return ("struct-access",
                    f"unvendored struct types: "
                    f"{', '.join(sorted(unvendored)[:5])}")

    # D2 — undefined macros (now consults vendored set).
    callee_set = set(callees)
    vendored_set = vendored_macros | vendored_enums
    for m in _MACRO_LIKE_RE.finditer(body):
        name = m.group(0)
        if name in _MACRO_ALLOWLIST:
            continue
        if name in callee_set:
            continue
        if name in vendored_set:
            continue
        # Found a real undefined-macro candidate.
        return ("undefined-macro", name)

    return None


# --------------------------------------------------------------------------- #
# Source body extraction
# --------------------------------------------------------------------------- #


def extract_function_body(
    source_text: str, func_name: str,
) -> tuple[str, int, int] | None:
    """Return `(body_with_signature, start_offset, end_offset)`
    for `func_name`'s top-level definition in `source_text`,
    or None if not found.

    Heuristic: find the line starting with the function's return
    type + `func_name(`, then balance braces from the first `{`
    to find the matching close. Skips function declarations
    (lines ending in `;`).
    """
    # Match `... func_name(...)` at start-of-line (top-level
    # definition, not nested). Excludes static prototypes.
    pat = re.compile(
        r"^(?P<sig>[a-zA-Z_][\w\s\*]*?\b" +
        re.escape(func_name) + r"\s*\([^;]*?\))\s*\{",
        re.MULTILINE,
    )
    m = pat.search(source_text)
    if not m:
        return None
    body_start = m.start()
    # Balance braces from the `{`
    brace_open = m.end() - 1  # the `{`
    depth = 0
    i = brace_open
    while i < len(source_text):
        c = source_text[i]
        if c == "{":
            depth += 1
        elif c == "}":
            depth -= 1
            if depth == 0:
                return source_text[body_start:i + 1], body_start, i + 1
        i += 1
    return None


# --------------------------------------------------------------------------- #
# Callee remap (D1) — byte-fingerprint lookup against our region
# --------------------------------------------------------------------------- #


def _build_upstream_to_local_index(
    repo: str, region: str,
) -> dict[str, tuple[str, int]]:
    """For every named function in the vendored repo, compile +
    extract its fingerprint, then byte-similarity-match against
    our region pool. Returns dict[upstream_name] → (our_name,
    our_addr).

    Cached per-call. A future optimisation would persist this to
    `tools/_vendor/_cache/<repo>_index.json`; for now we rebuild
    in-memory each invocation (a few seconds with pokediamond's
    NitroSDK pool).
    """
    sys.path.insert(0, str(ROOT / "tools"))
    import external_obj  # noqa: E402
    import find_external_source as fes  # noqa: E402
    import find_region_siblings as frs  # noqa: E402

    repo_meta = fes.repo_for(repo)
    if repo_meta is None:
        return {}

    region_funcs = frs.load_region(region)
    index: dict[str, tuple[str, int]] = {}

    for lib_root in repo_meta.lib_roots:
        root_path = fes.VENDOR_DIR / repo / lib_root
        if not root_path.is_dir():
            continue
        for c_file in sorted(root_path.rglob("*.c")):
            src_rel = str(c_file.relative_to(fes.VENDOR_DIR / repo))
            o_path = external_obj.compile_external(repo, src_rel)
            if o_path is None:
                continue
            for ext_fn in external_obj.extract_functions(o_path):
                fp = ext_fn.fingerprint()
                # Find best 1.0 match by size
                best = None
                for module, funcs in region_funcs.items():
                    for f in funcs:
                        if f.size != ext_fn.size:
                            continue
                        our_bytes = frs._function_bytes(
                            region, module, f.addr, f.size)
                        if our_bytes is None:
                            continue
                        our_reloc_offsets = [
                            f.addr + ro for ro, _, _ in f.reloc_sig
                        ]
                        our_masked = frs._mask_relocs(
                            our_bytes, f.addr, our_reloc_offsets)
                        sim = external_obj.byte_similarity(fp, our_masked)
                        if sim >= CALLEE_HIGH_THRESHOLD:
                            if best is None or sim > best[2]:
                                best = (f.name, f.addr, sim)
                if best is not None:
                    index[ext_fn.name] = (best[0], best[1])
    return index


# In-process cache — _build_upstream_to_local_index is expensive
# (~seconds), so callers that port many functions share one build.
_INDEX_CACHE: dict[tuple[str, str], dict[str, tuple[str, int]]] = {}


def upstream_to_local_index(
    repo: str, region: str,
) -> dict[str, tuple[str, int]]:
    key = (repo, region)
    if key not in _INDEX_CACHE:
        _INDEX_CACHE[key] = _build_upstream_to_local_index(repo, region)
    return _INDEX_CACHE[key]


def remap_callees_in_body(
    body: str, callees: list[str],
    upstream_to_local: dict[str, tuple[str, int]],
) -> tuple[str, dict[str, str], list[str]]:
    """For each upstream callee name in `callees`, look up the
    corresponding local name in `upstream_to_local` and rewrite
    `body` to use the local name. Returns `(rewritten_body,
    remap_decisions, unresolvable)` — unresolvable is the list
    of callee names with no fingerprint match.
    """
    remaps: dict[str, str] = {}
    unresolvable: list[str] = []
    for name in callees:
        match = upstream_to_local.get(name)
        if match is None:
            unresolvable.append(name)
            continue
        local_name, _addr = match
        remaps[name] = local_name
    # Apply substitutions longest-name-first to avoid prefix
    # collisions (mirror port_to_region.apply_substitutions).
    sorted_remaps = sorted(
        remaps.items(), key=lambda kv: -len(kv[0]),
    )
    out = body
    for upstream_name, local_name in sorted_remaps:
        pattern = r"\b" + re.escape(upstream_name) + r"\b"
        out = re.sub(pattern, local_name, out)
    return out, remaps, unresolvable


# --------------------------------------------------------------------------- #
# Data-ref remap (D4) — parallel-reloc data symbol map
# --------------------------------------------------------------------------- #


# Per-region cache. The .relocs and .symbols files are stable
# during a session; load once.
_REGION_RELOCS_CACHE: dict[str, dict] = {}
_REGION_DATA_SYMBOLS_CACHE: dict[str, dict] = {}


def _load_region_data(region: str) -> tuple[dict, dict]:
    """Load (relocs, data_symbols) for `region`. Reuses
    `port_to_region`'s load_full_relocs (which has the
    relocs.txt parser) to avoid duplicating format-handling
    code.

    Returns:
      relocs: dict[source_module][from_addr] → list of
              (kind, to_addr, to_module) tuples
      data_symbols: dict[addr] → name  (data + bss entries from
              the region's symbols.txt)
    """
    if region in _REGION_RELOCS_CACHE:
        return (_REGION_RELOCS_CACHE[region],
                _REGION_DATA_SYMBOLS_CACHE[region])
    sys.path.insert(0, str(ROOT / "tools"))
    import port_to_region as ptr  # noqa: E402

    relocs = ptr.load_full_relocs(region)
    data_symbols: dict[int, str] = {}
    config_arm9 = CONFIG_DIR / region / "arm9"

    def _parse_symbols(path: Path) -> None:
        if not path.is_file():
            return
        for line in path.read_text(
                encoding="utf-8", errors="replace").splitlines():
            m = ptr.DATA_RE.match(line)
            if m:
                addr = int(m.group("addr"), 16)
                data_symbols[addr] = m.group("name")

    _parse_symbols(config_arm9 / "symbols.txt")
    for sub in ("itcm", "dtcm"):
        _parse_symbols(config_arm9 / sub / "symbols.txt")
    overlays_dir = config_arm9 / "overlays"
    if overlays_dir.is_dir():
        for ov_dir in sorted(overlays_dir.iterdir()):
            _parse_symbols(ov_dir / "symbols.txt")

    _REGION_RELOCS_CACHE[region] = relocs
    _REGION_DATA_SYMBOLS_CACHE[region] = data_symbols
    return relocs, data_symbols


def build_parallel_reloc_data_map(
    upstream_func,
    our_module: str, our_addr: int, our_size: int,
    our_region: str,
) -> tuple[dict[str, str], list[str]]:
    """For each upstream data-kind reloc, find the corresponding
    reloc at the same offset in our local function, look up our
    local data symbol name, and map upstream_name → our_local_name.

    Cross-project analogue of `port_to_region.derive_data_address_
    mapping` (PR #419). Same invariant: when two functions are
    byte-identical (after reloc masking — which we already verified
    via byte-fingerprint match ≥0.9999), their reloc tables share
    OFFSETS and KINDS. The address each reloc resolves to is
    project-specific; the offset + kind structure is stable.

    Returns `(mapping, unresolved)`:
      mapping: dict[upstream_name] → our_local_name (e.g.
               `OSi_TickCounter` → `data_020c3f48` or
               `OSi_TickCounter` if our local is named).
      unresolved: list of upstream data names that have no
               matching reloc in our local function (skip-reason
               trigger for the caller).
    """
    relocs, data_symbols = _load_region_data(our_region)
    module_relocs = relocs.get(our_module, {})

    # Build dict[offset_within_our_func][reloc_kind] → list of
    # (to_addr, to_module). Walk our function's address range
    # in 2-byte stride (relocs can land on any 2-byte boundary).
    our_at_offset: dict[int, dict[str, list[tuple[int, str]]]] = {}
    for from_addr in range(our_addr, our_addr + our_size, 2):
        if from_addr in module_relocs:
            offset = from_addr - our_addr
            slot = our_at_offset.setdefault(offset, {})
            for kind, to_addr, to_module in module_relocs[from_addr]:
                slot.setdefault(kind, []).append((to_addr, to_module))

    mapping: dict[str, str] = {}
    unresolved: list[str] = []

    # Walk upstream relocs that are data-kind; pair with our
    # relocs at the same offset. Pair by occurrence-order within
    # a (offset, kind) bucket — matches port_to_region's
    # convention.
    upstream_data_per_offset: dict[int, list[str]] = {}
    for r in upstream_func.relocs:
        if r.kind != "data":
            continue
        upstream_data_per_offset.setdefault(r.offset, []).append(r.target)

    for offset, upstream_names in upstream_data_per_offset.items():
        our_slot = our_at_offset.get(offset, {})
        # Our reloc kinds for data are "data" / "bss" / sometimes
        # other ARM-specific kinds. The .relocs.txt uses
        # arm-data style — we accept any non-"call" kind as data.
        our_data_addrs = []
        for kind, addrs in our_slot.items():
            if kind in ("call", "thumb_call", "arm_call"):
                continue
            our_data_addrs.extend(addrs)
        for i, upstream_name in enumerate(upstream_names):
            if i >= len(our_data_addrs):
                unresolved.append(upstream_name)
                continue
            our_addr_target, _our_to_module = our_data_addrs[i]
            our_name = data_symbols.get(our_addr_target)
            if our_name is None:
                unresolved.append(upstream_name)
                continue
            mapping[upstream_name] = our_name

    return mapping, unresolved


def _find_our_module_for_addr(
    region: str, addr: int,
) -> str | None:
    """Locate the module that owns `addr` in our region's
    config. Scans `symbols.txt` files until a function entry
    matches. Cached implicitly via the relocs cache (we touch
    the same files).

    Returns module name like "main" / "ov002" / "itcm" / "dtcm",
    or None if no symbol exists at `addr`.
    """
    region_dir = CONFIG_DIR / region / "arm9"
    if not region_dir.is_dir():
        return None
    needle = f"addr:0x{addr:08x}"

    def _check(path: Path) -> bool:
        if not path.is_file():
            return False
        for line in path.read_text(
                encoding="utf-8", errors="replace").splitlines():
            if needle in line:
                return True
        return False

    if _check(region_dir / "symbols.txt"):
        return "main"
    for sub in ("itcm", "dtcm"):
        if _check(region_dir / sub / "symbols.txt"):
            return sub
    overlays_dir = region_dir / "overlays"
    if overlays_dir.is_dir():
        for ov_dir in sorted(overlays_dir.iterdir()):
            if _check(ov_dir / "symbols.txt"):
                return ov_dir.name
    return None


# --------------------------------------------------------------------------- #
# Wave-1 follow-ups — TU-collision pre-filter + ish-mismatch check
# --------------------------------------------------------------------------- #


# Cache for parsed delinks.txt complete-ranges. Keyed by region.
_COMPLETE_RANGES_CACHE: dict[str, tuple[tuple[int, int], ...]] = {}


# Regex matching `.text start:0x<addr> end:0x<addr>` inside a
# delinks.txt entry. Brief 070 wave 1 surfaced that ~30% of sweep
# candidates land on addresses already claimed `complete` by an
# existing TU — those should refuse pre-emptively rather than
# burn iteration time on a redundant port.
_DELINKS_TEXT_RANGE_RE = re.compile(
    r"\.text\s+start:0x(?P<start>[0-9a-fA-F]+)"
    r"\s+end:0x(?P<end>[0-9a-fA-F]+)"
)


def load_complete_ranges(
    region: str,
) -> tuple[tuple[int, int], ...]:
    """Parse every `delinks.txt` under `config/<region>/` for
    entries marked `complete` and return their `.text` address
    ranges as a sorted tuple of `(start, end)` pairs.

    Brief 070 wave-1 follow-up — TU-collision pre-filter. The
    sweep driver consults this set and refuses any candidate whose
    `our_addr` falls inside a complete range (it's already
    claimed).
    """
    if region in _COMPLETE_RANGES_CACHE:
        return _COMPLETE_RANGES_CACHE[region]
    region_dir = CONFIG_DIR / region
    if not region_dir.is_dir():
        _COMPLETE_RANGES_CACHE[region] = ()
        return ()
    ranges: list[tuple[int, int]] = []
    # Walk every delinks.txt. Format: each TU entry is a
    # `<path>:` header followed by indented lines. We accumulate
    # all `.text start: end:` ranges that appear in an entry
    # whose body contains the word `complete`.
    for delinks in region_dir.rglob("delinks.txt"):
        try:
            text = delinks.read_text(encoding="utf-8", errors="replace")
        except OSError:
            continue
        # Split into entries by blank lines; track which entries
        # have `complete` and collect their `.text` ranges.
        for entry in text.split("\n\n"):
            if "complete" not in entry:
                continue
            for m in _DELINKS_TEXT_RANGE_RE.finditer(entry):
                start = int(m.group("start"), 16)
                end = int(m.group("end"), 16)
                ranges.append((start, end))
    ranges_t = tuple(sorted(set(ranges)))
    _COMPLETE_RANGES_CACHE[region] = ranges_t
    return ranges_t


def is_addr_complete(
    addr: int, ranges: tuple[tuple[int, int], ...],
) -> bool:
    """O(n) range membership check. `ranges` is small (hundreds
    of entries on EUR's current state), so linear scan is fine."""
    for start, end in ranges:
        if start <= addr < end:
            return True
    return False


def load_our_function_ish(
    region: str, module: str, addr: int,
) -> str | None:
    """Look up our local function's instruction set
    ("arm"/"thumb") from `config/<region>/<module>/symbols.txt`.

    Used by the ish-mismatch check (brief 070 wave-1 follow-up).
    MI_Zero36B was the worked example: our local is
    `kind:function(thumb,size=0xe)` while pokediamond's
    MI_Zero36B is ARM at size 0x1c. The byte-fingerprint passes
    on a shared prefix; the ish check rejects it cleanly.
    """
    sys.path.insert(0, str(ROOT / "tools"))
    import find_region_siblings as frs  # noqa: E402

    region_funcs = frs.load_region(region)
    mod_funcs = region_funcs.get(module, [])
    for f in mod_funcs:
        if f.addr == addr:
            return f.ish
    return None


def remap_data_refs_in_body(
    body: str, data_map: dict[str, str],
) -> str:
    """Apply each upstream_data → our_local_data substitution.
    Same longest-first \b-bounded approach as the callee remap
    (mirror port_to_region.apply_substitutions)."""
    if not data_map:
        return body
    sorted_pairs = sorted(
        data_map.items(), key=lambda kv: -len(kv[0]),
    )
    out = body
    for upstream_name, local_name in sorted_pairs:
        pattern = r"\b" + re.escape(upstream_name) + r"\b"
        out = re.sub(pattern, local_name, out)
    return out


# --------------------------------------------------------------------------- #
# Output paths + delinks emission
# --------------------------------------------------------------------------- #


def compute_output_path(
    our_name: str, *, libs_root: Path = LIBS_NITRO,
) -> Path:
    """Brief 070 ports land in `libs/nitro/<our_name>.legacy.c`.
    `.legacy.c` because pokediamond's NitroSDK compiles with
    `1.2/sp2p3` — our `.legacy.c` routing tier."""
    return libs_root / f"{our_name}.legacy.c"


def compute_delinks_entry(
    our_name: str, our_addr: int, size: int,
    *, libs_root: Path = LIBS_NITRO,
) -> str:
    """Format matches `config/<region>/<module>/delinks.txt`."""
    rel = compute_output_path(our_name, libs_root=libs_root)
    rel = rel.relative_to(ROOT)
    return (
        f"{rel}:\n"
        f"    complete\n"
        f"    .text start:0x{our_addr:08x} "
        f"end:0x{our_addr + size:08x}\n"
    )


# --------------------------------------------------------------------------- #
# Top-level driver
# --------------------------------------------------------------------------- #


def port_function(
    request: PortRequest,
    *,
    libs_root: Path = LIBS_NITRO,
) -> PortResult:
    """Port one upstream function to our libs/nitro tree.
    Returns a PortResult — `status="ok"` with rewritten source
    OR `status="refused"` with a named skip reason.

    No filesystem writes happen here — caller decides whether to
    write `result.output_path.write_text(result.rewritten_source)`.
    """
    sys.path.insert(0, str(ROOT / "tools"))
    import external_obj  # noqa: E402
    import find_external_source as fes  # noqa: E402

    repo_root = fes.VENDOR_DIR / request.repo
    src_path = repo_root / request.src_rel
    if not src_path.is_file():
        return PortResult(
            status="refused", reason="source-not-found",
            detail=f"{request.src_rel} in {request.repo}",
        )

    # Wave-1 follow-up: TU-collision pre-filter. Refuse early if
    # this address is already claimed `complete` in any
    # delinks.txt — no point compiling upstream / running the
    # full pipeline for an addr that's already done.
    complete_ranges = load_complete_ranges(request.our_region)
    if is_addr_complete(request.our_addr, complete_ranges):
        return PortResult(
            status="refused", reason="already-complete",
            detail=(f"0x{request.our_addr:08x} is in a "
                    f"delinks.txt complete range "
                    f"(config/{request.our_region}/...)"),
        )

    # Compile + extract the upstream function
    o_path = external_obj.compile_external(request.repo, request.src_rel)
    if o_path is None:
        return PortResult(
            status="refused", reason="compile-failed",
            detail=request.src_rel,
        )
    funcs = external_obj.extract_functions(o_path)
    target = next((f for f in funcs
                   if f.name == request.upstream_func), None)
    if target is None:
        return PortResult(
            status="refused", reason="upstream-func-not-in-obj",
            detail=f"{request.upstream_func} not in {request.src_rel}",
        )

    # Wave-1 follow-up: ish-mismatch (ARM vs THUMB) refuse-fast.
    # Look up our local function's instruction set; if it differs
    # from upstream's, the byte-fingerprint match was a false-pass
    # on a shared prefix. MI_Zero36B worked example: our THUMB
    # 0xe vs upstream ARM 0x1c.
    our_module = _find_our_module_for_addr(
        request.our_region, request.our_addr,
    )
    if our_module is not None:
        our_ish = load_our_function_ish(
            request.our_region, our_module, request.our_addr,
        )
        if our_ish is not None and our_ish != target.ish:
            return PortResult(
                status="refused", reason="ish-mismatch",
                detail=(f"our {our_ish} vs upstream {target.ish} "
                        f"({request.upstream_func})"),
            )

    # Parse upstream source body
    src_text = src_path.read_text(encoding="utf-8")
    body_info = extract_function_body(src_text, request.upstream_func)
    if body_info is None:
        return PortResult(
            status="refused", reason="body-not-found-in-source",
            detail=f"{request.upstream_func} body in {request.src_rel}",
        )
    body, _start, _end = body_info

    callees = target.callee_names()
    # Exclude self-references — those don't need remapping (the
    # ported function will use our_name, and a recursive call
    # already resolves to itself in the rewritten output).
    callees = [c for c in callees if c != request.upstream_func]
    data_refs = target.data_refs()

    # D4 — Data-ref remap via parallel-reloc map.
    #
    # `our_module` was resolved earlier for the ish-mismatch
    # check; reuse it here without a second symbols.txt scan.
    data_map: dict[str, str] = {}
    data_unresolved: list[str] = []
    if data_refs:
        if our_module is None:
            return PortResult(
                status="refused", reason="our-addr-not-in-config",
                detail=f"0x{request.our_addr:08x} in {request.our_region}",
            )
        data_map, data_unresolved = build_parallel_reloc_data_map(
            target, our_module, request.our_addr, target.size,
            request.our_region,
        )
        if data_unresolved:
            return PortResult(
                status="refused", reason="data-ref-unresolved",
                detail=", ".join(data_unresolved[:5]),
            )

    # Skip-reason detection (D2/D3 — D4 now resolved).
    skip = detect_skip_reasons(
        body, callees, data_refs,
        data_resolved=True,
    )
    if skip is not None:
        return PortResult(
            status="refused", reason=skip[0], detail=skip[1],
        )

    # Callee remap (D1)
    upstream_to_local = upstream_to_local_index(
        request.repo, request.our_region,
    )
    rewritten_body, remaps, unresolvable = remap_callees_in_body(
        body, callees, upstream_to_local,
    )
    if unresolvable:
        return PortResult(
            status="refused", reason="callee-unresolvable",
            detail=", ".join(unresolvable[:5]),
            callee_remaps=remaps,
        )

    # D4 — apply the data-ref substitutions
    if data_map:
        rewritten_body = remap_data_refs_in_body(
            rewritten_body, data_map,
        )

    # Rewrite the function-defining name too (the signature uses
    # `request.upstream_func`; we want our local name there).
    our_name = request.our_name or f"func_{request.our_addr:08x}"
    pattern = r"\b" + re.escape(request.upstream_func) + r"\b"
    rewritten_body = re.sub(pattern, our_name, rewritten_body)

    # Compose the final source. Keep upstream's body verbatim
    # apart from the substitutions — extern declarations for our
    # local callees + data refs are emitted as a header block, but
    # full typing is decomper's responsibility (they refine the
    # `(void)` placeholder + data-ref types after the port lands).
    final_src = _compose_port_source(
        rewritten_body, our_name, request, target, remaps, data_map,
    )

    out_path = compute_output_path(our_name, libs_root=libs_root)
    delinks_entry = compute_delinks_entry(
        our_name, request.our_addr, target.size, libs_root=libs_root,
    )

    return PortResult(
        status="ok", reason="ok",
        output_path=out_path,
        rewritten_source=final_src,
        delinks_entry=delinks_entry,
        callee_remaps=remaps,
        data_remaps=data_map,
    )


def _compose_port_source(
    rewritten_body: str, our_name: str,
    request: PortRequest, ext_fn,
    remaps: dict[str, str],
    data_remaps: dict[str, str] | None = None,
) -> str:
    """Wrap the rewritten function body with a provenance comment
    block + minimal extern declarations for any remapped callees
    and data refs. Decomper refines `(void)` placeholders into
    typed declarations after the port lands."""
    lines = []
    lines.append("/*")
    lines.append(" * Cross-project port:")
    lines.append(f" *   upstream: {request.repo}:{request.src_rel}")
    lines.append(f" *   function: {request.upstream_func}")
    lines.append(f" *   target:   {our_name} (0x{request.our_addr:08x}, "
                 f"size 0x{ext_fn.size:x})")
    lines.append(" *")
    lines.append(" * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — "
                 "exact SP match")
    lines.append(" * to pokediamond's NitroSDK build flags). Brief 070 "
                 "D1+D4: callee +")
    lines.append(" * data-ref remap via parallel-reloc map.")
    lines.append(" */")
    lines.append("")
    if remaps:
        for upstream_name, local_name in sorted(remaps.items()):
            lines.append(f"extern void {local_name}(void);  "
                         f"// {upstream_name}")
        lines.append("")
    if data_remaps:
        for upstream_name, local_name in sorted(data_remaps.items()):
            # Use a generic int placeholder. Decomper refines
            # types after the port lands (typical NitroSDK data
            # is u32 / BOOL / vu64 etc.).
            lines.append(f"extern int {local_name};  "
                         f"// {upstream_name}")
        lines.append("")
    lines.append(rewritten_body)
    lines.append("")
    return "\n".join(lines)


# --------------------------------------------------------------------------- #
# Sweep mode — port all candidates from a brief 068 CSV
# --------------------------------------------------------------------------- #


def sweep_brief_068_csv(
    csv_path: Path, region: str = "eur",
    *, libs_root: Path = LIBS_NITRO,
) -> list[tuple[PortRequest, PortResult]]:
    """Walk a brief 068 `--byte-scan` CSV, attempt to port each
    HIGH-confidence row. Returns the full set of (request, result)
    tuples so caller can aggregate skip-reason metrics."""
    out: list[tuple[PortRequest, PortResult]] = []
    seen_targets: set[tuple[str, int]] = set()  # dedupe by our (module, addr)
    with csv_path.open() as f:
        reader = csv.DictReader(f)
        for row in reader:
            if row.get("confidence") != "HIGH":
                continue
            try:
                our_addr = int(row["our_addr_hex"], 16)
            except (ValueError, KeyError):
                continue
            key = (row.get("our_module", ""), our_addr)
            if key in seen_targets:
                continue
            seen_targets.add(key)
            req = PortRequest(
                repo=row["external_repo"],
                src_rel=row["external_file"],
                upstream_func=row["external_func"],
                our_region=row.get("our_region", region),
                our_addr=our_addr,
                our_name=row.get("our_name"),
            )
            res = port_function(req, libs_root=libs_root)
            out.append((req, res))
    return out


def aggregate_skip_reasons(
    results: list[tuple[PortRequest, PortResult]],
) -> dict[str, int]:
    counts: dict[str, int] = {}
    for _req, res in results:
        counts[res.reason] = counts.get(res.reason, 0) + 1
    return counts


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #


def main(argv: list[str] | None = None) -> int:
    p = argparse.ArgumentParser(
        description="Port one upstream NitroSDK function to "
                    "libs/nitro/<our_name>.legacy.c via byte-"
                    "fingerprint-validated callee remap. Brief 070 "
                    "D1; D2/D3/D4 deferred (driver fails-fast on "
                    "macros/structs/data refs).",
    )
    sub = p.add_mutually_exclusive_group(required=True)
    sub.add_argument("--sweep", metavar="CSV",
                     help="Sweep mode — port every row in a brief "
                          "068 byte-scan CSV. Reports per-reason "
                          "counts.")
    sub.add_argument("--upstream-func",
                     help="Single-port mode — upstream function "
                          "name to port (requires --repo, --src, "
                          "--our-addr).")
    p.add_argument("--repo", help="Vendored repo name.")
    p.add_argument("--src", help="Vendored .c file path "
                                 "(repo-relative).")
    p.add_argument("--our-addr",
                   help="Target address in our config "
                        "(e.g. 0x020931f8).")
    p.add_argument("--our-name",
                   help="Override target name (default: "
                        "func_<addr>).")
    p.add_argument("--region", default="eur",
                   help="Target region (default: eur).")
    p.add_argument("--dry-run", action="store_true",
                   help="Preview the rewritten source + delinks "
                        "entry; don't write to disk.")
    p.add_argument("--format", choices=("text", "json"),
                   default="text",
                   help="Output format (default: text).")
    args = p.parse_args(argv)

    if args.sweep:
        csv_path = Path(args.sweep)
        if not csv_path.is_file():
            print(f"error: csv not found: {csv_path}", file=sys.stderr)
            return 1
        results = sweep_brief_068_csv(csv_path, region=args.region)
        counts = aggregate_skip_reasons(results)
        if args.format == "json":
            payload = {
                "total": len(results),
                "by_reason": counts,
                "ok": [
                    {
                        "upstream_func": req.upstream_func,
                        "our_addr": req.our_addr,
                        "our_name": (res.output_path.stem
                                     if res.output_path else None),
                        "callee_remaps": dict(res.callee_remaps),
                    }
                    for req, res in results if res.status == "ok"
                ],
            }
            print(json.dumps(payload, indent=2))
        else:
            print(f"Sweep results: {len(results)} candidates")
            print()
            for reason, n in sorted(counts.items(),
                                    key=lambda kv: -kv[1]):
                print(f"  {reason:<24}  {n:>4}")
            print()
            ok_count = counts.get("ok", 0)
            print(f"Ports ready: {ok_count} (target ≥ 50 for brief 071 "
                  f"floor)")
        return 0

    # Single-port mode
    if not args.repo or not args.src or not args.our_addr:
        print("error: --upstream-func requires --repo, --src, "
              "--our-addr", file=sys.stderr)
        return 2
    try:
        our_addr = int(args.our_addr, 0)
    except ValueError:
        print(f"error: invalid --our-addr: {args.our_addr}",
              file=sys.stderr)
        return 1
    req = PortRequest(
        repo=args.repo, src_rel=args.src,
        upstream_func=args.upstream_func,
        our_region=args.region, our_addr=our_addr,
        our_name=args.our_name,
    )
    result = port_function(req)
    if args.format == "json":
        print(json.dumps(result.to_dict(), indent=2))
        return 0 if result.status == "ok" else 4

    if result.status == "refused":
        print(f"REFUSED — {result.reason}: {result.detail}",
              file=sys.stderr)
        if result.callee_remaps:
            print("  callee remaps so far:", file=sys.stderr)
            for k, v in result.callee_remaps.items():
                print(f"    {k} → {v}", file=sys.stderr)
        return 4

    # status == "ok"
    print(f"# Would write: {result.output_path}")
    print("#")
    print("# delinks.txt entry:")
    for line in result.delinks_entry.splitlines():
        print(f"#   {line}")
    if result.callee_remaps:
        print("#")
        print("# Callee remaps:")
        for k, v in sorted(result.callee_remaps.items()):
            print(f"#   {k} → {v}")
    print()
    print("# === Rewritten source ===")
    print(result.rewritten_source, end="")

    if not args.dry_run:
        result.output_path.parent.mkdir(parents=True, exist_ok=True)
        result.output_path.write_text(result.rewritten_source,
                                       encoding="utf-8")
        print(f"\nwrote {result.output_path}")

    return 0


if __name__ == "__main__":
    sys.exit(main())
