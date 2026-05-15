### cloud/mmio-base-folding-wall-sweep

**Goal:** Codify the **MMIO register-base folding wall** decomper
surfaced in brief 086 wave 1 (PR #474) on `func_0208bd88` and
`func_0208bde0` (DS hardware divider remainder + quotient). Run a
codegen sweep per brief 084's "3-walls-not-1" methodology lesson
to determine whether this is a **new wall (C-23)** or a
**sub-family of C-15** (mwcc-2.0 peephole avoidance via legacy-tier
routing). Capture the result in `docs/research/codegen-walls.md`
with the discriminator that future iterations grep against.

**Context — what the wall looks like:**

Two confirmed datapoints from brief 086 wave 1 (PR #474):

| Function | Size | Pattern |
|---|---|---|
| `func_0208bd88` | 0x58 | DS HW divider — return *remainder* (`.legacy.c` routed) |
| `func_0208bde0` | 0x58 | DS HW divider — return *quotient* (`.legacy.c` routed) |

Both touch four adjacent MMIO addresses in the DS divider register
block: `DIVCNT` (`0x04000280`), `NUMER` (`0x04000290`), `DENOM`
(`0x04000298`), `RESULT_QUOT` (`0x040002a0`) and/or `RESULT_REM`
(`0x040002a8`).

**Target asm (`func_0208bde0` quotient form, per PR #474):**

```text

ldr   ip, .L_DIVCNT             ; ip = 0x04000280
mov   lr, #0x0
ldr   r3, .L_NUMER              ; r3 = 0x04000290
strh  lr, [ip]
ldr   r2, .L_DENOM              ; r2 = 0x04000298
str   r0, [r3, #0x0]
str   r1, [r2, #0x0]
str   lr, [r2, #0x4]
.Lwait:
ldrh  r0, [ip]
ands  r0, r0, #0x8000           ; ANDS, not TST
bne   .Lwait
ldr   r0, .L_RESULT             ; r0 = 0x040002a0
ldr   r0, [r0, #0x0]
bx    lr
.L_DIVCNT:  .word 0x04000280
.L_NUMER:   .word 0x04000290
.L_DENOM:   .word 0x04000298
.L_RESULT:  .word 0x040002a0

```

18 insns + 4 pool words = 0x58. **Four separate** `ldr rN, .L*`
loads — one per MMIO register address.

**mwcc 2.0/sp1p5 emits when miscoded** (natural pointer-local form,
default routing):

```c
/* breaks: mwcc folds 4 addresses into 1 base + offsets — 14 insns + 1 pool, 0x38 */
int func_0208bde0(int numer, int denom) {
    vu16 *p_divcnt = (vu16 *)0x04000280;
    vs32 *p_numer  = (vs32 *)0x04000290;
    vs32 *p_denom  = (vs32 *)0x04000298;
    vs32 *p_result = (vs32 *)0x040002a0;
    *p_divcnt = 0;
    *p_numer  = numer;
    *p_denom  = denom;
    p_denom[1] = 0;
    while (*p_divcnt & 0x8000) ;
    return *p_result;
}
```

```text

ldr   r2, [pc, #0x28]           ; r2 = 0x04000280
mov   r3, #0
strh  r3, [r2, #0x0]            ; DIVCNT (offset 0)
str   r0, [r2, #0x10]           ; NUMER  (offset +0x10)
str   r1, [r2, #0x18]           ; DENOM  (offset +0x18)
str   r3, [r2, #0x1c]           ; DENOM+4
ldrh  r0, [r2, #0x0]
tst   r0, #0x8000               ; TST, not ANDS
bne   .L_wait
ldr   r0, [pc, #0x8]
ldr   r0, [r0, #0x0]
bx    lr
.word 0x04000280
.word 0x040002a0

```

14 insns + 2 pool = 0x38. Same semantics, **−0x20 bytes** vs.
target.

**`.legacy.c` routing (mwcc 1.2/sp2p3) verified byte-identical**
per PR #474's iteration win section. Two changes flip together:

1. The four-base load shape (`ldr r2, ..; ldr r3, ..; ldr r12, ..; ldr r0, ..`) instead of base+offset.
2. `ands` in the wait loop instead of `tst`.

`.legacy_sp3.c` (mwcc 1.2/sp3) **not yet tested** — decomper's PR
flagged that sweep as out-of-scope-for-the-wave and explicitly
noted "cloud may want to sweep `.legacy_sp3.c` for completeness".

**Why this brief exists (the brief 084 lesson):**

Brief 084's "3-walls-not-1" finding showed that **wall hypotheses
from N candidates should be confirmed by a codegen sweep, not by
symptom similarity**. The MMIO base-folding pattern has surface
similarity to **C-15** (mwcc-2.0 peephole avoidance via legacy-
tier routing for flat-thunk arg setup) but:

- C-15's specific peephole is *constant-pair derivation*
  (`mov r0, #K; sub r1, r0, #1` instead of `mov r0, #K; mvn r1, #0`).
- This pattern's peephole is *base-address dedup with offset
  selection* (four `(volatile T *)0xK` constants in nearby
  addresses → one `ldr base` + four offsets).

Both are mwcc-2.0-only peephole optimisations on constant
materialisation, both fixed by routing to mwcc 1.2/sp2p3 — but
without a codegen-machinery confirmation we don't actually know
whether they're the **same peephole** with two surface shapes, or
**two distinct peepholes** that happen to share the routing fix.

Per brief 084's methodology: **don't classify on symptom
similarity**. Run the sweep first.

**Distinct from prior walls:**

- **NOT C-15** (likely) — C-15's discriminator is `mov rN, #K`
  followed by an immediate-derivable second constant
  (`mvn` / `sub` / `add` peephole on register pair). This
  pattern's discriminator is **3+ separate `ldr rN, [pc, #...]`
  loads of nearby MMIO addresses**. The asm-level grep is
  completely different; the peephole-machinery may or may not
  overlap.
- **NOT P-1** (likely) — P-1 (shift-pair vs `and` collapse on
  halfword zero-extend) fires on every mwcc SP. The MMIO
  fold already has one negative datapoint vs P-1: mwcc
  1.2/sp2p3 does NOT fold per PR #474's verified
  byte-identical result.
- **NOT S-1** — no struct-decl involved; the C shape is
  pointer-locals to volatile MMIO. No padding / field-type
  authoring error.

**Method (codegen sweep — brief 084's Part 2 template):**

### Part 1 — Reproduce on the confirmed instances

Pick **`func_0208bde0`** (quotient form — slightly simpler than
remainder, no second `RESULT_REM` register). Confirm the
−0x20-byte size diff reproduces against `extract/eur/arm9/arm9.bin`
on the current main with the natural pointer-local source form.
Verify the `.legacy.c` routing produces 0x58 bytes byte-identical
to the target.

### Part 2 — C-variation sweep on default mwcc 2.0/sp1p5

Test **at least 5** source shapes; goal is to determine whether
the fold can be coerced out of mwcc 2.0 via C-source tweaks alone
or whether routing is the only path. Run each variation against
mwcc 2.0/sp1p5 default and capture the emit shape:

1. **Approach A: separate pointer-locals** (PR #474's natural
   form — known to fold; baseline).
2. **Approach B: hardcoded address constants per access**:

   ```c
   *(vu16 *)0x04000280 = 0;
   *(vs32 *)0x04000290 = numer;
   *(vs32 *)0x04000298 = denom;
   *(vs32 *)0x0400029c = 0;
   while (*(vu16 *)0x04000280 & 0x8000) ;
   return *(vs32 *)0x040002a0;
   ```

   mwcc may emit four separate `ldr` loads if it can't see the
   four constants are derived from a shared base.
3. **Approach C: register-block struct typedef**:

   ```c
   typedef struct {
       vu16 cnt; vu16 _pad; vs32 numer;
       vs32 denom; vs32 result_quot;
   } div_regs_t;
   ((volatile div_regs_t *)0x04000280)->numer = numer;
   ```

   Tests whether the fold is a *constant-pool dedup* peephole
   (would fire on B and C alike) or a *pointer-local CSE*
   peephole (would fire on A only).
4. **Approach D: GCC register storage class on the base**:

   ```c
   register vu16 *p_divcnt asm("r2") = (vu16 *)0x04000280;
   ```

   May force mwcc to keep each pointer-local in a separate
   register, defeating the fold.
5. **Approach E: `asm void` direct write of the prologue** (per
   C-12 / C-16's escape hatch) — known to work as a last resort
   but expensive in source-form cost; included for completeness
   if A-D all fold.

### Part 3 — SP sweep across all routing tiers

For the C variation that produced the cleanest byte-different
diff under 2.0/sp1p5 (likely Approach A — the natural form),
re-compile through:

| Routing | Compiler |
|---|---|
| Default | mwcc 2.0/sp1p5 |
| `.legacy.c` | mwcc 1.2/sp2p3 ← already verified by PR #474 |
| `.legacy_sp3.c` | mwcc 1.2/sp3 ← **explicit cloud TODO** per PR #474 |

Also re-run the full per-SP sweep across all 15 mwcc SPs (matching
C-15's per-SP discriminator table) to determine the **exact
mwcc-version boundary** where the MMIO fold appears. C-15's
boundary is "all `1.2/*` SPs emit direct, all `2.0/*` SPs emit
peephole"; verify whether this pattern has the same boundary or
a different one.

### Part 4 — Classification

Based on Part 2 + Part 3 results, decide between:

- **(a) New C-23 entry.** If the peephole machinery is distinct
  from C-15 (e.g. fires under different SP boundaries; responds
  to a different C-coercion knob), open a fresh entry with its
  own asm grep + discriminator. Add a wall-family note in *both*
  C-15 and C-23 entries that points cross-wise — same family
  shape (mwcc 2.0 peephole, fixed by legacy-tier routing), two
  distinct mechanisms.
- **(b) C-15 sub-family fold-in.** If the peephole machinery is
  the same as C-15 (e.g. identical SP boundary; same C-coercion
  knob fixes both), update the C-15 entry with a second-pattern
  sub-section ("C-15a flat-thunk arg setup" + "C-15b MMIO
  base-folding") and add the MMIO grep to the *Use when*
  section. Single entry, two surface shapes, same fix.
- **(c) Something else entirely.** If Part 3 surfaces an
  unexpected boundary (e.g. mwcc 1.2/sp3 ALSO folds; only sp2p3
  emits the un-folded form), document the actual machinery and
  pick the entry letter accordingly.

The **"3-walls-not-1" methodology** is what determines which
option lands. Symptom alone is not enough — the codegen-machinery
discriminator is what gets us to a clean classification that
future iterations can grep against.

### Part 5 — Update `codegen-walls.md`

Whichever option (a/b/c) the sweep settles on:

1. Add or update the entry near the existing C-N family. Use
   brief 084's C-22 entry as the template — *Target asm*,
   *mwcc emits when miscoded*, *C that coerces it*, *per-SP
   sweep table*, *use when*, *cross-corpus survey notes*.
2. If new C-23: add the wall-family note to BOTH C-15 and C-23
   entries pointing cross-wise. Include the asm-grep
   discriminator that lets future iterations pick the right
   entry without re-running the sweep.
3. Update the *Coercible-with-knowledge (NN patterns)* counter
   in the document header.
4. Add the per-PR drop cross-reference rows for `func_0208bd88`
   and `func_0208bde0` under brief 086 wave 1.

**Non-scope:**

- ❌ Modifying `port_external_source.py` to detect this pattern
  at port time — future tooling brief if MMIO ports turn out
  to be common in cross-project work.
- ❌ Decomper's wave 2 selection — that runs independently;
  this brief's recipe just lands in 086's apply-list once
  classified.
- ❌ Refactoring the existing C-15 entry's *Wall family note*
  (the C-15-vs-P-1 callout) unless the C-23 sweep proves it
  needs cross-linking — keep the diff surface small.
- ❌ AGENTS.md / state.md edits beyond codegen-walls.md +
  research-index regen.
- ❌ src/, libs/ edits (no actual match shipped here — that's
  86's wave 2 if the recipe needs verification beyond the
  PR #474 datapoints).

**Success:**

- `codegen-walls.md` carries either a new C-23 entry OR a C-15
  sub-family fold-in, with the discriminator + asm grep that
  lets future iterations classify a new instance without
  re-running the sweep.
- ≥ 1 of the 2 confirmed instances (`func_0208bd88` /
  `func_0208bde0`) reproducibly byte-identical under the
  documented recipe. PR #474 already verified `.legacy.c`
  works for the quotient case; this brief's sweep extends
  that to a per-SP table and confirms the `.legacy_sp3.c`
  case.
- Markdown lint clean. tools-index / research-index regen
  current.
- Decomper's next wave can grep the asm shape from
  `codegen-walls.md` and route correctly on first attempt
  for any future MMIO-block target.

**Branch:** `cloud/088-mmio-base-folding-wall-sweep`

**Priority:** HIGH-MEDIUM.

- *HIGH* because the MMIO fold likely surfaces at every register-
  block access target the corpus contains (DS has many memory-
  mapped I/O regions — graphics, sound, timer, interrupt
  controller — and any function that touches 3+ adjacent
  registers in one block hits this shape). Documenting the
  recipe before wave 2 unlocks that population.
- *MEDIUM* because PR #474 already shipped the recipe verbatim
  for the 2 confirmed instances. The brief codifies it; it
  doesn't unblock decomper from running wave 2 (decomper can
  already apply `.legacy.c` routing manually for MMIO targets
  via their PR #474 muscle memory).

**After this brief lands:**

1. Brain adds the C-23 / C-15-sub-family asm-grep to the
   brief 086 apply-list so wave 2+ pre-emptively routes MMIO
   targets through `.legacy.c` (or `.legacy_sp3.c` if the sweep
   surfaces that as the better tier).
2. Decomper's wave 2 selection rule extends to:
   "explicit byte-clone scan, AND any function touching 3+
   adjacent MMIO addresses → check the new C-N entry's recipe
   first".
3. If the sweep proves option (c) — different SP boundary
   than C-15 — brain considers whether brief 086's cap-raise
   should pivot to single-region-only-MMIO before pushing the
   cap further.

**Cross-reference:**

- Brief 084 — "wall hypotheses from N candidates should be
  confirmed by a codegen sweep, not by symptom similarity" (the
  3-walls-not-1 methodology lesson this brief operationalises).
- C-15 entry — the closest existing wall by symptom. The
  *Wall family note — C-15 vs P-1* in that entry is the
  template for the cross-link note this brief may produce.
- PR #474 wave 1 iteration notes — primary source for the
  MMIO base-folding observation; the recipe (`.legacy.c` mwcc
  1.2/sp2p3) is already verified for the quotient form.
