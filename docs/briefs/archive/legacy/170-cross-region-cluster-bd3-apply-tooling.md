### cloud/cross-region-cluster-bd3-apply-tooling

**Goal:** Generalise brief 169's per-region cluster A
regen approach into a reusable tool/script for cross-region
cluster B + D-3 apply. Lays groundwork for decomper brief
172+ cross-region waves.

**Context — what brief 169 established:**

Brief 169 (PR #605) shipped 3,164 cluster A bss claims
across USA + JPN by regenerating from each region's own
`symbols.txt` + `delinks.txt` section bounds — NOT
mechanically porting EUR's address-shifted files. This
sidesteps per-overlay offset arithmetic (which varies:
main −0xe0, ov007 −0x100, etc.) and avoids fragile EUR↔
USA/JPN address mapping.

The approach is elegant for cluster A (structural zero-
fill, region-neutral bytes) but the per-region claim
generator was implicit/ad-hoc in brief 169's wave. Brief
170 turns it into a reusable script.

**Cluster B + D-3 sizing:**

| Cluster | EUR claims | USA/JPN target | Combined region-matches |
|---|---:|---:|---:|
| B true scalars | 174 | ~348 | 348 |
| B pointers | 23 | ~46 | 46 |
| B size-1/2 | 19 | ~38 | 38 |
| B value=0 | 18 | ~36 | 36 |
| D-3 chunks | ~31 | ~62 | 62 |
| **Total** | **265** | **~530** | **~530** |

(Cluster B size depends on per-region symbol-table
differences; exact counts come from the tool's
enumeration.)

**Brief 170 deliverables:**

### Part 1 — Cross-region claim generator tool

New `tools/cross_region_cluster_apply.py` (or extend an
existing tool):

1. **Input**: cluster name (B / D-3), target region (USA
   / JPN), source EUR claim manifest (which EUR TUs to
   port).
2. **Per-symbol lookup**: read target region's
   `symbols.txt` for the corresponding symbol kind+addr
   at the same logical position.
3. **Output**:
   - Generate per-region TU file at `src/<region>/<module>/<cluster>/<file>.c`
     (or `.s`, matching EUR's source shape).
   - Append claim to `config/<region>/arm9/[overlays/ovNNN/]delinks.txt`.
4. **Verification**: run `dsd check modules` post-claim
   per region; report success/failure per TU.

### Part 2 — Apply tool to cluster B + D-3

Run the tool to generate cross-region claims for:

- Cluster B (all 4 sub-pools): true scalars, pointers,
  size-1/2, value=0.
- Cluster D-3 (~31 chunks per region).

Some claims may not port cleanly (e.g., region-specific
content like SDK strings or ROM-format-version
identifiers). Document each non-portable case in the PR
funnel; decomper brief 172+ handles those manually.

### Part 3 — Tests

Pin the tool's enumeration + claim-generation behaviour
against a known fixture. The full project test suite
should still be all-passing (1846+ baseline post-brief
168).

**Required smoke test (cloud runs pre-PR, brain re-runs
pre-merge):**

- 3-region `ninja sha1` PASS preserved.
- 3-region 27/27 modules OK.
- EUR baseline bit-identical (no EUR source touched).
- USA + JPN should improve toward parity with EUR.
- All existing tests + new tool tests pass.

**Non-scope:**

- ❌ Cluster A cross-region apply (brief 169 already
  shipped).
- ❌ Cluster C cross-region (separate brief; cluster C
  has more region-specific content per brief 122).
- ❌ Cluster D-1 / D-2 cross-region (separate brief).
- ❌ ov004 path-2 cross-region (brief 167's path-2 is
  EUR-only by design; cross-region needs reverse-lookup
  on USA + JPN separately).
- ❌ Source-claim shipping outside cluster B + D-3.
- ❌ AGENTS.md / state.md beyond PR.

**Success:**

- New `tools/cross_region_cluster_apply.py` (or
  equivalent) tool ships.
- ≥ 80% of cluster B claims port cleanly to each region
  (USA + JPN).
- ≥ 80% of cluster D-3 chunks port cleanly.
- 3-region SHA1 PASS preserved.
- Region-config plumbing audit confirms reusability for
  future cross-region waves.

**Branch:** `cloud/cross-region-cluster-bd3-apply-tooling`

**Priority:** MEDIUM. Big leverage (≥ 530 region-matches
in one PR + reusable tool for future waves) but not on
the SHA1-critical path.

**After this brief lands:**

1. Brief 172+ (decomper) can run additional cross-region
   waves (cluster C, D-1, D-2) with the tool ready.
2. Cross-region parity at ~80% by cluster across USA +
   JPN — substantial visible progress on the per-region
   match badges.
3. Path-2 cross-region applies for ov004 `.rodata` remain
   gated on reverse-lookup tool extensions (brief 173+
   candidate).
