[//]: # (markdownlint-disable MD013 MD041)

# Brief 508 - C-match HIGH wave 6

**Branch:** `scaffolder/c-match-high-508`  
**PR:** #1052 (draft -> ready)  
**Gate:** MATCHED = function objdiff 100% + region `configure.py <ver>` + `ninja sha1` OK.

## Outcome

- **220 unique EUR HIGH candidates objdiff-scouted** in INDEX order after skipping known-bad, main-converted C, prior reports, and 48 locally seeded wave-5 sha1-fail parks.
- **40 EUR HIGH C matches accepted** after objdiff 100% and an individual EUR `ninja sha1` gate.
- **171 new EUR candidates parked** as objdiff-100 but ROM-sha1-wrong.
- **9 objdiff-100 candidates left unclassified** at the target boundary; they were not sha1-gated and are deferred to the next wave, not counted as parks.
- **23 USA ports kept** and **23 JPN ports kept** after per-unit objdiff 100% plus regional sha1 group gates.
- **17 USA/JPN ports deferred** for low-confidence data-symbol remaps (`EXACT_ADDR` data symbols that the porter still rates below MEDIUM for safe write).
- **HIGH verdict:** visibly thinning under the actual ROM gate. The prep C still objdiffs well, but many candidates are layout/ROM-wrong after delink replacement.

## EUR confirmed matches

`020459c4`, `020461fc`, `02046718`, `0204682c`, `02046888`, `02046a1c`, `0204823c`, `02048c28`, `0204b1a4`, `0204f798`, `0205261c`, `02052818`, `0205307c`, `02053560`, `02053728`, `02053ddc`, `02054314`, `02054614`, `02054868`, `02056a34`, `02058038`, `02059d90`, `0205bd0c`, `0205c928`, `0205cab4`, `0205d9a0`, `020604a4`, `02060d8c`, `02060f30`, `02062498`, `0206280c`, `02063e0c`, `02063fe4`, `02064aa0`, `02065e78`, `020673dc`, `02068380`, `020684b4`, `02068b1c`, `0206e468`

## USA/JPN kept ports

`020459c4`, `020461fc`, `02052818`, `0205307c`, `02053560`, `02053728`, `02053ddc`, `02054314`, `02054868`, `02056a34`, `02059d90`, `0205bd0c`, `0205c928`, `0205cab4`, `0205d9a0`, `020604a4`, `0206280c`, `02063e0c`, `02063fe4`, `02064aa0`, `02068380`, `020684b4`, `0206e468`

USA targets kept: `src/usa/main/func_0204591c.c`, `src/usa/main/func_02046154.legacy_sp3.c`, `src/usa/main/func_020527a4.legacy_sp3.c`, `src/usa/main/func_02053008.c`, `src/usa/main/func_020534ec.c`, `src/usa/main/func_020536b4.c`, `src/usa/main/func_02053d68.c`, `src/usa/main/func_020542a0.c`, `src/usa/main/func_020547f4.c`, `src/usa/main/func_020569c0.c`, `src/usa/main/func_02059d1c.c`, `src/usa/main/func_0205bc98.c`, `src/usa/main/func_0205c8b4.c`, `src/usa/main/func_0205ca40.c`, `src/usa/main/func_0205d92c.c`, `src/usa/main/func_02060430.c`, `src/usa/main/func_02062798.legacy_sp3.c`, `src/usa/main/func_02063d98.c`, `src/usa/main/func_02063f70.c`, `src/usa/main/func_02064a2c.c`, `src/usa/main/func_0206830c.c`, `src/usa/main/func_02068440.c`, `src/usa/main/func_0206e3f4.c`

JPN targets kept: `src/jpn/main/func_0204591c.c`, `src/jpn/main/func_02046154.legacy_sp3.c`, `src/jpn/main/func_020527a4.legacy_sp3.c`, `src/jpn/main/func_02053008.c`, `src/jpn/main/func_020534ec.c`, `src/jpn/main/func_020536b4.c`, `src/jpn/main/func_02053d68.c`, `src/jpn/main/func_020542a0.c`, `src/jpn/main/func_020547f4.c`, `src/jpn/main/func_020569c0.c`, `src/jpn/main/func_02059d1c.c`, `src/jpn/main/func_0205bc98.c`, `src/jpn/main/func_0205c8b4.c`, `src/jpn/main/func_0205ca40.c`, `src/jpn/main/func_0205d92c.c`, `src/jpn/main/func_02060430.c`, `src/jpn/main/func_02062798.legacy_sp3.c`, `src/jpn/main/func_02063d98.c`, `src/jpn/main/func_02063f70.c`, `src/jpn/main/func_02064a2c.c`, `src/jpn/main/func_0206830c.c`, `src/jpn/main/func_02068440.c`, `src/jpn/main/func_0206e3f4.c`

## Deferred USA/JPN ports

Deferred in both USA and JPN for low-confidence data-symbol resolution:

`02046718`, `0204682c`, `02046888`, `02046a1c`, `0204823c`, `02048c28`, `0204b1a4`, `0204f798`, `0205261c`, `02054614`, `02058038`, `02060d8c`, `02060f30`, `02062498`, `02065e78`, `020673dc`, `02068b1c`

## EUR parked / deferred notes

- **New sha1-fail parks:** 171 candidates objdiffed 100% but failed EUR ROM sha1 when applied as C. These were reverted and left as `.s`.
- **Seeded prior-wave skips:** 48 candidates from the interrupted wave-5 run were skipped using local evidence as prior objdiff-100/sha1-fail parks; they were not counted as brief-508 attempts.
- **Boundary deferred:** `0206e4a4`, `0206e504`, `0206e670`, `0206e9b0`, `0206eecc`, `0206f45c`, `0206f48c`, `0207034c`, `020707f0`.

## Cluster/yield notes

- Strict EUR yield this wave: **40 / 220 unique candidates = 18.2%** accepted.
- Sha1-gated new candidates: **211** = 40 accepted + 171 parks; **19.0%** sha1-clean.
- The `02045xxx` through `02068xxx` main run is mostly objdiff-friendly but ROM-layout-hostile; this is the clearest sign so far that the remaining HIGH pool is no longer the old 80% lane.
- The best useful port subset was the data-clean/simple-main subset: 23/40 EUR matches ported symmetrically to both USA and JPN.

## Verification notes

- EUR accepted matches were gated with `ninja sha1` after each accepted function.
- USA/JPN ports were written in groups, checked with isolated per-unit `objdiff-cli report generate`, then region `ninja sha1`; any group failure would have been isolated per-port, but no kept-port group failed sha1.
- Final gates below were run after all ports, report/index updates pending at this point.

## Final sha1

```text
EUR  gx-spirit-caller_eur.nds: OK  (1da50df7c210fae96dc69b3825554b9ce13b4f75)
USA  gx-spirit-caller_usa.nds: OK  (9e53dcc74d8a9db4de6b655d62a1da6f5e9c2a83)
JPN  gx-spirit-caller_jpn.nds: OK  (761fbfc62f4fe74f867e973a5eda91b8e86424f6)
```

## Throughput

Measured from seeded-driver start to report write:

- EUR accepted: 40 / 15.94 h = **2.5 funcs/hour**.
- Fully ported three-region keeps: 23 / 15.94 h = **1.4 funcs/hour**.
