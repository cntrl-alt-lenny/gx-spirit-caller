### cloud/arm9-main-checksum-scoping

**Goal:** SCOPING brief for ARM9 main checksum recovery
— the **biggest remaining strategic lever** in the
project. ARM9 main has been FAILED across all 3 regions
since session start (24/27 → 25/27 only via DTCM in
brief 115/116). 647 cluster A `.bss` symbols + 37
cluster C Pattern 1 + 20 cluster D-1 tables have been
claimed in main, but the module checksum remains
FAILED. Brief 113 noted this is `.text`/`.data` cross-
module reloc residue, not `.bss`. **Brief 127 does NOT
attempt recovery** — it scopes what recovery would
entail and outputs a future brief plan.

**Context — what's known about main's checksum failure:**

- All function-tier matches (139 EUR, ~840 region-
  equivalents) haven't flipped main to OK.
- Cluster A coverage (647 .bss symbols in main) hasn't
  flipped main either.
- Cluster C Pattern 1 (15 main syms in brief 122) +
  Cluster D-1 (8 main tables in brief 124) haven't
  flipped main.
- Brief 113 hypothesis: residue is in `.text` (unmatched
  function gaps producing different bytes vs orig) or
  `.data` (cross-module relocations / data symbols
  needing structured placement beyond current
  techniques).
- Brief 116's investigation found ov004 stays FAILED
  for the **same shape of reason** as ARM9 main
  (predicted then confirmed — brief 118 spec called
  this out explicitly).

**Brief 127 deliverables:**

1. **Bisect the checksum gap.** Use `xxd` + dsd's
   section map to identify which sections of the built
   ROM differ from orig:
   - Per-section `xxd` of `build/eur/build/arm9.bin`
     vs `extract/eur/arm9/arm9.bin`.
   - Identify byte ranges that differ.
   - Map differences to symbol-level via
     `config/eur/arm9/symbols.txt`.

2. **Categorize the residue.** Possible categories
   (cloud refines based on inspection):
   - **Unknown function addresses** — placeholder
     symbols injected by `dsd init
     --allow-unknown-function-calls` (mentioned in
     CLAUDE.md bootstrap notes). Need cross-overlay
     analysis to resolve.
   - **Function-tier byte-diff** — matches that landed
     but had subtle differences (e.g., the 3 brief-094
     byte-diff drops). Brief 098 permuter sweep
     attempted some; more may remain.
   - **Cross-module reloc misses** — `.data` pointers
     to overlay code/data whose addresses haven't
     been correctly resolved.
   - **Untouched `.data` symbols** — cluster B/C
     candidates not yet applied + data-tier residue
     not yet classified.
   - **`.rodata` residue** beyond cluster C Patterns
     1-3 (e.g., compiler-emitted RTTI, string-table
     padding).

3. **Quantify the gap.** How many bytes differ? Which
   sections? Which symbol ranges? Use this to size
   the recovery effort.

4. **Output: brief 130+ application plan.** Per-
   category brief outlines:
   - Per-category pool size.
   - Recipe (existing or needs new research).
   - Decomper vs cloud ownership.
   - Expected per-wave throughput.
   - Workflow walls (W7+ candidates if any new
     toolchain integration issues surface).

5. **Risk assessment.** If main checksum recovery
   requires substantial new toolchain investment
   (e.g., dsd init re-run with better overlay
   analysis, custom LCF templates, etc.), flag the
   investment as a separate scoping/tooling brief.

**Method:**

- Run `xxd build/eur/build/arm9.bin > /tmp/built.hex`
  and `xxd extract/eur/arm9/arm9.bin > /tmp/orig.hex`.
- `diff` them; first 10-20 difference regions are
  representative.
- For each: identify the section (via dsd section
  map), the symbol(s) covered, the byte pattern of
  the difference.
- Cluster the differences into categories.

**Non-scope:**

- ❌ Actually recovering ARM9 main (that's brief 130+
  application work).
- ❌ Modifying configure.py / build system /
  bootstrap.
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- **Brief 130+ application plan documented** at
  `docs/research/arm9-main-checksum-recovery.md` (or
  similar). Each category brief outlined with pool
  size + recipe + ownership.
- **Risk assessment** included — flag any category
  that requires new tooling investment.
- Markdown lint clean.
- Research index regen current.

**Branch:** `cloud/arm9-main-checksum-scoping`

**Priority:** MEDIUM. Decomper brief 126 (cluster
C+D parallel wave) is the higher-leverage immediate
move. Brief 127 sets up the brief 130+ session arc.

**After this brief lands:**

1. **Brief 130 (decomper, candidate)** = ARM9 main
   recovery wave 1 per brief 127's plan. Specific
   approach depends on which residue category is
   biggest + easiest.
2. **Brief 131+ (or cloud tooling)** if brief 127
   identifies a tooling gap (e.g., new dsd analysis
   pass needed).
3. **If main flips to OK**, **26/27 baseline**
   achieved. Cascading wins likely — overlay 4
   (similar shape per brief 118) may flip too, taking
   3 regions to 27/27 or near it.
