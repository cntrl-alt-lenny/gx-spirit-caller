# cm-data-inference-12 — data wave 12

2026-07-27. Continues the opaque-blob data-retyping campaign with the
same method, but with a different shape than every prior wave: the fresh
census returned **zero genuinely new candidates**, so this wave pivoted
entirely to the one standing concrete lead instead of dispatching
investigation agents.

## The EUR main+overlay opaque-blob census is now exhausted

Live census re-run fresh (the same `grep -rlE "^(static )?(const )?
unsigned char data_[0-9a-zA-Z_]+\[[0-9]+\] = \{" src/main/*.c
src/overlay*/*.c` used every prior wave): 24 matches, and **every single
one** was already conclusively settled by a prior wave (WEAK/already-
optimal/CONTRADICTION, most reconfirmed 2-4 times independently). Before
concluding the pool was truly dry, cross-checked with a broader sweep for
the original mechanical-carve tag comments (`Cluster C Pattern`,
`Cluster D-2`, `D-2 wave`) regardless of current C type — this surfaced
more matches, but every one of those turned out to be an
already-retyped file whose *new* investigation-note header comment
happens to reference the old tag by name when explaining why it carries
no evidentiary weight (a pattern this campaign's own agent prompts have
used consistently since wave 8: "these 'Cluster C/D' tags are just
batch-commit labels... don't infer shape from the tag"). None were
genuinely untouched.

This is a real milestone, not a stall: waves 2 through 11 have now fully
worked through every `unsigned char[N]` blob the original mechanical
carve produced across `main` and all 24 overlays. Any further opaque-blob
work in this vein would need a fundamentally different discovery method
(e.g. a category of data that was never part of that original carve
batch at all) rather than a re-run of the same census.

## Implemented instead: `data_020b46b8`'s USA/JPN region override

The one standing concrete lead from wave 9/10/11's notes: EUR's
`src/main/data_020b46b8.c` (a 40-byte opaque flag array) shares its
address with a genuinely unrelated 174-byte sparse `unsigned short[87]`
lookup table in USA/JPN, discovered in wave 9
(`docs/research/data/cm-data-inference-9-2026-07-27.md`) but deferred
since it needed new region-specific source rather than a byte-preserving
retype.

Implemented as `src/usa/main/data/data_020b46b8.c` and
`src/jpn/main/data/data_020b46b8.c` (matching this project's own
established `src/<region>/main/data/` subdirectory convention for main
data files, confirmed by the existing sibling `data_020b425c.s`/
`data_020c3d68.c` entries in both regions' `delinks.txt`). Content
re-extracted directly from `extract/{usa,jpn}/arm9/arm9.bin` via a small
Python script (not hand-transcribed, learning directly from this same
wave's earlier build failure two commits ago — see `cm-data-inference-11`)
and cross-verified byte-identical between USA and JPN before writing.
New `delinks.txt` entries added for both regions, claiming
`0x020b46b8`–`0x020b4766` (174 bytes) out of what was previously one
large ~63 KB unclaimed `.rodata` gap in each region's table.

Both new files' element count (87) is loop-bound-proven, not size-
guessed: the sole consumer `func_0200a180.s` (region-specific, present
in both `src/usa/main/` and `src/jpn/main/`, unmatched `.s`) copies the
full 174 bytes via a `mov r2,#0x2b`-bounded (43×4-byte + 1 tail halfword
= 87 halfwords) loop before indexing the copy with a runtime-computed
value.

## Gate

Full `python tools/gate3.py --scope all` (3-region SHA-1 + pytest) PASS
on the first attempt — no rebuild-and-fix cycle needed this time, a
direct result of generating the byte content via script rather than by
hand.

## Hit rate

Not applicable in the usual sense — no fresh census investigations were
dispatched this wave, since the census itself returned nothing to
investigate. 1 of 1 standing leads implemented. The `cm-data-inference-N`
queue item is filed for wave 13 with an explicit note that the campaign
has reached a natural stopping point for its original discovery method;
future waves should either find a new discovery angle or fold remaining
capacity into other queue work.
