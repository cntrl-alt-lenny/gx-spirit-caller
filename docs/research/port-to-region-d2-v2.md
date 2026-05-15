# port_to_region D2 v2 + D3 — neighbor-shift consensus

**Brief:** 095. Eliminates the manual `--confidence-floor LOW`
override that brief 090 needed for 15 of its 39 brief-090 ports
(15 LOW-floor + 2 refused legacy_sp3 ports). Adds two rules
that promote / resolve symbols via the EUR↔target address-shift
consensus of nearby known mappings.

## Background

`port_to_region.py` (brief 064 deliverable 2, PR #419) maps an
EUR-region matched function to USA / JPN by fingerprint match
(`find_region_siblings.find_siblings`) + parallel-reloc-derived
data-address translation. The output is gated by a
`--confidence-floor` flag (default HIGH).

`find_region_siblings.find_siblings` returns:

- **HIGH** — exact reloc-signature match + ≥0.99 byte-similarity.
- **MEDIUM** — reloc bag matches, offsets drift OR byte-sim 0.90-
  0.99 with a better candidate present.
- **LOW** — size + ish match, no relocs to compare.

Brief 090 (PR #483) wave 1 calibration: **15 of 15 LOW-floor
ports on substantive (≥0x20) functions landed byte-identical**
when the EUR↔target shift matched the surrounding HIGH-match
shift pattern. The `--confidence-floor LOW` override is the
correct safety valve but unnecessary in those 15 cases.

Two additional ports (`func_020820b8.legacy_sp3.c` +
`func_020820f8.legacy_sp3.c`) refused at LOW because data
symbols referenced in COMMENT text (the sibling function's pool
literals — `data_021a1a18`, `data_021a19e8`) didn't appear in
the porting function's own parallel-reloc map.

## D2 v2 — auto-promote LOW → MEDIUM by neighbor-shift consensus

For each LOW resolution on a function symbol:

1. Walk outward from the EUR address in ordinal-rank order
   through the same module, collecting up to **N = 5** nearest
   neighbors that return HIGH from `find_siblings`.
2. Compute the **mode** of their (target_addr − eur_addr)
   shifts.
3. If ≥ **3 of 5** agree on the same shift, that's the
   consensus shift.
4. If the candidate's own shift matches the consensus, promote
   LOW → MEDIUM. Otherwise (anti-match), keep LOW.

The consensus computation is **cached per (module, target_region)**
within one port_to_region invocation — the second LOW symbol in
the same file reuses the work.

### Default tuning

| Parameter | Default | Rationale |
|---|---|---|
| `n_neighbors` | 5 | Brief 095's suggested floor. Matches the brief 090 calibration size — enough to filter noise; small enough to stay local. |
| `search_radius` | 30 | Walks 30 ordinal positions either side of the pivot. DS overlays have stable per-shift regions of >100 functions; 30 captures the local neighborhood without crossing into a different shift band. |
| `min_agreement` | 3 | Mode-of-5 needs ≥3 to call consensus. 2-2-1 splits or 3 distinct shifts indicate boundary regions where the rule shouldn't fire. |

### Worked example (`func_02001d98` → USA)

- EUR addr `0x02001d98`, USA equivalent at `0x02001d78`. Shift `-0x20`.
- `find_siblings` returns the USA candidate at LOW (no relocs to compare).
- 5 nearest HIGH neighbors all shift by `-0x20`.
- Auto-promoted to **MEDIUM** with rationale: *"D2 v2 auto-
  promoted LOW→MEDIUM (neighbor consensus shift=-0x20 from 5
  HIGH neighbors)"*

### Anti-match safeguard

If the LOW candidate's shift **differs** from the consensus,
the resolution stays LOW with the note *"D2 v2 anti-match:
candidate shift ±0xN ≠ consensus ±0xM from 5 HIGH neighbors
(kept LOW)"*. The decomper can then investigate before
relaxing the floor.

### Opt-out

`--no-auto-promote` disables the rule. The `--confidence-floor`
flag retains its full meaning (manual override always wins).

## D3 — data-symbol shift-consensus fallback

For each data symbol that misses the per-function parallel-
reloc map AND the exact-address match in the target region:

1. Compute the consensus shift across the existing
   `data_addr_map` entries restricted to the same module.
2. If ≥ **2 entries** agree on a single shift (data maps are
   smaller per function than the function-symbol neighborhood,
   so the threshold is lower than D2 v2's ≥3 of 5).
3. Apply the shift to the unmapped EUR address; check whether
   the target region has a data symbol there.
4. If yes, resolve with EXACT_ADDR confidence + the rationale
   *"D3 data-shift consensus ±0xN → region/module/0xADDR"*.

This catches the two brief-090 refusals (legacy_sp3 lazy-init
thunks) and any future port where a data symbol surfaces in
comment text or in a sibling function's reloc table but not in
this function's own.

## Calibration

Tested against 4 brief-090 LOW candidates and the 2 refused
legacy_sp3 ports:

| EUR source | Target | Before | After |
|---|---|---|---|
| `func_02001d98` | usa | LOW (--floor LOW) | **MEDIUM** ⭐ |
| `func_0200b35c` | usa | LOW (--floor LOW) | **MEDIUM** ⭐ |
| `func_0200bef4` | usa | LOW (--floor LOW) | **MEDIUM** ⭐ |
| `func_0200cf64` | usa | LOW (--floor LOW) | **MEDIUM** ⭐ |
| `func_02001d98` | jpn | LOW (--floor LOW) | **MEDIUM** ⭐ |
| `func_020820b8.legacy_sp3` | usa | NONE on `data_021a19e8` (refused) | **EXACT_ADDR** (D3) ⭐ |
| `func_020820f8.legacy_sp3` | usa | NONE on `data_021a1a18` (refused) | **EXACT_ADDR** (D3) ⭐ |

All 4 sampled LOW candidates auto-promoted with the correct
consensus shift; both legacy_sp3 refusals now resolve fully.

## Cycle-cost notes

- **D2 v2 first-call cost:** per LOW resolution, up to 30 extra
  `find_siblings` calls to find 5 HIGH neighbors. With caching,
  subsequent LOW resolutions in the same `(module,
  target_region)` cost only the candidate's own
  `find_siblings`.
- **D2 v2 cache hit:** O(1) lookup. Brief 094-style batch ports
  pay the consensus cost once per (module, target_region).
- **D3 cost:** linear walk of the `data_addr_map` (small —
  typically ≤ 10 entries per function). Negligible.

## Forward-looking implications

- **brief 094 retroactive benefit:** decomper's next cross-
  region apply wave runs without `--confidence-floor LOW`. Same
  outcomes minus the manual flag (and minus the refused
  legacy_sp3 ports).
- **Future cap-raise waves** that surface tiny relocless
  functions (the brief 086 wave 3 trajectory) port without
  operator intervention.
- **Anti-match telemetry** — when D2 v2 keeps a candidate LOW
  on shift mismatch, the rationale string flags the divergence
  for the decomper. Useful signal that the candidate might be
  the wrong target (e.g. a name-collided sibling at a different
  shift).

## Related

- Brief 064 deliverable 2 (PR #419) — original port_to_region
  D1 + D2.
- Brief 079 (PR #463) — D1 v2 overlay-prefix rename + D2 v2
  reloc-mask half-byte fix.
- Brief 090 (PR #483) — calibration data motivating this brief.
- `find_region_siblings.find_siblings` — the underlying
  fingerprint matcher whose LOW classification this rule
  promotes.
