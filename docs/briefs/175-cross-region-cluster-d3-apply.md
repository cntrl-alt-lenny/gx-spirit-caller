### decomper/cross-region-cluster-d3-apply

**Goal:** Apply cluster D-3 cross-region to USA + JPN. Brief
170 (PR #609) shipped the `cross_region_cluster_apply.py`
tool with a `d3-chunks` stub subcommand; this brief either
completes that stub OR applies manually. ~31 EUR D-3 chunks
× 2 regions = ~62 region-matches.

**Context — what's shipped + deferred:**

EUR cluster D-3 was drained across 4 waves (briefs 157, 158,
161 bonus, 163) shipping 31 chunks / ~30 KB across 6
modules. Cross-region claims are zero across USA + JPN.

Brief 170 generalised brief 169's per-region approach into a
reusable tool but explicitly stubbed `d3-chunks`:

> **Cluster D-3 chunks** — stub subcommand ships for CLI
> parity; per-region chunk discovery deferred until
> enumeration heuristic settles.

**Brief 175 deliverables:**

### Part 1 — D-3 chunk enumeration

For each EUR D-3 chunk, determine the cross-region target:

- Each EUR chunk has a vaddr range `[start, end)` covering
  multiple symbols.
- Identify the corresponding USA + JPN vaddr range from
  region's own `symbols.txt` + cross-reference EUR's
  candidates.
- D-3 is `.data` zero-fill-ish (per brief 121 framework);
  region-specific byte differences depend on whether the
  struct content varies per region.

If region content is identical (likely for most D-3 chunks),
the cross-region apply is similar to brief 169's cluster A
approach: regenerate from region's own symbols.txt +
delinks.txt + extracted binary.

If region content varies, manual per-chunk inspection +
fitting required.

### Part 2 — Application

Apply to USA + JPN per chunk:

- **If tool extension is light**: extend brief 170's
  `d3-chunks` subcommand in `tools/cross_region_cluster_apply.py`
  to handle D-3. Use it for the apply.
- **If tool extension is heavy**: manual per-chunk apply
  (similar to brief 169's manual approach). Document the
  pattern decomper found for brief 177+ cloud tool
  extension.

**Target: ≥ 20 cross-region D-3 chunks** (of the ~62
possible matches).

### Part 3 — Verification

3-region `ninja sha1` PASS + 27/27 modules OK. EUR baseline
bit-identical regression.

**Required smoke test (decomper runs pre-PR, brain re-runs
pre-merge):**

```
python tools/configure.py eur && ninja sha1   # must PASS (regression)
python tools/configure.py usa && ninja sha1   # must PASS (new)
python tools/configure.py jpn && ninja sha1   # must PASS (new)
./dsd check modules -c config/<region>/arm9/config.yaml   # 27/27 OK per region
```

**Self-extend gate** (same as previous decomp-tier briefs):
yield ≥ 40% per region AND bytes-matched ≥ 250 per region.
D-3 chunks tend to be larger; bytes gate trivially met.

**Non-scope:**

- ❌ Touching `tools/` beyond brief 170 stub extension if
  light. If heavy lift, separate cloud brief 177+ covers it.
- ❌ Cluster B cross-region residue retry (brief 176+
  decomper after brief 174 cloud lands).
- ❌ Path-2 ov004 work.
- ❌ `AGENTS.md`, `docs/state.md`.

**Success:**

- ≥ 20 cross-region D-3 chunks per region.
- 3-region SHA1 PASS preserved (EUR + USA + JPN).
- 3-region 27/27 module OK preserved.
- Per-region funnel + tool-extension status reported.

**Branch:** `decomper/cross-region-cluster-d3-apply`

**Priority:** HIGH. Substantial region-match leverage;
independent of brief 174 cloud work.

**After this brief lands:**

1. Brain runs 3-region SHA1 PASS smoke test pre-merge.
2. If tool extension was light: brief 177+ may use
   `d3-chunks` for additional sub-pools or other clusters.
3. **Brief 176 (decomper, after brief 174 lands)**: rerun
   cross-region cluster B residue with brief 174's bundle
   generator.
4. **Brief 177+ candidates**:
   - Cluster C / D-1 / D-2 cross-region via brief 170 tool
     extension.
   - Patcher Variant E (brief 173 hand-off, path-2 floor
     closure).
   - Cluster D-3 hard residue (14.8 KB mega + 366 B
     non-aligned).
