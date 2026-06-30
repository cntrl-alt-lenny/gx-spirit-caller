# Brief 505 — C-match MED dossier-guided wave 1

Branch: `decomper/c-match-med-505`

Scope: MED-tier dossier-guided reshaping, starting in the ov006 dossier cluster. HIGH-tier candidates were not touched. Candidates were accepted only when both the changed-unit object comparison and the region ROM SHA-1 gate passed.

## Summary

- Attempted: 26 EUR MED dossier candidates.
- EUR matches accepted: 10.
- USA ports accepted: 10.
- JPN ports accepted: 10.
- Parked: 16.
- Deferred as new `.s`: 0.
- Yield: 10 / 26 = 38.5%.
- Stop reason: six consecutive parks after the last match (`021c71e0`, `021c7edc`, `021c7f5c`, `021c8068`, `021c8e98`, `021c9bc8`) signaled the current ov006 tail cluster was exhausted under the ROM SHA-1 truth gate.
- Remaining dossier runway: 473 entries in `docs/research/dossiers/INDEX.md` before done-skip filtering; only four ov006 entries remain after this stop point, then the dossier queue moves to ov007/ov008.

## Accepted matches

| EUR | USA | JPN | Notes |
| --- | --- | --- | --- |
| `src/overlay006/func_ov006_021c34c0.c` | `src/usa/overlay006/func_ov006_021c33b4.c` | `src/jpn/overlay006/func_ov006_021c33b4.c` | object match + all region SHA-1 gates OK |
| `src/overlay006/func_ov006_021c4574.c` | `src/usa/overlay006/func_ov006_021c4468.c` | `src/jpn/overlay006/func_ov006_021c4468.c` | manual region ports after porter rename refusal |
| `src/overlay006/func_ov006_021c52b8.c` | `src/usa/overlay006/func_ov006_021c51ac.c` | `src/jpn/overlay006/func_ov006_021c51ac.c` | manual region ports; resolved object diff used for port proof |
| `src/overlay006/func_ov006_021c5a5c.c` | `src/usa/overlay006/func_ov006_021c5950.c` | `src/jpn/overlay006/func_ov006_021c5950.c` | porter-assisted ports with manual delinks flip |
| `src/overlay006/func_ov006_021c669c.c` | `src/usa/overlay006/func_ov006_021c6590.c` | `src/jpn/overlay006/func_ov006_021c6590.c` | manual region ports for low-confidence symbol mapping |
| `src/overlay006/func_ov006_021c6998.c` | `src/usa/overlay006/func_ov006_021c688c.c` | `src/jpn/overlay006/func_ov006_021c688c.c` | mode-select/control helper; object diff zero mismatches |
| `src/overlay006/func_ov006_021c6a58.c` | `src/usa/overlay006/func_ov006_021c694c.c` | `src/jpn/overlay006/func_ov006_021c694c.c` | paired MMIO RMW exact-store-order match |
| `src/overlay006/func_ov006_021c6d8c.c` | `src/usa/overlay006/func_ov006_021c6c80.c` | `src/jpn/overlay006/func_ov006_021c6c80.c` | linear open/close dispatch match |
| `src/overlay006/func_ov006_021c6ff8.c` | `src/usa/overlay006/func_ov006_021c6eec.c` | `src/jpn/overlay006/func_ov006_021c6eec.c` | MMIO setup + render sequence match |
| `src/overlay006/func_ov006_021c7110.c` | `src/usa/overlay006/func_ov006_021c7004.c` | `src/jpn/overlay006/func_ov006_021c7004.c` | `:3` bitfield + centered text setup match |

## Parked candidates

Every parked candidate was restored to `.s`; no fallback `.s` ships were added.

| Address | Reason |
| --- | --- |
| `021c215c` | objdiff 94.52 after selector/return reshape; parked per one-iteration cap |
| `021c31d0` | objdiff 96.36; remaining `moveq`/`movne` ordering issue for f64 ternary |
| `021c32ac` | objdiff 75.93 as-is, 61.11 after selector/pG bool reshape |
| `021c426c` | objdiff 29.82 corrected-index draft, 58.93 after bound-destination + bit-extract guard; permuter-class |
| `021c43bc` | objdiff 96.55 after full-asm correction; remaining prologue scratch-register mismatches |
| `021c480c` | near miss with selector register / extra `mov` mismatches, then worse in int-pointer family style |
| `021c63cc` | self-reported object complete/100 but EUR ROM SHA-1 failed |
| `021c6454` | self-reported object complete/100 but raw dump/ROM SHA-1 failed; extra saved-reg loop shape remained |
| `021c6c78` | object diff zero mismatches, but EUR ROM SHA-1 failed |
| `021c6e40` | object diff zero mismatches, but EUR ROM SHA-1 failed |
| `021c71e0` | object diff zero mismatches, but EUR ROM SHA-1 failed |
| `021c7edc` | object diff zero mismatches, but EUR ROM SHA-1 failed |
| `021c7f5c` | corrected stale dossier signature/table pools and object-matched, but EUR ROM SHA-1 failed |
| `021c8068` | corrected twin signature/table pools and object-matched, but EUR ROM SHA-1 failed |
| `021c8e98` | corrected tail call sequence and object-matched, but EUR ROM SHA-1 failed |
| `021c9bc8` | object diff zero mismatches, but EUR ROM SHA-1 failed; sixth consecutive park |

## Cluster yields

- ov006 MED dossier cluster: 10 accepted / 26 attempted.
- The high-yield pocket was the MMIO/control/render family from `021c669c` through `021c7110`, which produced six accepted EUR matches with clean USA/JPN ports.
- The later ov006 table/geometry/OAM helpers repeatedly produced object-perfect but ROM-failing candidates, so this cluster should be treated as exhausted until the non-text/link delta mechanism is understood.

## Final gates

Final gates were run after rebasing onto current `origin/main` and after all parked candidates were restored:

```text
gx-spirit-caller_eur.nds: OK
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

## Throughput and contention

Approximate active wall time was about 9.5 hours, including repeated waits on a concurrent `brief506_driver.py` SHA-1/build lane in the same worktree. That gives roughly:

- EUR attempt rate: 26 / 9.5h = 2.7 candidates/hour.
- Confirmed EUR match rate: 10 / 9.5h = 1.1 matches/hour.
- Confirmed three-region ship rate: 10 / 9.5h = 1.1 shipped functions/hour.

The concurrent lane materially slowed final gates and restore checks. No build locks were deleted and no processes were killed; this wave waited for native Windows build processes to release the Ninja log.

## Notes for next MED pass

- The dossier-guided approach was much better than the brief-503 mechanical runner, but ROM SHA-1 remained the decisive filter. Several object-perfect candidates still failed the ROM gate and were correctly parked.
- Continue from `021c9c54` only if the brain wants to finish the last four ov006 dossier entries. Otherwise, jump to the next module cluster in `docs/research/dossiers/INDEX.md`.
- The table-switch twins (`021c7f5c`, `021c8068`) have stale dossier drafts: real ABI is `(unused, sel, key/val)` and cases 7-9 use `data_ov006_021ce3ae`, `data_ov006_021ce5c4`, and `data_ov006_021ce2ac`.
