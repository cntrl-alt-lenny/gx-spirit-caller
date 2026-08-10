# cm-restock-carve-6 — the size-ordering wall goes into the taxonomy, and the misaligned-struct arc closes (2026-08-09)

Sixth wave of the restock-census carve series. Two threads: formally
characterize wave 5's newly-discovered mwcc size-ordering wall to the
project's `C-NN`/`P-NN` taxonomy standard, and finish draining both the
composable pool and the main restock census.

## Thread 1 — P-50

Wrote up wave 5's size-ordering discovery as
[`codegen-walls.md`'s P-50](../codegen-walls.md#p-48-composed-tu-declaration-order-collapses-to-ascending-byte-size-whenever-two-top-level-data-globals-differ-in-size--a-data-layout-wall-not-a-codegen-one-permanent-evidence-chain-below),
explicitly flagged as a different domain (data layout, not function
codegen) filed under the shared registry anyway since that's where a
future wave will look for it. Classified **PERMANENT**, with the
evidence chain the brief's own warning demanded (brief 640: 0 of 5
sampled prior wall citations matched their entry's own criteria):

1. Six independent isolated scratch compiles (struct+scalar in both
   declaration orders, two-differently-sized-structs, two-scalars
   ascending, two-scalars descending) all reproduce the ascending-size
   sort with zero exceptions — declaration order never mattered, only
   relative size did.
2. Two real in-project candidates (`data_ov011_021d3034`+`_305f`,
   `data_ov011_021d323c`+`_32ba`) independently reproduce it a third
   and fourth time with real byte content.
3. **The one plausible alternative fix — merge the two symbols into
   one, so there's nothing left to reorder — was tested directly, not
   assumed, and fails with a hard `mwldarm` link error**
   (`Undefined : "data_ov011_021d305f", Referenced from
   "func_ov011_021caafc"`), because the absorbed symbol is referenced
   by name from other already-shipped code. This generalizes: any real
   composable candidate is, by the recipe's own "not an artificial
   pairing" requirement, referenced from somewhere else in the tree —
   so this isn't a one-off obstacle, it's structural to the whole
   candidate class.

`alignment-wall-tu-composition-recipe.md` cross-references P-50 and
restates the combined standing rule: compile every composed TU
standalone and inspect the `.o` before trusting it; same-size n=2 is
the only shape safe by default.

## Thread 2a — the composable pool, actually finished this time

Wave 5 left one open, untested lead: `data_ov011_021d3583`/`_358b`
(8B/9B), whose only viable absorption fix needs a 3-symbol bundle with
the previously-uninvestigated `data_ov011_021d33bc` (455B). Address-
ascending sizes are 455/8/9 — non-monotonic, so P-50 predicted decline.
Tested rather than assumed: `data_ov011_021d33bc` got a full
investigation (its sole hard-evidenced field is 4 of its 455 bytes, via
the already-shipped `func_ov011_021cefb4.c`; a real, well-corroborated
`0x72`-stride row-table structural lead was found and documented for a
future full-table reconciliation, but not implemented — 455÷114 isn't
whole, so a clean record-array shape is mathematically impossible for
this exact byte range regardless of evidence quality). The compiled
`.o` landed as `[8, 9, 455]` in-section order — the P-50 prediction,
confirmed empirically. No interior 4-aligned split point exists in this
gap (both `021d3583`/`021d358b` are `%4==3`), so the usual n>2 fix
(split into n=2 sub-TUs) doesn't apply either — **declined, irreducible**.
Full derivation preserved in the census disposition table and this doc
for any future patcher-level attempt.

**A second look at the `ov011` gap surrounding the already-declined
`data_ov011_021d323c`/`_32ba` pair caught a real gap in the prior
framing**: re-deriving the region directly from `symbols.txt` (not
trusting the wave-5 candidate list) found 2 real symbols that had been
silently dropped — `data_ov011_021d32d8` (1B) and `data_ov011_021d3374`
(2B) — splitting what looked like one 5-symbol, 341-byte gap into
**three** genuinely separate both-ends-4-aligned cells:

- Cell 1 (`021d323c`+`_32ba`, sizes 126→30): already declined, P-50.
- Cell 2 (`021d32d8`+`_32d9`+`_334a`, sizes 1→113→42): non-monotonic
  (113→42 descends) — blocked by the identical P-50 mechanism, and an
  n=3 group besides. `data_ov011_021d32d9`'s own start is never
  4-aligned, so it has no smaller anchor either. **New candidates
  investigated to full evidentiary standard regardless** (all 3 are
  part of a documented `0x72`-stride per-actor row table, the highest-
  reader-count symbol in the whole gap has 8 confirmed consumers) —
  real research value even though no carve exists this wave.
- **Cell 3 (`021d3374`+`_3376`, sizes 2→30, STRICTLY ASCENDING) — a
  genuinely new, P-50-safe composable pair the original census
  extraction never surfaced.** Investigated, byte-verified, compiled
  standalone (order preserved, section size correct), and shipped.

## Thread 2b — main-pool sweep, `ov000`

A fresh full-census sweep (all 4 shape sections, all modules except
`main`/`ov006`) found `ov000` has 7 candidates, all independently
4-aligned — no composition needed, the "standard method" this wave's
kickoff asked for. **All 7 turned out to be mislabeled**: the census's
`jump_table`/`fnptr_table` shape classifier called them code-address
tables, but direct verification (every non-zero word checked against
`symbols.txt` for a `kind:function` match, and against `.text`'s own
address range) shows all 19 distinct target addresses are `kind:data`
pointers into `ov000`'s own (100% uncarved) `.data` segment — the exact
mislabeling pattern wave 5 first caught on a single `ov011` candidate,
here recurring 7 times in one module. Two real consumption shapes were
traced and disassembled directly (an indexed template-pointer lookup
feeding the project's confirmed `func_02006c0c(template, 4, 0)` task-
creation convention; and a block-forwarded-by-pointer shape feeding
`func_0201ef90`'s 4 independent optional-feature gates) — a NitroSDK
no-op (`func_0201e7e0`, already-matched `FX_Init`) sits textually
between the copy and the real consumer in 4 of the 7 sites, a red
herring worth flagging for any future wave scanning this address range.

### Gate (verbatim)

```
[eur] SHA1 PASS
[usa] SHA1 PASS
[jpn] SHA1 PASS
```

### Typed-array / Named-struct, before → after

See the PR body for the exact before/after numbers (measured via
`tools/progress.py`'s real classifier, `git stash`-isolated, then
independently re-verified by calling the classifier functions directly
on each new file).

### Per-symbol reconciliation

See the PR body for the full table — every span checked directly
against its module's current `delinks.txt`.
