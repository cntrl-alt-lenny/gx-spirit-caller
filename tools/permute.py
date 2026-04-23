#!/usr/bin/env python3

"""
permute.py — bootstrap a decomp-permuter run for a single function.

Decomp-permuter (https://github.com/simonlindholm/decomp-permuter) is
the standard matching-accelerator for NDS/GC/N64 decomps. Given a C
source and a target assembly, it applies bounded random permutations
(variable renames, type juggles, reordering, etc.) and reports which
permutations byte-match the target. Indispensable for any function
larger than ~100 bytes where the "write C that looks right" approach
doesn't converge.

This script is a one-stop helper:

    python tools/permute.py <function>           # show the resolved paths
    python tools/permute.py <function> --print   # print only (don't create dir)
    python tools/permute.py <function> --copy    # also stage files into perm_work/

It does not itself run permuter — that's a separate install the
decomper owns. What it does:

  1. Look up the function in `config/<ver>/**/symbols.txt` (by name
     OR hex address).
  2. Walk `config/<ver>/**/delinks.txt` to find the TU covering the
     function's address range, so the source `.c` is known.
  3. Locate the expected target assembly / object paths under
     `build/<ver>/` (dsd's outputs).
  4. Print — and optionally stage — the exact `import.py` command the
     decomper should run from their decomp-permuter checkout.

Assumes `ninja rom` has run at least once so the target object exists.
If `ninja dis` (disassembly) has also run, the `.s` is picked up too;
otherwise the script tells the decomper what to run first.
"""

from __future__ import annotations

import argparse
import shutil
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import (  # noqa: E402
    ROOT,
    Symbol,
    discover_modules,
    parse_symbols_file,
)


def module_symbols_path(config_root: Path, module: str) -> Path:
    arm9 = config_root / "arm9"
    if module == "main":
        return arm9 / "symbols.txt"
    if module in ("itcm", "dtcm"):
        return arm9 / module / "symbols.txt"
    return arm9 / "overlays" / module / "symbols.txt"


def module_delinks_path(config_root: Path, module: str) -> Path:
    arm9 = config_root / "arm9"
    if module == "main":
        return arm9 / "delinks.txt"
    if module in ("itcm", "dtcm"):
        return arm9 / module / "delinks.txt"
    return arm9 / "overlays" / module / "delinks.txt"


def find_function(config_root: Path, needle: str) -> tuple[str, Symbol] | None:
    """Find a function by name or hex address across all modules.
    Returns (module, Symbol) or None."""
    # Address form? Accept '0x021aa4a0' or bare '21aa4a0'.
    target_addr: int | None = None
    if needle.lower().startswith("0x"):
        try:
            target_addr = int(needle, 16)
        except ValueError:
            pass
    elif all(c in "0123456789abcdefABCDEF" for c in needle):
        try:
            target_addr = int(needle, 16)
        except ValueError:
            pass

    for module in discover_modules(config_root):
        syms = parse_symbols_file(module_symbols_path(config_root, module), module)
        for s in syms:
            if not s.is_function:
                continue
            if target_addr is not None and s.addr == target_addr:
                return module, s
            if target_addr is None and s.name == needle:
                return module, s
    return None


def parse_tu_ranges(delinks_path: Path) -> list[tuple[str, int, int]]:
    """Return [(source_file, start_addr, end_addr), ...] from delinks.txt.
    Only matched TU entries (with a `.text` section) are returned.

    delinks.txt layout (canonical):
        src/path/to/file.c:
            complete
            .text start:0xAAAA end:0xBBBB kind:code align:32
            ...
    """
    out: list[tuple[str, int, int]] = []
    if not delinks_path.is_file():
        return out
    current_src: str | None = None
    with delinks_path.open() as f:
        for raw in f:
            line = raw.rstrip()
            if not line.strip() or line.lstrip().startswith("#"):
                continue
            stripped = line.strip()
            # TU header: "src/...:"
            if stripped.endswith(":") and not stripped.startswith(("."  , "start:")):
                current_src = stripped.rstrip(":")
                continue
            # .text section within a TU
            if current_src and stripped.startswith(".text"):
                # Parse "start:0xAAAA end:0xBBBB"
                try:
                    start_tok = next(t for t in stripped.split() if t.startswith("start:0x"))
                    end_tok = next(t for t in stripped.split() if t.startswith("end:0x"))
                    start = int(start_tok.split(":0x", 1)[1], 16)
                    end = int(end_tok.split(":0x", 1)[1], 16)
                    out.append((current_src, start, end))
                except (StopIteration, ValueError):
                    pass
    return out


def tu_containing(delinks_path: Path, addr: int) -> str | None:
    """Return the source file whose .text range covers `addr`, or None
    if this address lies in a _dsd_gap or a not-yet-carved TU."""
    for src, start, end in parse_tu_ranges(delinks_path):
        if start <= addr < end:
            return src
    return None


def expected_object_path(build_root: Path, module: str, source_c: str | None) -> Path | None:
    """Best-guess path to the built .o under build/<ver>/ for the
    containing TU. mwldarm's output tree mirrors src/: if source_c is
    src/main/foo.c, the object is build/<ver>/src/main/foo.o."""
    if source_c is None:
        return None
    source_path = Path(source_c)
    # strip .c / .cpp -> .o
    obj_rel = source_path.with_suffix(".o")
    return build_root / obj_rel


def expected_disasm_path(build_root: Path, module: str, addr: int) -> Path:
    """Where `dsd dis` drops the per-module assembly. Convention taken
    from the decomper's earlier investigation: `build/disasm/` with
    files named by module + _dsd_gap range. This path is indicative;
    the decomper confirms by listing the directory."""
    if module == "main":
        return build_root / "disasm" / f"main_{addr:08x}.s"
    return build_root / "disasm" / f"{module}_{addr:08x}.s"


def render_run_sh(
    function_name: str,
    permuter_path: Path,
    source_c: Path,
    target_s: Path,
) -> str:
    """Render a `run.sh` the decomper can execute from inside the work
    dir. Runs import.py first (if base.c/base.s hasn't been imported
    yet), then the permuter. Idempotent — re-running is safe.

    Paths are emitted ABSOLUTE (via `-f` / `$(pwd)` patterns) so the
    shell script works regardless of what cwd the decomper invokes
    it from."""
    return f"""\
#!/usr/bin/env bash
# Auto-generated by tools/permute.py --copy.
# Runs decomp-permuter against {function_name!s}.

set -euo pipefail
WORK_DIR="$(cd "$(dirname "${{BASH_SOURCE[0]}}")" && pwd)"
PERMUTER_DIR="{permuter_path}"

# Import the source .c + target .s into the permuter's nonmatchings/
# if not already done. import.py is idempotent if you feed it the
# same inputs.
if [ ! -d "${{PERMUTER_DIR}}/nonmatchings/{function_name}" ]; then
    (cd "${{PERMUTER_DIR}}" \\
        && ./import.py "{source_c}" "{target_s}")
fi

# Run the permuter. -j uses all cores; tune as needed.
(cd "${{PERMUTER_DIR}}" \\
    && ./permuter.py "nonmatchings/{function_name}"* -j)
"""


def render_readme(
    function_name: str,
    module: str,
    addr: int,
    source_c: Path,
    target_s: Path,
) -> str:
    """Per-work-dir README. Minimises the "what was I running?"
    context-switch cost when the decomper comes back to a stale
    permuter work dir days later."""
    return f"""\
# `{function_name}` permuter workspace

_Generated by `tools/permute.py --copy` — safe to regenerate._

## Target

- **Function**: `{function_name}`
- **Module**: `{module}`
- **Address**: `0x{addr:08x}`
- **Source `.c`**: `{source_c}`
- **Target `.s`**: `{target_s}`

## How to run

```bash
./run.sh
```

The wrapper calls `decomp-permuter/import.py` once to populate
`decomp-permuter/nonmatchings/`, then `permuter.py` runs the
matching loop in `-j` (all-cores) mode.

## Next steps when the permuter finds a match

1. Copy the matched C body back into the source file at
   `{source_c}`.
2. Run `ninja rom && ninja objdiff && ninja report` to verify
   100% match in the objdiff scorer.
3. Mark the TU `complete` in the module's `delinks.txt` and
   `rename_symbol.py` if the placeholder name needs swapping.
4. Clean up this work dir (`rm -r perm_work/{module}_{function_name}_{addr:08x}`).

## Permuter tuning knobs

- Edit `base.c` to add `PERM_*` macros (see decomp-permuter's
  README for the full list). Typical first-passes:
  - `PERM_TEMP_VAR` for "did the compiler use a temp?"
  - `PERM_RANDOMIZE_TYPE` for int-vs-short swaps
- Re-run `./run.sh` after editing.
"""


def stage_work_dir(
    function_name: str,
    module: str,
    addr: int,
    source_c: Path,
    target_o: Path,
    target_s: Path | None = None,
    permuter_path: Path | None = None,
) -> Path:
    """Create perm_work/<module>_<name>_<addr>/ and populate it
    with the decomp-permuter inputs + a runnable wrapper + README.

    Contents (when all inputs are resolvable):
      base.c     — copy of the source .c
      base.o     — copy of the built object
      run.sh     — executable wrapper for `./import.py + ./permuter.py`
      README.md  — per-work-dir guide

    Backwards-compat: the pre-#161 signature was
    `(function_name, module, addr, source_c, target_o)`. target_s
    and permuter_path default to None; in that case `run.sh` and
    `README.md` aren't written (the work dir is still usable for
    the old flow where the decomper ran import.py manually).
    """
    work_dir = ROOT / "perm_work" / f"{module}_{function_name}_{addr:08x}"
    work_dir.mkdir(parents=True, exist_ok=True)
    if source_c.is_file():
        shutil.copy2(source_c, work_dir / "base.c")
    if target_o.is_file():
        shutil.copy2(target_o, work_dir / "base.o")
    if target_s is not None and permuter_path is not None:
        run_sh = work_dir / "run.sh"
        run_sh.write_text(render_run_sh(
            function_name=function_name,
            permuter_path=permuter_path,
            source_c=source_c,
            target_s=target_s,
        ), encoding="utf-8")
        # chmod +x so `./run.sh` works immediately.
        import stat as _stat
        mode = run_sh.stat().st_mode
        run_sh.chmod(mode | _stat.S_IXUSR | _stat.S_IXGRP)
        (work_dir / "README.md").write_text(render_readme(
            function_name=function_name,
            module=module,
            addr=addr,
            source_c=source_c,
            target_s=target_s,
        ), encoding="utf-8")
    return work_dir


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Bootstrap a decomp-permuter run for a single function"
    )
    ap.add_argument("function", help="Function name or hex address (0x...)")
    ap.add_argument("--version", default="eur",
                    help='Game version under config/<version>/ (default: "eur")')
    ap.add_argument("--permuter-path", type=Path, default=Path("../decomp-permuter"),
                    help="Path to your local decomp-permuter checkout")
    ap.add_argument("--copy", action="store_true",
                    help="Also stage source+object into perm_work/<name>/")
    ap.add_argument("--print", action="store_true",
                    help="Only print resolved paths; don't stage anything")
    args = ap.parse_args()

    config_root = ROOT / "config" / args.version
    build_root = ROOT / "build" / args.version

    hit = find_function(config_root, args.function)
    if hit is None:
        print(
            f"ERROR: function {args.function!r} not found in "
            f"config/{args.version}/**/symbols.txt",
            file=sys.stderr,
        )
        return 2
    module, sym = hit

    source_c_rel = tu_containing(module_delinks_path(config_root, module), sym.addr)
    source_c_abs = (ROOT / source_c_rel) if source_c_rel else None
    target_o = expected_object_path(build_root, module, source_c_rel)
    disasm_s = expected_disasm_path(build_root, module, sym.addr)

    print(f"Function:    {sym.name}")
    print(f"  module:    {module}{'  [FAIL module]' if module in {'main','dtcm','ov004'} else ''}")
    print(f"  address:   0x{sym.addr:08x}")
    print(f"  size:      0x{sym.size:x} bytes ({sym.size} B)")
    print(f"  mode:      {sym.mode}")
    print()

    if source_c_rel is None:
        print("Source TU:   (not carved yet — no .c file covers this address)")
        print("  Action:    add a TU entry to "
              f"{module_delinks_path(config_root, module).relative_to(ROOT)}")
        print("             and create the corresponding .c in src/…")
    else:
        exists = "exists" if source_c_abs and source_c_abs.is_file() else "NOT YET CREATED"
        print(f"Source TU:   {source_c_rel}  [{exists}]")

    if target_o is not None:
        exists = "exists" if target_o.is_file() else "run `ninja rom` to produce"
        print(f"Target .o:   {target_o.relative_to(ROOT)}  [{exists}]")
    else:
        print("Target .o:   (unknown — depends on source TU resolution above)")

    exists = "exists" if disasm_s.is_file() else "run `ninja dis` (or the dsd dis equivalent) first"
    print(f"Target .s:   {disasm_s.relative_to(ROOT)}  [{exists}]")
    print()

    if args.print:
        return 0

    if args.copy:
        if source_c_abs is None or target_o is None:
            print("ERROR: --copy requires both source and target to be resolvable.",
                  file=sys.stderr)
            return 1
        work_dir = stage_work_dir(
            sym.name, module, sym.addr, source_c_abs, target_o,
            target_s=disasm_s,
            permuter_path=args.permuter_path,
        )
        print(f"Staged at:   {work_dir.relative_to(ROOT)}/")
        print("  run.sh:    ./perm_work/.../run.sh (executable)")
        print("  README.md: per-work-dir guide")
        print()

    print("Next step — run decomp-permuter's import.py:")
    print()
    if source_c_abs and target_o:
        print(f"  cd {args.permuter_path}")
        print(f"  ./import.py {source_c_abs} {disasm_s}")
        print()
        print("Then:")
        print(f"  ./permuter.py nonmatchings/{sym.name}*  -j")
    else:
        print("  (resolve the missing source or target paths above first)")

    return 0


if __name__ == "__main__":
    sys.exit(main())
