# cm-data-inference-15 — data wave 15

2026-07-30. First wave scoped explicitly as "the wider, project-wide
unassessed pool" now that `src/overlay004/data/` is fully closed out
(waves 13-14). Result: **zero fresh candidates, zero shipped.** This is a
real, individually-verified finding, not a repeat of wave 12's mistake —
see "Why this is different from wave 12" below.

## Where this wave's count came from

Recursive census, the same pattern every wave has used, run against the
**entire** `src/` tree (not scoped to `main`/`overlay*` only, to also
cover `src/usa`/`src/jpn`):

```
grep -rlE "^(static )?(const )?unsigned char data_[0-9a-zA-Z_]+\[[0-9]+\] = \{" --include="*.c" src/
```

**36 total matches**, not the 32 estimated when this wave was filed:

- 11 in `src/overlay004/data/` — already known, individually, to be
  settled by wave 13/14 (9 CORRECTLY OPAQUE, 1 WEAK, 1 kept-as-is).
  Excluded without re-investigation.
- 25 elsewhere (17 in `src/main/`, 3 in `src/overlay011/`, 2 in
  `src/overlay006/`, 1 each in `src/overlay002/`, `src/overlay005/`,
  `src/overlay010/`). Zero in `src/usa`/`src/jpn`.

## Reconciling the 25: all already assessed, zero fresh

Every one of the 25 already had at least one hit in `docs/research/`
before any investigation started — itself a strong signal, but exactly
the kind of signal wave 13 taught this campaign not to trust at face
value (a mention isn't a verdict). Each of the 25 was individually
reconciled against the full research history: every `cm-data-inference-N`
wave doc (2 through 14) read in full, current file content compared
against every claimed verdict, and `git log --follow` run on each file to
independently confirm whether the campaign had ever actually touched it.

**Result: all 25 have a real, traceable, individually-confirmed verdict**
— 15 WEAK/declined, 6 CORRECTLY OPAQUE (real structure recovered, but the
existing `unsigned char` type is already the byte-accurate representation
— e.g. `data_020c3654`/`data_020c36d4` are exact `tolower()`/`toupper()`
tables, `data_020be6c4`/`data_020c32f8` are genuine 1-byte-stride lookup
tables), 1 CONTRADICTION (a pointer block sits mid-array with no clean
boundary), 2 already shipped as real retypes under a different filename
in the same TU (the census only re-matched them because an unretyped
sibling shares the file) or in a directory not part of this batch.
`git log --follow` corroborates every verdict independently: 21 of the 25
files have **never once been touched by a `cm-data-inference-N` commit** —
their only commit is the pre-campaign mechanical carve — which is exactly
what "correctly declined, never shipped" predicts. No discrepancy found
between any doc's claim and current file reality across all 25.

One symbol (`data_ov006_021cb4f8`) has a citation gap worth flagging: wave
6 states it was "carried from before... re-confirmed, not re-litigated,"
but no prior wave (1 through 5) actually mentions it. Treated as assessed
(wave 6's own text is an explicit, named verdict, not an incidental
mention) but the provenance of "carried from before" is untraced.

## The one lead with an explicit reopening condition: re-checked, still closed

`data_02101e64` (`src/main/`, 24 B) is the sole symbol in the 25 whose own
prior verdict named a specific condition for revisiting it. Wave 5 found
an 11-field fixed-offset struct, STRONG on element evidence (11 accesses
tiling all 24 bytes, zero gaps) but declined for lacking this campaign's
bulk-copy/function-pointer corroboration bar. Wave 6 re-checked fresh,
found the same result, and wrote: "treat as settled unless a genuinely
new access pattern surfaces (e.g. a not-yet-shipped sibling function)."

Re-checked fresh against the current tree (many waves and many merged
lanes later): traced the full call graph by hand through every
intermediate hop (`func_0206bb68` → `func_0206c46c` → `func_0206c380` →
`func_0206c2f4`/`func_0206c1b4` → `func_0206c2c0`/`func_0206c110`),
independently re-deriving the identical 11-field layout. Checked every
file's match status and commit date: **nothing in this chain has changed
since wave 5/6** — the one matched C file in the chain predates wave 5,
every `.s` file is tagged a permanent brief-294 reg-alloc wall (not a
pending match), and no region port has touched any of it. No bulk copy,
no function-pointer field, anywhere. **Confirmed still declined — a third
independent wave reaching the same conclusion.**

A concrete side lead surfaced in the process, not acted on this wave:
`data_02101e7c`, an immediately-adjacent 24-byte sibling flagged by wave 5
but never carved into its own `.c` file (still an uncarved `delinks.txt`
gap). Its sole consumer funnels through the exact same wall of permanently
un-matchable `.s` functions, so carving it would corroborate the *shape*
of `data_02101e64`'s finding but supply no new bulk-copy/function-pointer
evidence — a real but low-value lead for a future wave.

## Why this is different from wave 12's wrong "exhausted" claim

Wave 12 declared the campaign exhausted using a **flat, one-level glob**
(`src/main/*.c src/overlay*/*.c`) that silently never reached nested
`src/overlayNNN/data/*.c` subdirectories — the census itself was wrong,
not just the population it found. This wave's census used a fully
recursive `src/` walk (confirmed by construction, not asserted), and
every one of its 36 hits was individually reconciled against primary
sources (wave docs plus `git log --follow`, not just a doc search) rather
than assumed settled because a flat census used to think so. The
reopening-eligible lead was re-investigated fresh rather than taken on
the old docs' word. This is the same rigor wave 13/14 applied to correct
wave 12, applied here proactively instead of after the fact.

## What this does and doesn't mean

**Does mean**: no `unsigned char data_X[N] = {...}` array anywhere in
`src/` (any region) currently lacks a real, individually-verified verdict
from this campaign. The flat-array discovery method that has driven every
wave since wave 2 is now genuinely, verifiably exhausted project-wide.

**Does not mean**: every opaque blob in this codebase has been found.
This campaign's method has only ever looked for one specific syntactic
shape (`unsigned char[N]`). It has never looked at:
- Data still living purely as raw `.s` (never carved into a `.c` file at
  all) — a genuinely different, unexplored category from everything this
  campaign has worked on so far.
- Arrays already typed as something other than `unsigned char` (e.g.
  `signed char[N]`) that might still be under-evidenced.
- The `data_02101e7c` uncarved gap noted above.

No wave 16 filed. Per this campaign's own precedent (wave 12, explicitly
praised for not manufacturing work against an empty census), a genuinely
exhausted discovery method is a real stopping point, not a signal to
force a result. The next session should pick a new discovery angle from
the list above (or a different queue lane entirely) rather than re-run
this same census.

## Gate

No source files changed this wave (zero retypes, one declined-again
revisit). `python tools/gate3.py --scope all` run for hygiene/regression
confirmation despite no code change — see queue result block.
