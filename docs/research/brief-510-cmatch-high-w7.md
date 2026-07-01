[//]: # (markdownlint-disable MD013 MD041)

# Brief 510 - C-match HIGH wave 7

**Branch:** `scaffolder/c-match-high-510`  
**PR:** #1060 (draft -> ready)  
**Gate:** MATCHED = function objdiff 100% + region `configure.py <ver>` + `ninja sha1` OK.

## Outcome

- **180 unique EUR HIGH candidates objdiff-scouted** in INDEX order after skipping known-bad, main-converted C, prior reports, and 219 locally seeded prior-wave sha1/force-fail parks.
- **40 EUR HIGH C matches accepted** after objdiff 100% and an individual EUR `ninja sha1` gate.
- **84 new EUR candidates parked** after objdiff 100% but ROM-sha1-wrong; all were reverted to `.s`.
- **4 objdiff-100 candidates left unclassified** at the target boundary; they were not sha1-gated and are deferred to the next wave, not counted as parks.
- **32 USA ports kept** and **32 JPN ports kept** after per-unit objdiff 100% plus regional sha1 gates.
- **8 USA/JPN ports deferred** for low-confidence data-symbol remaps (`EXACT_ADDR` data symbols that the porter still rates below MEDIUM for safe write).
- **Remaining HIGH runway:** 634 eligible HIGH A/B candidates by the wave driver rules after this branch; HIGH is still present, but the real ROM-sha1 yield is thin and should stay gated hard.

## EUR confirmed matches

`0206e670`, `0206f45c`, `02070e54`, `02070ec4`, `02071a2c`, `02073da0`, `02073e68`, `02076260`, `0207842c`, `02078444`, `0207b230`, `0207c570`, `0207c9f0`, `0207ce50`, `0207cf28`, `0207cf78`, `0207da7c`, `0207de6c`, `0207e370`, `0207e7d8`, `0207e8b8`, `0207f420`, `0207f85c`, `0208016c`, `020807b8`, `0208147c`, `02081f50`, `02082044`, `02082050`, `02084a9c`, `02085864`, `02086800`, `02086c84`, `02087174`, `020871ac`, `0208722c`, `02087558`, `0208758c`, `020875e0`, `02087790`

## USA/JPN kept ports

Kept in both USA and JPN:

`0206e670`, `0206f45c`, `02070ec4`, `02071a2c`, `02073da0`, `02076260`, `0207842c`, `02078444`, `0207c570`, `0207ce50`, `0207cf28`, `0207cf78`, `0207da7c`, `0207de6c`, `0207e7d8`, `0207e8b8`, `0207f85c`, `0208016c`, `020807b8`, `02081f50`, `02082044`, `02082050`, `02084a9c`, `02085864`, `02086800`, `02086c84`, `02087174`, `020871ac`, `0208722c`, `02087558`, `0208758c`, `02087790`

USA targets kept: `src/usa/main/func_0206e5fc.c`, `src/usa/main/func_0206f3e8.c`, `src/usa/main/func_02070ddc.legacy.c`, `src/usa/main/func_02071944.legacy.c`, `src/usa/main/func_02073cb8.c`, `src/usa/main/func_02076178.c`, `src/usa/main/func_02078344.c`, `src/usa/main/func_0207835c.c`, `src/usa/main/func_0207c488.legacy.c`, `src/usa/main/func_0207cd68.legacy.c`, `src/usa/main/func_0207ce40.legacy.c`, `src/usa/main/func_0207ce90.c`, `src/usa/main/func_0207d994.legacy_sp3.c`, `src/usa/main/func_0207dd84.c`, `src/usa/main/func_0207e6f0.legacy_sp3.c`, `src/usa/main/func_0207e7d0.c`, `src/usa/main/func_0207f774.c`, `src/usa/main/func_02080084.c`, `src/usa/main/func_020806d0.c`, `src/usa/main/func_02081e68.c`, `src/usa/main/func_02081f5c.c`, `src/usa/main/func_02081f68.c`, `src/usa/main/func_020849b4.c`, `src/usa/main/func_0208577c.c`, `src/usa/main/func_02086718.c`, `src/usa/main/func_02086b9c.c`, `src/usa/main/func_0208708c.c`, `src/usa/main/func_020870c4.c`, `src/usa/main/func_02087144.c`, `src/usa/main/func_02087470.legacy_sp3.c`, `src/usa/main/func_020874a4.c`, `src/usa/main/func_020876a8.c`

JPN targets kept: `src/jpn/main/func_0206e5fc.c`, `src/jpn/main/func_0206f3e8.c`, `src/jpn/main/func_02070ddc.legacy.c`, `src/jpn/main/func_02071944.legacy.c`, `src/jpn/main/func_02073cb8.c`, `src/jpn/main/func_02076178.c`, `src/jpn/main/func_02078344.c`, `src/jpn/main/func_0207835c.c`, `src/jpn/main/func_0207c488.legacy.c`, `src/jpn/main/func_0207cd68.legacy.c`, `src/jpn/main/func_0207ce40.legacy.c`, `src/jpn/main/func_0207ce90.c`, `src/jpn/main/func_0207d994.legacy_sp3.c`, `src/jpn/main/func_0207dd84.c`, `src/jpn/main/func_0207e6f0.legacy_sp3.c`, `src/jpn/main/func_0207e7d0.c`, `src/jpn/main/func_0207f774.c`, `src/jpn/main/func_02080084.c`, `src/jpn/main/func_020806d0.c`, `src/jpn/main/func_02081e68.c`, `src/jpn/main/func_02081f5c.c`, `src/jpn/main/func_02081f68.c`, `src/jpn/main/func_020849b4.c`, `src/jpn/main/func_0208577c.c`, `src/jpn/main/func_02086718.c`, `src/jpn/main/func_02086b9c.c`, `src/jpn/main/func_0208708c.c`, `src/jpn/main/func_020870c4.c`, `src/jpn/main/func_02087144.c`, `src/jpn/main/func_02087470.legacy_sp3.c`, `src/jpn/main/func_020874a4.c`, `src/jpn/main/func_020876a8.c`

## Deferred USA/JPN ports

Deferred in both USA and JPN for low-confidence data-symbol resolution:

`02070e54`, `02073e68`, `0207b230`, `0207c9f0`, `0207e370`, `0207f420`, `0208147c`, `020875e0`

## EUR parked / deferred notes

- **New sha1-fail parks:** 84 candidates objdiffed 100% but failed EUR ROM sha1 when applied as C. These were reverted and left as `.s`.
- **Manual park:** `02074c74` had a real EUR sha1 failure (`actual b992705607e8bd69f6ecb555173c3d97f61de0e1`) after objdiff 100%; the driver was interrupted before its automatic revert/park write, so it was manually reverted and logged as `sha1-fail-driver-interrupted-before-auto-revert`.
- **Seeded prior-wave skips:** 219 candidates from prior waves were skipped using local evidence as known sha1/force-fail parks; they were not counted as brief-510 attempts.
- **Boundary deferred:** `020877c8`, `02087824`, `0208787c`, `020879a4`.

## Cluster/yield notes

- Strict EUR yield this wave: **40 / 180 objdiff-100 scouts = 22.2%** accepted.
- Sha1-classified new candidates: **124** = 40 accepted + 84 parks; **32.3%** sha1-clean within the gated set.
- Port yield: **32 / 40 EUR matches = 80.0%** kept symmetrically in USA and JPN. The eight deferred ports were data-symbol confidence limits, not known codegen failures.
- HIGH is still usable but no longer mechanical-high-yield in the old sense: objdiff remains easy, while ROM sha1 catches many bad replacements.

## Verification notes

- EUR accepted matches were gated with `ninja sha1` after each accepted function.
- USA/JPN ports were written in groups, checked with isolated per-unit `objdiff-cli report generate`, then region `ninja sha1`.
- The first USA port command hit the local command timeout while an in-scope child build was still running. I waited for the exact child processes to finish, then used the helper's recorded `state["ports"]["usa"]` results and reran a fresh USA `ninja sha1` before committing.
- A first final-gate wrapper returned too quickly without producing logs; it was discarded and the three final gates below were rerun directly.

## Final sha1

```text
EUR  gx-spirit-caller_eur.nds: OK  (1da50df7c210fae96dc69b3825554b9ce13b4f75)
USA  gx-spirit-caller_usa.nds: OK  (9e53dcc74d8a9db4de6b655d62a1da6f5e9c2a83)
JPN  gx-spirit-caller_jpn.nds: OK  (761fbfc62f4fe74f867e973a5eda91b8e86424f6)
```

## Throughput

Measured from seeded-driver start (`2026-06-30T10:00:50+01:00`) to report write (`2026-07-01T01:04:52+01:00`):

- EUR accepted: 40 / 15.07 h = **2.7 funcs/hour**.
- Fully ported three-region keeps: 32 / 15.07 h = **2.1 funcs/hour**.
