### decomper/permuter-sweep-byte-diff

**Goal:** Run permuter (brief 063 / PR #473) against 8
candidates surfaced by recent waves. Brief 096 (PR #492)
just shipped the macOS wrapper, so `tools/permute.py --run`
works cleanly on a fresh worktree without manual setup.
This brief puts the tooling to work on real walls.

**Candidates — 8 total:**

**Group A: brief 094 byte-diff drops (3 candidates).** Small
leafs that compiled cleanly + linked but didn't byte-match
post-link. Classic permuter targets — reg-alloc divergence
in tight scopes, often crackable via permutation:

| Function | Size | Region | Notes |
|----------|-----:|--------|-------|
| func_020068d8 | 0x24 | EUR + USA + JPN | reg-alloc divergence (brief 094 funnel) |
| func_020331a4 | 0x14 | EUR + USA + JPN | small leaf, byte-diff |
| func_02052b50 | 0x10 | EUR + USA + JPN | small leaf, byte-diff |

**Group B: brief 097 dropped candidates (5 candidates).**
Varied walls — some shaped to permuter, some likely outside
the tool's reach:

| Function | Size | Wall (per brief 097) |
|----------|-----:|----------------------|
| func_02023fec | 0x38 | mwcc emits 1 pool word; orig has 2 (callee-save reg reservation) |
| func_020323f4 | 0x58 | indirect call (`blx r5`) + nested OS_Disable/Restore critical sections |
| func_0201a32c | 0x5c | predicated execution chain (`orrhi/lslls/orrls`) |
| func_0200b0c8 | 0x5c | P-4 reg-alloc swap — already classified permanent (brief 091 / 093) |
| func_ov000_021ac85c | 0x34 | W-N temp-reg choice (orig writes via r1, mwcc in-place via r0) |

**Likely permuter outcomes by candidate:**

- **Group A (3 small leafs)** — highest probability of
  recovery. Brief 093 demonstrated permuter explores reg-
  alloc + scheduling effectively; small leafs have small
  search spaces.
- **`func_020068d8`** — also worth trying since it's a
  cross-region wall (same byte-diff in EUR + USA + JPN).
  A recipe recovers 3 region-matches at once.
- **`func_ov000_021ac85c` (W-N temp-reg)** — moderate
  probability. Permuter can try different temp-register
  scopes; recovery would codify the W-N wall as coercible-
  with-tooling.
- **`func_02023fec` (pool-word count)** — moderate
  probability. Permuter may shake loose a callee-save
  pattern that emits 2 pool words; this is the kind of
  thing source-form authors can't easily control but
  permuter can stumble onto.
- **`func_020323f4` (indirect-call + critical-sections)**
  — low probability. Combinatorial wall.
- **`func_0201a32c` (predicated cascade)** — low
  probability. Branch-vs-pred-exec choice is usually
  upstream of permuter's domain (mwcc's IR decision).
- **`func_0200b0c8`** — **ZERO probability**, P-4 already
  ruled out by brief 093. Include as a control / sanity
  check that the wrapper still terminates cleanly.

**Method:**

1. **Per-candidate workflow:**

   ```bash
   python tools/permute.py <func_name> --run --max-seconds 300 --threads 4
   ```

   5 min wall-clock × 4 threads ≈ 1200 thread-iterations
   per candidate (brief 096 calibration: ~104 iter/30s on
   2 threads, scales linearly with thread count).

2. **Score-tracking:**
   - Baseline score = objdiff bytes-diff against orig.
   - Recovery = score 0 (byte-identical).
   - Plateau analysis: if score plateaus far from 0,
     document the divergence pattern (which insns / which
     regs) as the wall's calibration.

3. **Per-recovery:**
   - Commit the recovered `.c` file as a new TU.
   - Add to `config/eur/arm9/delinks.txt` (and USA/JPN if
     cross-region applicable).
   - Verify EUR `ninja rom` + `dsd check modules` 24/27.
   - Note the permuter cycle-cost (iterations to recover)
     for future calibration.

4. **Per-non-recovery:**
   - Note the score plateau + divergence pattern in the
     PR body.
   - For P-4 (`func_0200b0c8`) the expected result is
     "plateau at score N matching brief 091 reg-swap
     positions" — same as brief 093's `func_02000cc4`
     pattern.

5. **8-iteration sweep** — same wrapper, same parameters,
   one candidate at a time. Permuter is single-threaded
   at the candidate level (multi-threaded WITHIN a
   candidate). Total wall-clock budget: ~40min.

**Non-scope:**

- ❌ New permuter passes / features. Use the wrapper as-is.
- ❌ Walls research beyond per-candidate calibration. The
  31 medium-tier residue patterns are cloud brief 099's
  scope.
- ❌ Symbol-name promotions for the brief-094 undefined-
  callee drops (separate from byte-diffs).
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- ≥ 1 of 8 candidates recovered byte-identical.
- All 3 regions stay at 24/27 baseline.
- Per-candidate score plateau + cycle-cost documented
  in the PR body.
- Permuter wrapper validated on real walls (any
  termination + score progress counts, even non-
  recoveries).
- New `src/main/func_*.c` files for recoveries committed.

**Branch:** `decomper/permuter-sweep-byte-diff`

**No self-extend clause** — fixed 8-candidate sweep. If
results substantially better than expected (≥4 of 8
recovered), brain queues a brief 100 follow-up sweep
against a wider candidate pool. If 0 of 8 recover, brain
notes the calibration but doesn't queue a follow-up
permuter sweep without a specific candidate signal.

**After this brief lands:**

1. **≥ 1 recovery:** Permuter is production-ready for
   targeted wall-class investigations. Brief 100 candidate:
   permuter sweep against brief 091's P-N candidate
   (`func_02009758`) + similar P-N family.
2. **0 recoveries:** Permuter wrapper works (per brief 096
   end-to-end test) but these specific walls genuinely
   resist permutation. Brain's selection rule treats
   permuter as last-resort for matching, not a primary
   tool. Document the calibration.
3. **`func_020068d8` cross-region recovery:** if it
   recovers in EUR, brief 095's port_to_region D2 v2 +
   D3 automatically cross-applies it to USA + JPN — 3
   region-matches from one permuter recovery.
