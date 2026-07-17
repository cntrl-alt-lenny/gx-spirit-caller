#!/usr/bin/env python3
"""Export compact EUR matched-C function rows for retriever seeding."""

from __future__ import annotations

import argparse
import json
import re
import subprocess
from pathlib import Path

from progress import parse_delinks_file

ROOT = Path(__file__).resolve().parent.parent
_SYMBOL_RE = re.compile(
    r"^(\S+) kind:function\([^,]+,size=0x([0-9a-f]+)\) addr:0x([0-9a-f]+)"
)
_FUNC_RE = re.compile(r"^\s*[0-9a-f]+ <([^>]+)>:")
_INSN_RE = re.compile(r"^\s*[0-9a-f]+:\s+.*?\t(.+)$")


def parse_symbols(text: str) -> list[tuple[str, int, int]]:
    out = []
    for line in text.splitlines():
        match = _SYMBOL_RE.match(line)
        if match:
            out.append((match.group(1), int(match.group(3), 16), int(match.group(2), 16)))
    return out


def mnemonics_from_objdump(text: str, function: str) -> str:
    active = False
    words = []
    for line in text.splitlines():
        fn = _FUNC_RE.match(line)
        if fn:
            active = fn.group(1) == function
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


def collect(root: Path = ROOT, objdump: str = "arm-none-eabi-objdump") -> list[dict]:
    config = root / "config/eur"
    delinks_root = root / "build/eur/delinks"
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
            for name, addr, size in symbols:
                if any(start <= addr < end for start, end in ranges):
                    rows.append({"name": name, "module": module, "addr": addr,
                                 "size": size, "c_path": source,
                                 "mnemonics": mnemonics_from_objdump(disassembly, name)})
    return sorted(rows, key=lambda row: row["addr"])


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", type=Path,
                        default=ROOT / "tools/corpus/matched-pairs-eur.jsonl")
    parser.add_argument("--objdump", default="arm-none-eabi-objdump")
    args = parser.parse_args()
    rows = collect(objdump=args.objdump)
    args.out.parent.mkdir(parents=True, exist_ok=True)
    with args.out.open("w") as stream:
        for row in rows:
            stream.write(json.dumps(row, separators=(",", ":")) + "\n")
    print(f"wrote {args.out} ({len(rows)} rows)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
