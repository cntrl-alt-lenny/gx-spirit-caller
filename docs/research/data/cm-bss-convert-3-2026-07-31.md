# cm-bss-convert-3 — third `.bss` carve batch (2026-07-31)

Follow-up to [`cm-bss-convert-2-2026-07-31.md`](cm-bss-convert-2-2026-07-31.md).
This wave deliberately weighted candidate selection toward struct-typed
symbols, since `Named-struct` (1.09%) is much further behind `Typed-array`
(3.31%) than the raw pool composition would otherwise suggest.

## Result

**23 fresh symbols investigated. 16 CONVERT, 7 DECLINE. 3,460 bytes shipped.**

```
Typed-array:   158,304 -> 161,736 bytes  (+3,432 B,  3.31% -> 3.39%)
Named-struct:   52,040 ->  52,068 bytes  (+28 B,     1.09% -> 1.09%, +0.003pp)
```

Measured directly via `tools/progress.py` before/after (`git stash`/`git
stash pop` against this exact branch point). Both deltas match the
per-symbol hand-predicted totals exactly, byte for byte — unlike wave 2,
none of this wave's Named-struct typedefs contain an internal array field
(the source of that wave's 1,792-byte struct-internal-field leak, filed
separately as `q-typed-array-brace-nesting-fix` for the Codex lane), so
there was nothing for that classifier blind spot to catch this time.

## Batch composition

Deliberately front-loaded toward `Named-struct` candidates: 2 more members
of the established "DispatchState" cross-overlay pattern (found by reading
the commit that shipped the first four, not from a prescan), 4 more small
already-typed scalar/function-pointer candidates, and a much thinner
primitive-array tail than prior waves (waves 1-2 had already worked
through most of the large, cleanly-evidenced `char[]` pool). Decline rate
(7/23, 30%) sits between wave 1 (28%) and wave 2 (39%).

## Two DispatchState siblings diverged from the established pattern

Found via the actual commit (`30b5c3706`) that shipped the first four
DispatchState conversions' matched consumers, rather than a prescan —
`func_ov014_021b26ec.c` and `func_ov016_021b2824.c` were two more members
of the same 6-function family, each already declaring the exact
`Ov0NNDispatchState { int idx; int f4; }` shape.

- `data_ov016_021b9740` — **CONVERT**, exactly as expected. A superficial
  multi-typing conflict (other files' `char[]` externs against the same
  address) resolved cleanly on inspection: those externs describe memory
  *reached via* this symbol as a nearby pool-word base, not this symbol's
  own 8 bytes — confirmed by exact offset arithmetic (`+0x44`, `+0x8c`,
  `+0x1000` all resolve to other, already-separately-carvable symbols).
- `data_ov014_021b5040` — **DECLINE**, despite matching the pattern on its
  surface. Unlike all 5 already-shipped siblings, this one has 3 *real*
  additional consumers (1 matched C, 2 shipped byte-exact raw-`.s` — not
  draft speculation) that dereference offset `+0x44`, landing inside the
  neighboring symbol `data_ov014_021b5048`'s own declared range. The
  8-byte struct read is real but incomplete; carving it alone would
  enshrine a boundary the same wave's other evidence already contradicts.

This is the first case in the campaign where a symbol matching an
already-proven cross-overlay pattern was investigated fully independently
and genuinely declined — direct evidence the reconciliation discipline
isn't rubber-stamping pattern matches.

## Per-symbol results

### Shipped (16, 3,460 bytes)

| Symbol | Type | Bytes | Movement | Why |
|---|---|---:|---|---|
| `data_0219ef34` | `pair_0206e224_t data_0219ef34;` | 8 | Named-struct | 1 matched C consumer + 5 raw-`.s` consumers, all layout-consistent |
| `data_0219ed54` | `fn_0206e940_t data_0219ed54;` | 4 | Named-struct | Genuine function-pointer scalar; write + call sites both confirmed |
| `data_0219ed58` | `fn_0206e980_t data_0219ed58;` | 4 | Named-struct | Sibling write site to `data_0219ed54`, same registration routine |
| `data_0219ef0c` | `fn_02074720_t data_0219ef0c;` | 4 | Named-struct | 2 C + 16 raw-`.s` call sites; a literal function-address store (`func_02074458`) is unambiguous instruction-level proof |
| `data_ov016_021b9740` | `Ov016DispatchState data_ov016_021b9740;` | 8 | Named-struct | 6th confirmed instance of the cross-overlay dispatch-table-advance pattern |
| `data_ov004_02291d38` | `char[304]` | 304 | Typed-array | Flagged memset-overrun risk checked and cleared (5-symbol span sums exactly, zero slack) |
| `data_ov004_02291e68` | `char[304]` | 304 | Typed-array | Same arena, same clean result |
| `data_ov021_0222cf44` | `char[412]` | 412 | Typed-array | 4 consumers agree; last symbol in its cluster (pure end-peel) |
| `data_ov011_021d4674` | `char[396]` | 396 | Typed-array | Real record-array stride evidence (0x28) doesn't divide evenly into 396 — correctly left as `char[]` rather than an invented element count |
| `data_0218fd10` | `char[368]` | 368 | Typed-array | Stride-0xb8×2 evidence independently confirmed by both the matched C consumer and ground-truth `.s`; struct alternate flagged but not shipped (see below) |
| `data_021a071c` | `char[368]` | 368 | Typed-array | Strongest struct-shape evidence of the wave (5 independent ground-truth `.s` files, stride 0x5c×4); struct alternate flagged but not shipped (see below) |
| `data_ov010_021b98f0` | `char[252]` | 252 | Typed-array | Clean opaque, cross-region-verified |
| `data_ov010_021b92b8` | `char[252]` | 252 | Typed-array | Clean opaque, shares a generic ctor helper with a sibling |
| `data_ov021_021acec8` | `char[232]` | 232 | Typed-array | A `0x80000` argument initially looked like a size red flag; disproven by finding the identical constant used against an unrelated, already-converted 6,476-byte object elsewhere — a fixed recipe constant, not a size hint |
| `data_ov006_0225df3c` | `char[288]` | 288 | Typed-array | 15 real consumers agree (prescan's "7" was stale — 5 more shipped since); size confirmed a 3rd way via a matched `Fill32` call |
| `data_0219db74` | `char[256]` | 256 | Typed-array | Stride-8 address-of evidence exists but never dereferences fields — correctly treated as insufficient for a struct claim |

### Struct alternates flagged but not shipped

Two of the shipped `char[]` conversions above have unusually strong
struct-shape evidence that the investigating agents explicitly declined to
promote to the primary verdict, and I agreed with that judgment rather than
overriding it:

- `data_0218fd10` as `struct El02010f84[2]` (stride 0xb8) — confirmed via
  both the matched C consumer and independent raw-`.s` ground truth.
- `data_021a071c` as `slot_t[4]` (stride 0x5c) — confirmed via 5
  independent, mutually-consistent ground-truth `.s` files, the strongest
  substructure evidence in this wave.

In both cases the *stride* is solidly evidenced but the *exact field
types* are not — and unlike every Named-struct conversion this campaign
has shipped so far (all of which reused an already-defined typedef from a
matched consumer), neither struct name exists anywhere in already-matched
code. Shipping the conservative `char[]` form now and leaving these as
documented leads keeps the established precedent (never invent a struct
this campaign hasn't already evidenced field-by-field) intact.

### Declined (7)

| Symbol | Bytes | Why |
|---|---:|---|
| `data_02106810` | 300 | Risk-flagged bracket-less `unsigned short`. This time the flag was right: 5 independent consumers (including the matched C file) unanimously prove an 80-entry, 6-byte-stride table spanning 480 bytes, not 300 — spilling into 2 further sibling symbols |
| `data_ov014_021b5040` | 8 | See DispatchState section above — real evidence contradicts the pattern match |
| `data_ov017_021b8894` | 256 | 6 independent shipped `.s` consumers dereference offsets 206-247 bytes past the declared boundary, landing inside the neighboring symbol; corroborated by existing documentation and a cross-region boundary discrepancy |
| `data_021a08f4` | 256 | Ground-truth `0x540`-stride arithmetic proves this anchors a 3-row, 1,344-byte composite table spanning 2 other symbols (`data_021a09f4`, `data_021a0df4` — the latter already shipped in wave 2 as an independent piece of the same table) |
| `data_021a0e34` | 256 | Row 1 of the same confirmed table as `data_021a08f4` |
| `data_021a1374` | 256 | Row 2 of the same confirmed table |
| `data_ov016_021bb2c4` | 256 | Strongest decline of the wave: the exact same byte address is proven addressed both as `data_ov016_021bb2c4+0x1d8` and as `data_ov016_021bb3c4+0xd8` across 3 already-shipped, byte-exact `.s` files — direct proof the two symbols are one object dsd's boundary heuristic split in the wrong place |

Note on `data_021a08f4`/`_0e34`/`_1374`: these 3 symbols share the exact
same declared size (256B) as the 3 independent `char[1024]` siblings wave 1
shipped cleanly — the investigation was explicitly warned not to assume
the same outcome applies just because the shape rhymes, and it didn't:
this time the matching sizes turned out to mark 3 rows of one larger table,
not 3 independent objects. Both outcomes are real; only investigation
tells you which one you have.

## Process notes

- **A name-only grep is not sufficient for full reconciliation.** For 2
  of this wave's declines (`data_ov006_0225df3c`'s consumer-count
  correction and, decisively, `data_ov016_021bb2c4`), the most important
  evidence lived in functions that receive the target pointer as a
  register argument and never re-reference the symbol by name — reachable
  only by tracing one level into the call graph from a function that
  *does* mention the symbol. Worth carrying into future dispatch prompts
  explicitly, not just implied by "check consumer usage."
- **"Ship-as-.s" (finalized GLOBAL_ASM, byte-exact) files are ground
  truth, not drafts** — equivalent in trustworthiness to a matched `.c`
  file, unlike `docs/research/c-match-prep/` (open drafts, explicitly
  self-flagged unverified) or narrative research docs. Several declines
  this wave rest entirely on this tier of evidence.
- Prescan consumer counts were stale in 2 places this wave
  (`data_ov006_0225df3c`: prescan said 7, actual 15; `data_ov016_021bb2c4`:
  prescan said 1, actual 2) — both undercounts, consistent with the pool
  scan being taken before later matching waves shipped more consumers.
  Not acted on beyond noting it; the reconciliation procedure catches
  this by re-deriving the reference list directly rather than trusting
  the prescan's count.
- Wave-14 safeguards applied throughout; `git status --short` file count
  (46: 17 modified, 29 new, once this doc and the regenerated research
  index are folded in) checked and reconciled against `git diff --stat`
  before every claim in this doc and the queue result block.
- Filed [`q-typed-array-brace-nesting-fix`](../../queue/archive/codex-scaffolder.md)
  on the `codex-scaffolder` queue (PR #1406) for wave 2's struct-internal-field
  classifier finding, rather than fixing `progress.py` in this lane.

## Next steps

- `data_021040ac` (`GlobalAudioState`) is a large (>=0xC4C B / 3,148+
  bytes), still-raw, extensively pre-documented global spanning many
  already-matched consumer dossiers (offsets `+0x24`, `+0x34`, `+0x38`,
  `+0x3c`, `+0xb64`, `+0xb6c` all independently cited). The single
  largest architectural lead surfaced by this campaign — worth a
  dedicated wave to consolidate the scattered field evidence into one
  authoritative struct, not a slot in a mixed batch.
- `data_ov014_021b5040`+`data_ov014_021b5048` need joint reconciliation
  as one "scene lock/state" object.
- `data_ov017_021b8894`+`data_ov017_021b8994`,
  `data_ov016_021bb2c4`+`data_ov016_021bb3c4`, and the 3-row
  `data_021a08f4`/`_0e34`/`_1374` table (9 symbols total, spanning wave
  1/2/3 boundaries) are all confirmed multi-symbol merge candidates for
  a future combined pass.
- `data_0218fd10` and `data_021a071c`'s flagged struct alternates
  (stride 0xb8/0x5c respectively) are ready for a focused follow-up that
  nails down exact field types before authoring new struct names.
- `.bss` pool remaining after this wave: roughly 380 symbols with an
  existing extern reference (down from ~410 pre-wave), plus whatever a
  fresh pool re-derivation finds once this wave's carves remove more raw
  placeholders.
