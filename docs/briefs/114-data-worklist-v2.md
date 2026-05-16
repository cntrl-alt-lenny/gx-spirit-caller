### cloud/data-worklist-v2

**Goal:** Extend the brief 081-era `tools/data_worklist.py`
to support **section + size + shape filtering**. Required
tooling for brief 116+ data-tier scale-out waves to run
cleanly. ~4-6h cloud work per brief 113's scope.

**Context — current state per brief 113 scoping:**

- `tools/data_worklist.py` ranks data symbols by cross-
  module reader density (brief 081-era logic).
- Outputs ~2020 worklist candidates from the EUR `relocs.txt`.
- **Gaps for data-tier application waves:**
  - No section filter (.bss / .data / .rodata / DTCM /
    ITCM).
  - No size filter (per-byte budget for wave selection).
  - No shape filter (scalar vs struct array vs string
    table — needed for cluster routing per brief 113's
    A-E taxonomy).

**Deliverables:**

1. **Section filter.** `--section bss|data|rodata|dtcm|
   itcm|all` (defaults to `all`). Filters worklist
   output by the data symbol's containing section.
   Section info is in `dsd`'s output / `delinks.txt` /
   `symbols.txt`.

2. **Size filter.** `--size-min N --size-max M` (in
   bytes). Per brief 113's cluster recipes:
   - Cluster A `.bss`: per-symbol size varies widely;
     wave 1 likely picks mid-size chunks (~0x40-0x400
     range).
   - Cluster B `.data`: scalars are typically 1/2/4
     bytes.
   - Cluster C `.rodata`: strings + const arrays
     (0x10-0x100+).
   - Cluster D struct arrays: typically ≥0x40.

3. **Shape filter.** `--shape scalar|struct|array|
   string|fnptr_table|jump_table`.
   - **scalar:** size 1/2/4 bytes, no internal
     structure.
   - **struct:** typedef-typed (when known) or
     opaque-byte-array.
   - **array:** repeated element pattern (heuristic:
     symbol size / element size ≥ 2).
   - **string:** ASCII byte pattern (heuristic: contains
     printable ASCII + null terminator).
   - **fnptr_table:** array of code-section pointers
     (heuristic: every 4-byte aligned word resolves to
     a `.text` reloc).
   - **jump_table:** code-section pointer array used by
     a switch/dispatch (heuristic: cross-referenced by
     `ldr pc, [pc, rN, lsl #2]` patterns or similar).

4. **Combined filter:** `--cluster A|B|C|D|E` is a
   shorthand for the appropriate section + size + shape
   combination per brief 113's recipes. E.g., `--cluster
   A` = `--section bss --shape struct,array`.

5. **Output enrichment.** Add columns to existing
   worklist output:
   - `section`: bss / data / rodata / dtcm / itcm
   - `size`: byte count
   - `shape`: scalar / struct / etc.
   - `readers`: existing cross-module reader count

**Method:**

1. Read existing `tools/data_worklist.py` + understand
   the brief 081-era logic (cross-module reader
   ranking).
2. Add section detection via `dsd`'s output or by
   reading delinks.txt entries.
3. Add shape heuristics via byte-pattern inspection of
   the actual data bytes from `arm9.bin` (use the
   existing extract paths).
4. Add tests for each filter type — 1583+ test suite
   should add ~10-15 new tests.
5. Sanity-check on brief 113's 2020-candidate worklist:
   `data_worklist.py --cluster A` should output ~85%
   of the 4.78 MB pool (matching brief 113's `.bss`
   85% finding).

**Non-scope:**

- ❌ Actually picking candidates for waves (that's
  brief 116+ decomper work).
- ❌ Cross-region data-shift propagation (handled by
  brief 095 D3).
- ❌ Typedef inference (separate brief 120+).
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- `tools/data_worklist.py` v2 supports section + size
  + shape filters with `--cluster` shorthand.
- New columns in output (section / size / shape /
  readers).
- ~10-15 new tests in `tests/test_data_worklist.py`.
- Sanity-check passes: `--cluster A` matches brief 113's
  85%-of-pool finding.
- Markdown lint clean.
- Research index regen current (no docs changes
  expected; verify clean).

**Branch:** `cloud/data-worklist-v2`

**Priority:** MEDIUM. Decomper brief 115 (DTCM pilot)
is the higher-leverage immediate move; brief 114 unblocks
brief 116+ scale-out. Both run in parallel.

**After this brief lands:**

1. **Brief 116** (cluster A `.bss` wave 1, decomper)
   can run with `data_worklist.py --cluster A`-filtered
   pool. Estimated 50-100 symbols / wave per brief 113.
2. **Brief 117+** waves use the same filter at scale.
3. **Tooling tests** become part of the regression
   suite — future brief catalog walls discovered in
   data-tier waves should grow `codegen-walls.md`'s
   "data-tier" section type.
