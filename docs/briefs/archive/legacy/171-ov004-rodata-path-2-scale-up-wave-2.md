### decomper/ov004-rodata-path-2-scale-up-wave-2

**Goal:** Path-2 scale-up wave 2 at n=3 (and below if
reachable). Brief 168 (PR #606) closed the n=3 SHA1
residual via the BL re-encoding generalisation. Brief 167
identified band-1 as the only path to sub-5; this brief
exhausts the band-1 candidates and tests if combining
multiple band-1 claims drops n below 3.

**Context — what's now unlocked:**

- **Brief 167** (PR #602): 6 ov004 `.rodata` claims kept
  at n=5; `data_ov004_021e3de8` (band-1) demonstrated
  n=5 → n=3 cascade; reverted because patcher broke at
  n=3.
- **Brief 168** (PR #606): patcher generalised
  (`_reencode_arm_bls` re-encodes ANY arm_call reloc, not
  just `.init`-resident). **n=3 SHA1 PASS validated
  end-to-end** with `data_021e3de8` injection. Reverted
  per non-scope.

**Brief 171 hypothesis:**

Band-1 slots are the only path to sub-5 (per brief 167
finding #5). Brief 167 found 2 band-1 4-aligned slots
(`021e3500` + `021e3de8`). If multiple band-1 claims drop
n further (n=3 → n=1 or n=0), it would empirically
characterise the block-level cascade beyond brief 160's
initial finding.

**Brief 171 deliverables:**

### Part 1 — Enumerate band-1 candidates

Inspect `docs/research/ov004-rodata-pointer-targets.md`
(brief 159's reverse-lookup output) for ov004 `.rodata`
slots in band-1's address range. Brief 167 implicitly
defined band 1 by the candidates it picked; this brief
makes the band boundaries explicit.

Identify ≥ 4 band-1 4-aligned candidates (the 2 brief 167
found + at least 2 more).

### Part 2 — Per-slot claim + observation

For each candidate, **one at a time** (per-slot SHA1
gate):

1. Generate Pattern 1 `.c`.
2. Add TU claim.
3. Run `ninja sha1` + observe veneer count from patcher
   output.
4. Record:
   - PASS + veneer drop → claim sticks
   - PASS + no veneer drop → claim sticks, slot wasn't
     a veneer-block trigger
   - FAIL → revert; document the failure shape

### Part 3 — Test multi-band-1 cascade

If individual band-1 claims drop n cleanly:

- Try combining 2 band-1 claims simultaneously. Observe:
  does n drop further (e.g., 5 → 1)?
- Try 3 band-1 claims. Test if n=0 is reachable.

If a multi-claim state breaks SHA1 (patcher gap at n=1 or
n=0), revert that batch + flag for brief 173+ cloud
patcher extension.

### Part 4 — Report

Update `docs/research/ov004-rodata-pointer-targets.md`
(or sibling note):

| Slot | Refs | Size | After-claim n | SHA1 | Kept |
|---|---:|---:|:---:|:---:|:---:|
| ... | ... | ... | ? | ... | ... |

Document the band-1 cascade behaviour empirically.

**Target: ≥ 3 kept band-1 claims** with at least one drop
below n=3 (validates multi-block cascade beyond brief
167's single-claim observation).

**Required smoke test (decomper runs pre-PR, brain
re-runs pre-merge):**

```
python tools/configure.py eur && ninja sha1   # must PASS
python tools/configure.py usa && ninja sha1   # must PASS
python tools/configure.py jpn && ninja sha1   # must PASS
./dsd check modules -c config/eur/arm9/config.yaml   # 27/27 OK
./dsd check modules -c config/usa/arm9/config.yaml   # 27/27 OK
./dsd check modules -c config/jpn/arm9/config.yaml   # 27/27 OK
```

If any kept claim breaks EUR / USA / JPN SHA1, the PR
doesn't merge.

**Self-extend gate** (same as previous decomp-tier
briefs): yield ≥ 40% AND bytes-matched ≥ 250.

**Non-scope:**

- ❌ Reclassifying symbols.txt (path 1 still risky).
- ❌ Touching `tools/` (cloud's territory; brief 170 has
  cross-region tooling in parallel).
- ❌ Odd-aligned slot recipe (brief 160 finding #4 —
  separate brief if path-2 cascade exhausts band-1
  4-aligned candidates and we need odd-aligned).
- ❌ Cross-region path-2 (separate brief; ov002→ov004
  reverse-lookup is EUR-specific until extended).
- ❌ `AGENTS.md`, `docs/state.md`.

**Success:**

- ≥ 3 kept band-1 claims.
- 3-region `ninja sha1` PASS preserved.
- 3-region 27/27 module OK preserved.
- Empirical characterisation of multi-band-1 cascade
  documented.
- **Bonus**: if n=1 or n=0 is reached, document the
  state + any new patcher gap (brief 173+ candidate).

**Branch:** `decomper/ov004-rodata-path-2-scale-up-wave-2`

**Priority:** HIGH. Wave 2 of the path-2 series; tests
the empirical limits of mwldarm's veneer-emission model
at multiple block coverage.

**After this brief lands:**

1. Brain runs 3-region SHA1 PASS smoke test pre-merge.
2. Brain scopes brief 173+ based on findings:
   - **If band-1 exhausted at n=3**: shift focus to band
     enumeration tool (brief 173 candidate) to find
     other paths.
   - **If n<3 reached cleanly**: continue scale-up.
   - **If n<3 reached but patcher breaks**: brief 173
     extends patcher (same pattern as brief 164 / 168).
   - **Cross-region cluster B + D-3 apply (brief 170
     tooling)**: brief 172 decomper application wave.
