### cloud/pokeheartgold-extension-research

**Goal:** Survey the `pret/pokeheartgold` upstream as the
second cross-project source pool (after `pret/pokediamond`
drained). Confirm or refute brief 066's headline finding
that nitrocrypto uses mwcc 1.2/sp2p3 = our exact `.legacy.c`
SP, sample-validate the byte-fingerprint hit rate, and ship
a feasibility verdict + prototype extension to
`find_external_source.py`.

**Context:**

Brief 066 (PR #429) surveyed three upstream sources:

| Repo | Status |
|---|---|
| `pret/pokediamond` | Mined to natural drain — 99 EUR-side ports across brief 069/071/074 chain |
| `pret/pokeheartgold` | **Untapped — this brief** |
| `AetiasHax/st` | Excluded per brief 066 SP-distance |

Brief 066's specific projection for pokeheartgold:

> 50 NitroSDK + MSL_C functions matched, 50-70% pairing rate.
> **Bonus: nitrocrypto subset uses 1.2/sp2p3 — perfect-SP
> match to our .legacy.c**. ≥ 95% expected hit rate on that
> sub-pool.

The brief 068 / 070 / 076 tooling all generalizes — the
same `external_obj.py` profile registry, the same
`find_external_source.py --byte-scan` CSV, the same
`port_external_source.py` driver. **Adding pokeheartgold is
~1-line profile additions per subtree + sample-validation.**

**Method (per brief 050 / 066 research pattern):**

1. **Vendor pokeheartgold via `vendor_external_sources.py`.**
   Pin commit hash for reproducibility. Same shape as brief
   066's pokediamond vendoring.

2. **Audit pokeheartgold's mwcc SP per subtree.** Brief 066
   said:
   - `arm9/` (game code): `2.0/sp2p2`
   - `arm9/lib/NitroSDK/`: `2.0/sp2p2` (probably; verify)
   - `arm9/lib/MSL_C/`: `2.0/sp2p2` (probably; verify)
   - `arm9/lib/nitrocrypto/`: `1.2/sp2p3` (the bonus finding)
   
   Verify all four subtrees' SP via `make` output or
   `mwccarm.exe` invocations in upstream's build scripts.

3. **Profile registry additions in `external_obj.py`.** Per
   `BuildProfile`-style entries for pokeheartgold's lib
   subtrees. Same pattern as pokediamond's:

   ```python
   # arm9/lib/NitroSDK/ — same SP as game code
   BuildProfile(
       repo="pokeheartgold",
       src_prefix="arm9/lib/NitroSDK",
       sp="2.0/sp2p2",
       includes=[...],
   )
   # arm9/lib/nitrocrypto/ — exact .legacy.c match
   BuildProfile(
       repo="pokeheartgold",
       src_prefix="arm9/lib/nitrocrypto",
       sp="1.2/sp2p3",
       includes=[...],
   )
   ```

4. **Index pokeheartgold's matched-source pool.** Same
   approach as brief 066's pokediamond indexing — walk
   pokeheartgold's `lib/` subtree for already-matched `.c`
   files (their per-project report.json or equivalent
   identifies these).

5. **Sample-validate byte-fingerprint hit rate.** Run
   `find_external_source.py --byte-scan pokeheartgold` on
   the first 200 candidates; report:
   - `ok` count per subtree (NitroSDK / MSL_C / nitrocrypto)
   - Comparison to brief 066's 50-95% projection
   - Whether nitrocrypto's exact-SP-match sub-pool delivers
     the ≥ 95% headline

6. **Feasibility verdict + tooling extension:**
   - `docs/research/pokeheartgold-extension-feasibility.md`
     — verdict + per-subtree numbers
   - `external_obj.py` profile registry additions
   - **Recommendation to brain:** GO / NO-GO / GO-WITH-
     CAVEATS on a follow-up bulk-port wave brief.

**Non-scope:**

- ❌ The bulk-port wave itself (brief 082+, decomper-shaped,
  scoped after this brief lands).
- ❌ AetiasHax/st extension (brief 066 verdict was skip;
  doesn't change).
- ❌ Any modification to port driver beyond profile-registry
  additions.
- ❌ AGENTS.md / state.md edits.

**Success:**

- Pokeheartgold vendored at a pinned commit under
  `tools/_vendor/external_sources/pokeheartgold/`.
- Profile registry additions for NitroSDK + MSL_C +
  nitrocrypto subtrees (skip game-code subtree).
- Sample-validate 200 candidates: per-subtree `ok` count
  + sample-cross-check.
- `docs/research/pokeheartgold-extension-feasibility.md`
  ships with verdict.
- If nitrocrypto returns ≥ 95% (matching brief 066's
  projection), that's the strongest signal — those become
  brief 082's high-priority pool.
- Full test suite stays green; ruff + markdown lint clean.

**Branch:** `cloud/pokeheartgold-extension-research`

**Priority:** MEDIUM. Brief 081 (decomper single-region
resumption) is the more immediate decomper unlock; brief
080 expands cloud's pipeline depth without competing for
attention.

**After this brief lands:**

1. If verdict = GO → brain queues brief 082 (decomper
   pokeheartgold + nitrocrypto bulk-port wave 1). Same shape
   as brief 071 but against the new upstream.
2. If nitrocrypto hits the 95% sub-pool — that's the high-
   est-fidelity port pool the project will ever see (exact
   SP match). Brief 082 prioritises it.
3. If verdict = NO-GO (SP audit reveals different reality
   than brief 066 projected) → document the wall, defer
   cross-project to other pools (gba/dolphin), pivot to
   single-region as the sole cross-project lever.
