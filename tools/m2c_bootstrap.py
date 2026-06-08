#!/usr/bin/env python3
"""m2c_bootstrap.py — vendor m2c (the asm->C decompiler) at a pinned commit,
mirroring `permute.py`'s decomp-permuter bootstrap (brief 381).

m2c (https://github.com/matt-kempster/m2c) turns a dsd-delinked function's
disassembly into a near-miss `.c` that the permuter then anneals to a byte
match. `tools/m2c_feed.py` produces the GNU-as `.s` m2c consumes; this script
makes m2c itself reproducibly available:

    python tools/m2c_bootstrap.py          # clone @ pin + install deps
    # then:
    python tools/m2c_feed.py --version eur func_ovNNN_<addr> > f.s
    <venv>/python tools/_vendor/m2c/m2c.py -t arm-mwcc-c -f func_ovNNN_<addr> f.s

The clone lives under `tools/_vendor/` (gitignored, like decomp-permuter); only
this bootstrap + the pin are committed, so the vendoring is reproducible without
checking the upstream tree into history.
"""
from __future__ import annotations

import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
M2C_REPO_URL = "https://github.com/matt-kempster/m2c.git"
# Pinned 2026-06-08. To bump: `git -C tools/_vendor/m2c rev-parse HEAD`.
M2C_COMMIT = "ce05217168449189eea615d01e468868ebb16d24"
M2C_VENDOR_DIR = ROOT / "tools" / "_vendor" / "m2c"
M2C_PIP_DEPS = ("pycparser",)
# Reuse the permuter venv if present (created by permute.py under PEP 668);
# else fall back to a --break-system-packages install so any python3 — incl.
# the permuter's forked workers — can import the deps.
VENV_PY = ROOT / ".venv_permuter" / "bin" / "python"


def _run(cmd, **kw):
    print("  $", " ".join(str(c) for c in cmd))
    return subprocess.run(cmd, check=True, **kw)


def ensure_m2c_installed(log=print) -> Path:
    """Clone m2c at the pinned commit (idempotent) and return the vendor dir."""
    if (M2C_VENDOR_DIR / "m2c.py").is_file():
        head = subprocess.run(
            ["git", "-C", str(M2C_VENDOR_DIR), "rev-parse", "HEAD"],
            capture_output=True, text=True,
        ).stdout.strip()
        if head.startswith(M2C_COMMIT[:12]):
            log(f"  m2c already at pinned commit {M2C_COMMIT[:12]}.")
            return M2C_VENDOR_DIR
        log(f"  m2c present at {head[:12]} (pin is {M2C_COMMIT[:12]}); re-pinning.")
        _run(["git", "-C", str(M2C_VENDOR_DIR), "fetch", "--depth", "1",
              "origin", M2C_COMMIT])
        _run(["git", "-C", str(M2C_VENDOR_DIR), "checkout", M2C_COMMIT])
        return M2C_VENDOR_DIR
    M2C_VENDOR_DIR.parent.mkdir(parents=True, exist_ok=True)
    log(f"  cloning m2c into {M2C_VENDOR_DIR.relative_to(ROOT)}...")
    _run(["git", "clone", M2C_REPO_URL, str(M2C_VENDOR_DIR)])
    log(f"  checking out pinned commit {M2C_COMMIT[:12]}...")
    _run(["git", "-C", str(M2C_VENDOR_DIR), "checkout", M2C_COMMIT])
    return M2C_VENDOR_DIR


def install_m2c_deps(log=print) -> None:
    """Install m2c's deps (pycparser) into the permuter venv if present, else
    system-wide via --break-system-packages (PEP 668)."""
    if VENV_PY.is_file():
        log("  installing m2c deps into .venv_permuter/...")
        _run([str(VENV_PY), "-m", "pip", "install", "-q", *M2C_PIP_DEPS])
    else:
        log("  installing m2c deps (--break-system-packages)...")
        _run([sys.executable, "-m", "pip", "install", "-q",
              "--break-system-packages", *M2C_PIP_DEPS])


def main() -> int:
    print("Bootstrapping m2c (brief 381):")
    ensure_m2c_installed()
    install_m2c_deps()
    print("=== m2c bootstrap OK ===")
    print(f"  entry point: {(M2C_VENDOR_DIR / 'm2c.py').relative_to(ROOT)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
