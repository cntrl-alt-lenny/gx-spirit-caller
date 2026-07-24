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
from routing_suffixes import split_routing_suffix  # noqa: E402
from port_to_region import parse_filename_stem  # noqa: E402


def dir_to_module(d: str) -> str | None:
    if d == "main":
        return "main"
    if d.startswith("overlay") and d[7:].isdigit():
        return "ov" + d[7:].zfill(3)
    return None


def scan_tree(base: Path) -> dict[tuple[str, int], set[str]]:
    """(module, addr) -> {'c','s'} present on disk. Also returns unparsed count."""
    out: dict[tuple[str, int], set[str]] = defaultdict(set)
    unparsed = []
    for p in base.iterdir() if base.is_dir() else []:
        mod = dir_to_module(p.name)
        if mod is None:
            continue
        for f in p.iterdir():
            if f.suffix not in (".c", ".s"):
                continue
            stem = split_routing_suffix(f.name[: -len(f.suffix)])[0]
            parsed = parse_filename_stem(stem)
            if parsed is None:
                unparsed.append(str(f))
                continue
            _, fmod, addr = parsed
            out[(fmod, addr)].add(f.suffix[1:])
    return out, unparsed


# --- EUR baseline .c files -------------------------------------------------
eur_c: list[tuple[str, int, Path]] = []
eur_unparsed = []
for p in (ROOT / "src").iterdir():
    mod = dir_to_module(p.name)
    if mod is None:
        continue
    for f in p.glob("*.c"):
        stem = split_routing_suffix(f.name[:-2])[0]
        parsed = parse_filename_stem(stem)
        if parsed is None:
            eur_unparsed.append(str(f))
            continue
        _, fmod, addr = parsed
        eur_c.append((fmod, addr, f))

print(f"EUR baseline .c files (address-keyed): {len(eur_c)}; unparsed names: {len(eur_unparsed)}")
if eur_unparsed[:5]:
    print("  sample unparsed:", eur_unparsed[:5])

usa_files, usa_unp = scan_tree(ROOT / "src" / "usa")
jpn_files, jpn_unp = scan_tree(ROOT / "src" / "jpn")
print(f"USA on-disk TUs: {len(usa_files)} (unparsed {len(usa_unp)}); JPN: {len(jpn_files)} (unparsed {len(jpn_unp)})")

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

with open(SCRATCH / "port_backlog.json", "w") as fh:
    json.dump({"backlog": backlog, "nofile": nofile_list}, fh, indent=1)
print("\nwrote", SCRATCH / "port_backlog.json")
