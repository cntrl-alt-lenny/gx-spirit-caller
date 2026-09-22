### cloud/cluster-c-strings-research

**Goal:** Define the **cluster C `.rodata` strings +
const arrays recipe** per brief 113's plan. Brief 117's
sub-classification finding revealed that 47% of cluster
B is actually 4-byte ASCII strings → fold to cluster C.
**Effective cluster C pool: ~462 candidates** (347
native + 115 from brief 117).

**Context — what brief 117 surfaced:**

- mwcc 2.0/sp1p5 places `int x = N;` in `.data`
  automatically (W4 resolved).
- BUT mwcc reorders globals within a `.c` file → `.s`
  is safe default for groups.
- 115 of 247 cluster B candidates are 4-byte ASCII
  strings (size ≤ 4, byte pattern is printable ASCII).
  Brief 114's v2 shape heuristic mis-classified them
  as `scalar` because size ≤ 4 and the heuristic
  doesn't inspect bytes for size-4 values.

**The cluster C question for brief 119:**

What's the recipe for `.rodata` data? Specifically:

1. **`const char foo[] = "...";`** — does mwcc place
   this in `.rodata` automatically?
2. **`.s` with `.ascii`** (brief 115's DTCM precedent
   for `OSi_IrqCallbackTable` had `.word` directives;
   mwasmarm also has `.ascii`).
3. **`const`-qualified pointers** — `const T *p =
   &something;` placement.
4. **Wide string constants** — `L"..."` (if any in
   the pool; unlikely for ARM/mwcc but check).
5. **Large const arrays** — `const u32 table[] = { ...
   };` placement + ordering.

**Method:**

1. **Inventory the cluster C pool.** Run brief 114's
   worklist with `--cluster C`:

   ```bash
   python tools/data_worklist.py --version eur \
       --cluster C --top 30
   ```

   Plus the 115 mis-classified cluster B candidates
   (filter `--cluster B --shape scalar --size 4` and
   inspect byte patterns for printable ASCII).

2. **Pick 2-3 representative candidates** spanning:
   - Pure ASCII string buffer (size 4-16 bytes).
   - Larger string (size > 16).
   - Const array (uint16 or uint32 elements).

3. **Source-form sweep on each.** Try:
   - **`.c` approach:** `const char foo[] = "abc";`
     for strings; `const T arr[] = { ... };` for
     arrays.
   - **`.s` approach:** mwasmarm `.section .rodata`
     + `.ascii "abc"` / `.byte 0` / `.word 0xN`.

4. **Compare byte-identity.** Both approaches should
   produce identical bytes in `.rodata` at target
   address.

5. **Document the cluster C recipe.** Add to `docs/
   research/data-tier-scoping.md`. Include:
   - Default approach (`.c` for singletons, `.s` for
     groups per brief 117's pattern).
   - Edge cases.
   - How to handle the 115 mis-classified ex-cluster-
     B candidates (likely `.s` `.ascii` since they're
     small adjacent runs).

6. **Cross-reference brief 117** — note that the
   mis-classified cluster B candidates fold into
   cluster C's pool. Brief 114's data_worklist v2
   filter logic should be refined in a future
   brief (data_worklist v3 candidate per brief 117).

**Non-scope:**

- ❌ Bulk cluster C application (separate brief 121+
  decomper work).
- ❌ data_worklist v3 byte-pattern refinement
  (separate brief 122+ candidate).
- ❌ Cluster D research (sequenced after cluster C).
- ❌ Function-tier work.
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- **Cluster C recipe documented** in
  `data-tier-scoping.md` or a dedicated
  `cluster-c-recipe.md`.
- **2-3 worked examples** (different sub-shapes)
  byte-identical against `extract/eur/arm9/arm9.bin`.
- **Pool sizing confirmed** at ~462 (347 native + 115
  from brief 117).
- Markdown lint clean.
- Research index regen current.

**Branch:** `cloud/cluster-c-strings-research`

**Priority:** MEDIUM. Decomper brief 118 (cluster A
wave 2 overlay) is the higher-leverage immediate move.
Brief 119 unblocks brief 121+ cluster C scale-out.

**After this brief lands:**

1. **Brief 121 (decomper)** — cluster C wave 1 applying
   the recipe to ~30 candidates from the 462-pool. Per
   brief 113 throughput estimate: 10-20 syms/wave.
2. **Cluster C scale-out** continues until pool
   drained (~25 waves × 20 syms = 500).
3. **Brief 122 (cloud)** — data_worklist v3 byte-
   pattern refinement (per brief 117's
   recommendation).
4. **Cluster D research** (struct arrays + dispatch
   tables) — brief 113 plan, after cluster C lands.
