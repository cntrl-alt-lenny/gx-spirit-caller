[//]: # (markdownlint-disable MD013)

# objdiff #352 panic fix — verified cherry-pick onto pinned v2.7.1

Speedup swarm finding (`docs/research/speedup-research-swarm-2026-07-03.md`,
Top-5 #1, pain 3). **Build-free deliverable**: `cargo`/`rustup` are not
installed in this environment (`cargo --version` → command not found), so
per this brief's own instruction this doc stops short of an actual build
and does not install a toolchain without asking. Everything short of
`cargo build` — cloning both repos, locating the exact fix commit,
cherry-picking it onto the pinned tag, and resolving the one conflict —
**was done for real**, with git, in a scratch directory outside this repo
(no ROM build involved at any point; `git` operations only).

## What was verified (not just described)

```
scratch clone: encounter/objdiff (tag v2.7.1) + LagoLunatic/objdiff (branch emptymapping, head e28a2021)
  → git cherry-pick --no-commit e28a2021 onto a v2.7.1-based branch
  → CONFLICT (as expected — emptymapping is based on the v3.7.2 line, ~20 releases
    ahead of our pinned v2.7.1; objdiff-core/src/arch/arm.rs has drifted between them)
  → resolved by hand, committed
  → confirmed the resulting diff against v2.7.1 is exactly a 1-line change
```

The one conflict was trivial and unambiguous: v2.7.1's own code wraps the
section index in a `SectionIndex(...)` newtype (`.get(&SectionIndex(section_index))`)
that the later emptymapping-branch code doesn't have (`.get(&section_index)`,
already unwrapped upstream by some intervening refactor) — a version-drift
detail wholly unrelated to this fix. Keeping v2.7.1's own wrapper and taking
only the fix's actual logic change resolves it correctly.

**Final verified patch** (`git diff v2.7.1 HEAD -- objdiff-core/src/arch/arm.rs`
in the scratch clone):

```diff
diff --git a/objdiff-core/src/arch/arm.rs b/objdiff-core/src/arch/arm.rs
index 84a21cc..d9b3c9d 100644
--- a/objdiff-core/src/arch/arm.rs
+++ b/objdiff-core/src/arch/arm.rs
@@ -122,7 +122,7 @@ impl ObjArch for ObjArchArm {
         let mapping_symbols = self
             .disasm_modes
             .get(&SectionIndex(section_index))
-            .map(|x| x.as_slice())
+            .map(|x| if x.is_empty() { &fallback_mappings } else { x.as_slice() })
             .unwrap_or(&fallback_mappings);
         let first_mapping_idx = mapping_symbols
             .binary_search_by_key(&start_addr, |x| x.address)
```

Original fix commit: `LagoLunatic/objdiff@e28a2021eb3e669f6011f7645b009f73aa19ddbc`
("ARM: Fix index out of bounds error when there are no mapping symbols"),
branch `emptymapping`. Upstream issue this fixes:
[encounter/objdiff#352](https://github.com/encounter/objdiff/issues/352)
(already filed by this project per `docs/research/objdiff-arm-crash-
workaround.md`, brief 187).

## Important correction — this patch fixes ONE of TWO crash variants this project has found, not both

Reading `docs/research/objdiff-arm-crash-workaround.md` (brief 187) and
the CURRENT (as of this doc) `tools/objdiff_filter_panic_units.py`
together surfaces something the swarm finding's one-line summary
("kills the ~20-unit filter permanently") doesn't capture. There are
two distinct underflow shapes, not one:

| | Trigger | `mapping_symbols` length at crash | Does this patch fix it? |
|---|---|---|---|
| **v2 (original, brief 187)** | `.text` has content but **zero** `STT_FUNC`-typed symbols anywhere in it (either no code symbols at all, or only `STT_OBJECT` data symbols placed in `.text`) | `Some(empty Vec)` → `.get()` finds an entry, but it's empty | **Yes.** This is exactly the `x.is_empty()` case the patch adds a fallback for. |
| **v3 (found later, same tool file, dated today)** | `.text` DOES have a real sized `STT_FUNC` symbol, but the *lowest-addressed* symbol in the section is a sized `STT_OBJECT` (data placed before code) — worked example: `_dsd_gap@main_202.o` = `BuildInfo` (OBJECT, offset `0x0..0xcc`) then `main` (FUNC, `0xcc..0xdc`), no `$a`/`$d` mapping symbols anywhere | `Some(Vec` with **1 or more** real elements`)` — non-empty, so `binary_search_by_key` runs, finds no mapping symbol at/before `start_addr=0`, returns `Err(0)`, and `.unwrap_or_else(\|idx\| idx - 1)` underflows on `0 - 1` | **No.** `x.is_empty()` is false here (the Vec has content), so the patched code takes the *same* `x.as_slice()` branch as before — completely unchanged behavior for this case. |

The v3 crash was significant enough that `tools/objdiff_filter_panic_units.py`
already had to grow a **second, independent** filter rule for it
(`lowest_type == STT_OBJECT` → drop) on top of the original `has_sized_func`
check — read that file's own comments (search `"len is 1"`) for the full
diagnosis; it's a good, precise write-up already in this repo.

**Practical implication:** after building and swapping in this patch,
expect the *original* ~20 v2-class units (brief 187's own EUR figure —
see the honest caveat below on why that exact count may not transfer
directly) to stop panicking and become normal objdiff-diffable units.
Do **not** expect to be able to delete `tools/objdiff_filter_panic_units.py`
or its v3 rule — any unit matching the data-before-code v3 shape will
still crash `objdiff-cli` with this patch applied, and still needs the
Python-level filter (or a *second*, separate upstream fix this cherry-pick
does not provide).

**One more honest caveat:** brief 187's original doc characterizes
`_dsd_gap@main_202.o` as a v2-class unit ("only `STT_OBJECT` symbols
cover it," implying zero `STT_FUNC` symbols at all, EUR region), while
the filter tool's own newer v3 comment describes what looks like the
same filename (`_dsd_gap@main_202.o`, but explicitly on **USA**) as
*having* a real `main` FUNC symbol, just preceded by data. These are
most likely two genuinely different objects that happen to share a
same-index gap filename in different regions (EUR and USA have
different matched-function counts, so their gap numbering diverges by
region even at "the same" index) — but it means the exact 20-unit,
EUR-only count in the older doc should be **re-derived empirically**
per region after the patch, not assumed to still be precisely 20.

## Build + swap-in instructions for the brain (needs `cargo`/`rustup`)

This environment has neither installed. Once run somewhere that does:

```bash
# 1. Recreate the verified cherry-pick (or reuse the scratch clone from
#    this session if it's still on disk — see "Where the scratch clone
#    lives" below).
git clone https://github.com/encounter/objdiff objdiff-scratch
cd objdiff-scratch
git checkout -b patch-352 v2.7.1
git remote add lago https://github.com/LagoLunatic/objdiff
git fetch lago emptymapping --depth 20
git cherry-pick --no-commit e28a2021eb3e669f6011f7645b009f73aa19ddbc
# CONFLICT expected in objdiff-core/src/arch/arm.rs — resolve exactly as
# shown in "Final verified patch" above (keep this repo's own
# `SectionIndex(...)` wrapper, take the fix's `if x.is_empty() { ... }`
# logic), then:
git add objdiff-core/src/arch/arm.rs
git commit -m "ARM: Fix index out of bounds error when there are no mapping symbols"

# 2. Build just the CLI binary (workspace member confirmed present at
#    v2.7.1: `objdiff-cli/Cargo.toml` exists, `[workspace] members`
#    includes it).
cargo build --release -p objdiff-cli

# 3. Swap in. configure.py pins the version and resolves the binary to
#    the project root (tools/configure.py:74 `OBJDIFF_VERSION = 'v2.7.1'`;
#    tools/configure.py:224 `OBJDIFF = ./objdiff-cli<EXE>` at repo root —
#    `download_tool.py` populates this path automatically on first `ninja`
#    run if it's missing). Copy the freshly built binary over that exact
#    path for whichever region(s) you're validating:
cp target/release/objdiff-cli /path/to/kb-types/objdiff-cli        # Linux/macOS
copy target\release\objdiff-cli.exe \path\to\kb-types\objdiff-cli.exe   # Windows
```

Caveat: if a later `ninja` run re-triggers the `download_tool` rule (e.g.
after `objdiff-cli.exe` is deleted or the tag in `configure.py` changes),
it will overwrite the patched binary with a freshly-downloaded stock one —
there's no ninja-level "pin my hand-patched binary" mechanism, so just
re-copy it back into place if that happens.

## Validation plan

1. **Confirm the previously-filtered ~20 units are the right target set.**
   `python tools/objdiff_filter_panic_units.py --in objdiff.json --verbose`
   (on each region's `objdiff.json`, post `dsd objdiff`) prints the exact
   drop reasons and counts — re-run this FIRST, before touching the
   binary, to get a fresh per-region baseline (don't reuse brief 187's
   old EUR-only 20-unit number blind, per the caveat above).
2. **Temporarily disable just the panic-avoidance filtering** (keep the
   missing-`.o` / legacy-routing filter, since that's an unrelated,
   already-necessary case) so the previously-crashing units flow through
   to `objdiff-cli report generate` again, then run it with the
   **patched** binary. Two outcomes to look for, per unit:
   - Succeeds now → v2-class, fixed by this patch. Expected majority.
   - Still panics (watch for `"len is 1"` specifically vs the original
     `"len is 0"` — that's the diagnostic tell) → v3-class, NOT fixed by
     this patch; that unit needs the existing v3 filter rule to stay in
     place (already implemented — nothing to do here except confirm the
     v3 rule still catches it).
3. **Three-region gate, unchanged**: whatever the per-unit outcome, this
   patch only touches `objdiff-cli`'s *diffing/reporting* path, not the
   build/link/ROM chain — `ninja sha1` for eur/usa/jpn should be
   completely unaffected and should still pass, since none of this
   changes anything upstream of `dsd delink`/`mwcc`/`mwldarm`/`dsd rom
   build`. Run it anyway as a sanity check that swapping the binary
   didn't somehow break something else.
4. **If v2-class units are confirmed fixed**, consider narrowing
   `tools/objdiff_filter_panic_units.py`'s `has_addressable_text_code`
   to drop only the v3 case (data-first `.text`) rather than the
   broader "no sized FUNC at all" case — but that's a follow-up change
   to `tools/`, out of scope for this brief (which only asked for the
   patch + doc), and shouldn't happen until the validation in step 2
   confirms it's safe across all three regions, not just EUR.
5. **Two 10-minute upstream follow-ups** (per the swarm finding, still
   worth doing once validated): comment on
   [encounter/objdiff#352](https://github.com/encounter/objdiff/issues/352)
   confirming the LagoLunatic patch fixes a real downstream project
   (nudges the merge) — and separately, given the v3 crash this project
   found is NOT fixed by e28a2021, consider filing that as a distinct
   follow-up issue/comment, since LagoLunatic's own fix doesn't cover it
   and upstream likely doesn't know about it yet.

## Where the scratch clone lives

The verified cherry-pick (patch-352 branch, one commit on top of the
v2.7.1 tag) is in a git scratch clone under this session's temp
scratchpad directory, NOT inside this repository — per this brief's
constraints, nothing under `objdiff-scratch/` was committed here. If
that scratchpad is still available, the branch can be reused directly
instead of redoing the clone + cherry-pick + conflict resolution steps
above. If not, steps 1 above reproduce it exactly (verified working,
this session, git-only, no cargo needed for that part).
