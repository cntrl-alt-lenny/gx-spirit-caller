### cloud/ov004-checksum-scoping

**Goal:** SCOPING brief for **overlay 4 checksum
recovery** — the unlock for ARM9 main per brief 127's
finding (76% of main's gap cascades from OV004
failure). Same methodology as brief 127 applied to
ov004.

**Context — what brief 127 + 118 established:**

- Brief 113 hypothesized ov004's checksum failure was
  placeholder-symbol-injection artifact from
  `dsd init --allow-unknown-function-calls`.
- Brief 118's cluster A wave 2 attempted ov004's
  `.bss` coverage; `.bss` work didn't flip ov004
  (predicted at the time).
- Brief 127 confirmed brief 118's coupled-module
  prediction: main + ov004 are entangled. Of main's
  21-byte gap, 16 bytes (76%) are cascades from
  OV004's gap.
- **When OV004 flips OK, main auto-flips on the
  cascade-resolved bytes.** Brief 127's plan calls
  this out: cracking OV004 is the 26/27-baseline
  unlock.

**Brief 129 deliverables (SCOPING, not application):**

1. **Bisect ov004 built vs orig.**
   - Run `xxd build/eur/build/arm9_ov004.bin >
     /tmp/built_ov004.hex` and equivalent for the
     extract.
   - `diff` them; identify byte ranges that differ.
   - Map differences to symbol-level via
     `config/eur/arm9/overlays/ov004/symbols.txt`.

2. **Categorize the residue.** Likely categories (per
   brief 127's pattern):
   - **Cat 1**: wrong source-target in matched TUs
     (same shape as brief 127's `func_02048f98` /
     `func_02052bc4` / `func_0206255c`).
   - **Cat 2**: `.rodata` pointers to other overlays
     (cross-module reloc misses).
   - **Cat 3**: `.data` struct array residue (similar
     shape to brief 127's `data_020c9694`).
   - **Cat 4**: NEW — placeholder-symbol-injection
     artifacts from `dsd init`. May surface as
     unrecognized addresses or missing symbol entries.
     This is what brief 113 hypothesized for ov004.

3. **Quantify the gap.** How many bytes differ? Which
   sections? Brief 127's main was 21 bytes; ov004
   likely larger given its role as a cascade source.

4. **Output: brief 132+ application plan.** Per-
   category brief outlines:
   - Per-category pool size.
   - Recipe (existing or needs new research).
   - Decomper vs cloud ownership.
   - Expected per-wave throughput.
   - Workflow walls (W7+ candidates if any new
     toolchain integration issues surface — placeholder
     resolution may need new dsd analysis).

5. **Risk assessment.** Brief 127 found "no new
   toolchain investment needed" for main. If ov004's
   Cat 4 (placeholder injection artifacts) requires
   `dsd init` re-run or new overlay analysis, flag as
   a separate tooling brief candidate.

**Method:**

- `xxd` per-section diff (same as brief 127).
- For each difference: identify section + covered
  symbol(s) + byte pattern.
- Cluster differences into categories.
- Document at `docs/research/ov004-checksum-recovery
  .md` (or similar) with brief 132+ application plan.

**Non-scope:**

- ❌ Actually recovering OV004 (brief 132+ application
  work).
- ❌ Modifying configure.py / build system / bootstrap
  unless absolutely necessary to surface the
  categorization.
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- **Brief 132+ application plan documented.** Each
  category outlined with pool size + recipe + ownership
  + walls.
- **Gap quantified** (bytes / symbols / sections).
- **Risk assessment** included.
- Markdown lint clean.
- Research index regen current.

**Branch:** `cloud/ov004-checksum-scoping`

**Priority:** MEDIUM. Decomper brief 128 is the higher-
leverage immediate move. Brief 129 sets up the brief
132+ recovery sequence.

**After this brief lands:**

1. **Brief 132 candidate (decomper)** — OV004
   recovery wave 1 per brief 129's plan. **If OV004
   flips OK, main auto-flips on cascade-resolved
   bytes → 26/27 baseline across all 3 regions.**
2. **Brief 133+ tooling** if brief 129 surfaces a
   placeholder-resolution requirement.
3. **Cascading wins:** with both main + ov004 OK,
   the only remaining FAILED module is... actually
   none — that takes baseline to 27/27 across all 3
   regions, which is the SHA1-matching condition.
   But OV004 may have residue brief 129 hasn't
   anticipated; realistic optimistic outcome is
   26/27 + a clearer path to 27/27 via subsequent
   waves.
