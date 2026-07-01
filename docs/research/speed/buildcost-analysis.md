[//]: # (markdownlint-disable MD013 MD041)

# Per-candidate build cost analysis

Read-only investigation of `tools/configure.py`'s ninja graph to find the
exact cost driver behind "`ninja sha1` walks a huge compile set" whenever a
campaign agent flips one candidate's `delinks.txt` entry from `.s` to `.c`.
No builds were run to produce this doc — every claim below is grounded in
`tools/configure.py` source (line numbers cited) and static file counts on
disk. Two claims are flagged explicitly as **NEEDS EMPIRICAL TEST** because
they depend on runtime behavior of the external `dsd` binary, which isn't
observable by reading this repo's Python wrapper alone.

---

## TL;DR

**The dominant cost driver is almost certainly this single line:**

```python
# tools/configure.py:585
mwasm_implicit = [ASM, patch_align] + list(project.delinks_files)
```

`project.delinks_files` is **every** `delinks.txt` in the whole region (27
files for EUR — one per module: `main` + 23 overlays, roughly). This exact
same list — ALL 27 files, not just the one covering the edited module — is
attached as an implicit ninja dependency to **every single `.s`-assembly
build edge in the entire project**, via `add_mwasm_builds` (line 1165),
which loops `get_asm_files()` with **one shared `mwasm_implicit` parameter**
for every file (line 1179). There are currently **6,388 `.s` files still
un-matched** in the EUR baseline tree (counted directly on disk, see
below). Editing ONE line in ONE module's `delinks.txt` bumps that file's
mtime, which — because it's in every one of those 6,388 edges' implicit-dep
lists — makes ninja consider **all 6,388 `mwasm` edges stale**, and
re-invoke `mwasmarm.exe` (via `wine`/native) on every one of them, even
though 6,387 of those files have nothing to do with the module that
actually changed.

**Top-ranked optimization: narrow that implicit-dependency list to just the
one `delinks.txt` that covers each source file's own module** (Optimization
1 below). This is a pure ninja-graph change — it does not alter what any
command actually executes, only *when ninja considers it stale* — so the
risk is low and the fix is mechanical. Everything else in this doc is
either already-shipped tooling that should be leaned on harder, or a
second-tier structural change gated on an empirical test the brain needs a
built worktree to run.

---

## 1. Static scale (counted on disk, no build needed)

```
$ find src -name "*.s" ! -path "*/usa/*" ! -path "*/jpn/*" | wc -l
6388
$ find src -name "*.c" ! -path "*/usa/*" ! -path "*/jpn/*" | wc -l
3795
$ find config/eur/arm9 -name "delinks.txt" | wc -l
27
$ find src/overlay017 -name "*.s" | wc -l      # one overlay, for scale
32
```

So a single-candidate flip in `ov017` (32 `.s` files' home module) currently
risks dirtying the `mwasm` edge for **6,388** files — **200×** more than the
32 that could conceivably need re-examination for that module. This matches
the scaffolder's own observation ("`ninja sha1` walks a huge compile set")
almost exactly in shape: the compile set that walks is not proportional to
the one changed function, or even the one changed module — it's the
**entire remaining `.s` surface of the region**.

---

## 2. The exact per-candidate rebuild chain

Tracing what `ninja sha1` actually re-evaluates after a campaign agent
flips one TU header in one `delinks.txt` (`func_X.s:` → `func_X.c:`) and
drops the new `.c` file in `src/`:

| # | Ninja rule (source line) | Inputs that gate it | What happens on ONE flip | Inherent or wasteful? |
|---|---|---|---|---|
| 1 | `delink` (configure.py:458, edge at 1320) | `project.dsd_configs()` = **all** delinks.txt + relocs.txt + symbols.txt (every module) + rom_config | `dsd delink --config-path ...` re-runs — **NEEDS EMPIRICAL TEST** whether this re-splits every module's gap objects or is internally incremental per-module | Likely wasteful (see §3) |
| 2 | `mwcc` (configure.py:473) | just the one new `.c` file + compiler binary | compiles the ONE new candidate — correct, cheap, unavoidable | Inherent |
| 3 | `mwasm` ×6,388 (configure.py:1165, implicit list at 585) | **every** `.s` file's edge has **all 27** delinks.txt as implicit deps | re-invokes `mwasmarm.exe` for **every remaining `.s` file project-wide**, not just the touched module's | **Wasteful — the dominant driver** |
| 4 | `lcf` (configure.py:620, edge at 1337) | `project.delinks_files` = all 27 + rom_config | `dsd lcf -c ...` regenerates the WHOLE `arm9.lcf` + `objects.txt` — likely cheap per-invocation, but always fires on any delinks.txt edit anywhere | Wasteful trigger, cheap in itself |
| 5 | `mwld` (configure.py:670, edge at 957) | `project.source_object_files()` (literally every `.o` in the tree) + lcf_file + objects_file + delink_file | full relink of the whole ARM9 image — **this step is inherent** (any real candidate produces a new `.o` that must be linked in; mwldarm has no incremental-link mode) but is *also* force-triggered by steps 1 and 4 even when their own regenerated output is byte-identical | Partially inherent, partially wasteful (no `restat`, see Optimization 4) |
| 6 | `rom_config` (configure.py:699, edge at 1004) | `elf_file` only | `dsd rom config` re-reads the linked ELF, writes overlay/module YAML metadata | Inherent (fires only when the link output actually changed) |
| 7 | `cleanup_macos_junk` (configure.py:1046) | phony always-dirty input, but `restat=True` | runs every invocation but propagates downstream only if it changed something; no-op path on Windows anyway | Not a real driver on this platform |
| 8 | `rom_build` (configure.py:1062) | `rom_config_file` | `dsd rom build` packs the **entire ROM image** (all modules + FNT/FAT + header) | Inherent — proportional to full ROM size, not to candidate count, but unavoidable per real change |
| 9 | `sha1` (configure.py:1080) | `rom_file` | hashes the final ROM, compares | Cheap, correct, unavoidable |

**Read of the chain:** steps 2, 6, 8, 9 are correctly-scoped and cheap or
proportional to real work. Step 5 (full relink) is inherent in shape but
currently impossible to skip even when steps 1/4's output didn't
semantically change, because those rules lack `restat=True`. **Step 3 is
the outlier** — it is the only step whose blast radius (6,388 files) is
utterly disconnected from the size of the actual change (1 file, 1 module),
and it is caused by a single over-broad implicit-dependency list, not by
any real requirement of the toolchain.

---

## 3. Ranked optimizations

### Optimization 1 — Scope `mwasm_implicit` to the owning module's `delinks.txt`

**Rank: 1 (highest impact / effort ratio, lowest risk)**

**Exact change:** in `add_mwasm_builds` (configure.py:1165), replace the
single shared `mwasm_implicit` parameter (currently `[ASM, patch_align] +
list(project.delinks_files)`, computed once in the caller at line 585 and
passed in unchanged for all 6,388 files) with a **per-file** implicit list
containing only the `delinks.txt` that actually covers that source file's
module. The module → delinks.txt mapping is derivable from the source
path's directory (`src/overlay017/...` → `config/<region>/arm9/overlays/
ov017/delinks.txt`; `src/main/...` → `config/<region>/arm9/delinks.txt`),
which the codebase already computes elsewhere for other per-module wiring
(e.g. the `ov004`-specific `delinks`/`relocs` variables at lines 943-947).
Sketch:

```python
def _delinks_for_source(source_file: Path, project: Project) -> list[str]:
    """The one delinks.txt whose TU list can name source_file's module."""
    # derive module dir from source_file.parts (mirrors existing
    # ov004-specific lookup at configure.py:946-948), fall back to
    # scanning project.delinks_files for the one containing this
    # module's expected relative path if the naming isn't 1:1.
    ...

def add_mwasm_builds(n, project, mwasm_implicit_base: list):
    for source_file in get_asm_files([src_path, libs_path], region=project.game_version):
        implicit = mwasm_implicit_base + [_delinks_for_source(source_file, project)]
        n.build(..., implicit=implicit, ...)
```

This does **not** change the `mwasm` command's argv (the `--delinks`
flags passed to `patch_section_align.py` at line 572-573 can stay as-is,
or be narrowed too as a follow-up — that's a separate, lower-value cleanup
since it doesn't affect ninja staleness, only command-line length). Only
ninja's dependency-staleness tracking changes.

**Expected saving:** if step 3 in the chain above really is re-invoking
`mwasmarm` for all 6,388 files today, this change cuts that to roughly the
one edited module's own `.s` count (single digits to a few dozen, per the
`ov017` example above — 32 files). Given `optimized-loop.md`'s documented
2-5 minute `ninja sha1` baseline, and that thousands of superfluous
`wine`/native `mwasmarm` invocations plausibly dominate that window, this
could cut per-`sha1` wall-clock by more than half — **but this specific
percentage is an estimate; confirm with the test below before promising a
number to the campaign.**

**Risk:** low. This is a ninja-graph-only change — it does not alter what
any tool actually does when it runs, only which edges ninja considers
dirty. The failure mode to guard against is under-scoping (missing a
delinks.txt that a given `.s` file's trim-heuristic genuinely needs) —
mitigate by keeping the fallback path (full list) for any module where the
1:1 directory-to-delinks.txt mapping doesn't hold cleanly (verify against
all 27 files first, per the test below), and by running a full 3-region
`ninja sha1` gate before merging.

**Test (brain, needs a built worktree):**

```bash
# 1. Confirm the current (broken) blast radius empirically:
python tools/configure.py eur
ninja sha1                                   # one full build to reach a clean baseline
# Flip ONE TU header by hand in a small overlay's delinks.txt (no real
# .c file needed for this dry-run — ninja -n doesn't execute anything):
#   e.g. edit config/eur/arm9/overlays/ov017/delinks.txt,
#   change one "src/overlay017/func_ov017_XXXXXXXX.s:" header's
#   extension to ".c:" (revert after the test)
ninja -n sha1 | grep -c '^mwasm '             # count of mwasm edges ninja WOULD re-run
ninja -n sha1 | grep '^mwasm ' | grep -vc overlay017   # how many are OUTSIDE the touched module
# If the second number is anywhere near 6000, the fan-out theory is confirmed.
git checkout config/eur/arm9/overlays/ov017/delinks.txt   # revert the test edit

# 2. After applying the code fix, re-run the same two commands and
#    confirm the "outside the touched module" count drops to ~0.

# 3. Full regression gate before merging (all three regions):
for v in eur usa jpn; do
  python tools/configure.py $v && ninja sha1 || echo "FAIL: $v"
done
```

---

### Optimization 2 — Lean on the already-shipped `fastmatch.py` / `batch_sha1.py` (PR #1065)

**Rank: 2 (no new engineering — a process/discipline note, but the single
biggest already-available lever if it isn't yet the default loop)**

**Exact change:** none in code — this is a usage-pattern reminder. Per-
candidate verification should go through `tools/fastmatch.py` (compiles
the one candidate `.c`, compares against its delinked gap `.o` via resolved
objdiff, **without touching `delinks.txt` at all** — so it never triggers
steps 1/3/4/5/6/8/9 above). `ninja sha1` should only run once per **batch**
of 5-10 accepted candidates via `tools/batch_sha1.py`, which amortizes the
one unavoidable full chain over N candidates instead of paying it N times.
See `docs/research/tooling/optimized-loop.md` for the full recipe.

**Expected saving:** doesn't reduce the *absolute* cost of one `ninja
sha1` run, but divides it by the batch size — already-quantified in
`optimized-loop.md` as saving "4-9 recompile cycles per wave" for a 5-10
candidate batch. **Combines multiplicatively with Optimization 1**: once
the mwasm fan-out is fixed, the per-batch `ninja sha1` itself gets cheaper
too, so the two together compound.

**Risk:** none — this is already-merged, already-validated tooling. The
only "risk" is organizational: if any campaign lane is still calling
`ninja sha1` directly per-single-candidate instead of through this loop,
that's the cheapest possible win to close first, before any code change.

**Test:** confirm the campaign's current standard operating loop actually
uses `fastmatch.py` per-attempt and `batch_sha1.py` per-batch — grep recent
briefs/PRs for direct `ninja sha1` invocations outside `batch_sha1.py` as a
smell check:

```bash
grep -rn "ninja sha1" docs/research/ tools/ | grep -v "batch_sha1.py\|optimized-loop.md\|buildcost-analysis.md"
```

---

### Optimization 3 — Determine whether `dsd delink` / `dsd lcf` are internally incremental, and whether they support module scoping

**Rank: 3 (blocking investigation for a second structural fix — impact
unknown until tested)**

**Why this matters:** step 1 (`dsd delink`) and step 4 (`dsd lcf`) are each
wired as ONE monolithic ninja edge covering the whole region (all 27
delinks.txt as combined inputs, one command, one output). Even after
Optimization 1 fixes the mwasm fan-out, these two steps will still
re-run in full on every candidate, because their ninja-level inputs are
still "all 27 files." Two things are unknown from reading `configure.py`
alone (it only shows how this repo *invokes* `dsd`, not `dsd`'s own
internal behavior — `dsd` is an external Rust binary, not vendored here):

1. Does `dsd delink` internally skip re-splitting modules whose section
   bytes didn't change (e.g. via its own content hash/cache), making the
   ninja-level "re-run the whole command" cheap in practice even though
   the ninja edge looks monolithic? Or does it unconditionally re-walk
   and re-split every module's ELF on every invocation?
2. Does `dsd delink` / `dsd lcf` expose a `--module`/`--config-path`
   scoping flag that would let the ninja graph be split into one
   sub-edge per module (so only the touched module's own delink/lcf
   sub-step reruns)?

**Exact change (pending the test's answer):** none yet — this is a
read-the-tool's-own-`--help`-and-time-it investigation, not a code change.

**Expected saving:** unknown until tested. If `dsd delink` is already
internally incremental, this driver contributes near-zero to the observed
cost and effort should stay concentrated on Optimization 1. If it's
genuinely a full re-split every time, it's a second real driver worth
attacking (Optimization 5 below sketches the structural fix, gated on
this investigation's answer).

**Risk:** none — this is pure investigation, no code touched.

**Test (brain, needs the `dsd` binary + a configured worktree — still no
full build required):**

```bash
# Does dsd expose module/scope flags at all?
./dsd delink --help
./dsd lcf --help

# Time a full delink from a just-touched (not content-changed) delinks.txt:
python tools/configure.py eur
touch config/eur/arm9/overlays/ov017/delinks.txt   # bump mtime, NO content change
time ninja delink                                   # "delink" is a valid phony target (configure.py:1332)

# Repeat, touching a DIFFERENT single overlay's delinks.txt each time,
# and compare wall-clock to a "touch nothing, re-run anyway" baseline
# (ninja will report "no work to do" if nothing's dirty — use
# `ninja -t clean delink && ninja delink` to force a real from-scratch
# run for the baseline number). If touching one file costs the same as
# a full from-scratch delink, dsd delink is NOT internally incremental.
```

---

### Optimization 4 — Add `restat=True` to the `delink` and `lcf` rules

**Rank: 4 (small, safe, complementary — reduces waste on the NEXT step
even without touching step 3 or step 1/4's own cost)**

**Exact change:** add `restat=True` to the `n.rule(name="delink", ...)`
(configure.py:458-464) and `n.rule(name="lcf", ...)` (configure.py:620-632)
declarations. `restat=True` is already used successfully elsewhere in this
same file for exactly this purpose (`cleanup_macos_junk`, line 736, with
the comment at line 1028 explaining it lets ninja "only propagate
downstream rebuilds when the cleanup actually modified something").

**Expected saving:** does not reduce the cost of running `dsd delink`/`dsd
lcf` themselves (they still execute), but if their OUTPUT is byte-identical
to before — e.g. a no-op re-run, or a delinks.txt edit that doesn't change
`delink.yaml`'s derived content — `restat=True` tells ninja the output
didn't actually change, so it won't cascade a full relink (step 5) on that
basis alone. Modest, situational win; mostly useful for repeated `ninja
sha1` calls where nothing new landed, or partial-revert workflows (like
`batch_sha1.py`'s bisect, which repeatedly re-applies/reverts candidates
and re-runs `ninja sha1` — a `restat`-aware graph would skip the relink on
any bisect step whose net delinks.txt state matches a previously-seen one).

**Risk:** very low — `restat` is a ninja built-in specifically for this
"tool ran but output is unchanged" case, already proven safe in this same
build in the `cleanup_macos_junk` rule.

**Test:**

```bash
python tools/configure.py eur
ninja sha1                          # clean baseline
touch config/eur/arm9/overlays/ov017/delinks.txt   # mtime bump, no content change
ninja -n sha1 | wc -l                # before adding restat=True — expect a large number
# apply the restat=True change, regenerate, repeat:
python tools/configure.py eur
touch config/eur/arm9/overlays/ov017/delinks.txt
ninja -n sha1 | wc -l                # after — expect near-zero (delink.yaml content is
                                      # unchanged, so restat should prune the mwld cascade)
```

---

### Optimization 5 — Per-module split of the `delink`/`lcf` ninja edges

**Rank: 5 (highest theoretical ceiling, highest risk — gate strictly on
Optimization 3's findings)**

**Exact change:** IF Optimization 3's investigation shows `dsd delink`/`dsd
lcf` support module-scoped invocation, restructure `add_delink_and_lcf_
builds` (configure.py:1316) to emit one delink sub-edge and one lcf
sub-edge **per module**, each depending only on that module's own
`delinks.txt` (+ shared rom_config), instead of the current single edge
depending on all 27. A candidate flip in `ov017` would then only re-run
`ov017`'s own delink/lcf sub-step.

**Expected saving:** potentially large (removes steps 1 and 4's full-
project cost entirely, leaving only the inherently-necessary step 5 full
relink) — but **entirely contingent on dsd actually supporting this
scoping**; if it doesn't, this optimization isn't available at all without
patching `dsd` itself (out of scope for this repo).

**Risk: high.** This repo's history shows the delink/lcf/mwld wiring has
been the site of many hard-won, subtle byte-exactness bugs — alignment
cascades (briefs 013/115/116), ov004 veneer/cascade issues (briefs 131,
133, 134, 138, 140, 164, 168, 179, 180), and bootstrap dependency-graph
correctness (brief 215/216). Splitting a monolithic multi-module link step
into per-module sub-steps is exactly the kind of change that could
silently reintroduce a cross-module ordering or alignment assumption one
of those briefs fixed. **Do not attempt without**: (a) Optimization 3
confirming dsd genuinely supports the scoping, (b) a full 3-region `ninja
sha1` gate before AND after, and (c) ideally isolating the change behind a
flag until proven stable across several campaign waves.

**Test:** same 3-region gate as Optimization 1's step 3, run both before
implementing (to have a clean revert point) and after.

---

## What NOT to attempt

- **Switching linkers or adopting an incremental-link toolchain.** The
  project's entire goal is byte-identical reproduction of a ROM built by
  `mwldarm 2.0/sp1p5` — any different linker changes the output bytes.
  Full relink (step 5) is inherent to this constraint, not a bug.
- **Removing or loosening the trim-padding / section-alignment patches**
  (`patch_section_align.py`, `patch_lcf_arm9_align.py`, the ov004 veneer
  splice) to simplify the dependency graph. Every one of these exists to
  fix a specific, previously-diagnosed byte-mismatch (see the inline
  comments at configure.py:426-470, 592-686) — removing them to make the
  graph "cleaner" would reopen closed bugs.
- **Skipping `dsd rom build`'s full-ROM repack per candidate.** It's
  proportional to ROM size, not candidate count, and is already only
  triggered when the link output actually changed (step 6/8 are
  correctly-scoped in the current graph).

---

## Summary table

| Rank | Optimization | Code change? | Risk | Gated on |
|---|---|---|---|---|
| 1 | Scope `mwasm_implicit` per-module | Yes, ninja-graph only | Low | — |
| 2 | Enforce fastmatch+batch_sha1 as the only per-candidate loop | No (process) | None | — |
| 3 | Investigate dsd delink/lcf incrementality + scoping flags | No (investigation) | None | — |
| 4 | `restat=True` on delink/lcf rules | Yes, one-line ×2 | Very low | — |
| 5 | Per-module split of delink/lcf edges | Yes, structural | High | Optimization 3's answer |
