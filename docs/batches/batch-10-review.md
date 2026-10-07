# Batch 10: Verifier review

Reviewed commit: `6730c4ec5` on `worker/batch-10` (base `de2fe9f34`), in
`.worktrees/verifier-batch-10`, Windows, `python`. Checkout finished without a
lock. The Worker was the same model, so I read the code and re-ran everything.

## Commands I ran myself

| Command | Exit | Real output |
|---|---|---|
| `git diff --name-status de2fe9f34...6730c4ec5` | 0 | 50 `.c` added (49 + `batch-10.md`), 49 `.s` deleted, `delinks.txt` and `attempts.tsv` modified. Nothing else. |
| `python tools/fastmatch.py eur <the 49 .c>` | 0 | 49 lines `100.0%`, none below. |
| `python tools/gate3.py --scope all --log <outside worktree>` | 0 (wrapper), gate 1 | `78161:==== GATE FAIL ====`, `78163:gate3: GATE EXIT 1` |
| AGENTS.md PowerShell log check, verbatim | 0 | `26917:[eur] SHA1 PASS`, `52515:[usa] SHA1 PASS`, `78114:[jpn] SHA1 PASS`, `78158:1330 passed, 15 skipped`, no SKIP/INFRASTRUCTURE |
| (inside the gate) | | `check_references: FAIL`, four `STALE:` lines and no `NEW:`; `check_fake_matches: OK` |
| `python tools/check_fake_matches.py` | 0 | `volatile-local 1 (baseline entries 4)`, `OK` |
| `python tools/check_delink_dupes.py` | 0 | `OK (81 delinks.txt, no duplicate .text addresses)` |
| `python tools/validate_attempts.py` | 0 | `"rows": 2449, "errors": 0` |
| `python tools/progress.py --version eur` | 0 | `Natural-C: 455178`; 455,178 - 448,234 = 6,944 B = sum of the 49 sizes |
| `python tools/wall_aware_headroom.py --exclude-attempted --max-size 256 --min-addr 0x02020000 --max-addr 0x0202ffff` | 0 | `candidate EUR .s remaining: 0` |
| My script, base `.s` blocks of 256 B or less in range | 0 | 76; every one has a ledger row (49 + 12 this batch, 15 earlier) |
| Scratch compiles outside the repo | 0 | see findings |

## Pass one

- **Honest C:** all 49 read. No asm, pragma, `register` or data word; the
  three `do {` are real loops. `func_02021bac` addresses `data_02198434` two
  ways, but the original does too (two pool words).
- **Routing:** 28,180 lines before and after; exactly 49 differ, each `.s:` to
  `.c:` with the same stem. Default tier throughout.
- **Gate:** the only failure is four STALE lines, each naming a deleted `.s`:
  `func_020242d4.s +0x88`, `func_02024368.s +0xc0`, `+0xc4`, `func_0202b9b0.s
  +0x38`. Brain should delete them.
- **Ledger:** base is a byte-identical prefix; 82 rows appended, 11 columns.
  Ten parks have three tier rows with real scores; all park classes are in
  the raw column. Parked `.s` files are untouched and still routed.

## Findings

| # | Class | Where | What is wrong |
|---|---|---|---|
| 1 | SHOULD FIX | ledger `0x02023f7c` | A `shipped 100` row is followed by `parked unknown`. Nothing shipped: no `.c`, `.s` still routed. The latest row is right; the shipped row is a false record and counts as a ship in any tally (50 shipped rows, 49 shipped functions). |
| 2 | SHOULD FIX | ledger `0x02027048`, `0x02023f7c` | Parked with one default row and score `unknown`; the brief required three tiers and a real score. The Worker's reason (validator rejects parked at 100) is a tooling gap, not a score. |
| 3 | NOTE | `func_02023eb8.c:7` | `volatile unsigned int *r` is a volatile pointer local. The original does two loads of `0x04000000` (`ldr r1,[r2]`, `ldr r0,[r2]`), which only a volatile access produces, so it is honest. But the lint did not flag it (`volatile-local` stays 1, the unrelated baseline entry): a lint miss. The repo's own precedent (`Vram_GetBankBaseE.c`) is a file-scope macro; do that. |
| 4 | NOTE | `func_02020814` (89.5) | Park stands. My draft is identical except `movne;moveq` against the original's `moveq;movne`; eight spellings of the test all give `movne` first, and the 1.2 tiers change the prologue. |
| 5 | NOTE | `func_0202ba38` (78.3) | My draft matches except the original uses `r3` as the base and a second temp for `and #0xf0; and #0xff`. Register letters; park stands. |
| 6 | NOTE | `func_02024024` (77.4) | With `data_0219a8e4_alias` for the pool pointer my draft matches structurally; only register numbering differs. Park stands. |
| 7 | UNPROVEN CLAIM | `batch-10.md` | "alias recipe reference line would be NEW" for `02023f7c`/`02027048`: I did not reproduce it. `data_0219a8dc` and `data_0219a8ec` do have no alias in `symbols.txt` (checked), so the C-34 claim holds. |
| 8 | NOTE | `batch-10.md` | `0202b12c` scored 71.0 on `legacy_sp3` against 35.5 default, and was not iterated. A live lead left as a register wall. |

## Not verified

USA and JPN beyond the gate; the 1.2 tiers for the 49 shipped functions; the
alias recipe's effect on the reference check; the other six parks.

## Verdict

The 49 conversions are honest, match at 100% under the default tier, and the
gate's three ROMs, routing, ledger prefix, progress arithmetic and candidate
accounting all check out. The gate's failure is exactly the four expected
STALE lines. I would merge once Brain deletes them. No BLOCKER. The ledger
carries one false shipped row and two parks without a real score; I would
have the Worker append corrective rows and move the `volatile` into a macro.
Confidence high on the shipped set, medium on the parks.
