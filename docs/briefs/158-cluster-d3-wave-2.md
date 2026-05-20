### decomper/cluster-d3-wave-2

**Goal:** Wave 2 of cluster D-3 drain. Brief 157 (PR #586)
shipped 9 of 33 candidates (27%, deliberately conservative
selection of smallest chunks). Wave 2 picks up the broader pool
— larger contiguous ranges, mixed struct shapes — and aims for
≥ 10 more chunks to push cluster D-3 toward closure.

**Context — what brief 157 established:**

Brief 157 shipped 9 D-3 chunks (6,028 bytes / 80% over target).
Findings from the PR funnel:

- All chunks were natively clean multi-symbol `.data` regions
  with auto-`.extern` blocks at top via brief 144's generator.
- Bundle recipe (brief 152/155) didn't trigger any value=0 or
  sub-4-byte cases.
- **Yield gate FAIL** (9/33 = 27%, below 40% threshold) was
  intentional: smallest chunks first to validate workflow.
- **Generator gap**: hardcodes `.section .rodata`; D-3 lives in
  `.data`, requiring post-process sed. Brief 159 (cloud,
  parallel) ships the `--section data` flag fix.

**Brief 158 scope:**

### Part 1 — Wave 2 broader selection

Pick from the remaining ~24 D-3 candidates. Prefer:

- **Medium-size contiguous ranges** (300-2000 bytes per chunk —
  smaller than wave 1's biggest at 2060 B, larger than the
  smallest at 256 B).
- **Mixed struct element types** (test recipe robustness vs
  the all-clean wave 1 pool).
- **Adjacent-to-claimed regions** where chunk boundaries can
  absorb partially-claimed neighbours.

If brief 159's `--section data` flag has landed pre-merge, use
it directly; if not, continue with the post-process sed
workflow brief 157 used.

**Target: ≥ 10 D-3 chunks** in wave 2.

### Part 2 — Value=0 / sub-4-byte residue (optional)

If wave 2 chunks hit value=0 or sub-4-byte sections inside,
apply brief 152/155's bundle recipe. Report the trigger
shape in the PR funnel — first production-wave use of the
bundle recipe inside a D-3 chunk would be a useful data
point for the generalisation framing.

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

**Self-extend gate** (same as brief 157): yield ≥ 40% AND
bytes-matched ≥ 250. Wave 2 selection should target ≥ 40%
yield (broader pool exposure, not just safest picks).

**Non-scope:**

- ❌ Touching `tools/` (cloud's territory; brief 159 has the
  generator flag fix in parallel).
- ❌ ov004 reclassification work (separate brief after cloud's
  reverse-lookup tool lands per brief 159 Part 2).
- ❌ 30 KB main mega-array — separate brief.
- ❌ Cross-region cluster A apply — separate brief.
- ❌ `AGENTS.md`, `docs/state.md`.

**Success:**

- Wave 2 PR ships ≥ 10 D-3 chunks.
- 3-region `ninja sha1` PASS preserved.
- 3-region 27/27 module OK preserved.
- Self-extend gate target ≥ 40% met (or close-extends authorised
  to wave 3).
- Any bundle-recipe trigger inside chunks reported in funnel.

**Branch:** `decomper/cluster-d3-wave-2`

**Priority:** HIGH. Pushes D-3 toward pool closure; brief 144
+ 152/155 + (if available) 159 makes execution low-risk.

**After this brief lands:**

1. Brain runs 3-region SHA1 PASS smoke test pre-merge.
2. Brain scopes brief 160+ candidates:
   - **If D-3 closes**: cautious ov004 reclassification (path 1
     from brief 156 hand-off, gated on brief 159 reverse-lookup
     tool readiness), or 30 KB main mega-array, or cross-region
     cluster A apply.
   - **If D-3 pool remains**: wave 3 self-extend.
