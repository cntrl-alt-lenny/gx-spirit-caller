[//]: # (markdownlint-disable MD013)

# Brief 578 - EUR data-blob emitter (closing the last 2 non-function gaps)

Branch: `claude/eur-datablob-578`

Scope: build `tools/emit_data_blob.py` — a whole-function-as-data emitter
for the 2 addresses `batch_carve` could never close mechanically — and run
it for both of brief-572's parked EUR residuals: `020b2d2c` (0x3b8 bytes)
and `020b3c78` (0x544 bytes), both in `arm9/main`.

## Outcome

| Blob | Size | Result | Commit-ready file |
|---|---:|---|---|
| `func_020b2d2c` | 0x3b8 (952 B) | **SHIPPED** | `src/main/func_020b2d2c.s` |
| `func_020b3c78` | 0x544 (1348 B) | **SHIPPED** | `src/main/func_020b3c78.s` |

**Both blobs closed. `ninja sha1` PASS after each.** EUR delinks.txt now
shows `units: 10333 / 10333 (100.00%)` — every translation unit dsd tracks
is claimed. The only bytes anywhere in EUR that will never become real C
are the permanent ISA floor (42 canonical `mcr`/`mrc`/`swi` inline-assembly
files, `docs/research/campaign-analytics/cmatch-parked-and-floor.md`),
which were never gaps to begin with — they were always legitimately
shipped `.s`. **EUR's residual-floor closeout (briefs 570/572/578) is
complete.**

## Why these two resisted `batch_carve`

Brief 572 parked both as `verify-fail` — a real disassemble → reassemble
attempt (`asm_escape.py --whole-function`, the same strategy `batch_carve`
uses for every other whole-function `.s` ship) that produced a `.s` whose
re-assembly did **not** reproduce the original bytes. This is not a rare
failure mode in general (mwasmarm doesn't always pick the same encoding a
disassembler infers for an ambiguous instruction), but it's rare for it to
be *permanently* unrecoverable, since usually a different disassembler
heuristic or a manual instruction rewrite fixes it. For these two it
didn't — brief 572 named them "data blobs" needing a "whole-function-as-
data emitter" instead.

Before writing any code, I inspected the actual ground-truth bytes at both
addresses (`extract/eur/arm9/arm9.bin`). **Both disassemble as entirely
ordinary, well-formed ARM code** — clean `push {lr}` / `bx lr` framing, no
suspicious patterns suggesting literal non-code data (no repeating
constant tables, no obviously-non-instruction byte runs). This matters
because it ruled out the interpretation "these addresses secretly contain
a lookup table dsd mis-typed as a function" — they're real functions, with
real callers (2 and 6 `bl` call sites respectively, still resolving
correctly via `relocs.txt`). The actual problem is narrower and more
mundane: *this specific disassemble→reassemble round trip* doesn't
reproduce these particular bytes. "Whole-function-as-data" describes the
**emission strategy** (treat the byte range as opaque data for output
purposes), not a claim about what the bytes semantically are.

## Design decision: what does NOT change

I deliberately did **not** reclassify either symbol to `kind:data` or
rename it to a `data_*` symbol, despite brief 572/578's "data blob"
language suggesting that might be expected. Two things drove this:

1. **Empirical validation came first.** Before writing `emit_data_blob.py`,
   I hand-built a minimal test case for `020b2d2c`: raw `.byte` content in
   a `.text` section, but the symbol **left as `kind:function(arm,
   size=0x3b8)`, same name, untouched** in `symbols.txt`. `python
   tools/configure.py eur && ninja sha1` passed cleanly on the first try.
   That confirms the verify-fail's root cause is purely the emission
   strategy (disassembled instructions vs. raw bytes) — reclassifying the
   symbol kind isn't needed to fix it.
2. **Reclassifying would have been strictly riskier for zero benefit.**
   I checked: no `kind:data` symbol anywhere in this repo's EUR config
   currently receives an `arm_call`/`arm_branch` reloc — this would be
   untested territory for dsd's own `rom config` step. It would also
   require rewriting `.extern func_020b2d2c` / `bl func_020b2d2c` (and the
   `020b3c78` equivalents) by name across every calling `.s` file —
   `func_0200ac60.s`, `func_0200cf88.s` (call `020b2d2c`) and
   `func_020aeeac.s`, `func_020b1188.s` (call `020b3c78`, 6 sites total).
   None of that risk buys anything the simpler fix doesn't already
   deliver.

`ninja check` (dsd's symbol/module consistency checker, distinct from the
`ninja sha1` byte gate) was also run as a bonus sanity check — it reports
pre-existing errors, but they're all in `ov004` at unrelated addresses
(`0x0220xxxx`) and reproduce identically on a clean `origin/main` checkout
before any of this brief's changes (confirmed via `git stash`). Not
something this brief touches or is responsible for.

## `tools/emit_data_blob.py`

```
python tools/emit_data_blob.py --version eur --addr 0x020b2d2c --size 0x3b8
python tools/emit_data_blob.py --version eur --addr 0x020b2d2c --end 0x020b30e4   # equivalent
python tools/emit_data_blob.py --version eur --addr 0x020b2d2c --size 0x3b8 --dry-run
```

1. **Reads ground truth**: resolves the module's binary + RAM base address
   from `extract/<version>/arm9/arm9.yaml` (or `arm9_overlays/
   overlays.yaml` for `--overlay ovNNN`, included for generality though
   unused by this brief's 2 targets — both are `arm9/main`), slices
   exactly `size` bytes at `addr` from the matching `.bin`. No `pyyaml`
   dependency — a small regex scalar-reader, matching the existing
   convention already used by `find_region_siblings.py`'s
   `_read_yaml_int`/`_read_overlay_base`.
2. **Resolves the symbol**: looks up the existing `kind:function` entry at
   `addr` in `symbols.txt` (reusing `batch_carve.py`'s own
   `parse_symbol_addrs`/`parse_symbols`) to get the canonical name and
   cross-check its declared size. A `--name` override exists for a
   genuinely un-symbolled address, but neither of this brief's 2 targets
   needed it — both already had `func_*` entries.
3. **Guards, precisely**: refuses (does not force) if the requested
   size disagrees with `symbols.txt`'s declared size, or if the address is
   already claimed by an existing `delinks.txt` TU (reusing
   `batch_carve.py`'s `carved_addrs`) — the brief's "document precisely
   and park" instruction, made structural rather than just a written
   policy. Neither guard fired for real on this brief's 2 targets (both
   verified clean in `--dry-run` first); both fire correctly against
   synthetic negative cases (see tests).
4. **Renders the `.s`**: `.text` section (not `.rodata` — verified against
   the module's own section map that both addresses fall inside the
   `0x02000000..0x020b4320` `.text` range, not the `.rodata` range that
   starts immediately after), `.global <name>` / `<name>:` / 16-bytes-per-
   row `.byte` directives, with a header comment documenting the
   technique and why (matching the existing header-comment convention
   already used by whole-function `.s` ships and `data_*.s` cluster
   files — brief 302 and brief 125 respectively).
5. **Inserts the delinks.txt entry** by reusing `batch_carve.py`'s own
   `delink_block()` + `newline_guard()` verbatim, appending, then
   re-sorting via `tools/sort_delinks.py`'s `sort_delinks()` and auditing
   the result with `batch_carve.py`'s `audit()` — the exact canonical
   parse/sort/audit path `batch_carve` itself uses, so this tool's output
   is structurally indistinguishable from what `batch_carve` would have
   produced had the verify-fail not happened.

The code is split along the same PURE-vs-IMPURE line `batch_carve.py`'s
own docstring states as its design principle: name/size resolution and
the overlap check each have a pure `_from_text` variant (tested directly
on fixture strings) behind a thin I/O wrapper, so the decision logic is
unit-tested without needing a build, wine, or this repo's real (gitignored)
`extract/` tree present.

## Per-blob run log

```
$ python tools/emit_data_blob.py --version eur --addr 0x020b2d2c --size 0x3b8
config\eur\arm9\delinks.txt: 4436 blocks, 1 inversions -> 0; rewrote
wrote src\main\func_020b2d2c.s (952 bytes) + delinks entry in config\eur\arm9\delinks.txt

$ python tools/configure.py eur && ninja sha1
...
gx-spirit-caller_eur.nds: OK

$ python tools/emit_data_blob.py --version eur --addr 0x020b3c78 --size 0x544
config\eur\arm9\delinks.txt: 4437 blocks, 1 inversions -> 0; rewrote
wrote src\main\func_020b3c78.s (1348 bytes) + delinks entry in config\eur\arm9\delinks.txt

$ python tools/configure.py eur && ninja sha1
...
gx-spirit-caller_eur.nds: OK
```

Both blobs gated **individually**, per the brief's "GATE per blob"
instruction — the second gate run also re-confirms the first blob's fix
still holds with both changes present together. Neither blob resisted;
neither needed parking.

## Tests

`tests/test_emit_data_blob.py`, 23 tests:

- Pure `.s` rendering (`render_data_blob_s`): a round-trip check (decode
  the emitted `.byte` rows back to bytes, assert equality with the input)
  on a 512-byte multi-row case and a 3-byte non-row-aligned case — the one
  property that actually matters for this tool. Also pins: no `.arm`
  directive (data, not code), correct `.text`/`.global`/label lines,
  correct header range/byte-count text.
- Pure name/size resolution and overlap-check logic (`_from_text`
  variants), including the two negative guardrails (size mismatch,
  already-claimed address) and one real edge case worth pinning: a
  friendly-renamed symbol (e.g. `VBlankIntrWait`) at the target address is
  invisible to `batch_carve.py`'s `parse_symbol_addrs` by design (it only
  indexes `func_`-prefixed names) — same as an unclaimed address unless
  `--name` is given. Not a bug; documented behavior inherited from the
  reused helper.
- I/O-touching paths (`module_binary_and_base`, `read_ground_truth_bytes`)
  tested against a synthetic temp `extract/` tree with `ROOT`
  monkeypatched — never against this repo's real, gitignored `extract/`,
  which isn't present in CI.
- One full end-to-end `emit()` test against an all-temp fixture tree
  (`extract/` + `config/` + `src/`): confirms the emitted `.s` reproduces
  the fixture's ground-truth bytes exactly, the delinks.txt entry lands in
  correctly-sorted address order between two existing blocks (not just
  appended), and `audit_problems` is empty. Plus a `--dry-run` test
  (writes nothing) and the two negative-guardrail integration cases.

```text
$ python -m ruff check tools/emit_data_blob.py tests/test_emit_data_blob.py
All checks passed!

$ python -m pytest -q tests/test_emit_data_blob.py
23 passed in 0.18s

$ python -m pytest -q tests
11 failed, 2563 passed, 10 skipped, 9 subtests passed

$ python -m pytest -q tests --ignore=tests/test_emit_data_blob.py   # baseline
11 failed, 2540 passed, 10 skipped, 9 subtests passed
```

Identical 11 pre-existing Windows-env failures with or without this
branch's additions (`test_cluster_c_pattern3_gen`,
`test_cross_region_cluster_apply`, `test_generate_tool_index`,
`test_m2c_feed` x4, `test_objdiff_resolve_relocs`,
`test_patch_ov004_veneers`) — same failing-test set, same pre-existing
path-separator/CLI-quoting nature, none touching a file this brief
modified. 0 added failures, +23 new passing tests.

## Final verification

```text
$ python tools/configure.py eur && ninja sha1
...
gx-spirit-caller_eur.nds: OK

$ python tools/progress.py --version eur
  units:       10333 / 10333             (100.00%)
```

`git status --short` after both emissions shows exactly the expected 5
paths: `config/eur/arm9/delinks.txt` (modified, 2 new sorted entries),
`src/main/func_020b2d2c.s` + `src/main/func_020b3c78.s` (new),
`tools/emit_data_blob.py` + `tests/test_emit_data_blob.py` (new). No
`symbols.txt` change, no other region touched, no build artifact
committed.

## EUR final state

With both blobs shipped, **every EUR translation unit dsd's delink step
tracks is now claimed** (`units: 10333/10333`). The only unclosed bytes in
the entire EUR tree are the 42-file permanent ISA floor
(`mcr`/`mrc`/`swi` inline assembly, `cmatch-parked-and-floor.md`) — which
were correctly excluded from the 79-function closeout count from the
start (brief 570) precisely because they are not gaps: they are
legitimately-shipped `.s`, permanent by ISA necessity, not a target for
any tool in this closeout lane. EUR's residual-floor closeout arc (brief
570 census → brief 572 mechanical 77/77 → brief 578's 2 data blobs) is
complete.
