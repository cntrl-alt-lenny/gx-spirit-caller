### cloud/clean-macos-junk-filter

**Goal:** **🔑 99.995% SHA1 gap closure.** Brief 137
identified `.DS_Store` macOS metadata files leaking
into `extract/<region>/files/` as the root cause of
100K+ bytes of ROM diff. Filter these out before `dsd
rom build` runs.

**Context — what brief 137 documented:**

EUR ROM diff after brief 134 closed module checksums:
- Pre-filter: 100,805 bytes diff
- Post-`.DS_Store`-filter: **5 bytes diff**
- Reduction: −99.995%

Per-region pre-fix split:

| Region | Header | Ov tbl | FNT | FAT | ARM9 | Other |
|---|---:|---:|---:|---:|---:|---:|
| EUR | 6 | 1 | 84,119 | 16,661 | 0 | 18 |
| USA | 7 | 1 | 84,103 | 16,651 | 2 | 18 |
| JPN | 7 | 1 | 84,103 | 16,658 | 2 | 18 |

**Mechanism:** macOS Finder creates `.DS_Store` files
in any directory it views. These leak into
`extract/<region>/files/` during development and dsd's
`rom build` includes them in the ROM's FNT (File Name
Table). First entry shifts: orig starts with `Academia`
(8 bytes), built starts with `.DS_Store` (9 bytes).
This shifts every FNT entry by ~10 bytes and every FAT
entry by 8 bytes across ~5000 files → 100K+ byte diff.
Header `fnt_size` / `fat_size` auto-derive.

**Brief 138 deliverables:**

1. **`tools/clean_macos_junk.py`** — new tool that
   removes macOS / Windows metadata files from a
   directory tree:
   - `.DS_Store`
   - `._*` (AppleDouble resource forks)
   - `Thumbs.db` (Windows)
   - `desktop.ini` (Windows)
   - Optional: `.AppleDouble/`, `.fseventsd/`,
     `.Trashes/`, `.Spotlight-*/` directories.

2. **Wire into `tools/configure.py` build rule** —
   modeled on brief 131's `patch_lcf_arm9_align.py`
   integration pattern. Either:
   - **(a)** New `cleanup` rule that runs before
     `rom_build`. Idempotent + cheap.
   - **(b)** Embedded in `rom_build` rule itself as
     a pre-step.
   
   Prefer (a) — cleaner separation, doesn't bloat the
   rom_build rule.

3. **Tests** — regression on a fixture directory with
   `.DS_Store` injected; filter must remove them
   without affecting real files. Test the optional
   directory filters separately.

4. **Optional**: file upstream issue with ds-decomp
   suggesting they filter these by default. Out-of-
   scope for THIS brief but worth flagging in the PR
   body.

**Method:**

1. Read brief 137's analysis at
   `docs/research/sha1-gap-scoping.md`.
2. Look at the dsd `rom build` step in
   `tools/configure.py`'s ninja rule to understand
   integration point.
3. Write the filter tool + tests.
4. Wire into ninja.
5. End-to-end test: `python tools/configure.py eur
   && ninja rom` → EUR ROM diff drops to ~5 bytes.

**Non-scope:**

- ❌ Patcher off-by-1024 fix (brief 140 candidate).
- ❌ ROM-header CRC16 implementation (brief 140
  candidate or fold into 138's follow-up).
- ❌ Cluster matching work.
- ❌ AGENTS.md / state.md edits beyond the PR.

**Success:**

- **EUR ROM diff drops from 100,805 to ~5 bytes.**
- **USA / JPN ROM diff similarly drops** to ~5-7
  bytes.
- 3-region module baseline 27/27 preserved (no
  regression).
- New tool + tests; idempotent on rebuild.
- Markdown lint clean.

**Branch:** `cloud/clean-macos-junk-filter`

**Priority:** HIGH. **🔑 First step toward `ninja sha1`
passing — the project's stated final gate.**

**After this brief lands:**

1. **EUR ROM diff at ~5 bytes** (4 CRC16 + 1 patcher
   off-by-1024). Brief 140 candidate closes those.
2. **USA/JPN same shape** — brief 136's main fix
   already closed their main-displacement bytes.
3. **`ninja sha1` still fails** after this brief
   alone — 4 byte CRC + 1 byte off-by-1024 remain.
   Brief 140 closes the rest.
4. **One brief away from the project's stated final
   gate.** 🎉🎉🎉
