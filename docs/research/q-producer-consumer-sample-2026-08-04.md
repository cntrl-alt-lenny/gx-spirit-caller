[//]: # (markdownlint-disable MD013 MD041)

# q-producer-consumer-sample — CANARY STOPPED (2026-08-04)

Stratified sample designed: ~13 fields from `DuelStateSingleton.md`
(MED confidence) + 6 fields split across 3 HIGH-confidence docs
(`GlobalData02104bac.md`, `GlobalData02104e6c.md`, `Box.md`) as the
control. **Stopped at the canary, as instructed** — the single HIGH-tier
field checked before touching the other 17 found *zero* producer
evidence anywhere in the accessible corpus, which is itself the result,
not a blocker to work around.

## Sample design

**Control doc selection**: `GlobalData02104bac.md` and
`GlobalData02104e6c.md` (the two "closest structural analogues," per the
filing) each document exactly **one** field with real access evidence —
too small individually to reach 5-6. Rather than fall back to a single
doc, combined the two preferred analogues (1 field each) with `Box.md`'s
4 fields that have confirmed access evidence (`f0`, `f2`, `f6`, `f8` —
`Box.md` itself flags `f4`/`fa` as unaccessed by either of its 2 matched
files, so those 2 are excluded from the control rather than padding the
count with untestable claims): **6 fields across 3 HIGH docs**, weighted
toward the two preferred analogues. `Cell.md` (2 fields) was not needed.

**MED sample**: 13 fields from `DuelStateSingleton.md`'s own "Layout
evidence" table, taken in offset order (`f_ce4`, `f_cec`, `f_d0c`,
`f_d18`, `f_d1c`, `f_d20`, `f_d28`, `f_d2c`, `f_d30`, `f_d34`, `f_d44`,
`f_d4c`, `f_d64`), skipping 6 (`f_d24`, `f_d38`, `f_d48`, `f_d50`,
`f_d54`, `f_d94`) to hit the 12-14 target. `f_cf8` itself excluded —
its answer is already known and including it would inflate the MED
tier's hit rate with a result this whole investigation already used to
motivate the sample, not a fresh data point. Selection was by offset
position, not by expected outcome — no field was chosen or skipped
based on how promising or safe it looked.

**Not reached**: all 13 MED fields, and 5 of the 6 HIGH control fields.

## Method

For a field, "producer evidence" = code that writes to it in a way
consistent with the doc's claimed semantic (a literal store, a masked
read-modify-write, or a bulk fill covering it). "Consumer evidence" =
code that reads/compares/branches on it consistent with the claim.
Verdict categories: **CONFIRMED** (both sides, consistent),
**PRODUCER-ONLY**, **CONSUMER-ONLY** (the `f_cf8`-shaped bug),
**CONTRADICTED** (either side actively disagrees with the claim),
**UNFALSIFIABLE** (the claim is too vague to test on either side — kept
separate from "no evidence found," per the same conflation this item
was filed to avoid repeating).

## CANARY: `GlobalData02104bac.md`, `flags` @ +0x54 (u16)

**Doc's claim**: "Likely a system control / status flags word... Three
independently matched C files define the same typedef and access the
same field at the same offset," listed as `r/w`.

**Consumer evidence — extensive and consistent.** Beyond the doc's own
3 cited files (`func_0200aae4.c`, `func_0200ab28.c`, `func_0200ab6c.c`,
all in `src/main/`, all pure reads testing bits 3 and `0x2f07`), a
broader symbol-reference search found the field read across **at least
12 files spanning main and 8 different overlays** (ov000, ov002, ov004,
ov006, ov009, ov021, ov022, plus the USA-region port of the main
trio) — every one a `ldrh` load immediately followed by a `tst`
bitmask test, several reading it together with the adjacent `+0x56`
field as a coherent 2-word status block (matching an independent
`ov018_core.h` comment: `"input block: +0x54/+0x56 key words"` — itself
a field the doc doesn't document at all).

**Producer evidence — none found**, despite checking every candidate
the search surfaced:

| candidate site | what it turned out to be |
|---|---|
| `func_0200aae4.c` / `_ab28.c` / `_ab6c.c` (doc's own 3) | pure reads, no store |
| `func_020056a4.s` | apparent `strh [r3,#0x54]` — traced back, `r3` had been reassigned to `data_021040ac+0xb00` several instructions earlier; not `data_02104bac` at all |
| `func_ov006_021c2510.s` | apparent `str [r9,#0x54]` — `r9` is the function's own incoming argument (`mov r9,r0`), unrelated to `data_02104bac`; the actual `data_02104bac` register (`r1`) is only ever read (`+0x54`/`+0x56`) |
| `func_ov004_021d7f2c.s`, `func_ov004_021d7c84.s`, `func_ov021_021aab7c.s`, `func_ov022_021aadf0.s`, `func_ov006_021ba364.s`, `func_ov006_021c9efc.s` | same shape every time: load `&data_02104bac`, immediate `ldrh [.,#0x54]`, `tst`, register reused for something unrelated afterward |
| `func_ov002_022b394c.s` | register loaded but the only offset it touches is `+0x52` (a neighboring, undocumented field), not `+0x54` |
| `func_0200aac8.c` (USA-region port of `func_0200aae4`) | same pure-read shape, region-local symbol name (`data_02104acc`, not `data_02104bac` — USA's layout shifts the address) |
| raw-hex `0x02104bac` search (catches non-symbol references) | no additional hits beyond the symbol-name search — not a naming-convention blind spot |

**Two false-positive producer sites found and resolved** (documented so
a future pass doesn't recount them): both were the *exact* same failure
mode as `f_cf8`'s save/restore false-positive — a `str`-to-the-right-
offset that traces back to a completely different base register,
coincidentally sharing the `+0x54` digit. Register provenance has to be
traced through to the actual load of `&data_02104bac`, not just matched
by nearby offset text, or the count is wrong in the optimistic direction.

**Verdict: CONSUMER-ONLY — and a different shape of the bug than
`f_cf8` had.** `f_cf8` had *some* producer evidence, just not for every
value consumers expected. Here there is a HIGH-confidence field with
**abundant, convergent, semantically-consistent consumer evidence and
zero producer evidence anywhere in the accessible corpus** — not "the
producer we found doesn't cover every case," but "no producer was found
at all." Three live hypotheses, none chased further this round: (a) a
not-yet-matched startup/init function sets it directly, (b) it's
hardware-latched or SDK-managed rather than assigned by game code (a
"system control/status" NDS word is a plausible candidate for this),
or (c) it's set via a bulk `Fill32`/struct-copy that a scalar-store
search wouldn't catch even if it were in the matched corpus.

## Why this stops the sample here

The brain's own condition: *"If you cannot establish producer-side
evidence for a single HIGH-marked field using the method you built
last round, the method does not transfer off enums and I would rather
know that after one field than after eighteen."*

That's what happened, and it's worth being precise about *why*, because
it's not simply "this field has thin evidence" (which the confidence
ladder already half-predicts and would be a weak finding on its own,
exactly as flagged going in). It's a **method-shape mismatch**: the
`f_cf8` producer sweep worked because "producer" for a small-int enum
has a crisp definition — somewhere a literal integer gets stored to the
field, and that's a greppable, traceable thing (modulo the register-
provenance care this canary also needed). For a **bitmask/flags** field,
"producer" doesn't have that crisp shape — a masked read-modify-write,
a bulk fill, a hardware latch, or an SDK call could all legitimately set
it without ever appearing as "the literal 0x8 gets stored to +0x54."
The search I ran can rule out the *literal-store* shape of producer, but
it cannot rule out the others without a fundamentally different
detection method per producer-shape — which means "zero producer
evidence found" here is a weaker, more method-dependent claim than
"zero producer evidence found" was for `f_cf8`'s value `4`.

**This generalizes past this one field**: any future producer-vs-
consumer audit needs to state up front which producer *shapes* it can
detect (literal store, masked RMW, bulk fill, ...) and which it can't,
rather than reporting "no producer found" as if the search covered all
of them. That's a real, useful, transferable finding — just not the one
the sample set out to measure (MED-vs-HIGH hit rate), and reported
plainly as that rather than stretched to cover the original question.

## What this does NOT answer

The original question — was `f_cf8` a localized MED-doc defect or a
corpus-wide pattern — is **still open**. This canary result doesn't
move that needle either direction: it's a different failure shape on a
different kind of field, not a second data point on the same question.
Answering the original question properly needs either (a) a producer-
detection method broadened to cover masked-RMW and bulk-fill shapes
before resuming this sample, or (b) restricting the sample to small-int
discrete-value fields only (where the `f_cf8` method's crisp definition
of "producer" actually applies) — a design choice for whoever scopes
the next attempt, not one made here.

## Gate

Doc-only, no source changes.

```
$ python3.13 -m pytest tests -q
```

(see queue entry for pasted output)
