### cloud/sha1-gap-scoping

**Goal:** **🔑 SHA1-gap scoping.** EUR `dsd check modules`
reports 27/27 OK after brief 134, but `ninja sha1` still
fails — bytes outside dsd's per-module coverage differ
from the orig ROM. Brief 137 inventories the ROM-level
diff and outputs a brief 138+ application plan.

**Context — what brief 134 established + the SHA1 gap:**

- All 27 modules (ARM9 main, ITCM, DTCM, overlay 0-23)
  report OK via `dsd check modules`.
- `ninja sha1` still reports:
  ```
  expected: 1da50df7c210fae96dc69b3825554b9ce13b4f75
  actual:   0367b729654a791a6c9c7e148ae09a791b790a5b
  ```
- The 27/27 module baseline ≠ SHA1 match. Bytes
  outside dsd's per-module coverage must differ.

**Brief 137 deliverables:**

1. **Bisect the ROM-level diff.**

   ```bash
   cmp -l gx-spirit-caller_eur.nds orig/baserom_eur.nds
   ```

   List every differing byte position. Expect a
   relatively small number of differences (the
   modules are all OK) but they might be concentrated
   in a few ROM-level structures.

2. **Map byte positions to ROM-level structures.**
   The DS ROM format has a known layout:
   - **ROM header** (0x000-0x3FF): game code, title,
     ARM9/ARM7 start offsets, FAT location, banner
     location, etc.
   - **Banner** (typically near start): icon + title
     strings in multiple languages.
   - **ARM9 binary** (after header): the modules dsd
     tracks.
   - **ARM9 overlay table** (post ARM9 binary): per-
     overlay metadata.
   - **Overlay table FAT** (per overlay): file
     allocation entries.
   - **Padding** (between sections, typically zeros).
   - **Per-overlay BSS area**: not in ROM (zero-fill).

   For each differing byte position, identify which
   structure it falls in.

3. **Categorize the diff.**
   - **Category α**: ROM header bytes that differ.
   - **Category β**: Overlay table metadata bytes.
   - **Category γ**: Banner / title metadata bytes.
   - **Category δ**: Padding regions (should be zero,
     but might have garbage from tools).
   - **Category ε**: Anything else (unexpected).

4. **Quantify the gap.** Total differing bytes? Most-
   represented category? Are there cascading bytes
   (single structural diff propagating) or independent
   bytes?

5. **Output: brief 138+ application plan.** Per-
   category recovery briefs:
   - For each category, scope: pool size, recipe
     (e.g., "patch ROM header field X via tools/
     configure.py"), decomper vs cloud ownership,
     workflow walls (W8+ candidates if any).
   - Risk assessment: simple metadata fixes vs deeper
     toolchain integration issues.

6. **Cross-region check.** Run the same bisection on
   USA + JPN (post-brief-136 if brief 136 lands first;
   otherwise current state). USA + JPN may have
   different ROM-level diffs than EUR.

**Method:**

- `cmp -l` for byte-by-byte diff.
- DS ROM header parsing — use existing tools or
  manually decode per the NDS format spec.
- `dsd`'s output structures may reveal what it tracks
  vs doesn't (per-overlay vs per-region).

**Non-scope:**

- ❌ Actually fixing the SHA1 gap (brief 138+
  application).
- ❌ ov004 / module-checksum work (brief 134 closed).
- ❌ Function-tier matching.
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- **EUR ROM byte-level diff inventoried** + categorized.
- **Cross-region check** (USA + JPN) confirms gap is
  EUR-specific or 3-region.
- **Brief 138+ application plan** with per-category
  recovery briefs.
- **Risk assessment** included; W8+ candidates flagged
  if any new toolchain walls surface.
- Research note at `docs/research/sha1-gap-scoping
  .md`.
- Markdown lint clean.

**Branch:** `cloud/sha1-gap-scoping`

**Priority:** HIGH. **🔑 path to actual byte-identical
ROM rebuild via SHA1 match — the project's stated
final gate.** Brief 136 (decomper) handles module-
checksum-side closure; brief 137 handles ROM-level
closure. Together they're the path to `ninja sha1`
passing.

**After this brief lands:**

1. **Brief 138 candidate (decomper or cloud)** =
   application of brief 137's plan. Per-category
   recovery briefs.
2. **If brief 137 finds the gap is small + tractable**:
   1-2 application briefs close it.
3. **If brief 137 finds toolchain walls (W8+)**:
   tooling brief candidates queued.
4. **🎉 SHA1 match unlock would mean the project's
   stated final gate is achieved** for at least one
   region. Major milestone.
