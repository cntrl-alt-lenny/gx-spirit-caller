#!/usr/bin/env python3
"""
wall_prefilter.py — pre-dispatch register-choice wall detector for
cm-main-wall-filtered-sweep-1.

cm-main-tier-sweep-7 (#1502) found two register-choice wall families
concentrated entirely in its 4+-callee arm (21 ledger rows, zero in the
0-1-callee arm): P-51 (codegen-walls.md, changed-bool-field register
reuse, 18 confirmed members) and an empirical "register-numbering-
permutation-cascade" tag (9 ledger rows, three inconsistent spellings,
overlapping P-30/P-36 territory -- no single formal taxonomy entry).
This module builds a MECHANICAL, .s-body-only classifier for both,
so a candidate can be flagged BEFORE a dispatch is spent on it.

Two independent signals, OR-combined into `is_flagged`:

  - `detect_p51` -- a fixed 6-instruction ARM sequence (load a
    struct/record field, unconditionally zero the holding register,
    conditionally store it back to the SAME address, conditionally
    reuse the SAME register for a "changed" flag, then branch on it)
    plus the following branch/conditional-return. Calibrated against
    all 18 confirmed P-51 members (positives) and all 43 of sweep-7's
    shipped functions (negatives, fetched from git history at the
    pre-merge commit): **18/18 recall, 1/43 false positive.**
    HIGH CONFIDENCE: the signature is exact-byte mechanical, not a
    proxy. The 1 false positive (`func_ov004_021d552c`) is a genuine,
    important finding, not a regex bug -- see the note below.

  - `detect_permutation_proxy` -- a WEAKER, evidence-motivated
    composite. Hand-reading all 9 tagged members found no single
    disasm-only shape common to all of them (callee-saved push count
    alone ranges 0-8 across the 9; repeated-callee alone misses 3/9).
    Votes >=3 of 4 signals: (a) any single bl target invoked 2+ times,
    (b) 4+ callee-saved registers (r4-r11) pushed in the prologue,
    (c) 6+ total `bl`/`blx` instructions in the body, (d) a loop
    (backward branch to an earlier local label) with a `bl` inside it.
    Calibrated the same way as P-51 above: **2/9 recall (22%), 4/43
    false positives (9.3%).** The >=3 threshold was chosen over >=2
    (6/9 recall, 30% FP) specifically to hit the round's stated
    <15%-flagged-arm precision target rather than to maximize recall
    -- EXPLICITLY LOWER CONFIDENCE than P-51, and the low recall is a
    known, disclosed limitation: most of this empirical family's
    members will land in the PASSED arm, not the flagged one. This is
    the half the round's dispatch is supposed to measure the real
    precision of, not assume.

  - **P-51 is not 100% deterministic.** `func_ov004_021d552c` matches
    the P-51 byte signature exactly (`ldr r0,[r4,#0x38]; cmp; mov r0,#0;
    strne; movne r0,#1; cmp; beq`) yet shipped in sweep-7 via
    `char *self = (char*)selfv; if (*(int*)(self+0x38) != 0) {
    *(int*)(self+0x38) = 0; flag = 1; }` -- a raw pointer-cast field
    access, not the typed `rec.field` struct access the entry's
    documented failed-coercion list (store-c, `!!`, temp-variable) was
    tried against. One exception in 19 known instances does not
    retract "permanent," but it does mean the flagged arm's real ship
    rate should be expected slightly above 0%, and the pointer-cast
    coercion is a candidate lever worth trying on the other 17 P-51
    members in a future, separately-scoped round -- not this one.

Usage
-----
    # Classify one candidate .s file (debugging):
    python tools/wall_prefilter.py --file src/overlay004/func_ov004_021d48bc.s

    # Calibrate against a JSON list of {"path":..., "label": "positive"|"negative"}.
    python tools/wall_prefilter.py --calibrate calibration.json
"""
from __future__ import annotations

import argparse
import json
import re
import sys
from dataclasses import dataclass, field
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

# ---------------------------------------------------------------------------
# P-51: changed-bool-field register reuse.
# ---------------------------------------------------------------------------
#
#   ldr   rA, [rB, #imm]     ; load field
#   cmp   rA, #0x0           ; test
#   mov   rA, #0x0           ; UNCONDITIONAL zero (the eventual "c=0")
#   strne rA, [rB, #imm]     ; conditional store-back to the SAME address
#   movne rA, #0x1           ; conditional reuse of the SAME register as "c"
#   cmp   rA, #0x0           ; test c
#   b{eq,ne} / ldm{eq,ne}... ; branch/return on c
#
# The backreferences on rA/rB/imm are load-bearing: they are what make this
# the SAME register/address round-tripping through the sequence, which is
# the actual wall (mwcc never performs this specific reuse). Deliberately
# does NOT require a specific trailing branch/ldm -- calibration found real
# members whose tail is `addeq sp,sp,#N; ldmeqia...` (stack-scratch fixup
# first) or more predicated instructions reusing the same flag before any
# branch (021d5a10, 021d5004) -- the 6-line core with its register/address
# identity is already the specific, load-bearing signature on its own.
_P51_RE = re.compile(
    r"ldr[ \t]+(r\d+),[ \t]*\[(r\d+)(?:,[ \t]*#(0x[0-9a-fA-F]+))?\][ \t]*\n"
    r"[ \t]*cmp[ \t]+\1,[ \t]*#0x0[ \t]*\n"
    r"[ \t]*mov[ \t]+\1,[ \t]*#0x0[ \t]*\n"
    r"[ \t]*strne[ \t]+\1,[ \t]*\[\2(?:,[ \t]*#\3)?\][ \t]*\n"
    r"[ \t]*movne[ \t]+\1,[ \t]*#0x1[ \t]*\n"
    r"[ \t]*cmp[ \t]+\1,[ \t]*#0x0[ \t]*\n",
)


def detect_p51(text: str) -> bool:
    """PURE. True if the exact changed-bool-field register-reuse sequence
    (codegen-walls.md P-51) appears anywhere in the function body."""
    return _P51_RE.search(text) is not None


# ---------------------------------------------------------------------------
# register-numbering-permutation-cascade proxy (weaker, composite).
# ---------------------------------------------------------------------------

_PROLOGUE_RE = re.compile(r"(?:stmdb|stmfd|push)[ \t]+sp!?,?[ \t]*\{([^}]+)\}")
_CALLEE_SAVED = ("r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "sl", "fp")
_BL_RE = re.compile(r"^\s*bl[ \t]+(\S+)\s*$", re.MULTILINE)
_LABEL_DEF_RE = re.compile(r"^(\.L_[0-9a-fA-F]+):[ \t]*$", re.MULTILINE)
_BRANCH_RE = re.compile(
    r"^\s*b(?:eq|ne|cs|cc|mi|pl|vs|vc|hi|ls|ge|lt|gt|le)?[ \t]+(\.L_[0-9a-fA-F]+)\s*$",
    re.MULTILINE,
)


def _prologue_callee_saved_count(text: str) -> int:
    """Count r4-r11/sl/fp registers pushed in the function's first
    stmdb/stmfd/push (the prologue register-save list)."""
    m = _PROLOGUE_RE.search(text)
    if not m:
        return 0
    regs = [r.strip() for r in m.group(1).split(",")]
    return sum(1 for r in regs if r in _CALLEE_SAVED)


def _bl_targets(text: str) -> dict[str, int]:
    """Map each `bl` target symbol to its static occurrence count."""
    counts: dict[str, int] = {}
    for m in _BL_RE.finditer(text):
        counts[m.group(1)] = counts.get(m.group(1), 0) + 1
    return counts


def _has_repeated_callee(text: str) -> bool:
    return any(n >= 2 for n in _bl_targets(text).values())


def _has_loop_with_call(text: str) -> bool:
    """A backward branch (target label defined earlier in the file) whose
    span [label, branch] contains at least one `bl` -- a loop with a call
    inside it, forcing a live value across the call on every iteration."""
    label_pos = {m.group(1): m.start() for m in _LABEL_DEF_RE.finditer(text)}
    for m in _BRANCH_RE.finditer(text):
        target, branch_pos = m.group(1), m.start()
        label_at = label_pos.get(target)
        if label_at is None or label_at > branch_pos:
            continue  # forward branch, not a loop back-edge
        span = text[label_at:branch_pos]
        if _BL_RE.search(span):
            return True
    return False


_PERMUTATION_VOTE_THRESHOLD = 3


def detect_permutation_proxy(text: str) -> tuple[bool, int]:
    """PURE. Composite proxy for the register-numbering-permutation-cascade
    family. Returns (flagged, vote_count) -- flagged when vote_count >=
    `_PERMUTATION_VOTE_THRESHOLD` of the 4 signals below. See module
    docstring for the calibrated recall/FP-rate and why this is explicitly
    weaker than `detect_p51`."""
    votes = 0
    votes += 1 if _has_repeated_callee(text) else 0
    votes += 1 if _prologue_callee_saved_count(text) >= 4 else 0
    votes += 1 if sum(_bl_targets(text).values()) >= 6 else 0
    votes += 1 if _has_loop_with_call(text) else 0
    return votes >= _PERMUTATION_VOTE_THRESHOLD, votes


# ---------------------------------------------------------------------------
# Combined classification.
# ---------------------------------------------------------------------------

@dataclass
class WallVerdict:
    flagged: bool
    p51: bool
    permutation_proxy: bool
    permutation_votes: int
    reasons: list[str] = field(default_factory=list)


def classify(text: str) -> WallVerdict:
    """PURE. Combine both signals; flagged iff either fires."""
    p51 = detect_p51(text)
    perm, votes = detect_permutation_proxy(text)
    reasons = []
    if p51:
        reasons.append("P-51 changed-bool-field register reuse")
    if perm:
        reasons.append(f"register-numbering-permutation-cascade proxy ({votes}/4 votes)")
    return WallVerdict(
        flagged=p51 or perm, p51=p51, permutation_proxy=perm,
        permutation_votes=votes, reasons=reasons,
    )


def classify_path(path: Path) -> WallVerdict:
    return classify(path.read_text(encoding="utf-8", errors="ignore"))


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def _cmd_file(path_str: str) -> int:
    path = Path(path_str)
    if not path.is_absolute():
        path = ROOT / path
    verdict = classify_path(path)
    print(json.dumps({
        "path": path_str,
        "flagged": verdict.flagged,
        "p51": verdict.p51,
        "permutation_proxy": verdict.permutation_proxy,
        "permutation_votes": verdict.permutation_votes,
        "reasons": verdict.reasons,
    }, indent=2))
    return 0


def _cmd_calibrate(json_path_str: str) -> int:
    """Each row: {"path": "src/...s" or "-":<literal text>, "label": "positive"|"negative", "text": optional inline text}."""
    rows = json.loads(Path(json_path_str).read_text(encoding="utf-8"))
    tp = fp = tn = fn = 0
    misses = []
    for row in rows:
        text = row.get("text")
        if text is None:
            p = Path(row["path"])
            if not p.is_absolute():
                p = ROOT / p
            text = p.read_text(encoding="utf-8", errors="ignore")
        verdict = classify(text)
        positive = row["label"] == "positive"
        if positive and verdict.flagged:
            tp += 1
        elif positive and not verdict.flagged:
            fn += 1
            misses.append((row.get("path", row.get("id", "?")), "false_negative"))
        elif not positive and verdict.flagged:
            fp += 1
            misses.append((row.get("path", row.get("id", "?")), "false_positive", verdict.reasons))
        else:
            tn += 1
    print(f"TP={tp} FN={fn} (recall on positives: {tp}/{tp+fn} = {tp/(tp+fn)*100:.1f}%)")
    print(f"TN={tn} FP={fp} (false-positive rate on negatives: {fp}/{fp+tn} = {fp/(fp+tn)*100:.1f}%)")
    for m in misses:
        print("  MISS:", m)
    return 0


def main(argv: list[str]) -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--file", help="Classify one candidate .s file.")
    ap.add_argument("--calibrate", help="Path to a calibration JSON file (see _cmd_calibrate docstring).")
    args = ap.parse_args(argv[1:])
    if args.file:
        return _cmd_file(args.file)
    if args.calibrate:
        return _cmd_calibrate(args.calibrate)
    ap.error("pass --file or --calibrate")
    return 2


if __name__ == "__main__":
    sys.exit(main(sys.argv))
