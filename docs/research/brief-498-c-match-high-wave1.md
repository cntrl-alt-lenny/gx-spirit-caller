[//]: # (markdownlint-disable MD013 MD041)

# Brief 498 — C-match HIGH campaign, wave 1

**Brief:** Launch the HIGH-tier C-matching campaign from `docs/research/c-match-prep/INDEX.json`. Take class A/B-style candidates from the 1,291-candidate HIGH pool, work clone-first, gate each EUR conversion on objdiff plus `ninja sha1`, then port confirmed matches to USA/JPN and verify their regional SHA-1 gates.

## Result — 53 EUR matches, 106 regional ports

| bucket | funcs |
|---|---:|
| HIGH candidates attempted | 66 |
| EUR objdiff 100% + EUR SHA-1 matched | 53 |
| USA/JPN ports added | 106 |
| total regional C units added | 159 |
| HIGH-but-stubborn deferred | 13 |
| HIGH candidates left unattempted | 1225 |

Campaign throughput for the first measured HIGH session was **53 unique EUR matches/day**. Counting region-specific source units after ports, this wave added **159 byte-identical regional C functions/day**.

No semantic renames were made in this wave; none of the converted address-symbol functions had a clear project-local name in the campaign context.

## Cluster-first slate

The successful slate was intentionally clone-heavy:

- 17 ov002 selector/getter clones around `0226af38..0226b298`;
- 9 previously verified ov002 gameplay/state candidates around `022806a4..02287774`;
- 5 legacy-SP3 main candidates around `02068df0..0206b06c`;
- 4 MMIO setter clones around `02005800..020058f0`;
- 3 null-default setter clones around `0206763c..0206766c`;
- 15 additional simple main or ov002 candidates that built cleanly.

One prepped candidate needed a small C-side correction before matching: `func_02034a48` must tail-call through `func_02033054` with `func_02034a38`, `Task_InvokeLocked`, and `0`, rather than calling `Task_InvokeLocked` directly.

## Deferred as HIGH-but-stubborn

These were attempted, failed objdiff after a small number of campaign-level tries, and were reverted to their original `.s` files:

| family | funcs | reason |
|---|---:|---|
| relative-offset table walker | 7 | all stopped at 72% objdiff; likely needs a family-specific C shape rather than per-function grinding |
| MMIO extract clones | 4 | resisted the first HIGH pass; parked instead of expanding into deeper register-order work |
| ov002 store initializers | 2 | low objdiff percentages (`7.69%` and `14.29%`) despite simple-looking prep |

Deferred addresses:

```text
02089134 02089198 020891fc 02089260 020892c4 02089328 0208938c
0208df0c 0208df60 0208e1cc 0208e220
022592b8 02259324
```

## Port notes

`tools/port_to_region.py` correctly rewrote the function references and produced USA/JPN delink entries for all 53 EUR matches. For six ov002 ported functions per target region, its data-symbol map did not cover four BSS symbols, so the regional sources needed the target-region BSS names applied manually:

| EUR BSS symbol | USA/JPN BSS symbol |
|---|---|
| `data_ov002_022cd524` | `data_ov002_022cd444` |
| `data_ov002_022cd71c` | `data_ov002_022cd63c` |
| `data_ov002_022cf16c` | `data_ov002_022cf08c` |
| `data_ov002_022d016c` | `data_ov002_022d008c` |

The first USA link caught those unresolved EUR data references. After the manual BSS-name correction, USA and JPN both verified byte-identical.

## Gates

EUR candidate gate:

```text
python tools/configure.py eur
ninja report
ninja sha1
```

The final EUR report showed every active C source from this wave at 100% objdiff, and `gx-spirit-caller_eur.nds: OK`.

Regional port gates:

```text
python tools/configure.py usa
ninja sha1
python tools/configure.py jpn
ninja sha1
```

Results:

```text
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

A first JPN gate invocation exceeded the 120-second command wrapper timeout before returning output; rerunning with a longer timeout completed normally and passed.
