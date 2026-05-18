### cloud/ov004-binary-patch-phase3

**Goal:** **🔑 ACTUAL 26/27 BASELINE UNLOCK (attempt #3).**
Per brief 132's recommended brief-133-B
approach: post-link binary patching of
`arm9_ov004.bin`. Brief 131 Phase 1 (ALIGNALL) reduced
ov004 165K → 8125 bytes. Brief 132 Phase 2 falsified
3 symbol-attribute approaches (mwldarm uses ONLY VA +
MEMORY region — not symbol type, not exec flag).
Brief 134 = Phase 3: patch the binary directly to
remove the spurious veneers + un-shift downstream.

**Context — what brief 132 established:**

- mwldarm's veneer-trigger gating conditions:
  1. Symbol's VA falls in a section assigned to a
     different LCF MEMORY region than the load-site's
     section.
  2. Symbol's containing section is reachable in the
     link namespace.
  3. **Neither symbol type nor exec flag affects the
     decision.** Both proven empirically.

- 86 spurious thumb→arm veneers in ov004's `.rodata`
  (12 bytes each = 1024 bytes total).
- 158 `.rodata` pointers reference veneer addresses
  (some veneers used by multiple pointers).
- Downstream `.data` + `.bss` cascaded by 0x400.

**Brief 134 method (post-link binary patching):**

1. **Locate the veneer pool** in `arm9_ov004.bin`:
   - Search for the 12-byte veneer pattern: `7847 c046
     04f01fe5 <target>`.
   - Confirm 86 occurrences (matching brief 129's
     count).
   - Extract each veneer's (source_addr, target_VA)
     pair.

2. **Build the rewrite map**:
   - For each veneer at `source_addr` targeting `target_VA`,
     find all `.rodata` pointers in ov004 that resolve
     to `source_addr`.
   - Intersect with `relocs.txt` (only patch addresses
     that have relocs registered against them — this
     mitigates false-positive risk per brief 132's
     recommendation).
   - For each such pointer, rewrite its 4-byte value
     from `source_addr` → `target_VA`.

3. **Splice the veneer pool out**:
   - Remove the 1024-byte veneer pool from the binary.
   - Section-header adjustments: `.rodata` end shrinks
     by 1024; downstream sections shift by 1024 (which
     restores the original alignment).

4. **Un-shift downstream sections**:
   - `.data` and `.bss` need to land at their original
     VAs. After splicing the veneer pool, downstream
     sections should naturally fall into place since
     the binary is shorter by 1024 bytes.
   - Validate by byte-comparing the patched binary
     against `extract/eur/arm9_overlays/ov004.bin`.

5. **End-to-end test**:
   - `python tools/configure.py eur && ninja rom`
     (with the patcher wired into the build OR
     applied post-build per the brief 131 pattern).
   - `./dsd check modules -c config/eur/arm9/config.yaml`:
     **ov004 should flip FAILED → OK**.
   - Main module checksum should also flip (its 10
     cascade bytes auto-resolve once ov004 matches).
   - All other modules stay OK (no regressions).

6. **Cross-region verification**:
   - USA + JPN ov004 should also flip (the veneer
     mechanism is the same on all 3 regions).
   - Run configure + ninja rom + dsd check on each
     region.

**Wiring strategy:**

Two options for how to apply the patch:

- **(a) Wire into the build pipeline.** Add a
  `tools/patch_ov004_veneers.py` step after mwldarm
  produces `arm9_ov004.bin` and before dsd's
  packaging. Cleanest production path; works
  automatically on rebuild.
- **(b) Run post-build, manually.** Apply via a
  one-shot script. Brittle (forgotten step breaks
  the build); not recommended for production but
  acceptable for a first end-to-end test.

**Recommend (a)** for production reliability, modeled
on brief 131's `patch_lcf_arm9_align.py` integration
pattern (called from `tools/configure.py`'s LCF rule).

**Risk mitigation:**

- False-positive pointer rewrites: intersect candidate
  pointers with `relocs.txt` (only patch addresses
  that have relocs registered).
- Veneer-target ambiguity (multiple pointers target
  the same veneer): build a 1-to-many rewrite map;
  all pointers to that veneer get rewritten to the
  ultimate target.
- Section-header miscount: validate section sizes
  against the extract's section table; abort if any
  mismatch.

**Documentation:**

- Extend `docs/research/ov004-thunk-section-fix.md`
  with Phase 3 results + final W7 mitigation tier.
- Update brief 113's risk-assessment note retroactively
  (Cat 4 was correctly hypothesized as needing new
  tooling; the actual tooling turned out to be post-
  link patching, not LCF section directives).
- W7 wall entry: final mitigation = "post-link veneer
  splice".

**Non-scope:**

- ❌ Fixing the underlying mwldarm overlay-swap
  blindness (upstream issue; orthogonal).
- ❌ Recovering function-level matches in ov004
  (309/310 still placeholder; orthogonal).
- ❌ Main's source-level Cat 1 byte (already fixed
  by brief 128).
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- **ov004 module checksum: FAILED → OK** across all 3
  regions.
- **Main module checksum: FAILED → OK** (or close to
  it — main's cat 2 + 3 cascade should auto-resolve).
- **3-region baseline ≥ 26/27**; **27/27 best case**.
- Patcher wired into the build; rebuild reproduces
  byte-identical result.
- No regressions in other modules.
- W7 mitigation tier finalized in research doc.

**Branch:** `cloud/ov004-binary-patch-phase3`

**Priority:** HIGH. **🔑 26/27 baseline unlock.**

**After this brief lands:**

1. **26/27 (or 27/27) baseline achieved.** First multi-
   module-baseline improvement since brief 116's 25/27.
2. **Brief 136+ data-tier waves can include ov004**
   cluster C / D-1 / D-2 candidates (skipped since
   brief 122).
3. **If 26/27 minimum** (main retains residue): Brief
   137 candidate = main residue cleanup (1-2 bytes
   remaining).
4. **If brief 134 also fails**: honest hand-back; next
   attempt likely Brief 138 = per-overlay link
   restructure (brief 132's 133-A — significant build
   surgery).
