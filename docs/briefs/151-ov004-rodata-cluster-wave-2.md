### decomper/ov004-rodata-cluster-wave-2

**Goal:** Continue ov004 `.rodata` cluster work post brief 150's
patcher generalisation. Brief 147 (PR #572) shipped 14 syms at
n=9 before hitting the patcher safety check. Brief 150 (PR #576)
closed that boundary — patcher now accepts any `n ∈ [0, 86]`
cleanly. Wave 2 ships the additional candidates brief 147 had to
defer plus deeper sub-cluster drain.

**Context — what's now unlocked:**

- **Brief 147** shipped 14 ov004 `.rodata` claims at n=9 across
  all 3 shapes (Pattern 1 .c, Pattern 1 .s, Pattern 3 chunk).
  Bisection at n<9 triggered brief 146's safety check.
- **Brief 150** (PR #576) made byte-detection authoritative in
  `_fix_ctor_and_pad`; n-inference is now an informational hint.
  Tests pin behaviour at `n ∈ {0, 2, 7, 9, 43, 86}`. The patcher
  accepts any veneer count cleanly.
- **Net effect:** decomper can claim more ov004 `.rodata` slots
  without worrying about the patcher boundary. Some claims will
  suppress more veneers (dropping `n` further); others won't.
  Either is fine — the patcher handles whatever mwldarm emits.

**Scope:**

### Part 1 — Ship the brief 147 deferred candidates

Brief 147's funnel surfaced ~6 additional candidates that would
have dropped `n` below 9. Identify them from brief 147's PR #572
description / commit + ship via the same 3-shape mix (Pattern 1
.c, Pattern 1 .s, Pattern 3 chunk) brief 147 used.

### Part 2 — Deeper sub-cluster drain

Brief 141's ov004 sweep table (PR #557) enumerated cluster A /
C / D-1 / D-2 candidates. Brief 141 + 147 combined shipped 31 +
14 = 45 ov004 source-level claims. The remaining pool depth is
several dozen more candidates (brief 141's funnel had cluster A
.bss alone at 39 candidates, with brief 141 shipping 0 cluster
A and brief 147 shipping 0 cluster A — both focused on C / D /
Pattern 3).

Wave 2 prioritises:

- Cluster A `.bss` claims (39 candidates per brief 141 sweep).
  Pattern: brief 117's `.bss` zero-init recipe.
- Remaining cluster C / D-1 / D-2 candidates from brief 141's
  sweep table.
- Additional Pattern 3 chunks now that brief 144 generator is
  turnkey.

**Target: ≥ 20 ov004 source-level claims** (raises the bar
slightly from brief 147; the patcher boundary is no longer an
impediment).

**Selection rule:**

Same as brief 147: prefer high-ratio cluster anchors with
shape-similar siblings; mix .c, .s, Pattern 3 chunk shapes to
exercise the patcher across veneer counts. Bonus: pick at least
one claim that explicitly drops `n` below 9, validating brief
150's fix end-to-end on real source claims (not just synthetic
fixtures).

**Required smoke test (decomper runs pre-PR, brain re-runs
pre-merge):**

```
python tools/configure.py eur && ninja sha1   # must PASS
python tools/configure.py usa && ninja sha1   # must PASS
python tools/configure.py jpn && ninja sha1   # must PASS
./dsd check modules -c config/eur/arm9/config.yaml   # 27/27 OK
./dsd check modules -c config/usa/arm9/config.yaml   # 27/27 OK
./dsd check modules -c config/jpn/arm9/config.yaml   # 27/27 OK
```

**Funnel reporting (encouraged):** include the patcher's stderr
note in the PR funnel if it fires (brief 150 added a `stderr
print` on n-inference vs byte-detection disagreement). This
gives brain visibility into how often the disagreement happens
in practice.

**Self-extend gate** (same as briefs 143 / 147 / 149):

- Yield ≥ 40%, AND
- Bytes-matched ≥ 250.

Cluster A `.bss` claims hit the bytes-matched gate trivially
(they tend to be larger). Up to 3 total waves before close.

**Non-scope:**

- ❌ Touching `tools/` (cloud's territory).
- ❌ Cluster B work (brief 149 closed pointer pool; brief 152
  below handles size-1/2 workarounds in parallel).
- ❌ `AGENTS.md`, `docs/state.md`.

**Success:**

- Wave 1 PR ships ≥ 20 ov004 source-level claims.
- 3-region `ninja sha1` PASS preserved.
- 3-region 27/27 module OK preserved.
- At least 1 claim drops veneer count below 9 (validates brief
  150 end-to-end). Patcher stderr note appears in funnel.
- Self-extend chain runs as far as gates allow.

**Branch:** `decomper/ov004-rodata-cluster-wave-2`

**Priority:** HIGH. First production wave on brief 150's
generalised patcher.

**After this brief lands:**

1. Brain runs 3-region SHA1 PASS smoke test pre-merge.
2. Brain scopes brief 153+ based on residue:
   - If ov004 pool deeply drained: pivot to cluster D-3 (~20
     complex nested structs via Pattern 3 generator) or 30 KB
     mega-array (`data_020b6ec4`).
   - If pool depth remaining: ov004 wave 3.
3. Brief 152 (cloud, parallel-track) closes cluster B size-1/2
   alignment recipe.
