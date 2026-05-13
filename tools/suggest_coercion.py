#!/usr/bin/env python3

"""
suggest_coercion.py — rule engine over objdiff JSON output.

Given an unmatched function's `objdiff-cli diff` JSON, surfaces
candidate codegen-walls.md entries with their recipes. Replaces a
chunk of the manual "stare at diff → look up wall in codegen-walls
→ pick coercion" iteration loop with a one-line tool invocation.

Per brief 062: targets the 5-7 most-frequent walls (C-15 / C-20 /
S-1 / P-1 / C-1 / C-1r). Each rule has a primary diff signature
(must match) and corroborating signals (boost / dampen confidence).
HIGH = primary + ≥2 corroborating. MEDIUM = primary + 1
corroborating. LOW = primary only.

The rules library is extensible by design — adding a new wall is
one entry in `RULES` plus one new docstring section. The tool
prints anchor links into `docs/research/codegen-walls.md` rather
than restating the recipes, so the doc stays the single source of
truth.

Usage:

    # Read pre-generated objdiff JSON
    python tools/suggest_coercion.py --json <path>

    # Read from stdin
    objdiff-cli diff -1 a.o -2 b.o func --format json | \\
        python tools/suggest_coercion.py --json -

    # Auto-locate .o files for a symbol and run objdiff-cli
    # (requires `objdiff-cli` on PATH or `./objdiff-cli` present)
    python tools/suggest_coercion.py func_02123456

    # Machine-readable output for piping
    python tools/suggest_coercion.py --json <path> --format json

Output format mirrors the brief's spec: ranked HIGH/MEDIUM/LOW
candidates with diff-signature, recipe one-liner, and anchor.

Non-scope (per brief 062):
  - Auto-applying the coercion. Tool only *suggests*; decomper
    writes the C and verifies via objdiff.
  - Replacing codegen-walls.md as the reference doc. The tool
    prints anchors; the doc owns the recipes.
"""

from __future__ import annotations

import argparse
import json
import re
import subprocess
import sys
from collections import Counter
from collections.abc import Callable
from dataclasses import dataclass
from pathlib import Path


# --------------------------------------------------------------------------- #
# Intermediate representation
# --------------------------------------------------------------------------- #


@dataclass(frozen=True)
class Argument:
    """A single instruction operand from objdiff JSON."""
    # Exactly one of these is set per argument node.
    register: str | None = None     # "r0", "ip", "lr", "lsl" (shift op)
    signed: int | None = None       # immediate, signed
    unsigned: int | None = None     # immediate, unsigned
    label: str | None = None        # branch target / pool-load symbol

    @property
    def imm(self) -> int | None:
        """Convenience: the integer value if this arg is any immediate."""
        if self.signed is not None:
            return self.signed
        if self.unsigned is not None:
            return self.unsigned
        return None


@dataclass(frozen=True)
class Insn:
    """One ARM/Thumb instruction, parsed from objdiff JSON."""
    address: int                   # byte offset from function start
    mnemonic: str                  # "ldr", "mov", "sub", "bx", "bl", …
    formatted: str                 # full pretty line, e.g. "mvn r1, #0"
    arguments: tuple[Argument, ...]

    # Convenience predicates -------------------------------------------------

    def is_branch(self) -> bool:
        # Predicated branches: bxXX, bXX, blXX. Bare bx/bl too.
        return self.mnemonic.startswith(("b", "bl", "bx"))

    def is_predicated(self) -> bool:
        """True if the mnemonic carries a condition-code suffix
        (eq/ne/cs/cc/mi/pl/vs/vc/hi/ls/ge/lt/gt/le, or hs/lo aliases).
        Bare `bl` is not predicated; `bleq` / `ldreq` / `moveq` are."""
        return _MNEM_COND_RE.match(self.mnemonic) is not None

    def regs(self) -> list[str]:
        """All register operands, in source order."""
        return [a.register for a in self.arguments if a.register]

    def imms(self) -> list[int]:
        """All immediate operands, in source order."""
        return [a.imm for a in self.arguments if a.imm is not None]


# Condition-code suffix detector. Anchored to require ≥3 leading
# chars so we don't false-match short mnemonics like "b" itself.
_COND_SUFFIXES = ("eq", "ne", "cs", "cc", "mi", "pl", "vs", "vc",
                  "hi", "ls", "ge", "lt", "gt", "le", "hs", "lo")
_MNEM_COND_RE = re.compile(
    r"^(?:[a-z]{2,})(" + "|".join(_COND_SUFFIXES) + r")$"
)


# --------------------------------------------------------------------------- #
# objdiff JSON parsing
# --------------------------------------------------------------------------- #


def _parse_argument(node: dict) -> Argument | None:
    """Parse one argument-list element. Returns None for the
    plain-text separators (`", "`, `"["`, `"#"`) — those are
    formatting noise, not operands."""
    if "plain_text" in node:
        return None
    a = node.get("argument", {})
    if "opaque" in a:
        return Argument(register=a["opaque"])
    if "signed" in a:
        try:
            return Argument(signed=int(a["signed"]))
        except (ValueError, TypeError):
            return None
    if "unsigned" in a:
        try:
            return Argument(unsigned=int(a["unsigned"]))
        except (ValueError, TypeError):
            return None
    # Label/branch-target shape — objdiff exposes it as a
    # symbol-reference; field name varies, so probe a couple.
    for key in ("symbol", "label", "named"):
        if key in a:
            v = a[key]
            return Argument(label=str(v) if not isinstance(v, dict)
                            else str(v.get("name", v)))
    return None


def _parse_instruction(node: dict) -> Insn:
    """Parse one `instructions[i]` element."""
    insn = node.get("instruction", {})
    addr_str = insn.get("address", "0")
    try:
        address = int(addr_str)
    except (ValueError, TypeError):
        address = 0
    mnemonic = insn.get("mnemonic", "")
    formatted = insn.get("formatted", "")
    args_raw = insn.get("arguments", [])
    args: list[Argument] = []
    for a in args_raw:
        parsed = _parse_argument(a)
        if parsed is not None:
            args.append(parsed)
    return Insn(
        address=address,
        mnemonic=mnemonic,
        formatted=formatted,
        arguments=tuple(args),
    )


def parse_objdiff_json(data: dict) -> tuple[list[Insn], list[Insn], float]:
    """Top-level entry point: parse a full objdiff-cli diff JSON
    document into (left_insns, right_insns, match_percent).

    Convention follows objdiff:
      - `left`  = target  (the reference; what we're trying to match)
      - `right` = base    (mwcc's emission; what we have)

    `match_percent` is the section-level percentage from the JSON.
    Returns 0.0 if not present (e.g. empty diff).
    """
    left = _instructions_for_side(data.get("left", {}))
    right = _instructions_for_side(data.get("right", {}))
    match_pct = _first_match_percent(data.get("left", {}))
    return left, right, match_pct


def _instructions_for_side(side: dict) -> list[Insn]:
    """Walk a `left` or `right` document and flatten all
    instructions across all sections / symbols."""
    out: list[Insn] = []
    for sec in side.get("sections", []):
        for sym in sec.get("symbols", []):
            for n in sym.get("instructions", []):
                out.append(_parse_instruction(n))
    return out


def _first_match_percent(side: dict) -> float:
    """Return the first `match_percent` found, walking through
    sections then symbols."""
    for sec in side.get("sections", []):
        if "match_percent" in sec:
            return float(sec["match_percent"])
        for sym in sec.get("symbols", []):
            if "match_percent" in sym:
                return float(sym["match_percent"])
    return 0.0


# --------------------------------------------------------------------------- #
# Rule infrastructure
# --------------------------------------------------------------------------- #


# Confidence rank (higher = more confident). Used to order results.
_CONFIDENCE_RANK = {"HIGH": 3, "MEDIUM": 2, "LOW": 1}


@dataclass(frozen=True)
class RuleHit:
    """One rule firing on the diff. The tool collects hits across
    all rules and ranks by confidence."""
    wall_id: str       # "C-15", "S-1", …
    title: str         # one-line wall title
    confidence: str    # "HIGH" / "MEDIUM" / "LOW"
    signature: str     # human-readable diff signature that fired
    recipe: str        # one-line action
    anchor: str        # docs/research/codegen-walls.md#…
    notes: str = ""    # extra context (corroborating signals, caveats)


@dataclass(frozen=True)
class Rule:
    wall_id: str
    title: str
    recipe: str
    anchor: str
    detect_fn: Callable[[list[Insn], list[Insn]], RuleHit | None]


def _anchor(wall_id: str) -> str:
    """Build the doc URL for a wall ID. Wall headings in
    codegen-walls.md follow `### <wall_id>. <title>`; the GFM
    anchor is the lowercased-and-hyphenated heading text. We
    hardcode the anchors here (rather than re-derive them) so
    a typo in the doc heading surfaces as a broken anchor link
    in the tool output, which is easy to spot at review time."""
    return _WALL_ANCHORS[wall_id]


_WALL_ANCHORS: dict[str, str] = {
    "C-1": "docs/research/codegen-walls.md#c-1-predicated-execution-"
           "pure-pred-exec-vs-early-return",
    "C-1r": "docs/research/codegen-walls.md#c-1r-reverse-direction-"
            "mwcc-over-predicates-if-or-or-return-const--return-const",
    "C-15": "docs/research/codegen-walls.md#c-15-mwcc-20-peephole-"
            "avoidance-via-legacy-tier-routing-for-flat-thunk-arg-setup",
    "C-16": "docs/research/codegen-walls.md#c-16-ldr-rn-vs-ldr-ip-"
            "flat-thunk-scratch-via-asm-void--nofralloc",
    "C-20": "docs/research/codegen-walls.md#c-20-pack-halfwords-into-arg-"
            "tail-call-via-legacy-tier-routing",
    "C-21": "docs/research/codegen-walls.md#c-21-ternary-to-constants-"
            "collapse--decompose-role-from-value",
    "P-1": "docs/research/codegen-walls.md#p-1-shift-pair-vs-mask-"
           "collapse",
    "P-6": "docs/research/codegen-walls.md#p-6-predication-threshold-"
           "4-op-if-body",
    "S-1": "docs/research/codegen-walls.md#s-1-padding-off-by-one--"
           "sub-word-_pad-lands-fields-at-wrong-offsets",
}


def _confidence_from(primary: bool, corroborating: int) -> str | None:
    """HIGH = primary + ≥2 corroborating. MEDIUM = primary + 1.
    LOW = primary only. None = no primary signature → no hit."""
    if not primary:
        return None
    if corroborating >= 2:
        return "HIGH"
    if corroborating == 1:
        return "MEDIUM"
    return "LOW"


# --------------------------------------------------------------------------- #
# Rule library — v0 (5 highest-frequency walls)
# --------------------------------------------------------------------------- #


def _detect_c15_mvn_vs_sub(
    left: list[Insn], right: list[Insn],
) -> RuleHit | None:
    """C-15 — mwcc 2.0 peephole emits `sub r1, r0, #1` where target
    uses `mvn r1, #0`. Primary signature: an instruction in `right`
    with mnemonic `sub` whose immediate is small (`#1`–`#4`) and
    pairs with a `mvn` at the same address in `left`.

    Corroborating signals:
      1. A preceding `mov rN, #0` (or other small constant) in right
         — the peephole's setup step.
      2. The function is a flat thunk (≤ ~8 insns) ending in `bx ip`
         or `b <symbol>` — C-15 is a flat-thunk-only wall.

    See codegen-walls.md C-15 for the full discriminator
    (especially: this is mwcc 2.0 only; 1.2/sp2p3 emits direct
    `mvn`, hence the `.legacy.c` routing fix). P-1 also looks
    like a 2→1 collapse but is permanent; this rule is narrower
    and won't false-fire on P-1 (which is `lsl/lsr` vs `and`, not
    `mvn` vs `sub`).
    """
    primary = False
    signature = ""
    for li, ri in _pair_by_address(left, right):
        if li is None or ri is None:
            continue
        if (li.mnemonic == "mvn"
                and ri.mnemonic == "sub"
                and ri.imms()
                and ri.imms()[0] in range(1, 8)):
            primary = True
            signature = (f"target `{li.formatted}` vs mwcc "
                         f"`{ri.formatted}` at +0x{li.address:x}")
            break

    if not primary:
        return None

    corroborating = 0
    # Setup-step: a `mov rN, #K` earlier in right.
    if any(i.mnemonic == "mov" and i.imms() and i.imms()[0] in range(0, 8)
           for i in right):
        corroborating += 1
    # Flat thunk: small function ending in tail-call.
    if (len(right) <= 8 and right
            and right[-1].mnemonic in ("bx", "b") + tuple(
                f"b{c}" for c in _COND_SUFFIXES)):
        corroborating += 1

    conf = _confidence_from(primary, corroborating)
    return RuleHit(
        wall_id="C-15",
        title="mwcc-2.0 peephole avoidance via legacy-tier routing",
        confidence=conf,
        signature=signature,
        recipe="Route via *.legacy.c (mwcc 1.2/sp2p3) or "
               "*.legacy_sp3.c (sp3) — direct `mvn` survives there",
        anchor=_anchor("C-15"),
        notes="Flat-thunk-only wall. Check the discriminator at top "
              "of C-15 entry — if this is a 2-insn → 1-insn collapse "
              "(lsl/lsr → and) instead of 1-insn → 1-insn (mvn → sub), "
              "see P-1 (permanent) instead.",
    )


def _detect_p1_shift_pair_vs_mask(
    left: list[Insn], right: list[Insn],
) -> RuleHit | None:
    """P-1 — target uses `lsl rN, rN, #K; lsr rN, rN, #K` and mwcc
    collapses to `and rN, rN, #mask`. Permanent across all SPs.

    Primary signature: an `and rN, rN, #imm` in `right` where the
    mask is a power-of-two-minus-one (`0xff`, `0xffff`, `0x3`, `0x1`)
    AND the matching position in `left` is `lsl` (followed by `lsr`
    of the same K).

    Corroborating signals:
      1. The K shift count corresponds to the mask
         (`lsl 24/lsr 24 → 0xff`, `lsl 16/lsr 16 → 0xffff`,
         `lsl 31/lsr 31 → 0x1`, `lsl 30/lsr 30 → 0x3`).
      2. Both sides have the same total insn count (the collapse
         compresses 2 → 1 in mwcc *only when* the surrounding code
         doesn't need the intermediate; usually the surrounding
         shape stays put).
    """
    primary = False
    signature = ""
    shift_k = -1
    mask = -1

    # Walk left looking for lsl/lsr K pairs at consecutive
    # addresses, then check the matching right position for `and`.
    for i in range(len(left) - 1):
        a, b = left[i], left[i + 1]
        if (a.mnemonic == "mov"
                and "lsl" in a.formatted
                and b.mnemonic == "mov"
                and "lsr" in b.formatted):
            # Extract K from a (lsl) and b (lsr).
            a_k = next((arg.imm for arg in a.arguments
                        if arg.imm is not None), None)
            b_k = next((arg.imm for arg in b.arguments
                        if arg.imm is not None), None)
            if a_k is not None and a_k == b_k:
                # Look for `and` at the same address as `a` in right.
                for ri in right:
                    if (ri.address == a.address
                            and ri.mnemonic == "and"
                            and ri.imms()):
                        primary = True
                        signature = (f"target `{a.formatted}; "
                                     f"{b.formatted}` (2 insns) vs "
                                     f"mwcc `{ri.formatted}` (1 insn)")
                        shift_k = a_k
                        mask = ri.imms()[0]
                        break
            if primary:
                break

    if not primary:
        return None

    corroborating = 0
    # Mask matches shift K?
    expected_mask = (1 << (32 - shift_k)) - 1 if shift_k > 0 else 0
    if expected_mask and mask == expected_mask:
        corroborating += 1
    # Insn count delta of exactly 1.
    if abs(len(left) - len(right)) == 1:
        corroborating += 1

    conf = _confidence_from(primary, corroborating)
    return RuleHit(
        wall_id="P-1",
        title="Shift-pair vs mask collapse",
        confidence=conf,
        signature=signature,
        recipe="PERMANENT — abandon this coercion. The lsl/lsr → and "
               "collapse fires on every mwcc SP. No C-source "
               "variation tested suppresses it.",
        anchor=_anchor("P-1"),
        notes="Don't confuse with C-15 (1-insn vs 1-insn peephole, "
              "routing-fixable). P-1 is 2-insn → 1-insn collapse and "
              "is permanent.",
    )


def _detect_s1_uniform_offset_shift(
    left: list[Insn], right: list[Insn],
) -> RuleHit | None:
    """S-1 — every `ldr`/`str` offset in `right` is exactly +K (typ.
    +4) larger than the matching offset in `left`. Indicates a
    `char _pad[]` size that rounds up to the wrong 4-byte boundary,
    OR a cross-function cascade from an upstream wrong-sized TU.

    Primary signature: ≥3 ldr/str instructions where the right-side
    offset is exactly K larger than the left-side offset, with K
    consistent across all instances.

    Corroborating signals:
      1. ≥5 affected ldr/str instructions (more confident if the
         shift is pervasive).
      2. The shift K is +4 (the typical sub-word _pad rounding).
    """
    pairs = []
    for li, ri in _pair_by_address(left, right):
        if li is None or ri is None:
            continue
        if li.mnemonic not in ("ldr", "str", "ldrh", "strh", "ldrb", "strb"):
            continue
        if ri.mnemonic != li.mnemonic:
            continue
        # Look for the last immediate in each (the offset).
        l_off = li.imms()[-1] if li.imms() else None
        r_off = ri.imms()[-1] if ri.imms() else None
        if l_off is None or r_off is None:
            continue
        if l_off == r_off:
            continue
        pairs.append((l_off, r_off))

    if len(pairs) < 3:
        return None

    deltas = [r - l for l, r in pairs]
    counts = Counter(deltas)
    most_common, n = counts.most_common(1)[0]
    if n < 3 or most_common == 0:
        return None

    # Primary: ≥3 instances of the same non-zero delta.
    primary = True
    signature = (f"uniform +{most_common} offset shift across "
                 f"{n} ldr/str instructions")

    corroborating = 0
    if n >= 5:
        corroborating += 1
    if most_common == 4:
        corroborating += 1

    conf = _confidence_from(primary, corroborating)
    return RuleHit(
        wall_id="S-1",
        title="Padding off-by-one — sub-word `_pad` lands fields wrong",
        confidence=conf,
        signature=signature,
        recipe=f"Check the struct decl — `_pad` size is likely off by "
               f"{most_common}. If the struct decl looks correct, "
               f"suspect a cross-function cascade from an upstream TU "
               f"in the same overlay (see the diagnostic-vs-resolution "
               f"split in the S-1 entry).",
        anchor=_anchor("S-1"),
        notes="Diagnostic-vs-resolution split: same symptom for "
              "(a) struct-decl pad mismatch AND (b) upstream-TU "
              "cascade. Check upstream TU additions in the same "
              "overlay before re-deriving the struct.",
    )


def _detect_c20_halfword_pack(
    left: list[Insn], right: list[Insn],
) -> RuleHit | None:
    """C-20 — target packs two halfwords into one register
    (`mov rA, rX, lsl #16; orr rA, rA, rY` or similar) to pass as
    a tail-call arg, and mwcc emits separate `mov`/`add` ops
    because its tail-call detector misses the pack.

    Primary signature: target has the halfword-pack triplet shape
    (a shift-and-orr followed by a tail branch / bx ip), and the
    right side has more instructions covering the same bytes.

    v0 is conservative — fires LOW unless we see the exact triplet.
    """
    # Look for: mov rA, rX, lsl #16 ; orr rA, rA, rY ; b<target>
    primary = False
    signature = ""
    for i in range(len(left) - 2):
        a, b, c = left[i], left[i + 1], left[i + 2]
        if (a.mnemonic == "mov"
                and "lsl" in a.formatted
                and 16 in (arg.imm for arg in a.arguments
                           if arg.imm is not None)
                and b.mnemonic == "orr"
                and c.mnemonic in ("b", "bx")):
            primary = True
            signature = (f"halfword-pack triplet at +0x{a.address:x}: "
                         f"`{a.formatted}; {b.formatted}; "
                         f"{c.formatted}`")
            break

    if not primary:
        return None

    corroborating = 0
    # mwcc emission has more insns → suggests the pack failed to detect.
    if len(right) > len(left):
        corroborating += 1
    # Right side has no orr (the pack didn't survive).
    if not any(i.mnemonic == "orr" for i in right):
        corroborating += 1

    conf = _confidence_from(primary, corroborating)
    return RuleHit(
        wall_id="C-20",
        title="Pack-halfwords-into-arg + tail-call via legacy-tier",
        confidence=conf,
        signature=signature,
        recipe="Route via *.legacy.c (mwcc 1.2/sp2p3) — older "
               "tail-call detector picks up the pack. "
               "For byte-pack quads (C-20a), inline-asm fallback "
               "is required.",
        anchor=_anchor("C-20"),
        notes="If routing to .legacy.c doesn't match, the pack is a "
              "byte-pack quad (C-20a) — inline-asm fallback per "
              "C-20a entry.",
    )


def _detect_c1_pred_vs_branch(
    left: list[Insn], right: list[Insn],
) -> RuleHit | None:
    """C-1 — target uses predicated execution (`movXX rN, K;
    bxXX lr`) and mwcc emits real branches (`bXX label; ...; b
    .end; label: ...; .end: bx lr`).

    Primary signature: ≥2 predicated ops in `left` AND ≥1 branch-
    to-label op in `right` at a position where left has predicated
    moves.

    Corroborating signals:
      1. Right has more instructions than left (branchy form is
         strictly longer than predicated form).
      2. Left's if-body looks ≤3 ARM ops long (within the C-1
         predication threshold — above 4 ops mwcc won't emit
         predication regardless of C variation; see P-6).
    """
    pred_left = [i for i in left if i.is_predicated()
                 and i.mnemonic.startswith(("mov", "bx", "ldr", "str",
                                            "add", "sub", "ldm", "stm"))]
    branch_right = [i for i in right
                    if i.mnemonic.startswith("b")
                    and i.mnemonic not in ("bx",)]

    if len(pred_left) < 2 or not branch_right:
        return None

    primary = True
    signature = (f"target has {len(pred_left)} predicated op(s) "
                 f"(e.g. `{pred_left[0].formatted}`); mwcc emits "
                 f"branchy form (`{branch_right[0].formatted}`)")

    corroborating = 0
    if len(right) > len(left):
        corroborating += 1
    # if-body length estimate: count predicated insns. ≤3 → within C-1.
    if len(pred_left) <= 3:
        corroborating += 1

    conf = _confidence_from(primary, corroborating)
    return RuleHit(
        wall_id="C-1",
        title="Predicated-execution: pure pred-exec vs early-return",
        confidence=conf,
        signature=signature,
        recipe="Combine the conditional side-effect AND the conditional "
               "value-update into one non-returning if-body, then "
               "return at the end. Avoid `return` inside the if. mwcc "
               "predicates only when no early-return appears.",
        anchor=_anchor("C-1"),
        notes="If the if-body would expand to ≥4 ARM ops, this is "
              "P-6 (permanent threshold) — no C variation flips it. "
              "Also see C-1r for the reverse direction.",
    )


# Rule library, evaluated in declaration order. Adding a new wall
# is one entry here plus one docstring update.
RULES: list[Rule] = [
    Rule(
        wall_id="C-15",
        title="mwcc-2.0 peephole avoidance via legacy-tier routing",
        recipe="Route via *.legacy.c (mwcc 1.2/sp2p3) or "
               "*.legacy_sp3.c (sp3)",
        anchor=_anchor("C-15"),
        detect_fn=_detect_c15_mvn_vs_sub,
    ),
    Rule(
        wall_id="P-1",
        title="Shift-pair vs mask collapse",
        recipe="PERMANENT — abandon this coercion",
        anchor=_anchor("P-1"),
        detect_fn=_detect_p1_shift_pair_vs_mask,
    ),
    Rule(
        wall_id="S-1",
        title="Padding off-by-one — sub-word `_pad` lands fields wrong",
        recipe="Check `_pad` size (or upstream-TU cascade)",
        anchor=_anchor("S-1"),
        detect_fn=_detect_s1_uniform_offset_shift,
    ),
    Rule(
        wall_id="C-20",
        title="Pack-halfwords-into-arg + tail-call via legacy-tier",
        recipe="Route via *.legacy.c (mwcc 1.2/sp2p3)",
        anchor=_anchor("C-20"),
        detect_fn=_detect_c20_halfword_pack,
    ),
    Rule(
        wall_id="C-1",
        title="Predicated-execution: pure pred-exec vs early-return",
        recipe="Restructure if-body without an early `return`",
        anchor=_anchor("C-1"),
        detect_fn=_detect_c1_pred_vs_branch,
    ),
]


# --------------------------------------------------------------------------- #
# Engine
# --------------------------------------------------------------------------- #


def _pair_by_address(
    left: list[Insn], right: list[Insn],
) -> list[tuple[Insn | None, Insn | None]]:
    """Align left/right instruction streams by byte address.
    Useful for rules that need to compare two streams that may
    differ in instruction count but share many addresses.

    Builds the union of left/right addresses in sorted order;
    each output tuple is (left_at_addr, right_at_addr) with None
    where one side has no instruction at that address."""
    by_addr_l = {i.address: i for i in left}
    by_addr_r = {i.address: i for i in right}
    addrs = sorted(set(by_addr_l) | set(by_addr_r))
    return [(by_addr_l.get(a), by_addr_r.get(a)) for a in addrs]


def suggest(
    left: list[Insn], right: list[Insn],
) -> list[RuleHit]:
    """Run every rule against the diff. Returns hits sorted by
    confidence (HIGH first), then by wall_id (stable / readable).

    The same wall can never appear twice in the output — each rule
    returns at most one hit per call."""
    hits: list[RuleHit] = []
    for rule in RULES:
        h = rule.detect_fn(left, right)
        if h is not None:
            hits.append(h)
    hits.sort(key=lambda h: (-_CONFIDENCE_RANK.get(h.confidence, 0),
                             h.wall_id))
    return hits


# --------------------------------------------------------------------------- #
# Output rendering
# --------------------------------------------------------------------------- #


def render_text(
    hits: list[RuleHit],
    func_name: str,
    match_pct: float,
    n_left: int,
    n_right: int,
) -> str:
    """Human-readable terminal output. Format follows brief 062's
    spec example."""
    lines: list[str] = []
    lines.append(f"Reading objdiff output for {func_name} "
                 f"(left={n_left} insns, right={n_right} insns, "
                 f"match={match_pct:.1f}%)...")
    lines.append("")
    if not hits:
        lines.append("No candidate walls detected.")
        lines.append("")
        lines.append("Either the diff is too small to fingerprint, "
                     "or this is an unrecognised pattern. Review "
                     "manually against docs/research/codegen-walls.md "
                     "and consider adding a new rule.")
        return "\n".join(lines) + "\n"
    lines.append(f"{len(hits)} candidate wall(s) detected:")
    lines.append("")
    for h in hits:
        lines.append(f"[{h.confidence}] {h.wall_id} — {h.title}")
        lines.append(f"  Diff signature: {h.signature}")
        lines.append(f"  Recipe: {h.recipe}")
        lines.append(f"  Reference: {h.anchor}")
        if h.notes:
            lines.append(f"  Notes: {h.notes}")
        lines.append("")
    order_by_conf = ", ".join(
        f"{h.wall_id} ({h.confidence})" for h in hits
    )
    lines.append(f"Recommended order to try: {order_by_conf}")
    return "\n".join(lines) + "\n"


def render_json(
    hits: list[RuleHit],
    func_name: str,
    match_pct: float,
    n_left: int,
    n_right: int,
) -> str:
    payload = {
        "function": func_name,
        "match_percent": match_pct,
        "left_instructions": n_left,
        "right_instructions": n_right,
        "hits": [
            {
                "wall_id": h.wall_id,
                "title": h.title,
                "confidence": h.confidence,
                "signature": h.signature,
                "recipe": h.recipe,
                "anchor": h.anchor,
                "notes": h.notes,
            }
            for h in hits
        ],
    }
    return json.dumps(payload, indent=2) + "\n"


# --------------------------------------------------------------------------- #
# .o file discovery + objdiff-cli runner
# --------------------------------------------------------------------------- #


def _find_objdiff_cli() -> str | None:
    """Look for objdiff-cli in `./` (where configure.py downloads
    it) and then on PATH."""
    candidates = ["./objdiff-cli", "objdiff-cli"]
    for c in candidates:
        try:
            r = subprocess.run([c, "--version"], capture_output=True,
                               text=True, timeout=5)
            if r.returncode == 0:
                return c
        except (FileNotFoundError, subprocess.TimeoutExpired):
            continue
    return None


def _find_object_files(
    symbol: str, region: str = "eur",
) -> tuple[Path, Path] | None:
    """For a given symbol name, locate (target_o, base_o) under
    build/<region>/. Returns None if not found.

    Heuristic: walk `build/<region>/src/` for any `.o` whose stem
    matches the symbol; pair with the matching `.o` under
    `build/<region>/delinks/`. Doesn't try to be clever about
    overlays — both paths must exist or we return None.
    """
    root = Path("build") / region
    if not root.is_dir():
        return None
    # Search src/ side first (mwcc output).
    base = None
    for o in (root / "src").rglob(f"{symbol}.o"):
        base = o
        break
    if base is None:
        return None
    # Mirror the relative path under delinks/.
    rel = base.relative_to(root / "src")
    target = root / "delinks" / "src" / rel
    if not target.is_file():
        # Some delinks live directly under build/<r>/delinks/<sym>.o
        alt = root / "delinks" / f"{symbol}.o"
        if alt.is_file():
            target = alt
        else:
            return None
    return target, base


def run_objdiff(
    symbol: str, target_o: Path, base_o: Path,
    objdiff_cli: str,
) -> dict:
    """Run `objdiff-cli diff -1 <target> -2 <base> <symbol>`
    and parse its JSON output."""
    r = subprocess.run(
        [objdiff_cli, "diff",
         "-1", str(target_o),
         "-2", str(base_o),
         "-o", "-",
         "--format", "json",
         symbol],
        capture_output=True, text=True, timeout=30,
    )
    if r.returncode != 0:
        raise RuntimeError(
            f"objdiff-cli failed (exit {r.returncode}):\n{r.stderr}"
        )
    return json.loads(r.stdout)


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #


def _read_json_arg(arg: str) -> dict:
    if arg == "-":
        return json.loads(sys.stdin.read())
    return json.loads(Path(arg).read_text(encoding="utf-8"))


def main(argv: list[str] | None = None) -> int:
    p = argparse.ArgumentParser(
        description="Rule engine over objdiff JSON — suggest "
                    "codegen-walls.md entries for an unmatched function.",
    )
    p.add_argument("symbol", nargs="?",
                   help="Function symbol (e.g. func_02123456). "
                        "Auto-locates .o files under build/<region>/. "
                        "Required unless --json is used.")
    p.add_argument("--json", metavar="PATH",
                   help="Read pre-generated objdiff JSON from PATH "
                        "(`-` for stdin). Skips objdiff-cli invocation.")
    p.add_argument("--region", default="eur",
                   help="Build region to search for .o files "
                        "(default: eur).")
    p.add_argument("--format", choices=("text", "json"), default="text",
                   help="Output format (default: text).")
    args = p.parse_args(argv)

    func_name = args.symbol or "<from-json>"

    if args.json is not None:
        try:
            data = _read_json_arg(args.json)
        except (OSError, json.JSONDecodeError) as e:
            print(f"error: failed to read objdiff JSON: {e}",
                  file=sys.stderr)
            return 1
        # Try to grab the symbol name from the JSON when not
        # provided on the CLI.
        if args.symbol is None:
            for sec in data.get("left", {}).get("sections", []):
                for sym in sec.get("symbols", []):
                    n = sym.get("symbol", {}).get("name")
                    if n:
                        func_name = n
                        break
                if func_name != "<from-json>":
                    break
    else:
        if args.symbol is None:
            print("error: provide a symbol name or --json PATH",
                  file=sys.stderr)
            return 2
        cli = _find_objdiff_cli()
        if cli is None:
            print("error: objdiff-cli not found on PATH or in ./",
                  file=sys.stderr)
            return 3
        paths = _find_object_files(args.symbol, region=args.region)
        if paths is None:
            print(f"error: could not locate .o files for "
                  f"{args.symbol} under build/{args.region}/.\n"
                  f"  Run `ninja` first to build the target / base "
                  f"objects, or pass --json with a pre-generated "
                  f"objdiff JSON.",
                  file=sys.stderr)
            return 4
        target_o, base_o = paths
        try:
            data = run_objdiff(args.symbol, target_o, base_o, cli)
        except (RuntimeError, json.JSONDecodeError,
                subprocess.TimeoutExpired) as e:
            print(f"error: objdiff-cli invocation failed: {e}",
                  file=sys.stderr)
            return 5

    left, right, match_pct = parse_objdiff_json(data)
    hits = suggest(left, right)

    if args.format == "json":
        sys.stdout.write(render_json(
            hits, func_name, match_pct, len(left), len(right),
        ))
    else:
        sys.stdout.write(render_text(
            hits, func_name, match_pct, len(left), len(right),
        ))
    return 0


if __name__ == "__main__":
    sys.exit(main())
