#!/usr/bin/env python3
"""routing_suffixes.py — the ONE shared source of truth for the mwcc
routing-tier filename suffixes (brief 587, closing the brief-569 /
improvement-swarm-r5-item-7 "suffix-strip" bug family).

Three source files route to a non-default compiler/assembler tier and
carry an infix before the `.c` extension:

    <name>.legacy.c       — Style A epilogue, mwcc 1.2/sp2p3
    <name>.legacy_sp3.c   — `sub sp, #4` prologue, mwcc 1.2/sp3
    <name>.thumb.c        — Thumb-mode ARM946E-S code

A plain `<name>.c` carries no infix. dsd's delink/objdiff metadata
always preserves this infix in `source_path` (and TU headers in
`delinks.txt`), but several consumers need the BASE name (symbol name,
port-target filename, object-file suffix) with the infix stripped or
translated — and until this module existed, each one hand-rolled its own
copy of the 3-suffix list. Two of those copies were missing `.thumb`
entirely (dropped from `.legacy`/`.legacy_sp3`-only lists written before
the Thumb tier existed, 2026-06-09) — a silent, live bug in both
`tools/objdiff_filter_panic_units.py` (drops all 36 EUR `.thumb.c` units
from every report) and `tools/port_to_region.py` (no Thumb function can
region-port at all). Every consumer below now imports `ROUTING_SUFFIXES`
from here rather than defining its own tuple, so that class of drift is
structurally impossible going forward.

Canonical order matches the pre-existing correct usage (`tools/
sig_census.py`, the "seed" this module was promoted from) — most-specific
first, though for these three literal strings under `.endswith()` no
input can actually match more than one, so the order has no behavioural
effect; it's kept for readability continuity with prior art.
"""
from __future__ import annotations

ROUTING_SUFFIXES: tuple[str, ...] = (".legacy_sp3", ".legacy", ".thumb")


def split_routing_suffix(stem: str) -> tuple[str, str]:
    """Split a filename `stem` (already stripped of its final extension,
    e.g. via `Path.stem`) into `(base_stem, routing_suffix)`.

    `routing_suffix` is one of `ROUTING_SUFFIXES`, or `""` if `stem`
    carries none. `base_stem + routing_suffix == stem` always holds.

        split_routing_suffix("func_abc.thumb")       -> ("func_abc", ".thumb")
        split_routing_suffix("func_abc.legacy_sp3")  -> ("func_abc", ".legacy_sp3")
        split_routing_suffix("func_abc")              -> ("func_abc", "")
    """
    for suf in ROUTING_SUFFIXES:
        if stem.endswith(suf):
            return stem[: -len(suf)], suf
    return stem, ""


def strip_routing_suffix(stem: str) -> str:
    """Convenience wrapper: just the base stem, for callers that don't
    need to know which suffix (if any) was present."""
    return split_routing_suffix(stem)[0]


def object_suffix_for_source(source_path: str) -> str | None:
    """Infer the compiled `.o` filename suffix for a `.c` source path,
    based on its routing-tier infix.

    dsd's objdiff metadata advertises a bare `<name>.o` in
    `target_path`/`base_path` even for a routed source (`<name>.legacy.c`
    compiles to `<name>.legacy.o`, not `<name>.o`) — callers needing the
    REAL on-disk artifact name use this to recover it.

    Returns `.legacy.o` / `.legacy_sp3.o` / `.thumb.o` for a routed
    source, or `None` for a plain `.c`/`.cpp` (or any path not ending in
    `<suffix>.c`, including the empty string).

        object_suffix_for_source("src/main/func_abc.legacy.c")  -> ".legacy.o"
        object_suffix_for_source("src/overlay004/func_x.thumb.c") -> ".thumb.o"
        object_suffix_for_source("src/main/func_abc.c")          -> None
        object_suffix_for_source("src/main/legacy_helper.c")     -> None (no infix)
    """
    for suf in ROUTING_SUFFIXES:
        if source_path.endswith(f"{suf}.c"):
            return f"{suf}.o"
    return None
