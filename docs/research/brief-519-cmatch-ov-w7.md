# Brief 519 — safe-queue overlay C-match wave 7

Date: 2026-07-03  
Branch: `decomper/c-match-ov-519`  
PR: https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/1086

## Scope

Worked only overlay (`ovNNN`) candidates from
`docs/research/campaign-analytics/safe-queue-v3.md`, skipping:

- `main` candidates.
- all `RETRIAGE` rows per brief 519.
- rows already matched on main (`021e358c`, `0229cd70`, `021b2b80`).

For overlay containment, I did not use `tools/containment_check.py`; each
attempt compared the overlay binary directly:

`extract/<region>/arm9_overlays/ovNNN.bin` vs
`build/<region>/build/arm9_ovNNN.bin`, with the candidate range translated by
the overlay `.text` base from that region's `delinks.txt`.

## Summary

| Metric | Count |
|---|---:|
| eligible overlay/non-RETRIAGE candidates attempted | 7 |
| EUR matches accepted | 1 |
| USA ports accepted | 1 |
| JPN ports accepted | 1 |
| avalanche parks | 6 |
| non-avalanche parks | 0 |

Matched function:

- EUR `src/overlay002/func_ov002_0227d850.c`
- USA `src/usa/overlay002/func_ov002_0227d760.c`
- JPN `src/jpn/overlay002/func_ov002_0227d760.c`

## Candidate results

| Rank | Candidate | Overlay | Result | Manual containment evidence |
|---:|---|---|---|---|
| 1 | `021e2e18` | ov002 | PARK: avalanche | outside runs `96130`, outside bytes `805327`; first outside `0x021aaa24..0x021aaa25`, before candidate `0x021e2e18..0x021e2e38` |
| 4 | `021b28f4` | ov016 | PARK: avalanche | outside runs `2562`, outside bytes `24107`; first outside `0x021b23e4..0x021b23e5`, before candidate `0x021b28f4..0x021b296c` |
| 7 | `0227d850` | ov002 | MATCHED | first draft contained: `12` bytes, all inside. After byte-pack reshape: `0` diff bytes; resolved fastmatch `100.0%`; EUR sha1 OK |
| 9 | `021ca518` | ov006 | PARK: avalanche | outside runs `777`, outside bytes `4390`; first outside `0x021b2720..0x021b2721`, before candidate `0x021ca518..0x021ca570` |
| 10 | `021b4f1c` | ov019 | PARK: avalanche | outside runs `342`, outside bytes `2422`; first outside `0x021b2fd0..0x021b2fd1`, before candidate `0x021b4f1c..0x021b4fdc` |
| 11 | `021cab6c` | ov006 | PARK: avalanche | outside runs `492`, outside bytes `2938`; first outside `0x021b2720..0x021b2721`, before candidate `0x021cab6c..0x021cac08` |
| 12 | `021ceebc` | ov011 | PARK: avalanche | outside runs `2010`, outside bytes `18133`; first outside `0x021c9de0..0x021c9de1`, before candidate `0x021ceebc..0x021cef38` |

## Match notes

`ov002:0227d850` started as a contained near miss. The initial draft produced
two repeated byte-pack diffs:

- wanted `and r0, r0, #0xff` then `orr r0, r1, r0, lsl #8`
- got `lsl r0, r0, #24` then `orr r0, r1, r0, lsr #16`

Changing the high byte expression from a mask form to the recipe's cast form:

```c
((unsigned char)r << 8)
```

made the EUR object resolve to `100.0%` and reduced the manual ov002 binary
diff to zero. `ninja sha1` then accepted EUR. `port_to_region.py` resolved all
real symbols at HIGH/EXACT for USA/JPN after removing stale prep comments that
looked like a non-overlay `func_0227d850` symbol. Both ports resolved to
`100.0%`, had zero manual ov002 binary diff, and passed sha1.

## Final gates

Final commands used `ninja sha1` targets only, not bare `ninja`.

```text
gx-spirit-caller_eur.nds: OK
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

## Remaining safe-queue-v3 overlay runway

For the brief-519 scope (overlay rows, non-RETRIAGE only), the eligible
safe-queue-v3 entries are exhausted on this base:

- ranks `2`, `3`, and `130` were already matched on main before this wave.
- rank `7` matched here.
- ranks `1`, `4`, `9`, `10`, `11`, and `12` parked as overlay avalanches.
- all RETRIAGE overlay rows were intentionally skipped per brief 519.
