### cloud/predicated-cascade-research

**Goal:** Run walls research on the **predicated-cascade
pattern** from brief 097's residue (~6 of 31 candidates).
Brief 099 closed the indirect-call wall (~12 of 31) →
C-24; brief 100 closed critical-section (~8 of 31) →
C-26. Predicated-cascade is the next-most-represented
pattern. Brief 084 / 088 / 099 / 100 methodology applies.

**Context — what the predicated-cascade pattern looks
like:**

Brief 097's example: `func_0201a32c` (0x5c). orig emits
4+ sequenced conditional ops (`movhi`, `lslls`, `orrls`,
etc.) where natural C `if`-chain emits branchy form.
Pattern shape:

```
cmp     rN, #imm
movhi   r0, #v1
movls   r0, #v2
strhi   r0, [rM]
strls   r0, [rN]
```

mwcc 2.0 with natural C (`if (a > imm) { ... } else
{ ... }`) emits:

```
cmp     rN, #imm
bls     .Lelse
mov     r0, #v1
str     r0, [rM]
b       .Lend
.Lelse:
mov     r0, #v2
str     r0, [rN]
.Lend:
```

— branchy form, not predicated-cascade. The wall is in
mwcc 2.0's IR-level decision to lower the if-chain as
branches vs. predicated ops.

**Candidate enumeration:**

Brief 097's funnel identified ~6 candidates matching the
pattern. Cloud's research can refine via asm scan for
the signature:

- ≥ 3 sequenced conditional ARM ops (any combination of
  `movXX / strXX / orrXX / bicXX / addXX / subXX` etc.).
- No intervening branch instruction between the cmp and
  the cascade.
- Single basic-block in the orig — no labels between cmp
  and final cascade op.

Use this filter on the 31-candidate medium-tier residue;
cross-reference with brief 097 + brief 100's NEGATIVE
finding list (rule out `func_02034754` /
`func_02095484` / `func_0208a684` / `func_02032e8c` —
those are critsec, not predicated cascade).

**Method (per brief 084 / 088 / 099 / 100 pattern):**

1. **Pick smallest single-wall exemplar** — one whose
   sole wall is the predicated cascade. Avoid candidates
   that combine predicated cascade with indirect call
   (C-24 territory), critical-section (C-26 territory),
   or other walls — single-wall exemplars are cleanest
   for classification.

   Best candidate from brief 097: **`func_0201a32c`**
   (0x5c, predicated execution chain `orrhi/lslls/orrls`).
   Cloud can pick a different one if the cross-corpus
   scan surfaces a smaller / cleaner exemplar.

2. **5-6 source variants** of the if-chain pattern:

   - **Natural** — `if (cond) { ... } else { ... }`.
   - **Ternary** — `var = cond ? a : b;` for each
     assignment (forces single-expression form).
   - **Boolean fan-out** — `var = a; if (cond) var = b;`
     (write-then-overwrite shape).
   - **Static inline predicate helper** — extract the
     predicate into a `static inline` fn that returns
     the value; let mwcc inline + predicate.
   - **Assignment via array index** —
     `vals[!cond] = ...; vals[cond] = ...;` (eliminate
     the branch via indexed write).
   - **`asm volatile` block** — last-resort escape
     hatch.

3. **15-SP boundary table** — current default
   (2.0/sp1p5) + 5 SPs × `.legacy.c` (1.2/sp2p3) + 5
   SPs × `.legacy_sp3.c` (1.2/sp3) + 5 SPs = ~75-90
   compiles for one exemplar.

4. **Watch for the NEGATIVE finding** per brief 100's
   critical-section pattern: some predicated-cascade
   candidates may byte-match natural form despite
   brief 097's classification. Try natural form at
   default mwcc 2.0/sp1p5 FIRST for each candidate
   before running the full sweep. Document any natural-
   form byte-identicals as the NEGATIVE counter-example
   to the wall.

5. **Classification:**

   - Byte-identical recovery → new **C-27** (or next
     available C-N) entry with recipe.
   - Close-but-not → **P-N** classification with asm
     discriminator.
   - All variants byte-diff across all SPs → permanent
     for current source-form pipeline. Permuter (brief
     096 wrapper) is the next-attempt path.
   - Some candidates byte-match natural form → NEGATIVE
     finding flagged.

6. **Wall family note:** Document in codegen-walls.md
   alongside C-24 / C-26 if the predicated-cascade
   recipe uses 1.2-tier routing; alongside C-25 if
   it's a pure source-form coercion at default SPs.

**Non-scope:**

- ❌ Applying any recipe — this is research only.
  Decomper applies via a future single-region wave.
- ❌ Pool-word count (~3 of 31) or cross-module BL (~3
  of 31) patterns — defer to future briefs.
- ❌ Running permuter — permuter is the fallback for
  candidates that this brief classifies as P-N. Brief
  098-style permuter sweeps are decomper-driven.
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- ≥ 1 new codegen-walls.md entry (C-N or P-N) for the
  predicated-cascade pattern.
- Codegen sweep matrix attached (75-90 compiles).
- 3+ brief-097 / cross-corpus candidates cross-
  referenced as matching the wall's signature.
- NEGATIVE finding flagged if any candidate byte-
  matches natural form.
- Markdown lint clean.
- Research index regen current.

**Branch:** `cloud/predicated-cascade-research`

**Priority:** MEDIUM. Decomper brief 102 (C-24 wave 2)
is the higher-leverage immediate move. Brief 103 runs in
parallel; if it surfaces a recipe, the next single-
region wave (brief 105 candidate or later) inherits it.

**After this brief lands:**

1. **Recipe found:** brain queues a single-region wave
   applying the recipe to predicated-cascade candidates
   in the medium-tier residue + cross-corpus survey.
2. **P-N classified:** permuter (brief 096 wrapper) is
   the next-attempt path. Brief 098-style sweep against
   the predicated-cascade candidates is queued as a
   follow-up.
3. **NEGATIVE finding:** some predicated-cascade
   candidates byte-match natural form → brief 097's
   classification was over-inclusive (again — same
   pattern as brief 100). Document the asm-grep
   discriminator for the actually-walled subset.
4. **Predicated cascade family-extension** — if the
   sweep reveals sub-patterns (e.g., 2-op vs 4-op
   cascade, signed vs unsigned predicate, register-
   width variants), classify as sub-letters (C-27a /
   b / c).
