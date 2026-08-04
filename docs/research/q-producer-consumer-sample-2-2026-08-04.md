[//]: # (markdownlint-disable MD013 MD041)

# q-producer-consumer-sample-2 — restricted sample, both tiers clean (2026-08-04)

Repair of `q-producer-consumer-sample`: same stratified design, control
selected for method compatibility (discrete small-int fields) instead
of structural analogy. **Canary passed. Full sample run: 19 fields (13
MED + 6 HIGH), zero contradictions in either tier, two honest
producer-only gaps (one per tier), no unfalsifiable claims.** The
original localized-vs-systemic question gets a real, if partial,
answer — see "What this answers" below — not a third non-answer.

## Restated method (load-bearing this run)

**Producer** = code that assigns the field a value via (a) a literal
integer constant store, (b) a caller-argument-plus-fixed-offset store
(`field = arg + 0xd`), or (c) a well-defined arithmetic op on the
field's own prior value (increment, decrement, reset-to-literal) — the
new value must trace to a single, discrete, code-visible source.
**Explicitly excluded from "producer" in this run**: masked
read-modify-write against other bits in the same word, runtime-opaque
handle/pointer values, and bulk/DMA fills — those are the shapes that
sank the first attempt's canary, and this run's control was screened to
avoid them rather than pretend to detect them.

**Consumer** = code that reads the field and uses it in a way
consistent with the doc's claim, via an equality/range comparison, a
switch/computed-jump dispatch, or an array index — with the read
register traced back to a genuine load of the field's own base address
(not a coincidentally-same-offset different base — the false-positive
trap from both prior rounds).

**Verdict categories**: CONFIRMED (both sides found, consistent with
the claim — including when the doc itself only claims one side, e.g.
"read", and evidence matches exactly that), PRODUCER-ONLY / CONSUMER-ONLY
(the doc's own table claims `r/w` but only one side was found within
the depth searched — a gap, not a contradiction), CONTRADICTED (either
side actively disagrees), UNFALSIFIABLE (claim too vague to test).

## Sample composition

**MED (13, `DuelStateSingleton.md`)**: `f_cec`, `f_d0c`, `f_d1c`,
`f_d20`, `f_d24`, `f_d28`, `f_d2c`, `f_d30`, `f_d34`, `f_d38`, `f_d44`,
`f_d4c`, `f_d64` — the doc's own field list restricted to discrete
small-int fields, dropping `f_cf8` (already resolved, would inflate the
count with a known answer), `f_ce4` (a packed u16 pair, not a discrete
value), and `f_d18` (a function pointer). 6 skipped (`f_d24` kept;
`f_d38`, `f_d48`, `f_d50`, `f_d54`, `f_d94` not sampled) to hit the
12-14 target without cherry-picking by expected outcome.

**HIGH control (6, across 2 docs, both after screening)**:
`BgCfg.md`'s `fc` and `f10` — its OTHER 3 fields turned out to fail the
SAME shape test that sank the first canary: `f0` is a runtime handle
returned by a loader call (not a discrete value at all), `f14`/`f18`
are masked-bitfield words (priority nibble + mosaic bit, same shape as
the flags-word observation). Filed separately below, not counted.
`Box.md`'s `f0`, `f2`, `f6`, `f8` (its own `f4`/`fa` already excluded by
the doc itself as unaccessed) made up the remaining 4 to reach the
5-6 target — the fallback the filing anticipated, invoked because
`BgCfg` alone yielded only 2 qualifying fields, not because `BgCfg` was
wrong to pick; it was the right structural analogue and the wrong
method-compatibility screen, exactly as diagnosed.

**Region note**: `BgCfg.md`'s and `Box.md`'s own cited addresses exist
only under `src/usa/`/`src/jpn/` in the current tree, not EUR baseline
— checked via the region ports (noted, not chased further; a possible
address-renumbering or a doc written from a non-EUR dump, out of scope
here).

## CANARY: `BgCfg.f10` (HIGH)

**Doc's claim**: "tile count or map mode," written by all 5 producer
files documented, `u16`.

**Producer**: `func_ov020_021aab98` (USA) — `cfg.f10 = 0x1a0;`, a clean
literal, alongside a sibling `func_ov020_021aa908` — `cfg.f10 = 0x180;`.
Two independent literal values, both clean.

**Consumer**: the real receiving callee, `func_0201e564` (USA,
`src/usa/main/func_0201e564.s` — still raw `.s`, read directly):

```asm
mov sl, r0              ; sl = &cfg (the incoming BgCfg*)
...
ldrsh r0, [sl, #0x10]    ; r0 = cfg.f10
cmp r0, r4               ; r4 = mvn r4,#0x0 = -1
beq .L_80c               ; skip this branch if f10 == -1 ("unset" sentinel)
```

**Verdict: CONFIRMED**, with a refinement on the doc's guess — `f10`
reads more precisely as an optional size/threshold parameter with a
`-1` "not specified" sentinel (specifically consulted while processing
a `"PALT"` palette chunk), not exactly "tile count or map mode" — the
doc's own hedged "or" framing already anticipated this kind of
imprecision, so this is a refinement, not a contradiction. **Canary
passed**: producer and consumer both traceable on a HIGH-marked,
properly-typed small-int field. Proceeding to the full 19.

## Per-field table

| tier | field | doc claim | producer | consumer | verdict |
|---|---|---|---|---|---|
| HIGH | `BgCfg.f10` | tile count/map mode | `cfg.f10=0x1a0` / `=0x180` (2 literals) | `ldrsh[sl,#0x10]; cmp,#-1` sentinel gate | CONFIRMED (refined) |
| HIGH | `BgCfg.fc` | map/tile base (extended variant) | `cfg.fc=0` / `=0x20` (2 literals) | not found in the immediate consumer (`func_0201e564` reads `[r1,#0xc]` where `r1`=`cfg.f0`'s *pointee*, not `cfg` itself — the same false-positive shape both prior rounds hit, caught before miscounting) | PRODUCER-ONLY |
| HIGH | `Box.f0` | x1/left | `local.f0 = src->f0 + dx` (copy-forward + offset) | `cfg[0] = box->f0 << 12` (Q12 fixed-point coordinate) | CONFIRMED |
| HIGH | `Box.f2` | y1/top | `local.f2 = src->f2 + dy` | `cfg[1] = box->f2 << 12` | CONFIRMED |
| HIGH | `Box.f6` | y2/height | `local.f6 = src->f6` (verbatim copy) | passed as a size arg to `func_0201e910`'s `s3` param | CONFIRMED |
| HIGH | `Box.f8` | extra extent/right | `local.f8 = src->f8` (verbatim copy) | passed as a size arg to `func_0201e910`'s `s2` param | CONFIRMED |
| MED | `f_cec` | card-list slot idx → `data_ov002_022cd744[]` | not found (4 files checked, all read-only) | `data_ov002_022cd744[dss->f_cec]` array index (4 files) | CONFIRMED (doc itself claims `read` only — matches) |
| MED | `f_d0c` | gate flag, `==0` blocks main loop | not found | `f_d0c == 0` gate (2 files) | CONFIRMED (doc claims `read` only — matches) |
| MED | `f_d1c` | dispatch-table-2 index | `f_d1c++` increment | `data_ov002_022ca998[f_d1c]` array index, same function | CONFIRMED |
| MED | `f_d20` | switch idx, 0-8 inner / 0-0x1E outer | many literals (`=0,2,3,7,0xa,0x14,0x15,0x1e,+1,-1`) across 2 files | two separate 9-way and 0x1E-way computed-jump switches, exact match | CONFIRMED (richly) |
| MED | `f_d24` | secondary sub-state counter | reset-to-0 + increment (2 files) | 3-way switch (`==0/1/2`) + `>=0x2a` bound check | CONFIRMED |
| MED | `f_d28` | slot-iteration counter, 0-10 | increment (2 files) | `>=0xa`(10) bound check, exact match to "0-10" | CONFIRMED |
| MED | `f_d2c` | dispatch-table-3 idx, init=6, max=9 | `=6` init + increment, exact match | `data_ov002_022cb96c[f_d2c]` index + `>=9` bound check, exact match | CONFIRMED (richly, exact) |
| MED | `f_d30` | dispatch active flag, 1=new/0=complete | `=1` / `=0` literals, exact match to doc | not found in files checked | PRODUCER-ONLY |
| MED | `f_d34` | guard flag, cleared on `f_d2c` reset | `=0` (3 sites) | `!=0` guard read, same file | CONFIRMED |
| MED | `f_d38` | compared to 6 | not found | `==6`, exact match, single-purpose function | CONFIRMED (doc claims `read` only — matches) |
| MED | `f_d44` | action code, 3=yield/5=advance | `=3` / `=5` literals, exact match | `==3`/`==5` read-back, same file | CONFIRMED (exact, both sides in one function) |
| MED | `f_d4c` | guard flag, nonzero=skip | not found | ternary test (`f_d4c ? f_d48 : 0`) | CONFIRMED (doc claims `read` only — matches) |
| MED | `f_d64` | `arg+0xd`, compared to `0xb` | `= arg + 0xd`, exact match | `==0xb`, exact match (one file); a *different* function (`func_ov002_02262994.s`, not among the doc's own cited sources) separately compares it to `0xc` — a refinement worth a future look, not chased further here | CONFIRMED (exact on the doc's own citation; see note) |

## Hit rate by tier

```
HIGH:  5 CONFIRMED / 6  (83%) — 1 PRODUCER-ONLY (BgCfg.fc), 0 contradicted, 0 unfalsifiable
MED:  12 CONFIRMED / 13 (92%) — 1 PRODUCER-ONLY (f_d30),    0 contradicted, 0 unfalsifiable
```

**Zero contradictions in either tier.** Zero unfalsifiable claims —
every field in this restricted sample made a concrete, testable claim
(unlike the concern raised going in that a control could pass trivially
on tautological claims; neither `BgCfg` nor `Box`'s surviving fields
were tautological, and neither `DuelStateSingleton`'s were). The two
gaps (one per tier) are the same shape: producer confirmed, consumer
not found within the depth actually searched (1-2 call hops) — filed as
gaps, not contradictions, because absence of a *found* consumer is a
statement about the search, exactly as the first attempt's core lesson
established.

## Filed observation, not a finding: the flags-word shape recurs

`BgCfg.f0` (runtime handle, not discrete), `f14`/`f18` (masked
bitfields: a priority nibble and a mosaic bit packed into `f14`, a
char-base sub-field in `f18`, values `0/2/3/8` and `0x8000/0xc000`/
cleared observed across the 5 producer files) — excluded from the
sample entirely, not tested, not counted toward the hit rate. This is
the third time this shape has appeared (`GlobalData02104bac.flags`,
now two more fields in a doc hand-picked for the opposite property).
**Filed as an observation for whoever scopes producer-detection
broadening, not resolved or counted here**: it may be entirely
legitimate (masked RMW is a completely normal, common C idiom — nothing
here suggests these two fields are *wrong*, only that the narrow
producer method can't evaluate them). Consistent with the instruction
not to let it colour this round's hit rate, and it doesn't — the 5/6
and 12/13 figures above are computed only over the fields the narrow
method could actually evaluate.

## What this answers

**Real signal, not a third non-answer, though not absolute proof
either.** In a sample restricted to the shape the method can actually
evaluate, neither tier produced a contradiction — both MED and HIGH
came back similarly clean (83% and 92% fully confirmed, the remainder
a gap rather than a contradiction in both cases). That's evidence
*against* "the producer-consumer gap is systemic across ordinary
small-int fields regardless of confidence tier." It's also consistent
with a narrower, still-useful reading: `f_cf8` is explicitly documented
as *"the most frequently tested field in the entire singleton"* — an
outlier by call-site density, not a representative median field in
either tier. A field with dozens of call sites has far more
opportunity for an untested value to surface than a field with 2-4.
Under that reading, the risk isn't randomly systemic — it concentrates
in exactly the highest-traffic fields, which are also the fields most
worth double-checking anyway. Both readings are stated because the
sample (19 fields, 3 docs) doesn't distinguish between them; either
would recommend the same next step: prioritize a producer-consumer
recheck on the *next*-most-tested fields per confidence doc, not a
uniform sweep.

## Gate

Doc-only, no source changes.

```
$ python3.13 -m pytest tests -q
```

(see queue entry for pasted output)
