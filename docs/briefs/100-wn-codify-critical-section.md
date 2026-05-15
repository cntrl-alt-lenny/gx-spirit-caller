### cloud/wn-codify-critical-section-research

**Goal:** Two-part brief.

1. **Codify the W-N temp-register coercion recipe** that
   brief 098 surfaced via permuter (PR #494). The
   `func_ov000_021ac85c` recovery wasn't permanent — it
   was source-form-coercible all along; permuter just had
   to discover the right C source split. The recipe goes
   into `codegen-walls.md` as a new C-N entry so future
   single-region waves can apply it forward without
   needing permuter again.

2. **Continue medium-tier walls research** on the next-
   most-represented pattern in brief 097's 31-candidate
   residue: **critical-section nesting** (~8 of 31).
   Brief 099 closed the largest pattern (indirect-call,
   ~12 of 31, → C-24). Critical-section is next in
   sequence; brief 100 + later briefs work through the
   remaining patterns.

**Part 1: W-N codification (the smaller deliverable)**

Per brief 098 PR #494, the recovered recipe is:

```c
// Original (mwcc kept value in r0 throughout — wrong bytes):
p->f_98 = (p->f_98 | 0x4000000 & ~0xf80000) | 0x880000 | 0x8000000;

// Recipe (split into two statements — forces store-reload):
p->f_98 = p->f_98 | 0x4000000;        // SEPARATE write
p->f_98 = ((p->f_98 & ~0xf80000) | 0x880000) | 0x8000000;
```

**Mechanism:** mwcc 2.0 fuses adjacent bitfield-chain
operations into a single in-place register update when
the source-level expression is a single statement. The
two-statement split forces a memory writeback after the
first OR — matching orig's `orr r1, r0, #...; str; ldr;
bic r0, r1, #...` pattern.

**Codify as new C-25 (or next available C-N) entry:**

- Wall description: "store-reload pattern for bitfield-
  chain reg-alloc"
- Asm signature: orig emits `orr rN, rM, #imm; str rN,
  [...]; ldr rM, [...]; bic rM, rN, #imm2` (intermediate
  write to higher-N reg, store, reload, bic into lower-N
  reg from intermediate). mwcc 2.0 with single-statement
  source emits `orr rM, rM, #imm; bic rM, rM, #imm2` (in-
  place chain on lower-N reg).
- Recipe: split bitfield-chain expression into two
  statements. The intermediate write-back forces the
  reg-alloc pattern that matches orig.
- Worked example: brief 098 `func_ov000_021ac85c`
  (overlay 0).
- Per-PR cross-reference: brief 098 + (forward) any
  future wave that uses the recipe.

**Part 2: Critical-section nesting research (the larger
deliverable)**

Brief 097 identified ~8 of 31 candidates whose walls
involve critical-section nesting. Pattern shape:

```c
OS_DisableIrq();                  // enter critical
// ... data refs / struct field updates ...
OS_RestoreIrq();                  // exit critical
// ... more work, possibly touching same data refs ...
```

mwcc 2.0 reorders some data refs across the OS_Restore
preserve barrier — emits work-before-restore vs orig's
work-after-restore (or vice versa). Brief 097 example:
`func_020323f4` — combined indirect-call + critical-
section nesting.

**Method (per brief 099 / 084 / 088 pattern):**

1. **Enumerate critical-section candidates** in the
   brief 097 residue. Cross-reference brief 099's full
   list with the OS_DisableIrq / OS_RestoreIrq asm
   signature (paired `bl OS_DisableIrq` / `bl
   OS_RestoreIrq` calls within a single function).

2. **Pick the cleanest exemplar** — one with the
   minimum overlap with other walls (e.g. no indirect-
   call, no predicated cascade). Single-wall exemplars
   are best for codegen-sweep classification.

3. **5-6 source variants** of the critical-section
   pattern:
   - Helper-function extraction (`static inline void
     critical_body(state_t *p) { ... }`)
   - Explicit block-level scope
     (`{ OS_DisableIrq(); ...; OS_RestoreIrq(); }`)
   - `volatile` qualifier on the data refs
   - Reorder work statements before vs after
     OS_RestoreIrq
   - `asm volatile("" : : : "memory")` compiler-barrier
     between OS_Restore and post-work
   - C99 designated initializer for struct updates
     (instead of `p->f_X = ...`)

4. **15-SP boundary table** — current default
   (2.0/sp1p5) + 5 SPs × `.legacy.c` (1.2/sp2p3) + 5
   SPs × `.legacy_sp3.c` (1.2/sp3) + 5 SPs = ~90
   compiles for one exemplar.

5. **Classification:**
   - Byte-identical recovery → new C-N entry.
   - Close-but-not → P-N classification with asm
     discriminator.
   - All variants byte-diff → permanent for current
     source-form pipeline.

**Non-scope:**

- ❌ Running permuter against any critical-section
  candidate. That's a permuter brief, not a walls
  research brief.
- ❌ Indirect-call work — brief 099 covered the
  ~12-candidate slice.
- ❌ Predicated-cascade or pool-word patterns — defer to
  future brief 102+.
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- **Part 1:** new C-N entry in `codegen-walls.md` for
  the W-N store-reload pattern. Recipe section +
  worked example + asm signature.
- **Part 2:** ≥ 1 new codegen-walls entry (C-N or P-N)
  for the critical-section pattern. Codegen sweep
  matrix attached. 3+ brief-097 candidates cross-
  referenced as matching the wall's signature.
- Markdown lint clean.
- Research index regen current.

**Branch:** `cloud/wn-codify-critical-section-research`

**Priority:** MEDIUM. Decomper brief 101 (C-24 recipe
application) is the higher-leverage immediate move.
Brief 100 runs in parallel; W-N codification unlocks
future wave application, critical-section research
feeds brief 102+ candidate selection.

**After this brief lands:**

1. **W-N recipe applied forward** — brief 101 + any
   future single-region wave checks for the W-N asm
   signature and applies the split-statement recipe.
2. **Critical-section recipe (if found)** — brief 102
   candidate: single-region wave applying it to the ~8
   medium-tier residue candidates that match the
   signature. If P-N classified, brain's selection rule
   adds the asm discriminator to the skip-list.
3. **Predicated cascade (next pattern, ~6 of 31)** —
   queued for brief 103 if pool depth justifies after
   brief 102 lands.
