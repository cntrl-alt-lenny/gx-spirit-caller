[//]: # (markdownlint-disable MD013 MD041)

# Brief 473 — ov002 LOWER batch-carve, next wave

**Brief:** 473 (scaffolder). Continue the EUR ov002 lower-half mechanical
`.s` lane (`addr < 0x02234000`) from merged brief 471 / PR #1010. Enumerate
the live residue, carve about 100 byte-exact functions, sort delinks, and
verify all three regional ROMs.

## Result — 100 ships, 100% clean, 3-region green

| batch | shipped | refused | verify-fail | gate-fail | deferred | size band |
|---|---:|---:|---:|---:|---:|---|
| 1 | 50 | 0 | 0 | 0 | 0 | `0x124–0x13c` |
| 2 | 50 | 0 | 0 | 0 | 0 | `0x13c–0x154` |
| **total** | **100** | **0** | **0** | **0** | **0** | `0x124–0x154` |

Each 50-function batch was committed automatically only after its own green
EUR `ninja sha1` gate:

- `c8b59a18` — `+50 (0x124–0x13c)`;
- `5e52394e` — `+50 (0x13c–0x154)`.

All 100 new files are under `src/overlay002/`, all function addresses are
strictly below `0x02234000`, and the ov002 delinks file has no duplicate
function blocks.

## Lower-only enumeration

`batch_carve.py` has a minimum-address filter but no maximum-address filter.
The pre-wave census therefore generated a build-local skip list containing
the complete upper-half residue:

| upper-half function excluded | size |
|---|---:|
| `func_ov002_022b867c` | `0x248` |
| `func_ov002_022b5590` | `0x3cc` |

The carve used `--min-addr 0`, the upper exclusion list, and the existing
known verify-fail list. Post-run verification found **0 upper-half leaks**.

## Runway — still rich, not thinning

The live census uses the same symbol, delink, existing-source, and known-drop
filters as `batch_carve`.

| lower-half size band | before | after |
|---|---:|---:|
| `<= 0x140` | 65 | 0 |
| `0x141–0x200` | 198 | 163 |
| `0x201–0x400` | 127 | 127 |
| `> 0x400` | 53 | 53 |
| **total** | **443** | **343** |

The next candidate is size `0x154`. With 343 viable lower-half functions
remaining, including 180 above `0x200`, the lane is **not yet thinning**.
Another three waves near this size remain before the mechanical pool becomes
small.

## Delinks and gate

The requested explicit sort reported:

```text
3472 blocks, 0 inversions -> 0; no-op (already sorted)
```

Final region gates:

```text
gx-spirit-caller_eur.nds: OK
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```
