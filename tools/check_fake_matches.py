#!/usr/bin/env python3
"""
check_fake_matches.py — fail source that reaches identical bytes by something
other than real C.

The three-ROM SHA-1 proves the bytes; it cannot prove the bytes came from code.
A "fake match" is source that makes the build byte-identical without being a
decompilation of the function. This lint names the patterns that mean that in
this project, each for a reason (rounds 004 and 005). Six are lexical (they
read the source) and one reads the built objects:

  raw-data-directive
      A data directive in an `asm` body: mwcc's assembler accepts only `dcd`
      (checked round 005: `dcb`, `dcw`, `opword`, `.word`, `.long`, `.4byte`,
      `space`, `fill` are all "unknown assembler instruction mnemonic"), but
      `dcd` compiles after a label, behind a `#define` alias, through a
      function-like macro, and through token pasting (`CAT(d,cd)`), and every
      spelling emits a raw word into `.text`. The lexical rule catches the
      label, every macro alias (macros are collected tree-wide, headers
      included) and `dcd` after `;` `{` `}` or `:`. It cannot see token
      pasting; `data-in-text` does.
  data-in-text  (object check, `--version`)
      A `$d` (data) mapping symbol in a code section of a C/C++ unit's built
      object whose words are neither loaded by a pc-relative `ldr`/`add` of
      that section nor relocated. That is a raw word in code however it was
      spelled. Literal pools and jump tables are referenced, so honest code is
      clean: 0 findings over the 7,867 C units of the EUR build.
  section-override
      `__declspec(section ...)` or `__attribute__((section ...))`, also when
      reached through a macro: places an object in a section of the author's
      choosing, the way a byte array is put into `.text`.
  data-in-pragma-section
      A file-scope object defined inside a `#pragma section X begin/end`
      region. The project uses those regions only to put static-initializer
      functions in `.init`; data there is bytes planted in a code section.
  text-unit-without-function
      A `.c`/`.cpp` unit whose `delinks.txt` entry claims `.text` but whose
      source defines no function: the `.text` bytes cannot come from code.
  register-pin
      A GCC-style register variable, `register T x asm("r4")`, also through
      a macro: forcing a register with no meaning in C.
  do-while-zero
      `do { ... } while (0);` in a function body (not a macro): a no-op
      wrapper that exists only to perturb scheduling, the permuter-noise
      pattern. The zero may be `0`, `0U`, `0x0`, `((0))`, `false`, `FALSE`, `!1`
      or a macro defined as one of those.
  volatile-local
      A `volatile` scalar local, or a volatile local pointer: forces a stack
      slot and ordering that the original program had no reason for. Reached
      as `volatile T x`, `T volatile x`, `T * volatile p`, through a
      `typedef volatile ...` name or a `#define VOL volatile`. A pointer TO
      volatile (`volatile T *p`, hardware registers) is not flagged.

Not flagged here, by design:

  * The Metrowerks `asm` function escape hatch (`asm void f(void) { ... }`)
    with real mnemonics. `progress.py` counts it as asm-C; it is honest.
  * Hardcoded addresses. Whether `(int *)0x0219a934` is fake depends on what
    the original referenced, which only the relocation tables know; that is
    `tools/check_references.py`'s job.

Known limits: a lexical rule cannot see every macro trick, and the object check
trusts a pc-relative load to make a word honest, so a `dcd` word that a real
`ldr` in the same section also happens to load passes. A `$d` word the
original also has as data would need the reference check to catch.

Baseline (format 2, `tools/baseline_file.py`): `tools/fake_match_baseline.txt`
lists the findings on `main` when the lint arrived, ONE LINE PER FINDING:
`rule<TAB>path<TAB>ordinal<TAB>text`, the text being the offending line. The
lint fails on a finding that is not listed and on a listed one that is gone.
A baseline can only shrink: `--prune-baseline` deletes stale lines and adds
nothing, and `tools/check_baseline_growth.py` fails CI on any added line.
`--write-baseline` exists to fill a baseline the first time.

Usage:
    python tools/check_fake_matches.py                 # lint src/ and libs/
    python tools/check_fake_matches.py --version eur --version usa --version jpn
                                                       # ...and the built objects
    python tools/check_fake_matches.py --list          # print every finding
    python tools/check_fake_matches.py --prune-baseline
    python tools/check_fake_matches.py --root DIR      # lint another tree

Exit codes: 0 clean against the baseline, 1 new or stale findings,
2 missing inputs (no src/ or libs/, or a version that was not built).
"""
from __future__ import annotations

import argparse
import re
import struct
import sys
from collections import Counter
from dataclasses import dataclass, field
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import baseline_file  # noqa: E402
from check_references import built_units  # noqa: E402
from progress import _strip_c_comments_and_literals, parse_delinks_file  # noqa: E402

ROOT = Path(__file__).resolve().parent.parent
BASELINE = Path("tools") / "fake_match_baseline.txt"
SOURCE_DIRS = ("src", "libs")
MACRO_DIRS = ("include", "src", "libs")
SUFFIXES = (".c", ".cpp")
MACRO_SUFFIXES = (".c", ".cpp", ".h", ".hpp", ".inc")
REGIONS = ("eur", "usa", "jpn")
HEADER = [
    "# Fake-match lint baseline: findings on main that CI tolerates, one per line.",
    "# rule<TAB>path<TAB>ordinal<TAB>text. It may only shrink: `--prune-baseline` removes",
    "# stale lines, and tools/check_baseline_growth.py fails CI on any added line.",
]

RULES = (
    "raw-data-directive",
    "data-in-text",
    "section-override",
    "data-in-pragma-section",
    "text-unit-without-function",
    "register-pin",
    "do-while-zero",
    "volatile-local",
)

_DIRECTIVE_WORDS = (
    r"\.(?:word|byte|hword|short|long|4byte|2byte|incbin|space|fill|int)"
    r"|dcd|dcb|dcw|opword"
)
# A directive with an operand, at the start of a statement or line, or after a
# label (`lbl:`), `;`, `{` or `}`.
_DIRECTIVE_RE = re.compile(
    r"(?:^|[;{}:])\s*(?:" + _DIRECTIVE_WORDS + r")\b(?=[ \t]+[^\s=])",
    re.MULTILINE | re.IGNORECASE,
)
# The same, without the operand requirement: how a macro BODY spells one.
_DIRECTIVE_BODY_RE = re.compile(
    r"(?:^|[;{}:])\s*(?:" + _DIRECTIVE_WORDS + r")\b", re.MULTILINE | re.IGNORECASE
)
_SECTION_OVERRIDE_RE = re.compile(
    r"__declspec\s*\(\s*section\b|__attribute__\s*\(\(\s*(?:__)?section(?:__)?\b"
)
_PRAGMA_SECTION_RE = re.compile(r"^[ \t]*#[ \t]*pragma[ \t]+section[ \t]+(\w+)[ \t]+(begin|end)\b",
                                re.MULTILINE)
_REGISTER_PIN_RE = re.compile(r"\bregister\b[^;(){}]*\b(?:__asm__|__asm|asm)\s*\(")
_ASM_SUFFIX_RE = re.compile(r"\b(?:__asm__|__asm|asm)\s*\(")
_ZERO_LITERAL = r"\(*\s*(?:0[xX]0+|0[bB]0+|0+)[uUlL]*\s*\)*|false|FALSE|!\s*(?:1|true|TRUE)"
_ZERO_BODY_RE = re.compile(r"\s*(?:" + _ZERO_LITERAL + r")\s*\Z")
_FUNCTION_DEF_RE = re.compile(r"\b[A-Za-z_]\w*\s*\([^;{}()]*(?:\([^;{}()]*\)[^;{}()]*)*\)\s*\{")
_DEFINE_RE = re.compile(r"^[ \t]*#[ \t]*define[ \t]+([A-Za-z_]\w*)(\([^)]*\))?[ \t]*(.*)$")
_TYPEDEF_RE = re.compile(r"\btypedef\b([^;{}]*);")
_IDENT_RE = re.compile(r"[A-Za-z_]\w*")
_VOLATILE_BODY_RE = re.compile(r"[\w\s]*\bvolatile\b[\w\s]*\Z")


@dataclass(frozen=True)
class Finding:
    rule: str
    path: str
    line: int
    text: str


@dataclass
class Aliases:
    """Names that stand for a suspicious token: macros and typedefs, tree-wide."""

    directive: set[str] = field(default_factory=set)   # expands to a data directive
    section: set[str] = field(default_factory=set)     # expands to a section override
    pin: set[str] = field(default_factory=set)         # expands to a whole register pin
    asm_suffix: set[str] = field(default_factory=set)  # expands to `asm("r4")`
    volatile: set[str] = field(default_factory=set)    # macro or typedef for a volatile type
    zero: set[str] = field(default_factory=set)        # macro for a zero constant


def _splice(source: str) -> str:
    """Join backslash-continued lines, as the preprocessor does before lexing:
    a directive split over two lines is still `dcd` (mwcc compiles it)."""
    return re.sub(r"\\[ \t]*\r?\n", "", source)


def _blank_preprocessor(clean: str) -> str:
    """Blank preprocessor lines (macros included) so they are not scanned as code."""
    out = []
    continuing = False
    for line in clean.split("\n"):
        directive = continuing or line.lstrip().startswith("#")
        continuing = directive and line.rstrip().endswith("\\")
        out.append(" " * len(line) if directive else line)
    return "\n".join(out)


def _macro_definitions(clean: str) -> list[tuple[str, str]]:
    """Return (name, body) for each `#define` in comment-stripped source."""
    found = []
    lines = clean.split("\n")
    i = 0
    while i < len(lines):
        line = lines[i]
        while line.rstrip().endswith("\\") and i + 1 < len(lines):
            i += 1
            line = line.rstrip()[:-1] + " " + lines[i]
        m = _DEFINE_RE.match(line)
        if m:
            found.append((m.group(1), m.group(3).strip()))
        i += 1
    return found


def collect_aliases(sources: list[str]) -> Aliases:
    """Collect the macro and typedef names that hide a suspicious token.

    Runs to a fixed point, so an alias of an alias (`#define W2 W`) counts.
    """
    macros: list[tuple[str, str]] = []
    typedefs: list[str] = []
    for source in sources:
        clean = _strip_c_comments_and_literals(_splice(source))
        macros.extend(_macro_definitions(clean))
        for m in _TYPEDEF_RE.finditer(_blank_preprocessor(clean)):
            typedefs.append(m.group(1))
    aliases = Aliases()
    for _ in range(4):
        before = sum(len(getattr(aliases, f)) for f in aliases.__dataclass_fields__)
        for name, body in macros:
            if _DIRECTIVE_BODY_RE.search(body) or _uses(body, aliases.directive):
                aliases.directive.add(name)
            if _SECTION_OVERRIDE_RE.search(body) or _uses(body, aliases.section):
                aliases.section.add(name)
            if _REGISTER_PIN_RE.search(body) or (
                    re.search(r"\bregister\b", body) and _uses(body, aliases.asm_suffix)):
                aliases.pin.add(name)
            elif _ASM_SUFFIX_RE.match(body) or _uses(body, aliases.asm_suffix):
                aliases.asm_suffix.add(name)
            if body and _VOLATILE_BODY_RE.match(body) or (
                    body and re.fullmatch(r"[\w\s]+", body) and _uses(body, aliases.volatile)):
                aliases.volatile.add(name)
            if _ZERO_BODY_RE.match(body) or (
                    body and re.fullmatch(r"\(*\s*[A-Za-z_]\w*\s*\)*", body)
                    and _uses(body, aliases.zero)):
                aliases.zero.add(name)
        for decl in typedefs:
            for declarator in decl.split(","):
                if "*" in declarator or "[" in declarator or "(" in declarator:
                    continue
                words = _IDENT_RE.findall(declarator)
                if len(words) >= 2 and (
                        "volatile" in words[:-1] or any(w in aliases.volatile for w in words[:-1])):
                    aliases.volatile.add(words[-1])
        if sum(len(getattr(aliases, f)) for f in aliases.__dataclass_fields__) == before:
            break
    aliases.zero.discard("")
    return aliases


def _uses(body: str, names: set[str]) -> bool:
    return bool(names) and any(w in names for w in _IDENT_RE.findall(body))


def _name_regex(names: set[str]) -> re.Pattern[str] | None:
    if not names:
        return None
    return re.compile(r"(?<![\w.>])(?:" + "|".join(map(re.escape, sorted(names))) + r")\b")


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
    return re.sub(r"\s+", " ", lines[line - 1]).strip()[:100] if 0 < line <= len(lines) else ""


def _volatile_declaration(chunk: str, aliases: Aliases) -> bool:
    """True when `chunk` (a declaration up to its terminator) declares a
    volatile object: `volatile T x`, `T volatile x`, `T * volatile p`."""
    tokens = re.findall(r"[A-Za-z_]\w*|\*", chunk)
    if tokens and tokens[0] in ("extern", "typedef"):
        return False
    idents = [i for i, t in enumerate(tokens) if t != "*"]
    if len(idents) < 2:
        return False
    name = idents[-1]
    for i in idents[:-1]:
        if tokens[i] == "volatile" or tokens[i] in aliases.volatile:
            if "*" not in tokens[i:name]:
                return True
    return False


def scan_source(rel: str, source: str, aliases: Aliases | None = None) -> list[Finding]:
    """Return every lexical fake-match finding in one source file.

    `aliases` are the tree-wide macro and typedef names (`collect_aliases`);
    without them only this file's own definitions are known.
    """
    source = _splice(source)
    clean = _strip_c_comments_and_literals(source)
    code = _blank_preprocessor(clean)
    if aliases is None:
        aliases = collect_aliases([source])
    findings: list[Finding] = []

    def add(rule: str, offset: int) -> None:
        line = _line_of(clean, offset)
        findings.append(Finding(rule, rel, line, _snippet(source, line)))

    for m in _DIRECTIVE_RE.finditer(code):
        add("raw-data-directive", m.end() - 1)
    if (rx := _name_regex(aliases.directive)):
        for m in rx.finditer(code):
            add("raw-data-directive", m.start())
    for m in _SECTION_OVERRIDE_RE.finditer(code):
        add("section-override", m.start())
    if (rx := _name_regex(aliases.section)):
        for m in rx.finditer(code):
            add("section-override", m.start())
    for m in _REGISTER_PIN_RE.finditer(code):
        add("register-pin", m.start())
    if (rx := _name_regex(aliases.pin)):
        for m in rx.finditer(code):
            add("register-pin", m.start())
    if aliases.asm_suffix:
        names = "|".join(map(re.escape, sorted(aliases.asm_suffix)))
        for m in re.finditer(r"\bregister\b[^;(){}]*\b(?:" + names + r")\b", code):
            add("register-pin", m.start())

    bodies = _function_body_spans(code)

    def in_body(offset: int) -> bool:
        return any(a < offset < b for a, b in bodies)

    zero = _ZERO_LITERAL + "".join("|" + re.escape(n) for n in sorted(aliases.zero))
    for m in re.finditer(r"[};]\s*(while\s*\(\s*(?:" + zero + r")\s*\)\s*;)", code):
        if in_body(m.start()):
            add("do-while-zero", m.start(1))
    for m in re.finditer(r"(?:^|[;{}])([^;={}\[\](),]*)(?=[;=,\[])", code):
        offset = m.start(1) + len(m.group(1)) - len(m.group(1).lstrip())
        if in_body(offset) and _volatile_declaration(m.group(1), aliases) \
                and not _in_aggregate(code, offset, bodies):
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


def _read(path: Path) -> str:
    return path.read_text(encoding="utf-8", errors="replace")


def tree_aliases(root: Path) -> Aliases:
    """Collect macro and typedef aliases from every header and source in the tree."""
    sources = []
    for top in MACRO_DIRS:
        base = root / top
        if base.is_dir():
            sources += [_read(p) for p in sorted(base.rglob("*"))
                        if p.suffix in MACRO_SUFFIXES and p.is_file()]
    return collect_aliases(sources)


def scan_tree(root: Path) -> list[Finding]:
    aliases = tree_aliases(root)
    findings: list[Finding] = []
    for top in SOURCE_DIRS:
        base = root / top
        if not base.is_dir():
            continue
        for path in sorted(p for p in base.rglob("*") if p.suffix in SUFFIXES and p.is_file()):
            rel = path.relative_to(root).as_posix()
            findings.extend(scan_source(rel, _read(path), aliases))
    for source, _where in sorted(text_units(root).items()):
        path = root / source
        if path.is_file() and not defines_function(_read(path)):
            findings.append(Finding("text-unit-without-function", source, 1,
                                    "delinks.txt gives this unit .text; it defines no function"))
    return findings


# --- the object check ------------------------------------------------------

SHF_EXECINSTR = 0x4


class ObjectError(ValueError):
    pass


def _ror(value: int, amount: int) -> int:
    amount %= 32
    return ((value >> amount) | (value << (32 - amount))) & 0xFFFFFFFF


def data_words_in_code(path: Path) -> list[tuple[str, int]]:
    """Return (section, offset) of every raw data word in a code section.

    A `$d` mapping symbol marks data in a code section. A word there is
    honest when a pc-relative `ldr` or `add` in the same section loads it (a
    literal pool) or a relocation covers it (a pointer the linker fills in).
    Anything else is a word somebody wrote into `.text`.
    """
    buf = path.read_bytes()
    if buf[:4] != b"\x7fELF" or buf[4] != 1 or buf[5] != 1:
        raise ObjectError(f"{path}: not a 32-bit little-endian ELF")
    try:
        shoff, = struct.unpack_from("<I", buf, 0x20)
        shentsize, shnum, shstrndx = struct.unpack_from("<HHH", buf, 0x2E)
        sections = [struct.unpack_from("<IIIIIIIIII", buf, shoff + i * shentsize)
                    for i in range(shnum)]
    except struct.error as exc:
        raise ObjectError(f"{path}: truncated ELF ({exc})") from exc

    def cstr(table: bytes, offset: int) -> str:
        end = table.find(b"\0", offset)
        return table[offset:end if end >= 0 else None].decode("utf-8", "replace")

    def strtab(index: int) -> bytes:
        s = sections[index]
        return buf[s[4]:s[4] + s[5]]

    shstr = strtab(shstrndx)
    marks: dict[int, list[tuple[int, str]]] = {}
    for s in sections:
        if s[1] != 2:  # SHT_SYMTAB
            continue
        table = strtab(s[6])
        for off in range(s[4], s[4] + s[5], 16):
            st_name, st_value, _size, _info, _other, st_shndx = struct.unpack_from("<IIIBBH", buf, off)
            name = cstr(table, st_name)
            if name in ("$a", "$t", "$d") and 0 < st_shndx < shnum \
                    and sections[st_shndx][8] & SHF_EXECINSTR:
                marks.setdefault(st_shndx, []).append((st_value, name))
    relocated: dict[int, set[int]] = {}
    for s in sections:
        if s[1] in (4, 9) and 0 < s[7] < shnum:  # SHT_RELA, SHT_REL
            size = 12 if s[1] == 4 else 8
            relocated.setdefault(s[7], set()).update(
                struct.unpack_from("<I", buf, off)[0] for off in range(s[4], s[4] + s[5], size))

    bad: list[tuple[str, int]] = []
    for index, points in marks.items():
        section = sections[index]
        data = buf[section[4]:section[4] + section[5]]
        points.sort()
        spans = [(start, points[i + 1][0] if i + 1 < len(points) else len(data), kind)
                 for i, (start, kind) in enumerate(points)]
        loaded: set[int] = set()
        for start, end, kind in spans:
            if kind == "$a":
                for off in range(start, end - 3, 4):
                    word, = struct.unpack_from("<I", data, off)
                    if word & 0x0F5F0000 == 0x051F0000:            # ldr rd, [pc, #+-imm12]
                        imm = word & 0xFFF
                        loaded.add(off + 8 + (imm if word & 0x00800000 else -imm))
                    elif word & 0x0FEF0000 in (0x028F0000, 0x024F0000):  # add/sub rd, pc, #imm
                        imm = _ror(word & 0xFF, ((word >> 8) & 0xF) * 2)
                        loaded.add(off + 8 + (imm if word & 0x0FEF0000 == 0x028F0000 else -imm))
            elif kind == "$t":
                for off in range(start, end - 1, 2):
                    half, = struct.unpack_from("<H", data, off)
                    if half >> 11 in (0x09, 0x14):                  # ldr rd, [pc, #imm8*4] / add rd, pc, #
                        loaded.add(((off + 4) & ~3) + (half & 0xFF) * 4)
        section_name = cstr(shstr, section[0])
        for start, end, kind in spans:
            if kind != "$d":
                continue
            for off in range(start, end, 4):
                if off not in loaded and off not in relocated.get(index, ()):
                    bad.append((section_name, off))
    return bad


def scan_objects(root: Path, regions: tuple[str, ...]) -> tuple[list[Finding], list[str]]:
    """Run the object check over every built C/C++ unit of each region."""
    findings: list[Finding] = []
    problems: list[str] = []
    for region in regions:
        if not (root / "build" / region / "delinks").is_dir():
            problems.append(f"[{region}] no build/{region}: build the region first")
            continue
        for unit in built_units(root, region):
            if not unit.endswith(SUFFIXES):
                continue
            obj = root / "build" / region / Path(unit).with_suffix(".o")
            if not obj.is_file():
                problems.append(f"[{region}] {unit}: missing {obj.relative_to(root).as_posix()}")
                continue
            try:
                for section, off in data_words_in_code(obj):
                    findings.append(Finding("data-in-text", unit, 0,
                                            f"{region} {section}+0x{off:x}"))
            except ObjectError as exc:
                problems.append(f"[{region}] {unit}: unreadable object ({exc})")
    return findings, problems


# --- the baseline ----------------------------------------------------------

def entries_of(findings: list[Finding]) -> set[tuple[str, ...]]:
    """One baseline entry per finding: rule, path, ordinal among equal lines, text."""
    seen: Counter = Counter()
    entries = set()
    for f in sorted(findings, key=lambda f: (f.path, f.line, f.rule, f.text)):
        key = (f.rule, f.path, f.text)
        seen[key] += 1
        entries.add((f.rule, f.path, str(seen[key]), f.text))
    return entries


def compare(found: set[tuple[str, ...]], baseline: set[tuple[str, ...]],
            rules: set[str]) -> tuple[list[tuple[str, ...]], list[tuple[str, ...]]]:
    """Return (new, stale), looking only at the rules this run could observe."""
    new = sorted(e for e in found - baseline if e[0] in rules)
    stale = sorted(e for e in baseline - found if e[0] in rules)
    return new, stale


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--root", type=Path, default=ROOT, help="tree to lint (default: this repo)")
    ap.add_argument("--baseline", type=Path, help="baseline file (default: <root>/" + BASELINE.as_posix() + ")")
    ap.add_argument("--version", action="append", choices=REGIONS,
                    help="also check the built objects of this region (repeatable)")
    ap.add_argument("--list", action="store_true", help="print every finding")
    ap.add_argument("--write-baseline", action="store_true",
                    help="record today's findings as the tolerated baseline (first fill only; "
                         "CI fails a baseline that gains lines)")
    ap.add_argument("--prune-baseline", action="store_true",
                    help="delete baseline lines that are no longer found; adds nothing")
    args = ap.parse_args(argv)

    root = args.root.resolve()
    if not any((root / d).is_dir() for d in SOURCE_DIRS):
        print(f"check_fake_matches: no src/ or libs/ under {root}", file=sys.stderr)
        return 2
    baseline_path = args.baseline or root / BASELINE
    regions = tuple(dict.fromkeys(args.version or ()))
    findings = scan_tree(root)
    if regions:
        object_findings, problems = scan_objects(root, regions)
        for p in problems:
            print(f"  INPUT: {p}")
        if problems:
            print("check_fake_matches: INPUT ERROR - no verdict")
            return 2
        findings += object_findings
    rules = set(RULES) if regions else set(RULES) - {"data-in-text"}
    found = entries_of(findings)

    if args.list:
        for f in findings:
            print(f"{f.path}:{f.line}: {f.rule}: {f.text}")
    if args.write_baseline:
        try:
            kept = {e for e in baseline_file.load(baseline_path) if e[0] not in rules}
        except baseline_file.BaselineError:
            kept = set()  # a format-1 file is being replaced
        written = {e for e in found if e[0] in rules} | kept
        baseline_file.write(baseline_path, HEADER, written)
        print(f"check_fake_matches: wrote {len(written)} baseline entries to {baseline_path}")
        return 0

    try:
        baseline = baseline_file.load(baseline_path)
    except baseline_file.BaselineError as exc:
        print(f"check_fake_matches: {exc}", file=sys.stderr)
        return 2
    new, stale = compare(found, baseline, rules)
    if args.prune_baseline:
        baseline_file.write(baseline_path, HEADER, baseline - set(stale))
        print(f"check_fake_matches: pruned {len(stale)} stale baseline entries")
        return 1 if new else 0
    per_rule = Counter(f.rule for f in findings)
    print("check_fake_matches: " + ", ".join(f"{r} {per_rule.get(r, 0)}" for r in RULES if r in rules)
          + f" (baseline entries {len(baseline)})")
    for e in new:
        print(f"  NEW: {e[0]} {e[1]}: {e[3]}")
    for e in stale:
        print(f"  STALE: {e[0]} {e[1]}: {e[3]} - delete the line, or run --prune-baseline")
    if new or stale:
        print("check_fake_matches: FAIL")
        return 1
    print("check_fake_matches: OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
