[//]: # (markdownlint-disable MD013)

# Brief 522 - ov002 c-match safe-queue wave

Branch: `codex/cmatch-ov002-522`

Scope: ov002 rows from `docs/research/campaign-analytics/safe-queue-v3.md` section 4, starting with the three HIGH clone-cluster tinies, then sampling the smallest ov002 MED/retriage rows. Source/delink ownership was limited to ov002; no source or delink changes were kept for parked candidates.

## Outcome

- New EUR C ships: **0**
- New USA/JPN ports: **0**
- Current-main dedups: **3**
- Fresh object-level parks: **3**
- Remaining ov002 queue rows unattempted this wave: **15**

The first HIGH cluster was already mostly drained on current main. The only remaining HIGH tiny (`021e2e18`) still hits a compiler shape wall: mwcc prefers a compact conditional-move form and pulls the literal pool forward, shrinking the section from the original whole-function `.s`.

## Current-main dedups

These safe-queue rows are already C in EUR and already C-portable in USA/JPN shifted ov002 targets, so no diff was needed.

| EUR addr | Queue row | Current EUR | USA/JPN status |
|---|---:|---|---|
| `021e358c` | 2 | `src/overlay002/func_ov002_021e358c.c` | Already present as `src/{usa,jpn}/overlay002/func_ov002_021e349c.c` |
| `0229cd70` | 3 | `src/overlay002/func_ov002_0229cd70.c` | Already present as `src/{usa,jpn}/overlay002/func_ov002_0229cc60.c` |
| `0227d850` | 7 | `src/overlay002/func_ov002_0227d850.c` | Already present as `src/{usa,jpn}/overlay002/func_ov002_0227d760.c`; `port_to_region.py` re-ran cleanly with HIGH ov002 resolutions and produced no repository diff |

## Fresh parks

| Addr | Queue row | Evidence | Park reason |
|---|---:|---|---|
| `021e2e18` | 1 | Built object as C after `tools/containment_check.py eur --addr 0x021e2e18 --module ov002`; full EUR ROM hash failed when tested. Object bytes used `ldr r1,[pc,#12]; cmp; movne #1; moveq #0; bx; pool`, with pool at `+0x14`. | mwcc conditional-move compaction and shorter section; pragma and goto variants still emitted the same compact object. Original `.s` has branch-shaped `bne`, two return blocks, and pool at `+0x1c`. |
| `022627ac` | 47 | Dossier recipe compiled cleanly; first draft saved the index in `r4`; reload reshape removed the saved index but still emitted `blx r0`, `moveq`/`popeq`, and an extra `data_ov002_022d016c+0xd2c` pool literal. | Register/literal-pool drift from the original `r1` table-call shape; restored `.s`. |
| `021b9830` | 6 | Dossier recipe compiled cleanly as a leaf; object emitted `push {r3,r4,r5,r6,r7,lr}`, `tst lr,#0x1fff`, and an extra `0x1fff` pool literal. | Bitfield/loop recipe did not reproduce original shift-pair/register allocation (`push {r4,r5,r6,lr}`, `lsl #0x13; movs ... lsr #0x13`); restored `.s`. |

## Unattempted ov002 rows

The remaining ov002 safe-queue rows remain for a future focused wave:

`021b2e04`, `021b08a8`, `021b0a30`, `021b1e80`, `021b29c0`, `021b3864`, `021bbda8`, `021bd85c`, `021c1954`, `021c2c54`, `021c32d4`, `021d1974`, `0225368c`, `022536e8`, `0228791c`.

## Process notes

- `tools/port_to_region.py` was useful for confirming existing regional ports. It refuses source files whose comments contain unprefixed overlay-looking symbols, even when the actual ov002 symbol resolution is HIGH; future port waves should either ignore comments or pre-strip comments in a scratch copy before using the helper for evidence.
- No `src/` or `config/*/arm9/overlays/ov002/delinks.txt` changes are kept in this branch.
- This wave did not touch main or non-ov002 overlays.

## Verification

Pre-publish SHA gates after restoring all source/delink experiments; the kept
branch diff is documentation-only:

```text
python3.13 tools/configure.py eur && ninja -j4 sha1
gx-spirit-caller_eur.nds: OK

python3.13 tools/configure.py usa && ninja -j4 sha1
gx-spirit-caller_usa.nds: OK

python3.13 tools/configure.py jpn && ninja -j4 sha1
gx-spirit-caller_jpn.nds: OK
```
