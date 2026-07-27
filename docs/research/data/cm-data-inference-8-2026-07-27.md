# cm-data-inference-8 — data wave 8

2026-07-27. Continues the opaque-blob data-retyping campaign with the
same method: parallel read-only `Explore`/investigate agents, exhaustive
symbol-grep + `relocs.txt` address cross-check, classify fixed-offset
(WEAK) vs computed-stride (STRONG), never force a type onto insufficient
evidence, implement centrally afterward.

This wave had two parts: (1) resolve the 1 carried-over CONTRADICTION
lead from wave 7, and (2) a fresh census batch for additional runway.

## Part 1: the carried-over `data_ov002_022ca3dc` lead

Wave 7 declined this symbol as a CONTRADICTION: 17 clean
`{s32 attr; void *ptr;}` records (136 bytes) plus one orphan trailing
word (offset 0x88) that looked like it might belong to a separate,
still-undelinked next symbol. Re-investigation this wave found the
opposite: `delinks.txt` already correctly bounds the full 140 bytes to
this symbol, and the next symbol (`data_ov002_022ca468`) is a wholly
separate, independently-consumed object — so no boundary shift was
needed after all. Shipped as-is:

- `data_ov002_022ca3dc` (140B, address/size unchanged) — retyped to
  `struct { struct { int attr; void *ptr; } entries[17]; int trailer; }`.
  `entries` triple-corroborated (byte size, `relocs.txt` — 16 relocated
  `ptr` words + 1 legitimate NULL, all real symbols — and a computed-
  stride consumer for the `attr` half). `trailer` (offset 0x88, value 3)
  stays an honestly-unlabeled scalar — no relocation, no known consumer.

Investigating this symbol's true neighbor surfaced two bonus carves in
the same previously-unclaimed `delinks.txt` gap, both confirmed against
pre-existing `symbols.txt` entries before implementing:

- `data_ov002_022ca468` (NEW, 8B) — `const int[2] = { 84, 196 }`.
- `data_ov002_022ca470` (NEW, 16B) — `const int[4] = { 119, 89, 140, 104 }`.
  Sole consumer indexes both arrays in parallel via an identical runtime
  selector for indices {0,1}; a 3rd fallback branch hardcodes literals
  equal to this array's own elements [2]/[3], independently confirming
  a real 4-element table where 2 of 4 slots got inlined at that call
  site instead of indexed.

## Part 2: fresh census, 15 investigations dispatched

**13 shipped directly as STRONG, 1 shipped via boundary-cluster
reconstruction, 1 shipped with a documented cross-region caveat — 15 of
15 (100%) resulted in a landed retype.** Notably higher than this
campaign's established 55-69% range; likely reflects that this batch's
candidates were smaller/simpler on average and several turned out to
belong to already-partially-mapped record families (ov006's dispatch-
table vocabulary, the ov002 card/handler-table family, a duel-layout
table shared verbatim across three overlays).

| Symbol | Shape | Evidence |
|---|---|---|
| `data_ov002_022c9010` | `{cardId:u32; handler:void*}[5]` | one of the 8-table `Ov002CardHandlerRecord` family already established in `data_ov002_022c9038.c` et al. |
| `data_ov002_022c8ff0` | `{cardId:u32; handler:void*}[4]` | same 8-table family, different member |
| `data_ov005_021b158c` | `short[5][4]` | computed-stride record table, columns 0/2 constant across all 5 rows |
| `data_ov016_021b8e34` | `{short a,b,c,d}[5]` | byte-identical to sibling `data_ov019_021b5a28` — shared duel-layout table |
| `data_ov019_021b5a28` | `{short f0,f1,f2,f3}[5]` | bulk-copy (`mov r2,#0xa`) + computed-stride readback (`cmp lr,#0x5`), field periodicity (f0/f2 constant) independently confirms the 8-byte grouping |
| `data_ov006_021cb820` | `{short f0,f1,f2,f3}[5]` | same evidence class as already-shipped sibling `data_ov006_021cb634` (wave 6) |
| `data_ov017_021b7ed0` | `{short f0,f1}[10]` | sits exactly between wave-7-shipped siblings `_021b7e8c`/`_021b7ef8`; loop bound proven by explicit `mov r2,#0xa` immediate |
| `data_ov001_021ca348` | `unsigned int[2][6]` | two independent loop-bound-proven strides (row + column); kept `unsigned int` not pointer-typed since the consumer never dereferences |
| `data_ov006_021cbb50` | fn-ptr `[9]`, NULL-terminated | matches the already-documented `Ov006StateCb` type in `ov006_core.h` (brief 304 dispatch-family table for the `021b3f88` state) |
| `data_ov003_021cf0f4` | `int[8]` `{0,1,2,1,0,-1,-2,-1}` | `&0x7`-masked runtime index on two independent branches hard-proves 8 elements; symmetric triangle-wave delta table |
| `data_ov003_021cf1b8` | `{u16 x,y; u8 w,h}[5]` + 2B pad | two consumers (`base+idx*6`, real loop bounds) together prove 5 records; field layout independently matches already-matched sibling functions receiving the same struct |
| `data_ov006_021ceb2c` | `signed char[32]` | computed-stride, `mode==23`-gated, corroborated in 2 independent functions; `ldrsb` + explicit `<0` branch decisive for signed over the prior `unsigned char` |
| `data_ov002_022be184` | `int[5][2]` all `{-1,-1}` | two loop-bound-proven strides in a running-maximum pattern; signed comparison + all-0xFF fill decisive for signed `int` (unsigned would make the update dead code) |
| `data_ov002_022c836c` → `data_ov002_022c8368` | `{id:u32; flag:u32}[5]` (CONTRADICTION, boundary-merged) | same runtime index/stride proven on both `_LIT1`/`_LIT3` in the sole consumer; 8-byte stride only divides evenly starting 4 bytes before the old symbol — see below |
| `data_ov002_022ca370` | `unsigned short[16]` (CONTRADICTION, resolved with caveat) | EUR: 2 STRONG halfword-stride consumers. USA/JPN's own symbol tables + GLOBAL_ASM ground truth read the same bytes at byte-stride through an unrelated function — a genuine per-region semantic divergence, not a transcription error. Retype is provably byte-safe for all 3 regions regardless — see below |

### `data_ov002_022c836c` → `data_ov002_022c8368`: a 4-byte boundary shift

The sole consumer (`func_ov002_02264b84.s`) indexes two literal-pool
bases — `_LIT1 = &data_ov002_022c8368` and `_LIT3 =
&data_ov002_022c836c` — with the *same* runtime loop counter at the
*same* `lsl #0x3` (8-byte stride). An 8-byte stride only divides evenly
starting at `0x022c8368`; `data_ov002_022c836c` (the old symbol) was
actually record `[0].flag` through record `[4].flag`, missing each
record's leading `id` word, which lived in a `symbols.txt`-declared but
`delinks.txt`-unclaimed 4-byte gap immediately before it.

Reconstructed as one `struct { unsigned int id; unsigned int flag; }
data_ov002_022c8368[5]`. The 4 never-carved leading bytes were read
directly from `extract/eur/arm9_overlays/ov002.bin` (file offset
`0x11dec8`, i.e. `0x022c8368` minus the module's own `.text` base
`0x021aa4a0`); the following 36 bytes read from that same raw dump were
verified to match the already-shipped `data_ov002_022c836c.c` content
exactly, confirming the offset arithmetic before trusting the new bytes.
`func_ov002_02264b84.s` updated: dropped the now-gone `.extern
data_ov002_022c836c`, changed `_LIT3` to `.word data_ov002_022c8368+4`
(symbol+offset, the same proven-safe technique used for
`data_ov011_021d3138+0x3f` in wave 7). `delinks.txt` updated to claim
`0x022c8368`–`0x022c8390` (40 bytes) under the new filename.

### `data_ov002_022ca370`: a genuine cross-region shape divergence

EUR's own evidence is clean and STRONG in isolation: two already-matched
C consumers read this symbol at halfword stride via a runtime-computed
index, and EUR's `relocs.txt` has zero internal relocations in the
32-byte range. But this file has no region override, so it is the single
byte source for USA and JPN too — and those regions' *own*
independently-dsd-derived symbol tables split the same 32 bytes into two
16-byte objects, consumed at *byte* stride by a GLOBAL_ASM (byte-exact
original disassembly) function with no halfword-stride analog anywhere
in USA/JPN's `relocs.txt`.

This is retyped to `const unsigned short data_ov002_022ca370[16]`
because it is provably byte-safe regardless of region: USA/JPN's
consumer is raw assembly addressing memory by symbol name, indifferent
to how the EUR-baseline defining TU spells the C type, and the chosen
type matches EUR's own two consumers' `extern` declarations exactly. The
cross-region shape divergence itself is a genuine fact about how the
original game's regional builds diverged, not a defect in either
region's symbol table — recorded here rather than silently dropped, per
this campaign's standing "verify counts / don't paper over contradictory
evidence" discipline.

## Gate

`ninja` (EUR) passed SHA-1 clean on the first rebuild after all 15
changes — no `.data`/`.rodata` link-warning class of failure, confirming
the const-placement rules from wave 7 held with zero regressions across
every pointer-containing file this wave (the two `Ov002CardHandlerRecord`
tables, the `Ov006StateCb` fn-ptr table, `data_ov002_022ca3dc`'s pointer
half). Full `python tools/gate3.py --scope all` (3-region SHA-1 + pytest)
run to confirm USA/JPN and the test suite.

## Hit rate

15 of 15 fresh census investigations resulted in a landed retype (100%),
plus the 1 carried-over lead resolved clean (no shift needed) with 2
bonus sibling carves discovered along the way. Both CONTRADICTIONs found
this wave were investigated to a real resolution rather than declined —
one via boundary-cluster reconstruction (matching wave 7's ov011/ov012
precedent), one via an explicit byte-safety argument that ships the
retype while honestly documenting the underlying cross-region divergence
rather than either forcing a single interpretation or discarding the
finding.
