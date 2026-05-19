### decomper/cluster-b-size-1-2-main-wave

**Goal:** Drain cluster B's ~13 remaining main-module size-1/2
candidates using brief 152's locked `.c` recipe (which works on
main — `patch_module_literals.py` runs post-link on `arm9.bin`
and resolves absorbed-placeholder `kind:load` relocs correctly).
Single-wave brief; complements brief 153 (overlay-side, just
landed) to close cluster B's size-1/2 sub-pool entirely.

**Context:**

Brief 152 (PR #579) locked workaround #3 with a worked example
on a MAIN candidate (`data_021020b4`, 16-int `unsigned int[N]`
bundle). Brief 153 (PR #582) then drained the overlay portion
via an adapted multi-symbol `.s` chunk recipe — necessary because
`tools/patch_module_literals.py` does NOT run on overlay binaries,
so the `.c` bundle's absorbed-placeholder `kind:load` relocs would
resolve to `0x00000000` at overlay link time.

The main-module portion is the residue: brief 148's survey
flagged ~14 main candidates; brief 152 worked one as the recipe-
lock example; ~13 remain.

The main candidates use **brief 152's original `.c` recipe**, not
brief 153's `.s` adaptation. `patch_module_literals.py` will
correctly rewrite the absorbed-placeholder load literals post-link.

**Scope:**

Apply brief 152's `.c` recipe per [`docs/research/cluster-b-
size-1-2-recipe.md`](../research/cluster-b-size-1-2-recipe.md).
Per-candidate steps:

1. Identify the size-1/2 candidate from cluster B's main-module
   W6-rejected sub-pool (brief 148's ~14 list minus brief 152's
   `data_021020b4`).
2. Inspect the deduced range from the candidate's vaddr to the
   next named symbol.
3. Confirm the range is zero-padded (no intervening named
   symbols).
4. Emit as `unsigned int[N]` (or `struct` if fields carry
   semantic meaning).
5. Verify byte-identical via objdiff + 3-region `ninja sha1`
   PASS.

**Critical: use the `.c` recipe, not brief 153's `.s` form.**
The `.s` form was an overlay-specific adaptation because
`patch_module_literals.py` only runs on `arm9.bin`. On main,
the original `.c` bundle works correctly because the patcher
resolves the `kind:load` literals.

**Selection rule:**

Walk cluster B's main-module size-1/2 candidates from brief 148's
survey. Skip any candidate whose deduced range contains
intervening named symbols (per brief 153's sanity check) — those
need a different recipe or sub-brief. Also skip any candidate
whose `relocs.txt` shows the absorbed placeholders are referenced
by name from other code (brief 149's pattern) — those need
per-slot singletons, not bundles.

**Required smoke test (decomper runs pre-PR, brain re-runs
pre-merge):**

```
python tools/configure.py eur && ninja sha1   # must PASS
python tools/configure.py usa && ninja sha1   # must PASS
python tools/configure.py jpn && ninja sha1   # must PASS
```

Expected: all three regions PASS `ninja sha1`. **If any region's
SHA1 drops from PASS to FAIL the PR does not merge.**

Run per-claim objdiff check on each bundled TU's address range
(brief 152's worked-example discipline).

**Self-extend gate** (unchanged):

- Yield ≥ 40%, AND
- Bytes-matched ≥ 250.

Cluster B main size-1/2 bundles are likely ≥ 64 bytes each per
brief 152's `data_021020b4` example; the bytes gate should clear
trivially. If the pool drains before gates trigger self-extend,
brief 155 closes after wave 1.

**Apply list:**

1. **Brief 152 `.c` workaround #3 is the recipe** for main
   candidates. Brief 153's `.s` adaptation is for overlays only;
   do not use it on main.
2. **Bundle-vs-singleton decision per candidate** — same
   `relocs.txt` check as brief 149 / 153.
3. **Carryovers unchanged** — C-22 adjacent-bitfield, C-21
   ternary, C-20 halfword-pack, S-1 padding, S-2 switch ordering,
   C-23 candidate MMIO base folding (still pending cloud sweep).

**Non-scope:**

- ❌ Cluster B's overlay size-1/2 candidates — drained by brief
  153.
- ❌ Cluster B's ~21 W6-rejected size=4 candidates (unaligned or
  value=0) — separate research, BSS handling.
- ❌ Other clusters (A, C, D-1, D-2, D).
- ❌ Touching `tools/`, `AGENTS.md`, `docs/state.md`.

**Success:**

- Wave 1 PR opens with the main-module size-1/2 candidates
  bundled per brief 152's `.c` recipe. Yield + bytes reported in
  PR body.
- 3-region `ninja sha1` PASS preserved.
- Per-claim byte-identical via objdiff on each bundle's address
  range.
- Brain scopes the next decomper brief based on remaining cluster
  B residue (W6-rejected sub-pool) and / or other cluster
  wavefronts.

**Branch:** `decomper/cluster-b-size-1-2-main-wave`

**Priority:** HIGH. Brief 153 drained the overlay portion at 100%
yield; the main portion is the obvious completer. Brief 152
already locked the `.c` recipe + verified on a main worked
example.

**After this brief lands:**

1. Brain runs 3-region SHA1 PASS smoke test.
2. Cluster B size-1/2 sub-pool fully drained.
3. Next decomper brief options: cluster B's ~21 W6-rejected
   candidates (needs BSS / `.s` recipe research first), or
   pivot to a different cluster wavefront, or pick up any work
   unblocked by brief 154's reclassification research once cloud
   re-ships #581 cleanly.
