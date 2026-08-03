[//]: # (markdownlint-disable MD013 MD041)

# cm-f-cf8-contradiction (2026-08-03)

Doc-only. No build, no source changes. Deliberately small per the filing
instruction: one canary verdict, one minimal process fix, one measurement.

## Result

1. **Canary verdict: `data_ov002_022d016c.f_cf8` (duel phase) is a 5-value
   field (0-4), not the 4-value 0-3 the three canonical docs asserted.**
   Corrected in all three.
2. **Promotion-confidence fix applied**: `constants/INDEX.md` had no
   confidence-ladder convention at all (unlike `types/INDEX.md`, which
   already had one); added the same ladder plus one explicit rule —
   per-claim confidence must be stated when it's weaker than the
   document's blanket rating, specifically for any claim asserting a
   *closed* range/enum. Applied to both corrected docs as the worked
   example.
3. **Measurement: at least 3 of 7 checked candidate enums (including
   `f_cf8` itself) show the same failure — this is not a one-off.** Full
   method and per-enum results below. Two of the three additional
   contradictions are backed by already-shipped, matched C (stronger
   evidence than `f_cf8`'s own dossier-only backing) — reported, **not
   fixed**, per the filing scope (measurement, not a fix-everything
   pass).

```
$ python3.13 -m pytest tests -q
3178 passed, 13 skipped, 63 subtests passed in 46.68s
```

No new failures (doc-only change; nothing here touches build inputs).

## Part 1: the `f_cf8` canary, disassembly quoted

Three canonical docs (`docs/research/types/DuelStateSingleton.md`,
`docs/research/constants/DuelStateEnums.md`,
`docs/research/constants/INDEX.md`) asserted a closed `0-3` enum for
`data_ov002_022d016c.f_cf8`, backed by exactly 3 matched files:

```c
/* func_ov002_021ff9a8.c */          if (f_cf8 != 3) { ... }
/* func_ov002_022028ac.c */          if (f_cf8 == 2) { ... }
/* func_ov002_02287618.c (unsigned) */ if ((unsigned)f_cf8 > 1) { ... }
```

All three are equally true if `f_cf8 == 4` — none of them tested a value
≥ 4, so the "3 is the max" half of the claim was never actually verified,
only assumed. Four independent dossiers (real disassembly of the shipped
game binary, not yet promoted to matched C) do test 4 directly:

```asm
; docs/research/dossiers/02212d98.md -- inside the f_cec == player_bit path
ldreq r1, [r1, #0xcf8]
cmpeq r1, #0x4          ; phase == 4
moveq r3, #0x2          ; -> selects a distinct output state (2)

; docs/research/dossiers/0220079c.md -- inside the f_cec == player_bit path
cmp r1, #0x2            ; phase == 2 ...
cmpne r1, #0x4          ; ... OR phase == 4 (classic "a==2||a==4" idiom:
                        ;    2nd cmp only fires if the 1st was unequal)

; docs/research/dossiers/02299c9c.md (found independently this round --
; the kickoff named the 3 above; this 4th one turned up in the same search)
ldreq r1, [r1, #0xcf8]
cmpeq r1, #0x4
moveq r1, #0x7          ; phase == 4 drives a real state transition

; docs/research/dossiers/02206eb0.md -- the one function that excludes it
cmp r0, #0x3
movhi r0, #0x0          ; movhi = unsigned >: if ((unsigned)f_cf8 > 3) return 0;
```

**Verdict: a genuine 5th value, not a rejected transient and not a
wrong-field mapping.** Three of the four dossiers branch on `f_cf8 == 4`
as a first-class success case (a distinct output state, or an "either 2
or 4" gate, or a real sub-state transition) — not a guard against bad
input. The fourth (`02206eb0`) defensively excludes it for one narrow
fast-path, which itself only makes sense if 4 is reachable. All sources —
matched C and dossier alike — agree on the offset, the base struct, and
the semantic category (a phase gate), so this isn't a wrong-field
mapping either.

## Part 2: the promotion-confidence fix

Root cause, as filed: dossiers already carry a per-item `Confidence:
high/med/low` field. Canonical `types/`/`constants/` docs either have no
confidence marking at all, or (per `types/INDEX.md`'s existing
convention) a single *document-level* blanket rating. `f_cf8`'s own
struct (`DuelStateSingleton`) carries "MEDIUM-HIGH (≥12 independent
matched C files)" as its blanket score — genuinely true for most of its
20+ fields, but that blanket score is exactly what let a 3-file,
never-verified-maximal range claim ride along as if it had the same
confidence as the fields with a dozen confirmations. The promotion step
(dossier → canonical doc) has nowhere to carry the *weaker* per-claim
confidence forward, so it silently rounds up.

**Smallest fix applied** (doc-only, reusing existing vocabulary — no new
schema, no new file):

- `docs/research/constants/INDEX.md`: added the same HIGH/MED/LOW ladder
  `types/INDEX.md` already defines, plus one rule: *any claim asserting a
  closed range or enumeration must state its own confidence and source
  count at the claim, not just inherit the document's blanket rating* —
  with `f_cf8` cited as the worked example of what happens when this
  isn't followed.
- `docs/research/types/INDEX.md`: added one cross-referencing sentence
  ("applies per-claim, not just per-document") pointing at the rule
  above, instead of duplicating it.
- Applied concretely to `DuelStateEnums.md` and `DuelStateSingleton.md`:
  the `f_cf8` sections now state MED confidence on the *range* (not the
  document's blanket HIGH), separately from HIGH confidence on the
  field's *shape*, and list matched-C vs dossier evidence separately by
  confidence tier.

Exact diffs: `docs/research/constants/INDEX.md`,
`docs/research/types/INDEX.md`,
`docs/research/constants/DuelStateEnums.md`,
`docs/research/types/DuelStateSingleton.md` (all in this commit).

## Part 3: the measurement — 3 of 7 checked, not a one-off

**Method.** `docs/research/constants/` has 7 content files besides
`INDEX.md` (`BitFlagMasks`, `CardIdRanges`, `DuelStateEnums`,
`EntityTypeTags`, `MainConstants`, `OverlayConstants`,
`OverlayConstantsExtended`). Read all 7 in full and classified every
documented constant by whether it's even *at risk* of `f_cf8`'s specific
failure mode — asserting a **closed, exhaustive** range/enum **inferred
from a small sample** of comparison sites. Excluded as out-of-category
(not because they're unchecked, but because they structurally can't fail
this way):

- **Hardware-fixed enums** individually confirmed one value per dedicated
  file (`Arm9Swi` — 7 BIOS SWI codes, `NdsTimer`/`NdsDma` — 4 each,
  `Ov000Engine` — 2): closed by physical NDS hardware reality and
  multiply/individually confirmed, not sampled.
- **Array-literal-backed tables** (`Ov013Slot`, 0-7): the doc itself
  shows the real `slot_to_cell[8]` array from shipped code — the size
  *is* the evidence, not an inference from scattered comparisons.
- **Explicitly open-ended catalogs** (`BitFlagMasks.md`, `CardIdRanges.md`,
  `EntityTypeTags.md`'s `b6_11` table, `OverlayConstantsExtended.md`'s
  magic-division constants): these say "confirmed values so far" /
  "approximately" / list non-contiguous singles — they never claimed
  closure, so there's nothing for code to contradict.

That left **7 real candidates** sharing `f_cf8`'s exact shape (a small
sequential/sparse int enum, closed by prose, inferred from a handful of
call sites in 1-3 defining functions). For each: read every matched `.c`
file referencing the same base symbol/offset (not just the doc's named
"Confirmed:" functions), looking for an assignment or comparison against
a value outside the documented set.

| Enum | Doc | Documented range | Result |
|---|---|---|---|
| `DuelPhase` (`f_cf8`) | `DuelStateEnums.md` | 0-3 | **CONTRADICTION** — real range 0-4 (Part 1 above; already fixed) |
| `Ov006SubState` | `OverlayConstants.md` | {0,2,3,4,5,6,7,8,9} | **CONTRADICTION** — see below |
| `Ov004Phase` | `OverlayConstants.md` | {0,2,4,15,16} | **CONTRADICTION** — see below |
| `Ov000Facing` | `OverlayConstants.md` | 0-4 | No contradiction found (checked all readers of the defining field; a same-named-but-different `facing` bitfield elsewhere is a distinct symbol, not this one) |
| `Ov011SlotState` | `OverlayConstants.md` | {0,2} (2-bit field) | Inconclusive, not counted as confirmed — the underlying field is a raw 2-bit read that structurally *could* hold 1 or 3, but no caller was found branching on those values (1 only appears as an out-of-range return sentinel, not a stored state) |
| `Ov011ViewMode` | `OverlayConstants.md` | {0,3} (3-bit field) | No contradiction found (both known call sites test only `==3`; did not find a 3rd site) |
| `Ov013Slot` | `OverlayConstants.md` | 0-7 | Excluded — array-literal-backed, see above |

**`Ov006SubState`** (`docs/research/constants/OverlayConstants.md`):
documented as `{0,2,3,4,5,6,7,8,9}` from 9 named functions, one value per
function. Grepping every one of the ~20 matched `.c` files that
reference the 6 parallel state structs (`data_ov006_021cf140` and its 5
siblings) for the state-word assignment turns up 5 more confirmed
values, **all in already-shipped, matched C — stronger evidence than
`f_cf8`'s own dossier-only backing**:

```c
// src/overlay006/func_ov006_021b23c8.c
data_ov006_021cf140 = 0x11;               // 17

// src/overlay006/func_ov006_021b2c9c.c
if (r) data_ov006_021cf140 = 12;          // 12

// src/overlay006/func_ov006_021b28c0.c
case 2: data_ov006_021cf140.f0 = 0xb;     // 11
case 3: data_ov006_021cf140.f0 = 0xe;     // 14

// src/overlay006/func_ov006_021b2cbc.c
*(int *)data_ov006_021cf140 = 16;         // 16
```

Real confirmed set is at least `{0,2,3,4,5,6,7,8,9,11,12,14,16,17}` — 14
values, not 9. Reads less like a small closed state machine and more
like a shared status/mode-code space where the doc's "happy path"
progression (0→2→...→9) is real but only part of the picture; the extra
values look like distinct error/teardown/alternate-route codes from
other subsystems sharing the same word. Not fixed this round — flagged
for a dedicated follow-up with the same rigor `f_cf8` got, since a real
fix here means characterizing what 11/12/14/16/17 each *mean*, not just
widening a range.

**`Ov004Phase`** (`docs/research/constants/OverlayConstants.md`):
documented as `{0,2,4,15,16}` from 3 named functions. A 4th matched file
referencing the same base symbol at the same offset tests a value not in
that set:

```c
// src/overlay004/func_ov004_021d9810.c
char *base = data_ov004_0220b500;
...
if (*(int *)(base + 0x54) != 5) return 0;   // phase == 5, gates the rest of the function
```

Confirmed via the identical base symbol and offset (`+0x54`) the doc's
own 3 named functions use — not a coincidental same-offset different
struct. Real confirmed set is at least `{0,2,4,5,15,16}`. Not fixed this
round, same reasoning as `Ov006SubState`.

**Answer to the filed question**: not "one" (this isn't a `f_cf8`
one-off) and not close to "fifteen" either, on the sample actually
checked. **3 of 7 candidate enums checked show a confirmed
contradiction — a real, reproducible pattern, not an isolated bug** —
with 2 of those 3 backed by matched C rather than dossier-only evidence,
which if anything makes the pattern more concerning than `f_cf8` alone
suggested. This was a manual, targeted sweep of the enums sharing
`f_cf8`'s specific risk shape (~7 of roughly 30 total documented
constant entries across the 7 files) — not an exhaustive pass over every
entry, which is exactly the gap `q-semantic-contradiction-check` is
filed to close mechanically. Recommend it move forward; a 3-of-7 hit
rate on a hand-picked risk category is a strong prior that a full
mechanical sweep finds more.

## Not done this round (explicitly out of scope)

- `Ov006SubState` / `Ov004Phase` doc corrections — found and reported,
  not fixed. Each needs the same disassembly-reading rigor `f_cf8` got
  to characterize the *meaning* of the extra values, not just widen a
  range number.
- The contradiction-checking tool itself (`q-semantic-contradiction-check`)
  — filed separately, gated on this measurement, Codex Scaffolder's lane.
- A full mechanical sweep of all ~30 documented constant entries (only
  the 7 at-risk candidates were checked by hand).
