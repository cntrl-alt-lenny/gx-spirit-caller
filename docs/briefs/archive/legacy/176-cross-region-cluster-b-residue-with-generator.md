### decomper/cross-region-cluster-b-residue-with-generator

**Goal:** Apply brief 174's `cluster_b_bundle_gen.py` to
USA + JPN cluster B residue — the same scope brief 172
falsified mechanically (size-1/2 + value=0 sub-pools).
Brief 174 shipped 2 worked examples (`data_020ff828` USA +
JPN). This brief scales up to the full ~104 region-matches.

**Context — what brief 174 unlocked:**

PR #615 shipped `tools/cluster_b_bundle_gen.py` with the
locked heuristic:

> For each named symbol AFTER the candidate, walking
> forward, pick the FIRST one whose vaddr is 4-aligned,
> such that the bundle `[candidate, next_vaddr)` contains
> at least 1 non-zero byte.

Three constraints, each falsified-into-existence:

1. **4-aligned end**: avoids mwldarm's ALIGNALL(2) cascade.
2. **Named-symbol boundary**: avoids dsd's section-
   membership check.
3. **≥ 1 non-zero byte**: avoids mwcc routing all-zero
   `.data` arrays to `.bss`.

The CLI surface:

```bash
python tools/cluster_b_bundle_gen.py \
    --region usa --module main --address 0x020ff828
```

Brief 174's audit reproduces all 4 brief 152/155 worked
examples byte-for-byte; 2 cross-region worked examples
(`data_020ff828` for USA + JPN) ship + SHA1 PASS.

**Brief 176 deliverables:**

### Part 1 — Enumerate USA + JPN cluster B residue

Same scope brief 172 attempted but at scale:

| Sub-pool | EUR claims (drained) | USA target | JPN target |
|---|---:|---:|---:|
| B size-1/2 scalars | 19 | 19 | 19 |
| B value=0 scalars (excl. ov006) | 18 | 18 | 18 |
| ov006 cluster B (any sub-pool) | 15 | 15 | 15 |

USA + JPN candidates come from each region's own
`symbols.txt` enumeration, NOT from EUR address mapping.
Some may not have direct EUR equivalents (region-specific
slots).

### Part 2 — Apply the generator

For each candidate per region:

1. Run `cluster_b_bundle_gen.py --region <r> --module <m>
   --address 0x<addr>`.
2. Emit the bundle source file + delinks.txt claim.
3. Verify per-region `ninja sha1` PASS.

Use `--dry-run` first to preview the bundle extent; if it
looks unreasonable (e.g., bundle spans an entire section),
skip the candidate and report for brief 178+ refinement.

### Part 3 — Investigate ov006 sub-pool

Brief 170 reported ov006's 15 scalar candidates trigger a
32-byte `.data` ordering shift that breaks SHA1 even with
correct orig bytes. Brief 172 didn't resolve this. With
brief 174's generator producing more conservative bundles,
re-attempt:

- Generate bundles for ov006 scalars via brief 174's tool.
- If SHA1 still fails per-bundle, capture cmp -l diff +
  the bundle extent the generator chose.
- Document for brief 178+ if pathology persists.

### Part 4 — Verify

3-region `ninja sha1` PASS + 27/27 modules OK. EUR baseline
bit-identical regression.

**Target: ≥ 60 cross-region claims** (mid-point between
brief 172's 0 and the ~104 theoretical max). Self-extend
if pool is richer than expected.

**Required smoke test (decomper runs pre-PR, brain re-runs
pre-merge):**

```
python tools/configure.py eur && ninja sha1   # PASS (regression)
python tools/configure.py usa && ninja sha1   # PASS (new claims)
python tools/configure.py jpn && ninja sha1   # PASS (new claims)
./dsd check modules -c config/<region>/arm9/config.yaml   # 27/27 OK per region
```

**Self-extend gate**: yield ≥ 40% per region AND bytes-
matched ≥ 250 per region.

**Non-scope:**

- ❌ Touching `tools/` (cloud's territory; brief 177 has
  the unified chunk-extent generator in parallel).
- ❌ Cluster D-3 cross-region (brief 175 hit the same
  underlying gap-extent issue brief 177 closes).
- ❌ Patcher Variant E (brief 173 hand-off, brief 178+
  candidate).
- ❌ `AGENTS.md`, `docs/state.md`.

**Success:**

- ≥ 60 cross-region cluster B residue claims.
- 3-region SHA1 PASS preserved.
- 3-region 27/27 module OK preserved.
- ov006 sub-pool diagnosis documented (recipe locks OR
  cmp -l diff captured for brief 178+).

**Branch:** `decomper/cross-region-cluster-b-residue-with-generator`

**Priority:** HIGH. Closes out brief 172's scope using
the brief 174 generator unlock.

**After this brief lands:**

1. Brain scopes brief 178+ candidates:
   - **If brief 177 chunk-extent generator lands**: brief
     178 = decomper cluster D-3 cross-region retry.
   - **Patcher Variant E** (brief 173 hand-off): brief
     178+ cloud — handle 2-byte pool shift at low n.
     Closes path-2 to n=0.
   - **Cluster C / D-1 / D-2 cross-region** — extend brief
     170's tool.
   - **3 cluster B value=0 EUR deferred candidates** —
     wave-2 TU rewrite.
