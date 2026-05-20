### cloud/pattern3-section-flag-plus-reverse-lookup-tool

**Goal:** Two small tooling deliverables that unblock future
work. Part 1 closes the generator gap brief 157 funnel called
out. Part 2 builds reverse-lookup infrastructure for ov002
cross-overlay pointer targets (brief 150 funnel hand-off) —
the orthogonal-to-byte-coherence path to identifying actual
veneer-suppressing slots in ov004 `.rodata`.

**Context — two distinct deliverables in one PR:**

### Part 1 context (brief 157 generator gap)

Brief 157 (PR #586) shipped 9 D-3 chunks via brief 125's
`cluster_c_pattern3_gen.py` generator. Generator hardcodes
`.section .rodata` because brief 119/125's cluster C context
was `.rodata`-only. D-3 lives in `.data` — decomper had to
post-process every generated `.s` with a sed substitution.

> A `--section data` flag (or auto-detection from the address
> vs section header in `delinks.txt`) would eliminate this
> manual edit. — brief 157 PR funnel

### Part 2 context (brief 150 funnel + brief 156 75% PASS)

Brief 150 (PR #576) Option A made the patcher tolerate any
`n ∈ [0, 86]`. Brief 156 (PR #587) spot-disasm found 75% of
MEDIUM `data` symbols in ov004 `.rodata` show coherent ARM
code bytes — but with the critical caveat that **byte coherence
≠ SHA1 safety**: dsd's lcf re-emission for `function(arm,
unknown)`-kinded symbols can shift downstream bytes.

The reverse-lookup tool is the **orthogonal-to-byte-coherence
path 2** for identifying veneer-suppressing ov004 `.rodata`
slots:

- **Input**: ov002's relocs table + ov004's `.rodata` symbol
  table.
- **Output**: list of (ov002_load_site, ov004_rodata_slot)
  pairs where ov002 code loads a pointer-to-ov004-rodata.
- **Use**: those ov004 `.rodata` slots are the actual veneer
  triggers. Claiming them in source (vs leaving as gap-file
  placeholders) drops mwldarm's veneer count by exactly 1
  per claim (empirical: brief 141 / 147 observed).

This unblocks the n<9 path WITHOUT requiring
reclassification — which is a separate axis brief 156 showed
is risky.

**Scope:**

### Part 1 — Pattern 3 generator `--section data` flag

Add a `--section {data,rodata}` argument to
`tools/cluster_c_pattern3_gen.py` (default `rodata` for
backwards compat with brief 135/139/144 callers). When
`--section data`, emit `.section .data` instead of
`.section .rodata`. Optional improvement: auto-detect from
the chunk's address by cross-referencing `delinks.txt` (find
the section that covers `[chunk_start, chunk_end)`).

Add 1-2 regression tests pinning the flag behaviour.

### Part 2 — Reverse-lookup tool

New `tools/find_ov004_rodata_pointer_targets.py` (or similar):

1. Parse `config/eur/arm9/overlays/ov002/relocs.txt` (and
   `ov002/symbols.txt` if needed) for relocs where the
   target address falls in ov004's `.rodata` range
   (`[0x021de638, 0x02209a5c)` per brief 154 survey).
2. For each match, report:
   - ov002 load site (address + function name if known).
   - ov004 `.rodata` slot (address + symbol name from
     `ov004/symbols.txt`).
   - Reloc kind (`load`, `branch`, etc.).
3. Output as a sorted table (Markdown or stderr-friendly
   plain text). Save the canonical table at
   `docs/research/ov004-rodata-pointer-targets.md`.

Ship one worked example: pick one ov004 `.rodata` slot from
the tool's output (NOT yet source-claimed), claim it as a
Pattern 1 `.c` chunk, run `ninja sha1`, observe whether
veneer count drops by 1 (validates the lookup correctly
identifies veneer-triggering slots).

**Crucially**: per brief 158 non-scope, **decomper owns the
worked-example claim**. Cloud's Part 2 ships the tool +
research note. The worked-example validation can be folded
into the same PR if cloud has the bandwidth, but the
expected pattern is: cloud ships tool, decomper applies in
brief 160+ wave.

**Required smoke test (cloud runs pre-PR, brain re-runs
pre-merge):**

- 3-region `ninja sha1` PASS preserved.
- All existing tests pass + 1-2 new tests for generator flag.
- Tool runs without error against the EUR config.
- Markdownlint clean on the new research note.

**Non-scope:**

- ❌ Reclassifying ov004 `.rodata` symbols (decomper / future
  brief).
- ❌ Disassembling the 22.5 KB mega `.rodata` block (separate
  brief).
- ❌ Reclassification-with-SHA1-gate framework (decomper
  territory if/when we go that route).
- ❌ Modifying `src/`, `config/`, or `AGENTS.md`/`state.md`.

**Success:**

- Generator gains `--section {data,rodata}` flag; D-3 wave 2
  (brief 158) can use it directly.
- Reverse-lookup tool ships with research note containing the
  full enumeration table.
- Optional: 1 worked-example slot claim validates the
  veneer-trigger hypothesis.
- 3-region `ninja sha1` PASS preserved.

**Branch:** `cloud/pattern3-section-flag-plus-reverse-lookup-tool`

**Priority:** MEDIUM. Two small tooling deliverables; each
unblocks distinct future work. Not on the critical SHA1 path.

**After this brief lands:**

1. Brief 158 (decomper, parallel-track) uses Part 1's flag
   for cleaner D-3 wave 2 chunk generation.
2. Brain scopes a follow-up decomper brief to use Part 2's
   reverse-lookup output as the source-of-truth for ov004
   `.rodata` claims that demonstrably drop veneer count
   (path-2 unlock for n<9).
3. The path-1 (cautious reclassification) work remains
   queued as an alternative if path-2 doesn't pan out.
