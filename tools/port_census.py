#!/usr/bin/env python3
"""READ-ONLY census: EUR .c files whose USA/JPN twin still ships as .s.

Reproduces the r10 method (find_region_siblings HIGH + byte-sim) against the
current checkout. Writes JSON backlog lists to build/ (override with PORT_CENSUS_OUT).
"""
import json
import os
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SCRATCH = Path(os.environ.get("PORT_CENSUS_OUT", ROOT / "build"))
sys.path.insert(0, str(ROOT / "tools"))

from find_region_siblings import load_region, find_siblings  # noqa: E402
from parsers import CODE_SECTIONS, parse_delinks_file, parse_symbols_file  # noqa: E402
from port_to_region import parse_filename_stem  # noqa: E402
from routing_suffixes import split_routing_suffix  # noqa: E402


def dir_to_module(d: str) -> str | None:
    if d == "main":
        return "main"
    if d.startswith("overlay") and d[7:].isdigit():
        return "ov" + d[7:].zfill(3)
    return None


def _config_modules(region: str) -> list[tuple[str, Path, Path]]:
    """Return ``(module, symbols.txt, delinks.txt)`` for a region."""
    arm9 = ROOT / "config" / region / "arm9"
    out = [("main", arm9 / "symbols.txt", arm9 / "delinks.txt")]
    if (arm9 / "itcm" / "symbols.txt").is_file():
        out.append(("itcm", arm9 / "itcm" / "symbols.txt",
                    arm9 / "itcm" / "delinks.txt"))
    overlays = arm9 / "overlays"
    out.extend(
        (p.name, p / "symbols.txt", p / "delinks.txt")
        for p in sorted(overlays.glob("ov*"))
        if p.is_dir()
    )
    return out


def source_function_addresses(region: str) -> dict[str, list[tuple[str, int]]]:
    """Map each delinked source path to its function symbols.

    ``delinks.txt`` identifies the TU's code interval(s); ``symbols.txt``
    identifies the function entry points inside those intervals. This handles
    named, ``sinit_*``, and multi-function ``*_stubs_*`` TUs without inferring
    an address from a filename.
    """
    out: dict[str, list[tuple[str, int]]] = defaultdict(list)
    function_addresses: set[tuple[str, int]] = set()
    for module, symbols_path, delinks_path in _config_modules(region):
        functions = [s for s in parse_symbols_file(symbols_path, module)
                     if s.is_function]
        function_addresses.update((module, s.addr) for s in functions)
        _, tus = parse_delinks_file(delinks_path)
        for tu in tus:
            source = tu["source"]
            if not source.endswith((".c", ".s")):
                continue
            ranges = [
                (start, end)
                for section, start, end in tu["sections"]
                if section in CODE_SECTIONS and start < end
            ]
            for symbol in functions:
                if any(start <= symbol.addr < end for start, end in ranges):
                    out[source].append((module, symbol.addr))

    # Three historical source paths predate the current delinks filename:
    # retain them only when the filename address is independently confirmed by
    # the region's function symbol table. This is a compatibility bridge, not
    # a filename-based function classifier.
    source_root = ROOT / "src" / ("" if region == "eur" else region)
    for path in source_root.rglob("*.c") if source_root.is_dir() else []:
        source = path.relative_to(ROOT).as_posix()
        if source in out:
            continue
        stem = split_routing_suffix(path.stem)[0]
        parsed = parse_filename_stem(stem)
        if parsed is None:
            continue
        parts = Path(source).parts
        if len(parts) >= 2 and parts[1].startswith("overlay"):
            module = "ov" + parts[1][len("overlay"):].zfill(3)
        elif len(parts) >= 3 and parts[1] == "main" and parts[2] == "itcm":
            module = "itcm"
        else:
            module = "main"
        address = parsed[2]
        if (module, address) in function_addresses:
            out[source].append((module, address))
    for source in out:
        out[source] = sorted(set(out[source]))
    return out


def _region_for_source_root(base: Path) -> str | None:
    try:
        relative = base.resolve().relative_to((ROOT / "src").resolve())
    except ValueError:
        return None
    return "eur" if not relative.parts else relative.parts[0]


def _legacy_scan_tree(base: Path) -> tuple[dict[tuple[str, int], set[str]], list[str]]:
    """Keep the lightweight parser behavior for external synthetic roots."""
    out: dict[tuple[str, int], set[str]] = defaultdict(set)
    unparsed = []
    for module_dir in base.iterdir() if base.is_dir() else []:
        if dir_to_module(module_dir.name) is None:
            continue
        for path in module_dir.rglob("*"):
            if not path.is_file() or path.suffix not in (".c", ".s"):
                continue
            parsed = parse_filename_stem(split_routing_suffix(path.stem)[0])
            if parsed is None:
                unparsed.append(str(path))
                continue
            _, module, address = parsed
            out[(module, address)].add(path.suffix[1:])
    return out, unparsed


def scan_tree(base: Path) -> tuple[dict[tuple[str, int], set[str]], list[str]]:
    """Return function-keyed source kinds and metadata-unresolved TUs."""
    region = _region_for_source_root(base)
    if region is None:
        return _legacy_scan_tree(base)
    source_functions = source_function_addresses(region)
    out: dict[tuple[str, int], set[str]] = defaultdict(set)
    unparsed = []
    for p in base.iterdir() if base.is_dir() else []:
        mod = dir_to_module(p.name)
        if mod is None:
            continue
        # Region trees contain data/ and other nested source directories.
        # Keep the module derived from the first-level directory, but walk
        # every source file below it so nested TUs cannot disappear silently.
        for f in p.rglob("*"):
            if not f.is_file():
                continue
            if f.suffix not in (".c", ".s"):
                continue
            source = f.relative_to(ROOT).as_posix()
            functions = source_functions.get(source, [])
            if not functions:
                unparsed.append(str(f))
                continue
            for module, addr in functions:
                out[(module, addr)].add(f.suffix[1:])
    return out, unparsed


def scan_eur_tree(base: Path) -> tuple[list[tuple[str, int, Path]], list[str]]:
    """Return function-keyed EUR .c entries and metadata-unresolved TUs."""
    if _region_for_source_root(base) is None:
        entries: list[tuple[str, int, Path]] = []
        unresolved = []
        for module_dir in base.iterdir() if base.is_dir() else []:
            if dir_to_module(module_dir.name) is None:
                continue
            for path in module_dir.rglob("*.c"):
                parsed = parse_filename_stem(split_routing_suffix(path.stem)[0])
                if parsed is None:
                    unresolved.append(str(path))
                    continue
                _, module, address = parsed
                entries.append((module, address, path))
        return entries, unresolved
    source_functions = source_function_addresses("eur")
    eur_c: list[tuple[str, int, Path]] = []
    eur_unparsed = []
    for p in base.iterdir() if base.is_dir() else []:
        if dir_to_module(p.name) is None:
            continue
        for f in p.rglob("*.c"):
            source = f.relative_to(ROOT).as_posix()
            functions = source_functions.get(source, [])
            if not functions:
                eur_unparsed.append(str(f))
                continue
            eur_c.extend((module, addr, f) for module, addr in functions)
    return eur_c, eur_unparsed


def main() -> int:
    # --- EUR baseline .c files ---------------------------------------------
    eur_c, eur_unparsed = scan_eur_tree(ROOT / "src")

    if not eur_c:
        print(
            "ERROR: no EUR .c files found; port census has no baseline "
            "to measure.",
            file=sys.stderr,
        )
        return 2

    print(f"EUR baseline .c files (function-address-keyed): {len(eur_c)}; unresolved TUs: {len(eur_unparsed)}")
    if eur_unparsed[:5]:
        print("  sample unresolved:", eur_unparsed[:5])

    usa_files, usa_unp = scan_tree(ROOT / "src" / "usa")
    jpn_files, jpn_unp = scan_tree(ROOT / "src" / "jpn")
    print(f"USA on-disk function TUs: {len(usa_files)} (unresolved {len(usa_unp)}); JPN: {len(jpn_files)} (unresolved {len(jpn_unp)})")

    print("loading regions...", file=sys.stderr)
    eur = load_region("eur")
    regions = {"usa": load_region("usa"), "jpn": load_region("jpn")}

    # index EUR functions by (module, addr); size-bucket targets
    eur_idx = {}
    for mod, funcs in eur.items():
        for fn in funcs:
            eur_idx[(mod, fn.addr)] = fn

    buckets = {}
    for rname, reg in regions.items():
        b = defaultdict(list)
        for mod, funcs in reg.items():
            for fn in funcs:
                b[(mod, fn.size)].append(fn)
        buckets[rname] = b

    results = {"usa": Counter(), "jpn": Counter()}
    backlog = {"usa": [], "jpn": []}
    simdist = {"usa": Counter(), "jpn": Counter()}
    mod_backlog = {"usa": Counter(), "jpn": Counter()}
    nofile_list = {"usa": [], "jpn": []}

    for i, (mod, addr, path) in enumerate(eur_c):
        fn = eur_idx.get((mod, addr))
        if fn is None:
            for r in results:
                results[r]["no-eur-symbol"] += 1
            continue
        for rname in ("usa", "jpn"):
            fake_region = {mod: buckets[rname].get((mod, fn.size), [])}
            matches = find_siblings(
                fn, fake_region, max_results=1, source_region="eur",
                target_region_name=rname, byte_disambiguate=True,
            )
            if not matches or matches[0].confidence != "HIGH":
                results[rname]["no-HIGH-sibling"] += 1
                continue
            top = matches[0]
            taddr = top.func.addr
            kinds = usa_files.get((mod, taddr)) if rname == "usa" else jpn_files.get((mod, taddr))
            bsim = getattr(top, "byte_sim", None)
            if kinds and "c" in kinds:
                results[rname]["already-ported"] += 1
            elif kinds and "s" in kinds:
                results[rname]["BACKLOG-s"] += 1
                mod_backlog[rname][mod] += 1
                if bsim is None:
                    simdist[rname]["nosim"] += 1
                elif bsim >= 0.9999:
                    simdist[rname]["sim=1.0"] += 1
                elif bsim >= 0.99:
                    simdist[rname]["0.99<=sim<1.0"] += 1
                else:
                    simdist[rname]["sim<0.99"] += 1
                backlog[rname].append({
                    "eur": str(path.relative_to(ROOT)), "module": mod,
                    "eur_addr": f"0x{addr:08x}", "tgt": top.func.name,
                    "tgt_addr": f"0x{taddr:08x}", "byte_sim": bsim,
                    "size": fn.size,
                })
            else:
                results[rname]["HIGH-but-no-target-file"] += 1
                nofile_list[rname].append((str(path.name), f"0x{taddr:08x}", mod))
        if i % 500 == 0:
            print(f"  {i}/{len(eur_c)}", file=sys.stderr)

    for rname in ("usa", "jpn"):
        print(f"\n=== {rname.upper()} ===")
        for k, v in sorted(results[rname].items()):
            print(f"  {k}: {v}")
        print(f"  backlog by module: {dict(mod_backlog[rname].most_common())}")
        print(f"  backlog byte-sim dist: {dict(simdist[rname])}")
        total_b = sum(x["size"] for x in backlog[rname])
        print(f"  backlog total bytes: {total_b}")

    SCRATCH.mkdir(parents=True, exist_ok=True)
    with open(SCRATCH / "port_backlog.json", "w") as fh:
        json.dump({"backlog": backlog, "nofile": nofile_list}, fh, indent=1)
    print("\nwrote", SCRATCH / "port_backlog.json")
    return 0


if __name__ == "__main__":
    sys.exit(main())
