# Brief 612: naming at scale + uniqueness gate

## Phase 1: uniqueness gate

Added `tools/check_name_unique.py`. It scans `config/<region>/arm9/symbols.txt`
and every overlay `symbols.txt`, collecting all addresses bound to each name.
A proposed rename is accepted when the name is absent or already bound at the
same address, and is rejected when any different address is present.

Unit test:

```text
Ran 3 tests in 0.003s
OK
```

Canary against the historical 610 names on this fresh `origin/main` base:

```text
COLLISION version=eur name=Task_InvokeLockedIrq proposed=0x0200634c existing=0x02006368
UNIQUE version=eur name=FS_LoadOverlayInfo proposed=0x02098a4c
COLLISION version=eur name=__register_global_object proposed=0x020b4200 existing=0x020b42f4
```

`FS_LoadOverlayInfo` is not present in the fresh base, so the requested
three-collision canary is not reproducible without importing the unmerged 610
branch. The gate itself correctly distinguishes this absent name from the two
real collisions; this is recorded as a Phase 1 data-premise stop-note.

## Phase 2: candidate naming

Built the NitroSDK dictionary from the committed `libs/nitro` corpus:

```text
Wrote build/analysis/nitro_dict.json — 26 function(s) across 2 subsystem(s).
```

The broad recommender scan found 4 tractable targets, all LOW confidence with
score 0, and 0 HIGH / 0 MEDIUM candidates. The displayed candidate sets were
generic (`BitUnPack`, `CpuFastSet`, `CpuSet`, `Div`, `FX_Atan2Idx`) and did not
support a defensible name choice. The sibling checks for the named anchors
`Task_InvokeLockedIrq` and `__register_global_object` returned empty candidate
sets. No Phase 2 names were applied; inventing names outside the candidate
sets would violate the brief.

## Phase 3: cross-region propagation

The signature probe found two EUR real-named functions whose USA/JPN twins were
still placeholders and whose proposed names passed the uniqueness gate:

| Region | Address | Name |
|--------|---------|------|
| USA | `0x0200634c` | `Task_InvokeLockedIrq` |
| JPN | `0x0200634c` | `Task_InvokeLockedIrq` |
| USA | `0x020b4200` | `__register_global_object` |
| JPN | `0x020b4200` | `__register_global_object` |

Total names applied: **4** (EUR 0, USA 2, JPN 2). The historical FS name was
not propagated because it has no EUR source symbol on this base.

## Gates and tests

The native checks were run after the propagation batch:

```text
USA: ./dsd check modules -c config/usa/arm9/config.yaml -> exit 0
JPN: ./dsd check modules -c config/jpn/arm9/config.yaml -> exit 0
```

The extracted-ROM view reports pre-existing overlay checksum-failed notices;
no ROM or SHA-1 command was run in this WINE-free campaign. The final EUR
check is included in the PR body alongside the USA/JPN output.

Uniqueness audit (one distinct `name address` pair per symbol name):

```text
eur duplicate-name bindings: 0
usa duplicate-name bindings: 0
jpn duplicate-name bindings: 0
```

`python3.13 -m pytest tests -q` is the final repository test gate.
