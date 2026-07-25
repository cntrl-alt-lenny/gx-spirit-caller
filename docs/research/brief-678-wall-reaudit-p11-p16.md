# Brief 678 — re-audit P-11/P-16 + stale wall citations (queue item cm-wall-reaudit-p11-p16)

**Result: documentation-only correction, no code shipped.** Confirmed
both falsified verdicts precisely against ground truth (file presence,
not re-derivation from memory), corrected `codegen-walls.md` +
`ov011_core.h` + `ov019_core.h` + `ov002_core.h`, left `func_ov002_02269534`
(P-16's sole member) parked with a concrete, actionable untested lever
documented for a future attempt rather than a half-finished reconstruction.

## P-11: 10 of 16 catalogued members already shipped

Checked all 16 members cited across P-11's "Affected picks" table and
its two family-cluster tables by direct file presence (`.s` gone =
matched, robust to the symbol having since been renamed — safer than
checking for a specific `.c` filename):

**Shipped (10):** `func_0200b0c8`, `func_02032efc`, `func_02032f38`,
`func_02032e8c`, `func_02032ec4`, `func_02054fd0`, `func_02055000`,
`func_ov002_02238bc8`, `func_ov002_0226db7c`, `func_ov002_02292020`.

**Genuinely remain (6):** `func_02024574`, `func_020270d0`,
`func_02028790`, `func_ov011_021d2ca8`, `func_ov002_02200084`,
`func_ov002_022319f4`.

Spot-checked the 6 survivors against this campaign's current lever set
(typed-struct externs, trampoline-arity, tier routing, branch-order/
predication) — none apply. P-11's own framing explains why: it's
documented as resisting *both* permuter and source-shape iteration
("downstream of source-shape decisions"), a fundamentally different
mechanism than what those levers address. The entry's own extensive
prior falsification history (5 source variants on the `0ca11024`
family, `volatile`-qualified reads, a 900-iteration permuter run
plateauing 6 bytes short) already demonstrates this — re-running the
same categories of attempt against the 6 survivors wouldn't be
expected to move anything the entry's own analysis hasn't already
ruled out. Re-confirmed standing, not exhaustively re-tested from
zero. Added a correction note directly under the P-11 header (rather
than editing the historical per-wave tables, which are a changelog of
what was known at each point in time, not a live-updated status list)
so the 16→6 correction is visible before anyone reads the detailed
tables.

## P-16: falsified by a methodology flaw, not a genuine wall

P-16's sole member, `func_ov002_02269534`, was declared PERMANENT after
its only tested fix used `*(int *)(data_ov002_022d016c + 0xd20) += 1;`
— raw pointer-cast arithmetic. `cm-overlay-small-sweep` (PR #1334,
2026-07-24) independently established this exact idiom compiles
differently from a typed struct member and reversed 6 *other*
documented "permanent" verdicts for precisely this reason. Checked
`ov002_core.h`'s own `struct Ov002D016c` (the `D016C` macro's target):
`f_d20` is **already a mapped field at exactly this offset** — the
untested fix is simply `D016C->f_d20 += 1;` at the 3 sites instead of
the pointer-cast form, no new struct work required.

**Not attempted this brief.** The surrounding function is a 548 B /
137-instruction 3-state duel-progress dispatcher, and brief 582's own
prior 65.2%-match working draft was explicitly discarded once parked
("`.s` was restored and the tree is clean") rather than preserved —
so testing the lever means reconstructing the whole function from
ground-truth disassembly first, not swapping one access idiom in an
existing near-miss. That reconstruction is comparable in scope to a
dedicated brief on its own (briefs 582 and 586 both spent real effort
on this single function without reaching 100%), and this item's
primary scope is the documentation audit, not a new C-match attempt —
so it's left as a clearly-documented, ready-to-execute lead for a
future brief rather than a rushed attempt within this one. Downgraded
the entry from **PERMANENT** to **UNVERIFIED, not settled** in
`codegen-walls.md`, with the full disassembly, traced semantics, and
the exact lever already in the entry so a future attempt doesn't have
to re-derive any of it.

## Stale citations found and fixed (7, not 6 — one more surfaced during the audit)

The 6 the queue text named, all from `cm-overlay-small-sweep` (PR
PR #1334) shipping functions that older entries still cited as
"permanent" or "3 prior attempts reverted":

- `func_ov011_021ca600` — "Adjacent finds" prose bullet in
  `codegen-walls.md`, rewritten in place (was written in standing
  present tense, not a historical log entry, so directly misleading).
- `func_ov011_021ccf8c` — `ov011_core.h`'s own "WALL additions" note.
- `func_ov019_021b4c30` — `ov019_core.h`'s own "§DEFERRED" note.
- `func_ov002_02273b1c`, `func_ov002_02267f90`, `func_ov002_0220c2c0`
  — `ov002_core.h`'s brief-358 "§VERIFIED" section's `.s picks:` list.
  Added one correction note after the list rather than editing the
  three scattered inline mentions individually, since that section
  reads as a historical wave-outcome record and a single clear
  "these 3 have since shipped" pointer is both accurate and lower-risk
  than threading corrections through dense historical prose.

**One more found by cross-referencing `lever-payoff.md` against
`codegen-walls.md`:** `func_02084ac4` — `codegen-walls.md`'s own brief
671 bullet says "RE-CONFIRMED PERMANENT, not falsified," directly
contradicting `lever-payoff.md`'s own reg-alloc entry, which already
recorded this function as shipped via a later pass that tried the
correct compiler tier (a fix brief 671's own 3 tested variants never
tried). Confirmed via `src/main/func_02084ac4.c` existing on disk.
Annotated the brief-671 bullet as superseded rather than deleting it
(it's an accurate record of what brief 671 itself found and why r6's
report was wrong *at the time*), with the actual resolution and its
source pointed to directly.

**Historical wave-log tables were deliberately left untouched.**
`codegen-walls.md` and `ov002_core.h` both contain large per-wave
"§VERIFIED brief NNN" record sections describing what a given brief
found *at that time* — these are changelogs, not live status lists,
and retroactively editing them to reflect later state would falsify
the historical record rather than correct a live claim. Only
standing-present-tense analytical prose (citations that read as
current fact, not "as of brief NNN") were corrected.

## Explicitly not reopened (per the queue's own instruction)

P-1, P-3, P-4-as-narrowed, P-14, P-17 — none touched. (P-4's *own*
`func_02084ac4` citation fix above is a factual correction to what P-4
currently cites as evidence, not a re-opening of the P-4 verdict
itself, which stands unchanged.)

## Gate

Documentation/comment-only change (no `.c`/`.s` files touched, no
`delinks.txt` changes). `python tools/configure.py eur && ninja sha1`
— PASS, confirming the 3 edited header files' comment blocks didn't
introduce a stray unterminated `/* */` or otherwise disturb
compilation. USA/JPN unaffected (their own separate `ov011_core.h`/
`ov019_core.h`/`ov002_core.h` copies were not touched).
