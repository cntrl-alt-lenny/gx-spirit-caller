# q-itcm-feeder-fix: making ITCM visible to the C-match candidate feeder (2026-07-25)

Executes `docs/research/campaign-analytics/itcm-reachability.md`'s
(2026-07-22) already-diagnosed, already-proposed fix, which sat
unqueued after its investigation lane closed. Root cause re-verified
fresh against today's tree before touching anything (per this
project's own "verify against current state, don't trust a snapshot"
discipline) — confirmed still exactly as diagnosed.

## Root cause

`tools/wall_aware_headroom.py`'s module classifier was a single regex,
`_MODULE_RE = re.compile(r"^src/(main|overlay\d+)/[^/]+\.s$")`. The
`[^/]+` allows exactly ONE path segment after the module directory —
`src/main/func_X.s` matches, but `src/main/itcm/func_X.s` (an extra
`itcm/` segment) does not, so every ITCM `.s` file was silently
rejected before it could ever be classified, wall-scanned, or counted
as a candidate. The linker (`dsd`) and `progress.py`/`size_census.py`
already handled ITCM correctly (fixed by an earlier, separate brief)
— only this specific candidate-feeder regex was still hard-coded to
the two original module shapes.

## The two-layer fix (per the doc's own proposal)

**Layer 1 — path-part module classification.** Replaced the single
regex with `_classify_module()`, which walks `rel.split("/")` instead
of pattern-matching a fixed segment count: `src/main/*.s` → `"main"`,
`src/overlayNNN/*.s` → `"overlayNNN"`, `src/main/itcm/*.s` → `"itcm"`,
anything else (including `src/main/dtcm/*.s`, `src/usa|jpn/**`, or a
hypothetical deeper nesting) → not classified. This alone makes the 2
ITCM `.s` files that already exist and already have a real
`delinks.txt` TU claim (`func_01ff8400.s`, `func_01ff86fc.s`) visible
to the scan for the first time.

**Layer 2 — union with `size_census.py`'s unmatched rows.** The other
10 EUR ITCM functions have NO source file at all — they sit in dsd's
anonymous gap object, invisible to a file-level `.s` scan by
construction (it can only iterate files that already exist). Added
`_itcm_symbol_only_gap_metadata()`, which reuses
`size_census.parse_functions()` / `parse_claimed_text()` /
`unmatched()` directly against `config/eur/arm9/itcm/{symbols,delinks}.txt`,
and for each truly-unmatched function (no delinks claim AND no on-disk
`.s`), emits the canonical `src/main/itcm/func_<addr>.s` path a future
carve would write to — "the normal address-based scaffold target
rather than pretending a source file exists," per the item's own
phrasing. Both layers flow through the exact same
filter/classify/bucket pipeline inside `scan()` (refactored into a
shared `_consider()` closure) so `--min-size`/`--max-size`/
`--min-addr`/`--max-addr`/`--exclude-attempted` all apply identically
to both file-based and symbol-only-gap candidates.

DTCM is deliberately excluded from both layers — confirmed data-only
in every region again today (`grep -c "kind:function"
config/eur/arm9/dtcm/symbols.txt` → 0), matching the doc's own explicit
"should not be added to a function C-match queue merely because it's
another ARM9 autoload" instruction.

## Verified counts (re-derived fresh, not trusted from the stale doc)

The 2026-07-22 doc's own "10 unmatched, 2 with existing `.s` files"
breakdown has since shifted: some other session scaffolded
`func_01ff8400.s`/`func_01ff86fc.s` into real, delinks-claimed `.s`
files between then and now (they're `.s`, not yet `.c` — still
un-C-matched, just no longer "gap-only"). Re-verified against today's
actual `config/eur/arm9/itcm/symbols.txt` + `delinks.txt`:

- 14 total ITCM functions (EUR).
- 4 already claimed by a delinks.txt TU: 2 already `.c`
  (`func_01ff86c4.legacy.c`, `func_01ff8770.legacy.c` — matched,
  correctly invisible to a *candidate* scan) + 2 still `.s`
  (`func_01ff8400.s`, `func_01ff86fc.s` — layer 1's contribution).
- 10 genuinely unmatched (no delinks claim, no source file at all —
  layer 2's contribution, confirmed via direct `size_census.unmatched()`
  call: `func_01ff8000/8098/8180/81d8/8334/8414/8544/8624/8664/87c0`).
- **Total EUR ITCM candidates: 12** (2 + 10), not the "~10" estimate
  in the item's own text (inherited from the stale doc snapshot before
  the 2 `.s` files existed) — reported as the freshly-measured real
  number rather than forced to match the estimate.

Before/after, run against the real tree (old code copied to an
isolated temp dir so both versions could run side by side without
touching this branch's own working state):

| | modules found | total candidates | itcm present |
|---|---:|---:|:---:|
| **Before** | 25 | 5888 | No |
| **After** | 26 | 5900 | Yes, 12 |

+12 candidates, +1 module, and the delta (5900−5888=12) exactly equals
ITCM's own contribution — confirms nothing else moved.

USA/JPN (14 unmatched functions each per `size_census.py --module
itcm`, matching the item's own text) are a SEPARATE tool
(`size_census.py`, already itcm-aware) and out of scope for
`wall_aware_headroom.py`, which is EUR-baseline-only by its own
existing module docstring — unchanged by this item.

## Verification

- `python -m pytest -q tests` — 2923 passed (was 2911 on this branch's
  baseline, +12 new), no failures.
- 2 named regression tests, per the item's own explicit ask: the real
  `src/main/itcm/func_01ff8400.s` shape (`test_real_itcm_file_becomes_a_candidate`)
  and a symbol-only gap with no source file at all
  (`test_symbol_only_gap_becomes_a_scaffold_target_candidate`), plus a
  no-double-counting check and the doc's own "assert dtcm contributes
  zero function rows" instruction
  (`test_dtcm_contributes_zero_function_rows`). All in
  `tests/test_wall_aware_headroom.py`'s new `ScanItcm` class, against a
  synthetic temp tree (ROOT monkeypatched), same convention as every
  other `scan()`-level test in that file.
- `python tools/wall_aware_headroom.py --json` before/after counts
  above, both captured from the real committed tree.

## Explicitly deferred (per the item's own scope)

Matching the newly-visible 12 candidates against readable C is a
SEPARATE follow-up — this item only makes them reachable to the
carve/decomp lane, per its own final line: "Matching them is a
SEPARATE follow-up — this item only makes them reachable."
