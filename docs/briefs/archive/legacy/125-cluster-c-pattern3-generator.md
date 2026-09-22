### cloud/cluster-c-pattern3-generator

**Goal:** Build a generator tool for **brief 119
cluster C Pattern 3** (chunk-section approach). Pattern
1 (4-aligned individuals, brief 122) ships cleanly;
Pattern 2 (group adjacents) has only 17 dsd-compatible
runs per brief 121's validation constraint discovery.
**The ~50-90 cluster C residue needs Pattern 3** to
close cluster C — generator-tool territory per brief
119's recommendation.

**Context — what brief 119 sketched for Pattern 3:**

Pattern 3: write one `.s` file per chunked `.rodata`
region containing ALL the symbols in that region, in
source order = address order, with mwasmarm directives.
The chunk must be 4-aligned at start + end (matching
W6 mitigation).

Similar to brief 115's cluster E DTCM pattern (one
`.s` for the entire DTCM section) and brief 116's
cluster A pattern (one `.s` per overlay's `.bss` gap),
but for `.rodata` chunks with byte content.

**Generator design:**

1. **Input** (CLI args):
   - `--version eur` / `--module main|ov<NNN>`
   - `--start 0x<addr>` `--end 0x<addr>` (chunk
     boundaries; must be 4-aligned)
   - `--symbols` (optional path to symbols list;
     otherwise generator queries data_worklist v3 or
     symbols.txt directly)

2. **Per-symbol generation:**
   - Read bytes from `extract/<version>/arm9/arm9.bin`
     (or per-overlay .bin) at the symbol's address
     + size.
   - Emit mwasmarm directive per byte/word/group:
     - Use `.ascii "..."` for printable ASCII strings
       (compresses output, easier to review).
     - Use `.word 0x...` for 4-byte aligned values
       (especially pointers — `.word data_X` if the
       value resolves to a known symbol).
     - Use `.byte 0x..., 0x..., ...` for arbitrary
       byte sequences.
   - Per-symbol header:

     ```
             .global data_<addr>
     data_<addr>:
             <bytes>
     ```

3. **Inter-symbol padding (if needed):** if dsd's
   delinks.txt header doesn't naturally cover the
   chunk's symbols contiguously, the generator emits
   explicit padding bytes between symbols. Brief 121's
   Pattern 2 verification surfaced the "Last Embedded
   Symbol Range Check" — Pattern 3 generator must
   ensure all embedded symbols fit within the chunk's
   range.

4. **Output:**
   - `.s` file at `src/<module>/data/data_<addr>.s`
     (or path matching convention).
   - delinks.txt entry covering the chunk's `.rodata
     start:0x... end:0x...` range.

5. **End-to-end test:**
   - Pick 1-2 representative chunks (e.g., a
     non-aligned string + array group that fails
     Pattern 2's validation constraint).
   - Run generator.
   - `ninja rom` + `dsd check modules` should report
     25/27 OK (no W6 cascade).
   - Byte-compare each embedded symbol against extract.

**Method:**

1. **Read brief 119 + 121's existing cluster C recipe
   doc** to understand Pattern 1 / 2 / 3 distinctions.
2. **Implement generator** at `tools/cluster_c_pattern3_gen.py`.
3. **Test on 1-2 chunks** picked from main or an
   overlay. Document the chunk-selection criteria
   (which symbol runs need Pattern 3 vs which fit
   Patterns 1 / 2).
4. **Add tests** to `tests/test_cluster_c_pattern3_gen.py`:
   - byte-pattern → `.ascii`/`.word`/`.byte` selection
   - inter-symbol padding correctness
   - delinks.txt header generation
   - end-to-end byte-identical for a known chunk.

**Non-scope:**

- ❌ Bulk cluster C Pattern 3 application (separate
  decomper brief 128 candidate after this lands).
- ❌ Cluster D / B work.
- ❌ Function-tier carryovers.
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- Generator tool at `tools/cluster_c_pattern3_gen.py`
  with `--version`, `--module`, `--start`, `--end`,
  `--symbols` flags.
- ~10-15 new tests in `tests/test_cluster_c_pattern3_gen.py`.
- 1-2 worked examples byte-identical against extract.
- Brief 119 / 121 recipe docs updated to point to the
  generator for Pattern 3 application.
- Markdown lint clean.

**Branch:** `cloud/cluster-c-pattern3-generator`

**Priority:** MEDIUM. Decomper brief 124 (cluster D
wave 1) is the higher-leverage immediate move. Brief
125 unblocks the ~50-90 cluster C residue that
Patterns 1 + 2 can't reach.

**After this brief lands:**

1. **Brief 128 (decomper) — cluster C wave 3 Pattern
   3 application** runs the generator across all
   non-aligned cluster C residue chunks. Estimated
   50-90 symbols closed.
2. **Cluster C closure trajectory:** Pattern 1 (~150-
   185) + Pattern 2 (~17) + Pattern 3 (~50-90) ≈
   close 220-290 of the ~462 effective pool. The
   remaining ~170-240 are likely string-ascii4 sub-
   pool (brief 123 v3 surfaced 115+ folded from
   cluster B) which Pattern 1/2 also handles.
