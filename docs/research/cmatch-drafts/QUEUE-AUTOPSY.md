# Brief 606 queue autopsy

The requested pre-draft queue is exhausted on the current `origin/main`.
The master ledger has **395** unmatched rows: **246 ARM** and **149 Thumb**.
Every one of the 246 ARM rows is already marked `attempted`, so the exact
eligibility predicate from `pick-lists.md` produces **0** never-attempted ARM
singletons. The remaining never-attempted population is **96 Thumb rows**:
12 in `main` and 84 in `ov004`.

This is a provenance/queue issue, not an `m2c_feed.py` failure. No draft was
generated because there was no eligible function to pass to the tool, and no
delinks or build gates were touched.

## Deterministic fallback

The following are the 40 smallest documented ARM singletons, sorted by size,
then region, module, and address. They are **not** never-attempted candidates;
they are recorded only to make the next brief's replacement rule explicit.

| Name | Region | Module | Size | Park reason |
|---|---|---|---:|---|
| `AutoloadCallback` | JPN | main | 4 | |
| `OS_DefaultIrqHandler` | JPN | main | 4 | |
| `__sinit_ov002_022ca6f0` | JPN | ov002 | 4 | |
| `__sinit_ov002_022ca6f4` | JPN | ov002 | 4 | |
| `func_ov005_021aa3c0` | JPN | ov005 | 4 | |
| `func_ov009_021aa3c0` | JPN | ov009 | 4 | |
| `AutoloadCallback` | USA | main | 4 | |
| `OS_DefaultIrqHandler` | USA | main | 4 | |
| `__sinit_ov002_022ca6f0` | USA | ov002 | 4 | |
| `__sinit_ov002_022ca6f4` | USA | ov002 | 4 | |
| `func_ov005_021aa3c0` | USA | ov005 | 4 | |
| `func_ov009_021aa3c0` | USA | ov009 | 4 | |
| `GetSystemWork` | JPN | main | 12 | |
| `GetSystemWork` | USA | main | 12 | |
| `main` | JPN | main | 16 | endgame-floor |
| `OSi_IrqHandlerTimer3` | JPN | main | 16 | |
| `OSi_IrqHandlerTimer2` | JPN | main | 16 | |
| `OSi_IrqHandlerTimer1` | JPN | main | 16 | |
| `OSi_IrqHandlerTimer0` | JPN | main | 16 | |
| `OSi_IrqHandlerDma3` | JPN | main | 16 | |
| `OSi_IrqHandlerDma2` | JPN | main | 16 | |
| `OSi_IrqHandlerDma1` | JPN | main | 16 | |
| `OSi_IrqHandlerDma0` | JPN | main | 16 | |
| `main` | USA | main | 16 | endgame-floor |
| `OSi_IrqHandlerTimer3` | USA | main | 16 | |
| `OSi_IrqHandlerTimer2` | USA | main | 16 | |
| `OSi_IrqHandlerTimer1` | USA | main | 16 | |
| `OSi_IrqHandlerTimer0` | USA | main | 16 | |
| `OSi_IrqHandlerDma3` | USA | main | 16 | |
| `OSi_IrqHandlerDma2` | USA | main | 16 | |
| `OSi_IrqHandlerDma1` | USA | main | 16 | |
| `OSi_IrqHandlerDma0` | USA | main | 16 | |
| `func_01ff8400` | JPN | itcm | 20 | |
| `OS_DisableIrq` | JPN | main | 20 | codegen-walls |
| `Fill32` | JPN | main | 20 | C-25 |
| `func_ov013_021c9c80` | JPN | ov013 | 20 | |
| `func_01ff8400` | USA | itcm | 20 | |
| `OS_DisableIrq` | USA | main | 20 | codegen-walls |
| `Fill32` | USA | main | 20 | C-25 |
| `func_ov013_021c9c80` | USA | ov013 | 20 | |

Recommended next input: explicitly authorize a documented-but-unattempted
fallback, or switch the draft lane to the 96 never-attempted Thumb rows.
