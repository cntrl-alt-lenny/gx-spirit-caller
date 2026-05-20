# ov004 `.rodata` MEDIUM-cohort spot-disassembly

**Brief:** 156 part 2 (cloud autonomous research). Spot-checks
8 candidates drawn from brief 154's 606-symbol MEDIUM cohort to
recalibrate the prologue-match heuristic's hit rate after the
`0x021e2efc` worked-example fell to brain's verify-gate.

## TL;DR

| Verdict | Count | %  |
|---|---:|---:|
| **PASS** (coherent ARM code with prologue + body + epilogue OR thunk pattern) | 6 | 75% |
| **AMBIGUOUS** (bytes coherent, but the kind-flip alone broke SHA1 in brief 154) | 1 | 12.5% |
| **FAIL** (bytes are data; only disassemble as nonsense / single conditional NOP) | 1 | 12.5% |

**6/8 PASS rate on coherence alone (≥ 70%) puts the cohort in
the brief's "cautious reclassification" category** — but the
`0x021e2efc` AMBIGUOUS case is the critical caveat: bytes
coherent **is necessary but not sufficient**. brief 154's
verify-gate falsification stands as the cohort-wide warning.
Any reclassification brief must include both byte-coherence
AND a per-candidate SHA1 round-trip.

## Method

For each candidate:

1. Read 64 bytes (16 ARM instructions) starting at the
   candidate's VA from `extract/eur/arm9/arm9_ov004.bin`
   (ov004 load address = `0x021c9d60`).
2. Disassemble via `arm-none-eabi-objdump -D -b binary -m arm`
   with `--adjust-vma` set to the candidate VA so branch
   targets are absolute.
3. Inspect for ARM-function coherence (per the canonical
   shapes brief 057-112 codified):
   - **Prologue**: `STMFD sp!, {…, lr}` / `push {…, lr}` /
     `sub sp, sp, #N` immediately after.
   - **Body**: plausible register use (no obviously bogus
     instructions like conditional flag-only ops mid-stream);
     `ldr`/`str` patterns; `bl` to addresses inside ov004
     code; comparisons before branches.
   - **Epilogue**: `LDMFD sp!, {…, pc}` / `pop {…, pc}` /
     `bx lr` (with optional `add sp, sp, #N` before).
   - **Embedded literal pools**: words following the epilogue
     that disassemble as `.word <addr>` (the address being
     loaded by `ldr rN, [pc, #M]` in the body).

4. Verdict:
   - **PASS** — coherent function (prologue + body + epilogue),
     OR coherent thunk (`ldr r12, [pc, #N] ; bx r12`),
     OR coherent function body that doesn't complete within
     64 B but has unambiguous prologue + meaningful subsequent
     instructions.
   - **AMBIGUOUS** — bytes look coherent but the worked example
     for this exact slot already failed the SHA1 verify-gate
     (so the cohort-level rule of "necessary but not sufficient"
     applies most loudly).
   - **FAIL** — bytes disassemble to data-shaped noise; not
     real code.

## Selection criteria

8 candidates picked from the 606-symbol MEDIUM cohort, sampled
to balance representativeness against signal:

- **5 STMFD-prefix candidates** (high half-word == `2d e9`):
  spread across the address range `0x021e2efc..0x02200b60` (the
  full extent of STMFD-prefix MEDIUM candidates — 409 of 606,
  67%). The prefix is the strongest single-word ARM-function
  signal; spreading the sample tests whether the signal is
  uniform across the address space or clusters in one band.
- **3 non-STMFD-prefix "control" candidates**: spread across
  `0x021e768c..0x02209a58` (the 197 of 606 MEDIUM candidates
  without the STMFD prefix). These test whether the structural
  fingerprint (single inbound `load` reloc whose `from:` is
  inside `.rodata`) catches non-prologue code (e.g. thunks,
  fall-through code without a prologue) — which would imply
  the heuristic's net is appropriately wide — or whether it
  catches data that has no business being there — which would
  imply false-positive contamination.

The first STMFD candidate is `0x021e2efc`, brief 154's
falsified worked example, included as a known-AMBIGUOUS control.

## Per-candidate report

### 1. `data_ov004_021e2efc` — AMBIGUOUS (known SHA1-fail per brief 154)

```text
First 4 bytes (LE): 30 40 2d e9 → e92d4030 = STMFD sp!, {r4, r5, lr}
```

Disassembly (first 16 instructions):

```text
021e2efc: e92d4030  push  {r4, r5, lr}
021e2f00: e24dd004  sub   sp, sp, #4
021e2f04: e59f00d0  ldr   r0, [pc, #208]   @ 0x21e2fdc
021e2f08: e3a01028  mov   r1, #40
021e2f0c: e5900000  ldr   r0, [r0]
021e2f10: e5d00009  ldrb  r0, [r0, #9]
021e2f14: e2800001  add   r0, r0, #1
021e2f18: ebfaa39a  bl    0x208bd88
021e2f1c: e59f20b8  ldr   r2, [pc, #184]   @ 0x21e2fdc
021e2f20: e3a01005  mov   r1, #5
021e2f24: e5923000  ldr   r3, [r2]
021e2f28: e5c30009  strb  r0, [r3, #9]
021e2f2c: e5920000  ldr   r0, [r2]
021e2f30: e5d00009  ldrb  r0, [r0, #9]
021e2f34: ebfaa3a9  bl    0x208bde0
021e2f38: e59f209c  ldr   r2, [pc, #156]   @ 0x21e2fdc
```

**Byte coherence:** unambiguous. Classic prologue (`push {r4,
r5, lr}; sub sp, sp, #4`), accessor pattern (load global,
read byte field +9, increment, call function), followed by
store-back via `strb` and second `bl` to a related address. All
`bl` targets land inside ov004's `.text` range. The two `ldr
[pc, #X]` instructions both reference `0x21e2fdc`, which is
inside `.rodata` 0x100+ bytes ahead — exactly the
"code-in-`.rodata` with embedded literal pool" shape brief 154
predicted.

**SHA1 verify-gate verdict (brief 154 PR #581):** **FAIL.**
Flipping the symbol kind from `data(any)` to `function(arm,
size=0x0, unknown)` shifted downstream bytes enough to break
EUR `ninja sha1` (`1da50df7…b4f75 → d83c6d20…fd3087`). No
source change, no byte change at this slot — but downstream
layout shifted via dsd's `lcf` re-emission rule for `function`
kind.

Verdict here: **AMBIGUOUS** at the byte-coherence layer (clearly
code); FAIL at the link-graph-safety layer (the only one that
matters for SHA1).

### 2. `data_ov004_021ea600` — PASS

```text
First 4 bytes (LE): 00 40 2d e9 → e92d4000 = STMFD sp!, {lr}
```

Disassembly:

```text
021ea600: e92d4000  stmfd  sp!, {lr}
021ea604: e24dd004  sub    sp, sp, #4
021ea608: e3a00002  mov    r0, #2
021ea60c: e3a01000  mov    r1, #0
021ea610: e3a02015  mov    r2, #21
021ea614: e3a03008  mov    r3, #8
021ea618: eb005189  bl     0x21fec44
021ea61c: e3a00000  mov    r0, #0
021ea620: e3a01015  mov    r1, #21
021ea624: eb005499  bl     0x21ff890
021ea628: e59f0008  ldr    r0, [pc, #8]    @ 0x21ea638
021ea62c: ebfff4c9  bl     0x21e7958
021ea630: e28dd004  add    sp, sp, #4
021ea634: e8bd8000  ldmfd  sp!, {pc}       ← epilogue
021ea638: 021ea5c4  ← literal pool: address loaded by ldr above
021ea63c: e92d4000  ← next function start
```

**Verdict: PASS.** Complete short function: prologue → set up
r0..r3 arguments → `bl` → re-set r0..r1 → `bl` → load constant
from PC-relative literal pool → `bl` → restore sp → epilogue.
Literal pool word at `0x021ea638` decodes as
`andseq r10, lr, #196` (data, since condition is `eq` and
operand combo is meaningless) — that's the `.word 0x021ea5c4`
the earlier `ldr r0, [pc, #8]` loads. Then a NEW function
starts at `0x021ea63c` with another canonical prologue.
Textbook code-in-`.rodata` shape.

### 3. `data_ov004_021f1b58` — PASS

```text
First 4 bytes (LE): 00 40 2d e9 → e92d4000 = STMFD sp!, {lr}
```

Disassembly:

```text
021f1b58: e92d4000  stmfd  sp!, {lr}
021f1b5c: e24dd004  sub    sp, sp, #4
021f1b60: eb001752  bl     0x21f78b0
021f1b64: e3a00008  mov    r0, #8
021f1b68: eb0033ce  bl     0x21feaa8
021f1b6c: e59f0008  ldr    r0, [pc, #8]    @ 0x21f1b7c
021f1b70: ebffd778  bl     0x21e7958
021f1b74: e28dd004  add    sp, sp, #4
021f1b78: e8bd8000  ldmfd  sp!, {pc}       ← epilogue
021f1b7c: 021f1b00  ← literal pool word
021f1b80: e92d4000  ← next function
```

**Verdict: PASS.** Same shape as candidate #2: short function
with prologue, two `bl`s, a load-then-call to `0x21e7958`, sp
restore, epilogue, literal pool word, next function. Note both
candidates #2 and #3 end their epilogue with a `bl 0x21e7958`
— that's likely a shared subroutine entrypoint in the same
`.rodata` region.

### 4. `data_ov004_021f94b0` — PASS

```text
First 4 bytes (LE): f0 41 2d e9 → e92d41f0 = STMFD sp!, {r4..r8, lr}
```

Disassembly:

```text
021f94b0: e92d41f0  push   {r4, r5, r6, r7, r8, lr}  ← bigger prologue
021f94b4: e24dd008  sub    sp, sp, #8
021f94b8: e59f10c8  ldr    r1, [pc, #200]
021f94bc: e1a04000  mov    r4, r0           ← save arg in callee-saved reg
021f94c0: e5910000  ldr    r0, [r1]
021f94c4: e28d2000  add    r2, sp, #0
021f94c8: e5900008  ldr    r0, [r0, #8]
021f94cc: e28d3004  add    r3, sp, #4
021f94d0: e3a01000  mov    r1, #0
021f94d4: eb001327  bl     0x21fe178
021f94d8: e59f60ac  ldr    r6, [pc, #172]
021f94dc: e59d1000  ldr    r1, [sp]
021f94e0: e1d600b8  ldrh   r0, [r6, #8]
021f94e4: e2811008  add    r1, r1, #8
021f94e8: e58d1000  str    r1, [sp]
021f94ec: e1510000  cmp    r1, r0
```

**Verdict: PASS.** Substantial function body (doesn't reach
epilogue within 64 B — too big). Prologue saves 6 registers
(consistent with deeper register pressure). Body: load global,
save first arg, load field+8 from a struct, set up two
stack-slot pointers + zero param, `bl`, load another global,
load + bump a stack value, halfword load + compare. All
register use makes sense; instruction stream parses cleanly.
This is a real function.

### 5. `data_ov004_02200b60` — PASS

```text
First 4 bytes (LE): 00 40 2d e9 → e92d4000 = STMFD sp!, {lr}
```

Disassembly:

```text
02200b60: e92d4000  stmfd  sp!, {lr}
02200b64: e24dd004  sub    sp, sp, #4
02200b68: e3a0c000  mov    r12, #0
02200b6c: e58dc000  str    r12, [sp]
02200b70: ebffffd7  bl     0x2200ad4
02200b74: e28dd004  add    sp, sp, #4
02200b78: e8bd8000  ldmfd  sp!, {pc}       ← epilogue
02200b7c: e92d40f0  push   {r4, r5, r6, r7, lr}  ← next function
02200b80: e24dd004  sub    sp, sp, #4
02200b84: e59f70b4  ldr    r7, [pc, #180]
02200b88: e1a06000  mov    r6, r0
02200b8c: e5970000  ldr    r0, [r7]
02200b90: e1a04306  lsl    r4, r6, #6
02200b94: e0802306  add    r2, r0, r6, lsl #6
02200b98: e5d21038  ldrb   r1, [r2, #56]
02200b9c: e3510000  cmp    r1, #0
```

**Verdict: PASS.** Tiny first function (4 instructions in
body: zero out a stack slot, call subroutine), proper epilogue,
then a second function starts immediately. The second function
opens with a classic `pc-relative load → indexed access → cmp`
pattern. Both functions are textbook ARM code.

### 6. `data_ov004_021e768c` — PASS (thunk)

```text
First 4 bytes (LE): 00 c0 9f e5 → e59fc000 = LDR r12, [pc]
```

Disassembly:

```text
021e768c: e59fc000  ldr    r12, [pc]      @ 0x21e7694
021e7690: e12fff1c  bx     r12             ← interwork branch
021e7694: 021ff8e4  ← literal pool: target address 0x021ff8e4
021e7698: e59fc004  ldr    r12, [pc, #4]  @ 0x21e76a4
021e769c: e3a01020  mov    r1, #32
021e76a0: e12fff1c  bx     r12
021e76a4: 021ff9a0  ← literal pool: target address 0x021ff9a0
021e76a8: e92d4000  stmfd  sp!, {lr}      ← next function
```

**Verdict: PASS.** Non-prologue pattern: this is a **thunk
sequence**. Two back-to-back `ldr r12, [pc, #N]; bx r12` blocks
(with intervening literal pool word and an arg-setup
`mov r1, #32` for the second thunk), then a normal function
follows.

The control sample CAUGHT real code without a prologue. That's
a useful finding: the structural fingerprint (single `load`
reloc from in-`.rodata`) flags non-prologue ARM code too, not
just prologue-bearing functions. Reclassification would need
to distinguish "thunk" from "function" — separate symbol kind.

### 7. `data_ov004_021f8874` — PASS (thunk)

```text
First 4 bytes (LE): 10 20 9f e5 → e59f2010 = LDR r2, [pc, #16]
```

Disassembly:

```text
021f8874: e59f2010  ldr    r2, [pc, #16]   @ 0x21f888c
021f8878: e59f1010  ldr    r1, [pc, #16]   @ 0x21f8890
021f887c: e5922000  ldr    r2, [r2]
021f8880: e59fc00c  ldr    r12, [pc, #12]  @ 0x21f8894
021f8884: e0821001  add    r1, r2, r1
021f8888: e12fff1c  bx     r12             ← interwork branch
021f888c: 02293c30  ← literal pool
021f8890: 000004c8  ← literal pool
021f8894: 021f7fa4  ← literal pool
021f8898: e59f2010  ldr    r2, [pc, #16]   ← next thunk
021f889c: e59f1010  ldr    r1, [pc, #16]
021f88a0: e5922000  ldr    r2, [r2]
021f88a4: e59fc00c  ldr    r12, [pc, #12]
021f88a8: e0821001  add    r1, r2, r1
021f88ac: e12fff1c  bx     r12
021f88b0: 02293c30  ← literal pool
```

**Verdict: PASS.** Another thunk pattern, this time with arg
marshalling (compute `r1 = *r2 + r1` before branching). Same
shape repeats verbatim at `0x021f8898` — clear marker of
auto-generated thunks (a vtable-style dispatch wrapper or
similar).

### 8. `data_ov004_02209a58` — FAIL (data, not code)

```text
First 4 bytes (LE): 80 20 00 00 → 0x00002080
```

Disassembly:

```text
02209a58: 00002080  andeq  r2, r0, r0, lsl #1   ← conditional NOP-ish
02209a5c: e92d4008  push   {r3, lr}              ← real prologue starts HERE
02209a60: e59f0014  ldr    r0, [pc, #20]
02209a64: ebff3af5  bl     0x21d8640
…
```

**Verdict: FAIL** (at the candidate's address). The byte word
`0x00002080` (= decimal 8320) disassembles to a conditional
`andeq r2, r0, r0, lsl #1` — a NOP-shaped instruction with
condition `eq` set on flags it never sets itself. Meaningless
as standalone code. The address `0x02209a58` is 4 bytes before
`.rodata`'s end (`.rodata` ends at `0x02209a5c` per delinks);
the byte word here is almost certainly a small constant (e.g.
`8192 + 128`) that lives just before the boundary.

Worth noting: the disassembler's NEXT instruction at
`0x02209a5c` IS a real prologue — but `0x02209a5c` is the start
of `.init` (per delinks), so the disassembly is correctly
showing `.init`'s entry point. `data_ov004_02209a58`'s slot
itself is data; the disassembly "looks like code" only because
of overrun into the adjacent `.init` section.

**Cohort interpretation:** the MEDIUM heuristic flagged this
slot because a single inbound `load` reloc from in-`.rodata`
points at it (probably a literal pool elsewhere that loads
`0x02209a58` as a constant). The bytes ARE valid data — the
constant `0x00002080`. The heuristic produced a false positive
for this candidate. About **1 in 8** of the spot-disassembled
candidates is a false positive of this shape — the
control-sample finding the brief asked us to flag.

## Hit-rate interpretation

Per the brief's interpretation table:

| Hit rate | Brief recommends |
|---|---|
| ≥ 70% PASS | Cautious reclassification brief |
| 30-70% PASS | Whole-region disassembly methodology |
| < 30% PASS | Pivot to ov002 reverse-lookup tool |

Spot result: **6/8 = 75% PASS at byte-coherence**.

The naive reading: "MEDIUM cohort is viable; cautious
reclassification brief next." But the AMBIGUOUS case
(`0x021e2efc`) is in that 75% **and known to fail SHA1**, so:

**The byte-coherence PASS rate alone is not the right metric.**
The right metric is the **SHA1-safety PASS rate** — what
fraction of byte-coherent candidates survive the
reclassification-then-SHA1-roundtrip cycle. brief 154 measured
that as 0/1 (the single tested candidate failed). Until that
gate is exercised at scale, the cohort's reclassification
viability is unknown.

What IS known after this spot-disasm:

- **The byte-coherence signal is real.** 6/8 candidates
  disassemble as actual ARM code (functions + thunks).
- **The cohort isn't dominated by false positives.** Only 1
  of the 3 non-STMFD-prefix controls was false-positive
  (`data_ov004_02209a58`). The other two non-prologue
  candidates turned out to be thunks (still real code, just
  not "functions" in the prologue sense).
- **The SHA1-layout problem brief 154 surfaced is a separate
  axis.** Even if every byte-coherent candidate IS code, dsd's
  `lcf` re-emission for `function(arm, unknown)`-kinded
  symbols can shift downstream bytes. Reclassification ≠
  byte-correctness.

## Brief 158+ hand-off

The brief's "after this brief lands" section asked brain to
choose between three follow-ups. Based on these findings:

1. **Cautious reclassification brief (preferred)** — but with
   a stricter gate than brief 154 used. The reclassification
   verify-gate needs to be exercised one candidate at a time
   against a binary search for which candidates DON'T break
   SHA1. Brief 154's 1-candidate sample size was insufficient
   to know if `0x021e2efc` was unusually layout-sensitive or
   if all 606 candidates would behave the same way. Picking
   2-3 candidates from this spot-disasm's PASS set (e.g.
   `0x021ea600`, `0x021f1b58`, `0x02200b60`) and individually
   running the kind-flip + SHA1 round-trip would calibrate
   the SHA1-safety PASS rate.

2. **Reverse-lookup tool for ov002 cross-overlay pointer
   targets (brief 150 funnel)** — orthogonal to whether the
   MEDIUM cohort is byte-coherent. Even at 100% byte-coherence
   PASS, if the reclassification ALSO breaks SHA1 every time
   (i.e. 0% SHA1-safety PASS), the reverse-lookup tool is the
   only path to identifying actual veneer-suppressor slots.
   Worth pursuing in parallel.

3. **Pivot to other clusters (D-3 / 30 KB mega-array /
   cross-region applies)** — also viable. Cluster B is
   effectively closed; ov004 cluster work is gated on either
   the reclassification SHA1-safety gate landing OR the
   reverse-lookup tool landing. Cluster D-3 and 30 KB
   mega-array can advance independently.

The spot-disasm doesn't decisively pick one path over the
others — it confirms the MEDIUM cohort's byte signal is real,
which keeps the reclassification path open. The
SHA1-safety gate is the next experiment that meaningfully
narrows the choice.

## Crucially, no reclassification in this PR

Per the brief's explicit instruction:

> Crucially: do NOT reclassify any symbols in this PR.

`config/eur/arm9/overlays/ov004/symbols.txt` is unchanged from
main. This is a research note + recipe-addendum PR only.

## Reproducibility

The candidate selection + disassembly is reproducible from a
fresh checkout of `main` via the steps in
[`ov004-rodata-misclassification-survey.md`](ov004-rodata-misclassification-survey.md#reproducibility)
plus this Python snippet for the 8-candidate disassembly:

```python
import subprocess, tempfile, os
from pathlib import Path

LOAD_ADDR = 0x021c9d60
data = open('extract/eur/arm9/arm9_ov004.bin', 'rb').read()

# 5 STMFD-prefix + 3 non-prologue controls
samples = [
    (0x021e2efc, 'data_ov004_021e2efc', 'STMFD (brief 154 falsified)'),
    (0x021ea600, 'data_ov004_021ea600', 'STMFD'),
    (0x021f1b58, 'data_ov004_021f1b58', 'STMFD'),
    (0x021f94b0, 'data_ov004_021f94b0', 'STMFD'),
    (0x02200b60, 'data_ov004_02200b60', 'STMFD'),
    (0x021e768c, 'data_ov004_021e768c', 'control (non-STMFD)'),
    (0x021f8874, 'data_ov004_021f8874', 'control (non-STMFD)'),
    (0x02209a58, 'data_ov004_02209a58', 'control (non-STMFD)'),
]

for addr, name, kind in samples:
    off = addr - LOAD_ADDR
    chunk = data[off:off+64]
    print(f'=== {name} @ 0x{addr:08x} ({kind}) ===')
    with tempfile.NamedTemporaryFile(suffix='.bin', delete=False) as f:
        f.write(chunk)
        tmp = f.name
    try:
        out = subprocess.run(
            ['arm-none-eabi-objdump',
             '-D', '-b', 'binary', '-m', 'arm',
             '--adjust-vma=0x{:x}'.format(addr), tmp],
            capture_output=True, text=True, check=True,
        )
        print(out.stdout)
    finally:
        os.unlink(tmp)
```

Selection methodology (5 STMFD spread + 3 control spread): see
the corresponding Python script in this note's git history /
the PR description.

## See also

- [`docs/research/ov004-rodata-misclassification-survey.md`](ov004-rodata-misclassification-survey.md)
  — brief 154's parent survey (606-candidate MEDIUM cohort
  catalog).
- [`docs/research/ov004-rodata-patcher-blocker.md`](ov004-rodata-patcher-blocker.md)
  — brief 145/146 patcher cluster shape detection.
- [PR #581](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/581)
  — brief 154's worked-example falsification + survey-only
  recovery.
- [PR #578](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/578)
  — original `0x021e2efc` veneer-suppression observation
  (`n: 9 → 2` claim drop) that motivated brief 154.
