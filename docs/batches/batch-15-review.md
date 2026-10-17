# Batch 15: Verifier review

Reviewed commit `a16c006ef` on `worker/batch-15` (base `4f645d246`), from
`.worktrees/verifier-batch-15`.

## Commands

| Command | Exit | Output |
|---|---|---|
| `git diff --name-status 4f645d246...a16c006ef` | 0 | 41 `.s` deleted, 41 `.c` added; other changes only `delinks.txt`, `attempts.tsv`, `batch-15.md`; 0 removed ledger lines |
| `ninja sha1` (eur) | 0 | `gx-spirit-caller_eur.nds: OK` |
| `ninja report`, `matched_code_percent` of the 41 units | 0 | 41 of 41 at 100; summed `total_code` 5116 |
| each new file compiled under 2.0/sp1p5, 1.2/sp2p3, 1.2/sp3 | 0 | all 40 non-default files differ from the default `.text` |
| `validate_attempts.py` | 0 | `"rows": 3429`, `"errors": 0` |
| `gate3.py --scope all --log <outside>` | 1 | `[eur]`, `[usa]`, `[jpn]` `SHA1 PASS`; `STALE: [eur] src/main/func_02081ae0.s ...`; `check_references: FAIL`; `check_fake_matches: OK`; `1331 passed, 14 skipped`; `GATE EXIT 1` |
| `progress.py --version eur` | 0 | Natural-C `489390` (base 484,274: +5,116 = the 41 sizes) |
| `wall_aware_headroom.py --json --max-size 256 ...` plus symbol sizes | 0 | 28 `.s` of 256 B or less left; every one has a batch-15 row (84 rows, 3 tiers each) |

## Findings

1. **SHOULD FIX** `func_0208bf3c` (parked, best 90.0): plain C matches at
   1.2/sp2p3 (`.legacy.c`), 0 differing words against the assembled original
   (`bl` masked): `if (x > 0) { *(volatile u16 *)0x040002b0 = 1;
   *(volatile s64 *)0x040002b8 = (s64)x << 32; return func_0208be70(); }
   return 0;`. Same idiom as shipped `func_0208bfc4`. The park is wrong (80 B).
2. **SHOULD FIX** `func_02089f60.legacy_sp3.c:7,13`: `func_020890e4` is
   declared and called with no argument, but its definition takes `idx` and
   the original still has `a0` in `r0` at the `bl` (`mov r8, r0` leaves it).
   `func_020890e4(a0)` gives identical `.text`. The declaration hides a real
   argument.
3. **NOTE** `func_02085e74` and `func_02087444` return the result of
   `func_02084e0c` and `func_020955e8`, whose definitions are `void`. The
   original does read `r0` after the call, so the match follows it, but the
   extern disagrees with the callee's definition.
4. **NOTE** `func_020879a4` calls `func_02095270(o->f3c)`; the definition has
   four parameters and forwards `r1`-`r3`. The original loads only `r0`.
   Fewer, not more, arguments; no crutch.
5. **NOTE** `func_020944a4` is an `asm void(void)` taking three arguments;
   the caller `func_0208ffec` really loads `r0`-`r2`. No fault.
6. **UNPROVEN CLAIM** "one ledger row per tier": true for the 28 parked
   functions; the 41 shipped have one row (winning tier) only.
7. **NOTE** the summary says intermediate commits briefly route unmatched
   drafts; the branch is not bisectable.
8. **NOTE** `func_02081498` claim holds: `__clz` compiles to a call
   (`ldr ip; bx ip` default, `bl` in 1.2), and the repo already ships its
   `clz` functions as `asm`. Honest C cannot emit `clz`.

## Attacks

Honest-C read of all 41: no asm, pins, data words; `volatile` only on
hardware addresses. Least trusted: `func_02089f60` (finding 2), `02087444`,
`02088874` (callee arities agree with definitions). I also tried
`func_0208cfa4` (7 drafts; `ip`/`r3` permutation stays) and `func_0208be9c`
(3 drafts; constant-1 register stays): the walls stand.

## Pass two

The summary's gate claim is confirmed: the only failure is the one STALE line
for `func_02081ae0.s`; no new reference line. Thumb coverage (`0208b1ac`,
`0208b1c8`) stays pragma-only, as the summary says.

## Not checked

`fastmatch` (reports NOT-IN-GAP for C units); gate after removing the STALE
line; bisectability.

## Verdict

41 honest matches, 3-region SHA-1 and the 5,116 B gain hold, and the ledger
and coverage are complete. Not mergeable as-is on strictness alone: fix
finding 2 and move `func_0208bf3c` to its matching form. Brain deletes the
STALE baseline line in the merge branch.
