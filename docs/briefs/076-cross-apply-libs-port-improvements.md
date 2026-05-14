### cloud/cross-apply-libs-port-improvements

**Goal:** Close the two tool-shaped follow-ups decomper
surfaced in brief 075 wave 1 (PR #454). Each unlocks a
bounded chunk of the cross-region pool that the current
`tools/cross_apply_libs_port.py` correctly refuses but
could be extended to handle.

**Context — what brief 075 wave 1 surfaced:**

| Refusal reason | Wave-1 count | Addressable by |
|---|---:|---|
| Byte-uniqueness ambiguity (4-byte stubs) | 50 | (not addressable — 2,632 byte-identical instances) |
| **`func_ov<NNN>_` filename pattern** | **29** | **D1 — regex fix (~1-line)** |
| **Uncompiled USA/JPN gap (no .o signature)** | **~5-10** | **D2 — raw-bytes + reloc-parity fallback** |
| BL-offset divergence (caught post-link) | 1 | (correctness signal — keep) |

D1 + D2 together unlock **~35 additional ports for cross-
region application** without sacrificing the tool's defensive
ambiguous-refuse semantics.

**Method (two independent deliverables):**

### D1 — Filename regex extension

The current `parse_port_filename` accepts `func_<addr>` and
`func_<addr>.legacy[_sp3].c` but rejects `func_ov<NNN>_<addr>`
(overlay-named ports from briefs 071+074). Wave 1 refused
29 ports on this — they're real cross-applicable ports,
just named per the overlay convention.

Extend `parse_port_filename` to accept:

```text
libs/nitro/func_ov<NNN>_<addr>.legacy.c
libs/nitro/func_ov<NNN>_<addr>.legacy_sp3.c
```

When extracting the EUR address for cross-region lookup,
the overlay-number prefix is informational only — the
`<addr>` is what's looked up against `find_region_siblings`.
The output filename in `delinks.txt` preserves the same
overlay prefix in the target region.

Verify with: re-run brief 075's sweep against current main;
the 29 `func_ov<NNN>_` refusals should flip to OK or fall
through to other refusal categories. None should newly
ambiguate.

### D2 — Raw-bytes + reloc-parity fallback

When `find_region_siblings` can't disambiguate via compiled
`.o` byte signatures (the target USA/JPN address has no
compiled `.c` — it's still an uncompiled gap in the per-
region build), fall back to:

1. **Raw ROM bytes**: read N bytes at the candidate address
   from `extract/<region>/arm9/arm9.bin` (or overlay binary).
2. **Mask reloc slots**: same `_mask_relocs` approach as
   `find_region_siblings.byte_similarity`.
3. **Reloc parity check**: verify the candidate's
   `config/<region>/**/relocs.txt` entries at matching
   offsets have the same kind (`func` / `data`) as
   upstream's reloc table.

Both checks must pass (raw-bytes sim ≥ 0.99 AND reloc
parity) for the candidate to be accepted. Refuses cleanly
on either failure.

Decomper's wave-1 PR documented this as: **"raw-byte
matching is necessary but not sufficient for ports with
internal BL relocs"** — the dropped `func_02093bfc` case
exactly. The fallback codifies that lesson.

**Non-scope:**

- ❌ Solving the 4-byte stub byte-collision problem. That's
  the 50-port refusal bucket; brain accepts those as
  "won't ever cross-apply" per decomper's wave-1
  diagnostic.
- ❌ Modifying `find_region_siblings` itself — D2's
  fallback lives in `cross_apply_libs_port`, calling
  `find_region_siblings` as the primary path.
- ❌ Approach B (upstream NitroSDK naming refactor) — that
  remains brief 076-future / 080+ territory.

**Success:**

- D1 lands: 29 `func_ov<NNN>_` ports unlock (re-run brief 075's
  sweep verifies). All three regions stay at 24/27.
- D2 lands: 5-10 additional ports unlock from the previously
  "uncompiled-gap" refusal bucket. Reloc-parity check
  prevents the BL-offset-divergence trap.
- All test additions pass; full suite stays green.
- Both deliverables can ship as a single PR or two — cloud's
  call.

**Branch:** `cloud/cross-apply-libs-port-improvements`

**Priority:** MEDIUM. Brief 074 (decomper's in-flight
cross-project wave 3) is the bigger immediate lever; brief 076
queues behind it. Brain will scope brief 077 (cross-region
re-sweep with the improved tool) after brief 076 lands.

**After this brief lands:**

1. Brain queues brief 077 (decomper) — cross-region apply
   wave 2: re-run cross_apply_libs_port against the now-
   larger pool (87 existing + brief 074's new ports + any
   from brief 075's refusals that newly resolve via D1/D2).
2. Brief 074 + 077 together should push USA + JPN badges
   past ~0.6% each (the original brief 075 projection,
   now achievable with the wider pool).
