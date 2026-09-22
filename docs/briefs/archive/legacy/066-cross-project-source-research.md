### cloud/cross-project-source-research

**Goal:** Research + prototype the cross-project source mining
pipeline. Survey the DS-decomp ecosystem for already-matched
NitroSDK / MSL_C / mwcc-runtime functions whose C source can be
mechanically ported into our `libs/` and `src/` trees. Ship a
feasibility verdict + working `tools/find_external_source.py`
prototype.

**Context:**

Brain's session 2026-05-13 GitHub ecosystem survey (see
*Provenance* below) identified three viable upstream source
repos and gave a **cautious GO** with narrow scope. Estimated
unlock: **120-500 mechanical NitroSDK / MSL_C ports** for EUR,
compounding by ~3× through brief 064/065's multi-region
pipeline once that lands (potential **360-1500 matches across
regions**).

This is the same shape as brief 061 (multi-region porting
research) but the correspondence space is *across decomp
projects* rather than *across regions of our own ROM*.

**Targets (per survey, in priority order):**

| Repo | Toolchain | libs maturity | Why valuable |
|---|---|---|---|
| [`AetiasHax/st`](https://github.com/AetiasHax/st) | dsd + mwccarm | 31 matched MSL_C `.c` files | Same `libs/{c,cpp,nds}` layout our toolchain expects. Drop-in for relocs/symbols. **Highest-fidelity match** for our dsd-based workflow. |
| [`pret/pokeheartgold`](https://github.com/pret/pokeheartgold) | pre-dsd Makefile + mwccarm | 50 NitroSDK + MSL_C/{arith,rand}.c | Richest NitroSDK pool; layout differs (`lib/NitroSDK/src/os/`) but `.c` content is compiler-output-identical regardless. |
| [`pret/pokediamond`](https://github.com/pret/pokediamond) | pre-dsd Makefile + mwccarm | 105 NitroSDK `.c` files in `arm9/lib` + `arm7/lib` | Largest absolute pool; needs SP-version spot-check (DS-era pokemon games may be older mwccarm SP than ours). |

**Skip:**

- [`DQIX/dqix-decomp`](https://github.com/DQIX/dqix-decomp) and
  [`StanHash/dqix`](https://github.com/StanHash/dqix) — **no
  `libs/` directory**. They are workflow templates, not source
  sources. (CLAUDE.md's "dqix is our primary template" still
  accurate, but it doesn't apply to this brief.)
- [`zeldaret/ph`](https://github.com/zeldaret/ph) — only 4
  matched `libs/c` files; not worth the integration cost yet.
- [`AetiasHax/pm4`](https://github.com/AetiasHax/pm4),
  [`sasja-san/atc`](https://github.com/sasja-san/atc) — too
  thin (1-3 lib files each).
- [`pret/pokeplatinum`](https://github.com/pret/pokeplatinum) —
  no NitroSDK in `lib/`, only game-specific helpers.

**Method (per brief 048 / 050 / 054 / 061 research pattern):**

1. **Toolchain compatibility audit** (start here — gates
   everything downstream).
   - Confirm each target repo's `mwccarm` SP version (probably
     in their `configure.py` or equivalent). Compare against
     our 2.0/sp1p5 default + 1.2/sp2p3 + 1.2/sp3 legacy tiers.
   - If a target uses an older mwccarm SP we don't have
     downloaded, decide: pull that SP in via
     `tools/download_tool.py` (cheap), or demote that target.
   - Document SP version per target in the feasibility doc.
     Mismatches don't kill a target outright but reduce
     expected hit rate.

2. **Fingerprint design** (per survey's recommendation):
   - `(function_size_bytes, bl_count, bl_offsets_normalized,
     ldr_pool_count, prologue_pattern)` extracted from `.o`
     files (NOT `.c` source). This is the right side of the
     compare; for our unmatched candidates, extract the same
     fingerprint from disassembled bytes.
   - Same shape as `find_pattern_clusters.py` and
     `find_region_siblings.py` — re-use the existing scaffolding
     if possible.

3. **Per-target source extraction.**
   - For each target repo, clone shallow (e.g. depth=1) into
     `tools/_vendor/external_sources/<repo>/`. Pinned commit
     hash for reproducibility.
   - Enumerate already-matched `.c` files (the repo's own
     report.json or equivalent will identify these).
   - Extract fingerprints from the corresponding `.o` files
     (build them if needed and the toolchain matches, or just
     parse the asm if `.o` build adds too much friction).

4. **Match our unmatched against external pool.**
   - For each of our ~8200 unmatched hard-tier candidates,
     compute the fingerprint from our disassembly.
   - Bucket against external pool by fingerprint.
   - HIGH: exact fingerprint match + compatible SP version.
   - MEDIUM: exact fingerprint match, SP version mismatch.
   - LOW: partial fingerprint match.

5. **Manual cross-check.** Sample 5-10 HIGH-confidence
   matches; compare external repo's `.c` source against our
   disassembly. Validate the fingerprint isn't picking
   accidental same-shape collisions (e.g. two different
   NitroSDK functions happen to have the same byte size +
   BL count).

6. **Feasibility verdict + prototype.** Output:
   - `docs/research/cross-project-feasibility.md` — what
     fraction of our unmatched pool has external matched
     source per repo. Hit-rate histograms. Sample-validated
     precision rate.
   - `tools/find_external_source.py` — prototype CLI that
     takes a `(module, addr)` and returns ranked candidates
     `(source_repo, source_file, confidence)`. Output format
     matches `find_region_siblings.py` for symmetry.
   - **Recommendation to brain:** GO / NO-GO / GO-WITH-CAVEATS
     on a full implementation brief.

**Non-scope:**

- ❌ Building the full porting pipeline (`tools/port_external_
  source.py`, vendored upstream `.c` integration in our
  `libs/` tree, configure.py / Ninja updates) — that's the
  next brief if this returns GO.
- ❌ **Auto-applying** the port. Output is ranked candidates;
  decomper picks them up at discretion.
- ❌ Cloning the full upstream repos into our git history —
  use a vendored cache under `tools/_vendor/` that's
  `.gitignore`-d. Brief includes a clone script for
  reproducibility.
- ❌ Modifying upstream repos. Read-only.
- ❌ src/, libs/, AGENTS.md, state.md edits beyond the docs +
  tool this brief adds.

**Success:**

- Feasibility verdict shipped with per-target hit-rate
  estimates (the survey's 120-500 estimate gets refined
  against actual fingerprint overlap).
- `tools/find_external_source.py` works against the three
  target repos and surfaces ranked candidates for ≥ 5
  manually-validated sample functions.
- Toolchain compatibility audit documents SP version per
  target.
- Markdown lint + ruff + tests-pass on CI.
- `tools-index` + `research-index` regen current.

**Branch:** `cloud/cross-project-source-research`

**Priority:** MEDIUM. Brief 064 (multi-region implementation)
is HIGH priority and should land first; this brief is
deliberately scoped so cloud can pick it up after 064 closes
without competing for attention. Brief 062 (diff-to-coercion
suggester) and 063 (permuter auto-runner) remain available as
parallel pickups.

**After this brief lands:**

1. If verdict = GO → brain queues implementation brief 068
   (cloud): `tools/port_external_source.py` + the vendored-
   upstream integration + decomper's bulk-port wave brief
   that consumes it.
2. If verdict = NO-GO → brain marks cross-project mining
   deferred. Feasibility doc still valuable.
3. If verdict = GO-WITH-CAVEATS → narrower implementation
   brief (e.g. "MSL_C only — skip NitroSDK pending SP-version
   handling").

## Provenance

Targets + verdict are from brain's session 2026-05-13 GitHub
ecosystem survey (research-agent task, ~5 min surveying
public repos via WebFetch/WebSearch). Survey covered the dsd
+ mwccarm + objdiff ecosystem plus the `pret/*` non-dsd
NitroSDK sources. Full agent report is in the session
transcript; key findings:

- DS-decomp ecosystem is sparse but two specific repos
  (AetiasHax/st, pret/pokeheartgold) have substantial matched
  NitroSDK / MSL_C source.
- A third (pret/pokediamond) has the largest absolute pool
  but needs SP-version validation.
- All other surveyed repos (zeldaret/ph, dqix-decomp,
  pm4, atc, pokeplatinum) are either too sparse, lack a
  `libs/` tree, or use game-specific lib code that doesn't
  port.
- Fingerprint based on `.o` byte properties (size + BL graph
  + literal pool) is reliable for NitroSDK functions
  compiled by the same mwccarm SP; game code doesn't port.
- SP version mismatch is the dominant risk. Multiple SPs are
  cheap to support (we already do 3 tiers).
