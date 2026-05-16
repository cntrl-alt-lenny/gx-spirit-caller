### decomper/c27-application-wave-1

**Goal:** First production application of the **C-27
pool-word DUPLICATION recipe** (brief 107). Cloud's
codegen sweep found that two extern declarations
referencing the same address force mwcc 2.0/sp1p5 to
emit ONE pool word, matching orig's pool-dedup
behavior. ~80 candidate cross-corpus pool. Wave 1
targets 15-20 smallest candidates.

**Context — what brief 107 codified:**

Per brief 107 PR #506:

- **Wall signature:** Two `ldr rN, [pc, #X]` /
  `ldr rM, [pc, #Y]` instructions where X and Y point
  to the same address constant. orig emits 1 pool word
  (shared); mwcc default emits 2 separate pool words.
- **Recipe:** Declare two extern symbols at the C source
  level, both pointing to the same address. Add a
  `symbols.txt` alias entry naming the duplicate.
  Default mwcc 2.0/sp1p5 SPs (no routing tier change).
- **Worked example:** `func_02023fec` (0x38). Recipe in
  the codegen-walls.md C-27 entry.

**Recipe template (from brief 107):**

```c
extern void *data_X;
extern void *data_X_alias;         /* SAME address — see symbols.txt */
extern void Task_InvokeLocked(void *p);

int func_02023fec(void) {
    void * volatile *test_p  = (void * volatile *)&data_X;
    void * volatile *store_p = (void * volatile *)&data_X_alias;
    if (*test_p != 0) {
        Task_InvokeLocked(*store_p);
        *store_p = 0;
    }
    return 1;
}
```

Plus `config/eur/arm9/symbols.txt` addition:

```
data_X_alias        kind:bss addr:0x<same_address_as_data_X>
```

**Candidate pool (per brief 107 cross-corpus survey):**

- 157 duplicate-pool-pair occurrences across `relocs.txt`
- ~80 candidate functions matching the wall signature
- Brief 107 spot-check confirmed extension beyond
  `func_02023fec` (e.g., `func_02021158`) AND surfaced
  a SECOND wall in some candidates (range-check
  `cmp+cmpne` idiom — separate from C-27, may need its
  own classification)

**Wave 1 selection (15-20 candidates):**

1. **Enumerate the 80-candidate pool** via the cross-
   corpus duplicate-pool-pair scan. Brief 107's relocs.txt
   analysis is the starting point.
2. **Prioritize size band 0x20-0x60** — smaller iterates
   faster; brief 107's worked example was 0x38.
3. **Skip P-class candidates** per existing skip-list
   (P-N, P-4 family, P-9 mask form).
4. **Try natural form FIRST** per the 6-NEGATIVE-
   findings rule — some candidates may match without
   needing the alias entry.

**Method:**

Per-candidate workflow:

1. Identify the duplicate-pool target address (the
   address both LDR-from-pool instructions reference).
2. Determine if that address is already named in
   `symbols.txt`. If yes, use that name + add an alias.
   If no, name it via cross-overlay inspection first.
3. Write `.c` source with two extern declarations.
4. Add alias entry to `config/eur/arm9/symbols.txt`:
   `data_X_alias kind:bss addr:0x<same>`.
5. Add TU claim to `config/eur/arm9/delinks.txt`.
6. `ninja rom` + `ninja objdiff` + `dsd check modules`.
7. Verify byte-identical.

**Source-form refinements may apply** (per briefs
101+102+106):

- `volatile T *` qualifier on the pointer locals (brief
  107's recipe uses `void * volatile *`).
- `if (*test_p != 0)` predicate form vs `*test_p &&
  ...` (per brief 100 NEGATIVE finding, some
  candidates work natural-form).
- `static inline` helpers for complex dispatch logic.

**Self-extend clause:** Yield ≥ 40% AND bytes ≥ 250
triggers wave 2. Cap at 3 waves total.

**Non-scope:**

- ❌ Permuter sweeps. P-class candidates skip-listed.
- ❌ Walls research beyond C-27.
- ❌ T-4 (cross-module BL) symbol promotion — separate
  brief (110-or-later).
- ❌ Cross-region apply for new matches (await
  accumulation; brief 110+ candidate).
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- ≥ 10 EUR matches in wave 1.
- ≥ 40% yield, ≥ 250 bytes.
- All 3 regions stay at 24/27 baseline.
- Per-wave PR with funnel + per-candidate table flagging
  alias names + natural-form-first attempt outcomes.

**Branch:** `decomper/c27-application-wave-1`

**After this brief lands:**

1. **Strong wave 1 (≥ 60% yield):** wave 2 self-extends.
   ~60-65 candidates remain in pool; further waves
   absorb substantial fraction.
2. **Mid-band wave 1 (40-60%):** 1 follow-up wave. Brain
   queues brief 110 = either C-27 wave 2 OR T-4
   application (decomper symbol-promotion work).
3. **Weak wave 1 (< 40%):** chain closes. Investigate
   why — possible new wall family beneath C-27
   (e.g., the secondary `cmp+cmpne` range-check pattern
   brief 107 surfaced).
4. **Possible new wall datapoint:** brief 107 mentioned
   that `func_02021158` has a SECOND wall (range-check
   idiom) beyond C-27. If wave 1 surfaces ≥ 3 such
   candidates, document for cloud brief 111+
   classification.
