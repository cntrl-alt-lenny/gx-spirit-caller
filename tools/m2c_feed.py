#!/usr/bin/env python3

"""
m2c_feed.py — one-command objdump→GAS feeder for the m2c cold-RE loop.

Brief 272 validated m2c `arm-mwcc-c` as a Track-2 comprehension-draft
accelerator, but feeding it meant a manual objdump dance: dump the gap
object, hand-strip the address/hex columns, rewrite branch targets,
resolve the literal pool, and (for Thumb) add the `.syntax unified`
markers. Brief 274 collapses that into one command.

Given a dsd-delinked function — by name, by address, or by explicit
`.o` — this emits GNU-`as` assembly (`.s`) ready for
`m2c -t arm-mwcc-c -f <func>`:

  - objdump with `--architecture=armv5te` for ARM (required, else `bx`
    mis-decodes as `msr`); plain auto-detect for Thumb.
  - ARM vs Thumb auto-detected from `config/<region>/**/symbols.txt`
    (`kind:function(arm|thumb,…)`), with an ELF `$t`/`$a` mapping-symbol
    fallback; `--arm` / `--thumb` override.
  - Thumb gets `.syntax unified` + `.code 16` + `.thumb_func`.
  - pc-relative pool loads resolve to `ldr rX, =symbol` via the objdump
    `@ … <.L_…>` annotation, so m2c names the global instead of
    emitting `M2C_ERROR(/* Read from unset register $pc */)`.
  - objdump reloc lines and `@ …` comments are stripped; a code label is
    only folded away if its address holds a real data word (NOT merely a
    reloc — `bl`/branch instructions carry relocs and must keep their
    label).

Category: match-acceleration (cold-RE drafting; pairs with `scratch_bundle.py`
for sibling context).

`--m2c` (brief 555) wires the vendored m2c (`tools/m2c_bootstrap.py`)
in directly: `--context` assembles the target's module `*_core.h`
(brief 286+'s per-overlay struct/type + shipped-signature header) into
an m2c `--context` file via `m2ctx.py`, so drafts show named fields
(`data_ov002_022cd744[a]`) and known signatures instead of raw
pointer casts (`*(&data_ov002_022cd744 + (arg0 * 4))`) and `?` types.

Usage:
    python tools/m2c_feed.py --version eur func_ov002_0225ee48 > f.s
    python tools/m2c_feed.py --version eur 0x0225ee48 > f.s
    python tools/m2c_feed.py --obj build/eur/delinks/_dsd_gap@ov002_271.o \\
        --func func_ov002_0225ee48 -o f.s
    m2c.py -t arm-mwcc-c -f func_ov002_0225ee48 f.s
    # or, wired end-to-end (needs tools/m2c_bootstrap.py first):
    python tools/m2c_feed.py --version eur func_ov002_0225ee48 --m2c --context

Exits non-zero (loudly, not silently) on: objdump missing (2), m2c not
bootstrapped (2), target not resolvable / defining object not found /
empty function (1).
"""
from __future__ import annotations

import argparse
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path
from typing import NamedTuple

ROOT = Path(__file__).resolve().parent.parent
VALID_REGIONS = ("eur", "usa", "jpn")
M2C_VENDOR = ROOT / "tools" / "_vendor" / "m2c" / "m2c.py"
M2CTX_SCRIPT = ROOT / "tools" / "m2ctx.py"
# Reuse the permuter venv if present (m2c_bootstrap.py installs m2c's
# pycparser dep there when it exists); else fall back to sys.executable,
# matching m2c_bootstrap.py's own VENV_PY convention.
VENV_PY = ROOT / ".venv_permuter" / "bin" / "python"

_SYM_RE = re.compile(
    r"^(func_(?:ov\d+_)?[0-9a-f]{8}) kind:function\((arm|thumb),size=0x([0-9a-f]+)\)"
    r" addr:0x([0-9a-f]+)"
)


class FeedError(Exception):
    """Loud, user-facing failure — bad/unknown/empty input (exit 1)."""


class ObjdumpMissing(Exception):
    """The objdump binary is unavailable (exit 2). Distinct from a
    usage error so input mistakes are reported even without objdump."""


class M2CMissing(Exception):
    """The vendored m2c entry point is unavailable (exit 2). Run
    `python tools/m2c_bootstrap.py` first — it's a one-off, gitignored
    vendor step (brief 381), not something `--m2c` should silently do
    on every invocation."""


class FeedResult(NamedTuple):
    text: str      # the rendered .s
    name: str      # resolved function symbol name
    module: str    # resolved module, e.g. "ov002" or "main"


def _symbols_files(region: str) -> list[Path]:
    return sorted((ROOT / f"config/{region}").glob("**/symbols.txt"))


def resolve_symbol(region: str, target: str, module_hint: str | None = None) -> dict:
    """Resolve a func name or address to {name, addr, isa, module}.

    `target` is either `func_…` (globally unique) or a hex address
    (`0x…` or bare hex). Addresses can be AMBIGUOUS — overlapping
    overlays share an address space (gotcha 18) — so an address that
    matches more than one module fails loudly unless `module_hint`
    selects one (or the func_ name is used instead).
    """
    want_name = target if target.startswith("func_") else None
    want_addr = None
    if want_name is None:
        try:
            want_addr = int(target, 16)
        except ValueError as exc:
            raise FeedError(
                f"target {target!r} is neither a func_ name nor a hex address"
            ) from exc
    hits = []
    for sf in _symbols_files(region):
        mod_m = re.search(r"/(ov\d+|arm9)/symbols\.txt$", str(sf))
        module = "main" if (mod_m and mod_m.group(1) == "arm9") else (
            mod_m.group(1) if mod_m else "?")
        if module_hint and module != module_hint:
            continue
        for line in sf.read_text().splitlines():
            m = _SYM_RE.match(line)
            if not m:
                continue
            name, isa, addr = m.group(1), m.group(2), int(m.group(4), 16)
            if (want_name and name == want_name) or (want_addr is not None and addr == want_addr):
                hits.append({"name": name, "addr": addr, "isa": isa, "module": module})
    if not hits:
        raise FeedError(
            f"{target!r} not found as a function in config/{region}/**/symbols.txt"
            + (f" module {module_hint}" if module_hint else "")
            + " (is it already matched / renamed, or the wrong region?)"
        )
    if len(hits) > 1:
        mods = ", ".join(sorted(h["module"] for h in hits))
        raise FeedError(
            f"address {target} is ambiguous across overlapping modules ({mods}); "
            f"pass --module <ovNNN> or use the func_ name to disambiguate"
        )
    return hits[0]


def _module_of(name: str) -> str:
    m = re.match(r"func_(ov\d+)_", name)
    return m.group(1) if m else "main"


def find_core_header(region: str, module: str) -> Path | None:
    """Locate the per-overlay `*_core.h` holding `module`'s shared
    struct/type defs + shipped-signature vocabulary (brief 286+).

    EUR is the unprefixed baseline (`src/overlay002/ov002_core.h`);
    USA/JPN are region-ported copies (`src/usa/overlay002/…`). `main`
    (arm9) has no consolidated header — too heterogeneous, and out of
    this brief's scope — so callers get None and proceed context-less.
    """
    if not re.match(r"^ov\d+$", module):
        return None
    overlay_dir = f"overlay{module[2:]}"
    base = ROOT / "src" if region == "eur" else ROOT / "src" / region
    header = base / overlay_dir / f"{module}_core.h"
    return header if header.is_file() else None


def build_context(region: str, module: str) -> Path | None:
    """Preprocess `module`'s `*_core.h` into an m2c `--context` file via
    `m2ctx.py` (brief 555). Returns None if the module has no core
    header (e.g. `main`) — callers should proceed without a context
    rather than fail, since most modules still lack one.

    Written to a stable per-module path (not a throwaway temp file) so
    repeated calls across a session hit m2c's own context cache (a
    `<path>.m2c` sidecar, invalidated automatically on content change —
    see `m2c --help`), instead of recompiling `ov002_core.h` per function.
    """
    header = find_core_header(region, module)
    if header is None:
        return None
    out_dir = ROOT / "build" / region / "_m2c_ctx"
    out_dir.mkdir(parents=True, exist_ok=True)
    out_path = out_dir / f"{module}_core.ctx.c"
    # m2ctx.py only preprocesses a file's OWN #include lines (so a scratch
    # .c's function body is excluded from a decomp.me context paste) — so
    # the header's own content must be reached BY an include, not passed
    # directly. An absolute path sidesteps m2ctx's fixed -I list
    # (include/, libs/*/include/), which doesn't cover src/.
    with tempfile.NamedTemporaryFile("w", suffix=".c", delete=False) as wrapper:
        wrapper.write(f'#include "{header.resolve()}"\n')
        wrapper_path = wrapper.name
    try:
        result = subprocess.run(
            [sys.executable, str(M2CTX_SCRIPT), "-f", str(out_path), wrapper_path],
            capture_output=True, text=True, cwd=ROOT,
        )
    finally:
        Path(wrapper_path).unlink(missing_ok=True)
    if result.returncode != 0:
        raise FeedError(
            f"m2ctx.py failed to preprocess {header.relative_to(ROOT)}: "
            f"{result.stderr.strip()}"
        )
    return out_path


def run_m2c(func: str, s_text: str, context: Path | None) -> str:
    """Invoke the vendored m2c (`tools/m2c_bootstrap.py`, brief 381) on
    `s_text` and return its C draft, optionally seeded with `context`
    (brief 555, `--context`)."""
    if not M2C_VENDOR.is_file():
        raise M2CMissing(
            f"{M2C_VENDOR} not found — run `python tools/m2c_bootstrap.py` first"
        )
    py = str(VENV_PY) if VENV_PY.is_file() else sys.executable
    with tempfile.NamedTemporaryFile("w", suffix=".s", delete=False) as f:
        f.write(s_text)
        s_path = f.name
    try:
        cmd = [py, str(M2C_VENDOR), "-t", "arm-mwcc-c", "-f", func]
        if context is not None:
            cmd += ["--context", str(context)]
        cmd.append(s_path)
        result = subprocess.run(cmd, capture_output=True, text=True, cwd=ROOT)
    finally:
        Path(s_path).unlink(missing_ok=True)
    if result.returncode != 0:
        raise FeedError(f"m2c failed on {func}: {result.stderr.strip()}")
    return result.stdout


def find_object(region: str, func: str, objdump: str, module: str | None = None) -> str:
    """Find the gap `.o` that DEFINES `func` (by disasm header)."""
    delinks = ROOT / f"build/{region}/delinks"
    if not delinks.is_dir():
        raise FeedError(
            f"{delinks} missing — run `python tools/configure.py {region}` and a "
            f"build/delink first (cold-RE needs the delinked gap objects)."
        )
    module = module or _module_of(func)
    # search the func's own module first, then everything else
    primary = sorted(delinks.glob(f"_dsd_gap@{module}_*.o"))
    rest = [Path(p) for p in sorted(delinks.glob("_dsd_gap@*.o")) if p not in primary]
    hdr = re.compile(rf"^[0-9a-f]+ <{re.escape(func)}>:", re.M)
    for obj in primary + rest:
        out = subprocess.run(
            [objdump, "-d", "--architecture=armv5te", str(obj)],
            capture_output=True, text=True,
        ).stdout
        if hdr.search(out):
            return str(obj)
    raise FeedError(
        f"{func} is not defined in any build/{region}/delinks/_dsd_gap@*.o "
        f"(matched functions are not in gap objects)"
    )


def _detect_thumb_from_object(objdump: str, obj: str, func: str) -> bool | None:
    """Fallback ISA detect via ELF `$t`/`$a` mapping symbols around func."""
    syms = subprocess.run([objdump, "-t", obj], capture_output=True, text=True).stdout
    func_addr = None
    maps = []  # (addr, '$t'|'$a')
    for line in syms.splitlines():
        m = re.search(r"^([0-9a-f]+)\s.*\s(\$[at])$", line)
        if m:
            maps.append((int(m.group(1), 16), m.group(2)))
        f = re.search(rf"^([0-9a-f]+)\s.*\bF\b.*\s{re.escape(func)}$", line)
        if f:
            func_addr = int(f.group(1), 16)
    if func_addr is None or not maps:
        return None
    # nearest mapping symbol at/below the function start
    below = [t for a, t in sorted(maps) if a <= func_addr]
    if not below:
        return None
    return below[-1] == "$t"


def convert(objdump: str, obj: str, func: str, thumb: bool) -> str:
    """objdump -d -r of `func` in `obj` → m2c-ready GNU-as `.s`."""
    cmd = [objdump, "-d", "-r", obj]
    if not thumb:
        cmd.insert(3, "--architecture=armv5te")
    lines = subprocess.run(cmd, capture_output=True, text=True).stdout.splitlines()
    return render(lines, func, thumb)


def render(lines: list[str], func: str, thumb: bool) -> str:
    """Pure parser: objdump `-d -r` lines (for `func`) → m2c-ready `.s`.

    Split from `convert` so it is unit-testable without an objdump binary.
    """
    pend_reloc: dict[int, str] = {}
    lab_addr: dict[str, int] = {}
    addr_val: dict[int, str] = {}
    for l in lines:
        m = re.match(r"^\s+([0-9a-f]+): R_ARM_\S+\s+(\S+)", l)
        if m:
            pend_reloc[int(m.group(1), 16)] = re.sub(r"[+-]0x[0-9a-f]+$", "", m.group(2))
        h = re.match(r"^([0-9a-f]+) <(\.L_\S+)>:", l)
        if h:
            lab_addr[h.group(2)] = int(h.group(1), 16)
        md = re.match(r"^\s+([0-9a-f]+):\t([0-9a-f]{8})(?:  |\s*$)", l)
        if md:
            addr_val[int(md.group(1), 16)] = md.group(2)

    def resolve(addr: int) -> str | None:
        if addr in pend_reloc:
            return pend_reloc[addr]
        if addr in addr_val:
            return "0x" + addr_val[addr]
        return None

    out = [".text", f"\t.globl {func}"]
    out += (["\t.syntax unified", "\t.code 16", "\t.thumb_func"] if thumb else ["\t.align 2"])
    out.append(f"\t.type {func},%function")
    cap = False
    n_insn = 0
    for l in lines:
        h = re.match(r"^[0-9a-f]+ <([^>]+)>:", l)
        if h:
            name = h.group(1)
            if name == func:
                cap = True
                out.append(f"{func}:")
                continue
            if cap and not name.startswith(".L"):
                break
            if cap and name.startswith(".L"):
                if lab_addr.get(name) in addr_val:  # data word — folded into =sym
                    continue
                out.append(f"{name}:")
            continue
        if not cap:
            continue
        mi = re.match(r"^\s+([0-9a-f]+):\t[0-9a-f ]{8,}\t(\S.*)$", l)
        if mi:
            mn = mi.group(2)
            mpc = re.match(r"(ldr\w*)\s+(\w+), \[pc.*@ \(?[0-9a-f]+ <(\.L_\w+)", mn)
            if mpc and mpc.group(3) in lab_addr and resolve(lab_addr[mpc.group(3)]) is not None:
                out.append(f"\t{mpc.group(1)} {mpc.group(2)}, ={resolve(lab_addr[mpc.group(3)])}")
                n_insn += 1
                continue
            mn = re.sub(r"\s*@.*$", "", mn)              # strip @ comments
            mn = re.sub(r"\b[0-9a-f]+ <([^>]+)>", r"\1", mn)  # branch/bl target → label
            mn = re.sub(r"-0x8$", "", mn).rstrip()
            out.append(f"\t{mn}")
            n_insn += 1
            continue
        md = re.match(r"^\s+([0-9a-f]+):\t([0-9a-f]{8})(?:  |\s*$)", l)
        if md and resolve(int(md.group(1), 16)) is None:
            out.append(f"\t.word 0x{md.group(2)}")
    if not cap:
        raise FeedError(f"{func} not found in the disassembly")
    if n_insn == 0:
        raise FeedError(f"{func} disassembled to zero instructions (empty / data-only?)")
    out.append(f"\t.size {func}, .-{func}")
    return "\n".join(out) + "\n"


def feed(region: str, target: str, objdump: str, obj: str | None = None,
         isa_override: str | None = None, module_hint: str | None = None) -> FeedResult:
    name = target
    module = module_hint
    isa = isa_override
    if obj is None or isa is None:
        try:
            info = resolve_symbol(region, target, module_hint)
            name, module, isa = info["name"], info["module"], isa or info["isa"]
        except FeedError:
            # No config match. Only tolerate it for an explicit --obj (then
            # detect ISA from that object); otherwise fail fast rather than
            # scan every gap object for a typo'd name.
            if obj is None:
                raise
            name = target
    # The target resolved; only NOW require objdump (input errors above are
    # reported even on a host without arm-none-eabi-binutils).
    if shutil.which(objdump) is None and not Path(objdump).exists():
        raise ObjdumpMissing(
            f"{objdump} not found on PATH (brew install arm-none-eabi-binutils)"
        )
    if obj is None:
        obj = find_object(region, name, objdump, module)
    if isa is None:
        det = _detect_thumb_from_object(objdump, obj, name)
        isa = "thumb" if det else "arm"
    module = module or _module_of(name)
    text = convert(objdump, obj, name, thumb=(isa == "thumb"))
    return FeedResult(text, name, module)


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(
        description="Emit m2c-ready GNU-as (.s) for a dsd-delinked function.",
    )
    ap.add_argument("target", help="function name (func_…) or hex address (0x…)")
    ap.add_argument("--version", default="eur", choices=VALID_REGIONS,
                    help="region whose config + delinks to use (default eur)")
    ap.add_argument("--obj", default=None,
                    help="explicit gap .o (default: auto-find the defining object)")
    ap.add_argument("--module", default=None,
                    help="disambiguate an address shared by overlapping overlays (e.g. ov002)")
    ap.add_argument("--objdump", default="arm-none-eabi-objdump",
                    help="ARM objdump binary")
    grp = ap.add_mutually_exclusive_group()
    grp.add_argument("--arm", action="store_true", help="force ARM decoding")
    grp.add_argument("--thumb", action="store_true", help="force Thumb decoding")
    ap.add_argument("--m2c", action="store_true",
                    help="also invoke the vendored m2c (tools/m2c_bootstrap.py) and "
                         "emit its C draft instead of the raw .s")
    ap.add_argument("--context", action="store_true",
                    help="assemble the target module's *_core.h into an m2c --context "
                         "(via m2ctx.py) and pass it through; only meaningful with --m2c "
                         "(brief 555)")
    ap.add_argument("-o", "--out", default=None,
                    help="output file — the .s, or with --m2c the C draft (default stdout)")
    args = ap.parse_args(argv)

    isa_override = "arm" if args.arm else ("thumb" if args.thumb else None)
    try:
        result = feed(args.version, args.target, args.objdump,
                      obj=args.obj, isa_override=isa_override, module_hint=args.module)
    except ObjdumpMissing as e:
        print(f"error: {e}", file=sys.stderr)
        return 2
    except FeedError as e:
        print(f"error: {e}", file=sys.stderr)
        return 1

    text = result.text
    if args.m2c:
        context = None
        if args.context:
            try:
                context = build_context(args.version, result.module)
            except FeedError as e:
                print(f"error: {e}", file=sys.stderr)
                return 1
            if context is None:
                print(f"warning: no *_core.h for module {result.module}; "
                      f"running m2c without context", file=sys.stderr)
        try:
            text = run_m2c(result.name, text, context)
        except M2CMissing as e:
            print(f"error: {e}", file=sys.stderr)
            return 2
        except FeedError as e:
            print(f"error: {e}", file=sys.stderr)
            return 1

    if args.out:
        Path(args.out).write_text(text)
    else:
        sys.stdout.write(text)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
