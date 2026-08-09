# cm-restock-carve-5 — closing the declined 11, a new mwcc size-ordering wall, and the main-pool sweep (2026-08-09)

Fifth wave of the restock-census carve series. Three parts: close out
wave 4's 11 both-ends-screen failures with evidence, finish whatever
remains of the composable pool, and sweep the largest remaining module
group outside `main`/`ov006`.

## Part 2 — the composable pool was not actually exhausted

A fresh re-screen of the 35 misaligned struct candidates against
**current** `delinks.txt` confirmed exactly 11 remain uncarved, matching
wave 4's declined set 1:1 — the both-ends-*self-composition* pool (pairs
of adjacent *misaligned* symbols) is fully exhausted (24/35 shipped).

But re-examining each of the 11 directly against `symbols.txt` (not just
the census's misaligned-only filter) found four of them have a real,
already-4-aligned NEIGHBOR available for backward/forward absorption —
a composition class wave 4 never checked, because it only looked for
adjacent *misaligned* partners:

| Symbol | Neighbor found | Shape | Result |
|---|---|---|---|
| `data_ov000_021b55de` (6B) | `data_ov000_021b55dc` (2B, backward) | n=2, sizes 2+6 (ascending) | **SHIPPED** |
| `data_ov011_021d2fc9` (11B) | `data_ov011_021d2fc8` (1B, backward) | n=2, sizes 1+11 (ascending) | **SHIPPED** |
| `data_ov011_021d32ba` (30B) | `data_ov011_021d323c` (126B, backward) | n=2, sizes 126+30 (**descending**) | **DECLINED — same wall, confirmed independently, see below** |
| `data_ov011_021d3034` (43B) | `data_ov011_021d305f` (1B, forward) | n=2, sizes 43+1 (**descending**) | **DECLINED — new wall, see below** |

### A new mwcc wall: top-level globals of DIFFERING size get sorted ascending-by-size, not declaration order — even at n=2

Waves 3/4 established "n=2 is always safe" from same-type, same-size
pairs. This wave found that claim was narrower than stated: it only
held because every previously-tested n=2 *mixed-size* pair (e.g. wave 4's
`data_ov016_021b9374.c`, 10B+30B; `data_ov022_021ab8e4.c`, 26B+142B)
happened to already have its real address order equal to ascending-size
order. Isolated scratch compiles (four independent variants: struct+
scalar, two same-category structs, two scalars ascending, two scalars
descending) all agree: **when two top-level `const` globals in one TU
have different sizes, mwcc places the smaller one first in the compiled
section, regardless of source declaration order.** Confirmed with the
real `data_ov011_021d3034`(43B)+`data_ov011_021d305f`(1B) byte content:
compiled section put the 1-byte symbol at offset 0 and the 43-byte
symbol at offset 1 — exactly backward from the real address layout
(`0x021d3034` < `0x021d305f`), regardless of which declaration order was
tried. There is no declaration-order fix: whichever way the two globals
are written in the `.c` file, mwcc's own sort wins.

**This does not merely narrow n=2's safety — it invalidates Option B for
`data_ov011_021d3034` too.** The 3-symbol backward-absorption bundle
(`021d3020`(20B) + `021d3034`(43B) + `021d305f`(1B)) has sizes
20/43/1 — not monotonic in address order either, so it would ALSO be
resorted by mwcc to 1/20/43, which does not match the real 20/43/1
address layout. No number of members fixes a composition whose real
address-order sizes aren't already non-decreasing.

**Consequence for `data_ov011_021d3034`: DECLINED.** Fully evidenced
(20 bytes of its 43 are a proven `short[10]` = 5×{x,y} pair table, real
consumer `func_ov011_021ceebc.s`; `data_ov011_021d305f` fully evidenced,
consumer `func_ov011_021caafc.c`, already matched) but structurally
blocked by this new wall — not a research gap.

**Independently reconfirmed on a second, unrelated pair —
`data_ov011_021d323c`(126B)+`data_ov011_021d32ba`(30B), also
address-ascending/size-descending: DECLINED.** This pair got an
unusually thorough investigation (their sole consumer,
`func_ov011_021cd754`, is a permanent hand-encoded `.s` wall with no
mnemonic form anywhere in the tree — disassembled directly via
`capstone` to trace real `mla`/shift stride arithmetic): 125 of 126
bytes of `021d323c` are proven to belong to a `[5][5][5]` signed-byte
"route" grid (stride 25 rows × 5 columns × up to 5 NUL-terminated
steps), independently corroborated by an exhaustive byte-level
self-consistency check with zero exceptions (all 5 diagonal cells are
zero; all 10 off-diagonal pairs satisfy
`grid[j][i] == negate(reverse(grid[i][j]))`) — real evidence, not
inference alone. 20 of 30 bytes of `021d32ba` are proven to be a
stride-4 `{value,arg}` record array, sentinel-terminated at `(-1,-1)`,
confirmed both by the disassembly and by the literal bytes. Compiling
the composed TU standalone confirmed the same wall: the 30-byte symbol
landed at offset 0, the 126-byte symbol at offset 30 — backward from
the real `0x021d323c` < `0x021d32ba` address order. **Declined**,
despite the unusually strong evidence — the composition mechanism, not
the research, is what's blocked. Full route-grid/record-array
derivation preserved for any future wave that finds a different
carving mechanism for this pair (e.g. a patcher-level fix, or the
still-unexplored idea of merging both symbols under ONE enclosing
top-level name so mwcc has nothing left to independently sort — not
attempted this wave, and unclear whether `ninja check`/dsd's own
per-symbol linkage validation would even accept a TU that doesn't
declare a separately-named global matching every entry in
`symbols.txt`).

**Pattern across both confirmed cases: backward absorption into a
LARGER preceding neighbor is structurally at odds with this wall.**
Both walls hit this wave were backward-absorption attempts where the
absorbed neighbor (`021d33bc`... no — `021d323c`, 126B; and the
forward case `021d305f` was tiny but the TARGET `021d3034`, 43B, was
larger) ended up on the "wrong" side of the size order relative to
address order. The two compositions that DID work this wave
(`021b55dc`(2B)+`021b55de`(6B); `021d2fc8`(1B)+`021d2fc9`(11B)) both
happened to have the SMALLER symbol at the LOWER address already. This
is not a coincidence a future wave should rely on, though — it should
be verified per-candidate exactly as this wave did, not assumed from
this pattern alone.

**Practical rule for future waves, added to
`docs/research/alignment-wall-tu-composition-recipe.md`:** before
trusting ANY composed TU — n=2 included, not just n>2 — compile it
standalone and inspect the `.o` symbol table for declaration-order
preservation, UNLESS every member shares the exact same size (in which
case this specific wall does not apply, though the separate n>2
same-size reordering wall from wave 4 still might). A composition is
only safe from this wall when the real address-ascending sequence of
member sizes is itself non-decreasing.

## Part 1 — the declined set, closed out with evidence

10 of the 35 misaligned candidates are now genuinely, permanently
declined (down from wave 4's 11 — `021b55de` and `021d2fc9` turned out
resolvable via backward/forward absorption into a real, non-misaligned
neighbor, see Part 2 above):

- **`data_ov006_021ce38a`/`_3ae`/`_3d6`/`_3fe`** (4 symbols, the `kv_t`
  group) — DIRECTLY TESTED. Backward absorption into the full,
  correctly-scoped 13-symbol gap bundle was drafted, fully evidenced,
  compiled standalone, and found to reorder under mwcc (wave 4/#1481
  Part 2) — the same n>2 declaration-reordering wall, independently
  reproducing wave 1's original finding at a similar scale. No smaller
  both-ends-aligned sub-bundle exists in that gap. Declined; full
  derivation preserved in `cm-restock-carve-4-2026-08-08.md`.
- **`data_ov011_021d3034`** (43B) — DIRECTLY TESTED this wave. See the
  new size-ordering wall above. Declined.
- **`data_ov011_021d32ba`** (30B) — investigated this wave; see verdict
  below (pending the investigating agent's result at time of writing
  this section — resolved in the final PR body).
- **`data_ov004_021de7e5`** (20B, `%4==1`) — NOT directly tested this
  wave. `symbols.txt` shows it is one member of a contiguous run of
  `%4==1`-aligned symbols in `ov004` (`021de7e5`, `021de7f9`, `021de851`,
  `021ded69`, ...) — the exact same alignment-residue family
  `docs/research/ov004-odd-aligned-slot-recipe.md` (brief 173) already
  studied on a larger sibling (`data_ov004_021ded69`, 8780B): all 3
  source-level recipe variants it tried FAILED, including a bundle/
  absorption variant (Variant D) that hit dsd's own containment check
  when the composed span had to reach into the next real symbol's
  extent. `021de7e5` was not independently re-tested (this is an
  analogy by shared alignment-residue family and module, not a
  byte-for-byte repeat of that doc's own test), but the structural
  wall it documents — reaching a differently-aligned real boundary from
  deep inside a `%4==1` run requires absorbing into unrelated symbols'
  extents, which dsd's containment check rejects — applies here too.
  Declined on that existing precedent.
- **`data_ov011_021d2fc9`(11B, wait — resolved, see above; not declined)**
- **`data_ov011_021d3583`/`_358b`** (2 symbols, `%4==3`) — NOT tested
  this wave. Both have real, confirmed consumers (`relocs.txt:144-145`,
  a single caller region `func_ov011_021caaf4`). The only viable
  backward-absorption fix found by inspection is a 3-symbol bundle
  (`021d33bc`(455B) + `021d3583`(8B) + `021d358b`(9B), sizes
  455/8/9 — also non-monotonic, so likely subject to the very wall
  documented above, though not compiled and confirmed this wave).
  `021d33bc` itself is a previously-uninvestigated 455-byte census
  `array`-shape candidate. Left as an **identified but untested lead**
  for a future wave — not claimed declined, since no direct test was
  run; not claimed resolvable, since the size-ordering wall likely
  applies. Honest middle ground: open.

**10 permanently declined with evidence** (`021ce38a`/`_3ae`/`_3d6`/
`_3fe`, `021d3034`, `021de7e5`, plus `021d32ba` pending this section's
final resolution below), **1 open lead** (`021d3583`/`_358b`,
untested), **2 resolved as shippable after all**
(`021b55de`+`021b55dc`, `021d2fc9`+`021d2fc8`).

## Part 3 — main-pool sweep

Parsed the full 274-candidate census across all 4 shape sections
(struct 186, array 57, fnptr_table 29, jump_table 2 — confirmed exact
match to the census's own stated total). Prior waves only ever worked
the struct section, and only for `main`/`ov006` plus this arc's
cross-module misaligned subset — the array/fnptr_table/jump_table
sections (88 symbols) were entirely untouched. Cross-referencing every
non-`main`/`ov006` candidate against current `delinks.txt` found
`ov011` is by far the largest remaining pool: 15 candidates, 1,175
bytes (next largest: `ov000`, 8 candidates, 118 bytes) — and `ov011` is
also where this wave's Part 2 absorption candidates cluster, so the
two efforts overlap naturally in one module.

5 of `ov011`'s remaining candidates are independently 4-aligned
(no composition needed): `data_ov011_021d2fd4` (16B, fnptr_table),
`data_ov011_021d2ff8` (20B, array), `data_ov011_021d3020` (20B, array),
`data_ov011_021d35d0` (28B, array), `data_ov011_021d3900` (224B,
array, `.data`). Investigated and carved with the standard method
(real byte extraction, `relocs.txt` consumer proof, transitive-callee
tracing) — results in the final reconciliation table.
