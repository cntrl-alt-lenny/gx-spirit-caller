### decomper/cross-region-cluster-d3-with-generator

**Goal:** Apply brief 177's `cross_region_chunk_extent.py`
to USA + JPN cluster D-3 — the same scope brief 175
falsified mechanically. Brief 177 shipped 3 worked examples
(USA + JPN ov006 + USA main); this brief scales to the full
~62 region-matches.

**Context — what brief 177 unlocked:**

Brief 177 (PR #618) generalised brief 174's bundle-extent
heuristic into a multi-symbol chunk-extent adjuster. The
3-phase algorithm (Phase A start-left adjust, Phase B
end-right iterative, Phase C validate) handles arbitrary
`[start, end)` ranges that cross gap-file boundaries.

**Brief 175's headline failure reproduces + ships**:

```text
target: [0x021cca88, 0x021ccd08)
Phase A: lower start to 0x021cca68 (absorbs data_ov006_021cca68
         whose extent reaches 0x021ccce8, past target_start)
Phase B: data_ov006_021ccce8 extent = 0x021ccf68 (does NOT fit
         → extend end to 0x021ccf68)
result: [0x021cca68, 0x021ccf68), 1280 bytes
```

The tool surface:

```bash
python tools/cross_region_chunk_extent.py \
    --region usa --module ov006 \
    --start 0x021cca88 --end 0x021ccd08
```

Brief 175 attempted 72 chunks mechanically; this brief
re-runs with brief 177's adjusted extents.

**Brief 178 deliverables:**

### Part 1 — Enumerate USA + JPN D-3 candidates

For each of brief 175's 59 EUR D-3 Pattern 3 chunks:

1. Compute the EUR chunk's vaddr range.
2. Apply per-overlay base shifts to get USA / JPN
   equivalents (per brief 175):
   - main: same vaddr
   - ov002: -0xe0
   - ov006 / ov007: -0x100
   - ov021: -0xe0
3. Run brief 177's tool with `[start, end)` to get the
   adjusted extent per region.

### Part 2 — Apply

For each candidate per region:

1. Use `--json` or `--strict` to get the adjusted extent.
2. If the tool returns "needs hand-tuning" with offending
   inner-symbol list, skip the candidate and log for
   brief 180+ refinement.
3. Otherwise: run `cluster_c_pattern3_gen.py` with the
   adjusted `[start, end)`.
4. Add TU claim to region's delinks.txt.

### Part 3 — Verification

3-region `ninja sha1` PASS + 27/27 modules OK. EUR baseline
bit-identical regression.

**Target: ≥ 30 cross-region D-3 chunks** (about half of
the ~62 theoretical max). Self-extend if pool is richer.

**Required smoke test (decomper runs pre-PR, brain re-runs
pre-merge):**

```
python tools/configure.py eur && ninja sha1   # PASS (regression)
python tools/configure.py usa && ninja sha1   # PASS (new)
python tools/configure.py jpn && ninja sha1   # PASS (new)
./dsd check modules -c config/<region>/arm9/config.yaml   # 27/27 OK per region
```

**Self-extend gate**: yield ≥ 40% per region AND
bytes-matched ≥ 250 per region.

**Non-scope:**

- ❌ Touching `tools/` (cloud's territory; brief 179 has
  patcher Variant E in parallel).
- ❌ Cluster C / D-1 / D-2 cross-region (separate brief
  after this validates the tool further).
- ❌ Patcher Variant E (brief 173 hand-off, brief 179
  candidate).
- ❌ `AGENTS.md`, `docs/state.md`.

**Success:**

- ≥ 30 cross-region D-3 chunks per region.
- 3-region SHA1 PASS preserved.
- 3-region 27/27 module OK preserved.
- Tool validated at scale + any "needs hand-tuning"
  candidates documented for brief 180+.

**Branch:** `decomper/cross-region-cluster-d3-with-generator`

**Priority:** HIGH. Closes out brief 175's scope using
the brief 177 generator unlock.

**After this brief lands:**

1. Brain scopes brief 180+ candidates:
   - **If brief 179 Variant E lands**: brief 180 = decomper
     path-2 final wave (claim odd-aligned ov004 candidates,
     drop n=2 → n=0).
   - **Cluster C / D-1 / D-2 cross-region** — extend brief
     177's tool further; decomper apply.
   - **Cluster D-3 hard residue** (14.8 KB mega + 366 B
     non-aligned) — small cleanup.
   - **3 cluster B value=0 EUR deferred candidates** —
     wave-2 TU rewrite.
   - **Cluster B size-1/2 + odd-aligned cross-region**
     (brief 176 residue) — needs new recipe path.
