[//]: # (markdownlint-disable MD013 MD041)

# cm-f-cf8-reopen + cm-enum-contradiction-fix (2026-08-04)

Repair round for [PR #1441](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/1441)
(merged), reopened by brain-side verification. Covers both queue items
together — same sweep, same producer-vs-consumer method, per the filing
instruction not to split them. Doc-only, no build, no source changes.

## Result

1. **The `f_cf8` range was still wrong.** The 2026-08-03 fix corrected an
   assumed `0-3` to an assumed `0-4` — the same class of error the item
   existed to diagnose, one value later. Corrected to an **open
   observed-value set**: `{0,1,2,3,4,5,7}` confirmed, no proven upper
   bound. All 3 canonical docs and the original report corrected.
2. **The denominator was wrong.** The survey reported "3 of 7," but
   `Ov013Slot` was already excluded by the survey's own stated method
   (array-literal-backed) — restated as **3 of 6**.
3. **`Ov006SubState` and `Ov004Phase` fixed with the same method.**
   `Ov006SubState`: real producer set is 14 values, not the documented
   9 (`{0,2-9}` → confirmed stored `{2,3,4,5,6,7,8,9,11,12,14,15,16,17}`).
   `Ov004Phase`: 2 of the documented 5 values (`5`, `15`) are
   consumer-only — never found as a stored literal, structurally
   identical to `f_cf8`'s own `4`.
4. **Remaining 3 candidates re-verified as "unexercised," not
   "clean."** `Ov000Facing`, `Ov011SlotState`, `Ov011ViewMode` all
   turned out to be set via **argument-forwarding or untraced callers**,
   not fixed literals in the functions originally checked — the earlier
   "no contradiction found" verdict was real but shallow (comparison
   sites only, no producer trace). Restated honestly below.

```
$ python3.13 -m pytest tests -q
3178 passed, 13 skipped, 63 subtests passed in 46.68s
```

No new failures (doc-only change).

## Part 1: `f_cf8` — the producer sweep, done properly this time

**Method**: every `str` instruction targeting `+0xcf8` in
`src/overlay002/*.s` and `src/overlay002/*.c` (EUR only — `src/usa/` and
`src/jpn/` port files are independently renamed per-region and were not
re-traced this round), traced backward to the immediate that fed the
stored register. A small scratch script did the mechanical backward-scan
(not committed — `tools/` stays Codex Scaffolder's lane per the original
filing); every hit below was manually read in context afterward, which is
how the two nuances in the "gotchas" section were caught.

**CANARY, run before touching any doc**: the brain-side trace cited two
specific sites as examples — `func_ov002_021aec04.s:176` for value `5`
and `func_ov002_021af5a0.s:229` for value `7`. Both reproduced exactly,
same file, same line number, same value:

```asm
; func_ov002_021aec04.s:175-176
mov r1, #0x5
str r1, [r0, #0xcf8]

; func_ov002_021af5a0.s:228-229
mov r5, #0x7
str r5, [r4, #0xcf8]
```

Canary passed — proceeding to the full sweep and the doc corrections.

**Full producer sweep (EUR)**:

| stored value | store sites found | example |
|---|---|---|
| 0 | 4 | `func_ov002_022b809c.s:139` |
| 1 | 1 | `func_ov002_021aec04.s:149` |
| 2 | 1 | `func_ov002_021aec04.s:157` |
| 3 | 2 | `func_ov002_021aec04.s:166`, `func_ov002_021cacf0.s:129` |
| 5 | 1 | `func_ov002_021aec04.s:176` |
| 7 | 3 | `func_ov002_021af5a0.s:229`, `func_ov002_021d109c.s:32`, `func_ov002_021ae7b8.s:60` |

**4 is never a stored immediate anywhere in this sweep.** Every
occurrence against this field is the consumer-side `cmpeq r1, #0x4`
already documented in the 4 dossiers (`02212d98.md`, `0220079c.md`,
`02299c9c.md`, `02206eb0.md`). Kept in the observed-value set anyway:
3 of those 4 dossiers branch on `==4` as a first-class success case
(a distinct output state, an "either 2 or 4" gate, a real sub-state
transition), not a defensive guard — real, live code expects to reach
that comparison and take the equal branch, which means some producer
sets it to 4 somewhere this sweep didn't reach.

**This producer/consumer disagreement is the finding, not a loose end.**
It means a literal-`str`-tracing sweep is structurally incomplete on its
own, independent of how carefully it's done, because at least two other
producer *shapes* exist for this exact field:

- **Argument forwarding** — `func_ov002_021d1158.s`:
  ```asm
  mov r4, r0          ; r4 = the function's OWN incoming argument
  ...
  str r4, [r0, #0xcf8]  ; store whatever the caller passed, not a literal
  ```
  This function's callers were not traced this round; whatever literals
  *they* pass are part of the true value set and this sweep can't see
  them without following the call graph further.
- **Save/restore** — `func_ov002_021cacf0.s`:
  ```asm
  ldr r0, [r1, #0xcf8]      ; read current value
  str r0, [sp, #0x4]        ; save it
  mov r0, #0x3
  str r0, [r1, #0xcf8]      ; temporarily force 3
  ...                        ; (other work)
  ldr r0, [sp, #0x4]         ; reload the saved value
  str r0, [r1, #0xcf8]      ; restore it
  ```
  The final store isn't a new literal producer — it's whatever the field
  already held. A naive version of this sweep initially flagged this
  site as "unresolved" (couldn't trace an immediate within the backward
  scan window); recorded here explicitly so a future pass doesn't
  mistake a restore for evidence of a new distinct value.

**Open discrepancy, stated rather than quietly picked**: the brain-side
trace reported 2 store sites for value `1` and 2 for value `7`; this
sweep (EUR only) found 1 and 3 respectively. Both traces agree exactly
on the cited example sites for `5` and `7` (same file, same line), and
agree that `4` is never a literal producer. The count difference on `1`
and `7` is unresolved — plausibly a USA/JPN-only site (this sweep didn't
check those regions; their files are independently renamed per-region
port and require a separate pass, not attempted here) or a
methodological difference in what counts as a distinct "site." Not
chased further — flagged honestly rather than presenting either number
as settled, which is exactly the failure mode this whole item exists to
avoid repeating a third time.

**Corrected framing, applied to all 3 canonical docs**:

```
confirmed values include 0, 1, 2, 3, 4, 5 and 7;
complete range and semantic names are not yet established.
```

Exact edits: `constants/DuelStateEnums.md` (full section rewrite, both
the "Duel phase" block and the "Notes for C-matching" line),
`constants/INDEX.md` (2 rows), `types/DuelStateSingleton.md` (struct
comment, evidence table row, and the full "duel-phase field" section —
producer-sweep table inserted, verdict rewritten to drop closure
language entirely).

## Part 2: the denominator — 3 of 6, not 3 of 7

The original survey's own methodology section explicitly excluded
`Ov013Slot` as "array-literal-backed" — the doc shows the real
`slot_to_cell[8]` array from shipped code, so the size *is* the evidence,
not an inference from sampled comparisons (the same category as the
hardware-fixed enums, which were correctly excluded from the count).
`Ov013Slot` should never have been in the "7 candidates checked"
denominator in the first place; it was inconsistent bookkeeping, not a
missed 7th in-category candidate. No genuine 7th candidate was found
this round either — restated as:

**3 of 6** genuine at-risk candidates checked contradicted:
`DuelPhase`/`f_cf8`, `Ov006SubState`, `Ov004Phase`. `Ov000Facing`,
`Ov011SlotState`, `Ov011ViewMode` did not contradict in what was
checked — see Part 4 for why that's a different claim from "verified."

## Part 3: `Ov006SubState` and `Ov004Phase` — the same method applied

### `Ov006SubState` (`data_ov006_021cf140`, `docs/research/constants/OverlayConstants.md`)

**Method**: every assignment to the state word across all 20 matched-C
files reading `data_ov006_021cf140`, in every syntactic form the codebase
actually uses (`bare = N`, `.f0 = N`, `[0] = N`, `*(int*)ptr = N`) — the
original `cm-f-cf8-contradiction` survey's own re-check of this enum only
matched 2 of the 4 forms and undercounted by 2 values (`3` and `15`) as
a direct result; fixed this round by checking all 4 forms.

| value | file | form |
|---|---|---|
| 2 | `func_ov006_021b2324.c` | `data_ov006_021cf140[0] = 2;` |
| 3 | `func_ov006_021b2804.c` | `data_ov006_021cf140[0] = 3;` |
| 4 | `func_ov006_021b26e0.c` | `*(int *)data_ov006_021cf140 = 4;` |
| 5 | `func_ov006_021b2d5c.c` | `*(int *)data_ov006_021cf140 = 5;` |
| 6 | `func_ov006_021b2970.c` | `if (r) data_ov006_021cf140 = 6;` |
| 7 | `func_ov006_021b287c.c` | `*(int *)data_ov006_021cf140 = 7;` |
| 8 | `func_ov006_021b28c0.c` | `data_ov006_021cf140.f0 = 8;` (case 1) |
| 9 | `func_ov006_021b2b08.c` | `if (r) data_ov006_021cf140 = 9;` |
| 11 | `func_ov006_021b28c0.c` | `data_ov006_021cf140.f0 = 0xb;` (case 2) |
| 12 | `func_ov006_021b2c9c.c` | `if (r) data_ov006_021cf140 = 12;` |
| 14 | `func_ov006_021b28c0.c` | `data_ov006_021cf140.f0 = 0xe;` (case 3) |
| 15 | `func_ov006_021b2de0.c` | `data_ov006_021cf140[0] = 0xf;` |
| 16 | `func_ov006_021b2cbc.c` | `*(int *)data_ov006_021cf140 = 16;` |
| 17 | `func_ov006_021b23c8.c` | `data_ov006_021cf140 = 0x11;` |

14 confirmed stored values, all in already-shipped matched C — stronger
evidence than `f_cf8`'s own dossier-only backing. `0` has no confirmed
explicit store to the state word specifically (may be the implicit
BSS-zero default; unconfirmed either way). Corrected doc states the
open set, drops the `typedef enum`, and explicitly flags that the other
5 parallel structs sharing this layout were **not** independently
re-swept this round.

### `Ov004Phase` (`data_ov004_0220b500+0x54`, same file)

**Method**: every assignment AND every comparison to the same base
symbol + offset, across all 33 matched-C files referencing
`data_ov004_0220b500`, explicitly separated into two columns instead of
one — the original documentation (both before and after the
2026-08-03 pass) conflated the two.

Stored (producer-confirmed):

| value | file |
|---|---|
| 2 | `func_ov004_021d7c00.c` |
| 4 | `func_ov004_021d7c00.c`, `func_ov004_021d1264.c` |
| 16 | `func_ov004_021d1360.c` |

Compared only, never found stored (consumer-only — structurally
identical to `f_cf8`'s `4`):

| value | file |
|---|---|
| 5 | `func_ov004_021ceb6c.c`, `func_ov004_021d9810.c` (2 independent functions) |
| 15 | `func_ov004_021d13dc.c` |

`15` was already resting on comparison-only evidence in the version of
this doc that predates this whole item — nobody had flagged that
distinction before. `5` is the value this round's re-check found; two
unrelated functions both gate on `phase == 5`, which only makes sense if
something stores it somewhere neither has been traced to yet. Corrected
doc separates stored vs. compared-only explicitly and drops the
`typedef enum`.

## Part 4: the remaining 3 — "unexercised," not "clean"

The original survey's "no contradiction found" verdict on
`Ov000Facing`, `Ov011SlotState`, and `Ov011ViewMode` was **real but
shallow** — it checked comparison sites and the one function each doc
cited as the "definer," but never traced where the field's *value*
actually comes from. Re-checked this round with a producer lens:

- **`Ov000Facing`** (`func_ov000_021aa7e0(int facing)`): the field is
  set from the function's own **parameter** (`obj->facing =
  (short)facing;`), not a fixed literal. Its 3 found callers
  (`func_ov000_021aa898.c`, `021aa9cc.c`, `021aaa58.c`) all pass the
  literal `1`. The doc's other documented values (`0`, `2`, `3`, `4`)
  have **no confirmed caller passing them** in this search — `3` and `4`
  only appear as comparisons *inside* the setter itself (checking the
  incoming/outgoing value against those constants, not producing them).
- **`Ov011SlotState`**: the 2-bit field is written via
  `*p = (*p & ~0x3u) | (val & 0x3u)` in `func_ov011_021ccad8.c` — `val`
  is a caller-supplied argument, same argument-forwarding shape as
  `f_cf8`'s own blind spot. Its callers were not traced.
- **`Ov011ViewMode`**: no write site to the `+0x27c` field was found at
  all in the files checked — only the 2 known `==3` read/compare sites.

**Verdict: all 3 are unexercised, not verified.** No contradiction was
found, and none should be claimed as "closed" or "clean" either — the
honest status is "not enough producer evidence gathered to say
anything," which is a materially different, weaker claim than the
original survey implied by grouping them with "no contradiction found."
This is the same distinction the `f_cf8` root cause turned on, now
applied to the survey's own remainder instead of just its headline case.

## Not done this round (explicitly out of scope)

- USA/JPN producer re-trace for `f_cf8` (the count discrepancy on values
  `1` and `7` is unresolved, not silently picked).
- Tracing `func_ov002_021d1158`'s callers, `func_ov011_021ccad8`'s
  callers, or `func_ov000_021aa7e0`'s full caller set beyond the 3 found
  — each is a real, separate investigation.
- Re-sweeping `Ov006SubState`'s other 5 parallel structs
  (`data_ov006_0224f1b0`/`_1fc`/`_248`/`_290`/`_2e8`).
- The contradiction-checking tool (`q-semantic-contradiction-check`) —
  still Codex Scaffolder's lane, still gated on the measurement, which
  this round revised to 3-of-6.
