### cloud/objects-txt-legacy-patch

**Goal:** Fix the `dsd lcf` filename inconsistency that brief 038
(PR #328) escalated. `dsd lcf` strips `.legacy.` from
`objects.txt` entries while preserving the full filename in
`arm9.lcf`, breaking mwldarm's link step for every `.legacy.c`-
routed TU. This brief implements the post-processing fix.

**Context:**

Brief 037 (PR #327) shipped per-TU dual-compiler routing.
Brief 038 (PR #328) attempted to consume it and discovered:

```
arm9.lcf:    func_0207cbbc.legacy.o(.text)         ← what mwldarm wants
objects.txt: build/eur/src/main/func_0207cbbc.o    ← what mwldarm has
```

Mwldarm reads `objects.txt` as its file-search list, then resolves
the lcf's name references. It can't find `func_0207cbbc.legacy.o`
because `objects.txt` only lists `func_0207cbbc.o`. Result:
*"mwldarm.exe: File not found: func_X.legacy.o"* across every
`.legacy.c` source.

The actual `.o` file exists on disk (the `mwcc_legacy` ninja rule
correctly produces `func_X.legacy.o`). It's just not in
`objects.txt`'s search list under that name.

Brief 038 PR body has the full reproducer + analysis.

**Scope (option 2 from brief 038's escalation):**

Land a post-processing script that rewrites `objects.txt` after
`dsd lcf` runs, so any source file ending in `.legacy.c` has its
corresponding `.o` entry rewritten from `func_X.o` to
`func_X.legacy.o`. This matches the existing project pattern of
`tools/patch_section_align.py` and `tools/patch_lcf_arm9_align.py`
(both already post-process `dsd` output).

**Implementation sketch:**

1. New script: `tools/patch_objects_legacy.py`. Reads
   `delinks.txt` for source paths ending in `.legacy.c`, builds a
   map `func_X.o → func_X.legacy.o`, applies it to `objects.txt`.

2. `tools/configure.py`: chain the new script after `dsd lcf` in
   the `lcf` ninja rule:

   ```
   command = (
     f"{DSD} lcf --config-path $config_path"
     f" && {PYTHON} {patch_lcf_align}"
     f" && {PYTHON} tools/patch_objects_legacy.py"
   )
   ```

3. Tests: extend `tests/test_configure_asm.py` (or new
   `tests/test_patch_objects_legacy.py` if it'd be cleaner) with
   cases:
   - Source ending in `.legacy.c` → objects.txt entry rewritten.
   - Source ending in `.c` (default) → objects.txt entry untouched.
   - Mixed delinks.txt → only `.legacy.c` entries rewritten.
   - No `.legacy.c` sources at all → script is a no-op.

**Required smoke test (brain will re-run before merge):**

Per brief 037's original success criteria — *brain will run the
exact reproducer brief 038 documented before merging this PR*:

```
echo 'void func_0207cbbc(int x) {}' > src/main/func_0207cbbc.legacy.c
cat >> config/eur/arm9/delinks.txt <<EOF

src/main/func_0207cbbc.legacy.c:
    complete
    .text start:0x0207cbbc end:0x0207cbe0
EOF
python tools/configure.py eur && ninja rom
```

Expected: ROM builds clean (link succeeds; mwldarm finds
`func_0207cbbc.legacy.o`). 24/27 dsd-check baseline preserved.

If the smoke test fails on brain's side, the PR doesn't merge.

**Non-scope:**

- ❌ Modifying `dsd` itself. The existing
  `patch_section_align.py` / `patch_lcf_arm9_align.py` post-
  process pattern is the project's preferred path for dsd quirks.
  Upstream fix can come separately.
- ❌ Changing the `.legacy.c` filename convention from brief 037
  — keep it; this brief only fixes the post-link step.
- ❌ Touching `src/`, `AGENTS.md`, `docs/state.md`.

**Success:**

- The brief-038 reproducer above completes `ninja rom` clean.
- 24/27 dsd-check baseline preserved.
- All existing tests pass; new tests cover the rewrite + no-op
  cases.
- PR body includes brain's reproducer output (lcf line +
  objects.txt line for the routed file showing they now agree).

**Branch:** `cloud/objects-txt-legacy-patch`

**Priority:** HIGH. Decomper is on hold pending this brief.
Brief 040 (decomper retry of brief 038) follows immediately.

**After this brief lands:**

1. Brain runs the smoke test on its machine before merging.
   Brief 037's smoke-test miss won't repeat.
2. Brief 040 unblocks brief 038's 11 targets again.
