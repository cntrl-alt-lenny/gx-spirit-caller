# cm-data-inference-10 — data wave 10

2026-07-27. Continues the opaque-blob data-retyping campaign with the
same method: parallel read-only `Explore` agents, exhaustive symbol-grep
+ `relocs.txt` address cross-check, classify fixed-offset (WEAK) vs
computed-stride (STRONG), never force a type onto insufficient evidence,
implement centrally afterward.

No specific carried-over lead — wave 9's two CONTRADICTIONs were either
resolved in-wave or deferred as a documented, non-blocking optional item.
Live census re-run fresh: 35 opaque blobs remained at this wave's start
(down from 45, not derived by simple subtraction — this campaign's counts
have drifted every wave). 15 investigations dispatched: 13 fresh
candidates across `main` and 6 overlays, plus 2 deliberate revisits of
old wave-4/wave-5 CONTRADICTIONs (`data_02102120`, `data_ov006_021cb7b8`)
explicitly re-evaluated against the newer "ship EUR + document the
cross-region caveat" resolution pattern this campaign developed in waves
8–9, which didn't exist when those two were first declined.

## Results

| Symbol | Outcome | Evidence |
|---|---|---|
| `data_020bed6c` | no change (3rd confirm, waves 2→4→10) | scalar string constant fed to an unrolled bulk memcpy, no record access |
| `data_020bf280` | no change (4th confirm) | one fixed-offset consumer; a mid-blob "pointer anomaly" re-verified as a coincidental numeric-ramp false positive across all 28 relocs.txt files |
| `data_020bff80` | no change (4th confirm) | 2 fixed-offset `ldrsh` reads only, despite a tempting radius-4096 trig-table byte pattern |
| `data_020c1f80` | no change (4th confirm) | same evidence class as `020bff80`; a newly-checked 5-entry relocation run resolved as the same false-positive class as its sibling |
| `data_020c32f8` | no change (already-optimal, 3rd confirm) | genuine runtime-variable, bound-proven index, but stride is 1 byte — already exactly `unsigned char[724]` |
| `data_020c3654` | no change (already-optimal, 3rd confirm) | ASCII `tolower()` table, 4 consumers each with an explicit `<0x80` bound |
| `data_020c36d4` | no change (already-optimal, 3rd confirm) | ASCII `toupper()` table, mirrors `020c3654` |
| `data_ov002_022ca528` | no change | only 6 of 28 bytes touched, all single fixed-offset byte reads |
| `data_02102120` | **shipped** — 6-field struct, cross-region CONTRADICTION resolved | see below |
| `data_ov002_022ca510` | **shipped** — `const int[6]` | 2 independent consumers, each with a genuine loop counter hard-bounded to 6 (`cmp r0/r7,#0x6`), word stride |
| `data_ov006_021cb5f4` | **shipped** — `const int[6]`, overturns a wave-4 "keep opaque" call | already-matched consumer's own `extern int[]` declaration plus exhaustive relocs.txt accounting (5 relocated words + 1 plain word, zero slack) |
| `data_ov006_021cb7b8` | **shipped** — `{short,short,short,short}[5]`, resolves a wave-5 CONTRADICTION | same idiom as already-shipped sibling `data_ov006_021cb634`; the "CONTRADICTION" label was a family-mismatch note, not a genuine boundary conflict |
| `data_ov016_021b8e5c` | **shipped** — `const int[8]` | 4th instance of the triangle-wave table family (`0,1,2,1,0,-1,-2,-1`) |
| `data_ov019_021b5a68` | **shipped** — `const int[8]` | 5th instance of the same family, this time cross-validated byte-identical and idiom-identical across all 3 regions |
| `data_ov022_021ab9a0` | **shipped** — `void*[7]` | 6 relocation-proven pointers + 1 NULL, filling the declared 28 bytes exactly; sole C consumer's canonical callee signature confirms pointer semantics |

7 of 15 shipped directly (47%); 8 of 15 were solid reconfirmations (3
already-optimal, 5 WEAK) — no forced retypes, no discarded findings.

## `data_02102120`: an old cross-region CONTRADICTION, now resolved by build-config proof

Wave 5 declined this symbol outright: EUR's own evidence was already
STRONG (`Entry[5]`, loop-bound-proven), but USA/JPN hold genuinely
different byte content — an unrelated function-pointer dispatch table —
at the identical absolute address, with no per-region override file to
reconcile the two. That finding predates this campaign's newer
resolution pattern (wave 8's `data_ov002_022ca370`, wave 9's
`data_ov002_022ca390`): when a file has no region override, USA/JPN's
raw-assembly consumers address memory by symbol name, indifferent to how
the EUR-baseline defining TU spells its C type — so the retype is
provably byte-safe regardless of the content divergence, and gets shipped
with the divergence documented rather than declined.

This case goes one step further than that pattern: `data_02102120` lives
in `src/main/` (no region prefix), and `tools/configure.py`'s
`_is_region_source_excluded` — a rule pinned by
`tests/test_configure_regions.py`'s own integration test — excludes any
unprefixed `src/main/*` file from the USA and JPN build graphs entirely.
The file is never even submitted to the compiler for those regions. This
isn't an inference from "no override exists"; it's a hard, unit-tested
guarantee from the build configuration itself, and it's corroborated by
this project's own passing 3-region `ninja sha1` gate (if this TU were
contributing bytes to USA/JPN today, their SHA1 would already be
failing, since USA/JPN's true bytes at this address are a function
pointer, not `0xffffffff`). Shipped as a 6-field struct (`cur`, `end`,
`base`, an unknown word, a 0-based `slot_index` halfword, and 2 bytes of
apparent alignment padding), matching a documented sibling struct's
first-three-field convention (`Heap0207e370`) as corroborating context
only, not proof of identical identity.

## `data_ov006_021cb7b8`: a stale "CONTRADICTION" label, corrected

Wave 5's one-line verdict — "CONTRADICTION; a different idiom entirely
... not part of the palette family the other 7 addresses in this run
belong to" — described a mismatch against an *assumed sibling family*,
not a genuine relocs/boundary contradiction in this campaign's stricter
current sense (a stride that doesn't evenly divide the declared size, or
a relocation crossing into a neighboring symbol). Re-investigated fully
fresh and on its own terms, it turns out to be the same
bulk-copy-then-strided-`ldrsh`-readback idiom already shipped for
`data_ov006_021cb634` (wave 6) — a different, unrelated consumer function
implementing the identical template. The stale label survived untouched
through waves 6–9 specifically because later waves were instructed to
skip symbols already flagged in `docs/research/`, which is exactly the
kind of methodology gap a deliberate revisit is meant to catch.

## Gate

`ninja` (EUR) passed SHA-1 clean on the first rebuild after all 8
implemented files (7 data files + 1 already-matched consumer's `extern`
signature updated for type consistency, a no-op for codegen since `int`
and pointer are both 4-byte values on this ABI) — zero `.data`/`.rodata`
link-warning class of failure. Full `python tools/gate3.py --scope all`
(3-region SHA-1 + pytest) run to confirm USA/JPN and the test suite.

## Hit rate

7 of 15 fresh census investigations shipped directly (47%) — squarely in
this campaign's established range, and notably, 3 of the 7 (`02102120`,
`021cb5f4`, `021cb7b8`) are resolutions of symbols previously *declined*
in waves 4/5, not fresh finds. This wave deliberately spent 2 of its 15
dispatches revisiting old CONTRADICTIONs specifically because this
campaign's own resolution technique has matured since they were first
investigated — a reminder that "declined" in this project's own history
is a snapshot of the evidence and method available *at the time*, not a
permanent verdict, and periodically revisiting old declines against a
newer standard is worth the dispatch cost.
