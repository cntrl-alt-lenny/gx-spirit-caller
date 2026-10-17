# Batch 14: Verifier review

Reviewed commit `efc640279` on `worker/batch-14` (base `51fde3801`), from
`.worktrees/verifier-batch-14`.

## Commands

| Command | Exit | Output |
|---|---|---|
| `fastmatch.py eur` on the 53 new C files | 0 | all 53 `NOT-IN-GAP` (the gap objects are gone once a unit is C) |
| `ninja sha1` then `ninja report`, `matched_code_percent` per unit | 0 | `gx-spirit-caller_eur.nds: OK`; 53 of 53 units 100 |
| each file compiled under all three tiers, `.text` compared | 0 | see findings 1 and 8 |
| `validate_attempts.py` | 0 | `"rows": 2878`, `"errors": 0` |
| `check_delink_dupes.py` | 0 | `OK (81 delinks.txt, no duplicate .text addresses)` |
| `gate3.py --scope all --log <outside>` | 0 | `55:[eur] SHA1 PASS`, `25653:[usa] SHA1 PASS`, `51252:[jpn] SHA1 PASS`, `check_references: OK`, `check_fake_matches: OK`, `1331 passed, 14 skipped`, `GATE PASS`, last line `gate3: GATE EXIT 0` |
| `progress.py --version eur` | 0 | Natural-C `471966` (base 464,790: +7,176 = the 53 sizes, 7,236 less the 60 B reverted) |
| `wall_aware_headroom.py --json --max-size 256 ...` | 0 | 17 `.s` left; every one has a batch-14 row |

## Findings

1. **SHOULD FIX** `src/main/func_0207d520.legacy_sp3.c`: compiled under the
   default tier (`mwcc 2.0/sp1p5`) the `.text` is byte-identical to the shipped
   object, so the non-default tier is unjustified. It should be
   `func_0207d520.c` (delinks line and ledger tier change with it). The other
   50 non-default files differ under 2.0, as claimed.
2. **SHOULD FIX** `func_02076ad0.legacy.c:23` and `func_02076b74.legacy.c:25`:
   the match depends on `func_02076c4c(p[0], p[1])`, but the callee
   (`func_02076c4c.c`, 0x10 bytes, `return x == 3`) never reads a second
   argument. The declaration disagrees with the callee's code: either the
   callee has an unused second parameter or the extra argument is a codegen
   crutch. Other callee arities checked agree with their code
   (`func_020704e8`, `func_02079cc0`, `func_0207d914`, `func_0207dc5c`,
   `func_02073ac0` reads its sixth argument at `[sp,#0x1c]`).
3. **NOTE** `func_0207845c` is really back on `.s` (`.s` present, delinks line
   is `.s`, last ledger row is parked). The reason is correct: I put the C
   with `data_021020b5` into the tree; code and relocation matched, but the
   link fails with `Undefined : "data_021020b5"`. A fix needs a symbol-file
   change, which is Brain's call. I reverted my test.
4. **NOTE** the volatile in `func_02073a5c` is justified: the original
   reloads the global, and without `volatile` 17 words differ.
5. **NOTE** `func_0207b18c` comment says "bit is clear" but the loop breaks
   when it is set; `func_0207cbe0` has an unused `Dummy` struct;
   `func_0207db8c`/`dbf8` read `a[-1]`, before the struct.
6. **UNPROVEN CLAIM** every shipped function has one row, for the winning tier
   only; the doc says "tiers other than the one shipped" were not checked, so
   "every tier tried has a row" holds only for parked functions.
7. **NOTE** `fastmatch` cannot be re-run on this tree; the 100% evidence is
   the object report plus the three-region SHA-1.
8. Attack results: the three least trusted (`0207fff8`/`ff84`, `0207db8c`,
   `0207d520`) show no accidental match; references and fake-match lint pass.
   I tried `02078eec` (4 forms; `orr #0` stays), `02078f08` (2 forms, 10 and
   14 words off) and `0207ec28` (register swap stays). No match; the walls
   stand.

## Pass two: the tail merges

Both tails are dead epilogues of the same function: `func_02074e4c`
(`add sp; ldmia; bx lr`) and `func_0207708c` (`ldmia; bx lr`) sit directly
after an infinite `b` loop, nothing branches to them, and nothing references
their names. The worker's drafts compiled by me (sp2p3) give 124 B and 140 B,
equal to 116+8 and 128+12; the 124 B draft differs from the original only at
unrelocated `bl` words. I did not rebuild the ROM with merged blocks. For
Brain: `symbols.txt` still lists `func_02074dcc` as `size=0x80` and
`func_0207708c` as its own symbol, so the merge also needs a symbol decision.

## Not checked

Merged-block ROM rebuild; `check_match_invariants.py`; USA/JPN natural-C.

## Verdict

The 53 matches are honest C, link byte-identically in all three regions, and
the gain equals the matched sizes. Not mergeable as-is on strictness alone:
fix finding 1 (tier) and decide finding 2. The tail merges look sound but unbuilt.
