# Brief 509 — MED dossier-guided C-match wave 3

Scope: MED-tier dossier-guided reshaping only. HIGH-tier candidates were left to the scaffolder lane. A function counted as matched only after the upgraded resolved comparison (`ninja report`, or a direct resolved-object diff when the regional report generator panicked on an unrelated unit) and the region `ninja sha1` gate were both clean.

## Summary

- Attempted: 21 EUR candidates.
- Matched: 5 EUR candidates.
- Ported and verified: 5 USA, 5 JPN.
- Parked: 16.
- Deferred as new `.s`: 0.
- Yield: 5 / 21 = 23.8%.
- Throughput: about 1.3 confirmed EUR funcs/hour from first wave commit to final match commit.
- Remaining MED runway: `docs/research/dossiers/INDEX.md` has 498 dossier addresses; 23 now have same-address `src/main/*.c` files in this worktree, leaving about 475 dossier-address candidates before additional done-skip filtering.

## Accepted matches

| EUR | USA | JPN | Notes |
| --- | --- | --- | --- |
| `src/main/func_02000c4c.c` | `src/usa/main/func_02000c4c.c` | `src/jpn/main/func_02000c4c.c` | table lookup accessor; volatile reload shape preserved the three original table reads |
| `src/main/func_0207d274.c` | `src/usa/main/func_0207d18c.c` | `src/jpn/main/func_0207d18c.c` | default-root lookup; if-assign preserved `r4` across the callee |
| `src/main/func_02008d1c.c` | `src/usa/main/func_02008d00.c` | `src/jpn/main/func_02008d00.c` | render-slot query; dossier stride corrected from `[][8]` to `[][2]` |
| `src/main/func_02008c84.c` | `src/usa/main/func_02008c68.c` | `src/jpn/main/func_02008c68.c` | render-slot setter; same corrected two-word record stride |
| `src/main/func_02008c14.c` | `src/usa/main/func_02008bf8.c` | `src/jpn/main/func_02008bf8.c` | render-slot scanner; signed `/32` and `%32` were required for the original div/mod sequence |

## Parked candidates

Every parked candidate was restored to `.s`; no fallback `.s` ships were added.

| Address | Reason |
| --- | --- |
| `020125ac` | register-allocation mismatch after the dossier's const-materialization reshape |
| `020138b8` | large struct/bitfield scheduling mismatch; split loop did not improve resolved score |
| `020139fc` | magic-divide/permuter wall; volatile divisor attempt did not change the result |
| `02013aa0` | compare-chain/bitfield reshape fell to 25.6% resolved |
| `02013b4c` | dense switch/bitfield body stuck at 97.1%; jump-table epilogue placement differed |
| `02014b28` | compiler predicated the `s == 1` store instead of keeping the branch-to-store block |
| `0201bc3c` | ternary-call split still merged the call paths |
| `02000f84` | non-indexed dossier candidate; pointer/temp reshapes stayed at 76.5% |
| `0200c79c` | negative-index path still emitted inline return instead of the original route |
| `0208f458` | normal and legacy attempts both resolved at 21.4% |
| `02000cc4` | snapshot-copy register assignment improved to 72.2% but did not close |
| `0207d37c` | two-store halfword flag shape improved only to 25.0%; base-register scheduling wall |
| `0201d47c` | resolved report showed 100%, but EUR `ninja sha1` failed; parked per ROM gate |
| `0202b3d4` | resolved report showed 100%, but EUR `ninja sha1` failed; parked per ROM gate |
| `02009758` | side-effect global literal load stayed one instruction too early; best resolved score 89.5% |
| `02008f24` | first pass resolved at 73.0%; broad branch-layout and call-target scheduling mismatch, not the documented small store-order issue |

## Cluster yields and lessons

- Render-slot bitset cluster: 3 / 4 accepted this wave (`02008c14`, `02008c84`, `02008d1c`; `02008f24` parked). The dossier inferred `data_02105bb0[][8]`, but ground truth `add ..., rec, lsl #3` means an 8-byte record, i.e. two `u32` words. Correcting this to `[][2]` unlocked the query and setter.
- Default-root lookup: 1 / 1 accepted (`0207d274`).
- Table accessor reload shape: 1 / 1 accepted (`02000c4c`).
- SHA catches: `0201d47c` and `0202b3d4` both reached resolved report 100% but failed EUR ROM SHA-1. They stayed parked. This validates the brief 509 rule that the ROM SHA-1 remains the final truth.
- Regional report note: USA/JPN `ninja report` can panic inside `objdiff-core` on unrelated units. For the affected ports, I used direct per-function resolved-object diffs (`diff_count 0`) plus regional `ninja sha1 OK`.

## Final gates

```text
gx-spirit-caller_eur.nds: OK
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```
