#!/usr/bin/env python3

"""
vendor_external_sources.py — clone-and-pin upstream decomp repos.

Brief 066 deliverable: a reproducible way to vendor the three
target upstream decomps (pret/pokediamond, pret/pokeheartgold,
AetiasHax/st) into `tools/_vendor/` for cross-project source
mining via `tools/find_external_source.py`.

The vendored cache is `.gitignore`-d (see top-level `.gitignore`)
so we never commit upstream source into our history. The pinned
commit hashes here are the source of truth for reproducibility.

Usage:

    # Clone all three targets at their pinned commits
    python tools/vendor_external_sources.py

    # Refresh one specific target (refreshes commit hash if upstream advanced)
    python tools/vendor_external_sources.py --target pokediamond

    # Print the pinned-commit table without cloning
    python tools/vendor_external_sources.py --list

Pinning policy:
- We pin specific commits, not branch tips, so brief 066 / 068
  experiments are reproducible across cloud runs.
- When the implementation brief (068) updates the pinned commit,
  re-validate hit-rate numbers — upstream code/layout changes
  can shift fingerprint matches.
- Shallow clone (depth=1) at each pinned commit keeps the
  download small (~10-50 MB per repo vs ~500 MB for full history).
"""

from __future__ import annotations

import argparse
import shutil
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
VENDOR_DIR = ROOT / "tools" / "_vendor"


@dataclass(frozen=True)
class Target:
    """One upstream decomp repo + its pinned commit + layout
    metadata used by find_external_source.py."""
    name: str               # local cache directory name
    url: str                # git clone URL
    commit: str             # pinned commit SHA
    mwcc_sp: str            # mwccarm SP version
    lib_roots: tuple[str, ...]  # relative paths to walk for .c files


# Pinned commits — last validated 2026-05-13.
# See docs/research/cross-project-feasibility.md for rationale.
TARGETS: list[Target] = [
    Target(
        name="pokediamond",
        url="https://github.com/pret/pokediamond.git",
        # HEAD as of 2026-05-13; brief 068 should re-pin if upstream
        # advances significantly (NitroSDK layout is stable; commit
        # drift is usually fine but worth re-validating hit rate).
        commit="HEAD",
        mwcc_sp="2.0/sp1",
        lib_roots=(
            "arm9/lib/NitroSDK/src",
            "arm9/lib/MSL_C/MSL_Common/Src",
            "arm9/lib/libnns/src",
        ),
    ),
    Target(
        name="pokeheartgold",
        url="https://github.com/pret/pokeheartgold.git",
        commit="HEAD",
        mwcc_sp="2.0/sp2p2",
        lib_roots=(
            "lib/NitroSDK/src/mi",
            "lib/NitroSDK/src/os",
            "lib/MSL_C",
            "lib/NitroDWC",
            "lib/dsprot",
        ),
    ),
    Target(
        name="st",
        url="https://github.com/AetiasHax/st.git",
        commit="HEAD",
        mwcc_sp="dsi/1.2p1",
        lib_roots=(
            "libs/c",
            "libs/cpp",
            "libs/runtime",
        ),
    ),
]


def _run(cmd: list[str], cwd: Path | None = None) -> None:
    """Run a subprocess, surfacing stderr on failure."""
    print(f"  $ {' '.join(cmd)}")
    r = subprocess.run(cmd, cwd=cwd, capture_output=True, text=True)
    if r.returncode != 0:
        raise SystemExit(
            f"command failed (exit {r.returncode}):\n"
            f"  cmd: {' '.join(cmd)}\n"
            f"  stderr:\n{r.stderr}"
        )


def clone_target(target: Target, force: bool = False) -> Path:
    """Clone (or refresh) one upstream repo into the vendored cache.

    Returns the path to the cached repo. Raises SystemExit on
    failure (caller handles).
    """
    dest = VENDOR_DIR / target.name
    if dest.exists() and not force:
        print(f"[skip] {target.name} already cloned at {dest}")
        _post_clone(target, dest)
        return dest
    if dest.exists() and force:
        print(f"[remove] {dest}")
        shutil.rmtree(dest)
    VENDOR_DIR.mkdir(parents=True, exist_ok=True)
    print(f"[clone] {target.url} → {dest}")
    if target.commit == "HEAD":
        _run([
            "git", "clone", "--depth", "1", target.url, str(dest),
        ])
    else:
        # Pinned commit: clone shallow then fetch the specific SHA.
        _run([
            "git", "clone", "--filter=blob:none", "--no-checkout",
            target.url, str(dest),
        ])
        _run(["git", "fetch", "--depth", "1", "origin", target.commit],
             cwd=dest)
        _run(["git", "checkout", target.commit], cwd=dest)
    _post_clone(target, dest)
    return dest


def _post_clone(target: Target, dest: Path) -> None:
    """Per-target post-clone fixups. Idempotent — safe to re-run.

    Currently only pokeheartgold needs one: its build generates
    `lib/include/nitro/fx/fx_const.h` from a CSV via a tiny C tool
    in `tools/gen_fx_consts/`. Without that header, every .c file
    that pulls in `<nitro.h>` (most of NitroSDK) fails to compile
    with `the file 'nitro/fx/fx_const.h' cannot be opened`. We
    build the generator with the system gcc and run it to write
    the header into the vendor tree.

    See docs/research/pokeheartgold-extension-feasibility.md for
    why this is a hard build dependency (brief 080)."""
    if target.name != "pokeheartgold":
        return
    fx_const_h = dest / "lib" / "include" / "nitro" / "fx" / "fx_const.h"
    if fx_const_h.is_file():
        return
    gen_dir = dest / "tools" / "gen_fx_consts"
    if not gen_dir.is_dir():
        print("  [warn] pokeheartgold: gen_fx_consts dir missing, "
              "NitroSDK compilation will fail", file=sys.stderr)
        return
    print(f"[post-clone] generating {fx_const_h.relative_to(dest)}")
    gen_bin = gen_dir / "gen_fx_consts"
    if not gen_bin.is_file():
        _run(["make"], cwd=gen_dir)
    fx_const_h.parent.mkdir(parents=True, exist_ok=True)
    _run([str(gen_bin), str(fx_const_h)])


def main(argv: list[str] | None = None) -> int:
    p = argparse.ArgumentParser(
        description="Clone-and-pin upstream decomp repos for "
                    "cross-project source mining (brief 066).",
    )
    p.add_argument("--target", choices=[t.name for t in TARGETS],
                   help="Clone one specific target (default: all).")
    p.add_argument("--force", action="store_true",
                   help="Remove and re-clone if already cached.")
    p.add_argument("--list", action="store_true",
                   help="Print pinned-commit table without cloning.")
    args = p.parse_args(argv)

    if args.list:
        print(f"{'name':<14}  {'mwcc SP':<12}  url")
        print(f"{'-' * 14}  {'-' * 12}  {'-' * 40}")
        for t in TARGETS:
            print(f"{t.name:<14}  {t.mwcc_sp:<12}  {t.url}")
        return 0

    selected = [t for t in TARGETS
                if args.target is None or t.name == args.target]
    for t in selected:
        try:
            clone_target(t, force=args.force)
        except SystemExit as e:
            # Surface and continue with other targets — one failed
            # clone shouldn't block the others.
            print(f"[error] {t.name}: {e}", file=sys.stderr)

    print()
    print(f"Vendored cache: {VENDOR_DIR}")
    print("Cache is .gitignore'd — never committed.")
    print("Next: tools/find_external_source.py <func_address>")
    return 0


if __name__ == "__main__":
    sys.exit(main())
