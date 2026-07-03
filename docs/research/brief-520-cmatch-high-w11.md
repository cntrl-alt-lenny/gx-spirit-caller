[//]: # (markdownlint-disable MD013)

# Brief 520 - HIGH safe-queue wave 11, main-module pass

Branch: `scaffolder/c-match-high-520`

Scope: MAIN-module rows from `docs/research/campaign-analytics/safe-queue-v3.md`, worked top-down and skipping all `ovNNN` rows because `tools/containment_check.py` is main-ARM9-only. The phrase "HIGH safe-queue" is the campaign lane name here; v3's top MAIN rows are mostly MED-tier, and only processing literal `tier=HIGH` rows would have yielded a single candidate rather than the requested 15-20 queue entries.

## Outcome

- Queue entries attempted: **20** (MAIN ranks 13-32)
- EUR matches accepted: **1**
- USA ports kept: **1**
- JPN ports kept: **1**
- Avalanche parked: **16**
- Reshape parked: **3**
- Build parked: **0**

## Accepted match

| EUR addr | Queue rank | Tier | Region ports | Containment result | Reshape note |
|---|---:|---|---|---|---|
| `02031afc` | 18 | MED | USA/JPN kept as `02031aa8` | contained, 7-byte register swap -> zero | Replaced the casted `char[]` head local with `extern struct N_02031afc *data_0219adb8;`, which put the global address in `r1` and loaded head in `r2` to match the original. |

The accepted EUR function passed `ninja -j4 sha1` before porting. The USA/JPN ports resolved at HIGH/EXACT confidence through `tools/port_to_region.py`, then passed target-region `ninja -j4 rom`, fresh `ninja -j4 objdiff`, and `ninja -j4 sha1`.

## Parked candidates

### Avalanche parked

These candidates failed the containment gate and were reverted immediately. Every avalanche began outside the candidate range, with first owner `src/main/Entry.c` unless noted.

| Addr | Queue rank | Tier | Initial diff bytes / runs | Size delta | Note |
|---|---:|---|---:|---:|---|
| `02000d4c` | 13 | MED | 803,938 / 114,754 | +32 | first run `0x020008f8-0x020008f9`, owner `Entry.c` |
| `02005d54` | 14 | MED | 587,697 / 72,103 | 0 | first run `Entry.c` |
| `0200aa08` | 15 | MED | 578,518 / 71,831 | 0 | first run `Entry.c` |
| `02026f78` | 16 | MED | 675,097 / 98,745 | +32 | first run `Entry.c` |
| `0202e5ac` | 17 | MED | 461,288 / 57,886 | 0 | first run `Entry.c` |
| `02033a80` | 19 | MED | 629,850 / 92,322 | +32 | first run `Entry.c` |
| `02038908` | 20 | MED | 428,590 / 48,515 | 0 | first run `Entry.c` |
| `02054b44` | 21 | MED | 326,722 / 41,671 | 0 | first run `Entry.c` |
| `0206afec` | 22 | MED | 251,405 / 32,980 | 0 | first run `Entry.c` |
| `0206f170` | 23 | MED | 428,574 / 67,510 | +32 | first run `Entry.c` |
| `02076cc0` | 25 | MED | 211,809 / 29,293 | 0 | first run `Entry.c` |
| `020779d8` | 26 | MED | 399,071 / 67,368 | +32 | first run `Entry.c` |
| `0207e1c4` | 28 | MED | 186,636 / 26,285 | 0 | prep included unsupported `<stdint.h>`; removing it allowed build, then containment still avalanched |
| `0207e840` | 29 | MED | 185,205 / 26,107 | 0 | first run `Entry.c` |
| `0207ec28` | 30 | MED | 373,204 / 62,663 | +32 | first run `Entry.c` |
| `0208541c` | 32 | MED | 163,324 / 23,681 | 0 | first run `Entry.c` |

### Reshape parked

| Addr | Queue rank | Tier | Containment result | Reshape result |
|---|---:|---|---|---|
| `0207103c` | 24 | MED | contained, 69 diff bytes / 6 runs | Dossier's explicit-hi split produced the same contained diff; parked as the documented 64-bit scheduling/permuter wall. |
| `02078ebc` | 27 | HIGH | contained, 1 diff byte / 1 run | Known `ldrh r1` vs `ldrh r0` volatile-load destination wall from brief 518; previous return-local and second-arg shapes did not move it. Reverted without re-grinding. |
| `0208060c` | 31 | MED | contained, 42 diff bytes / 13 runs | Do/while + byte-stride + two-step hi reshape made the unit avalanche; reverted and parked as unsafe to reshape in this wave. |

## Yield and runway

- Overall EUR yield: **1 / 20 = 5.0%**
- Contained candidates: **4 / 20**
- Contained-candidate yield: **1 / 4 = 25.0%**
- Avalanche rate for this MAIN-only block: **16 / 20 = 80.0%**
- Remaining unattempted MAIN rows in safe-queue v3: **78**

This wave supports the premise that `containment_check.py` is usable for MAIN-module gating, but it also shows why MAIN candidates remain expensive: most safe-queue MAIN rows still perturb early ARM9 layout even when the source function itself is small.

## Process notes

- A stale ignored helper from prior HIGH waves only validated `dossiers-high`; I used a brief-local ignored helper for mechanical apply/revert, then read the normal `docs/research/dossiers/*.md` GROUND TRUTH sections directly for MED rows.
- No overlay candidates were attempted.
- No `src/` or delinks changes were kept for parked candidates.

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
wrote docs\research\README.md (372 notes)
python tools/generate_research_index.py --check
docs\research\README.md is current.

Markdown lint: not run; no local markdownlint/markdownlint-cli/mdl command was installed.
```
