### cloud/cross-apply-tool-v2-fixes

**Goal:** Close the two `cross_apply_libs_port.py` gaps decomper
surfaced in brief 078 wave 2 (PR #461). Together they unlock
~30 more cross-region ports — the last bounded chunk of the
cross-region pool before natural drain.

**Context:**

Brief 078 wave 2 landed 11 of 40 target; pipeline at 39/99
(39% coverage). Two specific bugs in `cross_apply_libs_port.py`
account for ~30 of the remaining un-applied ports:

| Bug | Pool blocked |
|---:|---:|
| D1 v2 — overlay-prefix rename strategy | ~25 ports |
| D2 v2 — raw-bytes false-positive on internal BL | ~3-5 ports |

**Method:**

### D1 v2 — preserve `ov<N>_` prefix in rename target

Wave 2 surfaced one example: `func_ov015_021b3168.legacy.c`
ported with rename target `func_021b3168` (no prefix). Our
libs/ file declares the function as `func_ov015_021b3168` —
symbol mismatch breaks the link.

Fix: when the EUR port filename matches `func_ov<NNN>_<addr>`,
preserve the `ov<NNN>_` prefix in the target-region rename.
Same shape as the existing `func_<addr>` flow but with the
overlay-qualified symbol-name template.

The tool already walks per-region symbols.txt by address
correctly (PR #456 D1 confirmed); only the rename-target-name
construction needs the prefix-preservation.

### D2 v2 — mask reloc-affected bytes before raw-bytes comparison

PR #456's D2 fallback compares raw masked bytes (reloc slots
zeroed) between regions. The issue: ARM `bl` encodes a
24-bit PC-relative offset, and when the target symbol lives
at different addresses across regions, the encoded offset
bytes differ even though the reloc slot itself is consistent.

Wave-2 example: `func_02093bfc` raw-bytes match passes (the
4-byte reloc slot is masked) but the compiled BL to
`OS_DisableIrq` produces different actual bytes in USA vs
EUR.

Fix: extend the reloc-mask to include the full instruction
slot (not just the 4-byte word starting at the reloc-from
offset). For ARM, that's 4 bytes per BL instruction; for
Thumb-2 BL it's typically a 4-byte pair starting at a 2-byte
aligned offset.

Brief 075's "raw-byte matching is necessary but not
sufficient" lesson is the prior art; PR #456's D2 reloc-
parity check was the partial fix; D2 v2 closes the
encoding-divergence subset.

**Non-scope:**

- ❌ Refactoring the entire cross-apply pipeline. D1 v2 + D2
  v2 are bounded; same architectural shape as PR #456.
- ❌ Approach B libs/ naming refactor — separate scope.
- ❌ The ~30 four-byte trivial-stub bucket. Structurally
  un-cross-applicable per brief 075's calibration.

**Success:**

- D1 v2: re-run brief 078 wave-2 sweep. The 25 overlay-
  prefix-blocked ports should now resolve cleanly through
  the tool.
- D2 v2: re-run wave-2 sweep against ports with internal
  BL relocs. The previous `func_02093bfc` BL-divergence
  case should refuse cleanly rather than emit byte-diverging
  output.
- All test additions pass; full suite stays green.

**Branch:** `cloud/cross-apply-tool-v2-fixes`

**Priority:** MEDIUM. Brief 081 (decomper single-region
hard-tier) is the bigger strategic pivot; brief 079 closes
out the cross-region tail so brain can fully pivot decomper
without leaving ~30 ports on the table.

**After this brief lands:**

1. Brain queues brief 082 (decomper, MEDIUM) — final cross-
   region apply wave 3 consuming the ~30 D1 v2 + D2 v2
   unlocks. After that wave, cross-region pipeline closes.
2. Cross-region pipeline final cap (~70 ports applied) means
   USA + JPN badges should top out around ~0.5% each before
   decomper's next single-region wave starts contributing
   the 3× regional multiplier on new ports.
