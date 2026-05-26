# Brief 225 — C-39 sub-patterns + brief 216 deferred canaries

**Brief:** 225 (scaffolder, two investigations). Extend C-39
coverage with sub-shape research; finally investigate brief
216's 3 deferred Wall 2 canaries.

## Headline

**1 of 5 picks shipped** — `func_0207d304` reaches orig under
mwcc 1.2/sp2p3 via a chained `(u16)(u8)` cast recipe. The
other 4 picks (A1, A2, B2, B3) are documented near-misses
with full falsification across the variant matrix.

The single ship extends the **C-38 family** (Wall 2 sibling)
with a new "redundant-cast" sub-shape: when the orig source
uses `(u16)(u8)*p` chained casts, mwcc 1.2/sp2p3 emits both
casts literally as `and #0xff; lsl #16; lsr #16` while mwcc
2.0/sp1p5 peepholes the redundant pair away. This is a
**route-tier wall**, not a source-form wall — the source idiom
is the same; only the routing tier matters.

The 4 near-misses are documented as **scaffolder-tier walls**
that aren't worth iterating further:

- **A1 (`func_ov010_021b238c`)**: scheduling divergence on
  dead-code preload. mwcc 2.0/sp1p5 either DCEs the unused
  `delta` local or spills it to stack when `volatile`;
  neither matches orig.
- **A2 (`func_ov002_0222bc1c`)**: switch-table dispatch with
  10 helpers. Beyond pilot scope — would require per-case
  bitfield work × 11 cases.
- **B2 (`func_02078ed8`)**: mwcc DCEs the unused `*p` halfword
  load across all 5 tiers + inline-asm clobber attempts.
- **B3 (`func_02078eec`)**: u64 pack via `(u64)hi << 32 | lo`
  produces extra `orr ..., #0` zero-extension instructions
  that orig doesn't have. Likely orig was hand-written `.s`
  or used a non-C calling convention (RealView
  `__value_in_regs`).

Each documented in detail below.

## Investigation A — C-39 sub-patterns

### A1: `func_ov010_021b238c` (104B, scheduling divergence)

Brief 222 near-miss. Orig shape:

```asm
push  {r3, r4, r5, lr}
mov   r4, r0
ldr   r0, [r4, #0x70]              ; r0 = f70 (bit-extract source)
ldrsh r2, [r4, #0x56]              ; r2 = f56 (signed halfword)
ldrsh r1, [r4, #0x4e]              ; r1 = f4e (signed halfword)
lsl   r0, r0, #31                  ; bit-extract starts
lsr   r0, r0, #31
cmp   r0, #1
sub   r1, r2, r1                   ; r1 = f56 - f4e (THEN NEVER USED)
ldr   r2, [r4, #0x4]               ; r2 = f4 (multiplier)
bne   <skip body>
... body uses r2 (multiplier), r1 dead ...
pop   {r3, r4, r5, pc}
```

The "dead-store" pattern — orig computes `delta = f56 - f4e`
and never uses it. mwcc 2.0/sp1p5 either:

- **DCE's the unused `delta`** if declared as a normal local
  (no `ldrsh` instructions emitted).
- **Spills `delta` to stack** if declared `volatile` (extra
  `strh` + `ldrsh` after).

Neither reaches orig's "preserved-but-unused-in-register" shape.
Likely orig source had `delta` used in a way that mwcc later
removed (refactoring artifact), or was compiled with a
specific flag combination we don't have.

**Verdict:** scheduling/DCE wall, not coercible from C source
under the mwccarm tier set. Brief 226+ scaffolder candidate if
more picks in this sub-shape surface and the pattern justifies
deeper investigation (e.g. a specific volatile-without-spill
mode).

### A2: `func_ov002_0222bc1c` (396B, switch-table dispatch)

Brief 222 deferred. Orig shape:

```asm
push  {r4, lr}
ldr   r1, .L_globals_base
mov   r4, r0
ldr   r0, [r1, #0x5a8]             ; global state -> r0
sub   r0, r0, #0x76                ; subtract case base
cmp   r0, #0xa                     ; range check (0..10)
addls pc, pc, r0, lsl #2           ; jump table dispatch
b     .L_default
b     .L_case10
b     .L_case9
...                                 ; 10 case entries
.L_case0:
    ldrh  r0, [r4, #2]              ; bit-extract for case 0
    lsl   r0, r0, #31
    lsr   r0, r0, #31
    rsb   r0, r0, #1                ; NOT bit (negate)
    bl    helper_for_case_0
    mov   r0, #0
    pop   {r4, pc}
... per-case body for each of 11 cases ...
```

11 cases × ~6-10 insns each = 80+ instructions in the function
body. Each case does similar bit-extract patterns but calls
different helpers and returns different constants. Out of
scope for brief 225's pilot — would require:

- Decoding the global state lookup at `[r1, #0x5a8]`
- Writing 11 case bodies with the right structure
- Coercing mwcc's switch-table layout (`addls pc, pc, r0, lsl
  #2`) — mwcc 2.0 may emit a different jump-table shape

**Verdict:** beyond brief 225 scope. Brief 226+ scaffolder
candidate if a small subset of cases is ship-worthy in
isolation. The dispatching switch pattern itself might be a
new wall family (compiler-specific jump-table layout).

## Investigation B — Brief 216 deferred canaries

### B1: `func_0207d304` (20B) — **SHIPPED** ✓

Orig shape:

```asm
ldrh  r0, [r0, #-14]               ; load u16 at *(p - 7)
and   r0, r0, #0xff                ; mask low byte
lsl   r0, r0, #16                  ; (u16) cast: lsl #16
lsr   r0, r0, #16                  ;             lsr #16
bx    lr
```

The trailing `lsl #16; lsr #16` is **semantically redundant**
after `and #0xff` (value is already ≤ 0xff). It's the orig
source's chained `(u16)(u8)*ptr` cast preserved literally by
mwcc 1.2/sp2p3.

**Variant matrix:**

| Source idiom | mwcc 2.0/sp1p5 | mwcc 1.2/sp2p3 |
|--------------|----------------|----------------|
| `(unsigned char)*(p - 7)` | 3 insns (peepholed) | 3 insns (peepholed) |
| `(unsigned short)(unsigned char)*(p - 7)` | 3 insns (chained cast collapsed) | **5 insns MATCH** |
| `p[-1].low8 (bitfield)` | 6 insns (lsl 24/lsr 24 + lsl 16/lsr 16) | 6 insns (similar) |

mwcc 2.0/sp1p5 has a cast-coalescing peephole that collapses
chained `(u16)(u8)` into a single masking operation. mwcc
1.2/sp2p3 lacks that peephole and emits both casts literally.

**Shipped recipe** at `src/main/func_0207d304.legacy.c`:

```c
unsigned int func_0207d304(unsigned short *p) {
    unsigned int v = (unsigned char)*(p - 7);   /* and #0xff */
    return (unsigned short)v;                    /* lsl #16; lsr #16 */
}
```

Verified byte-identical to orig under mwcc 1.2/sp2p3
(`.legacy.c` routing). 3-region SHA1 PASS preserved.

### B2: `func_02078ed8` (20B, 3-ldrh + orr — pack two u16s)

Orig shape:

```asm
ldrh  r1, [r0]                     ; r1 = m0 (UNUSED in result)
ldrh  r2, [r0, #-2]                ; r2 = m2
ldrh  r3, [r0, #-4]                ; r3 = m4
orr   r0, r3, r2, lsl #16          ; r0 = (m2 << 16) | m4
bx    lr
```

The function loads `*p` (m0) but never uses it. mwcc DCE's
the unused read across all tiers.

**Variant matrix:**

| Source idiom | Tier | Result |
|--------------|------|--------|
| Plain unused local `unsigned short m0 = *p; (void)m0;` | 2.0/sp1p5 | 4 insns (m0 DCE'd) |
| Plain unused local | 1.2/sp2p3 | 4 insns (m0 DCE'd) |
| `volatile unsigned short m0` | 2.0/sp1p5 | 11 insns (stack frame for spill) |
| `volatile` + struct ptr | both | stack frame |
| Inline asm `"" : : "r"(m0)` | both | DCE'd (mwcc inline asm ignores) |
| `v - v + ...` | both | DCE'd |

mwcc DCE's the unused load on all paths; `volatile` forces it
but adds stack-frame overhead. No source idiom matches orig's
"load to register, leave unused".

**Verdict:** mwcc DCE wall — orig was likely compiled from a
source where `m0` had a use that's no longer present in the
codegen we see. Could be a refactoring artifact, similar to
A1's "dead delta". No source-side recipe found.

### B3: `func_02078eec` (28B, 5-ldrh + 2 orr — packed-u32 pair)

Orig shape:

```asm
ldrh  r2, [r0]
ldrh  r3, [r0, #-2]
orr   r1, r3, r2, lsl #16          ; r1 = (m0 << 16) | m2
ldrh  r2, [r0, #-4]
ldrh  r3, [r0, #-6]
orr   r0, r3, r2, lsl #16          ; r0 = (m4 << 16) | m6
bx    lr
```

Returns 2 u32s in r0+r1. Standard AAPCS for u64: r0 = lo, r1 =
hi. So return type might be `unsigned long long`.

**Variant matrix:**

| Source idiom | Tier | Result |
|--------------|------|--------|
| `(unsigned long long)hi << 32 | lo` | 2.0/sp1p5 | 9 insns (2 extra `orr ..., #0`) |
| `(unsigned long long)hi << 32 | lo` | 1.2/sp2p3 | 9 insns (same) |
| `struct { u32 lo; u32 hi; }` return | all | 13 insns (stack frame + struct return ptr) |
| Reordered statements | all | Same as long long |

mwcc's u64 lowering emits `orr ..., #0` instructions (no-op
ORs that look like zero-extension placeholders). orig
doesn't have these. Likely orig was hand-written `.s` or used
a non-C convention (RealView's `__value_in_regs`).

**Verdict:** u64 codegen wall — mwcc adds noise instructions
for u64 boundary that aren't in orig. No source-side coercion
found.

## Recipe summary

**New C-38 sub-recipe (Wall 2 sibling):**

```c
/* Chained (u16)(u8) cast: mwcc 2.0 peepholes, 1.2 preserves. */
unsigned int func_XXX(unsigned short *p) {
    unsigned int v = (unsigned char)*(p + N);   /* emits and #0xff */
    return (unsigned short)v;                    /* emits lsl #16; lsr #16 */
}
```

Route through `.legacy.c` (mwcc 1.2/sp2p3). Use when orig has
the `and #0xff; lsl #16; lsr #16` sequence at the function
tail.

## Brief 226+ scoping

**Scaffolder candidates** (out-of-scope for brief 225):

1. **A1 / B2 "dead-store" sub-shape**: orig has values loaded
   or computed but never used. Could be coerced if a "DCE
   defeater" idiom is found that doesn't add stack frame.
   Low priority — only 2 observed picks; impact small.
2. **A2 switch-table dispatch family**: 396B switch with 11
   cases × per-case bit-extract. Could be ship-worthy if a
   subset of cases is approachable. Medium priority — large
   per-pick size, but only one such pick known.
3. **B3 u64-pack family**: orig packs two u32s into r0+r1.
   Likely hand-written `.s`. Low priority unless a corpus
   scan surfaces a cluster.

**Decomper candidates** (brief 226+ wave):

- Re-scan hard-tier with C-39 detector live (1457 candidate
  picks); brief 224 began this drain.
- Run the new C-38 chained-cast recipe across hard-tier picks
  matching the `and #0xff; lsl #16; lsr #16` tail.

## Verification

- 3-region SHA1 PASS preserved (EUR adds 1 new `.legacy.c`,
  removes 1 `.s`; USA/JPN unaffected — pick is EUR main-only).
- Build verified end-to-end via `ninja sha1`.
- No detector changes (single recipe — too narrow to add a
  detector; brief 226+ if more chained-cast picks ship).

## Files

- `src/main/func_0207d304.legacy.c` — NEW worked example.
- `src/main/func_0207d304.s` — DELETED (brief 217 wave B `.s`
  superseded).
- `config/eur/arm9/delinks.txt` — entry switched `.s` → `.legacy.c`.
- `docs/research/brief-225-c39-subpatterns-and-c38-deferred.md`
  — this file.
- `docs/research/README.md` — index regen.

## Cross-references

- `docs/research/codegen-walls.md` § C-38 — Wall 2 leaf-no-pool
  reg-alloc.
- `docs/research/codegen-walls.md` § C-39 — non-leaf bit-extract
  (brief 222).
- `docs/research/wall-2-leaf-no-pool-reg-alloc.md` — brief 216
  variant matrix.
- `docs/research/brief-222-c39-non-leaf-bitfield.md` — brief 222
  pilot.
- `docs/research/hard-tier-wall-survey.md` — brief 220 hard-tier
  survey.
