#!/usr/bin/env python3
"""
check_fake_matches.py — fail source that reaches identical bytes by something
other than real C.

The three-ROM SHA-1 proves the bytes; it cannot prove the bytes came from code.
A "fake match" is source that makes the build byte-identical without being a
decompilation of the function. This lint names the lexical patterns that mean
that in this project, each for a reason (round 004):

  raw-data-directive
      A data directive (`dcd`, `dcb`, `dcw`, `opword`, `.word`, `.byte`,
      `.hword`, `.long`, `.4byte`, `.incbin`, `.space`, `.fill`) in C source.
      It emits raw words rather than transcribed instructions, so an `asm`
      function made of them is a hex dump that `progress.py` would count as
      asm-C.
  section-override
      `__declspec(section ...)` or `__attribute__((section ...))`: places an
      object in a section of the author's choosing, the way a byte array is
      put into `.text`.
  data-in-pragma-section
      A file-scope object defined inside a `#pragma section X begin/end`
      region. The project uses those regions only to put static-initializer
      functions in `.init`; data there is bytes planted in a code section.
  text-unit-without-function
      A `.c`/`.cpp` unit whose `delinks.txt` entry claims `.text` but whose
      source defines no function: the `.text` bytes cannot come from code.
  register-pin
      A GCC-style register variable, `register T x asm("r4")`, forcing a
      register with no meaning in C.
  do-while-zero
      `do { ... } while (0)` in a function body (not a macro): a no-op
      wrapper that exists only to perturb scheduling, the permuter-noise
      pattern.
  volatile-local
      A `volatile` scalar local variable: forces a stack slot and ordering
      that the original program had no reason for. A pointer to volatile
      (`volatile T *p`, hardware registers) is not flagged.

Not flagged here, by design:

  * The Metrowerks `asm` function escape hatch (`asm void f(void) { ... }`)
    with real mnemonics. `progress.py` counts it as asm-C; it is honest.
  * Hardcoded addresses. Whether `(int *)0x0219a934` is fake depends on what
    the original referenced, which only the relocation tables know; that is
    `tools/check_references.py`'s job.

Existing violations are listed in `tools/fake_match_baseline.txt` (one
`rule<TAB>path<TAB>count` line each). The lint fails when any (rule, path)
count exceeds its baseline, and when a baseline entry is stale (the count
went down: shrink the baseline in the same change). The baseline is only ever
written by `--write-baseline`, and a diff that grows it is a review finding.

Usage:
    python tools/check_fake_matches.py                 # lint src/ and libs/
    python tools/check_fake_matches.py --list          # print every finding
    python tools/check_fake_matches.py --write-baseline
    python tools/check_fake_matches.py --root DIR      # lint another tree

Exit codes: 0 clean against the baseline, 1 new or stale violations,
2 missing inputs.
"""
from __future__ import annotations

import argparse
import re
import sys
from collections import Counter
from dataclasses import dataclass
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from progress import _strip_c_comments_and_literals, parse_delinks_file  # noqa: E402

ROOT = Path(__file__).resolve().parent.parent
BASELINE = Path("tools") / "fake_match_baseline.txt"
SOURCE_DIRS = ("src", "libs")
SUFFIXES = (".c", ".cpp")

RULES = (
    "raw-data-directive",
    "section-override",
    "data-in-pragma-section",
    "text-unit-without-function",
    "register-pin",
    "do-while-zero",
    "volatile-local",
)

_DIRECTIVE_RE = re.compile(
    r"(?:^|[;{}])\s*(?:\.(?:word|byte|hword|short|long|4byte|2byte|incbin|space|fill|int)"
    r"|dcd|dcb|dcw|opword)\b(?=[ \t]+[^\s=])",
    re.MULTILINE | re.IGNORECASE,
)
_SECTION_OVERRIDE_RE = re.compile(
    r"__declspec\s*\(\s*section\b|__attribute__\s*\(\(\s*(?:__)?section(?:__)?\b"
)
_PRAGMA_SECTION_RE = re.compile(r"^[ \t]*#[ \t]*pragma[ \t]+section[ \t]+(\w+)[ \t]+(begin|end)\b",
                                re.MULTILINE)
_REGISTER_PIN_RE = re.compile(r"\bregister\b[^;(){}]*\b(?:__asm__|__asm|asm)\s*\(")
_DO_WHILE_ZERO_RE = re.compile(r"\}\s*while\s*\(\s*0\s*\)")
_VOLATILE_LOCAL_RE = re.compile(
    r"(?:^|[;{}])\s*(?:(?:static|const|signed|unsigned|register)\s+)*volatile\s+"
    r"(?:(?:const|signed|unsigned)\s+)*[A-Za-z_]\w*(?:\s+(?:int|long|short|char))*"
    r"\s+[A-Za-z_]\w*\s*(?:\[[^\]]*\]\s*)?[;=,]",
    re.MULTILINE,
)
_FUNCTION_DEF_RE = re.compile(r"\b[A-Za-z_]\w*\s*\([^;{}()]*(?:\([^;{}()]*\)[^;{}()]*)*\)\s*\{")


@dataclass(frozen=True)
class Finding:
    rule: str
    path: str
    line: int
    text: str


def _blank_preprocessor(clean: str) -> str:
    """Blank preprocessor lines (macros included) so they are not scanned as code."""
    out = []
    continuing = False
    for line in clean.split("\n"):
        directive = continuing or line.lstrip().startswith("#")
        continuing = directive and line.rstrip().endswith("\\")
        out.append(" " * len(line) if directive else line)
    return "\n".join(out)


def _function_body_spans(code: str) -> list[tuple[int, int]]:
    """Return (open, close) offsets of every top-level function body."""
    spans = []
    for match in _FUNCTION_DEF_RE.finditer(code):
        start = match.end() - 1
        if any(a <= start < b for a, b in spans):
            continue
        # Only a brace at file scope opens a function body.
        if code.count("{", 0, start) - code.count("}", 0, start) != 0:
            continue
        depth = 0
        for i in range(start, len(code)):
            if code[i] == "{":
                depth += 1
            elif code[i] == "}":
                depth -= 1
                if depth == 0:
                    spans.append((start, i + 1))
                    break
    return spans


def _line_of(text: str, offset: int) -> int:
    return text.count("\n", 0, offset) + 1


def _snippet(source: str, line: int) -> str:
    lines = source.splitlines()
    return lines[line - 1].strip()[:100] if 0 < line <= len(lines) else ""


def scan_source(rel: str, source: str) -> list[Finding]:
    """Return every lexical fake-match finding in one source file."""
    clean = _strip_c_comments_and_literals(source)
    code = _blank_preprocessor(clean)
    findings: list[Finding] = []

    def add(rule: str, offset: int) -> None:
        line = _line_of(clean, offset)
        findings.append(Finding(rule, rel, line, _snippet(source, line)))

    for m in _DIRECTIVE_RE.finditer(code):
        add("raw-data-directive", m.end() - 1)
    for m in _SECTION_OVERRIDE_RE.finditer(code):
        add("section-override", m.start())
    for m in _REGISTER_PIN_RE.finditer(code):
        add("register-pin", m.start())

    bodies = _function_body_spans(code)

    def in_body(offset: int) -> bool:
        return any(a < offset < b for a, b in bodies)

    for m in _DO_WHILE_ZERO_RE.finditer(code):
        if in_body(m.start()):
            add("do-while-zero", m.start())
    for m in _VOLATILE_LOCAL_RE.finditer(code):
        offset = m.start() + len(m.group(0)) - len(m.group(0).lstrip(";{} \t\n"))
        if in_body(offset) and not _in_aggregate(code, offset, bodies):
            add("volatile-local", offset)

    # Data defined inside `#pragma section X begin ... end`.
    open_at: int | None = None
    for m in _PRAGMA_SECTION_RE.finditer(clean):
        if m.group(2) == "begin":
            open_at = m.end()
        elif open_at is not None:
            region = _mask_spans(code, bodies)[open_at:m.start()]
            for stmt in re.finditer(r"[^;{}]*=[^;]*;", region):
                if not re.match(r"\s*(?:extern|typedef)\b", stmt.group(0)):
                    add("data-in-pragma-section", open_at + stmt.start()
                        + len(stmt.group(0)) - len(stmt.group(0).lstrip()))
            open_at = None
    return findings


def _mask_spans(code: str, spans: list[tuple[int, int]]) -> str:
    chars = list(code)
    for a, b in spans:
        for i in range(a, b):
            if chars[i] != "\n":
                chars[i] = " "
    return "".join(chars)


def _in_aggregate(code: str, offset: int, bodies: list[tuple[int, int]]) -> bool:
    """True when `offset` sits inside a struct/union/enum body in a function."""
    body_start = max((a for a, b in bodies if a < offset < b), default=None)
    if body_start is None:
        return False
    depth = 0
    for i in range(offset - 1, body_start, -1):
        if code[i] == "}":
            depth += 1
        elif code[i] == "{":
            if depth == 0:
                head = code[max(body_start, i - 80):i]
                return re.search(r"\b(?:struct|union|enum)\b[\w\s]*$", head) is not None
            depth -= 1
    return False


def defines_function(source: str) -> bool:
    code = _blank_preprocessor(_strip_c_comments_and_literals(source))
    return bool(_function_body_spans(code))


def text_units(root: Path) -> dict[str, list[str]]:
    """Map each C/C++ source claiming `.text` to the delinks files that say so."""
    units: dict[str, list[str]] = {}
    for delinks in sorted((root / "config").rglob("delinks.txt")):
        _module, tus = parse_delinks_file(delinks)
        for tu in tus:
            source = tu.get("source", "")
            if not source.endswith(SUFFIXES):
                continue
            if any(name == ".text" and end > start for name, start, end in tu["sections"]):
                units.setdefault(source, []).append(delinks.relative_to(root).as_posix())
    return units


def scan_tree(root: Path) -> list[Finding]:
    findings: list[Finding] = []
    for top in SOURCE_DIRS:
        base = root / top
        if not base.is_dir():
            continue
        for path in sorted(p for p in base.rglob("*") if p.suffix in SUFFIXES and p.is_file()):
            rel = path.relative_to(root).as_posix()
            findings.extend(scan_source(rel, path.read_text(encoding="utf-8", errors="replace")))
    for source, _where in sorted(text_units(root).items()):
        path = root / source
        if path.is_file() and not defines_function(
                path.read_text(encoding="utf-8", errors="replace")):
            findings.append(Finding("text-unit-without-function", source, 1,
                                    "delinks.txt gives this unit .text; it defines no function"))
    return findings


def load_baseline(path: Path) -> Counter:
    counts: Counter = Counter()
    if not path.is_file():
        return counts
    for raw in path.read_text(encoding="utf-8").splitlines():
        line = raw.strip()
        if not line or line.startswith("#"):
            continue
        rule, rel, count = line.split("\t")
        counts[(rule, rel)] = int(count)
    return counts


def write_baseline(path: Path, counts: Counter) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    lines = [
        "# Fake-match lint baseline: violations on main that CI tolerates.",
        "# Written only by `tools/check_fake_matches.py --write-baseline`.",
        "# rule<TAB>path<TAB>count. It may shrink; a change that grows it is a review finding.",
    ]
    lines += [f"{rule}\t{rel}\t{n}" for (rule, rel), n in sorted(counts.items())]
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def compare(found: Counter, baseline: Counter) -> tuple[list[str], list[str]]:
    new = [f"{rule} {rel}: {n} found, baseline {baseline.get((rule, rel), 0)}"
           for (rule, rel), n in sorted(found.items()) if n > baseline.get((rule, rel), 0)]
    stale = [f"{rule} {rel}: baseline {n}, found {found.get((rule, rel), 0)}"
             for (rule, rel), n in sorted(baseline.items()) if found.get((rule, rel), 0) < n]
    return new, stale


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--root", type=Path, default=ROOT, help="tree to lint (default: this repo)")
    ap.add_argument("--baseline", type=Path, help="baseline file (default: <root>/" + BASELINE.as_posix() + ")")
    ap.add_argument("--list", action="store_true", help="print every finding")
    ap.add_argument("--write-baseline", action="store_true",
                    help="record today's findings as the tolerated baseline")
    args = ap.parse_args(argv)

    root = args.root.resolve()
    if not any((root / d).is_dir() for d in SOURCE_DIRS):
        print(f"check_fake_matches: no src/ or libs/ under {root}", file=sys.stderr)
        return 2
    baseline_path = args.baseline or root / BASELINE
    findings = scan_tree(root)
    found = Counter((f.rule, f.path) for f in findings)

    if args.list:
        for f in findings:
            print(f"{f.path}:{f.line}: {f.rule}: {f.text}")
    if args.write_baseline:
        write_baseline(baseline_path, found)
        print(f"check_fake_matches: wrote {len(found)} baseline entries to {baseline_path}")
        return 0

    baseline = load_baseline(baseline_path)
    new, stale = compare(found, baseline)
    per_rule = Counter(f.rule for f in findings)
    print("check_fake_matches: " + ", ".join(f"{r} {per_rule.get(r, 0)}" for r in RULES)
          + f" (baseline entries {len(baseline)})")
    for line in new:
        print(f"  NEW: {line}")
    for line in stale:
        print(f"  STALE: {line} - shrink the baseline with --write-baseline")
    if new or stale:
        print("check_fake_matches: FAIL")
        return 1
    print("check_fake_matches: OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
