### decomper/c24-recipe-wave-1

**Goal:** Apply brief 099's **C-24 (indirect-call + pool-
dedup, `.legacy_sp3.c` routing)** recipe to wave 1 of the
49-candidate cross-corpus pool. This is the first
production application of the **third routing tier** —
brief 044 anticipated mwcc 1.2/sp3 routing two months
back; brief 099 confirmed it, brief 101 ships matches.

**Context — what brief 099 codified:**

Per PR #495's C-24 entry in `docs/research/codegen-
walls.md`:

- **Wall signature:** indirect-call (`blx rN`) dispatch
  with ≥ 2 LDR-from-pool loading the same target address
  AND `push {lr}; sub sp, #4` / `add sp, #4; pop {pc}`
  prologue/epilogue.
- **Recipe:** route the TU via `*.legacy_sp3.c` (mwcc
  1.2/sp3) AND use a **single source-level identifier**
  for both call-site references. Two separate `extern
  T *foo; extern T *bar;` declarations at the same
  address fail (the pool-dedup peephole only fires when
  the source identifier is the SAME).
- **Worked example:** `func_02048c28` (verified byte-
  identical at 0x40 vs orig at 0x40).
- **Discriminator triangle:** C-15 (`.legacy.c`) / C-23
  (`.legacy.c` dual peephole) / C-24 (`.legacy_sp3.c`).
  Use brief 099's asm-signature decision rules to pick
  the right routing.

**Candidate pool (per brief 099 cross-corpus survey):**

- **49 total** candidates matching the C-24 asm
  signature (size 0x20-0x100).
- **3 strict-signature matches** (prologue/epilogue
  exactly `push {lr}; sub sp, #4` / `add sp, #4; pop
  {pc}` — highest confidence):
  - `func_020454cc` (0x24, 9-insn skeleton)
  - `func_0205d5a0` (0x28, 10-insn variant)
  - `func_02048c28` (0x40, brief 099 worked example —
    use as recipe-template reference but the function
    is ALREADY matched in this brief's PR)
- **46 broader candidates** with varied prologue
  (`push {r4, lr}` for callee-save register caching,
  etc.). Recipe should still apply per brief 099's
  analysis but verify per candidate.

**Method:**

1. **Wave 1 selection: 10-15 candidates.** Prioritize:
   - All 3 strict-signature matches (drop
     `func_02048c28` since it's already in tree —
     leaves `func_020454cc` + `func_0205d5a0`).
   - Pick 8-13 from the broader 46 in size band
     0x20-0x60 (smaller = faster iteration; brief 099's
     worked example was 0x40).
   - Skip P-class and other-wall asm signatures
     (existing skip-list).

2. **Per-candidate workflow:**

   ```bash
   # 1. Write the source using single-global identifier:
   #    extern T *g_addr = (T *)0x021bxxxx;
   #    fn(g_addr); fn(g_addr);   // SAME identifier both times
   # 2. Save as src/main/func_02xxxxxx.legacy_sp3.c
   # 3. Add TU claim to config/eur/arm9/delinks.txt
   # 4. ninja rom
   # 5. ninja objdiff && python tools/progress.py
   ```

3. **Per-byte-identical recovery:** commit the TU.
   Per-byte-diff: investigate whether the candidate's
   shape needs a C-24 sub-variant (e.g. callee-save
   reg-cache prologue) or whether it's actually a
   different wall.

4. **Wave cadence:**
   - Wave 1: 10-15 candidates. Self-extend gate applies.
   - Wave 2/3: if yield ≥40% + bytes ≥250, run another
     wave from the remaining 46-candidate pool.
   - Cap at 3 waves.

5. **Apply forward — other recipes are still in play.**
   If a candidate matches C-22 / C-23 / W-N (brief 098)
   / etc., apply those recipes too. The C-24 recipe is
   what THIS brief targets, but the candidate's actual
   wall combo may need multiple recipes layered.

**Skip-list (unchanged from prior briefs):**

- **P-N** (signed-modulo peephole) — asm signature `mov
  rN, lsr #31; rsb rM, ..., lsl #27; add ..., ror #27`.
- **P-4 family** (reg-alloc swap) — asm signature `mov
  r5, r0; mov r4, r1` (lower-N reg from later arg).
- **All P-1..P-8** classified walls (the existing
  permanent-walls catalog).

**Non-scope:**

- ❌ Cross-region apply for the new wave (await wave 2/3
  + pool accumulation — likely brief 103 or later).
- ❌ Critical-section / predicated-cascade candidates
  from brief 097 residue (those are cloud brief 100 +
  later research scope).
- ❌ Running permuter — brief 098 + 099 already
  validated the tools; this brief is source-form recipe
  application.
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- ≥ 5 EUR matches in wave 1.
- ≥ 40% yield, ≥ 250 bytes (self-extend gate).
- All 3 regions stay at 24/27 baseline.
- Per-wave PR with funnel + per-candidate (recovered /
  not) table + cycle-cost-of-recipe notes.
- New EUR matches accumulate for future cross-region
  apply.

**Branch:** `decomper/c24-recipe-wave-1`

**Self-extend clause:** Same as briefs 081 / 086 / 092 —
up to 2 follow-up waves if gate is met. Cap at 3 waves
total. Mid-band yields (40-60%) trigger 1 follow-up;
high yields (≥70%) trigger 2.

**After this brief lands:**

1. **High yield (≥ 60%):** chain extends, possibly
   absorbing most of the 49-candidate pool. Brief 103
   queued as cross-region apply wave for the new
   matches.
2. **Mid yield (40-60%):** wave 1 + 1 follow-up. Brief
   102 candidate: next-pattern walls research (critical-
   section, predicated cascade, etc.) closes the medium-
   tier residue.
3. **Low yield (< 40%):** chain closes at wave 1. The
   broader 46-candidate pool wasn't tractable with the
   strict C-24 recipe — likely needs sub-variants
   (callee-save prologue family). Hand back to brain
   for re-scoping.
