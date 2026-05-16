### cloud/p10-permuter-callee-save-research

**Goal:** Two parallel research strands; cloud picks
deliverable ordering.

**Part 1 — P-10 permuter sweep (longer timeout):**

Brief 109 classified P-10 (over-predication of short
tail vs early-return) as permanent for the source-form
pipeline; 75 compiles miss. Permuter is the next-
attempt path per brief 098's P-8 → C-25 + brief 105's
P-9 precedents.

**Pool:** ~36 cross-corpus P-10 candidates (per brief
109's note). Wave selection: 5-8 candidates from the
0x20-0x40 size band.

**Critical change from brief 105:** longer timeout.
Brief 105 used 300s × 4 threads = 1200 thread-iterations
per candidate; brief 109's worked example
(`func_02037b34` at 0x24) had best score 210 after
brief 105's permuter run — close-but-not. **Use
600s-1200s per candidate** (2-4× brief 105's budget).
Permuter throughput is ~200-230 iter / 60s / thread; a
4-thread × 1200s run = ~16000 thread-iterations.

**Workflow:**

```bash
# Per candidate:
python tools/permute.py <func_name> --run --max-seconds 1200 --threads 4
```

Recovery goal: ≥ 1 of the 5-8 attempted promotes P-10
→ C-N. Brief 105 vs brief 098 calibration suggests
permuter is better at reg-alloc walls (P-8) than IR-
lowering walls (P-9 / P-10). Both outcomes are useful:
recovery → C-N codification (brief 100 pattern); 0
recoveries → P-10 confirmed permanent at IR layer,
catalog discriminator final.

**Part 2 — Callee-save preservation walls research:**

Brief 108 (PR #509) flagged that ~5 C-27 candidates
were blocked by **callee-save preservation mismatch**:
mwcc 2.0/sp1p5 reloads from pool after `bl` rather than
spilling to callee-save r4 (or r4-r5 / r3-r4-r5).
Candidates affected:

- `func_0202a1cc`
- `func_020071c4`
- `func_02024024`
- `func_02024574`
- `func_0202a27c`

Plus 3 candidates with **loop scheduling divergence**
(Fill32 + slot-find-loop variants) — partially
overlapping with the callee-save set.

**Method (per brief 084 / 088 / 099 / 100 / 103 / 105
/ 107 / 109 pattern):**

1. **Cluster the candidates.** Likely two clusters:
   - Pure callee-save preservation (5 candidates).
   - Callee-save + loop scheduling (3 of the 5, plus
     possible additional).

2. **Pick smallest single-wall exemplar** from the
   callee-save cluster. Check candidate asm signatures
   to identify which has the cleanest wall.

3. **Codegen sweep** (5-6 source variants × 15 SPs ≈
   75-90 compiles):
   - Natural source.
   - Local variable to hold the pool-loaded value
     across the `bl` (force callee-save spill).
   - `register T x` hint.
   - `volatile` qualifier on the pool-loaded value.
   - `static inline` helper wrapping the `bl` to make
     spill behavior explicit.
   - C99 designated initializer for struct loads (if
     applicable).

4. **Try natural form FIRST** per the 6-NEGATIVE-
   findings + brief 108's INVERTED case rule
   (try natural even when the recipe seems mandatory).

5. **Classification:**
   - Byte-identical recovery → new C-N entry. Update
     brief 108's chain with a wave 2 follow-up if the
     recipe unblocks the 5 dropped candidates.
   - Close-but-not → P-N entry with asm discriminator.
   - All variants miss → permanent.

**Non-scope:**

- ❌ Running P-10 candidates with the new callee-save
  recipe (apply-wave brief, not research brief).
- ❌ C-27 wave 2 application (decomper-side, separate
  brief).
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- **Part 1 (P-10 permuter):** Per-candidate score
  plateau + cycle-cost documented. ≥ 5 candidates
  attempted with source baselines + 600s+ timeout each.
- **Part 2 (callee-save):** ≥ 1 new codegen-walls entry
  (C-N or P-N). Codegen sweep matrix attached.
- Markdown lint clean.
- Research index regen current.

**Branch:** `cloud/p10-permuter-callee-save-research`

**Priority:** MEDIUM. Decomper brief 110 (cross-region
apply wave 3) is the higher-leverage immediate move.
Brief 111 runs in parallel; outcomes feed brief 112+
scoping.

**After this brief lands:**

1. **P-10 recovery (≥ 1):** brief 112 codifies P-10 →
   C-N. Future single-region waves apply the recipe.
2. **P-10 confirmed permanent:** catalog discriminator
   final; no further P-10 permuter attempts. `asm void`
   + `nofralloc` is the last-resort path (per brief
   103's note).
3. **Callee-save recipe found:** brief 112 = brief 108
   wave 2 retry with the new recipe; unblocks the 5
   C-27 callee-save dropped candidates.
4. **Callee-save permanent:** the C-27 pool's effective
   size shrinks to ~70-75 candidates; future C-27 waves
   skip the callee-save signature pre-emptively.
