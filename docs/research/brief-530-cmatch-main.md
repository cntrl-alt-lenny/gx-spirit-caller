[//]: # (markdownlint-disable MD013)

# Brief 530 - main small-contained c-match wave

Branch: `claude/cmatch-main-530`

Scope: continuing the main small-contained c-match lane from brief 528 (safe-queue-v3
§4, ranks 71-119 of the `LIKELY`-tier main block — the 49 candidates left untried after
brief 528's 10 matches + 13 parks in ranks 48-70).

## Outcome

- Candidates attempted: **20**
- EUR matches accepted: **6**
- Reshape-parked (contained, residual not closed): **2**
- Avalanche-parked: **11**
- Skipped without a build attempt (dossier itself flags a confirmed permanent `.s`
  wall from an earlier brief): **1** (`0206cf10`)
- USA/JPN ports: **6/6 kept**, both regions gated green

## Matched candidates

| Addr | Recipe | Key fix(es) |
|---|---|---|
| `02030b84` | inverted-polarity card-ID membership switch (in-set→0, default→1) | Zero-shot. |
| `02031208` | card-ID membership switch, 8-value set | Zero-shot. |
| `02031684` | inverted-polarity card-ID membership switch, near-clone of `02030b84` | Zero-shot. |
| `02031c8c` | flags-gated doubly-linked-list unlink (two operational modes) | Zero-shot despite LOW confidence — the draft's reload/store-order reasoning held up untouched. |
| `02038f3c` | clamp + pointer-arith store into a shared list-manager global | Zero-shot **after fixing a real bug in the dossier draft**: it declared a `u8` typedef *after* using it inside an earlier struct, and included an unneeded `#include <stdio.h>`. Reordering the typedefs (and dropping the include) was the only change needed. |
| `02038fb0` | double-cursor append into the same list-manager global as `02038f3c` | Zero-shot. |

**The sparse card-ID membership switch remains the standout sub-shape across both
main waves now**: 3/3 this wave (10/11 combined with brief 528), including an
inverted-polarity variant (`02030b84`) that seeded a second, also-zero-shot,
near-clone (`02031684`).

## The one real dossier bug this wave: `02038f3c`

`docs/research/dossiers/02038f3c.md`'s prep draft declared `struct Glob_9c480 {
u8 _pad0[0x6]; ... }` using `u8` as a field type, then defined `typedef unsigned
char u8;` several lines *later*, after the struct that already used it — invalid
in C (a type must be declared before first use), so the draft would not even
compile as posted. It also carried a stray `#include <stdio.h>` this project's
Mode-C style never uses. Both were caught immediately at build time (a hard
compile error, not a near-miss), fixed by moving the typedefs to the top of the
file and dropping the include, after which the function matched byte-identical
with the rest of the draft untouched. Distinct from brief 528's `02038f3c`-style
finding (a *logically* wrong constant that still compiled) — this one was a
draft that could not compile at all as posted.

## Parked candidates

All parked with the working tree fully reverted (`.s` restored via
`git checkout HEAD --`, `delinks.txt` line reset). One-line reasons:

| Addr | Bucket | One-line reason |
|---|---|---|
| `020312a0` | avalanche | Confirmed the dossier's own predicted risk: orig has TWO separate `mov r0,#1;bx lr` tail blocks from the switch lowering; a single `return 1` folds to one tail and diverges (same total size, different shape). |
| `020385f8` | avalanche | Sign-split clamp (`if(step>=0){if>}else{if<}`) family; same-size shape mismatch. |
| `02038674` | avalanche | Near-clone of `020385f8` (all-`short` fields instead of mixed `int`/`short`) — same clamp family, same avalanche. |
| `0204937c` | avalanche | "Reload global before every field store" pattern (no local pointer bind) — mwcc 2.0 CSE'd the base into one register anyway despite the no-local-alias precaution the dossier recommended. |
| `02049554` | avalanche | Same reload-defeats-CSE family as `0204937c`; also applied the dossier's own recommended fix (real 5th parameter instead of a `__builtin_frame_address` hack) — still avalanched. |
| `02052398` | avalanche | Third instance of the same reload-defeats-CSE pattern this wave (indexed-global-not-bound-to-a-local). **All three attempts of this specific lever failed** — worth flagging as likely not reliable on mwcc 2.0/sp1p5 regardless of what sm64ds-derived or campaign-prep notes assume about defeating CSE this way. |
| `0205340c` | reshape-parked→avalanche | CONTAINED at 90 bytes (a genuine register-footprint difference — orig's prologue pushes one fewer callee-saved register than the draft, from the very first instruction). One reshape attempt (loop-counter elimination, `do{*--p=...}while(p!=buf)` instead of separate `i`/`n` counters) made it *worse* (→ avalanche); reverted, parked. |
| `02054a30` | avalanche | Applied the dossier's own documented fix (`unsigned char tmp[3]` + explicit `(signed char)` casts at each use, to get `ldrb`+`asr` instead of `ldrsb`+`asr`) exactly as prescribed — still avalanched, same size. |
| `020665e0` | avalanche | Reload-after-store pattern (single value, not a field-storm) — also failed, extending the "reload defeats CSE" miss streak to 4/4 this wave. |
| `02068890` | avalanche | LOW confidence; cursor-reload-per-iteration loop walk; predicated-move-vs-branch coin-flip the dossier itself flagged as permuter-class. |
| `0206a724` | avalanche | Applied the dossier's own suggested signature fix (added the missing 5th arg `out2`, since the draft as posted wrote both output paths through `out` when the dossier's own prose already said `out2`) — still avalanched. |
| `0206b814` | avalanche | Switch-to-function-pointer-table dispatch + tail-call; branch-table entry mapping diverged. |
| `0206baec` | avalanche | Strict-store-order scatter-copy across 5 globals + a flag word written last; scheduling diverged despite following the prescribed read-early/write-late order. |
| `02072444` | reshape-parked | CONTAINED at 35 bytes — a register-choice difference from the very first instruction (`n`/`q` computation order). One reshape attempt (computing `q` before `n`, matching what the orig's first differing instruction suggested) made no difference; parked as a genuine register-pressure wall. |
| `0206cf10` | skipped (no build) | Its own dossier states it up front: *"currently ships as whole-function .s (reg-alloc-walled, brief 302)"* — an already-confirmed permanent wall from an earlier campaign wave, not a fresh candidate. No point re-attempting; noted here only so a future wave doesn't re-open it by mistake. |

### Standing observation: "reload the global instead of binding to a local" did not work once this wave

Four separate dossiers this wave (`0204937c`, `02049554`, `02052398`, `020665e0`)
each predicted that avoiding a local pointer/temp binding — indexing the extern
global repeatedly instead — would force mwcc to re-`ldr` it before every store,
matching an original that does the same. All four avalanched, including two
where the dossier's own suggested secondary fix (a corrected function signature)
was also applied. This is a small sample, but four-for-four is enough to flag:
on mwcc 2.0/sp1p5, this specific "no local alias defeats CSE" lever looks
unreliable as a default assumption, unlike on whatever compiler/version the
sibling notes (`func_0204827c`, etc.) were validated against. Future dossiers
citing this pattern should be treated as lower-confidence than their nominal
tier until re-verified.

## Porting

All 6 EUR matches ported to USA and JPN via `tools/port_to_region.py`.
`02038f3c`/`02038fb0` resolved at HIGH confidence (3/3 symbols each — they share
callers via the same list-manager global). The 4 card-ID-membership /
doubly-linked-list matches are pure leaf functions with no relocations to
cross-check, so the porter refused at the default HIGH floor and landed at
MEDIUM via the D2 v2 auto-promotion rule — all 4 sharing the same consistent
**-0x54 neighbor-shift** seen in brief 528's leaf-function ports. Accepted at
`--confidence-floor MEDIUM`; both regions passed byte-identical for all 6.

**Tooling reminder (same as brief 528):** `port_to_region.py` writes the new
`.c` file and prints the `delinks.txt` block that should replace the existing
`.s:` entry, but does not edit `delinks.txt` itself — the manual `.s:`→`.c:`
flip + `.s` removal is still a required step per region, per function.

| EUR addr | USA/JPN addr | Confidence |
|---|---|---|
| `02030b84` | `02030b30` | MEDIUM (leaf, no relocs) |
| `02031208` | `020311b4` | MEDIUM (leaf, no relocs) |
| `02031684` | `02031630` | MEDIUM (leaf, no relocs) |
| `02031c8c` | `02031c38` | MEDIUM (leaf, no relocs) |
| `02038f3c` | `02038eec` | HIGH |
| `02038fb0` | `02038f60` | HIGH |

USA and JPN addresses are identical for all 6 candidates in this wave.

## Yield and runway

- EUR yield this wave: **6 / 20 attempted = 30%** — lower than brief 528's 41.7%,
  driven almost entirely by the reload-defeats-CSE pattern's 0/4 hit rate (would
  have been 6/16 = 37.5% excluding those four).
- Card-ID membership sub-shape yield: **3 / 3 this wave**, 10/11 combined across
  briefs 528 + 530.
- Remaining safe-queue-v3 rank 48-119 pool after this wave: **29 candidates**
  still unattempted (ranks roughly 84-119, minus the one confirmed-permanent
  skip already noted above). Given this wave's front-loaded productive run (6
  matches in the first 6 attempts, then a long avalanche drought), a future
  wave should specifically hunt for more card-ID-membership-switch dossiers in
  the remaining range before grinding the rest in queue order.

## Verification

Final SHA gates:

```text
gx-spirit-caller_eur.nds: OK
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```
