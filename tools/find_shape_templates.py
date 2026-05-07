#!/usr/bin/env python3

"""
find_shape_templates.py — surface clone-candidate matched functions
for an unmatched target by opcode-sequence similarity.

Sibling-tool to `pattern_library.py`. Both answer "which matched .c
should the decomper clone for this target?" — but they consult
different signals:

  | Tool                        | Signal                          | Use when…                                  |
  |-----------------------------|---------------------------------|--------------------------------------------|
  | `pattern_library.py`        | reloc shape + size bucket       | the target has a reloc signature shared with at least one matched function. |
  | `find_shape_templates.py`   | opcode sequence (byte-level)    | the target's reloc signature is empty or near-empty (sig_len ≤ 1) and shape lives in the instruction sequence itself. |

The second case is exactly the ov006 stuck-cluster diagnosis from
`docs/research/ov006-cluster-stuck.md` (brief 023): heterogeneous
buckets at sig_len = 0 / 1 where the v2 fingerprint can't subdivide
shape, but the disassembly absolutely can.

Pipeline:

    1. Run `dsd dis` once into a per-version cache directory.
    2. Parse every emitted .s file into per-function opcode lists,
       stripping condition codes / flag-set suffixes / addressing-
       mode operands so that "movle r0, #1" and "mov r1, r2" both
       collapse to the opcode class `mov`.
    3. Determine the matched-set from `complete` TUs in delinks.txt.
    4. Rank matched functions by Levenshtein-similarity over the
       opcode-class sequence vs the target's. Same-size candidates
       are reported first; pass `--all-sizes` to expand the search.

Usage:

    python tools/find_shape_templates.py --version eur \\
        --target ov006 0x021c81a4

    # Top-N + machine-readable output:
    python tools/find_shape_templates.py --version eur \\
        --target main 0x02006164 --top 10 --json

    # Reuse an existing dsd-dis output instead of running it again:
    python tools/find_shape_templates.py --version eur \\
        --target main 0x02006164 --asm-cache /tmp/asm-research

The matched-corpus rebuild is the slow step (~30 s on a fresh
checkout because of `dsd dis`). Subsequent runs reuse the cache
under `build/<version>/find_shape_templates_cache/`.
"""

from __future__ import annotations

import argparse
import json
import re
import shutil
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import (  # noqa: E402
    ModuleData,
    load_all,
)
from next_targets import (  # noqa: E402
    collect_matched_ranges,
    is_addr_matched,
)


ROOT = Path(__file__).resolve().parent.parent
DEFAULT_TOP = 8


# --------------------------------------------------------------------------- #
# Opcode normalization
# --------------------------------------------------------------------------- #

# ARM condition-code suffixes per ARM ARM A8.3 (UAL). `al` is rarely
# emitted but accept it for symmetry; `hs`/`lo` are aliases of
# `cs`/`cc`. The trailing `s` flag-set bit is handled separately.
_COND_SUFFIXES: frozenset[str] = frozenset({
    "eq", "ne", "cs", "hs", "cc", "lo", "mi", "pl", "vs", "vc",
    "hi", "ls", "ge", "lt", "gt", "le", "al",
})

# Known base mnemonics dsd emits. Longest-match wins so e.g. "ldrsh"
# is preferred over "ldr" when both apply to the same string. Any
# unknown mnemonic falls through to a literal lowercase token.
_KNOWN_BASES: frozenset[str] = frozenset({
    # Arithmetic / logical
    "add", "adc", "sub", "sbc", "rsb", "rsc", "neg",
    "and", "orr", "eor", "bic", "mvn", "tst", "teq", "cmp", "cmn",
    "mul", "mla", "smull", "smlal", "umull", "umlal",
    "lsl", "lsr", "asr", "ror", "rrx", "clz",
    # Move
    "mov", "movw", "movt", "msr", "mrs",
    # Memory
    "ldr", "ldrb", "ldrsb", "ldrh", "ldrsh", "ldrd",
    "str", "strb", "strh", "strd",
    "ldm", "stm", "ldmia", "ldmda", "ldmib", "ldmdb",
    "stmia", "stmda", "stmib", "stmdb",
    "push", "pop", "swp", "swpb",
    # Branch
    "b", "bl", "bx", "blx",
    # System / SIMD-VFP (rare in mwcc-NDS but accept gracefully)
    "swi", "svc", "mcr", "mrc", "nop",
    # Thumb-specific extras
    "asrs", "lsls", "lsrs", "rors",
})


def _strip_condition(raw: str) -> str:
    """Reduce a raw mnemonic to its base opcode class.

    "movle"   -> "mov"
    "bxlt"    -> "bx"
    "blle"    -> "bl"     (NOT "b" — longest-base-match wins)
    "ldrsh"   -> "ldrsh"  (the 'sh' here is part of the base, not a cond)
    "popeq"   -> "pop"
    "addnes"  -> "add"    (cond + flag-set bit, both shed)
    "weird"   -> "weird"  (passthrough on unknown mnemonic)

    Strategy: strip an optional trailing flag-set 's' if doing so
    leaves either a known base + valid cond or a known base alone.
    Then strip an optional trailing 2-char cond if the prefix is a
    known base. Pure base-match wins over cond-stripped match.
    """
    s = raw.lower()
    # Direct hit: already a known base, no further processing.
    if s in _KNOWN_BASES:
        return s
    # Try cond-stripping.
    if len(s) > 2 and s[-2:] in _COND_SUFFIXES:
        candidate = s[:-2]
        if candidate in _KNOWN_BASES:
            return candidate
        # cond + flag-set: candidate may end in 's'.
        if candidate.endswith("s") and candidate[:-1] in _KNOWN_BASES:
            return candidate[:-1]
    # Try plain flag-set strip.
    if s.endswith("s") and s[:-1] in _KNOWN_BASES:
        return s[:-1]
    return s


_INST_LINE_RE = re.compile(r"^\s+([a-zA-Z][a-zA-Z0-9]*)\b")


def _line_opcode(line: str) -> str | None:
    """Return the opcode class for a function-body line, or None for
    a non-instruction line (label, directive, comment, blank)."""
    stripped = line.strip()
    if not stripped:
        return None
    # Comments — dsd uses ';' for end-of-line and rarely '//'.
    if stripped.startswith((";", "//", "@")):
        return None
    # Assembler directives (.text, .word, .global, etc.)
    if stripped.startswith("."):
        return None
    # Local labels (`.L_xxx:`) and function labels (`name:`)
    if stripped.endswith(":"):
        return None
    # Macro-style pseudo-ops dsd emits: `arm_func_start`, `thumb_func_end`.
    if stripped.startswith(("arm_func_", "thumb_func_")):
        return None
    m = _INST_LINE_RE.match(line)
    if not m:
        return None
    return _strip_condition(m.group(1))


# --------------------------------------------------------------------------- #
# Asm-file parsing
# --------------------------------------------------------------------------- #

@dataclass
class FunctionAsm:
    """Parsed shape of one function from a `dsd dis` .s file."""

    name: str
    module: str             # short module key (main / itcm / dtcm / ovNNN)
    addr: int
    mode: str               # "arm" or "thumb"
    opcodes: tuple[str, ...]
    src_path: str           # asm file relative to ROOT, for traceability

    def to_json(self) -> dict:
        return {
            "name": self.name,
            "module": self.module,
            "addr": self.addr,
            "mode": self.mode,
            "opcodes": list(self.opcodes),
            "src_path": self.src_path,
        }


_FUNC_START_RE = re.compile(r"^\s*(arm|thumb)_func_start\s+(\S+)")
_FUNC_END_RE = re.compile(r"^\s*(?:arm|thumb)_func_end\s+(\S+)")
_LABEL_ADDR_RE = re.compile(r"^([\w$]+):\s*;\s*0x([0-9a-fA-F]+)")


def parse_asm_file(
    path: Path, *, root: Path | None = None, module: str = "",
) -> list[FunctionAsm]:
    """Walk one `dsd dis` .s file, returning every function block.

    Picks up arm and thumb blocks alike. The opcode sequence is the
    list of base mnemonics inside `arm_func_start` / `arm_func_end`
    bookends, post-condition-strip. Pool words (`.word data_X`),
    local labels, and assembler directives are skipped — only real
    instruction lines contribute to the opcodes list.
    """
    try:
        text = path.read_text(encoding="utf-8")
    except OSError:
        return []
    out: list[FunctionAsm] = []
    src_path = (
        str(path.resolve().relative_to(root.resolve()))
        if root is not None and path.resolve().is_relative_to(root.resolve())
        else str(path)
    )

    cur_name: str | None = None
    cur_mode: str = "arm"
    cur_addr: int = 0
    cur_ops: list[str] = []
    awaiting_label = False

    for line in text.splitlines():
        m_start = _FUNC_START_RE.match(line)
        if m_start:
            cur_mode = m_start.group(1)
            cur_name = m_start.group(2)
            cur_addr = 0
            cur_ops = []
            awaiting_label = True
            continue
        m_end = _FUNC_END_RE.match(line)
        if m_end and cur_name is not None:
            out.append(FunctionAsm(
                name=cur_name,
                module=module,
                addr=cur_addr,
                mode=cur_mode,
                opcodes=tuple(cur_ops),
                src_path=src_path,
            ))
            cur_name = None
            awaiting_label = False
            cur_ops = []
            continue
        if cur_name is None:
            continue
        if awaiting_label:
            m_lab = _LABEL_ADDR_RE.match(line.strip())
            if m_lab and m_lab.group(1) == cur_name:
                cur_addr = int(m_lab.group(2), 16)
                awaiting_label = False
                continue
            # Some .s files skip the addr comment; tolerate that and
            # keep scanning for instructions.
        op = _line_opcode(line)
        if op is not None:
            cur_ops.append(op)
    return out


def parse_asm_tree(asm_root: Path) -> dict[tuple[str, int], FunctionAsm]:
    """Walk every .s file under `asm_root` and index the functions by
    (module, addr). The module is derived from the file path: under
    `src/<dir>/...` the dir name maps to a module key; under
    `_dsd_gap@<module>_NN.s` the prefix carries the module."""
    out: dict[tuple[str, int], FunctionAsm] = {}
    for asm_file in sorted(asm_root.rglob("*.s")):
        module = _module_from_asm_path(asm_file, asm_root)
        if module is None:
            continue
        for fn in parse_asm_file(asm_file, root=asm_root, module=module):
            if fn.addr == 0:
                continue
            out[(module, fn.addr)] = fn
    return out


def _module_from_asm_path(p: Path, asm_root: Path) -> str | None:
    """Map a `dsd dis` output file to its module short name."""
    try:
        rel = p.relative_to(asm_root)
    except ValueError:
        return None
    parts = rel.parts
    # _dsd_gap@<module>_<N>.s lives at the asm-root.
    if len(parts) == 1 and parts[0].startswith("_dsd_gap@"):
        body = parts[0][len("_dsd_gap@"):].rsplit(".", 1)[0]
        if "_" in body:
            return body.rsplit("_", 1)[0]
        return body
    # src/<dirname>/foo.s — translate "main"/"overlayNNN"/"itcm"/"dtcm".
    if len(parts) >= 3 and parts[0] == "src":
        d = parts[1]
        if d == "main":
            return "main"
        if d in ("itcm", "dtcm"):
            return d
        if d.startswith("overlay") and d[len("overlay"):].isdigit():
            return f"ov{int(d[len('overlay'):]):03d}"
    return None


# --------------------------------------------------------------------------- #
# Similarity
# --------------------------------------------------------------------------- #

def levenshtein(a: tuple[str, ...] | list[str],
                b: tuple[str, ...] | list[str]) -> int:
    """Plain dynamic-programming edit distance over two opcode lists.

    Sequences are short (most functions ≤ 30 instructions) so the
    naive O(len(a) * len(b)) implementation is fast enough — the
    full corpus (~1100 matched + ~8000 unmatched) processes in a
    couple of seconds per query.
    """
    if len(a) < len(b):
        a, b = b, a
    if not b:
        return len(a)
    prev = list(range(len(b) + 1))
    for i, ai in enumerate(a, 1):
        curr = [i]
        for j, bj in enumerate(b, 1):
            curr.append(min(
                curr[-1] + 1,
                prev[j] + 1,
                prev[j - 1] + (0 if ai == bj else 1),
            ))
        prev = curr
    return prev[-1]


def shape_similarity(a: tuple[str, ...], b: tuple[str, ...]) -> float:
    """1 - (edit-distance / max-length). Range [0, 1]; identical
    sequences return 1.0; fully disjoint same-length sequences
    return 0.0."""
    if not a and not b:
        return 1.0
    longer = max(len(a), len(b))
    if longer == 0:
        return 1.0
    return 1.0 - (levenshtein(a, b) / longer)


# --------------------------------------------------------------------------- #
# Matched-set + corpus assembly
# --------------------------------------------------------------------------- #

@dataclass
class ShapeMatch:
    candidate: FunctionAsm
    candidate_size: int
    similarity: float
    same_size: bool


def _function_size(modules: dict[str, ModuleData],
                   module: str, addr: int) -> int | None:
    md = modules.get(module)
    if md is None:
        return None
    sym = md.by_addr.get(addr)
    if sym is None or not sym.is_function:
        return None
    return sym.size


def rank_candidates(
    target: FunctionAsm,
    target_size: int,
    target_module: str,
    corpus: dict[tuple[str, int], FunctionAsm],
    modules: dict[str, ModuleData],
    matched_ranges: dict[str, list[tuple[int, int]]],
    *,
    top: int = DEFAULT_TOP,
    all_sizes: bool = False,
) -> list[ShapeMatch]:
    """Score every matched function against the target and return the
    top-N by similarity. Same-size candidates always sort before
    different-size candidates of equal similarity unless
    `all_sizes` is set, in which case the size split is ignored.
    """
    same_size: list[ShapeMatch] = []
    other_size: list[ShapeMatch] = []
    for (mod, addr), candidate in corpus.items():
        if mod == target_module and addr == target.addr:
            continue
        if not is_addr_matched(matched_ranges, mod, addr):
            continue
        if candidate.mode != target.mode:
            continue
        size = _function_size(modules, mod, addr)
        if size is None:
            continue
        sim = shape_similarity(target.opcodes, candidate.opcodes)
        match = ShapeMatch(
            candidate=candidate,
            candidate_size=size,
            similarity=sim,
            same_size=(size == target_size),
        )
        if match.same_size:
            same_size.append(match)
        else:
            other_size.append(match)
    same_size.sort(key=lambda m: (-m.similarity, m.candidate.addr))
    other_size.sort(key=lambda m: (-m.similarity, m.candidate.addr))
    if all_sizes:
        merged = same_size + other_size
        merged.sort(key=lambda m: (-m.similarity, not m.same_size,
                                   m.candidate.addr))
        return merged[:top]
    return same_size[:top]


# --------------------------------------------------------------------------- #
# dsd dis driver + cache
# --------------------------------------------------------------------------- #

def _config_dir(version: str) -> Path:
    return ROOT / "config" / version


def _build_dir(version: str) -> Path:
    return ROOT / "build" / version


def _cache_dir(version: str) -> Path:
    return _build_dir(version) / "find_shape_templates_cache"


def _dsd_binary() -> Path:
    """Location of the dsd binary in the repo root. Windows ships it
    as `dsd.exe`; macOS / Linux as `dsd`."""
    win = ROOT / "dsd.exe"
    if win.is_file():
        return win
    return ROOT / "dsd"


def _config_yaml(version: str) -> Path:
    return _config_dir(version) / "arm9" / "config.yaml"


def _cache_marker(asm_root: Path) -> Path:
    return asm_root.parent / "asm.marker"


def _config_signature(version: str) -> str:
    """Cheap stat-based signature of the config inputs that drive the
    dsd dis output. Refreshing the symbols/relocs files (e.g. after
    a decomper rename wave) bumps the signature so the asm cache
    invalidates."""
    paths = [_config_yaml(version)]
    for delinks in _config_dir(version).rglob("symbols.txt"):
        paths.append(delinks)
    sig_parts: list[str] = []
    for p in sorted(paths):
        try:
            sig_parts.append(f"{p}:{p.stat().st_mtime_ns}:{p.stat().st_size}")
        except OSError:
            continue
    return "|".join(sig_parts)


def ensure_disasm(
    version: str,
    *,
    force: bool = False,
    cache_root: Path | None = None,
) -> Path:
    """Run `dsd dis` into a versioned cache, returning the asm root.

    Skips the run if a marker file with the matching config signature
    already exists in the cache. Pass `force=True` to rebuild
    unconditionally."""
    cache_root = cache_root or _cache_dir(version)
    asm_root = cache_root / "asm"
    marker = _cache_marker(asm_root)
    sig = _config_signature(version)
    if not force and asm_root.is_dir() and marker.is_file():
        if marker.read_text() == sig:
            return asm_root
    # Rebuild: clean out the asm dir for determinism.
    if asm_root.exists():
        shutil.rmtree(asm_root)
    asm_root.mkdir(parents=True)
    cmd = [
        str(_dsd_binary()),
        "dis",
        "--config-path", str(_config_yaml(version)),
        "--asm-path", str(asm_root),
        "--ual",
    ]
    print(f"running: {' '.join(cmd)}", file=sys.stderr)
    subprocess.run(cmd, check=True)
    marker.write_text(sig)
    return asm_root


# --------------------------------------------------------------------------- #
# Reporting
# --------------------------------------------------------------------------- #

def _addr_repr(module: str, addr: int) -> str:
    return f"{module}|0x{addr:08x}"


def render_text(
    target: FunctionAsm,
    target_module: str,
    target_size: int,
    results: list[ShapeMatch],
    *,
    all_sizes: bool,
) -> str:
    lines: list[str] = []
    lines.append(
        f"target: {target.name}  ({_addr_repr(target_module, target.addr)}, "
        f"size 0x{target_size:x}, {len(target.opcodes)} {target.mode} insns)"
    )
    if target.opcodes:
        lines.append(f"  opcodes: {' '.join(target.opcodes)}")
    lines.append("")
    if not results:
        lines.append("(no matched candidates found)")
        return "\n".join(lines) + "\n"
    header = (
        "Top {} {}shape candidates"
        .format(len(results), "same-size " if not all_sizes else "")
    )
    lines.append(header)
    for i, m in enumerate(results, 1):
        size_tag = (
            "same-size" if m.same_size else f"size 0x{m.candidate_size:x}"
        )
        lines.append(
            f"{i:>3}. similarity {m.similarity:.2f}  ({size_tag})  "
            f"{m.candidate.name}  [{m.candidate.src_path}]"
        )
        lines.append(f"     opcodes: {' '.join(m.candidate.opcodes)}")
    if not all_sizes:
        lines.append("")
        lines.append("(re-run with --all-sizes to include other sizes)")
    return "\n".join(lines) + "\n"


def render_json(
    target: FunctionAsm,
    target_size: int,
    results: list[ShapeMatch],
) -> str:
    payload = {
        "target": {**target.to_json(), "size": target_size},
        "candidates": [
            {
                "similarity": round(m.similarity, 4),
                "same_size": m.same_size,
                "candidate_size": m.candidate_size,
                **m.candidate.to_json(),
            }
            for m in results
        ],
    }
    return json.dumps(payload, indent=2) + "\n"


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def _parse_addr(s: str) -> int:
    return int(s.strip(), 16)


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(
        description=(
            "Rank matched functions by opcode-sequence similarity to "
            "an unmatched target. Surfaces clone-candidate templates "
            "across the whole matched corpus, regardless of cluster "
            "fingerprint."
        ),
    )
    ap.add_argument("--version", required=True,
                    help="Region key (eur / usa / jpn).")
    ap.add_argument("--target", nargs=2, metavar=("MODULE", "ADDR"),
                    required=True,
                    help="Unmatched function to find templates for.")
    ap.add_argument("--top", type=int, default=DEFAULT_TOP,
                    help=f"Top-N candidates (default {DEFAULT_TOP}).")
    ap.add_argument("--all-sizes", action="store_true",
                    help="Don't restrict to same-size matches.")
    ap.add_argument("--json", action="store_true",
                    help="Emit machine-readable JSON.")
    ap.add_argument("--asm-cache", type=Path, default=None,
                    help=("Reuse a pre-built dsd-dis asm tree. Skips "
                          "the cache check and the dsd invocation."))
    ap.add_argument("--force-disasm", action="store_true",
                    help="Re-run dsd dis even if the cache is fresh.")
    args = ap.parse_args(argv)

    target_module, target_addr_str = args.target
    target_addr = _parse_addr(target_addr_str)

    config_dir = _config_dir(args.version)
    if not (config_dir / "arm9" / "config.yaml").is_file():
        print(f"error: config not found at {config_dir}/arm9/config.yaml",
              file=sys.stderr)
        return 2

    # Resolve target via symbols.txt before doing the expensive disasm.
    modules = load_all(config_dir)
    md = modules.get(target_module)
    if md is None:
        print(f"error: unknown module {target_module!r}; have "
              f"{sorted(modules)}", file=sys.stderr)
        return 2
    sym = md.by_addr.get(target_addr)
    if sym is None or not sym.is_function:
        print(
            f"error: no function at {_addr_repr(target_module, target_addr)} "
            f"in {target_module}/symbols.txt",
            file=sys.stderr,
        )
        return 2

    asm_root = (
        args.asm_cache.resolve()
        if args.asm_cache is not None
        else ensure_disasm(args.version, force=args.force_disasm)
    )
    if not asm_root.is_dir():
        print(f"error: asm cache directory {asm_root} not found",
              file=sys.stderr)
        return 2

    corpus = parse_asm_tree(asm_root)
    target = corpus.get((target_module, target_addr))
    if target is None:
        print(
            f"error: target {sym.name} disassembled empty — "
            f"is it really at {_addr_repr(target_module, target_addr)}?",
            file=sys.stderr,
        )
        return 2

    matched_ranges = collect_matched_ranges(config_dir)
    results = rank_candidates(
        target, sym.size, target_module, corpus, modules, matched_ranges,
        top=args.top, all_sizes=args.all_sizes,
    )

    if args.json:
        sys.stdout.write(render_json(target, sym.size, results))
    else:
        sys.stdout.write(render_text(
            target, target_module, sym.size, results,
            all_sizes=args.all_sizes,
        ))
    return 0


if __name__ == "__main__":
    sys.exit(main())
