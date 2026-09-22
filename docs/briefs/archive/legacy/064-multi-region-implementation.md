### cloud/multi-region-implementation

**Goal:** Implementation brief downstream of brief 061's GO verdict.
Three deliverables: (1) byte-level disambiguation in
`find_region_siblings.py` so HIGH-confidence precision goes to near-
1.0; (2) `tools/port_to_region.py` for mechanical cross-region
porting; (3) `configure.py` / Ninja integration so per-region
builds can run in parallel without stepping on each other.

**Context:**

Brief 061 (PR #414) returned **GO** with 74.8% HIGH-confidence
pairings across 500 samples, peaking at 90.6% in the ≤0x40 band
where briefs 053/055/057/060 mined. Estimated unlock: 800-1700
cross-region matches at full pipeline ship. `config/usa/` and
`config/jpn/` are now bootstrapped (PR #415). The prototype tool
works end-to-end against real configs.

The brief 061 doc documents the remaining gap: HIGH-confidence
narrows to 1-5 candidates per match but doesn't fully
disambiguate within that set. The fix is byte-level similarity
scoring on the baseroms with reloc-slot masking; this would push
HIGH-confidence precision to near-1.0.

This brief closes that gap and wires the tooling into the build
graph so decomper's brief 065 can run mechanical bulk-port waves.

**Deliverable 1: Byte-level disambiguation (`find_region_siblings.py` v2)**

Per brief 061's documented limitation, the v1 fingerprint narrows
to 1-5 candidates but `func_02006164`'s manual check found 3 USA
HIGH candidates and 2 were false positives due to immediate-
encoding differences (`lsl #0x1d` vs `lsl #0x1e`) the reloc
fingerprint can't see.

Fix:

1. For each MEDIUM/HIGH candidate, read the function's raw bytes
   from the region's baserom (`orig/baserom_<ver>.nds`), seeking
   to the function's offset via the dsd-derived address-to-file-
   offset mapping.
2. Mask out the bytes corresponding to reloc slots (those will
   legitimately differ across regions).
3. Compute Hamming distance on the non-reloc bytes.
4. Re-rank candidates by combined (fingerprint + byte-distance)
   score; pick the lowest-distance candidate as the
   disambiguated pair.

Validate by re-running the brief 061 500-sample stratified survey
with byte-level disambiguation enabled; expected outcome:
HIGH-confidence precision ≥ 0.95 (vs prototype's ~0.5-0.7 within
HIGH bucket).

**Deliverable 2: `tools/port_to_region.py`**

CLI that auto-clones an EUR-matched `.c` file to its USA + JPN
siblings, rewriting region-specific symbol names:

```bash
python tools/port_to_region.py func_02006148              # EUR addr
python tools/port_to_region.py func_02006148 --regions usa # one region
python tools/port_to_region.py func_02006148 --dry-run    # preview
```

For each region:

1. Call `find_region_siblings` to resolve the cross-region
   counterpart's address + name.
2. Read the EUR `.c` source from `config/eur/**/delinks.txt`'s TU
   header.
3. Rewrite symbol names: function name itself, each callee BL
   target, each data symbol reference. Use `find_region_siblings`
   recursively for each symbol that needs cross-region
   resolution.
4. Write to `src/<region>/<module>/<func>.c` (or per project's
   convention for region-specific source layouts).
5. Emit the `delinks.txt` TU header decomper needs to add (same
   convention as `propagate_template.py`).

**Convention question for brain:** does the project want per-
region `src/<region>/` trees (`src/usa/main/...`,
`src/jpn/main/...`) or a single shared `src/main/...` with
region-conditional `#ifdef`s? Decomper's bulk-port wave brief
(065) is gated on this answer. Cloud's strawman is per-region
trees (simpler bookkeeping, no `#ifdef` proliferation, parallel
build paths align with the existing region-versioned
`config/<ver>/`); brain confirms or pivots in this brief's PR
review.

**Deliverable 3: `configure.py` + Ninja parallel-region builds**

Currently `configure.py eur` emits `build.ninja` targeting only
EUR. To run USA + JPN builds in parallel, two options:

A. **Multiple build.ninja files, one per region.** Run
   `configure.py eur && configure.py usa && configure.py jpn`,
   each writing to a separate `build.ninja` file. Build each
   separately. Simpler but no cross-region dependency tracking.

B. **Single build.ninja with all three regions.** `configure.py
   --all-regions` emits a unified graph. More complex but
   discovers cross-region tooling deps (e.g. a symbol rename in
   EUR should cascade to USA + JPN).

Cloud picks (A) for v0 — simpler, the bulk-port flow runs each
region's build independently. (B) is a future enhancement if
cross-region symbol renames become high-traffic.

Update `configure.py` to:
- Accept `usa` / `jpn` (it already does for ROM verification,
  but the full ninja graph generation needs work).
- Discover region-specific `src/<region>/` source trees if
  per-region layout is chosen above.

**Method:**

Per brief 050/054/061 pattern. Each deliverable is a self-
contained PR-able unit; cloud can ship them in sequence with
brain re-triage between if useful, or all in one mega-PR.

**Non-scope:**

- ❌ Running the bulk-port wave itself — that's brief 065
  (decomper).
- ❌ Region-conditional builds where USA/JPN inherit EUR's
  matches automatically. Bulk-port is decomper-curated; the
  tool surfaces candidates, decomper verifies.
- ❌ Modifying `dsd` / upstream tooling.
- ❌ AGENTS.md, state.md, src/ edits.

**Success:**

- `find_region_siblings.py` v2 returns ≥ 0.95 HIGH-confidence
  precision on a re-run of brief 061's 500-sample survey.
- `tools/port_to_region.py` round-trips an EUR `.c` to USA +
  JPN sibling source paths with all symbol names rewritten;
  smoke-tested against ≥ 3 EUR matches (e.g. the three from
  brief 061's manual cross-check sample).
- `configure.py usa` and `configure.py jpn` emit valid
  `build.ninja` files; `ninja rom` succeeds end-to-end for
  both regions; `dsd check modules` reports baseline state
  (probably 24/27 OK with the same 3 placeholder failures as
  EUR).
- All three deliverables have unit + integration tests.
- Markdown lint + ruff + tests-pass on CI.

**Branch:** `cloud/multi-region-implementation`

**Priority:** HIGH — unblocks brief 065 (decomper bulk-port
wave) which unlocks the 800-1700 free cross-region matches
brief 061 estimated.

**After this brief lands:**

1. Brief 065 (decomper) opens the first bulk-port wave —
   probably target the ≤ 0x28 trivial/easy band first since
   brief 061's per-tier HIGH rate is highest there.
2. As bulk-port waves ship, the README per-region badges
   (PR #411) start tracking real numbers for USA + JPN.
3. Steady-state estimate: 100-200 ports/week until the
   1600-1700 pool drains. Brain re-scopes brief 067+ as the
   pool empties.
