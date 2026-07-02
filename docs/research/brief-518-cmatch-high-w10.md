[//]: # (markdownlint-disable MD013)

# Brief 518 - HIGH C-match wave 10

Branch: `scaffolder/c-match-high-518`

Scope: HIGH tier class A/B candidates from `docs/research/campaign-analytics/safe-queue-v2.md`, using the Brief 516 containment gate plus bounded reshaping. The safe queue has 150 rows, but only 5 are HIGH-tier; MED and RETRIAGE rows were left untouched for the disjoint lane boundary.

## Outcome

- Safe-queue HIGH candidates attempted: **5 / 5**
- EUR matches accepted: **3**
- USA ports kept: **3**
- JPN ports kept: **3**
- Avalanche parked: **1**
- Reshape parked: **1**

The safe-queue HIGH subset is exhausted. The queue still contains MED/RETRIAGE entries, but those are out of this HIGH-tier scaffolder scope.

## Accepted EUR matches

| EUR addr | Module | Region ports | Containment result | Reshape note |
|---|---|---|---|---|
| `021e358c` | ov002 | USA/JPN kept as `021e349c` | contained, 0 diff bytes after ROM build | Prep draft matched directly. |
| `0229cd70` | ov002 | USA/JPN kept as `0229cc60` | contained, 2-byte `r2`/`r3` temp diff -> zero | Reshaped the veneer with the pass-through arg signature so mwcc used `r3` for the swap temp. |
| `021b2b80` | ov010 | USA/JPN kept as `021b2a80` | contained, 0 diff bytes after ROM build | Prep switch dispatcher matched directly. |

Each accepted EUR candidate passed `ninja -j4 sha1` before it counted as matched. Each USA/JPN port was gated with target-region `ninja -j4 rom`, fresh `ninja -j4 objdiff`, and `ninja -j4 sha1`.

## Parked candidates

| EUR addr | Module | Bucket | Evidence | Next action |
|---|---|---|---|---|
| `021e2e18` | ov002 | avalanche | Official `tools/containment_check.py` reported zero main-ARM9 diff, but the overlay fallback found **805,331** diff bytes / **96,133** runs in `arm9_ov002.bin`; first run at `0x021aaa24`, far before the candidate range `0x021e2e18-0x021e2e38`. | Needs overlay-aware containment investigation before reshaping. |
| `02078ebc` | main | reshape | Contained 1-byte mismatch: original `ldrh r1, [r0]`; mwcc kept emitting `ldrh r0, [r0]` before `mov r0, #0`. The bounded return-local and second-arg shapes did not move the side-effect load into `r1`. | Needs a focused volatile-load destination/register-allocation recipe. |

## Process notes

- `tools/containment_check.py` is main-ARM9-only in practice. It can report `CONTAINED`/zero diff for overlay candidates even when the changed overlay binary avalanches. I used the requested tool first, then fell back to overlay binary diffing for ov002/ov010.
- `tools/verify.py` failed locally on Windows with `FileNotFoundError: [WinError 2]` while inspecting `0229cd70`, so I used direct object/target disassembly for the byte-level reshape.
- `tools/port_to_region.py` resolved the real overlay entrypoints at HIGH in JSON dry-run, but the write path still refused because bare unprefixed function names in comments resolved as `NONE`. I applied the dry-run rewrites manually, then gated the ports normally.

## Yield and runway

- Overall EUR yield: **3 / 5 = 60.0%**.
- Contained candidates: **4 / 5**.
- Contained-candidate yield: **3 / 4 = 75.0%**, up from Brief 516's **4 / 6 = 66.7%** contained-yield.
- Approximate HIGH A/B runway after this branch: **1,013** indexed candidates still have EUR `.s` sources in this worktree, excluding the seven known-bad addresses.

## Verification

Final SHA gates:

```text
gx-spirit-caller_eur.nds: OK
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

Port gates:

```text
ninja -j4 objdiff (usa): OK
ninja -j4 objdiff (jpn): OK
```

Other checks:

```text
python tools/generate_research_index.py
wrote docs\research\README.md (369 notes)
python tools/generate_research_index.py --check
docs\research\README.md is current.

Markdown lint: not run; no local markdownlint/markdownlint-cli/mdl command was installed.
```
