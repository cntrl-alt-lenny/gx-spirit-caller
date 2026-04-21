#!/usr/bin/env python3

"""
propagate_template.py — generate sibling C files from a matched template.

mwcc emits many template-shaped instruction sequences: 44+ __sinit_*
static-init shells, N × vtable-default bx-lr stubs, duplicated
adapter fns. When one of those is matched, the remaining siblings
have the same instructions just with different address immediates.
Brief 003/004/005 did this by hand: copy the template, substitute
addresses, repeat N times.

This tool automates that. Given:
  - a matched template .c file
  - a target sibling's (module, addr)
  - `config/<version>` (for symbols.txt + relocs.txt)

It:
  1. Loads the template and target's outbound relocs.
  2. Pairs them by relative offset + kind (validates the shapes
     actually match — refuses if they don't).
  3. Looks up each reloc's destination symbol name in both template
     and target.
  4. Builds a substitution map (template-name → target-name) and
     applies it to the template file's text.
  5. Substitutes the function's own symbol name (e.g.
     __sinit_ov005_021b16e4 → __sinit_ov005_021b1710).
  6. Writes the generated .c. Prints the delinks.txt TU header the
     decomper needs to add by hand (we don't auto-edit delinks.txt
     — that's the decomper's carving territory).

Usage — single sibling:

    python tools/propagate_template.py apply \\
        --template src/overlay005/sinit_ov005_021b16e4.c \\
        --target ov005 0x021b1710 \\
        --version eur

Usage — batch from find_duplicates output:

    python tools/propagate_template.py batch \\
        --template src/overlay005/sinit_ov005_021b16e4.c \\
        --cluster-from build/eur/analysis/duplicates.json \\
        --cluster-index 0 \\
        --version eur

Dry-run by default; pass `--confirm` to actually write files.
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from dataclasses import dataclass
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import (  # noqa: E402
    ROOT,
    ModuleData,
    Reloc,
    Symbol,
    load_all,
)


# --------------------------------------------------------------------------- #
# bss-symbol augmentation
#
# analyze_symbols.SYMBOL_RE requires `kind:type(attrs)` with parens, so
# `kind:bss addr:...` lines slip through silently. Propagation on
# sinit templates runs head-first into this — the literal-pool data
# addresses at the end of each sinit are almost always bss-routed
# globals. Augment the loaded ModuleData's by_addr map so
# _symbol_at() can resolve them.
# --------------------------------------------------------------------------- #

_BSS_LINE_RE = re.compile(
    r"^(?P<name>\S+)\s+kind:bss\s+addr:0x(?P<addr>[0-9a-fA-F]+)\s*$",
)


def _augment_bss_symbols(
    modules: dict[str, ModuleData], config_dir: Path,
) -> None:
    """Parse every symbols.txt for bss lines and graft resulting
    Symbol entries into the matching module's by_addr dict."""
    for sym_file in config_dir.rglob("symbols.txt"):
        module = _module_from_symbols_path(sym_file, config_dir)
        md = modules.get(module)
        if md is None:
            continue
        try:
            with sym_file.open(encoding="utf-8", errors="replace") as f:
                for line in f:
                    m = _BSS_LINE_RE.match(line.rstrip())
                    if not m:
                        continue
                    addr = int(m["addr"], 16)
                    if addr in md.by_addr:
                        continue  # already loaded via normal path
                    md.by_addr[addr] = Symbol(
                        name=m["name"], module=module, addr=addr,
                        size=0, type="data", mode="any",
                    )
        except OSError:
            continue


def _module_from_symbols_path(
    sym_path: Path, config_dir: Path,
) -> str:
    """config/eur/arm9/symbols.txt -> main
    config/eur/arm9/overlays/ov005/symbols.txt -> ov005"""
    try:
        rel = sym_path.relative_to(config_dir)
    except ValueError:
        rel = sym_path
    parts = rel.parts[:-1]
    if not parts:
        return "module"
    last = parts[-1]
    if last == "arm9":
        return "main"
    return last


# --------------------------------------------------------------------------- #
# Reloc windowing
# --------------------------------------------------------------------------- #

def relocs_for_function(
    symbol: Symbol, module_data: ModuleData,
) -> list[Reloc]:
    """Return the relocs whose source address lies inside `symbol`'s
    byte range, sorted by src_addr ascending. Size-0 symbols return
    an empty list (nothing to window on)."""
    if symbol.size == 0:
        return []
    start = symbol.addr
    end = symbol.addr + symbol.size
    out = [
        r for r in module_data.relocs
        if start <= r.src_addr < end
    ]
    out.sort(key=lambda r: r.src_addr)
    return out


def reloc_signature(relocs: list[Reloc], base_addr: int) -> tuple:
    """Canonical (offset, kind) fingerprint of a function's outbound
    relocs. Two functions share a template iff their signatures match
    exactly (same offsets, same kinds — only the dest addrs differ).
    """
    return tuple(
        (r.src_addr - base_addr, r.kind)
        for r in relocs
    )


# --------------------------------------------------------------------------- #
# Substitution-map derivation
# --------------------------------------------------------------------------- #

@dataclass(frozen=True)
class Substitution:
    template_name: str
    target_name: str


@dataclass
class PropagationPlan:
    """Everything the caller needs to materialise or preview a
    propagation without actually writing to disk."""
    template_path: Path
    target_module: str
    target_addr: int
    target_name: str
    output_path: Path
    substitutions: list[Substitution]
    generated_text: str
    delinks_line: str       # TU header lines the decomper must paste
    warnings: list[str]


class TemplateMismatch(Exception):
    """Template and target don't share the same reloc shape. Refusing
    to propagate would mask a real mismatch — e.g. the cluster was
    picked from a stale duplicates.json, or the target is actually a
    different-shape sibling."""


def _symbol_at(
    modules: dict[str, ModuleData], module: str, addr: int,
) -> Symbol:
    md = modules.get(module)
    if md is None:
        raise ValueError(f"unknown module: {module}")
    s = md.by_addr.get(addr)
    if s is None:
        raise ValueError(f"no symbol at {module}|0x{addr:08x}")
    return s


def derive_plan(
    template_path: Path,
    target_module: str,
    target_addr: int,
    modules: dict[str, ModuleData],
) -> PropagationPlan:
    """Produce a PropagationPlan by pairing template and target
    relocs. Raises TemplateMismatch if shapes don't match."""
    if not template_path.is_file():
        raise ValueError(f"template not found: {template_path}")

    template_addr = _parse_addr_from_template(template_path)
    template_module = _parse_module_from_template(template_path)
    template_sym = _symbol_at(modules, template_module, template_addr)
    target_sym = _symbol_at(modules, target_module, target_addr)

    if template_sym.size != target_sym.size:
        raise TemplateMismatch(
            f"template size 0x{template_sym.size:x} vs target "
            f"0x{target_sym.size:x} — cannot propagate."
        )

    template_md = modules[template_module]
    target_md = modules[target_module]
    t_relocs = relocs_for_function(template_sym, template_md)
    s_relocs = relocs_for_function(target_sym, target_md)

    t_sig = reloc_signature(t_relocs, template_sym.addr)
    s_sig = reloc_signature(s_relocs, target_sym.addr)
    if t_sig != s_sig:
        raise TemplateMismatch(
            f"reloc shapes differ: template has {len(t_relocs)} relocs "
            f"{t_sig}, target has {len(s_relocs)} relocs {s_sig}."
        )

    subs: list[Substitution] = []
    seen: set[tuple[str, str]] = set()

    # The function's own name substitutes too.
    if template_sym.name != target_sym.name:
        subs.append(Substitution(template_sym.name, target_sym.name))
        seen.add((template_sym.name, target_sym.name))

    warnings: list[str] = []
    for t_r, s_r in zip(t_relocs, s_relocs, strict=True):
        t_dest = modules.get(t_r.dest_module, None)
        s_dest = modules.get(s_r.dest_module, None)
        if t_dest is None or s_dest is None:
            continue
        t_sym = t_dest.by_addr.get(t_r.dest_addr)
        s_sym = s_dest.by_addr.get(s_r.dest_addr)
        if t_sym is None or s_sym is None:
            warnings.append(
                f"reloc at template+0x{t_r.src_addr - template_sym.addr:x} "
                f"has no symbol at one end (template->{t_r.dest_module}|"
                f"0x{t_r.dest_addr:08x}, target->{s_r.dest_module}|"
                f"0x{s_r.dest_addr:08x}); skipping."
            )
            continue
        if t_sym.name == s_sym.name:
            # Shared reference (e.g. __register_global_object).
            continue
        pair = (t_sym.name, s_sym.name)
        if pair in seen:
            continue
        seen.add(pair)
        subs.append(Substitution(t_sym.name, s_sym.name))

    # Apply substitutions to template body.
    template_text = template_path.read_text(encoding="utf-8")
    generated = apply_substitutions(template_text, subs)

    # Also substitute any hex addr literals in comments (e.g.
    # "0x021b16e4" in the file header). Not strictly required for
    # correctness but keeps the generated file readable.
    generated = _substitute_addr_comments(
        generated, template_sym.addr, target_sym.addr,
    )

    output_path = _derive_output_path(template_path, template_sym, target_sym)

    try:
        delinks_rel = output_path.relative_to(ROOT)
    except ValueError:
        # Template path lives outside ROOT (tests / unusual layouts).
        delinks_rel = output_path
    delinks_line = _format_delinks_tu_header(delinks_rel, target_sym)

    return PropagationPlan(
        template_path=template_path,
        target_module=target_module,
        target_addr=target_addr,
        target_name=target_sym.name,
        output_path=output_path,
        substitutions=subs,
        generated_text=generated,
        delinks_line=delinks_line,
        warnings=warnings,
    )


def apply_substitutions(
    src: str, subs: list[Substitution],
) -> str:
    """Apply the substitution list to `src`. Sorts longest-first so a
    longer name doesn't get partially matched by a shorter prefix."""
    # Two-pass with sentinel tokens to avoid A→B, B→A clobbering.
    # Sentinel uses a leading NUL + an ASCII-STX byte + digits +
    # trailing NUL — no alphanumerics, so pass 2 can't accidentally
    # re-match a sentinel's body when applying another substitution.
    # Pass 1: template_name → unique sentinel.
    # Pass 2: sentinel → target_name.
    sentinels: list[tuple[str, str]] = []
    work = src
    for i, s in enumerate(
        sorted(subs, key=lambda s: -len(s.template_name)),
    ):
        sentinel = f"\x00\x02{i}\x02\x00"
        work = work.replace(s.template_name, sentinel)
        sentinels.append((sentinel, s.target_name))
    for sentinel, target in sentinels:
        work = work.replace(sentinel, target)
    return work


def _substitute_addr_comments(
    src: str, template_addr: int, target_addr: int,
) -> str:
    """Replace the primary template address literal in comments with
    the target address. Covers the common '0xNNNNNNNN' form.

    Only substitutes the TEMPLATE's own entry-point address, not
    reloc target addresses (those come out via name substitution via
    the symbol table). Keeps commentary readable without corrupting
    the substance.
    """
    t_hex = f"0x{template_addr:08x}"
    s_hex = f"0x{target_addr:08x}"
    return src.replace(t_hex, s_hex)


def _parse_addr_from_template(path: Path) -> int:
    """Extract the template symbol's address from its filename.

    Convention: `<prefix>_<module>_<addr>.c` or `<prefix>_<addr>.c`
    where addr is an 8-digit hex at the end of the stem.
    """
    stem = path.stem
    m = re.search(r"([0-9a-fA-F]{6,8})$", stem)
    if m is None:
        raise ValueError(
            f"couldn't find an address in template filename '{path.name}'. "
            f"Expected something like `sinit_ov005_021b16e4.c`."
        )
    return int(m.group(1), 16)


def _parse_module_from_template(path: Path) -> str:
    """Extract the module from the template's path.
    `src/overlay005/sinit_ov005_021b16e4.c` -> `ov005`.
    `src/main/<whatever>.c` -> `main`."""
    for part in path.parts:
        if part == "main" or part in ("itcm", "dtcm"):
            return part
        if part.startswith("overlay") and part[len("overlay"):].isdigit():
            n = int(part[len("overlay"):])
            return f"ov{n:03d}"
    raise ValueError(
        f"couldn't determine module from template path '{path}'."
    )


def _derive_output_path(
    template_path: Path, template_sym: Symbol, target_sym: Symbol,
) -> Path:
    """Generate an output path by substituting the symbol name inside
    the template's filename stem."""
    old = template_sym.name
    new = target_sym.name
    if old in template_path.stem:
        new_stem = template_path.stem.replace(old, new)
    else:
        # Fallback: substitute the hex-addr tail.
        new_stem = re.sub(
            r"[0-9a-fA-F]{6,8}$",
            f"{target_sym.addr:08x}",
            template_path.stem,
        )
    return template_path.with_name(new_stem + template_path.suffix)


def _format_delinks_tu_header(src_path: Path, sym: Symbol) -> str:
    """Render the TU header lines the decomper pastes into
    delinks.txt after verifying the match. Omits `complete` — the
    decomper adds it once objdiff agrees. The section range is the
    .text extent of the function itself; a full match might add
    literal-pool bytes but those fold into the same .text range."""
    end = sym.addr + sym.size
    return (
        f"{src_path}:\n"
        f"    .text start:0x{sym.addr:08x} end:0x{end:08x}"
    )


# --------------------------------------------------------------------------- #
# Cluster helper
# --------------------------------------------------------------------------- #

def read_cluster_members(
    duplicates_json: Path, cluster_index: int, template_key: str | None,
) -> list[tuple[str, int]]:
    """Given a find_duplicates.json, return [(module, addr), ...] for
    the chosen cluster. Skips the template member itself if found."""
    payload = json.loads(duplicates_json.read_text())
    clusters = payload.get("clusters", [])
    if not (0 <= cluster_index < len(clusters)):
        raise ValueError(
            f"cluster_index {cluster_index} out of range "
            f"(have {len(clusters)} clusters)."
        )
    cluster = clusters[cluster_index]
    members = cluster.get("members", [])
    out: list[tuple[str, int]] = []
    for m in members:
        mod = m.get("module")
        addr_s = m.get("addr", "")
        try:
            addr = int(addr_s, 16) if isinstance(addr_s, str) else int(addr_s)
        except (TypeError, ValueError):
            continue
        if template_key and f"{mod}|0x{addr:08x}" == template_key:
            continue
        out.append((mod, addr))
    return out


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def _parse_addr(s: str) -> int:
    s = s.strip()
    if s.startswith(("0x", "0X")):
        return int(s, 16)
    return int(s, 16)


def _print_plan(plan: PropagationPlan) -> None:
    print(f"Template: {plan.template_path}")
    print(f"Target:   {plan.target_module}|0x{plan.target_addr:08x}  "
          f"({plan.target_name})")
    print(f"Output:   {plan.output_path}")
    print()
    print(f"Substitutions ({len(plan.substitutions)}):")
    for s in plan.substitutions:
        print(f"  {s.template_name} -> {s.target_name}")
    if plan.warnings:
        print()
        print("Warnings:")
        for w in plan.warnings:
            print(f"  {w}")
    print()
    print("delinks.txt TU header to paste (no `complete` — add after "
          "objdiff agrees):")
    print()
    for line in plan.delinks_line.split("\n"):
        print(f"  {line}")


def _write_plan(plan: PropagationPlan) -> None:
    plan.output_path.parent.mkdir(parents=True, exist_ok=True)
    plan.output_path.write_text(plan.generated_text, encoding="utf-8")


def cmd_apply(args) -> int:
    config_dir = ROOT / "config" / args.version
    modules = load_all(config_dir)
    _augment_bss_symbols(modules, config_dir)
    try:
        plan = derive_plan(
            Path(args.template),
            args.target[0],
            _parse_addr(args.target[1]),
            modules,
        )
    except (TemplateMismatch, ValueError) as e:
        print(f"error: {e}", file=sys.stderr)
        return 2

    _print_plan(plan)
    if args.confirm:
        if plan.output_path.exists():
            print(f"\nerror: {plan.output_path} already exists. "
                  f"Refusing to overwrite — delete it first if this "
                  f"is a deliberate regeneration.", file=sys.stderr)
            return 2
        _write_plan(plan)
        print(f"\nWrote {plan.output_path}")
    else:
        print("\nDry-run — nothing written. Pass --confirm to materialise.")
    return 0


def cmd_batch(args) -> int:
    modules = load_all(ROOT / "config" / args.version)
    template_path = Path(args.template)
    try:
        template_addr = _parse_addr_from_template(template_path)
        template_module = _parse_module_from_template(template_path)
    except ValueError as e:
        print(f"error: {e}", file=sys.stderr)
        return 2

    template_key = f"{template_module}|0x{template_addr:08x}"
    try:
        members = read_cluster_members(
            Path(args.cluster_from), args.cluster_index, template_key,
        )
    except (ValueError, OSError) as e:
        print(f"error: {e}", file=sys.stderr)
        return 2

    plans: list[PropagationPlan] = []
    errors: list[tuple[str, int, str]] = []
    for (mod, addr) in members:
        try:
            plans.append(derive_plan(template_path, mod, addr, modules))
        except (TemplateMismatch, ValueError) as e:
            errors.append((mod, addr, str(e)))

    print(f"Template: {template_path}")
    print(f"Cluster {args.cluster_index} → {len(members)} sibling(s), "
          f"{len(plans)} ready, {len(errors)} skipped.")
    print()
    for p in plans:
        print(f"  {p.target_module}|0x{p.target_addr:08x}  "
              f"{p.target_name}  -> {p.output_path.name}  "
              f"({len(p.substitutions)} subs)")
    if errors:
        print()
        print("Skipped:")
        for mod, addr, msg in errors:
            print(f"  {mod}|0x{addr:08x}: {msg}")

    if not args.confirm:
        print("\nDry-run — nothing written. Pass --confirm to materialise.")
        return 1 if errors else 0

    written = 0
    for p in plans:
        if p.output_path.exists():
            print(f"skip: {p.output_path} already exists.", file=sys.stderr)
            continue
        _write_plan(p)
        written += 1

    print(f"\nWrote {written}/{len(plans)} file(s). delinks.txt TU "
          f"headers to add (one per file):")
    for p in plans:
        print()
        for line in p.delinks_line.split("\n"):
            print(f"  {line}")
    return 1 if errors else 0


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Generate sibling C files from a matched template."
    )
    sub = ap.add_subparsers(dest="cmd", required=True)

    ap_apply = sub.add_parser(
        "apply", help="Generate one sibling from (module, addr).",
    )
    ap_apply.add_argument("--template", required=True,
                          help="Path to the matched template .c file")
    ap_apply.add_argument("--target", nargs=2, metavar=("MODULE", "ADDR"),
                          required=True,
                          help="Target sibling module + addr")
    ap_apply.add_argument("--version", default="eur")
    ap_apply.add_argument("--confirm", action="store_true",
                          help="Actually write files (default is dry-run)")
    ap_apply.set_defaults(func=cmd_apply)

    ap_batch = sub.add_parser(
        "batch", help="Generate N siblings from a find_duplicates cluster.",
    )
    ap_batch.add_argument("--template", required=True)
    ap_batch.add_argument("--cluster-from", required=True,
                          help="Path to build/<ver>/analysis/duplicates.json")
    ap_batch.add_argument("--cluster-index", type=int, default=0)
    ap_batch.add_argument("--version", default="eur")
    ap_batch.add_argument("--confirm", action="store_true")
    ap_batch.set_defaults(func=cmd_batch)

    args = ap.parse_args()
    return args.func(args)


if __name__ == "__main__":
    sys.exit(main())
