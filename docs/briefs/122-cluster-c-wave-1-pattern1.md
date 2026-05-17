### decomper/cluster-c-wave-1-pattern1

**Goal:** First production application of brief 119's
**cluster C Pattern 1 recipe**. ~150-185 4-aligned
individual symbols (30-40% of 462-candidate effective
pool). Wave 1 picks 20-30 from highest-cross-module-
reader candidates. **First production use of W6
mitigation at scale.**

**Context — what brief 119 codified:**

- **W6 wall:** mwldarm rounds `.rodata` section size to
  4-byte alignment + dsd LCF `.ctor` `ALIGN(32)`
  cascade → any non-4-aligned `.rodata` claim shifts
  everything by 32 bytes → all modules fail.
- **Pattern 1 mitigation:** symbols whose individual
  size is already a multiple of 4 bytes pass cleanly.
  No grouping, no chunking — just declare the
  individual symbol.
- **Worked example:** `data_020b4748` (32 bytes,
  `const u16[16]`).

**Recipe template:**

```c
/* src/main/data_<addr>.c */
const <type> data_<addr>[<count>] = {
    /* byte values in original order */
};
```

Notes per brief 119:
- `const` qualifier is required for `.rodata`
  placement (without it, mwcc places in `.data`).
- Type choice: pick the natural type for the byte
  width (`u8[N]`, `u16[N/2]`, `u32[N/4]`).
- Array sizes: ensure `sizeof(arr) == orig_size` —
  miscounting triggers W6.

**Wave 1 method:**

1. **Enumerate the Pattern 1 sub-pool.** Run:

   ```bash
   python tools/data_worklist.py --version eur \
       --cluster C --top 50
   ```

   Filter the output for **size % 4 == 0** (Pattern 1
   candidates). Brief 119 estimated ~150-185.

2. **Pick 20-30 candidates** for wave 1 from the top
   of the worklist (highest cross-module reader
   density first — SDK-fundamental candidates that
   unblock multi-overlay readers). Skip:
   - Candidates with size NOT divisible by 4 (Pattern
     2/3 territory).
   - Candidates flagged as fnptr_table by v2 (those
     are cluster D-1 — separate brief 124+ wave).

3. **Per-candidate workflow:**
   - Read the original bytes from
     `extract/eur/arm9/arm9.bin` at the candidate's
     address (or `dsd extract` output).
   - Write source as `src/main/data_<addr>.c` (or
     `src/overlay<NNN>/data_<addr>.c` for overlay
     candidates).
   - Add TU claim to the appropriate `delinks.txt`
     entry.
   - `ninja rom` + `dsd check modules`.
   - Verify byte-identical via `xxd` against extract.

4. **W6 cascade detection:** if `dsd check modules`
   reports < 25 OK after any candidate lands, **the
   W6 cascade has fired**. Bisect: revert the last
   addition, confirm baseline restored, debug the
   specific candidate's size/type/alignment.

**Self-extend clause:**

If wave 1 covers 25+ candidates cleanly, optionally
extend to 40-50 in the same brief. Pattern 1 pool is
150-185 candidates total — 3-4 waves close it.

**Non-scope:**

- ❌ Pattern 2 application (brief 124+ candidate; 17
  dsd-compatible runs per brief 121).
- ❌ Pattern 3 chunk-section (generator-tool
  territory).
- ❌ Cluster D / B application.
- ❌ Cross-region apply for new matches.
- ❌ Function-tier carryovers.
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- ≥ 20 cluster C `.rodata` symbols claimed via Pattern
  1 recipe.
- All 3 regions stay at 25/27 baseline (no W6 cascade).
- Per-wave PR with funnel + per-symbol byte-match
  confirmation + Pattern 1 sub-pool size validation.

**Branch:** `decomper/cluster-c-wave-1-pattern1`

**After this brief lands:**

1. **If Pattern 1 lands cleanly:** brief 125 (cluster
   C wave 2) inherits the recipe; pool drain
   trajectory established.
2. **If W6 cascade fires on a "4-aligned" candidate:**
   investigate dsd's section-end alignment behavior
   for individual `.rodata` claims (vs cluster A
   `.bss` claims which sail through). May surface a
   refinement to brief 119's Pattern 1 spec.
3. **Cluster A wave 4** still pending (small
   overlays); decomper picks between cluster C wave 2
   and cluster A wave 4 based on which has higher
   leverage post-122.
