### cloud/c22-v2-expansion

**Goal:** Refine the **C-22 adjacent-bitfield wall** recipe
(brief 084, PR #471) using the 5 cumulative datapoints
brief 081 + 086 surfaced. Original recipe (bitfield-via-
union with explicit `: 4` widths) worked on 1 of 5 (brief
086 wave 3's `func_02001c98`). The other 4 datapoints have
different shapes that may need recipe variants — bit-set
with cache-flag side-effect, increment+init pattern.

**Context — what C-22 currently looks like:**

Brief 084 codified C-22 from 3 brief 081 chain datapoints:
- `func_020070dc` (strlen-style, struct-arg loop)
- `func_02001ef4` (bit-field pack on struct member)
- `func_0200a454` (4-iter copy with typedef'd globals)

Brief 086 wave 3 (PR #480) added 2 more datapoints + 1
successful production hit:
- `func_02001c98` ✅ — bitfield-via-union recipe shipped
  (brief 084 worked example)
- `func_02009758` ❌ — bit-set in word array with cache
  flag side-effect (silent-corruption, same +32-byte shift)
- `func_02000cc4` ❌ — increment counter + struct-array
  entry init (silent-corruption, same +32-byte shift)

**5 total datapoints**, 1 production hit, 4 still
unrecovered. The bitfield-via-union recipe works on the
single-word adjacent-bitfield shape; the other shapes likely
need different fixes.

**Method (per brief 050 / 054 / 084 pattern):**

1. **Reproduce all 4 unrecovered datapoints** under default
   mwcc 2.0/sp1p5. Confirm the +32-byte size shift recurs
   for each.

2. **Shape clustering** — group the 4 remaining datapoints
   by source-form structure:
   - Bit-set with side-effect (cache flag, IRQ disable)
   - Increment + struct-array entry init
   - Bit-field pack on struct member (already done in
     brief 084 — verify brief 084's recipe also works on
     `func_02001ef4` retroactively if it didn't)
   - Strlen-style loop (already done in brief 084)

3. **Per-shape C-variation sweep** (4-6 variations per
   shape):
   - Bitfield-via-union (brief 084's existing recipe —
     baseline)
   - Manual mask + shift (no bitfield syntax)
   - `static inline` helper for the bit-pack (separate TU
     emission)
   - `volatile` qualifier on the struct pointer (kills CSE
     opportunities)
   - `asm void` escape (last resort)
   - Reorder field declarations in the struct typedef
     (compiler may pad differently)

4. **15-SP boundary table** (per brief 088's template) —
   verify whether `.legacy.c` (1.2/sp2p3) routing alone
   recovers these without source-form changes, like it did
   for C-23.

5. **Classification refinement:**
   - If `.legacy.c` works for all 4 shapes → C-22 simplifies
     to "route via legacy" (same as C-15 / C-20 / C-23).
   - If shapes need distinct source-form recipes → C-22 gets
     sub-letters (C-22a bitfield, C-22b bit-set-side-effect,
     C-22c increment+init).
   - If one or more shapes resist all coercion → mark as
     P-N permanent for that variant.

**Non-scope:**

- ❌ Re-doing brief 084's bitfield-via-union sweep (already
  done; recipe shipped and validated in production via
  brief 086 wave 3).
- ❌ Touching unrelated walls (C-23 sweep just shipped via
  brief 088; C-22 is the next-most-corroborated wall
  needing refinement).
- ❌ AGENTS.md / state.md edits.

**Success:**

- All 4 unrecovered C-22 datapoints either recover via a
  documented recipe (added as C-22a / C-22b / C-22c) OR
  classified as P-N with the asm-grep discriminator added.
- codegen-walls.md C-22 entry updated with the per-shape
  breakdown + recipe table.
- Per-SP boundary table for whichever shape is the
  highest-fidelity match (mirrors brief 088's C-23 table
  structure).
- Markdown lint clean.

**Branch:** `cloud/c22-v2-expansion`

**Priority:** MEDIUM. Brief 090 (decomper cross-region apply)
is the higher-leverage immediate move. Brief 091 closes the
C-22 long tail in parallel — useful when decomper resumes
single-region work (potential brief 092 ≤0x80 cap-raise) but
not blocking.

**After this brief lands:**

1. Brief 092 (or whatever the next single-region wave is)
   inherits the refined C-22 recipe and recovers the bit-set
   + increment+init shapes that wave 3 dropped.
2. If a recipe doesn't exist for any of the 4 shapes (e.g.
   the bit-set-side-effect resists coercion entirely),
   decomper's selection rule can skip the shape pre-emptively
   rather than burning iteration time on it.
