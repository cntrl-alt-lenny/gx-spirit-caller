#!/usr/bin/env python3
"""verify_composed_group.py — cm-restock-carve-12: automate the standalone-
compile-then-inspect check `alignment-wall-tu-composition-recipe.md`'s
standing rule requires before any n>=3 composed TU is trusted.

Why this exists
================
`cm-restock-carve-9` through `-11` proved TU composition (multiple top-level
globals sharing one delinks.txt TU) can beat the 4-byte alignment cascade,
under two preconditions:

  1. The composed span must be 4-aligned at both ends.
  2. Every member's compiled byte content must land, in FILE ORDER, exactly
     where the recipe expects — n=2 same-size pairs are the only shape
     proven safe by default; **every n>=3 group must be compiled and its
     `.o` inspected before being trusted, no exceptions** (wave 4: three
     separate n=4 struct groups, three different modules, all silently
     reordered despite a correct section *size*).

`cm-restock-carve-11` found a THIRD wrinkle specific to this pool's shape:
a `char[N]` global initialized from a string literal compiles to its OWN
separate `.data` section per declaration -- never one merged section with
internal symbol offsets like the struct-typed examples the recipe was
first proven on. That wave's full tranche (23 same-size + 8 differing-size
"ascending, therefore believed safe") failed EUR's SHA1 with a
93-million-byte divergence, bisected to exactly the differing-size
windows. The one thing a compile-only inspection CANNOT observe is
link-time section-merge behaviour (both the working and broken cases
compile to structurally identical-looking objects -- same section count,
same per-section sizes, same file order); only a real link+SHA1 test can
prove that. So the safety criterion this tool enforces is the same-size
requirement wave 11 actually proved (not the differing-size "ascending is
safe" claim it *disproved*), and the compile-and-inspect step verifies the
part that IS observable without linking: does the generated source, once
compiled, actually produce the right bytes in the right file order?

What this tool checks, per candidate group
===========================================
1. **All members the same size.** The only n=2 shape wave 11 proved safe;
   extending it to n>=3 is this wave's own hypothesis, not yet re-proven,
   so a group failing this check is REJECTed regardless of what its `.o`
   looks like -- no amount of correct compiled output makes an unproven
   link-time behaviour trustworthy. (Differing sizes are covered by this
   same check: it also catches the wall wave 11 already confirmed
   permanent, so nothing here relaxes that finding.)
2. **Compiles cleanly, standalone, no link needed** -- via
   `asm_escape.compile_c`, the SAME mwcc invocation the real build uses
   (never a hand-copied flag set).
3. **Section count == member count.** One `.data` section per declaration
   (cm-restock-carve-11's finding); a mismatch means the source didn't
   compile the way this recipe assumes.
4. **Section content, in FILE ORDER, exactly matches each member's own
   expected byte content, in the SAME (address-ascending) order.** This is
   the direct descendant of the alignment-wall recipe's original
   "in-section offset" check (wave 3), adapted to `char[N]`'s
   one-section-per-declaration shape: instead of checking symbol offsets
   inside one merged section, this checks raw section BYTES against known-
   good content, which is strictly stronger evidence (it catches content
   bugs the offset-only check couldn't) and equally catches a source-order
   reshuffle if mwcc ever does one for this type (wave 4's failure mode).

A PASS here is necessary, not sufficient, for shipping: it proves the
compiled *object* is correct, not that the *linked ROM* will be — that is
what the canary gate (a real `ninja sha1`) is for. Every verified group
still needs the standing canary-then-tranche discipline this project
already uses for composed TUs, gating the first one alone before batching
the rest (see `docs/research/data/cm-restock-carve-12-*.md`).

PURE vs IMPURE
==============
`escape_c_string`, `render_composed_c`, `parse_data_sections`, and
`classify_group` take no build, no subprocess, no filesystem -- unit
tested with fixtures in `tests/test_verify_composed_group.py`. Only
`compile_and_inspect` (and `verify_group`, which calls it) touches disk or
spawns `mwccarm`/`objdump`.

Usage
=====
    python tools/verify_composed_group.py --candidates groups.json \
        --out results.json [--version eur]

`groups.json`: a list of windows, each `{"members": [{"name", "addr",
"size", "bytes_hex"}, ...]}` in address-ascending order (the same shape
`cm-restock-carve-10`/`-11`'s own candidate-generation scripts already
produce). `results.json`: the same list, each window annotated with
`"verdict"` (`"pass"`/`"reject"`) and `"reason"`.
"""
from __future__ import annotations

import argparse
import json
import re
import sys
import tempfile
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))

from asm_escape import _OBJDUMP, _run, compile_c  # noqa: E402


# --------------------------------------------------------------------------- #
# Data model
# --------------------------------------------------------------------------- #

@dataclass(frozen=True)
class Member:
    name: str
    addr: int
    size: int
    content: bytes  # full byte content, including any trailing zero padding


@dataclass(frozen=True)
class VerifyResult:
    verdict: str   # "pass" | "reject"
    reason: str


def members_from_json(raw: list[dict]) -> list[Member]:
    return [
        Member(name=m["name"], addr=m["addr"], size=m["size"],
              content=bytes.fromhex(m["bytes_hex"]))
        for m in raw
    ]


# --------------------------------------------------------------------------- #
# PURE — source generation
# --------------------------------------------------------------------------- #

def escape_c_string(content: bytes) -> str:
    """Escape raw bytes (already truncated at the first NUL by the caller)
    into a C string-literal body. Matches `cm-restock-carve-10`/`-11`'s own
    escaping -- kept identical so a candidate's rendered literal never
    differs between the census scripts and this verifier."""
    out = []
    for byte in content:
        ch = chr(byte)
        if ch == "\\":
            out.append("\\\\")
        elif ch == '"':
            out.append('\\"')
        elif ch == "\n":
            out.append("\\n")
        elif ch == "\t":
            out.append("\\t")
        else:
            out.append(ch)
    return "".join(out)


def render_composed_c(members: list[Member]) -> str:
    """One `char name[N] = "...";` declaration per member, in the given
    (address-ascending) order -- Pattern per
    `alignment-wall-tu-composition-recipe.md`. Content is truncated at the
    first NUL for the literal; the compiler zero-pads the rest, exactly
    matching every prior wave's convention (verified byte-for-byte by the
    section-content check this tool performs after compiling)."""
    lines = []
    for m in members:
        first_null = m.content.index(0) if 0 in m.content else len(m.content)
        literal = escape_c_string(m.content[:first_null])
        lines.append(f'char {m.name}[{m.size}] = "{literal}";')
    return "\n".join(lines) + "\n"


# --------------------------------------------------------------------------- #
# PURE — objdump output parsing
# --------------------------------------------------------------------------- #

# A hex-dump line always starts with a 4-hex-digit offset. The boundary
# between the hex-group column and the ASCII-repr column is always 2+
# spaces (GNU objdump convention); single spaces only ever separate hex
# groups from each other and the offset. This holds even when the ASCII
# repr itself contains literal spaces (a real risk for natural-language
# string content) -- verified directly against compiled output containing
# "hello world" and "foo   bar baz" before trusting this parser.
_HEXDUMP_LINE_RE = re.compile(r"^ [0-9a-f]{4}\s")


def parse_data_sections(objdump_s_output: str) -> list[bytes]:
    """Parse `objdump -s -j .data <obj>` output into a list of raw byte
    strings, one per `Contents of section .data:` block, in FILE ORDER.

    For a TU compiled from top-level `char[]` globals, each declaration
    gets its OWN `.data` section (cm-restock-carve-11's finding) -- so the
    Nth block here is the Nth section physically emitted, which (absent a
    reordering bug) is the Nth declaration in the source."""
    sections: list[bytes] = []
    blocks = objdump_s_output.split("Contents of section .data:")[1:]
    for block in blocks:
        raw = bytearray()
        for line in block.splitlines():
            if not _HEXDUMP_LINE_RE.match(line):
                continue
            hex_part = re.split(r"\s{2,}", line.strip(), maxsplit=1)[0]
            tokens = hex_part.split(" ")
            for group in tokens[1:]:  # tokens[0] is the offset
                raw += bytes.fromhex(group)
        sections.append(bytes(raw))
    return sections


# --------------------------------------------------------------------------- #
# PURE — classification
# --------------------------------------------------------------------------- #

def classify_group(members: list[Member], compiled_sections: list[bytes] | None,
                   compile_ok: bool) -> VerifyResult:
    """The full pass/reject decision, given the group's declared members
    and (if compilation succeeded) the parsed `.data` sections from its
    standalone-compiled `.o`. Isolated from the compile/objdump I/O so it
    can be unit-tested against synthetic section lists."""
    sizes = {m.size for m in members}
    if len(sizes) != 1:
        lo = min(m.size for m in members)
        hi = max(m.size for m in members)
        return VerifyResult(
            "reject",
            f"mixed sizes ({lo}-{hi} B) -- cm-restock-carve-11 proved the "
            f"'ascending size is safe' exception does NOT hold for char[N] "
            f"string arrays (93 MB EUR divergence); only same-size groups "
            f"are proven safe, extended here from n=2 to n>={len(members)} "
            f"pending this tool's own compiled-content check, not assumed",
        )
    if not compile_ok or compiled_sections is None:
        return VerifyResult("reject", "standalone compile failed")
    if len(compiled_sections) != len(members):
        return VerifyResult(
            "reject",
            f"expected {len(members)} .data sections (one per declaration, "
            f"per cm-restock-carve-11), got {len(compiled_sections)} -- "
            f"the compiled shape doesn't match this recipe's assumption",
        )
    for i, (m, sec) in enumerate(zip(members, compiled_sections, strict=True)):
        if sec != m.content:
            return VerifyResult(
                "reject",
                f"section {i} ({m.name}) content mismatch: expected "
                f"{len(m.content)} B, compiled section is {len(sec)} B "
                f"-- {'size differs' if len(sec) != len(m.content) else 'bytes differ'}",
            )
    return VerifyResult("pass", f"same-size ({sizes.pop()} B), {len(members)} sections, "
                                f"content + order verified against the standalone .o")


# --------------------------------------------------------------------------- #
# IMPURE — compile + inspect
# --------------------------------------------------------------------------- #

def compile_and_inspect(
    members: list[Member], version: str = "eur",
) -> tuple[bool, list[bytes] | None]:
    """Write the composed TU to a scratch file, compile it standalone (no
    link), and parse its `.data` sections. Returns (compile_ok, sections);
    sections is None when the compile itself failed."""
    c_text = render_composed_c(members)
    with tempfile.TemporaryDirectory(prefix="verify_composed_group_") as tmp:
        tmp_dir = Path(tmp)
        # compile_c() writes into ROOT-relative src/ trees via -c <abspath>
        # -o <dir>; the source file's own location doesn't matter to mwcc
        # (no #include-relative lookups in these files), so a scratch dir
        # outside src/ keeps this tool from ever touching real source.
        c_path = tmp_dir / f"{members[0].name}.c"
        c_path.write_text(c_text, encoding="utf-8")
        o_path = tmp_dir / f"{members[0].name}.o"
        ok = compile_c(str(c_path), version, str(o_path))
        if not ok:
            return False, None
        result = _run([_OBJDUMP, "-s", "-j", ".data", str(o_path)])
        return True, parse_data_sections(result.stdout)


def verify_group(members: list[Member], version: str = "eur") -> VerifyResult:
    """The full check for one candidate group. Short-circuits the
    (expensive) compile step when the cheap same-size check already
    rejects -- most of the 576-group pool is expected to fail exactly
    this check, per cm-restock-carve-11's own disposition table."""
    sizes = {m.size for m in members}
    if len(sizes) != 1:
        return classify_group(members, None, compile_ok=False)
    ok, sections = compile_and_inspect(members, version=version)
    return classify_group(members, sections, compile_ok=ok)


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(
        description="Compile-and-inspect verification for n>=2 composed "
                    "data TUs (cm-restock-carve-12).",
    )
    ap.add_argument("--candidates", type=Path, required=True,
                    help="JSON file: list of {members: [{name, addr, size, "
                         "bytes_hex}, ...]} windows, address-ascending.")
    ap.add_argument("--out", type=Path, default=None,
                    help="Write annotated results JSON here.")
    ap.add_argument("--version", default="eur")
    ap.add_argument("--limit", type=int, default=None,
                    help="Only verify the first N groups (smoke-testing).")
    args = ap.parse_args(argv)

    windows = json.loads(args.candidates.read_text(encoding="utf-8"))
    if args.limit is not None:
        windows = windows[:args.limit]

    passed = 0
    rejected: dict[str, int] = {}
    results = []
    for i, w in enumerate(windows):
        members = members_from_json(w["members"])
        result = verify_group(members, version=args.version)
        results.append({**w, "verdict": result.verdict, "reason": result.reason})
        if result.verdict == "pass":
            passed += 1
        else:
            key = result.reason.split(" -- ")[0].split(" (")[0]
            rejected[key] = rejected.get(key, 0) + 1
        print(f"  [{i + 1}/{len(windows)}] {w['members'][0]['name']} "
              f"({len(w['members'])} members): {result.verdict} -- {result.reason}",
              file=sys.stderr)

    print(f"\nVERIFIED: {passed}/{len(windows)} groups pass "
          f"({sum(len(w['members']) for w in windows if True)} candidate symbols total)")
    passed_symbols = sum(len(r["members"]) for r in results if r["verdict"] == "pass")
    passed_bytes = sum(m["size"] for r in results if r["verdict"] == "pass" for m in r["members"])
    print(f"  pass: {passed} groups / {passed_symbols} symbols / {passed_bytes:,} B")
    for reason, count in sorted(rejected.items(), key=lambda kv: -kv[1]):
        print(f"  reject[{reason}]: {count}")

    if args.out is not None:
        args.out.write_text(json.dumps(results, indent=1), encoding="utf-8")
        print(f"\nwrote {args.out}")

    return 0


if __name__ == "__main__":
    sys.exit(main())
