### claude-pc/sinit-bulk-match

**Goal:** Match a single `__sinit_*` function cleanly against objdiff,
then propagate the pattern to the other 43 functions of the same size
(`0x2c`) in overlays that already round-trip byte-identically. The 7
outliers (sizes `0x04`, `0x18`, `0x34`, `0x3c`, `0x48`) and the lone
`__sinit_ov004_*` in a failing module are **out of scope** for this
brief — they ship as follow-ups.

**Context:**

- CodeWarrior emits one `__sinit_<obj>_<addr>` per translation unit
  that has a non-trivial static/global initializer. The survey in
  [`libs/runtime/README.md`](../../libs/runtime/README.md) counts **51
  across 15 overlays**. 44 of the 51 are exactly `0x2c` bytes; the
  bodies are near-identical save/call/restore templates. Match one,
  the other 43 fall in a handful of follow-up commits.
- **Suggested first target:** `__sinit_ov005_021b16e4`. Size `0x2c`,
  in overlay 5 (which is ✅ in `dsd check modules`). Backup target if
  ov005 turns out to be awkward: `__sinit_ov009_021ad868` — same size,
  also in a passing overlay.
- The 3 failing modules (`main` / `dtcm` / `ov004`) are off-limits
  because cross-module relocations injected by
  `--allow-unknown-function-calls` still diverge from the baserom. A
  regression in those modules won't be distinguishable from existing
  noise. `__sinit_ov004_021ad700` is the only `__sinit` in a failing
  module; skip it.
- Every `__sinit_*` has a companion `.p__sinit_*` data symbol (a word
  pointer, part of the ctor list). Those are already in
  `symbols.txt`; do **not** rename or touch them.
- [`tools/rename_symbol.py`](../../tools/rename_symbol.py) (PR #12)
  does validated cross-file symbol renames — use it once a function is
  matched, rather than hand-editing `symbols.txt`. Dry-run first with
  `--check`.
- [`tools/analyze_symbols.py`](../../tools/analyze_symbols.py) now has
  `--diff` (PR #13). Snapshot before starting (`--snapshot
  build/eur/analysis/pre-sinit.json`), snapshot again after, and diff
  to see how many previously-unnamed callers cascade into easier
  tiers.

**The template (what to expect at `0x2c`):**

Don't guess the C shape from the outside. Load the extracted
`__sinit_ov005_021b16e4.o` in objdiff, paste its disassembly into the
`.c` file's leading comment (the ov005 easy-tier PRs already follow
this convention — see
[`src/overlay005/ov005_021ab0fc.c`](../../src/overlay005/ov005_021ab0fc.c)
for the tone), then iterate a C body until objdiff shows 100% match.
The expected shape is roughly: save `lr`, call a CodeWarrior ctor-list
hook (`nn_hook_ctor_list` / `__init_cpp_exceptions` or similar — name
not yet known), restore, return. The SDK hook will appear as a BL to
an unnamed address; leave it unnamed unless the name is obvious.

**Scope:**

- `src/overlay005/__sinit_ov005.c` (new file) — the matched template
  plus all 5 `__sinit_ov005_*` as separate functions if the same C
  source can emit all five. If per-function files read cleaner, use
  one `.c` per function following the ov005 convention.
- `src/overlay<NN>/__sinit_ov<NN>.c` for each passing overlay as the
  pattern propagates.
- `config/eur/arm9/overlays/ov<NN>/symbols.txt` — rename only via
  `tools/rename_symbol.py --apply` after objdiff confirms a match.
- The companion `.p__sinit_*` data entries stay as-is.

**Non-scope:**

- ❌ `ov004` (failing module) — leave for a later brief.
- ❌ The 7 outliers (`0x04` ×2, `0x18`, `0x34`, `0x3c`, `0x48` ×2).
- ❌ Naming the SDK hook function (`nn_hook_ctor_list`-or-whatever).
  That's its own matching task; guessing will mis-rename.
- ❌ Touching `libs/runtime/` source (headers only exist there; don't
  introduce a `.c`). If the matched template needs shared declarations,
  add them to `libs/runtime/include/runtime/` in a separate PR — or
  flag for Cloud to scaffold.
- ❌ `tools/`, `AGENTS.md`, `CLAUDE.md`, other overlays' gameplay code.

**Success:**

- `ninja rom && ./dsd check modules -c config/eur/arm9/config.yaml`
  still reports **24/27 OK**. None of the previously-passing overlays
  regresses.
- `ninja objdiff` shows every newly-decompiled `__sinit_*` at 100%.
- `python tools/progress.py` ticks up by the number of matched
  `__sinit`s in this PR.
- `python tools/analyze_symbols.py --version eur --diff
  build/eur/analysis/pre-sinit.json` is included in the PR body (or
  linked as an artifact) showing the cascade.
- PR opened per matched batch. Suggested cadence: **one PR for the
  first matched function** (so the brain can sanity-check the
  template before propagation), then **one PR per 2-3 overlays** for
  the bulk propagation. Don't wait until all 43 are done.

**Branch:** `claude-pc/sinit-bulk-match`

**Heads-up — unused tools worth knowing about:**

Three tools shipped in the last cycle and haven't been namechecked to
the decomper yet:

- [`tools/rename_symbol.py`](../../tools/rename_symbol.py) — use this
  instead of hand-editing `symbols.txt`. Validates that the rename is
  consistent across `symbols.txt`, `relocs.txt`, and `delinks.txt`.
- [`tools/overlay_coupling.py`](../../tools/overlay_coupling.py) —
  cross-module call-density report. Optional here (the 44 targets are
  structural, not call-graph-driven), but worth a look if the pattern
  matches uncover new cross-overlay edges.
- [`tools/data_symbol_sizes.py`](../../tools/data_symbol_sizes.py) —
  infers `data_*` extents from symbol gaps. Again optional for this
  brief; most useful once you start naming ctor-list globals.

**After this brief lands:**

Follow-up briefs, in priority order: (a) the 7 outlier `__sinit`
sizes; (b) `__sinit_ov004_*` once ov004 cross-module relocs are
resolved; (c) the SDK hook function the `__sinit`s all BL into — that
one name unlocks a whole runtime-library tier.
