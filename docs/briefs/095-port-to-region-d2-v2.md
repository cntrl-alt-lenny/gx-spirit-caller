### cloud/port-to-region-d2-v2

**Goal:** Implement `port_to_region.py` **D2 v2** — auto-
promote LOW-confidence candidates to MEDIUM when the
EUR↔target address-shift parity matches HIGH neighbors.
Brief 090 calibration: **15 of 15 LOW-confidence ports
on substantive (≥0x20) functions landed byte-identical.**
The current `--confidence-floor LOW` override is the
correct safety valve but a tool-internal promotion rule
eliminates the manual override and lets brief 094 (and
future cross-region waves) run cleanly.

**Stretch deliverable D3:** data-symbol parallel-reloc
resolution for `legacy_sp3` lazy-init thunks (the 2
brief-090 refusals that referenced `data_021a1a18` /
`data_021a19e8` globals without USA/JPN equivalents in
the resolution map).

**Context — what brief 064 D2 currently does:**

`port_to_region.py` (brief 064 D2, PR #419 + D2 v2 reloc-
aware byte mask in PR #463) maps an EUR-region matched
function to its USA / JPN sibling by:

1. **D1 symbol resolution** — find equivalent function at
   target region via byte fingerprint + callee parity
   (PR #448 v2 ambiguous-callee fix).
2. **D2 byte mask** — compare byte-by-byte ignoring
   reloc-target slots; if remaining bytes match, declare
   target found.
3. **Confidence floor** — HIGH (mask + reloc parity both
   match) / MEDIUM (mask matches, partial reloc info) /
   LOW (size + ish-match, no relocs to compare).

Default refuses below HIGH. `--confidence-floor LOW`
overrides for cases where size + shape are enough.

**What brief 090 calibration showed:**

15 LOW-confidence ports landed byte-identical when the
**EUR↔target address shift** matched the shift pattern
of neighboring HIGH matches in the same module region.
E.g.:

- `func_02006e54` (EUR) → `func_02006e5c` (USA) →
  `func_02006e74` (JPN). Per-region shift +8 / +32.
- Neighboring HIGH matches in the same kbyte:
  `func_02006e80` → `func_02006e88` / `func_02006ea0`
  (+8 / +32) and `func_02006d8c` → `func_02006d94` /
  `func_02006dac` (+8 / +32).
- LOW-confidence candidate shares the same +8 / +32
  pattern → safe to auto-promote MEDIUM.

**The rule:**

```
If LOW-confidence candidate's (EUR_addr → target_addr)
shift matches the consensus shift of N nearest HIGH-
matched neighbors in the same module:
    promote LOW → MEDIUM
```

Suggested heuristic — cloud's discretion on tuning:

- **N = 5** nearest HIGH neighbors (3 above, 2 below or
  vice versa; symmetry preferred).
- **Consensus shift** = mode of the 5 shifts. Require ≥3
  of 5 to agree on the same shift.
- **Tolerance** = exact match (shifts are constant
  offsets in DS overlays; fuzz isn't needed).

**Method:**

1. **Add neighbor-shift lookup helper to
   `tools/port_to_region.py`** — given an EUR addr, return
   the consensus shift of the N nearest HIGH neighbors.
2. **Wire the promotion rule** into the confidence-floor
   evaluation. LOW → MEDIUM if neighbor-shift matches.
3. **Test against brief 090's 15 LOW-floor ports** — all
   should auto-promote without `--confidence-floor LOW`
   override.
4. **Test against an intentional anti-match** — pick an
   EUR port whose target candidate has a different shift
   from neighbors (likely indicates wrong-target
   resolution). Should stay LOW or fail D1.
5. **Document the rule** in `tools/port_to_region.py`
   docstring + `docs/research/cross-region-pipeline.md`
   (or wherever brief 064 / 075 documented the existing
   D2 logic).

**D3 stretch — data-symbol parallel-reloc:**

The 2 brief-090 refusals (`func_020820b8.legacy_sp3.c` +
`func_020820f8.legacy_sp3.c`) reference `data_021a1a18`
and `data_021a19e8` globals. port_to_region.py's reloc
resolution looks up callee parity but not data-symbol
parity. **Suggested D3:**

1. Extend the reloc resolver to handle data-symbol relocs
   (`R_ARM_ABS32` against `data_*` symbols, not just
   `func_*` symbols).
2. Build a data-symbol parallel-reloc map for the 3
   regions (similar to the function-symbol map in the
   existing tooling).
3. Test by re-running the 2 brief-090 refusals — if they
   port cleanly post-D3, D3 ships in the same PR. If
   they need more work (e.g. region-specific data
   layouts), spin out as brief 097.

**Non-scope:**

- ❌ Tool rewrites — incremental enhancement only.
- ❌ Cross-project tooling (`cross_apply_libs_port.py`) —
  separate pipeline, not in this brief.
- ❌ port_to_region.py command-line flag changes that
  break backward compatibility. The `--confidence-floor`
  flag stays as the manual override; D2 v2 just makes it
  unnecessary for the common case.
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- D2 v2 rule implemented + tested against the 15 brief-
  090 LOW-floor ports — all auto-promote.
- Anti-match test passes (wrong-shift candidate stays
  LOW or fails earlier).
- Existing tests (`tests/test_port_to_region.py` if
  present) still pass; new test added for the auto-
  promote rule.
- D3 (if attempted) shipped alongside or filed as brief
  097 with clear progress note.
- Markdown lint clean.
- Brief 094 (decomper, parallel) benefits when it next
  runs port_to_region — fewer manual overrides needed.

**Branch:** `cloud/port-to-region-d2-v2`

**Priority:** MEDIUM. Brief 094 (decomper cross-region
apply wave 2) is the higher-leverage immediate move.
Brief 095 runs in parallel — D2 v2's value compounds with
each future cross-region wave; D3 unlocks the legacy_sp3
refusals (small but visible win on the brief-090 funnel
table).

**After this brief lands:**

1. Brief 094 retroactively benefits (decomper re-runs
   port_to_region without `--confidence-floor LOW`
   override; same outcomes minus the manual flag).
2. **Brief 096 (permuter wrapper)** becomes the next
   cloud move — the 5 macOS setup-gap patches from brief
   093 PR #487. Hard prereq for any future P-class
   investigation.
3. If D3 didn't ship in this brief, brief 097 picks it
   up with whatever scope brief 095's research surfaced.
