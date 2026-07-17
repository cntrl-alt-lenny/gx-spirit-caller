#!/usr/bin/env python3
"""Export compact matched-C function rows for retriever seeding."""

from __future__ import annotations

import argparse
import json
import re
import subprocess
from pathlib import Path

from progress import parse_delinks_file

ROOT = Path(__file__).resolve().parent.parent
_SYMBOL_RE = re.compile(
    r"^(\S+) kind:function\((arm|thumb),size=0x([0-9a-f]+)\) addr:0x([0-9a-f]+)"
)
_FUNC_RE = re.compile(r"^\s*[0-9a-f]+ <([^>]+)>:")
_INSN_RE = re.compile(r"^\s*[0-9a-f]+:\s+.*?\t(.+)$")


def parse_symbols(text: str) -> list[tuple[str, str, int, int]]:
    out = []
    for line in text.splitlines():
        match = _SYMBOL_RE.match(line)
        if match:
            out.append((match.group(1), match.group(2), int(match.group(4), 16),
                        int(match.group(3), 16)))
    return out


def mnemonics_from_objdump(text: str, function: str) -> str:
    active = False
    words = []
    for line in text.splitlines():
        fn = _FUNC_RE.match(line)
        if fn:
            name = fn.group(1)
            if active and not name.startswith("."):
                break
            if name == function:
                active = True
            continue
        if not active:
            continue
        match = _INSN_RE.match(line)
        if match:
            words.append(match.group(1).split()[0])
    return " ".join(words)


def object_for(source: str, delinks_root: Path) -> Path | None:
    candidate = delinks_root / Path(source).with_suffix(".o")
    if candidate.is_file():
        return candidate
    matches = list(delinks_root.rglob(Path(source).with_suffix(".o").name))
    return matches[0] if len(matches) == 1 else None


def collect(region: str = "eur", root: Path = ROOT,
            objdump: str = "arm-none-eabi-objdump") -> list[dict]:
    config = root / "config" / region
    delinks_root = root / "build" / region / "delinks"
    rows = []
    for delinks in sorted(config.rglob("delinks.txt")):
        _sections, tus = parse_delinks_file(delinks)
        symbols_path = delinks.parent / "symbols.txt"
        if not symbols_path.is_file():
            continue
        symbols = parse_symbols(symbols_path.read_text())
        module = "main"
        if "overlays" in delinks.parts:
            module = delinks.parts[delinks.parts.index("overlays") + 1]
        for tu in tus:
            source = tu.get("source", "")
            if tu.get("status") != "complete" or not source.endswith(".c"):
                continue
            ranges = [(s, e) for name, s, e in tu.get("sections", []) if name == ".text"]
            obj = object_for(source, delinks_root)
            if not ranges or obj is None:
                continue
            disassembly = subprocess.run([objdump, "-d", str(obj)],
                                         capture_output=True, text=True,
                                         check=True).stdout
            for name, kind, addr, size in symbols:
                if any(start <= addr < end for start, end in ranges):
                    rows.append({"name": name, "module": module, "addr": addr,
                                 "size": size, "c_path": source,
                                 "_kind": kind,
                                 "mnemonics": mnemonics_from_objdump(disassembly, name)})
    return sorted(rows, key=lambda row: row["addr"])


def density_failures(rows: list[dict]) -> list[dict]:
    failures = []
    for row in rows:
        count = len(row["mnemonics"].split())
        word_size = 2 if row["_kind"] == "thumb" else 4
        code_bytes = count * word_size
        # A function's symbol size includes literal-pool words. The pool is
        # not an instruction stream, so accept it only when it is a small,
        # explainable remainder after the full disassembly was parsed.
        pool_bytes = row["size"] - code_bytes
        expected = row["size"] / 4
        if pool_bytes < 0 or pool_bytes > row["size"] * 0.50:
            failures.append({"name": row["name"], "size": row["size"],
                             "mnemonics": count, "expected": expected})
    return failures


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--region", choices=("eur", "usa", "jpn"), default="eur")
    parser.add_argument("--out", type=Path,
                        default=None)
    parser.add_argument("--objdump", default="arm-none-eabi-objdump")
    args = parser.parse_args()
    rows = collect(region=args.region, objdump=args.objdump)
    failures = density_failures(rows)
    if failures:
        print("density assertion failed:")
        for failure in failures:
            print(json.dumps(failure, sort_keys=True))
        return 1
    print(f"density assertion passed: {len(rows)} rows")
    if args.out is None:
        args.out = ROOT / f"tools/corpus/matched-pairs-{args.region}.jsonl"
    args.out.parent.mkdir(parents=True, exist_ok=True)
    with args.out.open("w") as stream:
        for row in rows:
            public = {key: value for key, value in row.items() if not key.startswith("_")}
            stream.write(json.dumps(public, separators=(",", ":")) + "\n")
    print(f"wrote {args.out} ({len(rows)} rows)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
