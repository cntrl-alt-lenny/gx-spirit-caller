### decomper/cross-region-cluster-b-residue

**Goal:** Close out cross-region cluster B coverage. Brief 170
shipped 768 claims (true scalars + pointers) but deferred 4
sub-categories per its non-scope: size-1/2 scalars, value=0
scalars, ov006 sub-pool, cluster D-3 chunks. This brief
applies those manually using established bundle recipes
(briefs 152/155) + investigates the ov006 .data ordering
shift brief 170 surfaced.

**Context — what brief 170 deferred:**

PR #609 funnel called out:

> **Cluster B size-1/2 + value=0 scalars** — require brief 152
> / 155 bundle recipes (content-sensitive grouping with non-
> zero neighbours). Deferred to decomper brief 172+ manual
> application.
>
> **ov006** — the 15 scalar candidates per region trigger a
> 32-byte `.data` ordering shift breaking SHA1, even though
> every claim has correct orig bytes. Likely related to
> mwldarm's `.data` ALIGNALL cascade interacting with ov006's
> 13.4 KB `.data` section. Documented as a non-portable case
> per the brief's permit; decomper brief 172+ can investigate
> per-claim.

**Pool sizing (per region, USA + JPN each):**

| Sub-pool | EUR claims | USA/JPN target | Cross-region matches |
|---|---:|---:|---:|
| B size-1/2 scalars | 19 | 19 | 38 |
| B value=0 scalars (excl. ov006) | 18 | 18 | 36 |
| ov006 cluster B (any sub-pool) | 15 | 15 | 30 |
| **Combined** | **52** | **52** | **~104** |

**Brief 172 deliverables:**

### Part 1 — Cross-region cluster B size-1/2 (bundle recipe)

For each EUR cluster B size-1/2 claim (19 candidates from
brief 152's `data_021020b4` precedent + brief 153's overlay
extensions):

1. Identify the corresponding USA/JPN slot from the region's
   own `symbols.txt`.
2. Apply brief 152/155's `unsigned int[N]` bundle recipe (or
   `.s` variant per brief 153 for overlays).
3. Add TU claim to region's delinks.txt.
4. Per-region build verify.

### Part 2 — Cross-region cluster B value=0

Brief 155 drained EUR's W6-rejected value=0 size=4 candidates
via the bundle recipe. Apply the same to USA + JPN's 18
candidates each.

### Part 3 — Investigate ov006 .data ordering shift

Brief 170 reported a 32-byte ordering cascade when adding
ov006's 15 scalar candidates per region. Possible diagnoses:

- mwldarm's `.data` ALIGNALL cascade interacts with ov006's
  13.4 KB `.data` section in a way that shifts downstream
  bytes when a new claim slots in.
- One or more candidates may need the bundle recipe even
  though they look like simple scalars (e.g., neighbouring
  zero-pad triggers the same .bss-routing pathology brief
  152 / 155 documented).
- The recipe shape may need a per-overlay adjustment (e.g.,
  ov006-specific `__attribute__` or `.s` adaptation).

Try the bundle recipe on the failing candidates first; if
that doesn't ship, capture cmp -l diffs for brain to scope a
follow-up patcher/recipe brief.

### Part 4 — Verify

3-region `ninja sha1` PASS + 27/27 modules OK. EUR baseline
bit-identical (no EUR source touched).

**Target: ≥ 30 cross-region claims** across the 3 sub-pools.
~104 is the upper bound if everything ships cleanly.

**Required smoke test (decomper runs pre-PR, brain re-runs
pre-merge):**

```
python tools/configure.py eur && ninja sha1   # must PASS
python tools/configure.py usa && ninja sha1   # must PASS
python tools/configure.py jpn && ninja sha1   # must PASS
./dsd check modules -c config/<region>/arm9/config.yaml   # 27/27 OK per region
```

**Self-extend gate** (same as previous decomp-tier briefs):

- Yield ≥ 40% per sub-pool.
- Bytes-matched ≥ 250 per region.

**Non-scope:**

- ❌ Touching `tools/` (cloud's territory; brief 173 has
  odd-aligned recipe research in parallel).
- ❌ Cluster D-3 cross-region — brief 170 left the stub for
  cloud follow-up (brief 174+ candidate after stub
  completion).
- ❌ Path-2 ov004 work (gated on brief 173 odd-aligned
  recipe + future patcher work).
- ❌ `AGENTS.md`, `docs/state.md` beyond Part 3
  investigation notes.

**Success:**

- ≥ 30 cross-region cluster B residue claims.
- 3-region SHA1 PASS preserved.
- 3-region 27/27 module OK preserved.
- ov006 diagnosis documented (recipe found OR cmp -l diff
  captured for brain follow-up).

**Branch:** `decomper/cross-region-cluster-b-residue`

**Priority:** HIGH. Closes out cross-region cluster B
coverage to its structural floor.

**After this brief lands:**

1. Brain scopes brief 174+ candidates:
   - **If brief 173 odd-aligned recipe locks**: brief 174
     = path-2 sub-2 ov004 wave (decomper).
   - **Cluster D-3 cross-region** — cloud finishes brief
     170's stub or decomper extends the tool themselves.
   - **3 cluster B value=0 EUR deferred candidates** —
     wave-2 TU rewrite (still pending from brief 155).
   - **Cluster C / D-1 / D-2 cross-region** — extend brief
     170's tool further.
