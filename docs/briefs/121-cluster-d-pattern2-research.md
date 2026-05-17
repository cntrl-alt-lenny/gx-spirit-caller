### cloud/cluster-d-pattern2-research

**Goal:** Two-part research brief.

**Part 1 — Cluster D research.** Per brief 113's plan:
struct arrays + dispatch tables. 98 native candidates.
Define the recipe; identify sub-clusters that may need
specialized handling.

**Part 2 — Brief 119 Pattern 2 verification.** Brief
119 sketched Pattern 2 (group adjacent non-aligned
cluster C symbols to 4-aligned total) but didn't
end-to-end test. Verify on 1-2 candidates; refine the
brief 119 recipe doc if needed.

**Context — what brief 113 said about cluster D:**

Cluster D = "struct arrays + dispatch tables." Per
brief 113:
- 98 candidates
- Difficulty: MED-HIGH
- Per-wave throughput: 3-5 tables
- Likely needs typedef discovery first OR `.s` chunking

Brief 113 noted: cluster D recipe should accommodate
struct arrays without typedef inference being a hard
blocker. Tool deferred to brief 120+ (now likely brief
124+ per the renumbering).

**Cluster D investigation questions:**

1. **What does a cluster D candidate look like?** Pick
   3-5 representative candidates from brief 114's v2
   filter:

   ```bash
   python tools/data_worklist.py --version eur \
       --cluster D --top 10
   ```

2. **Source-form options:**
   - `.c` with explicit typedef: `static const T arr[]
     = { {.a=1, .b=2}, ... };`. Requires knowing the
     struct layout.
   - `.c` with opaque byte array: `const u8 arr[] = {
     0x01, 0x00, ... };`. Loses semantic info but
     bypasses typedef discovery.
   - `.s` chunking: mwasmarm `.section .data` +
     `.word`/`.byte` directives. Same recipe as brief
     115's DTCM function-pointer table.

3. **Edge cases:**
   - **Dispatch tables (function-pointer arrays):**
     brief 115's `OSi_IrqCallbackTable` was an
     fnptr-table; the recipe extends. Verify on 1
     candidate.
   - **Nested struct arrays** (struct of struct):
     likely need typedef discovery; defer to
     `data_worklist v3` tool or hand-write.
   - **Variable-size struct arrays** (jump tables with
     trailing offsets): probably treat as cluster D
     but flag separately.

4. **Sub-cluster definitions:**
   - D-1: dispatch tables (function-pointer arrays) —
     likely fastest recipe (brief 115's `.s` precedent).
   - D-2: scalar struct arrays (e.g. arrays of pairs)
     — typedef-inferable.
   - D-3: complex struct arrays — defer to typedef
     tool brief.

**Brief 119 Pattern 2 verification (Part 2):**

Brief 119's Pattern 2:

```asm
        .section .rodata
        .global data_020c387c
data_020c387c:
        .ascii "NAN("
        .byte 0x00
        .global data_020c3881
data_020c3881:
        .ascii "INFINITY"
        .byte 0x00, 0x00, 0x00      ; padding to 4-aligned offset
```

5 + 9 + 2 = 16 bytes total (4-aligned). Brief 119
sketched but didn't test. Verify by:

1. Compile + link the worked example.
2. `ninja rom` + `dsd check modules` — confirm 25/27
   baseline preserved (no W6 cascade).
3. Byte-compare the `.rodata` region against extract.
4. If Pattern 2 works: update brief 119's recipe doc
   with verified worked example. If it fails:
   investigate why (likely dsd symbol-size deduction
   issue per brief 119's note).

**Non-scope:**

- ❌ Bulk cluster D application (separate brief 124+
  decomper work).
- ❌ Bulk cluster C Pattern 2 application (separate
  brief once Part 2 verifies).
- ❌ Typedef inference tool (separate future brief).
- ❌ Function-tier work.
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- **Part 1:** Cluster D recipe documented in `docs/
  research/data-tier-scoping.md` (or new
  `cluster-d-recipe.md`). Sub-cluster D-1 / D-2 / D-3
  classifications + pool sizing.
- **Part 2:** Pattern 2 verified or falsified with
  worked example. Brief 119's recipe doc updated.
- 1-2 worked examples per part (different sub-shapes).
- Markdown lint clean.
- Research index regen current.

**Branch:** `cloud/cluster-d-pattern2-research`

**Priority:** MEDIUM. Decomper brief 120 (cluster A
wave 3) is the higher-leverage immediate move. Brief
121 unblocks brief 124+ cluster D scale-out + finalizes
cluster C Pattern 2 sub-pool size.

**After this brief lands:**

1. **Part 1 lands:** brief 124 (decomper) candidate
   = cluster D wave 1 (apply D-1 recipe to 5-10
   fn-ptr tables).
2. **Part 2 lands:** brief 119's Pattern 2 sub-pool
   (~185-230 candidates) unlocks for brief 122 wave 2
   or a dedicated Pattern 2 wave.
3. **Tool gap:** if cluster D candidates need typedef
   inference at scale (more than hand-write per-
   candidate), brief 125+ tooling brief scopes a
   `data_worklist v3` or new typedef-inference tool.
