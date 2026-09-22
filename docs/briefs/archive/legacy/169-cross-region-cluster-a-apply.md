### decomper/cross-region-cluster-a-apply

**Goal:** Port the 1,443 EUR cluster A `.bss` symbol claims
to USA + JPN. Highest-leverage cross-region wave on the
backlog (single brief unlocks ~2,886 region-matches in one
pass). Brief 116's region-config plumbing precedent applies;
the recipe is mechanical given cluster A is structural
zero-fill.

**Context — what's accumulated:**

Cluster A `.bss` was drained on EUR across waves 1-4:

- Brief 116 wave 1 — 647 syms (main)
- Brief 118 wave 2 — 307 syms (ov004 + ov006)
- Brief 120 wave 3 — 175 syms (ov009/14/21)
- Brief 139 wave 4 — 298 syms (17 small overlays)

**Cumulative: 1,443 EUR cluster A `.bss` symbols (~91% of
the 1,586 total candidate pool per brief 113's estimate).**

USA + JPN cluster A pools have ZERO source claims to date.
Cluster A is structural zero-fill (`.bss` is `bss_size`
zero bytes per module — no per-region byte differences
expected). The same `.s` files that work for EUR should
work cross-region with minor address shifts.

**Brief 169 deliverables:**

### Part 1 — Region-config plumbing audit

Brief 116 established the cross-region pattern: source TUs
under `src/<module>/bss/` are region-neutral; per-region
`config/<region>/arm9/[overlays/ovNNN/]delinks.txt` files
add the TU claims with region-specific address offsets if
any.

Inspect:

- Does `tools/configure.py` already filter `src/<module>/bss/`
  per-region the way `src/main/` is filtered? (Brief 064
  deliverable 2.)
- Are the cluster A `.s` files in `src/main/bss/` +
  `src/overlayNNN/bss/` already region-neutral, or do they
  reference EUR-specific addresses?
- USA + JPN `bss_size` per module — same as EUR or different?

If region-neutral: just add TU claims to USA + JPN
delinks.txt files. Mechanical.

If region-specific: per-region `.s` variants or address
parameterisation needed.

### Part 2 — Cross-region claim apply

For each of the 1,443 EUR cluster A claims:

1. Identify the corresponding USA + JPN address (likely
   identical for cluster A; small region-shift possible).
2. Add TU claim to USA + JPN delinks.txt files.
3. Per-region build verify.

Target: ≥ 1,000 cross-region claims applied per region
(USA + JPN). Self-extend if pool is deeper.

### Part 3 — Verification

3-region `ninja sha1` PASS + 27/27 modules OK across EUR /
USA / JPN. The EUR baseline must remain bit-identical (no
regressions from any region-neutral source TU edits).

**Required smoke test (decomper runs pre-PR, brain re-runs
pre-merge):**

```
python tools/configure.py eur && ninja sha1   # must PASS (regression)
python tools/configure.py usa && ninja sha1   # must PASS (new)
python tools/configure.py jpn && ninja sha1   # must PASS (new)
./dsd check modules -c config/eur/arm9/config.yaml   # 27/27 OK
./dsd check modules -c config/usa/arm9/config.yaml   # 27/27 OK
./dsd check modules -c config/jpn/arm9/config.yaml   # 27/27 OK
```

Cluster A claims are zero-fill bytes — they shouldn't
shift any output bytes. The 3-region SHA1 PASS gate should
be trivially met for kept claims.

**Self-extend gate** (same as previous decomp-tier briefs):

- Yield ≥ 40% per region, AND
- Bytes-matched ≥ 250 per region.

Cluster A claims are zero-bytes — `bytes-matched` is
technically 0 per claim. The gate is met because the
**byte coverage** (counted in `bss_size`) increases
substantially. Refine the gate interpretation if needed;
the spirit is "wave is productive".

Cluster A pool depth across 3 regions ≈ 1,443 × 2 (USA +
JPN) ≈ 2,886 region-matches. Could be split into ≤ 3 self-
extend waves.

**Non-scope:**

- ❌ Touching `tools/` (cloud's territory; brief 168 has
  patcher work in parallel).
- ❌ Cluster B / D / ov004 cross-region apply — separate
  brief.
- ❌ Cluster A residue (the 143 not-yet-claimed EUR
  cluster A symbols per brief 139's drain trajectory) —
  separate brief if worth it.
- ❌ `AGENTS.md`, `docs/state.md`.

**Success:**

- ≥ 1,000 cluster A `.bss` claims applied per region (USA
  + JPN).
- 3-region `ninja sha1` PASS preserved (EUR baseline +
  USA + JPN new).
- 3-region 27/27 module OK preserved.
- Wave PR with per-region funnel + per-module breakdown.

**Branch:** `decomper/cross-region-cluster-a-apply`

**Priority:** HIGH. Largest single-brief cross-region
unlock on the backlog. ~2,886 region-matches in one pass.

**After this brief lands:**

1. Brain runs 3-region SHA1 PASS smoke test pre-merge.
2. Brain scopes brief 171+ candidates:
   - **If brief 168 has landed**: brief 171 = path-2
     scale-up wave 2 at n=3.
   - **Cross-region cluster B apply** — port the ~231
     cluster B claims to USA + JPN.
   - **Cross-region cluster D-3 apply** — port the ~31
     D-3 chunks to USA + JPN.
   - **Cluster D-3 hard residue** (14.8 KB mega +
     non-4-aligned 366 B) — small cleanup.
   - **3 cluster B value=0 deferred candidates** —
     wave-2 TU rewrite.
