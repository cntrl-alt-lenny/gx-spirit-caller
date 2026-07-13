[//]: # (markdownlint-disable MD013)

# Brief 569 - dsd sig clone-census prototype (improvement-swarm r4 A1)

Branch: `claude/sig-census-569`

Scope: a **read-only** measurement prototype (`tools/sig_census.py`) around
`dsd sig new` / `dsd sig apply --dry`, per the r4 A1 leverage play — never
applies a match or port, only measures what the two subcommands can see.
Two censuses: (1) an internal EUR clone census (does a masked byte-signature
match more than one place in EUR?) and (2) a region-twin map (does that
signature resolve an exact USA/JPN address?), cross-validated against
`port_to_region.py`'s independent reloc-signature resolution.

## Outcome

| Question | Answer |
|---|---|
| Does the CLI support this? | Yes — `sig new -c <config> -f <function>` emits a signature; `sig apply -c <config> -s <sig.yaml> --dry` dry-applies it. Confirmed via `--help` (below), never guessed. |
| New clone families found? | **6 / 60** sampled (10%) — masked-identical siblings not listed in any of our 3 heuristic catalogue docs. |
| Exact region-twins mapped? | **49 / 60** USA + 49 / 60 JPN resolved to an exact address; 6 ambiguous (family clones), 2 genuine dsd-side misses, 1 self-named no-op, 2 sig-generation failures. |
| False-positive rate vs known matches? | **0 / 44** disagreements — every cross-validated pair where both methods produced a comparable answer agreed exactly. (This numerator started at a false **0/44 agree** on the first run — see "the cross-validation bug" below — before a real bug in this tool's own comparison code was found and fixed.) |
| Run-time? | 182.2s for 60 functions × 3 configs (EUR self + USA + JPN) ≈ 3.0s/function, all on committed config, no build required. |
| Go/no-go? | **Go for region-twin porting on family-of-1 functions; no-go (as-is) for the internal clone census.** See recommendation at the end. |

## 1. Confirming the CLI first

Per the brief's instruction, nothing below was guessed — all three
subcommands were confirmed via `--help` on this worktree's `./dsd` (v0.11.0)
before any code was written:

```
$ ./dsd sig --help
Commands:
  new      
  apply    
  list     
  new-elf  

$ ./dsd sig new --help
Usage: dsd.exe sig new [OPTIONS] --config-path <CONFIG_PATH> --function <FUNCTION>
  -c, --config-path <CONFIG_PATH>  Path to config.yaml
  -f, --function <FUNCTION>        Function name to create the signature for
  -n, --index <INDEX>              Which function to use, if there are multiple

$ ./dsd sig apply --help
Usage: dsd.exe sig apply [OPTIONS] --config-path <CONFIG_PATH>
  -c, --config-path <CONFIG_PATH>  Path to config.yaml
  -s, --signature <SIGNATURE>      Signature to apply. Can be a known signature from `sig list` or a path to a YAML file
  -a, --all                        Apply all known signatures
  -d, --dry                        Dry run, do not write to any files
```

To understand exactly what "apply" does under the hood (its terse output
initially looked like a broken/silent tool, not a working one), I fetched
dsd's actual Rust source (`cli/src/cmd/sig/apply.rs`,
`cli/src/analysis/signature.rs` from `github.com/AetiasHax/ds-decomp` via
`gh api`) rather than guess from behavior alone. Key facts that shaped the
tool's design:

- `sig new` masks `bl`/`blx` immediate targets and pool constants out of
  the byte pattern — two functions that only differ in *which* other
  functions they call, or in *which* constant they load from the same
  relative pool slot, hash identically.
- `sig apply` requires an **unambiguous single match** across every module
  loaded from one `config.yaml` to do anything observable. `--dry` skips
  only the final file write — the rename+log still fires in-memory, so:
  - A match that resolves to a **different address** than its current name
    prints `Renamed function at 0xADDR in <module> to '<name>'` (and
    `Renamed symbol at ...` for any relocation targets the rename touches)
    — this is the only case with a parseable, addressed result.
  - A match that's **already correctly named** (self-consistent) prints
    nothing beyond routine `INFO`/`DEBUG` loading lines — silence is a
    valid, expected outcome, not a bug.
  - **Multiple matches** or **no match** each print one explicit,
    greppable ERROR line.

## 2. The tool

`tools/sig_census.py --sample-size 40 [--cross-validate] [--out PATH]`

1. **Sample**: reads every `config/eur/**/delinks.txt` via the canonical
   `parse_delinks_file` (brief 566), keeps `.c`/`.cpp` TUs with
   `status == "complete"` and `.text` size ≥ `--min-size` (default 0x20 —
   tiny stub-shaped functions collide by coincidence too easily), shuffles
   with a fixed `--seed` for reproducibility, takes the first N.
2. **Internal census**: `sig new` against `config/eur`, then `sig apply
   --dry` back against `config/eur` (main + all 23 EUR overlays, one
   config.yaml). The source function is always present in its own search
   space, so a genuine "no clone anywhere" case reports `applied_noop`
   (self-match only) and a clone-exists case reports `multiple` — never an
   address. Every `multiple` hit is checked against the 3 existing
   heuristic worklist docs (`cmatch-sweep-queue.md`,
   `cmatch-sweep-queue-overlays.md`, `VtableDispatchPatterns.md`) by
   address string; a hit absent from all three is flagged a candidate
   **new** family.
3. **Region-twin map**: the same EUR signature dry-applied against
   `config/usa` and `config/jpn`. The EUR source isn't in those search
   spaces, so an unambiguous match reliably resolves to the exact twin
   address via the `Renamed function at 0xADDR ...` line.
4. **Optional `--cross-validate`**: for every resolved twin, independently
   runs `port_to_region.py --dry-run --json` on the same EUR source and
   compares its predicted target address against the twin address.

Guardrails matched to r3/r4's own framing: `-c <config.yaml>` whole-module
loading (not a linked `arm9.o`, so the brief-187/206 "linked object panics
objdiff-cli" gotcha doesn't apply here), `--min-size` skip for tiny
functions, `--dry` on every `sig apply` call (never `-a`, never without
`-d`), zero `delinks.txt`/`symbols.txt`/ROM writes anywhere in the tool.

## 3. Internal clone census — 6 new families, boolean-only signal

60 sampled, 2 `sig_new` failures (see §5), 58 censused:

| Outcome | Count |
|---|---|
| `applied_noop` (self-match only, no clone) | 50 |
| `multiple` (a masked-identical clone exists somewhere in EUR) | 6 |
| `not_found` (dsd couldn't self-match — see §5) | 2 |

All **6/6** `multiple` hits were absent from all three heuristic catalogue
docs — a clean 6/60 (10%) new-family discovery rate on this sample:

| Function | Module | Size |
|---|---|---|
| `func_ov010_021b3998` | ov010 | 0x28 |
| `func_ov002_02252438` | ov002 | 0x6c |
| `func_ov015_021b34a4` | ov015 | 0x28 |
| `Ov015_RegisterCallbacks` | ov015 | 0x20 |
| `func_0208cd18` | main | 0x24 |
| `func_ov002_0229126c` | ov002 | 0x38 |

One pair cross-validates itself nicely: `func_ov010_021b3998` and
`func_ov015_021b34a4` were **independently drawn as two separate samples**
and each flagged the other's family as "new" — and `func_ov010_021b3998.c`
already carries a source comment ("identical body to
`func_ov015_021b34a4`") from earlier work confirming the same fact by hand.
That the census reproduces a fact we'd already hand-discovered once is a
good sanity check on the method; the other 4 hits are genuinely
undocumented pairs/groups.

**The catch, and why this is boolean-only**: `sig apply`'s match must be
unique to say anything. It turns out a lot of *this campaign's own*
existing "sibling family" clusters (VRAM-family-style: same body, only a
call target or pool constant differs) are byte-identical once bl-targets
and pool constants are masked — so the internal census can say "EUR has at
least one more copy of this shape somewhere" but never *where*. Confirmed
by deliberately probing a known 8-member VRAM-family exemplar
(`func_0208f850`, brief 560/562): it reports `multiple`, never the 7
sibling addresses. To find *where*, you still need the existing
grep/cluster tooling — the census can only tell you a family is worth
looking for.

## 4. Region-twin map + cross-validation — 0/44 disagreement (after a real bug fix)

| Outcome (USA, JPN identical) | Count |
|---|---|
| `applied_rename` (exact twin address resolved) | 49 |
| `multiple` (ambiguous — same masked-identical family as §3) | 6 |
| `not_found` | 2 |
| `applied_noop` (already correctly named in the target region) | 1 |

### The cross-validation bug

The first full run (before the fix below) reported **0 agree, 44 disagree,
2 no-prediction** for both regions — which looked like the byte-signature
method was unreliable. It wasn't; the comparison code was reading the
wrong field. `port_to_region.py --json`'s `main_func_resolution` dict has:

- `addr` — the **EUR source** address (identical for every target region,
  since it describes the input, not the resolution)
- `target_name` — the resolved **target-region** symbol name, which for an
  address-based name (`func_0208904c`, `func_ov002_0226af64`) embeds the
  actual target address as its trailing 8-hex-digit suffix

`tools/sig_census.py` was comparing the sig-based twin address against
`predicted.get("addr")` — always the EUR source address, region-invariant,
structurally guaranteed to disagree with a real USA/JPN twin address.
Concretely, for `func_ov002_0226b054`: `addr` = `"0x0226b054"` (== the EUR
source, useless), `target_name` = `"func_ov002_0226af64"` — and
`0x0226af64` is exactly the twin address the sig-based method had already
found independently.

Fixed by adding `resolved_addr_from_target_name()`, which extracts the
address from `target_name`'s hex suffix (same `_[0-9a-fA-F]{8}$` regex
convention `tools/objdiff_resolve_relocs.py` already uses for the
analogous problem) instead of reading `addr`. Comparison is now
integer-vs-integer (not string `.lower()` equality), so it's immune to
leading-zero formatting differences between the two tools' address
strings. When `target_name` isn't address-shaped (a function already
human-renamed in the target region, so there's no address to extract), the
comparison is correctly skipped rather than counted as a false
disagreement — `tests/test_sig_census.py::TestResolvedAddrFromTargetName`
pins exactly this "friendly name -> None, not a mismatch" behavior.

After the fix, re-running the identical 60-sample census (same `--seed 1`):

| Region | Agree | Disagree | No prediction |
|---|---|---|---|
| USA | **44** | **0** | 5 |
| JPN | **44** | **0** | 5 |

**0/44 disagreement** — every case where both `sig_apply_dry` and
`port_to_region.py` produced a comparable address, they matched exactly.
That's the empirical false-positive-rate answer the brief asked for: on
this sample, byte-signature-based twin resolution and reloc-signature-based
twin resolution never once disagreed.

### The 5 "no prediction" cases are the interesting part

None of the 5 no-prediction cases per region are a sig_census failure —
all 5 are `port_to_region.py` refusing to run at all, for two distinct,
already-partially-known reasons:

- **2 cases** (`Rand_Next`, `Ov008_Rand`) — both already human-renamed
  (friendly filenames, not `func_<addr>.c`). `port_to_region.py` derives
  the EUR source address **from the filename itself** and hard-refuses
  any name it doesn't recognize: `error: filename doesn't match any
  accepted pattern (func_<addr>, func_ov<NNN>_<addr>, main_<addr>,
  ov<NNN>_<addr>): Rand_Next.c`. This is the exact, previously-only-
  suspected limitation this brief's own docstring cited as the reason
  region-twin mapping is worth having ("bypasses port_to_region.py's
  known EUR-rename mis-port") — now confirmed with two concrete cases
  instead of a hypothesis. `sig_census` resolved both twins fine
  (`0x020224b8`, `0x021aa42c`) purely from the compiled byte signature,
  filename-independent.
- **3 cases** (`func_ov004_021dc19c`, `func_ov004_021dbfa8`,
  `func_ov004_021dbe78`) — all `.thumb.c` files. `port_to_region.py`
  refuses these too, for a **different, previously-unknown** reason: see
  §5, a confirmed bug (now flagged, not fixed here — out of scope for
  this tool).

## 5. Bugs found along the way (one fixed in-scope, two flagged out-of-scope)

Chasing the sig_new failure count down (7/60 on the first run) surfaced
three real, concrete bugs sharing one root cause — a filename-routing
suffix missing from a suffix-stripping allowlist — in three different
files:

1. **`tools/sig_census.py`'s own `unit_symbol_name()` — FIXED here.**
   `.thumb.c` is an established filename-routing suffix in this codebase
   (`tools/configure.py`'s `THUMB_C_SUFFIX`, same family as
   `.legacy.c`/`.legacy_sp3.c` — routes to the Thumb mwcc rule), but the
   real function *symbol* never carries it (confirmed via
   `config/eur/arm9/overlays/ov004/symbols.txt:255`:
   `func_ov004_021dc19c kind:function(thumb,...)` — no `.thumb` in the
   name). `_LEGACY_SUFFIXES` only listed `.legacy_sp3`/`.legacy`, so 5 of
   ov004's Thumb functions got the literal string
   `"func_ov004_021dc19c.thumb"` handed to `sig new -f`, which
   (correctly) reported `No function found with name
   'func_ov004_021dc19c.thumb'`. Renamed to `_ROUTING_SUFFIXES` and added
   `.thumb`; `tests/test_sig_census.py::TestUnitSymbolName::
   test_thumb_infix_stripped` pins it. This dropped sig_new failures from
   7 to 2 (see below) and raised resolvable region-twin candidates from 46
   to 49 per region.
2. **`.claude/hooks/post_edit.py` / `.codex/hooks/post_edit.py` (brief
   566) — flagged, not fixed here.** The identical `_LEGACY_SUFFIXES`
   gap exists in brief 566's own in-loop compile+objdiff feedback hook's
   `_unit_and_symbol()` — editing a `.thumb.c` file would derive the wrong
   objdiff symbol and silently break the match% half of that hook's
   feedback for ov004's Thumb-routed files specifically. Brief 566's own
   live-test matrix never exercised a `.thumb.c` file. Spawned as its own
   task rather than touched here, since that PR (#1137) is already
   drafted/reported and this needs its own live-test pass, not a drive-by
   edit riding on this branch.
3. **`tools/port_to_region.py` — flagged, not fixed here.** The
   *production* porting tool has the same gap in **two separate** inline
   `.legacy`/`.legacy_sp3` stripping blocks (no shared constant there at
   all, unlike the two hook copies) — confirmed by direct reproduction:
   `python tools/port_to_region.py --target usa --confidence-floor LOW
   --dry-run --json src/overlay004/func_ov004_021dc19c.thumb.c` exits 1
   with the "doesn't match any accepted pattern" error. This means
   port_to_region.py currently **cannot port any Thumb-routed EUR function
   at all** — not a rare edge case, since ov004 is Thumb-heavy. This is
   the more consequential of the two follow-ups (production tool, not a
   hook) — spawned as its own task since it touches heavily-used porting
   code that deserves its own verification pass against
   `tests/test_port_to_region.py` and a real dry-run, not a change bundled
   into a read-only-measurement-prototype PR.

The remaining 2 sig_new failures are genuine, non-tool-bug cases, left as
observed:

- `Task_PostLocked` — `dsd sig new` itself errors: `multiple symbols at
  0x02104f1c: data_02104f1c, data_02104f1c_alias` — a real dsd-internal
  aliased-symbol relocation ambiguity, not a sig_census defect.
- `ov002_0220c8b0` — the on-disk filename (`src/overlay002/
  ov002_0220c8b0.c`, missing the `func_` prefix) doesn't match its own
  `symbols.txt` entry (`func_ov002_0220c8b0`) — a pre-existing filename/
  symbol drift already in the tree, unrelated to this tool. Not spawned
  as a follow-up: single file, cosmetic, no functional impact (the build
  keys off the file path, not the symbol-shaped name).

And a third, separate dsd-level oddity worth recording rather than chasing
further: 2 of the 5 recovered `.thumb.c` functions (`func_ov004_021dc238`,
`func_ov004_021dc350`) now reach `sig apply --dry` successfully but report
`not_found` **against their own home region** — reproduced with a clean
manual `sig new` + `sig apply --dry` round-trip (dsd's own debug log shows
`Inline table found at 0x20b2de0/0x20b3db0` for one of them, i.e. a
jump/branch table embedded directly in the function body). This suggests
dsd's reloc-masking doesn't fully account for inline-table entries inside
a Thumb function's own byte range, distinct from the already-documented
"ambiguous siblings" limitation. Not investigated further — would require
patching dsd's Rust source, out of scope for a measurement prototype.

## 6. Go/no-go recommendation

**Go — region-twin mapping, for the specific gap it closes.** 0/44
disagreement against `port_to_region.py` on functions both tools can
resolve, and it demonstrably resolves 2 concrete cases (`Rand_Next`,
`Ov008_Rand`) that `port_to_region.py` structurally refuses due to its
filename-based address derivation. The highest-value use isn't replacing
`port_to_region.py` wholesale — it's a **fallback for exactly the
already-known "EUR-renamed callee" mis-port class** (see
`brief-560-vram-family-cmatch.md`'s "recover via pre-rename-address stub
probe" gotcha): when a source file has already been human-renamed and
`port_to_region.py` refuses outright, `sig_census`'s single-function
`sig_new` → `sig_apply_dry` pair (not the full batch tool) can resolve the
twin address directly from the compiled byte signature. Caveat: this only
works cleanly for "family-of-1" functions — see below.

**No-go, as-is — the internal clone census, and any family with 2+
masked-identical members.** The boolean-only signal (can't name the
sibling, only confirm one exists) means it can flag "6 new families worth
a human/grep look" but can't itself replace `cluster_c_pattern3_gen.py` or
the existing worklist-building tooling — and critically, once a family has
2+ masked-identical members, region-twin mapping **degrades to the same
ambiguity** (6/60 `multiple` here too), so it doesn't help port the exact
cases where porting is hardest to get right by hand. Wiring the internal
census into the C-match lane as a lightweight "is this new" pre-filter
(before spending agent time on a candidate) is plausible future work, but
would need the clone-family's actual members from elsewhere (existing
grep/cluster tooling) to be actionable — the census alone only says "look
here," never "here's what to write."

**Before wiring anything further in**: the two flagged `.thumb.c` bugs
(post_edit.py's hook, and especially port_to_region.py's outright refusal
to port any Thumb function) are worth fixing on their own regardless of
this brief's outcome — they're real gaps independent of sig_census.

## Verification

```text
$ python -m ruff check tools/sig_census.py tests/test_sig_census.py
All checks passed!

$ python -m pytest -q tests/test_sig_census.py
34 passed in 0.11s

$ python -m pytest -q tests
11 failed, 2542 passed, 4 skipped, 13 subtests passed

$ python -m pytest -q tests --ignore=tests/test_sig_census.py   # baseline check
11 failed, 2508 passed, 4 skipped, 13 subtests passed
```

Identical 11 pre-existing Windows-env failures with or without this
branch's additions (confirmed byte-for-byte identical failing-test list
both ways) — 0 added, +34 new passing tests. Note the specific failing-file
set has drifted since brief 566's report (`test_generate_research_index.py`
→ `test_generate_tool_index.py` now fails instead) — confirmed pre-existing
and unrelated to this branch (identical either way), not investigated
further as it's outside this brief's scope.

Read-only gate: `git status --short` shows only 3 new, untracked files for
this whole brief (`tools/sig_census.py`, `tests/test_sig_census.py`,
`docs/research/sig-census-results.json`) — no `config/`, `symbols.txt`,
`delinks.txt`, or ROM ever touched, matching the brief's explicit
guardrail. Every `sig apply` invocation across both census runs passed
`--dry`.

Raw per-function results: [`sig-census-results.json`](sig-census-results.json)
(60 samples, `--cross-validate`, seed 1 — the numbers in this report).
