### decomper/cross-project-bulk-port-wave-1-rerun

**Goal:** Rerun brief 069's bulk-port wave 1 against the 117-
candidate D1-ready pool unlocked by brief 070 D1 (PR #438).
Same shape as brief 069, but with the proper
`tools/port_external_source.py` driver. Target 50-100 ports
byte-identical for wave 1. Self-extends pick up D2/D3/D4
candidates as cloud ships those follow-ups in parallel.

**Context — brief 069 + 070 D1 chain:**

Brief 069 wave 1 (PR #436) hit the floor at 10 ports with an
ad-hoc driver. Funnel diagnostic: 2887 HIGH-fingerprint rows
→ 455 after dedup → 14 after ad-hoc gate → 10 byte-identical.
Brain scoping miss documented (brief 069's spec listed
port_external_source.py as a brief 068 deliverable but it
wasn't shipped).

Brief 070 D1 (PR #438) ships the proper driver's callee-remap
half: read upstream `.o` reloc tables for exact callee names,
replacing the sort-pair heuristic that mis-paired
`OS_Init`'s 15 calls in wave 1. Smoke-test result on full
pokediamond NitroSDK + libnns pool:

| Skip reason | Count | Status |
|---|---:|---|
| **`ok` (D1-ready)** | **117** | **available for this brief** |
| `struct-access` | 157 | gated on D3 |
| `data-ref` | 110 | gated on D4 |
| `undefined-macro` | 107 | gated on D2 |
| `callee-unresolvable` | 2 | architecture limit |

**117 candidates is 2.34× brief 069's 50-port floor and 11.7×
its actual landed 10.** Expected byte-identical count after
mwcc-semantic gate (~71% based on wave 1's 10/14): **80-100
ports**.

**Selection rule:**

- **Primary pool:** the 117 D1-ready candidates surfaced by
  `tools/port_external_source.py` against pokediamond NitroSDK
  + libnns. Get the list via:

  ```bash
  python tools/port_external_source.py --sweep pokediamond \
      --filter-skip-reasons all-deferrable --format csv \
      > brief_071_candidates.csv
  ```

  (Replace `--filter-skip-reasons all-deferrable` with the
  flag the D1 tool actually accepts — D1's PR body shows
  `ok` is the bucket name, cloud's CLI may expose this
  slightly differently. Decomper reads
  `docs/tools-index.md` after pulling.)

- **Per-port workflow:**

  ```bash
  python tools/port_external_source.py <upstream_path>.c
      # writes libs/nitro/<our_name>.legacy.c + delinks.txt entry
  python tools/configure.py eur && ninja rom
  # verify byte-identical via objdiff
  ```

- **Routing:** NitroSDK + libnns ports route as `.legacy.c`
  (mwcc 1.2/sp2p3 — exact SP match per brief 068's audit).

- **Skip list:**
  - Anything the D1 driver refuses-fast on (D2/D3/D4 territory).
  - The 2 `callee-unresolvable` candidates (architectural limit
    — symbol-fingerprint can't disambiguate).
  - mwcc-semantic-error candidates surfaced at compile time
    (drop from this wave's PR body; flag for D1 v2 if a
    pattern emerges).

**Workflow per the brief-064/065 cadence:**

1. Generate D1-ready CSV via cloud's tool.
2. Bulk-port candidates in `libs/` (region-neutral, so each
   port lands in EUR + USA + JPN automatically).
3. Per-batch verify: `configure.py eur` + `ninja rom` +
   `dsd check modules`. Same gate on USA + JPN at wave close.
4. Mid-wave: if cloud ships D2/D3/D4 follow-up PRs,
   pull main, regenerate CSV, add freshly-D4 (or D3 or D2)
   candidates to the wave. **Don't pause for cloud — keep
   draining D1 pool in parallel.**

**Scope:**

- Bulk-port **50-100 D1-ready candidates** into `libs/nitro/`.
  Each port is region-neutral (unlocks EUR + USA + JPN
  simultaneously).
- PR body documents: per-port byte counts, actual mwcc-gate
  pass-rate, any new mwcc-semantic-error patterns surfaced
  (calibration data for D1 v2 if needed).
- ROM verify gate: 24/27 baseline preserved across all three
  regions.

**Non-scope:**

- ❌ Ports that hit D1's REFUSED gates — those wait for
  D2/D3/D4.
- ❌ MSL_C / pokeheartgold ports — different SP tier; defer.
- ❌ Per-region delinks.txt cross-application for the wave-1
  brief-069 ports (separate follow-up patch, very small).
- ❌ Tool changes (cloud owns D2/D3/D4 in parallel autonomous
  PRs).

**Success:**

- ≥ 50 byte-identical ports landed in `libs/nitro/`.
- 24/27 baseline preserved across EUR + USA + JPN.
- PR body's per-port table reports actual byte counts +
  mwcc-semantic-error funnel.

**Branch:** `decomper/cross-project-bulk-port-wave-1-rerun`

## Self-extend clause

Same gates as brief 069. If precision ≥ 0.80 AND ports ≥ 50:

- **Self-extend 1/2** runs against the D1 pool plus whatever
  D2/D3/D4 follow-up PRs landed in the interim (likely D4
  first per cloud's autonomous sequencing).
- **Self-extend 2/2** runs against the residual pool +
  remaining D2/D3/D4 candidates.

If precision < 0.80 OR < 50 ports → hand back to brain. Likely
cause would be the mwcc-semantic-error rate climbing higher
than wave 1's 29%, in which case brief 072 (D1 v2 — semantic
guard) is the right scope.

**After this brief (and self-extends) land:**

1. Brief 071's cumulative ports drain the D1 pool (~80-100
   wave 1, plus self-extends).
2. As D2/D3/D4 ship, the wave-2/3 self-extends pull from the
   expanded pool. Total potential drain: ~300-400 ports if
   D2/D3/D4 all hit similar precision rates.
3. Each port is region-neutral so cumulative cross-region
   match-equivalents = 3× the port count (USA + JPN both
   pick up automatically via region-neutral `libs/`).
4. README badges should visibly climb each wave once brief
   071 starts shipping.
