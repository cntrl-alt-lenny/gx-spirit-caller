#!/usr/bin/env python3

"""
predict_walls.py — disasm-based codegen-wall prediction for the
code-decomp resumption wave (brief 189).

For each function in `config/<region>/**/symbols.txt`, extracts the
ARM bytes from the matching `extract/<region>/.../<module>.bin`,
disassembles via `arm-none-eabi-objdump`, and applies a regex-based
classifier to detect recognition cues from
[`docs/research/codegen-walls.md`](../docs/research/codegen-walls.md).

The output is a JSON dictionary keyed by `module:addr` with the
predicted walls per function. `tools/next_targets.py` consumes
this file (when present) to emit wall predictions in the
`reason` column of `next_targets.md` / `next_targets.json`.

What walls this predictor recognises
------------------------------------

The cheap-to-detect subset of the wall taxonomy — the ones whose
recognition cue is a localised regex pattern in disasm. More
subtle walls (e.g. C-2 local-pointer reuse, C-9 saturating-cap
predicate) need source-level context and aren't emitted here.

  - **StyleA** — `bx lr` epilogue separate from `ldmfd sp!, {...}`
    (vs Style B's `pop {..., pc}` single-instruction return).
    Routes through `.legacy.c` (mwcc 1.2/sp2p3).
  - **C-1** — 3+ consecutive predicated-execution instructions
    forming a fused early-return-equivalent chain. mwcc 2.0's
    aggressive predication vs an early-return source — see
    codegen-walls.md § C-1.
  - **C-12** — prologue pushes `r0` (arg-preserving thunk shape).
    `asm void` + `nofralloc` recipe per codegen-walls.md § C-12.
  - **C-15** — constant-pair derivation: `mov rN, #K; mvn rM, #0`
    OR `mov rN, #K; sub rM, rN, #1`. Routes through `.legacy.c`.
  - **C-22** — 2+ adjacent `bic; orr` pairs at different bit
    positions. Declare each window as its own C bitfield.
  - **C-23** — 3+ `ldr rN, [pc, #imm]` loading MMIO addresses
    (`0x04000xxx` range). Routes through `.legacy.c`.
  - **C-24** — `ldr rN, [pool]; bx rN` indirect-call dispatch
    (not `bx lr`). Routes through `.legacy_sp3.c`.
  - **P-9** — conditional `mvn{cond}` — mwcc 2.0 may not
    peephole this; permuter via brief 098.
  - **P-11** — mwcc 2.0/sp1p5 reg-allocator plateau (brief
    200). Functions sized 0x5c-0x74 with 3+ callee-saved
    register push + helper-call in/after a loop body + 2+
    conditional branches plateau at score 480-500 under
    permuter (brief 198). Mechanism is downstream of source-
    shape iteration — permuter mutations don't reach it. No
    recipe yet; budget zero matches under current tools.
  - **C-31** — mwldarm interwork veneer (8 B Thumb, 12 B ARM,
    12 B Thumb-with-prefix). Routes through `.s` with explicit
    mode directive per brief 191 recipe.
  - **C-32** — cross-overlay hardcoded BL (`kind:arm_call
    to:<addr> module:none` reloc). Routes through `.s` with
    hand-encoded `.word`-BL per brief 192 recipe. Detected by
    consulting `relocs.txt` (NOT disasm), because the bare `bl
    <hex>` shape is ambiguous between resolvable and
    unresolvable cross-overlay BLs.
  - **C-34** — address-CSE: 2+ `kind:load` relocs with the
    SAME `to:` target inside the function (orig has duplicate
    pool slots for the same data symbol; mwcc 2.0 IR-CSE
    collapses to 1). Routes through `.s` with explicit
    `.word` per pool slot per brief 202 recipe.
  - **C-35** — routing trilemma: composite signal firing when
    C-23 AND C-34 both fire on the same function. Indicates
    combined codegen walls where no single mwcc tier matches.
    Same `.s` recipe as C-34; the composite cue pre-routes
    away from the `.legacy.c` retry loop the individual signals
    would otherwise suggest. Brief 204.
  - **C-33** — `.legacy.c` cascade risk (main module, function
    size > 0x50, StyleA or C-15 wall predicted). Brief 193's
    PR #640 surfaced this: any `.legacy.c` added to `src/main/`
    for a function past the threshold shifts every ov004 TU
    uniformly by ~+64 B, tripping `MAX_SHIFT_BYTES = 4` in the
    brief 180 patcher. Brief 194's patcher fix (per-section
    modal-deviation cap) unblocks the route. Detection is a
    composite — flagged only when an existing StyleA/C-15
    prediction is amplified by the module + size criteria.
  - **C-36** — literal-tail trim trap: function ends with a
    pool entry literal (`.word 0x7fff` and similar small
    values) whose top 2 bytes are `0x00 0x00`, AND no
    relocation covers the last 4 bytes. Without brief 208's
    delinks-aware trim guard, the patcher's
    `trim_text_section_padding` (brief 204) shaves 2 bytes
    off the section, cascade-shifting every downstream byte.
    Brief 208 ships the patcher fix; this detector flags
    affected functions so the decomper knows the path is
    open. Brief 207 PR #660 deferred 6 picks for exactly this
    reason — all now shippable under the brief 208 build.
  - **C-37** — bit-test / byte-zero check normalised to 0/1
    via the redundant-tail idiom: `lsl #N; movs lsr #N;
    mov{cond} #1; mov{!cond} #0; bx lr` where N is 31
    (bit-0 extract) or 24 (low-byte zero check). mwcc 2.0
    collapses the natural `(x & 1) ? 1 : 0` C form to `tst
    r0, #1; movne #1; moveq #0` — 1 instruction shorter,
    different shape. Brief 214's variant matrix found the
    shape DOES reach from C, but only under the legacy
    `1.2/sp2p3` tier (mwcc 1.2 lacks the bit-test peephole
    mwcc 2.0 added). Source idiom for bit-extract:
    `unsigned t = (unsigned)(x << 31) >> 31; if (t != 0u)
    return 1; return 0;` Routes through `.legacy.c`. The
    byte-zero variant (N=24) reaches from mwcc 2.0 directly
    via the same shift-extract source — only the bit-0 form
    triggers the peephole. Detector matches both polarities
    (`movne #1; moveq #0` for "1 if set"; `moveq #1; movne
    #0` for "1 if zero/clear") and both shift widths (24, 31)
    on r0. See `docs/research/bit-test-0-or-1-idiom.md` for
    the matrix.
  - **C-38** — leaf-no-pool reg-alloc + CSE divergence.
    Small leaf functions doing struct-field load/store with
    no pool reference and no callsite. mwcc 2.0 emits
    early-returns (`bxeq lr` form) and CSEs repeated outer-
    pointer derefs; the orig uses predicated execution
    (`movne` / `strneh` / `ldrne` form) and keeps the
    second deref explicit. Brief 215 attempted 8 picks as
    plain C — all 8 failed at 0-60% fuzzy. Brief 216's
    variant matrix found 4 of 7 reach orig bytes byte-for-
    byte under the legacy `mwcc 1.2/sp2p3` tier from
    specific source recipes:
      1. `void *` outer field (not typed struct ptr) +
         char-arithmetic for field access — keeps the
         explicit offset arithmetic orig has.
      2. Re-deref the outer pointer in the second store
         instead of caching — defeats mwcc CSE on the
         double-load shape.
      3. Substruct pointer cached in a named local —
         forces the `add rN, r0, #imm` intermediate that
         orig uses instead of folding to a single offset.
      4. `volatile` annotation for side-effect-only reads
         — defeats DCE on dummy loads (and the volatile
         sub-variant reaches under mwcc 2.0 too, no legacy
         needed).
    Routes: `.legacy.c` for predicated-exec / CSE-divergent
    picks; plain `.c` (mwcc 2.0) for the volatile side-
    effect sub-pattern. Detector flags the shape via
    disasm signature (no pool ref + no call + >=1 load/
    store + ends in `bx lr`) and surfaces the recipe
    family so decomper picks the route at brief time
    instead of burning C iterations. See
    `docs/research/wall-2-leaf-no-pool-reg-alloc.md` for
    the variant matrix.

Walls NOT detected here (require source context):

  - C-2 / C-9 / C-17 / C-25 / C-28 / S-1 / S-2 — recognition
    requires understanding the C-level intent that the asm
    encodes ambiguously. Decomper should consult
    `docs/research/codegen-walls.md` directly when the
    predictor reports no wall but the asm is non-trivial.

Usage
-----

  # Predict walls for every function in EUR config.
  python tools/predict_walls.py --version eur \\
      --out build/eur/analysis/wall_predictions.json

  # Predict for a single function (debugging):
  python tools/predict_walls.py --version eur --module main \\
      --address 0x02094d18 --size 0x34

  # JSON output for tool chaining (next_targets.py consumes this):
  python tools/predict_walls.py --version eur \\
      --out build/eur/analysis/wall_predictions.json --quiet

Brief 189 ships this as the source of truth for
`tools/next_targets.py`'s wall-prediction emission. Re-run after
shipping matches to keep the predictions current.

Dependencies
------------

  - `arm-none-eabi-objdump` on `PATH` (Homebrew:
    `brew install arm-none-eabi-binutils`).
  - The extracted `.bin` files in `extract/<region>/`.
  - The parsed `config/<region>/**/symbols.txt` + `delinks.txt`.

If `arm-none-eabi-objdump` is unavailable, the script exits 2 with
a clear message — `next_targets.py` falls back to its no-wall-
prediction behaviour.

See also
--------

  - `docs/research/codegen-walls.md` — the wall taxonomy this
    predictor encodes.
  - `docs/research/code-decomp-resumption-queue.md` — brief 187
    Part 2 + brief 189 Part 1 audit results.
  - `docs/research/first-wave-wall-*.md` — top-3-wall research
    notes from brief 189 Part 2.
"""

from __future__ import annotations

import argparse
import json
import re
import shutil
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import parse_symbols_file  # noqa: E402


VALID_REGIONS = ("eur", "usa", "jpn")


def _module_text_base(region: str, module: str) -> int | None:
    """Read `.text` start VA from the module's delinks.txt."""
    if module == "main":
        path = ROOT / f"config/{region}/arm9/delinks.txt"
    elif module in ("itcm", "dtcm"):
        path = ROOT / f"config/{region}/arm9/{module}/delinks.txt"
    elif module.startswith("ov"):
        path = ROOT / f"config/{region}/arm9/overlays/{module}/delinks.txt"
    else:
        return None
    if not path.is_file():
        return None
    text = path.read_text(encoding="utf-8")
    m = re.search(r"\.text\s+start:0x([0-9a-f]+)", text)
    return int(m.group(1), 16) if m else None


def _module_bin_path(region: str, module: str) -> Path:
    if module == "main":
        return ROOT / f"extract/{region}/arm9/arm9.bin"
    if module in ("itcm", "dtcm"):
        return ROOT / f"extract/{region}/arm9/{module}.bin"
    return ROOT / f"extract/{region}/arm9_overlays/{module}.bin"


def disasm_function(
    region: str, module: str, addr: int, size: int,
    *, objdump: str = "arm-none-eabi-objdump",
) -> str | None:
    """Disassemble `size` bytes at `addr` in `module`'s binary."""
    base = _module_text_base(region, module)
    bin_path = _module_bin_path(region, module)
    if base is None or not bin_path.is_file():
        return None
    fo = addr - base
    if fo < 0:
        return None
    r = subprocess.run(
        [
            objdump, "-D", "-b", "binary", "-m", "armv5te",
            f"--start-address=0x{fo:x}",
            f"--stop-address=0x{fo + size:x}",
            str(bin_path),
        ],
        capture_output=True, text=True, timeout=10,
    )
    if r.returncode != 0:
        return None
    return r.stdout


def read_function_bytes(
    region: str, module: str, addr: int, size: int,
) -> bytes | None:
    """Read `size` raw bytes from `module`'s binary at virtual
    address `addr`. Mirrors `disasm_function`'s base-address logic
    but returns the raw bytes (no objdump invocation).

    Brief 208's C-36 detector needs the last 4 bytes of every
    function to check for the literal-tail trim-trap signal.
    Disassembling the whole function then reparsing for the last
    word is workable but expensive; raw-byte read is one mmap +
    one slice.

    Returns `None` when the binary is missing, the address is
    below the module's `.text` base, or the read would extend
    past EOF.
    """
    base = _module_text_base(region, module)
    bin_path = _module_bin_path(region, module)
    if base is None or not bin_path.is_file():
        return None
    fo = addr - base
    if fo < 0:
        return None
    try:
        buf = bin_path.read_bytes()
    except OSError:
        return None
    if fo + size > len(buf):
        return None
    return buf[fo:fo + size]


@dataclass
class WallPrediction:
    wall_id: str
    cue: str


def detect_walls(asm: str) -> list[WallPrediction]:
    """Apply the brief 189 regex-based wall classifier to disasm.
    Returns a (possibly empty) list of `WallPrediction`s, ordered
    by detection rule (StyleA → C-12 → C-23 → C-24 → C-22 → C-15
    → C-1 → P-9).

    Pure function — no I/O — so the classifier is unit-testable
    against synthetic asm fixtures.
    """
    walls: list[WallPrediction] = []
    lines = [
        line.strip() for line in asm.splitlines()
        if ":\t" in line and "Disassembly" not in line
    ]
    if not lines:
        return walls

    # ----- Style A vs B epilogue.
    has_bx_lr_epilogue = any(
        "bx\tlr" in line for line in lines[-3:]
    )
    has_pop_pc = (
        any(
            "ldmfd" in line and "pc" in line.split("{", 1)[-1]
            for line in lines if "{" in line
        )
        or any("pop" in line and ", pc" in line for line in lines)
    )
    if has_bx_lr_epilogue and not has_pop_pc:
        walls.append(WallPrediction(
            "StyleA",
            "epilogue uses `bx lr` separate from "
            "`ldmfd sp!, {...}` — `.legacy.c` routing required",
        ))

    # ----- C-12 push-r0 arg-preserving thunk.
    for line in lines[:3]:
        m = re.search(r"(stmfd|push)\s+sp!,?\s*\{([^}]+)\}", line)
        if m and "r0" in m.group(2):
            walls.append(WallPrediction(
                "C-12",
                "prologue pushes r0 — arg-preserving thunk; "
                "`asm void` + `nofralloc` recipe",
            ))
            break

    # ----- C-23 MMIO base-folding.
    #
    # Two-signal detector (brief 199):
    #
    #   (a) **MMIO literal**: `pc_loads >= 3` AND at least one
    #       pool word matches the NDS MMIO ranges
    #       (`0x04000xxx` main MMIO; `0x027ffxxx` DTCM kernel
    #       block — IRQ state, OS handles, etc.). This is the
    #       brief 086 canonical signal — `func_0208bde0` DS
    #       hardware divider shape.
    #
    #   (b) **Duplicate pool ref**: `pc_loads >= 3` AND at
    #       least one pool target is loaded by 2+ separate
    #       `ldr` instructions. mwcc 2.0/sp1p5 would never
    #       emit duplicate `ldr` to the same pool word —
    #       it folds them into a single base load before the
    #       diverging branches. mwcc 1.2/sp2p3 reloads in
    #       each branch. Brief 199's pick #5 (`func_02096434`)
    #       has this shape: two separate `ldr r3` of
    #       `0x027ffc00`, one per if/else branch.
    #
    # Either signal alone is sufficient. Both fire on the
    # `.legacy.c` (mwcc 1.2/sp2p3) routing recipe; the cue
    # text differentiates so the decomper knows which
    # discriminator triggered.
    pc_loads = sum(
        1 for line in lines
        if re.search(r"ldr\s+\w+,\s*\[pc", line)
    )
    # objdump-on-binary mode (`-D -b binary`) prints pool words as
    # whatever ARM-decoded instruction the 4 bytes happen to form
    # — `.word 0x04000280` doesn't appear. Instead each disasm
    # line carries the 4-byte hex value in the column immediately
    # after the address (`<addr>:\t<hex>  <decoded>`). The MMIO
    # check matches on that hex word directly.
    mmio_main = 0
    mmio_dtcm = 0
    for line in lines:
        m = re.search(r":\t([0-9a-f]{8})\s+", line)
        if not m:
            continue
        val = m.group(1)
        if val.startswith("04000") or val.startswith("0400a"):
            mmio_main += 1
        elif val.startswith("027ffc") or val.startswith("027ffd") \
                or val.startswith("027ffe") or val.startswith("027fff"):
            mmio_dtcm += 1
    # Pool words that decode as ARM instructions also light up
    # `pc_loads` if their bytes happen to look like `ldr ... [pc`.
    # Conservatively subtract the duplicate count to keep the
    # false-positive rate low. (Empirical: 1-2 pool words rarely
    # decode as ldr/[pc; subtract the MMIO count from pc_loads
    # too, since each MMIO pool word counts once in `lines`.)
    mmio_lits = mmio_main + mmio_dtcm
    # Duplicate pool ref: count `ldr ... [pc, #N] @ 0xADDR`
    # occurrences of the same `0xADDR` target. The `@` suffix in
    # objdump output annotates the absolute pool address — this
    # works in both `-d` (object mode) and `-D -b binary` modes.
    pool_targets: dict[str, int] = {}
    for line in lines:
        if not re.search(r"\bldr\s+\w+,\s*\[pc", line):
            continue
        m = re.search(r"@\s*(0x[0-9a-f]+)\b", line)
        if m:
            pool_targets[m.group(1)] = (
                pool_targets.get(m.group(1), 0) + 1
            )
    duplicate_refs = sum(
        1 for count in pool_targets.values() if count >= 2
    )
    # **Clustered pool**: 3+ DISTINCT pool targets within a tight
    # ±0x20-byte window. mwcc 2.0/sp1p5 would emit a single base
    # load before the cluster; mwcc 1.2/sp2p3 emits separate `ldr`
    # per slot. Detects struct-base-folding shapes (e.g.
    # `OSi_PostIrqEvent` reads 3 fields of a table struct: orig
    # pool has `0x021a6354, 0x021a6358, 0x021a635c` — adjacent
    # 32-bit words. Each gets its own `ldr [pc, #N]` in 1.2/
    # sp2p3; 2.0 would fold to `ldr base; ldr [base, #4]; ldr
    # [base, #8]`).
    distinct_targets = sorted({
        int(t, 16) for t in pool_targets.keys()
    })
    clustered_pool = False
    for i in range(len(distinct_targets) - 2):
        # Window of 3 sorted targets; check the outer span.
        if (
            distinct_targets[i + 2] - distinct_targets[i] <= 0x20
        ):
            clustered_pool = True
            break
    if pc_loads >= 3 and (
        mmio_lits >= 1 or duplicate_refs >= 1 or clustered_pool
    ):
        cues: list[str] = []
        if mmio_lits >= 1:
            ranges = []
            if mmio_main >= 1:
                ranges.append(f"{mmio_main} main MMIO (0x04000xxx)")
            if mmio_dtcm >= 1:
                ranges.append(f"{mmio_dtcm} DTCM kernel (0x027ffxxx)")
            cues.append(f"literal(s): {', '.join(ranges)}")
        if duplicate_refs >= 1:
            cues.append(f"{duplicate_refs} duplicate pool ref(s)")
        if clustered_pool:
            cues.append("clustered pool window (≤0x20 B span)")
        walls.append(WallPrediction(
            "C-23",
            f"{pc_loads} pc-relative loads + "
            f"{'; '.join(cues)} — `.legacy.c` routing",
        ))

    # ----- C-24 indirect-call dispatch.
    for i in range(len(lines) - 1):
        if "ldr" in lines[i]:
            # `bx rN` (not `bx lr`) or `mov pc, rN`.
            nxt = lines[i + 1]
            m_bx = re.search(r"\bbx\s+(\w+)", nxt)
            if m_bx and m_bx.group(1) != "lr":
                walls.append(WallPrediction(
                    "C-24",
                    "indirect-call dispatch (`ldr rN, [pool]; "
                    "bx rN`) — `.legacy_sp3.c` routing",
                ))
                break

    # ----- C-22 adjacent bitfield write.
    bic_orr_count = 0
    for i in range(len(lines) - 1):
        if "bic" in lines[i] and "orr" in lines[i + 1]:
            bic_orr_count += 1
    if bic_orr_count >= 2:
        walls.append(WallPrediction(
            "C-22",
            f"{bic_orr_count} adjacent `bic`/`orr` pairs — "
            "declare each window as a separate bitfield",
        ))

    # ----- C-15 flat-thunk arg-setup constant pair.
    has_mvn0 = any(
        re.search(r"mvn\s+\w+,\s*#0", line) for line in lines
    )
    has_mov_sub_pair = False
    for i in range(len(lines) - 1):
        if (
            re.search(r"\bmov\s+\w+,\s*#\d+", lines[i])
            and re.search(
                r"\bsub\s+\w+,\s*\w+,\s*#1", lines[i + 1],
            )
        ):
            has_mov_sub_pair = True
            break
    if has_mvn0 or has_mov_sub_pair:
        walls.append(WallPrediction(
            "C-15",
            "constant-pair (#K, ±1) via `mvn`/`mov-sub` — "
            "`.legacy.c` routing if orig has `mvn` form",
        ))

    # ----- C-1 predicated execution chain.
    cond_suffixes = (
        "eq", "ne", "cs", "cc", "mi", "pl", "vs", "vc",
        "hi", "ls", "ge", "lt", "gt", "le",
    )
    pred_run = 0
    max_pred_run = 0
    pred_re = re.compile(
        r":\t[0-9a-f]+ \t(\w+?)("
        + "|".join(cond_suffixes)
        + r")\b",
    )
    for line in lines:
        m = pred_re.search(line)
        if m and m.group(1) not in ("b", "bl", "blx", "bx"):
            pred_run += 1
            max_pred_run = max(max_pred_run, pred_run)
        else:
            pred_run = 0
    if max_pred_run >= 3:
        walls.append(WallPrediction(
            "C-1",
            f"{max_pred_run}-instruction predicated chain — "
            "pure pred-exec vs early-return ambiguity",
        ))

    # ----- P-9 missing mvn{cond} peephole.
    has_cond_mvn = any(
        re.search(
            r"\bmvn(eq|ne|cs|cc|mi|pl|vs|vc|hi|ls|ge|lt|gt|le)\b",
            line,
        )
        for line in lines
    )
    if has_cond_mvn:
        walls.append(WallPrediction(
            "P-9",
            "conditional `mvn{cond}` — mwcc 2.0 may not peephole; "
            "permuter via brief 098",
        ))

    # ----- P-11 mwcc 2.0 reg-allocator plateau (brief 200).
    #
    # Brief 198 ran permuter against 9 Cluster B + E picks. 5 of
    # the 9 plateaued in score 480-500 despite finding 3-5 source
    # variants each. Brief 200 codegen sweep identified the
    # mechanism: mwcc 2.0/sp1p5's reg-allocator picks different
    # callee-saved registers + addressing-mode strategies than
    # orig for functions in the 0x5c-0x74 size range that have:
    #
    #   - **Multi-callee-saved push** (3+ regs besides lr in
    #     `push {...}`) — the function holds multiple
    #     pointers/counts live across a call.
    #   - **Helper call in or after a loop body** (`bl` inside
    #     loop OR after the loop's epilogue) — forces register
    #     spill/preserve decisions.
    #   - **Multi-conditional control flow** (≥2 conditional
    #     branches `b{eq,ne,lt,...}`) — mwcc weighs predication
    #     vs branch-to-tail choices.
    #
    # Permuter mutates SOURCE-level constructs (variable renames,
    # type juggles, reorderings); the reg-alloc choice is
    # downstream of source — an mwcc internal decision based on
    # liveness analysis. Mutations don't reach it.
    #
    # **Recipe status: NONE** (permanent under current tools).
    # Brief 200 attempted `volatile`-qualified field reads as a
    # coercion to defeat CSE on the dual pool-load — shifted the
    # shape but didn't byte-match. Future briefs may discover a
    # source coercion that promotes this to C-N (precedent:
    # C-29 supersedes P-10).
    has_multi_callee_save_push = False
    for line in lines[:3]:
        # Objdump emits either `push {r4, r5, lr}` (modern) OR
        # `stmfd sp!, {r4, r5, lr}` (historical) depending on
        # version. Accept both.
        m = re.search(
            r"(?:stmfd\s+sp!,?\s*|push\s+)\{([^}]+)\}", line,
        )
        if m:
            regs = m.group(1)
            # Count callee-saved registers (r4-r11). lr is
            # universal; r4+ saved are the "this function holds
            # state live across calls" signal.
            callee_regs = sum(
                1 for r in (
                    "r4", "r5", "r6", "r7", "r8", "r9", "r10",
                    "r11", "fp", "sl",
                )
                if r in regs
            )
            if callee_regs >= 3:
                has_multi_callee_save_push = True
            break
    # Lines are already stripped + filtered by `":\t" in line`,
    # so disasm format is `<hex_addr>:\t<hex_word> \t<mnem>\t...`.
    # Match on `\tbl\b` (helper call) and `\tb<cond>\b` (cond
    # branch) which are the post-mnemonic markers.
    bl_count = sum(
        1 for line in lines
        if re.search(r"\tbl\b", line)
    )
    cond_branch_count = sum(
        1 for line in lines
        if re.search(
            r"\tb(eq|ne|cs|cc|mi|pl|vs|vc|hi|ls|ge|lt|gt|le)\b",
            line,
        )
    )
    # Function size from disasm-line count. Each non-pool line
    # is one instruction (4 bytes ARM). Pool words appear as
    # `<addr>:\t<hex>\t.word\t…` OR as decoded-as-instruction
    # garbage in -D binary mode; filter to the "mnemonic looks
    # like instruction" set via mnemonic class match.
    instr_lines = [
        line for line in lines
        if re.search(
            r"\t("
            r"add|sub|mov|mvn|mul|cmp|cmn|tst|teq|and|orr|eor|bic|"
            r"ldr|str|ldm|stm|push|pop|ldmfd|ldmia|ldmib|stmfd|stmia|stmib|"
            r"b|bl|bx|blx|bxj|"
            r"lsl|lsr|asr|ror|rrx"
            r")\w*\b",
            line,
        )
    ]
    size_bytes = len(instr_lines) * 4
    # Alternative B-24 signature: `push {r4, lr}` + `sub sp, #N`
    # for stack scratch (N >= 8) — a different reg-alloc shape in
    # the same plateau family. mwcc emits "useless register
    # spills" to the scratch slots (writes that are never read
    # back). 1 cond branch is enough on this path because the
    # spill pattern itself is the signal.
    has_stack_scratch = any(
        re.search(r"\tsub\s+sp,\s*sp,\s*#(8|16|2[04]|3[02])\b", line)
        for line in lines[:3]
    )
    plateau_main = (
        has_multi_callee_save_push
        and bl_count >= 1
        and cond_branch_count >= 2
    )
    plateau_alt_scratch = (
        has_stack_scratch
        and bl_count >= 1
        and cond_branch_count >= 1
    )
    if (
        (plateau_main or plateau_alt_scratch)
        and 0x5c <= size_bytes <= 0x74
    ):
        if plateau_main:
            cue_shape = (
                f"3+ callee-saved push + {bl_count} bl + "
                f"{cond_branch_count} cond branches"
            )
        else:
            cue_shape = (
                f"stack-scratch prologue + {bl_count} bl + "
                f"{cond_branch_count} cond branch(es)"
            )
        walls.append(WallPrediction(
            "P-11",
            f"size {size_bytes:#x} + {cue_shape} "
            "— mwcc 2.0 reg-allocator plateau (brief 200; "
            "permuter scored 480-500; no recipe yet)",
        ))

    # ----- C-31 mwldarm interwork veneer.
    #
    # Brief 191: 8-byte Thumb veneer OR 12-byte ARM trampoline
    # shape that mwldarm auto-emits for cross-mode / long-distance
    # calls. Recognition cues:
    #
    #   1. Thumb 8 B (2 disasm lines, force-thumb OFF — objdump
    #      decodes as ARM): first hex word matches `47184bXX`
    #      (= Thumb `4b XX 47 18` little-endian = `ldr r3, [pc, #N];
    #      bx r3`). XX = 0 for the canonical `[pc, #0]` form.
    #   2. ARM 12 B (3 disasm lines): first hex word matches
    #      `e59f.000` (= `ldr rN, [pc]`) AND second hex word
    #      matches `e12fff1.` (= `bx rN`).
    #
    # Both shapes end with a `.word target_va` literal whose value
    # determines whether the cross-mode/long-distance trigger
    # fires — we can't verify that from disasm text alone (no VA
    # info in --disassembler-options=binary output), but the
    # 8 B / 12 B + shim-bytes match is specific enough that
    # false positives are unlikely.
    hex_words = []
    for line in lines:
        m = re.search(r":\t([0-9a-f]{8})\s+", line)
        if m:
            hex_words.append(m.group(1))
    # 8-byte Thumb veneer: exactly 2 hex words, first matches
    # `47184bXX` (the `XX` is the pool-offset nibble).
    if len(hex_words) == 2 and re.match(
        r"^47184b[0-9a-f][0-9a-f]$", hex_words[0],
    ):
        walls.append(WallPrediction(
            "C-31",
            "Thumb 8-byte mwldarm interwork veneer (`ldr r3, "
            "[pc, #N]; bx r3; .word target`) — ship as `.s` with "
            "explicit `.thumb` directive per brief 191 recipe",
        ))
    # 12-byte ARM trampoline: 3 hex words, ldr [pc] + bx + .word.
    elif (
        len(hex_words) == 3
        and re.match(r"^e59f[0-9a-f]000$", hex_words[0])
        and re.match(r"^e12fff1[0-9a-f]$", hex_words[1])
    ):
        walls.append(WallPrediction(
            "C-31",
            "ARM 12-byte mwldarm trampoline (`ldr rN, [pc]; bx "
            "rN; .word target`) — ship as `.s` with explicit "
            "`.arm` directive per brief 191 recipe",
        ))
    # 12-byte Thumb veneer with 2-byte side-effect prefix:
    # 3 hex words, second word is the merged `bx r3` + `nop`
    # halfwords (= 0x46c04718 little-endian) — distinctive
    # enough to flag without ambiguity. The pre-store prefix
    # varies (strb / strh / str / mov), so we recognise via
    # the middle word rather than the first.
    elif (
        len(hex_words) == 3
        and hex_words[1] == "46c04718"
    ):
        walls.append(WallPrediction(
            "C-31",
            "Thumb 12-byte mwldarm veneer with side-effect "
            "prefix (`<prefix>; ldr r3, [pc, #4]; bx r3; nop; "
            ".word target`) — ship as `.s` with explicit "
            "`.thumb` directive per brief 191 recipe",
        ))

    # ----- C-37 bit-test / byte-zero check normalised to 0/1.
    #
    # Brief 214: the redundant-tail idiom:
    #
    #     mov  rD, rS, lsl #N         ; N = 24 (byte) or 31 (bit-0)
    #     movs rD, rS, lsr #N         ; mirror shift, set flags
    #     mov{cond}  rD, #1           ; cond is NE (returns 1 if set)
    #     mov{!cond} rD, #0           ;        OR EQ (returns 1 if zero)
    #     bx   lr
    #
    # mwcc 2.0/sp1p5 collapses `(x & 1) ? 1 : 0` to `tst r0, #1;
    # movne #1; moveq #0` — 1 instruction shorter, different shape.
    # The legacy tier (`mwcc 1.2/sp2p3`) doesn't have this peephole
    # and emits the orig shape from the source idiom
    # `unsigned t = (unsigned)(x << 31) >> 31; if (t != 0u) ...`.
    #
    # For the byte-zero (N=24) variant, mwcc 2.0 ALSO reaches the
    # orig shape from the same source pattern — only the bit-0
    # (N=31) variant triggers the peephole. So C-37 splits into
    # two sub-routes: N=31 -> `.legacy.c`; N=24 -> `.c` with the
    # specific shift-extract idiom (NOT `(x & 0xff) == 0`).
    #
    # Detection uses the hex_words list collected for C-31 and
    # matches on the function's TAIL (last 5 hex words):
    #
    #   - lsl #N word: 0xe1a00X80 where X = (N/2) & 0xf
    #     (N=24 -> 0xe1a00c00; N=31 -> 0xe1a00f80)
    #   - movs lsr #N word: 0xe1b00X20 (N=24) or 0xe1b00Xa0 (N=31)
    #     The bottom nibble (0x20 vs 0xa0) encodes the shift-type
    #     bits (01=lsr) + amount LSBs combined; we hard-code the
    #     two exact values rather than re-derive.
    #   - movne/moveq r0, #1 / r0, #0 in either polarity
    #   - bx lr (0xe12fff1e) as the very last word
    #
    # Scope: r0 only (all brief 213/214 picks use r0). Future
    # widening to other Rd registers when surfaced.
    C37_TAILS = {
        # (lsl_word, lsr_word, mov_first, mov_second): variant_label
        ("e1a00c00", "e1b00c20", "13a00001", "03a00000"):
            "byte-low extract, 1 if set",
        ("e1a00c00", "e1b00c20", "03a00001", "13a00000"):
            "byte-low extract, 1 if zero",
        ("e1a00f80", "e1b00fa0", "13a00001", "03a00000"):
            "bit-0 extract, 1 if set",
        ("e1a00f80", "e1b00fa0", "03a00001", "13a00000"):
            "bit-0 extract, 1 if zero",
    }
    if len(hex_words) >= 5 and hex_words[-1] == "e12fff1e":
        tail = tuple(hex_words[-5:-1])
        if tail in C37_TAILS:
            variant = C37_TAILS[tail]
            # Determine routing based on shift width
            shift_amt = 31 if "f80" in tail[0] else 24
            if shift_amt == 31:
                route = "`.legacy.c` (mwcc 1.2/sp2p3 — mwcc 2.0 " \
                        "peepholes this to `tst` shape)"
            else:
                route = "`.c` with `(unsigned)(x << 24) >> 24` " \
                        "idiom (mwcc 2.0 reaches; not the natural " \
                        "`(x & 0xff)` form)"
            walls.append(WallPrediction(
                "C-37",
                f"bit-test -> 0/1 idiom ({variant}) — {route}",
            ))

    # ----- C-38 leaf-no-pool reg-alloc + CSE divergence (brief 216).
    #
    # Brief 215 identified Wall 2 — small leaf functions doing
    # struct-field load/store where mwcc 2.0's reg-alloc + CSE
    # diverge from orig. mwcc 2.0 emits early-returns + CSEs the
    # repeated outer-pointer deref; orig has predicated execution
    # + keeps the second deref. Brief 216's variant matrix found
    # 4 of 7 canaries reach orig bytes byte-for-byte under
    # `mwcc 1.2/sp2p3` with substruct-ptr / char-cast / re-deref
    # recipes; the volatile sub-pattern reaches under mwcc 2.0 too.
    #
    # Detection cue: function has no pool reference (no `ldr rN,
    # [pc, ...]`), no callsite (`bl` / `blx`), >= 1 load OR store,
    # and ends in `bx lr` (0xe12fff1e). The combination separates
    # Wall 2 from C-31/32/24/etc. (which all involve pool or
    # cross-mode dispatch) and from leaf functions too simple to
    # exhibit the reg-alloc divergence (zero ld/st).
    #
    # Avoid double-fire: skip if C-37 already fired (the bit-test
    # tail is a more specific shape, takes priority for routing
    # recommendation).
    has_c37 = any(w.wall_id == "C-37" for w in walls)
    if not has_c37 and len(hex_words) >= 2:
        # Scan all hex words for pool / call / ld-st / final-bx.
        has_pool_load = any(
            re.match(r"^e59f[0-9a-f]{4}$", hw)
            or re.match(r"^e51f[0-9a-f]{4}$", hw)
            for hw in hex_words
        )
        has_call = any(
            # bl (any cond, including AL): bits 27-24 = 1011 ->
            # high nibble of byte at offset 3 has bit 1 set
            (int(hw, 16) & 0x0F00_0000) == 0x0B00_0000
            or (int(hw, 16) & 0x0FFF_FFF0) == 0x012F_FF30
            for hw in hex_words
        )
        n_ld_st = 0
        for hw in hex_words:
            w = int(hw, 16)
            # word ldr/str: bits 27-26 = 01 (single data transfer)
            if (w & 0x0C00_0000) == 0x0400_0000:
                n_ld_st += 1
                continue
            # halfword/byte extra ldrh/strh/ldrsb/ldrsh: bits 27-25
            # = 000, bit 7=1, bit 4=1, bits 6-5 = halfword/byte form
            if (w & 0x0E00_00F0) == 0x0000_00B0:  # ldrh/strh
                n_ld_st += 1
        ends_bx_lr = hex_words[-1] == "e12fff1e"
        if (
            not has_pool_load
            and not has_call
            and n_ld_st >= 1
            and ends_bx_lr
        ):
            walls.append(WallPrediction(
                "C-38",
                f"leaf-no-pool reg-alloc/CSE divergence "
                f"({n_ld_st} load/store, no pool, no call) — try "
                "`.legacy.c` with substruct-ptr / char-cast / "
                "re-deref recipe (brief 216 matrix)",
            ))

    return walls


_RELOC_RE = re.compile(
    r"from:0x([0-9a-f]+)\s+kind:(\w+)\s+to:0x([0-9a-f]+)\s+module:(\S+)",
)


def detect_cross_overlay_bl(
    relocs_text: str, addr: int, size: int,
) -> list[WallPrediction]:
    """C-32 detector — consults relocs.txt (NOT disasm) for
    `kind:arm_call to:<addr> module:none` entries falling inside
    the function's `[addr, addr+size)` range.

    Brief 192's recognition cue: dsd cannot pick the owning
    module for cross-overlay BLs targeting a multi-overlay
    shared-base address. The reloc kind is the only reliable
    disambiguator — bare `bl <hex>` shape alone appears for both
    resolvable and unresolvable cross-overlay BLs.

    Pure function: `relocs_text` is the file's full text, not a
    path; callers do the I/O. Returns an empty list when no
    `module:none` arm_call falls inside `[addr, addr+size)`.
    """
    hardcoded_targets: list[int] = []
    for line in relocs_text.splitlines():
        m = _RELOC_RE.match(line.strip())
        if not m:
            continue
        frm, kind, to, modu = m.groups()
        if kind != "arm_call" or modu != "none":
            continue
        f_addr = int(frm, 16)
        if not (addr <= f_addr < addr + size):
            continue
        hardcoded_targets.append(int(to, 16))
    if not hardcoded_targets:
        return []
    target_summary = ", ".join(
        f"0x{t:08x}" for t in hardcoded_targets
    )
    return [WallPrediction(
        "C-32",
        f"{len(hardcoded_targets)} cross-overlay hardcoded BL"
        f"{'s' if len(hardcoded_targets) > 1 else ''} "
        f"(target{'s' if len(hardcoded_targets) > 1 else ''}: "
        f"{target_summary}) — `kind:arm_call module:none` "
        "reloc; ship as `.s` with hand-encoded `.word` per "
        "brief 192 recipe",
    )]


def detect_address_cse(
    relocs_text: str, addr: int, size: int,
) -> list[WallPrediction]:
    """C-34 detector — consults relocs.txt for 2+ `kind:load`
    entries with the SAME `to:` target inside the function's
    `[addr, addr+size)` range.

    Brief 202: orig has TWO distinct pool slots holding the
    SAME data symbol address; mwcc 2.0/sp1p5's IR-CSE pass
    collapses them to one slot when compiling natural C
    source. Routing through `.legacy.c` produces a completely
    different shape. Recipe: ship as `.s` with explicit
    `.word` directives per pool slot — bypasses both mwcc's
    IR-CSE and mwasmarm's literal-pool dedup.

    Pure function — callers do the I/O. Returns an empty list
    when no duplicate-target loads fall inside the function's
    range.
    """
    targets_by_value: dict[int, list[int]] = {}
    for line in relocs_text.splitlines():
        m = _RELOC_RE.match(line.strip())
        if not m:
            continue
        frm, kind, to, _modu = m.groups()
        if kind != "load":
            continue
        f_addr = int(frm, 16)
        if not (addr <= f_addr < addr + size):
            continue
        targets_by_value.setdefault(int(to, 16), []).append(f_addr)
    duplicate_targets = [
        (val, slots) for val, slots in targets_by_value.items()
        if len(slots) >= 2
    ]
    if not duplicate_targets:
        return []
    summary_parts = []
    for val, slots in duplicate_targets:
        slot_addrs = ", ".join(f"0x{s:08x}" for s in slots)
        summary_parts.append(f"0x{val:08x} @ [{slot_addrs}]")
    return [WallPrediction(
        "C-34",
        f"{len(duplicate_targets)} address-CSE candidate"
        f"{'s' if len(duplicate_targets) > 1 else ''}: "
        f"{'; '.join(summary_parts)} — mwcc 2.0 will dedupe "
        "to 1 slot; ship as `.s` with explicit `.word` per "
        "pool slot per brief 202 recipe",
    )]


def detect_literal_tail_trim_trap(
    orig_last4: bytes,
    relocs_text: str,
    addr: int,
    size: int,
) -> list[WallPrediction]:
    """C-36 detector — literal-tail trim trap (brief 208).

    Detection signal: the function's last 4 bytes in orig binary
    encode a small literal (high byte == 0x00 → trailing 2 bytes
    are `0x00 0x00`), AND no relocation lands in those last 4
    bytes.

    Without brief 208's delinks-aware trim guard, such functions
    cannot be shipped as `.s` — the patcher's
    `trim_text_section_padding` shaves the last 2 bytes off the
    `.text` section (because the trailing zeros look like mwasm
    padding), cascading every downstream byte.

    Brief 204 fixed the relocation-tail case (last 4 bytes
    covered by a `.rel.text` entry → don't trim). Brief 208 fixes
    the literal-tail case (delinks declares the slot size →
    don't trim if mwasm emitted exactly that). This detector
    flags functions whose orig matches the literal-tail shape so
    decompers know to ship them under the brief 208 build (don't
    need to invent a workaround — the patcher handles it).

    Concrete picks brief 207's PR #660 surfaced as deferred for
    exactly this reason (all should fire C-36):
    - `main:func_02023478` (last `.word 0x7fff` → `ff 7f 00 00`)
    - `main:func_020212cc` (last `.word 0x618` → `18 06 00 00`)
    - `ov002:021aba60` (last `.word 0xffff` → `ff ff 00 00`)
    - `ov002:021d9828`, `ov002:0220eb00` (last `.word 0x868`)
    - `ov018:021ab1c4` (last `.word 0x1ff` → `ff 01 00 00`)

    Pure function. `orig_last4` is the function's tail bytes
    (typically obtained via `read_function_bytes(region, module,
    addr, size)[-4:]`). Returns `[]` when the literal-tail
    pattern doesn't fire.
    """
    if len(orig_last4) < 4:
        return []
    # Trailing 2 bytes must be 0x00 0x00 — that's what the trim
    # heuristic actually keys off. Equivalent to "high byte of
    # the LE 32-bit word is 0x00" plus "second-highest byte is
    # 0x00", which means the literal is < 0x00010000.
    if orig_last4[-1] != 0x00 or orig_last4[-2] != 0x00:
        return []
    # If a relocation patches any of the last 4 bytes, brief 204
    # already handles the case — no C-36 needed.
    last4_start = addr + size - 4
    for line in relocs_text.splitlines():
        m = _RELOC_RE.match(line.strip())
        if not m:
            continue
        frm = int(m.group(1), 16)
        if last4_start <= frm < addr + size:
            return []
    # Reconstruct the LE 32-bit literal value for the human-
    # readable cue.
    literal = int.from_bytes(orig_last4, "little")
    return [WallPrediction(
        "C-36",
        f"literal-tail trim trap — last pool word is `.word "
        f"0x{literal:x}` (no reloc on last 4 bytes; trailing "
        "`0x00 0x00` matches mwasm padding pattern). Brief 208 "
        "patcher guard suppresses the false-positive trim; ship "
        "as `.s` per brief 202 recipe — no workaround needed.",
    )]


def detect_routing_trilemma(
    walls: list[WallPrediction],
) -> list[WallPrediction]:
    """C-35 detector — composite over EXISTING wall predictions
    (brief 204).

    Fires when a function combines BOTH:
      - C-34 (address-CSE / duplicate pool ref), AND
      - C-23 (≥ 3 pc-relative loads + clustered or MMIO pool)

    The C-23 + C-34 stack is characteristic of "routing trilemma"
    picks where no single mwcc tier (`.c`, `.legacy.c`,
    `.legacy_sp3.c`) produces all of: orig's push list +
    duplicate pool ref + non-strength-reduced loop. Brief 204
    swept all 15 available mwccarm variants and confirmed none
    match. The recipe is the same as C-34 (pure `.s` with
    explicit `.word` pool slots) but the composite cue
    pre-routes the decomper away from the `.legacy.c` retry
    loop the C-23 + C-34 individual signals would otherwise
    suggest.

    Pure function: takes the OTHER detectors' output. Returns
    empty list when the composite signal doesn't fire.
    """
    ids = {w.wall_id for w in walls}
    if "C-23" not in ids or "C-34" not in ids:
        return []
    return [WallPrediction(
        "C-35",
        "C-23 + C-34 stack — routing trilemma "
        "(no mwcc tier matches all combined codegen walls); "
        "ship as `.s` per brief 204 recipe (extends C-34's "
        "`.s` recipe to multi-wall composites)",
    )]


# Brief 194: empirical size threshold above which a `.legacy.c`
# routed function triggers Cluster F's ov004 cascade (~+64 B per
# TU). PR #640 observed cascades on 0x68 and 0x6c picks but not
# on brief 190's 0x28..0x34 SNDi wrappers — set the threshold at
# 0x50 (rounded down conservatively).
LEGACY_C_CASCADE_SIZE_THRESHOLD = 0x50


def detect_legacy_c_cascade_risk(
    walls: list[WallPrediction],
    *,
    module: str,
    size: int,
) -> list[WallPrediction]:
    """C-33 detector — composite risk on top of an existing
    StyleA or C-15 prediction.

    A `.legacy.c` claim in `src/main/` for a function size above
    `LEGACY_C_CASCADE_SIZE_THRESHOLD` (= 0x50) triggers brief
    193's Cluster F cascade (every ov004 TU shifts uniformly by
    ~+64 B in the linker map, exceeding the old brief 180
    `MAX_SHIFT_BYTES = 4` cap). Brief 194's patcher fix unblocks
    the BUILD pipeline (per-section modal-deviation cap), but
    byte-matching the function itself may still need permuter
    work — surface the risk so the decomper plans accordingly.

    Triggers when:

    1. Function is in `main` (the cascade is specific to ARM9
       growth shifting ov004; `src/overlay*/` `.legacy.c` claims
       don't reproduce it).
    2. Function size > `LEGACY_C_CASCADE_SIZE_THRESHOLD`.
    3. At least one of `StyleA` or `C-15` is already predicted
       (those route through `.legacy.c`; the cascade is gated on
       routing tier, not the wall shape alone).

    Pure function: no I/O.
    """
    if module != "main":
        return []
    if size <= LEGACY_C_CASCADE_SIZE_THRESHOLD:
        return []
    legacy_routing_walls = {"StyleA", "C-15"}
    matched = [w.wall_id for w in walls if w.wall_id in legacy_routing_walls]
    if not matched:
        return []
    return [WallPrediction(
        "C-33",
        f"main function size 0x{size:x} + {'/'.join(matched)} "
        "wall(s) → `.legacy.c` routing would trigger Cluster F "
        "cascade (~+64 B ov004 TU shift). Brief 194 patcher fix "
        "unblocks the build pipeline; byte-match may still need "
        "permuter — plan accordingly.",
    )]


def _module_relocs_path(region: str, module: str) -> Path | None:
    """Map module → relocs.txt path. Mirrors `_module_text_base`."""
    if module == "main":
        return ROOT / f"config/{region}/arm9/relocs.txt"
    if module in ("itcm", "dtcm"):
        return ROOT / f"config/{region}/arm9/{module}/relocs.txt"
    if module.startswith("ov"):
        return (
            ROOT
            / f"config/{region}/arm9/overlays/{module}/relocs.txt"
        )
    return None


def predict_module(
    region: str, module: str,
    *, objdump: str = "arm-none-eabi-objdump",
) -> dict[str, list[dict]]:
    """Predict walls for every function symbol in `module`. Returns
    `{f"{module}:0x{addr:08x}": [{"id": ..., "cue": ...}, ...]}`.
    Functions with no detected walls are present with an empty
    list — callers can render "no wall predicted" cleanly.
    """
    if module == "main":
        sym_path = ROOT / f"config/{region}/arm9/symbols.txt"
    elif module in ("itcm", "dtcm"):
        sym_path = ROOT / f"config/{region}/arm9/{module}/symbols.txt"
    else:
        sym_path = ROOT / f"config/{region}/arm9/overlays/{module}/symbols.txt"
    if not sym_path.is_file():
        return {}
    symbols = parse_symbols_file(sym_path, module)
    # Brief 192 — load relocs.txt once per module for C-32
    # detection. If the file is missing (e.g. itcm/dtcm without
    # relocs), C-32 is skipped silently.
    relocs_path = _module_relocs_path(region, module)
    relocs_text = (
        relocs_path.read_text(encoding="utf-8")
        if relocs_path is not None and relocs_path.is_file()
        else ""
    )
    out: dict[str, list[dict]] = {}
    for s in symbols:
        if s.type != "function":
            continue
        if s.size <= 0:
            continue
        key = f"{module}:0x{s.addr:08x}"
        asm = disasm_function(
            region, module, s.addr, s.size, objdump=objdump,
        )
        walls: list[WallPrediction] = []
        if asm is not None:
            walls.extend(detect_walls(asm))
        if relocs_text:
            walls.extend(detect_cross_overlay_bl(
                relocs_text, s.addr, s.size,
            ))
            # Brief 202: C-34 address-CSE detector — same
            # relocs.txt source as C-32; orthogonal signal
            # (duplicate-target loads vs module:none calls).
            walls.extend(detect_address_cse(
                relocs_text, s.addr, s.size,
            ))
        # Brief 208: C-36 literal-tail trim-trap detector — reads
        # the function's last 4 bytes from the binary. If they
        # encode a small literal AND no reloc covers the tail,
        # the function would trip the brief 204 trim heuristic
        # without brief 208's delinks-slot-size guard.
        orig_bytes = read_function_bytes(
            region, module, s.addr, s.size,
        )
        if orig_bytes is not None and len(orig_bytes) >= 4:
            walls.extend(detect_literal_tail_trim_trap(
                orig_bytes[-4:], relocs_text, s.addr, s.size,
            ))
        # Brief 194: C-33 is a composite over the disasm-based
        # predictions, gated on module + size.
        walls.extend(detect_legacy_c_cascade_risk(
            walls, module=module, size=s.size,
        ))
        # Brief 204: C-35 is a composite over the wall set —
        # triggers on C-23 + C-34 stack (routing trilemma).
        walls.extend(detect_routing_trilemma(walls))
        out[key] = [
            {"id": w.wall_id, "cue": w.cue} for w in walls
        ]
    return out


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(
        description=(
            "Predict codegen-wall recognition cues for the EUR "
            "/ USA / JPN config's functions via ARM disasm. "
            "Brief 189 ships this for `next_targets.py` "
            "consumption."
        ),
    )
    ap.add_argument(
        "--version", required=True, choices=VALID_REGIONS,
        help="Region whose config + extract to scan.",
    )
    ap.add_argument(
        "--out", type=Path, default=None,
        help="Output JSON path. Defaults to "
             "`build/<region>/analysis/wall_predictions.json` "
             "when not given.",
    )
    ap.add_argument(
        "--module", default=None,
        help="If set, restrict to a single module "
             "(e.g. 'main', 'ov007'). Default: every module.",
    )
    ap.add_argument(
        "--address", type=lambda s: int(s, 16), default=None,
        help="If set with --module, predict for one function "
             "only and print the result to stdout.",
    )
    ap.add_argument(
        "--size", type=lambda s: int(s, 16), default=None,
        help="Function size (hex). Required with --address.",
    )
    ap.add_argument(
        "--objdump", default="arm-none-eabi-objdump",
        help="Path to ARM objdump binary.",
    )
    ap.add_argument(
        "--quiet", action="store_true",
        help="Suppress summary output (still writes JSON).",
    )
    args = ap.parse_args(argv)

    if shutil.which(args.objdump) is None:
        print(
            f"error: {args.objdump} not found on PATH. Install "
            f"arm-none-eabi-binutils (Homebrew: `brew install "
            f"arm-none-eabi-binutils`).",
            file=sys.stderr,
        )
        return 2

    if args.address is not None:
        if args.module is None or args.size is None:
            print(
                "error: --address requires --module and --size",
                file=sys.stderr,
            )
            return 1
        asm = disasm_function(
            args.version, args.module, args.address, args.size,
            objdump=args.objdump,
        )
        if asm is None:
            print(
                f"error: cannot disassemble {args.module} "
                f"0x{args.address:08x}",
                file=sys.stderr,
            )
            return 1
        walls = detect_walls(asm)
        # Brief 192 — also run the relocs-based C-32 detector.
        relocs_path = _module_relocs_path(args.version, args.module)
        relocs_text = ""
        if relocs_path is not None and relocs_path.is_file():
            relocs_text = relocs_path.read_text(encoding="utf-8")
            walls.extend(detect_cross_overlay_bl(
                relocs_text, args.address, args.size,
            ))
            # Brief 202 — C-34 address-CSE detector.
            walls.extend(detect_address_cse(
                relocs_text, args.address, args.size,
            ))
        # Brief 208 — C-36 literal-tail trim-trap detector.
        orig_bytes = read_function_bytes(
            args.version, args.module, args.address, args.size,
        )
        if orig_bytes is not None and len(orig_bytes) >= 4:
            walls.extend(detect_literal_tail_trim_trap(
                orig_bytes[-4:], relocs_text,
                args.address, args.size,
            ))
        # Brief 194 — C-33 risk composite.
        walls.extend(detect_legacy_c_cascade_risk(
            walls, module=args.module, size=args.size,
        ))
        # Brief 204 — C-35 routing-trilemma composite.
        walls.extend(detect_routing_trilemma(walls))
        for w in walls:
            print(f"  {w.wall_id}: {w.cue}")
        if not walls:
            print("  (no wall predicted)")
        return 0

    # Full-scan mode.
    if args.out is None:
        args.out = ROOT / f"build/{args.version}/analysis/wall_predictions.json"
    args.out.parent.mkdir(parents=True, exist_ok=True)

    all_modules = (
        [args.module] if args.module
        else ["main", "itcm"] + [f"ov{i:03d}" for i in range(24)]
    )
    predictions: dict[str, list[dict]] = {}
    for module in all_modules:
        mod_preds = predict_module(
            args.version, module, objdump=args.objdump,
        )
        predictions.update(mod_preds)

    with args.out.open("w", encoding="utf-8") as f:
        json.dump(predictions, f, indent=2, sort_keys=True)
        f.write("\n")

    # Summary line.
    from collections import Counter
    tally: Counter[str] = Counter()
    for walls in predictions.values():
        for w in walls:
            tally[w["id"]] += 1
    if not args.quiet:
        print(
            f"predict_walls: scanned {len(predictions)} functions; "
            f"wall tally:",
            file=sys.stderr,
        )
        for wall_id, count in tally.most_common():
            print(f"  {wall_id}: {count}", file=sys.stderr)
        print(f"wrote {args.out}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
