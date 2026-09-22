### cloud/medium-tier-walls-research

**Goal:** Identify source-form recipes for the dominant
walls in brief 097's 31-candidate medium-tier residue.
Brief 097 wave 1 confirmed that the residual medium-tier
candidates are walled by combinations of indirect-call,
critical-section nesting, predicated-cascade, and (less
commonly) P-class shapes already classified. Codifying
even one new C-class recipe unblocks a meaningful slice
of the residue.

**Context — what brief 097 surfaced:**

Brief 097 (decomper, hand-back) surveyed 20 medium-tier
candidates, attempted 5, recovered 0. The dominant walls
classified across the 20-candidate survey:

| Pattern | Frequency (rough) | Brief 097 example |
|---------|------------------:|-------------------|
| **Indirect call** (`blx rN`) + struct-field callbacks | ~12 of 31 | `func_020323f4` |
| **Critical-section nesting** (OS_Disable + work + OS_Restore) with data-ref reorder | ~8 of 31 | `func_020323f4` |
| **Predicated cascade** (`movXX/strXX/popXX` chains) | ~6 of 31 | `func_0201a32c` |
| **Pool-word count mismatch** (callee-save reg reservation) | ~3 of 31 | `func_02023fec` |
| **Cross-module BL to unnamed addr** (e.g. 0x021b5500) | ~3 of 31 | (none attempted) |
| Other / overlap | balance | mixed |

(Frequencies are rough — cloud's research can refine via
the candidate pool's full classification.)

**Method (per brief 084 / 088 / 091 pattern):**

1. **Enumerate the 31-candidate residue.** Decomper's
   brief 097 funnel listed 5 attempted + 15 surveyed but
   skipped. Cloud reproduces the full list via
   `dsd report` filtering on medium-tier modules' unmatched
   functions. Cross-reference against brief 097's wall
   classifications.

2. **Pick the most-represented wall pattern.** Likely
   candidates (in priority order):

   - **Indirect-call callback dispatch** — ~12 of 31 is
     the largest single category. Recipe candidates:
     - C function-pointer syntax variants
     - Helper-function extraction (move the call-site
       into a static inline)
     - Struct-field declaration order changes
     - `volatile` qualifier on the callback field
     - Explicit `if (fn) fn(...)` null-check ordering

   - **Critical-section nesting with data-ref reorder** —
     ~8 of 31. Recipe candidates:
     - Explicit IRQ-disable scope (block-level
       `{ OS_DisableIrq(); ...; OS_RestoreIrq(); }`)
     - Helper-function extraction for the critical-section
       body
     - `volatile` on the data refs
     - Reordering work statements relative to OS_Restore

   - **Predicated cascade** — ~6 of 31. Recipe candidates:
     - Ternary chains vs `if`/`else` chains
     - Boolean-AND vs sequenced `if`-return
     - `static inline` predicate helpers

3. **Per-pattern codegen sweep** (per brief 084 / 088
   methodology):

   - **3-5 source variants** of the pattern.
   - **15-SP boundary table** — current default
     (2.0/sp1p5) + 5 SPs around it × `.legacy.c`
     (1.2/sp2p3) + 5 SPs × `.legacy_sp3.c` (1.2/sp3) +
     5 SPs = ~75 compiles per pattern.
   - **Score** = bytes-diff vs orig for each (variant, SP)
     pair.
   - **Recipe candidate** = the (variant, SP) that
     byte-matches OR is closest to 0.

4. **Classification:**
   - Byte-identical recovery → new **C-24** (or next
     available C-N) entry in `codegen-walls.md`.
   - Close-but-not-byte-identical → **P-N** entry with
     asm discriminator + closest-attempt score.
   - No coercion across all (variant, SP) attempts → mark
     as permanent for the project's default-tier pipeline.

5. **Document in codegen-walls.md** per the entry template:
   - Wall description + asm signature
   - Per-SP sweep matrix
   - Recipe (if found) with worked example
   - Per-PR cross-reference (brief 097 candidates that
     match this wall's signature)

**Non-scope:**

- ❌ Running permuter against the candidates. That's
  brief 098's scope (decomper, in parallel).
- ❌ Producing actual byte-identical `src/.../func_*.c`
  TUs. Recipe identification only; future single-region
  waves apply the recipe.
- ❌ Walls beyond the 31-candidate residue pattern set.
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- **At least 1 new codegen-walls.md entry** for the
  most-represented pattern (C-24 or P-N as appropriate).
- Per-pattern codegen sweep matrices for ≥ 1 pattern
  (75+ compiles).
- 3 brief-097 candidates cross-referenced as matching
  the wall's asm signature.
- Markdown lint clean.
- Research index regen current.

**Branch:** `cloud/medium-tier-walls-research`

**Priority:** MEDIUM. Decomper brief 098 (permuter
sweep) is the higher-leverage immediate move. Brief 099
runs in parallel; if it surfaces a recipe, the next
single-region wave (brief 101 candidate) inherits the
recipe + applies it to the residue.

**After this brief lands:**

1. **Recipe found:** Brain queues a brief 101 single-
   region wave applying the recipe to the medium-tier
   residue. Expected unlock: 3-8 ports per recipe.
2. **No recipe found, all P-N classified:** Brain's
   selection rule pre-skips the asm signature for the
   wall pattern. Permuter (brief 098 + future) becomes
   the only path for these candidates.
3. **Multiple patterns covered:** Brief 099 may run a
   sweep on the indirect-call pattern AND surface enough
   data on critical-section nesting to file a brief 100
   follow-up. Cloud's discretion on scope.
