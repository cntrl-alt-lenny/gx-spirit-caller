#!/usr/bin/env python3

"""
external_obj.py — compile vendored external `.c` sources and
extract per-function byte fingerprints from the resulting `.o`.

Brief 068 implementation. Companion library to
`find_external_source.py` v0; provides the byte-fingerprint
extraction step that v0 deferred via `Candidate.byte_score = None`.

The pipeline is:

  vendored .c file  → compile (mwccarm with target SP)  → .o file
  .o file           → extract (ELF parse)               → fingerprints
  fingerprints + our extracted region bytes             → similarity match

This module owns the first two steps. The third (matching) lives
in `find_external_source.py`'s `--byte` mode.

Compilation strategy:
- Each target repo has a `BuildProfile` here that pins its mwcc SP,
  include search paths (relative to the vendored repo root), and
  `-D<symbol>` defines mined from the upstream Makefile. The
  profile is the smallest stable input that produces bytes
  matching the upstream `.o`.
- Output `.o` files land under `tools/_vendor/_cache/<repo>/<rel>.o`
  so repeated runs are idempotent. The cache is `.gitignore`-d
  (it's under `_vendor/`).

ELF extraction strategy:
- mwccarm emits each function into its own `.text` section by
  default (one section per function). Walk the section table,
  match each `.text*` section to its defining symbol from the
  symbol table, attach its `.rel.<section>` entries.
- Function bytes = the section's raw bytes.
- Reloc-from offsets within the function = `.rel.<section>` entries.
- Masking the reloc slots (zero the 4-byte word at each
  reloc-from address) yields the SP-stable byte sequence we
  compare against ours via `function_byte_similarity` /
  `_mask_relocs` from `find_region_siblings.py`.

Library functions:
  - `compile_external(repo_name, src_rel) → Path | None`
  - `extract_functions(o_path) → list[ExternalFunc]`
  - `function_fingerprint(func) → bytes`  (reloc-masked bytes)
"""

from __future__ import annotations

import os
import struct
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
VENDOR_DIR = ROOT / "tools" / "_vendor"
CACHE_DIR = VENDOR_DIR / "_cache"
MWCC_ROOT = ROOT / "tools" / "mwccarm"


# --------------------------------------------------------------------------- #
# Per-repo build profiles
# --------------------------------------------------------------------------- #


@dataclass(frozen=True)
class BuildProfile:
    """Compile flags + include paths to mimic an upstream repo's
    own `.o` emission. The "smallest stable input that matches
    upstream output" — anything beyond what's listed here is the
    upstream's Makefile noise and shouldn't affect `.o` bytes.

    SP version is the dominant variable. Include paths must
    resolve `#include` directives in the vendored source; missing
    paths produce ENOENT-style compile errors but never silently-
    wrong `.o` bytes.

    `cflags_extra` are upstream-Makefile-specific flags that
    affect codegen (e.g. `-lang c99`). Don't add cosmetic flags
    (like `-w error`) — those don't affect bytes."""
    repo: str
    sp: str
    # Each entry is repo-relative; e.g. "arm9/lib/NitroSDK/include"
    include_paths: tuple[str, ...]
    cflags_extra: tuple[str, ...] = ()
    defines: tuple[str, ...] = ()


# Per-repo profiles. The lib-subdir SP overrides are the **critical**
# finding from brief 066's deep audit (brief 068 PR description for
# the analysis):
#
#   pokediamond:
#     - arm9/lib/NitroSDK + arm9/lib/libnns: 1.2/sp2p3
#                                            (EXACT match to our .legacy.c tier)
#     - arm9/lib/MSL_C: 2.0/sp1 (one SP-rev from ours)
#
# pokediamond uses the same lib subdir flags as its own arm9/Makefile
# inheritance chain.
POKEDIAMOND_NITROSDK = BuildProfile(
    repo="pokediamond",
    sp="1.2/sp2p3",
    include_paths=(
        "arm9/lib/NitroSDK/include",
        "arm9/lib/libnns/include",
        "arm9/lib/MSL_C/include",
        "include",
        "include-mw",
    ),
    cflags_extra=(
        "-lang", "c99",
        "-inline", "on,noauto",
    ),
    defines=("FS_IMPLEMENT", "SDK_FINALROM"),
)


# Brief 080 — pokeheartgold extension. Upstream Makefile audit:
#
#   pokeheartgold/Makefile           MWCCVER := 2.0/sp2p2 (NitroSDK, MSL_C)
#   pokeheartgold/lib/dsprot/Mk      MWCCVER := 2.0/sp2p3 (newer SP)
#   pokeheartgold/lib/syscall/Mk     MWCCVER := 2.0/sp2p3 (asm only)
#   pokeheartgold/asm/nitrocrypto.o  MWCCVER := 1.2/sp2p3 (assembly!)
#
# Brief 066's "nitrocrypto exact-SP-match bonus pool" projection
# turned out NOT to apply: pokeheartgold's nitrocrypto is .s
# (assembly), not .c — no porting target. See
# docs/research/pokeheartgold-extension-feasibility.md for the
# full audit + verdict.
#
# All porting-eligible pokeheartgold subtrees use mwcc 2.0 family
# (one SP-rev from our default 2.0/sp1p5). Expected pairing rate
# 50-70% per brief 066's general non-exact-SP projection.
POKEHEARTGOLD_NITROSDK = BuildProfile(
    repo="pokeheartgold",
    sp="2.0/sp2p2",
    include_paths=(
        "lib/include",
        "include",
    ),
    cflags_extra=(
        "-lang", "c99",
        "-inline", "on,noauto",
    ),
    defines=("SDK_ARM9", "SDK_FINALROM"),
)


# pokeheartgold's lib/dsprot uses 2.0/sp2p3 per its subtree
# Makefile override.
POKEHEARTGOLD_DSPROT = BuildProfile(
    repo="pokeheartgold",
    sp="2.0/sp2p3",
    include_paths=(
        "lib/include",
        "lib/dsprot/include",
        "include",
    ),
    cflags_extra=(
        "-lang", "c99",
        "-inline", "on,noauto",
    ),
    defines=("SDK_ARM9", "SDK_FINALROM"),
)


PROFILES: dict[str, BuildProfile] = {
    # The (repo, subtree-prefix) → profile mapping. We pick the
    # first matching prefix for each source path; ORDER MATTERS
    # for prefix overlap (e.g. dsprot before generic NitroSDK
    # path if any overlap existed — none here).
    "pokediamond:arm9/lib/NitroSDK": POKEDIAMOND_NITROSDK,
    "pokediamond:arm9/lib/libnns": POKEDIAMOND_NITROSDK,
    "pokeheartgold:lib/dsprot": POKEHEARTGOLD_DSPROT,
    "pokeheartgold:lib/NitroSDK": POKEHEARTGOLD_NITROSDK,
    "pokeheartgold:lib/MSL_C": POKEHEARTGOLD_NITROSDK,
}


def profile_for(repo: str, src_rel: str) -> BuildProfile | None:
    """Pick the BuildProfile that owns this source file.
    src_rel is repo-relative (e.g. "arm9/lib/NitroSDK/src/OS_tick.c")."""
    for key, prof in PROFILES.items():
        repo_part, prefix = key.split(":", 1)
        if repo_part == repo and src_rel.startswith(prefix):
            return prof
    return None


# --------------------------------------------------------------------------- #
# Compilation
# --------------------------------------------------------------------------- #


def _resolve_wine() -> str | None:
    """Pick the Win32 runner from PATH. Mirrors `configure.py`'s
    macOS auto-detection; Linux uses wibo."""
    from shutil import which
    for cand in ("wine", "wine64", "wibo"):
        if which(cand):
            return cand
    # Allow direct execution on Windows hosts.
    if os.name == "nt":
        return ""
    return None


def compile_external(
    repo: str, src_rel: str,
    *,
    output: Path | None = None,
    force: bool = False,
) -> Path | None:
    """Compile one vendored `.c` file with its profile-pinned SP.
    Returns the path to the resulting `.o`, or None on failure.

    `src_rel` is repo-relative (`arm9/lib/NitroSDK/src/OS_tick.c`).
    The default output path is
    `tools/_vendor/_cache/<repo>/<src_rel>.o`. Caller can override
    via `output=...`.

    Idempotent — if the `.o` already exists and `force=False`, the
    cached path is returned without re-compiling.
    """
    prof = profile_for(repo, src_rel)
    if prof is None:
        return None
    repo_root = VENDOR_DIR / repo
    src_path = repo_root / src_rel
    if not src_path.is_file():
        return None
    if output is None:
        rel = Path(src_rel).with_suffix(".o")
        output = CACHE_DIR / repo / rel
    if output.is_file() and not force:
        return output
    output.parent.mkdir(parents=True, exist_ok=True)
    wine = _resolve_wine()
    if wine is None:
        return None
    mwcc = MWCC_ROOT / prof.sp / "mwccarm.exe"
    if not mwcc.is_file():
        return None
    cmd = []
    if wine:
        cmd.append(wine)
    cmd.append(str(mwcc))
    cmd.extend([
        "-O4,p", "-sym", "on", "-gccext,on",
        "-proc", "arm946e", "-msgstyle", "gcc",
        "-gccinc", "-fp", "soft",
        "-Cpp_exceptions", "off",
        "-interworking", "-enum", "int",
        "-nolink",
    ])
    cmd.extend(prof.cflags_extra)
    for inc in prof.include_paths:
        cmd.extend(["-i", str(repo_root / inc)])
    for d in prof.defines:
        cmd.extend(["-d", d])
    cmd.extend(["-c", str(src_path), "-o", str(output)])
    r = subprocess.run(cmd, capture_output=True, text=True, timeout=60)
    if r.returncode != 0:
        # Caller decides whether to surface the stderr; we return None.
        return None
    return output if output.is_file() else None


# --------------------------------------------------------------------------- #
# ELF parsing
# --------------------------------------------------------------------------- #


@dataclass(frozen=True)
class RelocRef:
    """One reloc entry inside an external function's body. Brief
    070 deliverables 1 + 4 use this to remap upstream callee /
    data symbol names → our local placeholders.

    `kind` mirrors STT_FUNC vs STT_OBJECT/STT_NOTYPE semantics:
      - "func"   — STT_FUNC: a `bl`/`blx` call target. The
                   port driver remaps `target` → our local
                   `func_<addr>` via brief 068's CSV.
      - "data"   — STT_OBJECT (or zero-size STT_NOTYPE with no
                   `$a`/`$t` prefix): a data symbol load. The
                   port driver remaps `target` → our local
                   `data_<addr>` via (D4: address + size +
                   relocation-pattern matching).
      - "other"  — anything else (rare: section refs, debug-
                   only symbols).
    """
    offset: int       # byte offset within the function
    target: str       # the symbol name being referenced
    kind: str         # "func" / "data" / "other"


@dataclass
class ExternalFunc:
    """One function extracted from an external .o."""
    name: str
    section_index: int
    # Raw section bytes (function instruction stream)
    bytes_: bytes
    size: int
    # Instruction set — "arm" or "thumb". Brief 070 wave-1
    # follow-up (PR #443): on ARM ELF, STT_FUNC symbols for
    # THUMB functions have their st_value's LSB set. Without
    # this we mis-match a THUMB-targeted ports against an ARM
    # upstream (or vice versa) — the byte-fingerprint check
    # accidentally passes on the shared prefix bytes.
    ish: str = "arm"
    # Reloc-from offsets within the function bytes (i.e. byte
    # offsets where a 4-byte reloc word lives). Used by
    # `function_fingerprint` to zero out reloc slots before
    # similarity comparison.
    reloc_offsets: tuple[int, ...] = ()
    # Brief 070 D1+D4: per-reloc target names + kinds. Same
    # offsets as `reloc_offsets`, augmented with the symbol the
    # reloc points at. Brief 070's port driver uses this to
    # remap callees + data references without the sort-pair
    # heuristic that tripped brief 069 wave 1.
    relocs: tuple[RelocRef, ...] = ()
    # The repo + source-file this came from (filled by extraction).
    repo: str = ""
    src_rel: str = ""

    def fingerprint(self) -> bytes:
        """Reloc-masked bytes — the SP-stable signature for
        cross-project comparison via byte similarity.

        Mirrors `_mask_relocs` from find_region_siblings.py.
        Returns a copy with each reloc-slot 4-byte word zeroed."""
        out = bytearray(self.bytes_)
        for off in self.reloc_offsets:
            if off + 4 <= len(out):
                out[off:off + 4] = b"\x00\x00\x00\x00"
        return bytes(out)

    def callee_names(self) -> list[str]:
        """Distinct names of all STT_FUNC reloc targets. The
        upstream callees brief 070's port driver needs to remap
        to our local placeholders."""
        return sorted({r.target for r in self.relocs
                       if r.kind == "func"})

    def data_refs(self) -> list[str]:
        """Distinct names of all data-symbol reloc targets."""
        return sorted({r.target for r in self.relocs
                       if r.kind == "data"})


def _parse_elf32(data: bytes) -> dict:
    """Minimal ELF32 parser — enough to walk sections + symbol
    table + relocs from a mwccarm-emitted `.o`. Returns a dict
    with `sections` (list), `symbols` (list), `relocs` (per-
    section dict). Raises ValueError on malformed input."""
    if data[:4] != b"\x7fELF" or data[4] != 1:
        raise ValueError("not a 32-bit ELF")
    e_shoff = struct.unpack_from("<I", data, 32)[0]
    e_shentsize = struct.unpack_from("<H", data, 46)[0]
    e_shnum = struct.unpack_from("<H", data, 48)[0]
    e_shstrndx = struct.unpack_from("<H", data, 50)[0]
    sections = []
    for i in range(e_shnum):
        base = e_shoff + i * e_shentsize
        sh = {
            "name_off": struct.unpack_from("<I", data, base + 0)[0],
            "type": struct.unpack_from("<I", data, base + 4)[0],
            "flags": struct.unpack_from("<I", data, base + 8)[0],
            "addr": struct.unpack_from("<I", data, base + 12)[0],
            "offset": struct.unpack_from("<I", data, base + 16)[0],
            "size": struct.unpack_from("<I", data, base + 20)[0],
            "link": struct.unpack_from("<I", data, base + 24)[0],
            "info": struct.unpack_from("<I", data, base + 28)[0],
            "entsize": struct.unpack_from("<I", data, base + 36)[0],
        }
        sections.append(sh)
    # Section names from .shstrtab
    shstr = sections[e_shstrndx]
    shstrtab = data[shstr["offset"]:shstr["offset"] + shstr["size"]]
    for sh in sections:
        end = shstrtab.find(b"\x00", sh["name_off"])
        sh["name"] = shstrtab[sh["name_off"]:end].decode(
            "utf-8", errors="replace")
    # Find .symtab + .strtab
    symtab_idx = None
    strtab_idx = None
    for i, sh in enumerate(sections):
        if sh["type"] == 2:  # SHT_SYMTAB
            symtab_idx = i
        elif sh["name"] == ".strtab":
            strtab_idx = i
    symbols = []
    if symtab_idx is not None:
        st = sections[symtab_idx]
        symdata = data[st["offset"]:st["offset"] + st["size"]]
        strtab = b""
        if strtab_idx is not None:
            ss = sections[strtab_idx]
            strtab = data[ss["offset"]:ss["offset"] + ss["size"]]
        ent = st["entsize"] or 16
        for off in range(0, st["size"], ent):
            name_off = struct.unpack_from("<I", symdata, off + 0)[0]
            value = struct.unpack_from("<I", symdata, off + 4)[0]
            size = struct.unpack_from("<I", symdata, off + 8)[0]
            info = symdata[off + 12]
            shndx = struct.unpack_from("<H", symdata, off + 14)[0]
            end = strtab.find(b"\x00", name_off)
            name = strtab[name_off:end].decode("utf-8", errors="replace")
            sym_type = info & 0xf
            symbols.append({
                "name": name, "value": value, "size": size,
                "type": sym_type, "shndx": shndx,
            })
    # Walk reloc sections. Each entry is (offset, sym_idx,
    # reloc_type). Reloc type lets us classify the call-site
    # nature even when the symbol's STT_ type is STT_NOTYPE
    # (extern-declared, defined elsewhere). Brief 070 wave-1
    # follow-up: GXi_DmaId is `extern u32` in GX_load2d.c, which
    # makes it STT_NOTYPE in the .o; the reloc type
    # (R_ARM_ABS32=2) tells us it's a data reference regardless.
    relocs: dict[int, list[tuple[int, int, int]]] = {}
    for sh in sections:
        if sh["type"] not in (9, 4):  # SHT_REL=9, SHT_RELA=4
            continue
        ent = sh["entsize"] or (8 if sh["type"] == 9 else 12)
        target_idx = sh["info"]
        relocs.setdefault(target_idx, [])
        sec_data = data[sh["offset"]:sh["offset"] + sh["size"]]
        for off in range(0, sh["size"], ent):
            r_offset = struct.unpack_from("<I", sec_data, off + 0)[0]
            r_info = struct.unpack_from("<I", sec_data, off + 4)[0]
            sym_idx = r_info >> 8
            r_type = r_info & 0xff
            relocs[target_idx].append((r_offset, sym_idx, r_type))
    return {
        "sections": sections,
        "symbols": symbols,
        "relocs": relocs,
    }


def extract_functions(o_path: Path) -> list[ExternalFunc]:
    """Parse an external `.o` (ELF32) and return every function
    defined in it, with bytes + reloc offsets attached.

    Strategy: for each `.text*` section, find the function symbol
    defined at section offset 0 (mwccarm emits one function per
    `.text` section). Attach reloc-from offsets from the matching
    `.rel.text*` section.
    """
    data = o_path.read_bytes()
    try:
        elf = _parse_elf32(data)
    except (ValueError, struct.error):
        return []
    out: list[ExternalFunc] = []
    for i, sh in enumerate(elf["sections"]):
        if not sh["name"].startswith(".text"):
            continue
        if sh["size"] == 0:
            continue
        # Find the named function symbol defined in this section.
        # mwccarm emits ARM/Thumb mode markers as STT_FUNC named
        # `$a` / `$t` / `$d` at section offset 0 — those are
        # placeholders, not real function names. We pick the
        # first STT_FUNC at section offset 0 whose name doesn't
        # start with `$`.
        #
        # ARM ELF convention: THUMB function symbols have their
        # st_value LSB set. So a THUMB function defined at
        # section offset 0 has st_value == 1, not 0. We accept
        # value in {0, 1} and detect ish from the LSB.
        name = ""
        ish = "arm"
        for sym in elf["symbols"]:
            if sym["shndx"] != i:
                continue
            if sym["type"] != 2:  # STT_FUNC
                continue
            sym_value = sym["value"]
            # Strip the THUMB bit when checking "at section offset 0"
            if (sym_value & ~1) != 0:
                continue
            if sym["name"].startswith("$") or not sym["name"]:
                continue
            name = sym["name"]
            ish = "thumb" if (sym_value & 1) else "arm"
            break
        if not name:
            continue
        sec_bytes = data[sh["offset"]:sh["offset"] + sh["size"]]
        raw_relocs = elf["relocs"].get(i, [])
        # Build RelocRef objects with target name + kind.
        #
        # Kind classification (brief 070 wave-1 follow-up):
        # First by RELOCATION TYPE (which encodes the call-site
        # nature: bl-target vs .word literal), then by symbol
        # type as a fallback. The reloc-type-first approach
        # correctly classifies STT_NOTYPE symbols (extern-
        # declared, defined elsewhere) — these were being missed
        # by D4's parallel-reloc map because the previous code
        # routed them to kind="other".
        ref_list: list[RelocRef] = []
        for r_off, sym_idx, r_type in raw_relocs:
            if sym_idx >= len(elf["symbols"]):
                continue
            sym = elf["symbols"][sym_idx]
            target_name = sym["name"]
            # Skip mode markers + section refs (anonymous targets).
            if not target_name or target_name.startswith("$"):
                continue
            # ARM ELF reloc types (subset):
            #   1 R_ARM_PC24       (older bl/blx encoding)
            #   2 R_ARM_ABS32      (data ref / function pointer)
            #   3 R_ARM_REL32      (relative data ref)
            #   5 R_ARM_ABS16
            #   10 R_ARM_THM_CALL  (Thumb bl)
            #   28 R_ARM_CALL      (modern bl)
            #   29 R_ARM_JUMP24    (b)
            #   30 R_ARM_THM_JUMP24
            if r_type in (1, 10, 28, 29, 30):
                kind = "func"
            elif r_type in (2, 3, 5):
                kind = "data"
            else:
                # Unknown reloc type — fall back to symbol-type
                # classification.
                sym_type = sym["type"]
                if sym_type == 2:    # STT_FUNC
                    kind = "func"
                elif sym_type == 1:  # STT_OBJECT
                    kind = "data"
                else:
                    kind = "other"
            ref_list.append(RelocRef(
                offset=r_off, target=target_name, kind=kind,
            ))
        # Sort offsets uniq for backward-compat reloc_offsets field
        # (consumed by fingerprint masking).
        reloc_offsets = tuple(sorted({r.offset for r in ref_list}))
        out.append(ExternalFunc(
            name=name,
            section_index=i,
            bytes_=sec_bytes,
            size=len(sec_bytes),
            ish=ish,
            reloc_offsets=reloc_offsets,
            relocs=tuple(ref_list),
        ))
    return out


# --------------------------------------------------------------------------- #
# Byte similarity
# --------------------------------------------------------------------------- #


def byte_similarity(a: bytes, b: bytes) -> float:
    """Hamming similarity over equal-length byte sequences.
    Mirrors `_byte_similarity` from find_region_siblings.py.

    Returns 1.0 for identical; 0.0 for disjoint. Length mismatch
    returns 0.0 (call-site must size-filter first).
    """
    if not a and not b:
        return 1.0
    if len(a) != len(b):
        return 0.0
    eq = sum(1 for x, y in zip(a, b, strict=True) if x == y)
    return eq / len(a)


# --------------------------------------------------------------------------- #
# CLI for spot-checking
# --------------------------------------------------------------------------- #


def main(argv: list[str] | None = None) -> int:
    import argparse
    p = argparse.ArgumentParser(
        description="Compile + fingerprint one vendored .c file. "
                    "Spot-check the pipeline before running the "
                    "full sweep via find_external_source.py --byte.",
    )
    p.add_argument("repo", help="Vendored repo name (e.g. pokediamond).")
    p.add_argument("src_rel",
                   help="Repo-relative .c path (e.g. "
                        "arm9/lib/NitroSDK/src/OS_tick.c).")
    p.add_argument("--force", action="store_true",
                   help="Re-compile even if .o is cached.")
    args = p.parse_args(argv)

    o_path = compile_external(args.repo, args.src_rel, force=args.force)
    if o_path is None:
        print(f"error: compile failed for {args.repo}:{args.src_rel}",
              file=sys.stderr)
        return 1
    print(f"compiled: {o_path}  ({o_path.stat().st_size} bytes)")
    funcs = extract_functions(o_path)
    print(f"functions: {len(funcs)}")
    for f in funcs:
        print(f"  {f.name:<40}  size=0x{f.size:04x}  "
              f"relocs={len(f.reloc_offsets)}  "
              f"fp[0:8]={f.fingerprint()[:8].hex()}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
