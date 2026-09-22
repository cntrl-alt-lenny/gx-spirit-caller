### cloud/data-worklist-v3

**Goal:** Refine `tools/data_worklist.py` v2's shape
heuristic to distinguish 4-byte values into sub-shapes.
Per brief 117's 47% cluster B mis-classification
finding + brief 121's 32-pointer fold into cluster D.
v3 surfaces these distinctions in the worklist output
so brief 124+ wave selection picks the right cluster
per candidate.

**Context — v2 limitations brief 117 + 121 surfaced:**

Brief 114's v2 shape heuristic for size-4 values is
binary: scalar or not-scalar. This causes:

- **Brief 117 finding:** 115 of 247 cluster B
  candidates (47%) are actually 4-byte ASCII strings,
  not scalars. v2 classifies them as `shape=scalar`
  because size ≤ 4 and the heuristic doesn't inspect
  bytes.
- **Brief 121 finding:** 32 of 247 cluster B
  candidates are 4-byte pointers (resolve to code
  addresses). Brief 121 folded these into cluster D's
  D-1 sub-cluster (dispatch/pointer tables).

**v3 deliverables:**

1. **New sub-shape values for size-4 values:**
   - `string-ascii4`: 4 bytes, at least 3 of which are
     printable ASCII (0x20-0x7e); the 4th typically
     null (0x00) or printable.
   - `pointer-code`: 4 bytes form a valid ARM9 code
     address (range 0x02000000 - end-of-`.text` in
     main or per-overlay base + size).
   - `pointer-data`: 4 bytes form a valid data address
     (range 0x021xxxxx for `.data`/`.rodata`/`.bss`,
     including DTCM 0x027exxxx).
   - `scalar` (default): anything else.

2. **Refined v2 cluster filter logic:**
   - `--cluster B` filters to `shape=scalar` only (was
     `size <= 8 && shape=scalar`). Excludes ASCII
     strings + pointers.
   - `--cluster C` includes `shape=string-ascii4` and
     `shape=string` (multi-byte ASCII).
   - `--cluster D` includes `shape=pointer-code`,
     `shape=fnptr_table`, `shape=struct`, `shape=array`.

3. **Output enrichment:**
   - New `shape` column values in v3 output.
   - Section-shape distribution table updated to
     include the new sub-shapes.

4. **Cluster shorthand alignment:** the `--cluster A/
   B/C/D/E` flags continue to work; v3 just refines
   what each maps to.

**Method:**

1. Add 3 new shape constants:
   `SHAPE_STRING_ASCII4`, `SHAPE_POINTER_CODE`,
   `SHAPE_POINTER_DATA`.
2. Extend `classify_shape()` to detect them via byte-
   pattern inspection:
   - Printable-ASCII heuristic: count printable bytes
     in size-4 values.
   - Pointer heuristic: parse bytes as little-endian
     u32, check if address falls in a known code or
     data section. Requires loading section ranges
     (already done by v2's `ModuleSections`).
3. Update cluster filters to use the new sub-shapes.
4. Add tests for each new shape detection path.
5. Sanity-check on brief 117's 247-candidate cluster B
   pool: post-v3, the breakdown should be ~86 scalars
   + ~115 ascii4 + ~32 pointer-code + ~14 unclassified
   (matching brief 117's manual sub-classification).

**Non-scope:**

- ❌ Typedef inference (separate future brief).
- ❌ New tool commands (data_worklist v3 stays the
  same CLI shape; just refines shape values).
- ❌ Cluster recipes (those are brief 117 / 119 / 121
  scope).
- ❌ Function-tier carryovers.
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- 3 new shape sub-values implemented + tested.
- Cluster filters updated to use them.
- Sanity check: cluster B pool partitions match brief
  117's manual sub-classification (within rounding).
- ~10-15 new tests in `tests/test_data_worklist.py`.
- Markdown lint clean.

**Branch:** `cloud/data-worklist-v3`

**Priority:** MEDIUM. Decomper brief 122 (cluster C
wave 1 Pattern 1) is the higher-leverage immediate
move. Brief 123 unblocks brief 124+ wave selection.

**After this brief lands:**

1. **Brief 124+ waves use v3's refined filters** —
   `data_worklist.py --cluster D --shape pointer-code`
   surfaces clean D-1 candidates; `--cluster C
   --shape string-ascii4` surfaces clean Pattern 1
   ASCII strings.
2. **Methodology pattern continues:** tooling
   refinement → cleaner pool selection → less manual
   per-candidate inspection → faster waves.
