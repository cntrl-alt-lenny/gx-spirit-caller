# Cross-region port residual triage

Snapshot: the final `q-crossregion-port-drain-3` residual at task-start
`7c28f92f8` / PR #1395. This is a tool-derived census of the 1.0-sim
backlog after 160 ports; it is not a new port attempt.

## At a glance

| Region | sim==1.0 backlog | Gate-fail | Port-refused | Needs `symbols.txt` | Sub-1.0 (excluded) |
|---|---:|---:|---:|---:|---:|
| USA | 76 | 32 | 43 | 1 | 2 |
| JPN | 78 | 32 | 45 | 1 | 2 |

The retained `batch_port.py` park lists were reduced to the last status for
each target name. `build/port_parked_usa3c.txt` gives USA 43/32/1 and
`build/port_parked_jpn3.txt` gives JPN 45/32/1. The source census is
`build/port_backlog.json` produced by `python tools/port_census.py`.

## Gate-fails: actual failure mode

The 32 gate-fails are the same target set in both regions. The diagnostic
replay staged each candidate through `BatchPorter._stage`, regenerated the
region configuration, and ran the candidate object through Ninja. The one
compile-clean candidate was then run through the full `ninja sha1` gate.

| Failure mode | USA | JPN | Reproducible diagnostic |
|---|---:|---:|---|
| Compiler error: undefined identifier `D016C` | 23 | 23 | `ninja -j1 build/<region>/src/<region>/overlay002/func_*.o` |
| Compiler error: undefined identifier `CE288` | 8 | 8 | same object-only command |
| Link error: undefined `data_0219a92c_alias` | 1 | 1 | full `ninja sha1` after `func_0202864c` staging |
| Byte mismatch | 0 | 0 | no candidate reached the SHA-1 comparison |
| Other | 0 | 0 | — |

The object-level compile groups are identical in both regions:

- `D016C` (23): `func_ov002_021b00a4`, `func_ov002_021b1c10`,
  `func_ov002_021bbeb8`, `func_ov002_021c3c10`, `func_ov002_021e2be4`,
  `func_ov002_021eab98`, `func_ov002_021ff480`, `func_ov002_02202b9c`,
  `func_ov002_02202c18`, `func_ov002_02203bc4`, `func_ov002_02204920`,
  `func_ov002_02205bb0`, `func_ov002_022061f0`, `func_ov002_02207da4`,
  `func_ov002_0220d9b0`, `func_ov002_0221b5e4`, `func_ov002_02224aa0`,
  `func_ov002_02255f9c`, `func_ov002_022592c0`, `func_ov002_0226ba08`,
  `func_ov002_0226c494`, `func_ov002_02280604`, `func_ov002_02286ce0`.
- `CE288` (8): `func_ov002_021e72b4`, `func_ov002_022318a4`,
  `func_ov002_02233114`, `func_ov002_02234560`, `func_ov002_02234a5c`,
  `func_ov002_0223b07c`, `func_ov002_0225761c`, `func_ov002_02257844`.
- Link-only candidate: `func_0202864c`, with the same undefined data alias
  in USA and JPN.

These are recoverable as compiler/linkage cleanup classes, not byte-match
evidence. The `D016C` and `CE288` classes need the generated C's missing
constant definitions or the correct representation of those constants. The
link-only case needs the target-region data alias made available. No
byte-mismatch escalation is justified by this run.

## Port refusals: stated reasons

`port_to_region.py --json --confidence-floor HIGH` was replayed for every
last-status `port-refused` row. The table uses one exclusive primary bucket
for totals; rows with multiple failed resolutions are assigned to the most
specific unresolved-symbol bucket first. The underlying flags overlap, as
shown below the table.

| Primary refusal reason | USA | JPN | Meaning from the tool |
|---|---:|---:|---|
| MEDIUM sibling confidence only | 29 | 29 | Auto-promoted LOW→MEDIUM, still below the HIGH floor |
| LOW plus MEDIUM ambiguity | 3 | 3 | A competing candidate remained LOW after the shift anti-match |
| Unresolved data symbol, no function-symbol failure | 6 | 6 | No target-region data symbol/address mapping |
| Unresolved function symbol, including mixed rows | 5 | 6 | No EUR symbol for a referenced function address |
| Placeholder twin / EUR-only rename | 0 | 1 | JPN `Copy32` → placeholder `func_020943f8` |
| **Total** | **43** | **45** | |

The non-exclusive failed-resolution flags are: unresolved data on 7 rows per
region (6 unique missing data names, because one is referenced twice),
unresolved function symbols on 5 USA / 6 JPN rows, LOW confidence on 3 rows
per region, and the placeholder-twin guard on 0 USA / 1 JPN row. The
placeholder-twin case is directly recoverable by propagating the `Copy32`
rename to JPN. The unresolved data rows are candidates for a mechanically
derived target data-symbol mapping; the unresolved function rows need a
real EUR symbol mapping before retry. The MEDIUM/LOW rows are not safe
automatic ports at the current HIGH floor.

The one `symbols.txt`-line park in each region is
`func_ov002_022aaea8`; it is separate from the 43/45 confidence refusals and
needs the new target data-symbol line before it can link.

## The two sub-1.0 entries per region

Both regions have the same two excluded `main` entries in the census:

| Target | EUR source twin | Masked-byte similarity | Size |
|---|---|---:|---:|
| `func_0204f34c` | `src/main/func_0204f3c0.legacy_sp3.c` | 0.9422268907563025 | 952 |
| `func_020500a4` | `src/main/func_02050118.legacy_sp3.c` | 0.95 | 40 |

They are not part of the sim==1.0 drain. The census provides no basis for
calling either a port-safe twin, so they remain out of scope for this lane.

## LOW placeholder floor

The mechanical sibling audit found 8 LOW-confidence placeholder target twins
in both USA and JPN. All are `main` functions with the same stated matcher
rationale: `size+ish match, no relocs to compare`.

| EUR named function | EUR address | USA/JPN placeholder | USA/JPN address |
|---|---:|---|---:|
| `OsCountZeroBits` | `0x02079e70` | `func_02079d88` | `0x02079d88` |
| `Vram_GetBankBaseE` | `0x0208deec` | `func_0208de04` | `0x0208de04` |
| `Vram_GetBankBaseCD` | `0x0208df40` | `func_0208de58` | `0x0208de58` |
| `OSi_RemoveLinkFromQueue` | `0x020921a8` | `func_020920c0` | `0x020920c0` |
| `Copy32` | `0x020944d4` | `func_020943f8` | `0x020943f8` |
| `Strlen` | `0x020a6a00` | `func_020a690c` | `0x020a690c` |
| `Strchr` | `0x020ab088` | `func_020aaf94` | `0x020aaf94` |
| `FindU16InArray` | `0x020ace98` | `func_020acda4` | `0x020acda4` |

LOW is the correct propagation floor here: these rows have size/ISA evidence
but no relocation evidence, and the matcher did not produce HIGH confidence.
There are no safely propagatable LOW placeholders from this audit alone.
The JPN `Copy32` placeholder is nevertheless exposed by the separate
placeholder-twin refusal because a different candidate references the named
EUR function; that is the one rename worth propagating first.

## Reproduction record

Commands and tool outputs used for the counts:

```text
python tools/port_census.py
python tools/port_to_region.py <eur-source.c> --target usa --confidence-floor HIGH --json
python tools/port_to_region.py <eur-source.c> --target jpn --confidence-floor HIGH --json
python -m pytest -q tests
```

The retained batch logs are `build/port_usa3*.log` and
`build/port_jpn3*.log`; the final park lists are the two files named above.
The full-suite baseline on the clean report worktree was `3117 passed,
27 skipped, 59 subtests passed`. The post-report run is required to remain
identical; this report does not modify build inputs.
