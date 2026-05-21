#!/usr/bin/env python3

"""
pattern_library.py — index already-matched `.c` files by shape, then
propose the best-fit template for a new target.

Complements two existing tools:

  - `tools/find_duplicates.py` — clusters UNMATCHED functions by
    exact reloc signature. Answers: "what bulk-template match would
    unlock many siblings?"
  - `tools/propagate_template.py` — given a MATCHED template +
    another UNMATCHED function with the same reloc sig, generates
    the `.c` mechanically. Answers: "make me N copies of this
    template."

What neither tool does: "given a new target, which of the
already-matched `.c`'s in `src/` is the best drafting starting
point?" That's the gap this tool fills. Scoring is deliberately
fuzzy — exact-sig matches are already handled by propagate_template.
This tool ranks by:

  1. Reloc-signature overlap (offset+kind pairs shared)
  2. Out-degree delta (fewer callees diff = better template)
  3. Size bucket match (both ≤0x20, both 0x20-0x80, etc.)
  4. Mode match (arm vs thumb — signals mwcc invocation flags)

No byte-level instruction matching — scaffolder can't run `dsd delink`.
Shape-level matching is enough to surface the best existing
template for the decomper to adapt.

Usage:

    # Build/refresh the index (walks src/, parses matched .c's).
    python tools/pattern_library.py build --version eur
    # → writes build/eur/analysis/pattern_library.json

    # Query for a target's best template.
    python tools/pattern_library.py query --version eur main 0x02093820
    # → prints ranked list of matched .c files with similarity score.

    # Machine-readable.
    python tools/pattern_library.py query --version eur main 0x02093820 --json

Pairs with `tools/scratch_bundle.py` (#159): scratch_bundle finds
adjacent siblings by address; pattern_library finds shape-similar
templates anywhere in the tree. For a target in a newly-carved
region (no adjacent siblings), pattern_library still returns a
useful drafting template from a distant overlay.
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from dataclasses import dataclass, field
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import (  # noqa: E402
    CallGraph,
    ModuleData,
    ROOT,
    Symbol,
    build_call_graph,
    load_all,
)
from propagate_template import (  # noqa: E402
    reloc_signature,
    relocs_for_function,
)


# Size buckets used for coarse shape matching. A target in bucket
# `leaf_tiny` (size ≤ 0x10) is drafted differently from one in
# `medium` (0x40-0x80) — the C shape scales with size.
SIZE_BUCKETS: list[tuple[str, int]] = [
    ("leaf_tiny", 0x10),
    ("leaf",     0x20),
    ("small",    0x40),
    ("medium",   0x80),
    ("large",    0x200),
    ("very_large", 0x10000),
]


def _size_bucket(size: int) -> str:
    for name, cap in SIZE_BUCKETS:
        if size <= cap:
            return name
    return SIZE_BUCKETS[-1][0]


@dataclass
class LibraryEntry:
    """One matched `.c` file indexed by its shape fingerprint."""

    module: str
    addr: int
    name: str               # symbol name (post-rename)
    size: int
    mode: str               # "arm" or "thumb"
    out_degree: int
    size_bucket: str
    reloc_sig: tuple[tuple[int, str], ...]
    src_path: str           # relative to ROOT

    def to_json(self) -> dict:
        return {
            "module": self.module,
            "addr": self.addr,
            "name": self.name,
            "size": self.size,
            "mode": self.mode,
            "out_degree": self.out_degree,
            "size_bucket": self.size_bucket,
            "reloc_sig": [list(p) for p in self.reloc_sig],
            "src_path": self.src_path,
        }

    @classmethod
    def from_json(cls, d: dict) -> LibraryEntry:
        return cls(
            module=d["module"],
            addr=d["addr"],
            name=d["name"],
            size=d["size"],
            mode=d["mode"],
            out_degree=d["out_degree"],
            size_bucket=d["size_bucket"],
            reloc_sig=tuple((int(o), k) for o, k in d["reloc_sig"]),
            src_path=d["src_path"],
        )


@dataclass
class Library:
    entries: list[LibraryEntry] = field(default_factory=list)

    def to_json(self) -> dict:
        return {
            "version": 1,
            "entry_count": len(self.entries),
            "entries": [e.to_json() for e in self.entries],
        }

    @classmethod
    def from_json(cls, d: dict) -> Library:
        return cls(
            entries=[
                LibraryEntry.from_json(e) for e in d.get("entries", [])
            ],
        )


# --------------------------------------------------------------------------- #
# Index-build: walk src/ and harvest matched .c files
# --------------------------------------------------------------------------- #

def _addr_from_stem(stem: str) -> int | None:
    m = re.search(r"([0-9a-fA-F]{6,8})$", stem)
    if m is None:
        return None
    try:
        return int(m.group(1), 16)
    except ValueError:
        return None


def _module_from_src_dir(dir_name: str) -> str | None:
    """main → main, overlay005 → ov005. Returns None for unknown."""
    if dir_name in ("main", "itcm", "dtcm"):
        return dir_name
    if dir_name.startswith("overlay") and dir_name[len("overlay"):].isdigit():
        n = int(dir_name[len("overlay"):])
        return f"ov{n:03d}"
    return None


def build_index(
    src_root: Path,
    modules: dict[str, ModuleData],
    graph: CallGraph,
) -> Library:
    """Walk src/<module-dir>/*.c, resolve each to a Symbol, build
    the fingerprint, collect into a Library.

    Skips files whose filename stem doesn't carry a resolvable
    address (e.g. hand-named files like `entry.c` where the symbol
    name isn't derivable from the filename)."""
    lib = Library()
    for module_dir in src_root.iterdir():
        if not module_dir.is_dir():
            continue
        module = _module_from_src_dir(module_dir.name)
        if module is None:
            continue
        md = modules.get(module)
        if md is None:
            continue
        for p in sorted(module_dir.glob("*.c")):
            addr = _addr_from_stem(p.stem)
            if addr is None:
                continue
            sym = md.by_addr.get(addr)
            if sym is None:
                continue
            relocs = relocs_for_function(sym, md)
            sig = reloc_signature(relocs, sym.addr)
            out_deg = len(graph.edges_call.get((module, addr), set()))
            # Prefer a path relative to the project root (cosmetic:
            # `src/overlay005/foo.c` reads better than an absolute
            # path). Fall back to relative-to-src_root for test
            # fixtures that live outside ROOT.
            try:
                src_path = str(p.relative_to(ROOT))
            except ValueError:
                src_path = str(p.relative_to(src_root.parent))
            lib.entries.append(LibraryEntry(
                module=module,
                addr=addr,
                name=sym.name,
                size=sym.size,
                mode=sym.mode,
                out_degree=out_deg,
                size_bucket=_size_bucket(sym.size),
                reloc_sig=sig,
                src_path=src_path,
            ))
    return lib


# --------------------------------------------------------------------------- #
# Scoring: how well does a library entry match a target?
# --------------------------------------------------------------------------- #

def _reloc_jaccard(
    a: tuple[tuple[int, str], ...], b: tuple[tuple[int, str], ...],
) -> float:
    """Jaccard on (offset, kind) pairs. Exact-sig match = 1.0."""
    sa, sb = set(a), set(b)
    if not sa and not sb:
        return 0.0
    union = len(sa | sb)
    return len(sa & sb) / union if union else 0.0


def score_entry(
    target: Symbol,
    target_sig: tuple[tuple[int, str], ...],
    target_out_degree: int,
    entry: LibraryEntry,
) -> float:
    """Weighted score, 0-1 range. Higher = better template.

    Weights picked so that:
      - An exact-sig + same-bucket + same-mode match scores ~0.95
      - A shape-only (no sig overlap) + same-bucket + same-mode
        scores ~0.35 (enough to be surfaced but obviously weak)
      - Mode mismatch caps the score at ~0.5 regardless — a Thumb
        template is genuinely not a great starting point for an
        ARM target, and vice-versa.
    """
    # Self-match is never useful (template = target = same file).
    if (entry.module == target.module and entry.addr == target.addr):
        return 0.0

    jaccard = _reloc_jaccard(target_sig, entry.reloc_sig)
    out_deg_diff = abs(target_out_degree - entry.out_degree)
    out_deg_score = 1.0 / (1 + out_deg_diff)  # 1.0 at exact, 0.5 at diff=1
    bucket_score = 1.0 if entry.size_bucket == _size_bucket(target.size) else 0.3
    mode_score = 1.0 if entry.mode == target.mode else 0.5

    # Weights: sig is primary (0.55), shape signals are secondary.
    base = (
        0.55 * jaccard
        + 0.20 * out_deg_score
        + 0.15 * bucket_score
        + 0.10 * mode_score
    )
    return base


def query(
    target: Symbol,
    modules: dict[str, ModuleData],
    graph: CallGraph,
    library: Library,
    *,
    top_n: int = 10,
) -> list[tuple[float, LibraryEntry]]:
    md = modules.get(target.module)
    if md is None:
        return []
    relocs = relocs_for_function(target, md)
    target_sig = reloc_signature(relocs, target.addr)
    target_out_deg = len(
        graph.edges_call.get((target.module, target.addr), set())
    )
    scored: list[tuple[float, LibraryEntry]] = []
    for entry in library.entries:
        s = score_entry(target, target_sig, target_out_deg, entry)
        if s <= 0.0:
            continue
        scored.append((s, entry))
    scored.sort(
        key=lambda t: (-t[0], t[1].module, t[1].addr),
    )
    return scored[:top_n]


# --------------------------------------------------------------------------- #
# Rendering
# --------------------------------------------------------------------------- #

def render_query_text(
    target: Symbol, results: list[tuple[float, LibraryEntry]],
) -> str:
    lines: list[str] = []
    lines.append(
        f"Template candidates for {target.module}|0x{target.addr:08x} "
        f"({target.name}, size=0x{target.size:x}, mode={target.mode}):",
    )
    if not results:
        lines.append(
            "  No matched templates indexed. Run "
            "`python tools/pattern_library.py build` first.",
        )
        return "\n".join(lines)
    lines.append(
        f"  Found {len(results)} candidate(s):",
    )
    lines.append("")
    lines.append(
        "    Score  Module  Addr          Size  Mode   Name              Src path",
    )
    lines.append(
        "    -----  ------  ------------  ----  -----  ----------------  ---------",
    )
    for score, e in results:
        lines.append(
            f"    {score:.2f}   {e.module:6s}  "
            f"0x{e.addr:08x}   0x{e.size:03x}  {e.mode:5s}  "
            f"{e.name:16s}  {e.src_path}",
        )
    return "\n".join(lines)


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def _default_index_path(version: str) -> Path:
    return ROOT / "build" / version / "analysis" / "pattern_library.json"


def cmd_build(args) -> int:
    config_dir = ROOT / "config" / args.version
    if not config_dir.is_dir():
        print(f"error: {config_dir} not found.", file=sys.stderr)
        return 2
    modules = load_all(config_dir)
    graph = build_call_graph(modules)
    lib = build_index(ROOT / "src", modules, graph)
    out = args.out or _default_index_path(args.version)
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(json.dumps(lib.to_json(), indent=2), encoding="utf-8")
    print(
        f"indexed {len(lib.entries)} matched .c files → {out}",
        file=sys.stderr,
    )
    return 0


def cmd_query(args) -> int:
    index_path = args.index or _default_index_path(args.version)
    if not index_path.is_file():
        print(
            f"error: no index at {index_path}. Run `pattern_library.py "
            "build` first.",
            file=sys.stderr,
        )
        return 2
    lib = Library.from_json(json.loads(index_path.read_text()))

    config_dir = ROOT / "config" / args.version
    modules = load_all(config_dir)
    md = modules.get(args.module)
    if md is None:
        print(f"error: module `{args.module}` not found.", file=sys.stderr)
        return 2
    addr = int(args.addr, 0)
    target = md.by_addr.get(addr)
    if target is None:
        print(
            f"error: no symbol at {args.module}|0x{addr:08x}.",
            file=sys.stderr,
        )
        return 2

    graph = build_call_graph(modules)
    results = query(target, modules, graph, lib, top_n=args.top)

    if args.json:
        payload = {
            "target": {
                "module": target.module,
                "addr": target.addr,
                "name": target.name,
                "size": target.size,
                "mode": target.mode,
            },
            "candidates": [
                {"score": round(s, 4), **e.to_json()}
                for s, e in results
            ],
        }
        print(json.dumps(payload, indent=2))
    else:
        print(render_query_text(target, results))
    return 0


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Index matched .c files by shape; query for the "
                    "best-fit drafting template for a new target.",
    )
    sub = ap.add_subparsers(dest="cmd", required=True)

    b = sub.add_parser("build", help="Build/refresh the index.")
    b.add_argument("--version", default="eur")
    b.add_argument("--out", type=Path, default=None)
    b.set_defaults(func=cmd_build)

    q = sub.add_parser("query", help="Find templates for a target.")
    q.add_argument("--version", default="eur")
    q.add_argument("--index", type=Path, default=None)
    q.add_argument("module")
    q.add_argument("addr")
    q.add_argument("--top", type=int, default=10)
    q.add_argument("--json", action="store_true")
    q.set_defaults(func=cmd_query)

    args = ap.parse_args()
    return args.func(args)


if __name__ == "__main__":
    sys.exit(main())
