# Brief 503 — C-match MED campaign, wave 2

Branch: `decomper/c-match-med-503`

Scope: MED-tier candidates from `docs/research/c-match-prep/INDEX.json`, class C/D, excluding anything already converted on main. This wave resumed after brief 499's MED window and attempted INDEX positions 327–373. HIGH-tier A/B candidates were not touched.

## Summary

- Attempted: 47 EUR MED candidates.
- EUR matches accepted: 3.
- USA ports accepted: 3.
- JPN ports accepted: 3.
- Parked: 44.
- Deferred as new `.s`: 0.
- Cluster result: the current main-address MED cluster is thin under the ROM sha1 truth gate. It produced 3 ships and then a 6-candidate consecutive park run at 02045828–02046770 after the final match.
- Remaining MED runway: 2,325 candidates from MED INDEX position 374 onward before done-skip filtering.

## Accepted matches

| MED index | EUR | USA | JPN | Notes |
| --- | --- | --- | --- | --- |
| 336 | `src/main/func_0203ed2c.c` | `src/usa/main/func_0203ecdc.c` | `src/jpn/main/func_0203ecdc.c` | `gx-spirit-caller_eur.nds: OK`; ports sha1 OK |
| 356 | `src/main/func_02043bdc.c` | `src/usa/main/func_02043b8c.c` | `src/jpn/main/func_02043b8c.c` | `gx-spirit-caller_eur.nds: OK`; ports sha1 OK |
| 367 | `src/main/func_020453fc.c` | `src/usa/main/func_020453ac.c` | `src/jpn/main/func_020453ac.c` | `gx-spirit-caller_eur.nds: OK`; ports sha1 OK |

## Parked candidates

Every parked item was restored to `.s` and left unshipped. The common pattern was objdiff 100% for the changed unit, followed by a full ROM sha1/link/build gate failure, so these were treated as non-matches per the brief.

| MED index | Address | Class | Confidence | Reason |
| --- | --- | --- | --- | --- |
| 327 | `0203def0` | C | low | ROM sha1 mismatch |
| 328 | `0203e2f0` | D | low | sha1/full-build gate failed |
| 329 | `0203e400` | C | med | ROM sha1 mismatch |
| 330 | `0203e540` | C | low | ROM sha1 mismatch |
| 331 | `0203e730` | D | low | sha1/full-build gate failed |
| 332 | `0203e870` | D | med | ROM sha1 mismatch |
| 333 | `0203eb48` | C | med | ROM sha1 mismatch |
| 334 | `0203ec1c` | C | med | ROM sha1 mismatch |
| 335 | `0203eca4` | C | med | ROM sha1 mismatch |
| 337 | `0203edd4` | C | med | ROM sha1 mismatch |
| 338 | `0203eefc` | C | med | ROM sha1 mismatch |
| 339 | `0203efa0` | D | low | sha1/full-build gate failed |
| 340 | `0203f094` | D | low | sha1/full-build gate failed |
| 341 | `0203f30c` | D | med | ROM sha1 mismatch |
| 342 | `02040258` | C | med | ROM sha1 mismatch |
| 343 | `0204037c` | C | med | ROM sha1 mismatch |
| 344 | `02040478` | C | low | sha1/full-build gate failed |
| 345 | `0204052c` | C | low | full sha1 build compile failed: expression syntax error |
| 346 | `02040cc0` | C | low | ROM sha1 mismatch |
| 347 | `02040d94` | C | med | ROM sha1 mismatch |
| 348 | `020413b0` | C | med | ROM sha1 mismatch |
| 349 | `0204152c` | C | med | ROM sha1 mismatch |
| 350 | `020417e8` | C | med | ROM sha1 mismatch |
| 351 | `020418ac` | C | med | ROM sha1 mismatch |
| 352 | `02041f04` | C | low | ROM sha1 mismatch |
| 353 | `020433d0` | C | low | ROM sha1 mismatch |
| 354 | `020438b8` | D | low | ROM sha1 mismatch |
| 355 | `02043a78` | D | low | ROM sha1 mismatch |
| 357 | `02043c28` | C | med | ROM sha1 mismatch |
| 358 | `02043ca4` | C | med | ROM sha1 mismatch |
| 359 | `02044254` | C | med | ROM sha1 mismatch |
| 360 | `02044384` | C | med | ROM sha1 mismatch |
| 361 | `02044528` | C | med | ROM sha1 mismatch |
| 362 | `02044610` | D | low | sha1/full-build gate failed |
| 363 | `02044758` | C | med | ROM sha1 mismatch |
| 364 | `02044c60` | C | med | ROM sha1 mismatch |
| 365 | `02044e58` | C | med | sha1/full-build gate failed |
| 366 | `020452c4` | D | high | ROM sha1 mismatch |
| 368 | `02045828` | C | med | full sha1 build compile failed: illegal operands |
| 369 | `02045954` | C | med | ROM sha1 mismatch |
| 370 | `0204642c` | C | low | full sha1 build compile failed: expression syntax error |
| 371 | `02046498` | D | med | link failed: undefined `MSG_BASE_02046498` |
| 372 | `0204653c` | D | low | link failed: undefined `ADD_11b8`, `ADD_c398`, `ADD_eaa8` |
| 373 | `02046770` | C | low | full sha1 build compile failed: expression syntax error |

## Final gates

Final gates were run after all shipped changes and after all parks were restored:

```text
gx-spirit-caller_eur.nds: OK
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

## Throughput

State timestamps span 2026-06-28 11:50:42 UTC through 2026-06-28 17:17:13 UTC, about 5.44 active candidate hours.

- EUR attempt rate: 47 / 5.44h = 8.6 candidates/hour.
- Confirmed EUR match rate: 3 / 5.44h = 0.55 matches/hour.
- Confirmed three-region ship rate: 3 / 5.44h = 0.55 shipped functions/hour.

## Notes for the next MED pass

- Objdiff 100% alone remained a weak signal in this window. Most parks had a 100% changed-unit objdiff report but failed the ROM/link/full-build sha1 gate.
- The current main-address cluster should be treated as exhausted unless a later tooling pass explains the non-text/link deltas. Continue from MED INDEX position 374 for the next disjoint MED wave.
