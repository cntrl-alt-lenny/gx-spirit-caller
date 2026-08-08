# cm-field-recheck-1 — producer/consumer lens on the next-most-tested fields (2026-08-06)

Executes `q-producer-consumer-sample-2`'s own stated next step: "prioritize
a producer-consumer recheck on the *next*-most-tested fields per confidence
doc, not a uniform sweep." Ranked via `tools/field_exposure_census.py`,
restricted to `docs/research/types/`.

## Result

**5 of 5 ranked, method-compatible, not-yet-audited fields CONFIRMED**
(2 with genuine refinements to the doc's claim — `f_5a8` and `f_5b4` —
richer than a simple correction in both cases). Zero contradictions,
zero gaps this round. Two real
methodology gaps found in the ranking tool itself along the way — see
Part 1 — which is why the candidate pool ended up smaller and more
tightly curated than a naive top-N read of the tool's raw output would
have produced.

## Part 1: two real gaps in `field_exposure_census.py`, found before trusting its ranking

Per this project's standing "read the metric's own source before
measuring against it" rule (validated repeatedly in the `.bss`/data-carve
lane), read the tool's actual source before using its raw output.

### Gap A — no base-symbol anchoring for `.s` (unmatched assembly) files

`_relevant_source()` restricts candidate files by MODULE (via a
`data_ovNNN_...` base-symbol regex) but the per-file `.s` match itself
(`_source_matches_field`) checks only for `[reg, #0xNN]` at the
documented offset — **no check that `reg` is ever loaded from the
field's own base symbol.** For docs with **no detected base symbol at
all** (11 of 22 type docs: `Box.md`, `BytecodeVMState.md`,
`GameSingleton.md`, and 8 others — mostly structs accessed via a getter
call, a `self` pointer, or a function parameter rather than a fixed
global address), `_relevant_source` falls back to "every matched file in
the tree," and the offset-only `.s` match then produces **cross-doc
contamination**: multiple unrelated structs sharing a same-offset,
same-name field (`f4` at `+0x4`, etc.) get *identical* read/write counts
in the raw census output (e.g. `Box.md`, `BytecodeVMState.md`,
`GameSingleton.md`, `GlobalAudioState.md` all show `f4 @ 0x4 = 1702/1440`
— literally the same numbers, because none of the 4 has a real base
symbol to anchor the search). These 11 docs were excluded from the
candidate pool entirely; their raw census numbers are not meaningful
rankings.

Even among docs **with** a real base symbol, small/common offsets
(`0x0`–`0x20`ish) remain collision-prone for the same reason (many
unrelated structs have *something* at `+0x4`); large, distinctive
offsets (`0x5a8`, `0xd50`, `0xd9c`) are much safer, and spot-checking
~10 of `f_5a8`'s 230+ claimed `.s` sites confirmed all were genuine
(register-traced back to `data_ov002_022ce288`), not contamination —
offset distinctiveness, not just base-symbol presence, is what actually
predicts trustworthiness.

### Gap B — hex-only matching misses the codebase's own decimal-offset field-naming convention

Independent research passes over the years named the same physical field
two different ways depending on when/how a given `.c` file was matched:
`docs/research/types/DuelQueueState.md` documents `f_5b4` (hex-derived);
several already-matched consumer files instead declare a *local*,
self-contained struct with a *decimal*-derived name for the identical
offset (`f1472` for `+0x5c0`, `f1492`/`f1484`/`f1488`/`f1496` for
`+0x5d4`/`+0x5cc`/`+0x5d0`/`+0x5d8`, `+ 1460` as a raw literal for
`+0x5b4` in `func_ov002_021f85f8.c`) — this project's own established
per-TU self-contained-struct convention, just predating (or independent
of) the canonical doc's own naming. `field_exposure_census.py`'s member
regex requires the *exact* documented name, and its raw-offset regex is
hex-only (`0x{offset:x}`) — both silently miss every decimal-named or
decimal-literal site. This is a real **undercount** (false negatives),
the opposite failure direction from Gap A. Not chased down exhaustively
for every field in this wave (would require a full decimal-alias sweep
per field), but confirmed directly for 3 of this wave's 5 fields while
tracing consumers by hand — each case added genuine extra evidence the
tool's own count had missed.

Neither gap is fixed in this wave (out of scope — this item is a field
audit, not a tool-hardening item); filed here for whoever next touches
`field_exposure_census.py`.

## Part 2: candidate selection

After excluding the 11 base-symbol-less docs (Gap A) and re-deriving the
ranking restricted to the remaining 11, the top not-yet-audited
**method-compatible** fields (discrete small-int; pointer/handle fields
`f_48c`/`f_5ac` excluded per the standing producer definition; no
flags/bitmask fields reached the cutoff) were:

| rank | field | doc | total exposure (tool's raw count) |
|---|---|---|---:|
| 1 | `f_5a8` | DuelQueueState | 274 |
| 2 | `f_5b4` | DuelQueueState | 58 |
| 3 | `f_5d4` | DuelQueueState | 36 |
| 4 | `f_d50` | DuelStateSingleton | 24 |
| 5 | `f_d9c` | DuelStateSingleton | 19 |

`DuelStateSingleton.md`'s other 13 fields were already sampled in
`q-producer-consumer-sample-2`; `f_cf8` is excluded there as already
resolved. `DuelQueueState.md` is a doc `q-producer-consumer-sample-2`
never touched at all.

## CANARY: `DuelQueueState.f_5a8`

**Doc's claim**: "queue state: 0x80 = active, 0x7f = done," a two-value
handshake, citing `func_ov002_0222b2e0.c` (reads `==0x7f`) and
`func_ov002_0223483c.c` (reads `==0x80`) as read-only sites.

**Producer** — `func_ov002_022699a4.s` (still ship-as-.s), two real
write sites, register-traced to `data_ov002_022ce288` via `_LIT0`:

```asm
.L_4bc:                        ; entering active state
    ldr r1, _LIT0
    mov r4, #0x80
    str r4, [r1, #0x5a8]       ; literal 0x80 -- matches doc exactly
    ...
.L_4f0:
    bl func_ov002_02257cfc     ; call, result in r0
    ldr r1, _LIT0
    cmp r0, #0x0
    str r0, [r1, #0x5a8]       ; the CALL'S RETURN CODE, not a fixed literal
```

**Consumer** — both doc-cited files re-verified fresh (not just trusted):

```c
/* func_ov002_0222b2e0.c */
switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
case 0x80: func_ov002_021e276c(...); return 0x7f;
case 0x7f: func_ov002_022101c4(); break;
}
/* func_ov002_0223483c.c */
switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
case 0x80: if (func_ov002_0220e518() != 0) return 0x7f; break;
case 0x7f: func_ov002_0226ad5c(self->bit0, 1, 0, 0); break;
}
```

**Verdict: CONFIRMED, with a refinement.** The doc's "0x7f/0x80
handshake" is accurate as far as it goes, but both consumers are real
`switch`-dispatchers that fire a *different* callback for each of the
two states (not a passive "wait for done" read), and the producer side
shows the field can also briefly hold `func_ov002_02257cfc`'s raw return
code (0 on the success path observed) before being overwritten again —
a third value in the field's real range that the doc's simple two-value
framing doesn't capture. Not traced deeper into `func_ov002_02257cfc`
itself (beyond this wave's stated 1-2 hop depth). Canary passed —
proceeding to the remaining 4.

## Per-field table

| field | doc claim | producer | consumer | verdict |
|---|---|---|---|---|
| `DuelQueueState.f_5a8` | 0x7f/0x80 handshake | `func_ov002_022699a4.s`: literal `0x80` write + a call-result write | `func_ov002_0222b2e0.c` + `0223483c.c`: dual-case switch dispatch on both values (re-verified fresh) | CONFIRMED (refined — richer dispatch + a 3rd transient value than the doc's 2-value framing) |
| `DuelQueueState.f_5b4` | pending-action flag | `func_ov002_021f4a84.s` (+ 5 more `.s` sites): `ldr;add r2,r2,#1;str` — an **increment**, not a set-to-1 | `func_ov002_021f85f8.c`: `if (data_ov002_022ce288+1460==0)` gate (decimal-offset form of `+0x5b4` — Gap B) | CONFIRMED (refined — a counter, not a boolean flag) |
| `DuelQueueState.f_5d4` | cleared on 0→1 edge (companion to `f_688`) | `func_ov002_021e2b3c.c`: `f1492 = 0` (decimal alias, Gap B) inside the `old==0` (0→1 edge) branch — exact match | `func_ov002_021e311c.s`: `ldr r0,[r9,#0x5d4]; cmp r0,#0x0`, `r9` traced to `data_ov002_022ce288` via `_LIT1` | CONFIRMED (exact) |
| `DuelStateSingleton.f_d50` | not previously characterized beyond offset | `func_ov002_022593a8.c`: `D016C->f_d50 = 0` (shared canonical header, `ov002_core.h`) | `func_ov002_022593f4.c`: `f_d50 != 0 && f_d64 == 0xb` gate, annotated with real disassembly | CONFIRMED (new characterization: a gate flag combined with `f_d64`'s own `==0xb` mode-code check — corroborates this wave's `f_d64` loose-end finding independently) |
| `DuelStateSingleton.f_d9c` | sub-state for `func_02262804` dispatch (0/1, incremented) | `func_ov002_02262804.s`: `ldr;add r1,r1,#1;str` at `+0xd9c` | same function: `ldr r3,[r2,#0xd9c]; cmp r3,#0x0` dispatch gate, both register-traced to `data_ov002_022d016c` via `_LIT0` | CONFIRMED (exact — producer and consumer in the same function) |

**Hit rate: 5/5 CONFIRMED (100%), 2 with genuine refinements, 0 gaps, 0
contradictions, 0 unfalsifiable.** Consistent with `q-producer-consumer-
sample-2`'s own reading that risk concentrates in the highest-traffic
outlier fields (`f_cf8`) rather than being systemic across ordinary
small-int fields in general — this round adds a second confidence tier
(`DuelQueueState`, previously untouched) and a deeper slice of
`DuelStateSingleton` to that same conclusion.

## Loose ends closed

**`f_d64 == 0xc`** (flagged by `q-producer-consumer-sample-2`): added to
`DuelStateSingleton.md`'s field comment and "Using functions" list —
`func_ov002_02262994.s`'s `f_d20==5` switch arm reads `f_d64` and
compares it to `0xc` (gated behind `f_d50 != 0` — the SAME `f_d50` this
wave's own CANARY-adjacent field audited above), a second mode-code
value from a consumer outside the doc's original citation set. Not a
contradiction — `f_d64` simply has more than one consumer checking more
than one mode code.

**`BgCfg.md`/`Box.md` EUR-vs-USA/JPN address anomaly**: characterized,
cause not guessed. All 5 of `BgCfg.md`'s cited functions
(`func_ov018_021aa6b4`, `func_ov020_021aab10`/`021aaa9c`/`021aab98`/
`021aa908`) and both of `Box.md`'s (`func_ov017_021b3f90`/`021b3ea4`)
exist as real matched files under `src/usa/` **and** `src/jpn/`, at
those exact addresses, in both regions — but **do not exist at all**
under EUR's own `src/overlay017/`/`src/overlay018/`/`src/overlay020/`.
This is not a same-address-different-name situation: EUR's own
`symbols.txt` for these modules has genuinely different addresses in
the same neighborhood (e.g. EUR's `ov020` has `func_ov020_021aa9e8`,
`021aaa80`, `021aab7c` — none matching any of `BgCfg.md`'s 5 cited USA/
JPN addresses). Both `ov017`/`ov018`/`ov020` exist as real EUR modules,
so this isn't a missing-module gap either. Net characterization: both
docs were authored from USA-or-JPN-side analysis, and their specific
*function-address* citations don't carry over to EUR's own build
(regional code-layout differences are the obvious candidate explanation
given known ROM-region asset/string-size differences, but this wave
does not assert that as confirmed cause). The struct *layout* claims
themselves are unaffected by this — they were never region-specific —
only the cited consumer addresses are. Whoever next touches `BgCfg.md`/
`Box.md` should find and cite the EUR-side equivalent functions rather
than assuming the existing citations resolve there.

## Gate

Doc-only, no source changes.

```
$ python -m pytest -q tests
```

(see queue entry for pasted output)
