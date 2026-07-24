[//]: # (markdownlint-disable MD013 MD041)

# mwcc struct-array initializer bracing (cm-data-canary result)

Established by `cm-data-canary` (r10 bet 2): retyped `data_020b5b80`
(CharParam, 96×7 `signed char`) and `data_020b5e20` (PresentCard, 71×[3][10]
`short`) from opaque `const unsigned char[N]` blobs into real struct arrays,
sourced from the byte-verified BSC `.inc` oracle
(`extract/<region>/files/BSC/CharParam.inc` / `PresentCard.inc`,
`mkEventChrPrm.pl` / `mkPresentCard.pl`, 12/2/2006). **Both retypes are
byte-identical** (`ninja sha1` PASS, all 3 regions) — mwcc 2.0/sp1p5's
struct-array codegen matches for both a flat scalar-member struct and a
struct wrapping a multi-dimensional array member. This unlocks the wider
501KB / 245-blob data-retype campaign the r10 report scoped behind this
canary.

## The gotcha: mwcc requires a full explicit brace per nesting level

CharParam's struct is 7 independent `signed char` scalar members. A
partial initializer for a sentinel row —

```c
typedef struct { signed char field0, field1, field2, field3, field4, field5, field6; } CharParam;
const CharParam data_020b5b80[96] = {
    { -1 },   /* field0=-1, field1..field6 implicit-zero — compiles fine */
    ...
```

— compiles as expected: standard C partial-struct-initializer zero-fill,
no surprises.

PresentCard's struct has **one** member, a 2D array (`short tiers[3][10]`).
Standard C allows eliding the struct's own brace when a member's own
sub-initializer is unambiguous (recursive brace elision, C11 §6.7.9p17–21).
mwcc's parser does **not** implement that specific elision — it requires
one explicit brace level per level of nesting, with no shortcuts, even
though the struct has only one member:

```c
typedef struct { short tiers[3][10]; } PresentCardEntry;

/* FAILS: "too many initializers" then a cascading "declaration syntax
 * error" on the next line — even with every value spelled out (not an
 * elision-of-values issue, an elision-of-BRACES issue): */
const PresentCardEntry data_020b5e20[71] = {
    { { -1,0,0,0,0,0,0,0,0,0 }, { 0,...,0 }, { 0,...,0 } },
    ...

/* WORKS: one more explicit brace layer — array-of-71 > per-entry-struct >
 * tiers-member > per-row: */
const PresentCardEntry data_020b5e20[71] = {
    { { { -1,0,0,0,0,0,0,0,0,0 }, { 0,...,0 }, { 0,...,0 } } },
    ...
```

Isolated with a 2-entry minimal repro compiled directly via mwccarm
(bypassing ninja) before touching the real 71-entry file — confirmed the
extra brace layer, and only that, is what changes the outcome.

**Rule of thumb for the future data campaign**: count brace levels by
hand for any struct whose sole (or otherwise-single-remaining) member is
itself an array — mwcc wants a brace for the struct token even when
C's own elision rules would let you skip it. Structs with multiple named
scalar members (no unwrapped array-of-array member) don't hit this; a
bare `{ -1 }`-style partial initializer works there as normal.

## Sentinel-row convention (both tables)

Both `.inc` oracles use a `{ -1, }` row as a "this slot is empty" marker.
Verified against raw shipping bytes (both `data_020b5b80.c` and
`data_020b5e20.c`, 2+ sentinel rows each): the sentinel expands to
**first element = -1, every other element in the record = 0** — i.e. the
`.inc` generator itself relied on C's own partial-initializer zero-fill
when it was authored, decades before this project. A flat byte-array
concat that only emits the literal `-1` (1 byte) for a sentinel instead
of the record's full width desyncs every following row's offset — this
was the queue item's flagged "LOAD-BEARING" risk, and is why every
sentinel row in both shipped files is spelled out in full rather than
re-relying on any elision (belt-and-suspenders, given the brace gotcha
above already burned one elision assumption).

Distinct from the sentinel is the **in-row filler value**: PresentCard
rows that aren't sentinels still use literal `-1` (0xFFFF as `short`) to
mark individual unused card-ID slots within an otherwise-real row (e.g.
row 8: first 10-slot tier is all `-1`, tiers 2–3 have real IDs). That's
the `.inc` author's own "no card" convention, not related to C
zero-fill — don't confuse the two when reading either table.

## Symbol/type naming

The actual linked data symbols (`data_020b5b80`, `data_020b5e20`) are
unchanged — only their C-level type changed, from opaque byte arrays to
`CharParam[96]` / `PresentCardEntry[71]`. `CharParam`'s 7 fields are
named `field0..field6` (no reliable semantic names recovered — the
`.inc`'s own column header comment is Shift-JIS text that reads as
mangled replacement characters through this session's tooling; a
secondhand paraphrase from an earlier swarm report gives roughly
category/spirit/comrade/registration/recipe/card/item, unconfirmed).
`data_0201a0e0.c`'s pre-existing `Elem0201a0e0` struct (a different TU,
independent `extern` declaration, same 7-byte stride) already names the
offset-2 field `field2` — matched that naming for consistency. Two other
existing consumers (`func_0201a0e0.c`, `func_02019898.c`) declare their
own independent `extern` types against `data_020b5b80`; retyping the
defining TU doesn't require touching them; C doesn't check cross-TU
extern-declaration agreement, only the linker-visible symbol + the actual
byte layout, which is unchanged.
