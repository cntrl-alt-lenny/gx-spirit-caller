[//]: # (markdownlint-disable MD013 MD041)

# Optimization 1 implementation — scoped `mwasm` implicit deps

Implements the top-ranked fix from `docs/research/speed/buildcost-analysis.md`:
narrow each `.s` build edge's implicit dependency list from **all 27**
regional `delinks.txt` files down to the **one** that actually documents
that file's module. This doc was written **build-free** — the change was
verified by direct static analysis and by running the new indexing logic
against the real `delinks.txt`/`.s` files already on disk (pure file I/O +
regex, no ninja, no compiler, no `dsd`). The brain still needs to run the
tests in [Validation](#validation-for-the-brain) before this goes anywhere
near the campaign.

---

## What changed

**File: `tools/configure.py` only.** Three changes, all additive except one
line:

1. Added `import re` to the stdlib imports (previously unused in this file).
2. Added two new module-level helpers just above `add_mwasm_builds`:
   - `_DELINKS_TU_HEADER_RE` — a regex matching a TU declaration header line
     in `delinks.txt` (`src/overlay017/func_ov017_021b22ec.s:`). Same shape
     as `patch_section_align.py`'s own `_DELINKS_TU_HEADER_RE` — kept as an
     independent copy rather than an import, since this is configure.py's
     own ninja-graph concern (which files ninja should watch), not the
     patcher's concern (what to read once invoked). The two tools stay
     decoupled at the module level.
   - `_index_delinks_by_source(delinks_files) -> dict[str, str]` — reads
     every file in `delinks_files` once, regex-extracts every TU header,
     and returns a `{source_path: delinks_txt_path}` map covering every TU
     declared anywhere in the region.
3. Rewrote the body of `add_mwasm_builds` (signature unchanged — still
   `(n, project, mwasm_implicit)`, so the one call site at the bottom of
   `main()` needed **zero changes**):
   - Builds the index once via `_index_delinks_by_source(project.delinks_files)`.
   - Derives `base_implicit` (`[ASM, patch_align]`) by trimming the
     already-known-length delinks suffix off the existing `mwasm_implicit`
     parameter — no new constant needed, no risk of drifting out of sync
     with however the caller builds that list.
   - For each `.s` file: looks up its normalized path (backslash → forward
     slash, matching the same normalization `patch_section_align.py`
     itself already does for `$in`) in the index.
     - **Found** → implicit deps = `base_implicit + [that one delinks.txt]`.
     - **Not found** (defensive fallback) → implicit deps = the original,
       unmodified `mwasm_implicit` (all 27 files) — i.e. exactly today's
       behavior for that file.
   - Prints one diagnostic line to stderr after the loop: how many files
     were scoped vs. fell back, so every `configure.py` run makes the
     optimization's engagement rate immediately visible, not just when
     someone thinks to run a dry-run test.

**Nothing else was touched.** The `mwasm` rule's command string, the
`--delinks` flags passed to `patch_section_align.py` on the command line,
the `delink`/`lcf`/`mwld`/`rom_build`/`sha1` rules, and every other build
edge are byte-for-byte unchanged. `git diff --stat` shows exactly one file.

---

## Why it's safe

**The core safety argument does not depend on trusting my regex — it comes
from an invariant `patch_section_align.py` already documents about itself.**
Its `_lookup_delinks_slot_size` docstring states directly (unchanged by
this PR):

> "Brief 208 expects one match across the entire project (each `.s` file
> is referenced exactly once in exactly one delinks.txt)."

That function is what actually consumes the `--delinks` command-line flags
at runtime and decides the trim-padding outcome for a given `.s` file — and
by its own documented contract, only ONE of the (up to 27) files it's
handed can ever contain the matching TU header. The other 26 files' content
is structurally incapable of affecting this TU's trim decision. So scoping
the ninja-level **implicit dependency** (which only controls *when ninja
considers the edge stale*, not what the command does when it runs) down to
that one relevant file is not a behavior change — it's fixing an
over-approximated dependency to match what was already true. The command's
own argv is untouched, so even if the scoping were somehow wrong for one
file, that file's `mwasmarm`/`patch_section_align.py` invocation still runs
exactly as before, with exactly the same output — the fallback path is not
"probably fine," it is **identical to current behavior by construction**.

**Defense in depth beyond the invariant:** even setting the above argument
aside, the code has no path to a wrong result:

- If `_index_delinks_by_source` mis-parses a delinks.txt (regex edge case)
  and fails to find a real TU header, that file's lookup simply misses and
  falls back to the full 27-file list — same as today, not broken, just not
  optimized.
- If a `.s` file's path is somehow malformed after normalization and
  doesn't match any index key, same fallback.
- The regex change and helper functions are pure, side-effect-free, and
  entirely new code paths — no existing function's behavior was edited.

---

## Empirical validation performed (build-free)

The indexing logic was run standalone against the **real** `config/eur`
delinks.txt files and the **real** `.s` files currently in `src/`/`libs/`
(pure Python file I/O + regex — no ninja, no `dsd`, no compiler):

```
Found 27 delinks.txt files
Indexed 10254 TU source paths
Found 6389 .s files on disk (EUR-filtered)
Matched: 6360/6389  (99.5%)
Unmatched: 29        (0.5%, safely fall back)
```

**Spot-check of correctness** (not just coverage) — sampled `overlay017`
files resolved to exactly the expected file:

```
src/overlay017/func_ov017_021b22ec.s -> config/eur/arm9/overlays/ov017/delinks.txt
src/overlay017/func_ov017_021b2c8c.s -> config/eur/arm9/overlays/ov017/delinks.txt
src/overlay017/func_ov017_021b2ddc.s -> config/eur/arm9/overlays/ov017/delinks.txt
```

**The 29 unmatched files are a pre-existing, unrelated repo-hygiene
artifact, not a gap this change needs to fix:** all 29 use an old
`<module>_XXXXXXXX.s` naming (no `func_` prefix) — e.g.
`src/overlay002/ov002_0229cd40.s`. Checking `delinks.txt` for that exact
address shows the address is already declared under a *different* path:

```
libs/nitro/func_ov002_0229cd40.legacy.c:
    .text start:0x0229cd40 end:0x0229cd44
```

I.e. this function was already matched via a `libs/nitro/*.legacy.c` TU;
the `src/overlay002/ov002_0229cd40.s` file on disk is a stale leftover from
before that match landed (or from an older naming convention), not a live
TU that delinks.txt or `objects.txt` actually references for linking. It
gets picked up by `get_asm_files()`'s directory walk **today, identically,
before this PR** (compiled into a dead, never-linked `.o` — harmless, but
also a tiny bit of the very waste `buildcost-analysis.md` is about) — this
PR's fallback preserves that exact pre-existing behavior unchanged. All 29
follow the same pattern, spread across `overlay002/003/004/010/011/015`.
**Worth a separate cleanup PR someday (dead files, zero build-graph risk to
remove), but explicitly out of scope here** — this PR does not touch `src/`
per its own constraints.

---

## Validation for the brain

### Test 1 — blast-radius drop after touching one module's delinks.txt

```bash
python tools/configure.py eur
ninja sha1                                    # reach a clean, fully-built baseline

# Confirm the scoping engaged (printed by configure.py itself):
python tools/configure.py eur 2>&1 | grep "mwasm dependency scoping"
# Expect: "mwasm dependency scoping (eur): 6360/6389 .s files scoped to a
#          single delinks.txt (29 fell back to the full 27-file list)"
# (exact counts will drift as the campaign converts more .s -> .c; the
#  ratio should stay ~99%+ scoped)

# Touch ONE overlay's delinks.txt with no real content change, to isolate
# the dependency-graph effect from any actual candidate's compile cost:
touch config/eur/arm9/overlays/ov017/delinks.txt
ninja -n sha1 | grep -c '^mwasm '             # count of mwasm edges ninja WOULD re-run
# BEFORE this PR: expect ~6389 (the whole project)
# AFTER this PR:  expect ~32 (ov017's own .s file count) or fewer

ninja -n sha1 | grep '^mwasm ' | grep -vc overlay017
# BEFORE this PR: a large number (everything outside ov017)
# AFTER this PR:  expect 0 (or only the 29 known pre-existing orphans,
#                  IF any of them happen to live in ov017 — none do per
#                  the list above, so expect exactly 0)
```

### Test 2 — repeat for a different module, confirm it scopes independently

```bash
touch config/eur/arm9/delinks.txt             # main, not an overlay
ninja -n sha1 | grep -c '^mwasm '
# Expect: main's own .s count only, NOT 6389 and NOT ov017's count
```

### Test 3 — full 3-region correctness gate (the one that actually matters)

```bash
for v in eur usa jpn; do
  python tools/configure.py $v && ninja sha1 || echo "FAIL: $v"
done
# Expect: OK for all three, byte-identical against each baserom, exactly
# as before this PR. This is the test that confirms the change is not
# just "faster" but "still correct" — the previous section's reasoning
# says it must be, but only a real build proves it.
```

### Test 4 — a real candidate flip end-to-end (closest to actual campaign usage)

```bash
python tools/configure.py eur
ninja sha1                                     # baseline
# Use the existing batch_sha1.py tool (docs/research/tooling/optimized-loop.md)
# on any single already-known-good candidate, and time it:
time python tools/batch_sha1.py eur src/overlay017/<some_matched_func>.c
# Compare this wall-clock against a pre-PR run of the same command on the
# same candidate (checkout main, repeat) to get a real before/after number
# for the campaign, not just an edge-count proxy.
```

### Pass criteria

- Test 1/2: mwasm edge count after touching one module's delinks.txt drops
  from ~6389 to that module's own `.s` count (or the 29-orphan set, if any
  land in that specific module).
- Test 3: all three regions still `ninja sha1` OK, byte-identical.
- Test 4: measurable wall-clock reduction on a real `batch_sha1.py` run.

If Test 3 fails on any region, revert immediately — per the safety argument
above this should not be possible, but the whole point of a build-dependent
gate is not to trust reasoning alone.

---

## Expected blast-radius reduction

Based on the empirical file-count data above: touching one overlay's
`delinks.txt` today marks **~6,389** `.s` build edges stale project-wide.
After this change, it should mark only that module's own `.s` files stale
— for the `ov017` example used throughout `buildcost-analysis.md`, **32**
files. That is a **~200×** reduction in the number of `mwasmarm` invocations
ninja considers necessary for a single-module candidate flip, which
`buildcost-analysis.md` identified as the dominant driver behind the
observed 2–5 minute `ninja sha1` cost. The `delink`/`lcf`/`mwld`/`rom_build`
steps (Optimizations 3–5 in that doc) are untouched by this PR and remain
separate, smaller-or-gated follow-ups.
