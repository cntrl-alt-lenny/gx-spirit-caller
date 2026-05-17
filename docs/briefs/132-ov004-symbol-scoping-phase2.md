### cloud/ov004-symbol-scoping-phase2

**Goal:** **🔑 THE ACTUAL 26/27 BASELINE UNLOCK.** Per
brief 131's Phase 2 plan + symbol-collision root cause:
break the mwldarm veneer trigger by localizing sibling-
overlay FUNC symbols at link time. Brief 131 Phase 1
shipped 95% byte-diff reduction via ALIGNALL; Phase 2
closes the remaining 8125 bytes by addressing the
underlying veneer-emission cause.

**Context — what brief 131 established:**

- mwldarm emits 86 spurious thumb→arm veneers because
  ov004 references ov002 functions at the same VA
  (overlay-swap aliasing).
- Brief 131's investigation found that **mwldarm's
  veneer decision is FUNC-biased + overlay-blind**:
  when a DATA symbol in ov004 collides with a FUNC
  symbol in ov002 at the same VA, mwldarm chooses
  FUNC as the call target and emits a veneer.
- Phase 1 (ALIGNALL 4 → 2) reduces the cascade but
  doesn't remove the veneers themselves.

**Symbol-collision example** (per brief 131):
- `data_ov004_02208760` (kind:DATA in `.rodata` of ov004)
- `func_ov002_02208760` (kind:FUNC in `.text` of ov002)
- Same VA `0x02208760` — both exist because ov002 +
  ov004 are mutually-exclusive overlays.

**Brief 132 approaches (try in order):**

### Approach A — Per-overlay link inputs (preferred)

Strip ov002 symbols from ov004's link input so mwldarm
literally doesn't see ov002 functions when linking
ov004.

- Modify dsd's LCF gen or the build's link-step to
  feed only the relevant overlay's symbols.
- Per-overlay symbols.txt slicing.
- Risk: dsd's link model may not support this cleanly;
  may require modifying dsd or the build wrapper.

### Approach B — Symbol-local visibility

Mark ov002 funcs as local-to-ov002 at link time so
they're not visible from ov004's link unit.

- Pre-link pass that rewrites ov002 funcs as local
  symbols.
- Risk: may affect other tools/passes that need to
  resolve cross-overlay references.

### Approach C — Symbol-rename pre-link

Rename ov002 funcs to ov002-scoped names (e.g.
`__ov002_func_02208760`) before linking ov004, so the
collision goes away entirely.

- Simplest mechanically but requires renaming back
  for any future cross-overlay analysis.
- Risk: dsd's symbol-resolution + objdiff workflows
  may break.

**Method:**

1. **Read brief 131's research note** + `docs/research/
   ov004-thunk-section-fix.md` for the full Phase 1
   analysis + Phase 2 sub-option discussion.

2. **Try Approach A first** (per-overlay link inputs).
   - Investigate dsd's `--link-step` or `--lcf-gen`
     options.
   - Per-overlay symbols-list slicing (cat
     `config/eur/arm9/overlays/ov004/symbols.txt` +
     SDK symbols only; exclude ov002's symbols).
   - Test with a single-overlay link to confirm
     no-cross-overlay symbol resolution still works.

3. **End-to-end test:**
   - `python tools/configure.py eur && ninja rom`
   - `./dsd check modules -c config/eur/arm9/config.yaml`
   - Goal: ov004 module FAILED → OK.
   - Main auto-flips on 9 of its 10 cascade bytes
     (post-brief-131); the 10th is brief 127's Cat 1
     which brief 128 already fixed via source — verify
     this flips too post-Phase-2.

4. **If Approach A fails**: try B (symbol-local
   visibility) or C (pre-link rename).

5. **Document outcome**:
   - Update `docs/research/ov004-thunk-section-fix.md`
     (Phase 2 results section).
   - W7 wall entry: extend mitigation tiers.

**Per-region verification:**

ov004 fix should work cross-region (the veneer
mechanism is the same on EUR/USA/JPN). Verify all 3
regions flip ov004 OK.

**Non-scope:**

- ❌ Source-level matching of ov004's 309/310
  placeholder functions (orthogonal).
- ❌ Function-tier work.
- ❌ AGENTS.md / state.md edits beyond this PR.

**Success:**

- **ov004 module checksum: FAILED → OK** across all
  3 regions.
- **Main auto-flips** on its 9 cascade bytes (10 → 1
  → 0 if Cat 1 also clears).
- **3-region baseline ≥ 26/27**; 27/27 if main also
  flips fully.
- Updated W7 documentation.
- No regressions in other modules.

**Branch:** `cloud/ov004-symbol-scoping-phase2`

**Priority:** HIGH. **🔑 26/27 baseline unlock.** Decomper
brief 133 (parallel-track) runs in parallel.

**After this brief lands:**

1. **26/27 (or 27/27) baseline achieved.** Visible-
   progress milestone — first multi-module-baseline
   improvement since brief 116's 25/27.
2. **Brief 134+ data-tier waves can include ov004
   cluster C / D candidates** (skipped since brief
   122).
3. **If 27/27 achieved**: only function-level work
   remains for SHA1-match. Long road but toolchain
   is now clean.
4. **If 26/27 (main still has residue)**: Brief 135
   candidate = main residue cleanup (likely 1-2 bytes
   remaining).
