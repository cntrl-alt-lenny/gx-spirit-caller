[//]: # (markdownlint-disable MD013 MD041)

# Brief 433 — region port, wave 6 — USA MEDIUM-floor lever validated

**Brief:** 433 (decomper). Wave 6 of the USA/JPN region-port lane (briefs 421
scout, 423–431). Brief 431 found USA's HIGH-floor `main` `.c` lane drained, and I
recommended trying the MEDIUM confidence floor for USA. This wave does that as a
bounded, gate-validated trial. Mechanism: see
[`brief-423-region-port-scale.md`](brief-423-region-port-scale.md).

## Result

- **30 USA `.c` ports at the MEDIUM confidence floor + 50 JPN at HIGH** (80 this
  wave), each into `src/<region>/main/`, gated **byte-identical**.
- **3-region `ninja sha1`: EUR / USA / JPN all `OK`** (EUR unchanged).
- **The MEDIUM-floor lever is VALIDATED for USA: 30/30 MEDIUM ports gated
  byte-identical.** The USA `.c` lane is reopened.

## USA MEDIUM-floor trial (the headline)

Brief 431 left USA with 137 portable-unported candidates that wouldn't port at the
HIGH floor: 47 SDK-name-blocked + 90 *sub-floor self-refusals* (a called symbol
resolving below HIGH). This wave I added a `--floor` pass-through to the porter
and ran USA at `--confidence-floor MEDIUM` (auto-promote on — it maps a
sub-floor symbol by the consensus address-shift of its 5 nearest HIGH neighbours).

- The candidate filter stays at scan-confidence **HIGH + byte-sim 1.000** (the
  function's own identity is rock-solid); only a *called* symbol is resolved at
  MEDIUM. So a wrong MEDIUM resolution can only mis-target a `bl`, which changes
  bytes → the `sha1` gate catches it.
- **Outcome: 30 ported, all 30 byte-identical at the gate.** The consensus-shift
  auto-promotion resolved every called symbol correctly. No objdiff bisect needed.

So MEDIUM-floor (HIGH-main + MEDIUM-call) porting is safe here, because the gate
is an exact per-byte check. This unlocks the ~61 MEDIUM-reachable USA candidates
that remain (~2 more USA waves), after which only the 47 SDK-blocked are left.

## Running totals (region-port lane: 421 … 433)

| Region | This wave | Lane total | Portable-unported remaining | of which |
|--------|----------:|-----------:|----------------------------:|----------|
| USA | 30 (MEDIUM) | 284 | 108 | ~61 MEDIUM-reachable + 47 SDK-blocked |
| JPN | 50 (HIGH) | 204 | 189 | ~142 reachable (HIGH lane still healthy) + 47 SDK-blocked |

## Method

Porter gained a 3rd arg `floor` (default HIGH) → passes `--confidence-floor` to
`port_to_region`. USA run at MEDIUM, JPN at HIGH. Filters parked the usual residue
(SDK-name + sibling mismatches); no spurious `void` rejects; `KNOWN_BAD_OUTPUTS`
skip held (no `func_020821e0` recurrence). Both delinks
`sort_delinks.py`-canonicalised; static collision scan clean; proactive MD018 doc
sweep before push.

## Levers ahead

- **USA:** ~2 more MEDIUM-floor `main` waves (~61), then the 47 SDK-blocked need a
  verified `Fill32`/`OS_RestoreIrq` region alias, or pivot USA to clean overlays.
- **JPN:** still healthy at HIGH floor; MEDIUM is available there too when HIGH
  thins.

## Parked (unchanged)

`Fill32`/`OS_RestoreIrq` referencers, duplicate-shape mismatches, the
`func_020821e0` compile-fail, and brief 421's divergent residue (`main`
`-244`/0xf4 drift band + overlay-swap group `{ov000, ov002, ov005, ov008}`).

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`**.
