### cloud/odd-aligned-slot-recipe-research

**Goal:** Find a recipe that ships sub-2 ov004 `.rodata`
source claims at odd-aligned addresses cleanly. Brief 171
reached n=2 via multi-band-1 cascade; the remaining 2
veneers target loads inside odd-aligned containing symbols
(`data_ov004_021ded69` + `data_ov004_021e191c`). Brief 160
finding #4 documented that odd-aligned 4-byte claims shift
the veneer pool by 2 bytes → patcher contiguity fails.
This brief finds a Pattern 1 / Pattern 3 recipe that
sidesteps the cascade.

**Context — what brief 171 + 160 documented:**

Brief 171 (PR #608) shipped 5 band-1 claims dropping n=9
→ n=2. Finding #5:

> Sub-2 requires odd-aligned-slot recipe (brief 173+
> candidate). To drop below n=2: need to claim
> `data_ov004_021ded69` or `data_ov004_021e191c` (or any
> containing symbol of the load slots). Both are odd-
> aligned. Possible recipes to explore:
> - `__attribute__((aligned(1))) const unsigned char ...`
>   (untested for path-2)
> - mwasmarm `.s` with `.align 0` directive
> - Pattern 3 chunk including odd-aligned slot's
>   surrounding 4-aligned context

Brief 160 finding #4 (PR #592):

> `021e2b15` (addr % 4 == 1) claim shifted the veneer pool
> by 2 bytes → patcher contiguity check failed. Pattern 1
> `.c` form has no alignment-padding override; mwldarm
> places downstream sections aligned to the slot's natural
> 1-byte alignment.

The same finding bit brief 149's size-1 alignment attempt
on `data_021020b4` — brief 152 found that the bundle recipe
(force 4-byte alignment via grouping with neighbours)
sidesteps the cascade for that case. The path-2 odd-aligned
ov004 case may have analogous fixes:

- **Bundle recipe variant**: claim the odd-aligned slot as
  part of a 4-aligned containing chunk that includes
  surrounding zero-pad / neighbour bytes.
- **Pattern 3 chunk variant**: emit the odd-aligned slot as
  part of a multi-symbol `.s` chunk that explicitly handles
  the alignment via `.byte` / `.short` / `.word` directives.
- **`__attribute__((aligned(1)))`**: forces mwcc to emit at
  the natural alignment, possibly without padding cascade.

**Brief 173 deliverables — research, NOT scale-up:**

### Part 1 — Try each recipe variant on `data_ov004_021ded69`

Pick the smaller of the 2 odd-aligned candidates per brief
171 (021ded69's containing symbol is the smaller-pool option
based on brief 159's reverse-lookup table). For each variant:

1. **Variant A**: `__attribute__((aligned(1))) const
   unsigned char data_ov004_021ded69[N] = {0xAA, …};`
2. **Variant B**: mwasmarm `.s` with `.align 0`:

   ```asm
           .rodata
           .global data_ov004_021ded69
   data_ov004_021ded69:
           .byte 0xAA, ...
   ```
3. **Variant C**: Pattern 3 chunk via brief 125 generator
   covering the odd-aligned slot + its surrounding
   4-aligned context.

For each: claim, run `ninja sha1` per region, observe
veneer count + SHA1 outcome. Record PASS / FAIL with cmp
-l diff if FAIL.

**Do NOT keep the source claim — this is recipe research,
not scale-up.** Revert per per-claim SHA1 gate. The
deliverable is the LOCKED RECIPE, documented for brief
174+ decomper application.

### Part 2 — Document findings

Update `docs/research/ov004-rodata-pointer-targets.md` (or
sibling note) with:

| Variant | Recipe | Outcome | Notes |
|---|---|:---:|---|
| A | `aligned(1)` C | PASS / FAIL | … |
| B | `.s` + `.align 0` | PASS / FAIL | … |
| C | Pattern 3 chunk | PASS / FAIL | … |

If any variant PASSES, lock the recipe + cite brief 174+
hand-off. If all 3 variants FAIL, document the falsification
+ propose Variant D ideas (e.g., bundle recipe analog, LCF
script edit, patcher extension to handle 2-byte pool shift
at low n).

### Part 3 — Tests

Tooling-side regression tests if the recipe requires any
generator / patcher change. If pure source-level recipe
(no tool change), no new tests needed — the recipe
documentation is the deliverable.

**Required smoke test (cloud runs pre-PR, brain re-runs
pre-merge):**

- 3-region `ninja sha1` PASS preserved (current main, n=2
  — note: brief 171 left main at n=9 since claims were
  EUR-only).

  Actually wait — brief 171 KEPT 5 claims so main IS at
  n=2. Verify against post-brief-171 main state.
- All existing tests still green.
- Markdownlint clean on any new research notes.

**Non-scope:**

- ❌ Source-claim shipping (decomper brief 174+ owns
  scale-up if recipe locks).
- ❌ Path-1 reclassification (brief 156 risk caveats still
  apply).
- ❌ AGENTS.md / state.md beyond research notes.

**Success:**

- ≥ 1 odd-aligned recipe variant tested empirically.
- Findings documented (PASS recipe locked, OR all FAIL
  with Variant D proposals).
- 3-region SHA1 PASS preserved on current main.

**Branch:** `cloud/odd-aligned-slot-recipe-research`

**Priority:** MEDIUM. Research-style brief; small bytes
delta but unlocks path-2 sub-2 work if it lands.

**After this brief lands:**

1. **If recipe locks**: brief 174 (decomper) ships path-2
   wave 3 claiming odd-aligned ov004 candidates, dropping
   n=2 → n=1 → n=0.
2. **If all variants fail**: brief 174 (cloud) explores
   alternative — patcher extension to handle 2-byte pool
   shift at low n (analogous to brief 164's walk-forward
   detector generalisation).
3. Either outcome unblocks path-2 to its structural floor.
