# Batch 05: Verifier review

Reviewed commit: `da1fb9839ab5d1097b914f02bbd26fbb6825a25f` on `worker/batch-05`.
Reviewed in `.worktrees/verifier-batch-05` on branch `verifier/batch-05`, on
Windows 11 with `python`. The gate log and scratch scripts were kept outside
the worktree.

## Commands I ran myself

| Command | Exit | Real output |
|---|---|---|
| `git diff --stat origin/main...da1fb9839` | 0 | 99 files: 48 `src/main/*.c` added (43 `.legacy_sp3.c`, 5 `.c`), the same 48 `.s` deleted, `config/eur/arm9/delinks.txt`, `docs/ledger/attempts.tsv`, `docs/batches/batch-05.md`. No file under `tools/` (so `tools/reference_baseline.txt` is unchanged), no USA/JPN, no symbols. |
| `python tools/gate3.py --scope all --log <scratch>/gate.log` (not piped) | 0 | see next row |
| PowerShell log check from `AGENTS.md`, verbatim | 0 | `27084:[eur] SHA1 PASS`, `52682:[usa] SHA1 PASS`, `78281:[jpn] SHA1 PASS`, `78321:1330 passed, 15 skipped, 132 subtests passed in 21.79s`, `78324:==================== GATE PASS ====================`, `78325:gate3: GATE EXIT 0`. No region `SKIP`. |
| (inside the gate) `check_delink_dupes.py` | 0 | `check_delink_dupes: OK (81 delinks.txt, no duplicate .text addresses)` |
| (inside the gate) `check_references.py` | 0 | `wrong-target 412 (baseline entries 5926)`, `check_references: OK` |
| (inside the gate) `check_fake_matches.py` | 0 | `register-pin 0, do-while-zero 3, volatile-local 1 (baseline entries 4)`, `check_fake_matches: OK` (same counts as batch 02) |
| `python tools/fastmatch.py eur <all 48 new .c files>` | 0 | 48 lines with `100.0%` and no other line |
| `python tools/validate_attempts.py` | 0 | `"rows": 2093`, `"errors": 0`, `"shape_conflicts": 66` (all 66 are older rows; none mention batch-05) |
| `python tools/progress.py --version eur` | 0 | `Natural-C: 431298 / 2385948 bytes (18.08%)` |
| `python tools/check_match_invariants.py --version eur` | 1 | `Found 13999 issue(s): 0 error(s), 13999 warning(s).` Warnings only. |
| `python tools/wall_aware_headroom.py --exclude-attempted --max-size 256 --min-addr 0x02050000 --max-addr 0x0205ffff` | 0 | `TOTAL candidate EUR .s remaining: 0`, `excluded by attempts ledger: 972` |
| same without `--exclude-attempted` | 0 | `TOTAL candidate EUR .s remaining: 27` (all with ledger rows) |
| A script over the `attempts.tsv` and `delinks.txt` diffs | 0 | see below |
| A script compiling each of the 43 tier-suffixed files with the build's flags under 2.0/sp1p5 and under its own tier, comparing `.text` bytes | 0 | 43 of 43 differ |

Natural-C: 431,298 - 424,482 = **6,816 B**. That equals the sum of the 48
latest-shipped rows' `text_size` (6,816), and of their `delinks.txt` spans.

## Pass one

- **Honest C (check 1).** I read all 48 files. No inline asm, `volatile`,
  `register`, pragma, `#if`/`#define`, raw data words or do-while-zero (a grep
  for those tokens over the new files returns nothing). Fields are named by
  offset (`x4`, `x8`) and struct names are guesses, but no construct is there
  only to move a register. I compared three against their original `.s` on
  `origin/main`:
  - `func_020534d4`: the 64-bit `id` is masked with `0x80000000`; the original
    compares the low-7-bit hash (sign-extended to 64 bits) with `r4`, the
    saved high word of `id`. The C `h == (id >> 32)` says the same.
  - `func_02056b38`: the trailing `if (r == 0) return 0; return r;` is the
    original's `cmp r0,#0; moveq r0,#0`. Every branch and call order in the C
    follows the original.
  - `func_0205d6f8`: the `= {0}` plus five explicit zero stores, and the
    repeated `key <= 0` test (assert call, then guard), are both in the
    original (seven stores through `r1` from `sp+4`, then stores to
    `[sp,#4..0x1c]`; two `cmp r4,#0`).
- **Exact match (check 2).** 48 of 48 at `100.0%` (resolved comparison, so
  pool values and BL targets count). The gate's three SHA1 passes confirm the
  bytes in the ROM.
- **Tiers (check 3).** The 43 `.legacy_sp3.c` files each produce different
  `.text` under 2.0/sp1p5 than under 1.2/sp3. Together with the ledger's own
  default-tier `parked` row (a score below 100) for every one of them, the
  non-default tier is needed. The 5 files at the default tier
  (`func_02053114`, `02053c34`, `0205aecc`, `0205d560`, `0205d5c8`) need no
  justification. No `.legacy.c` file ships. `delinks.txt`: the diff has 96
  changed lines, 48 `-src/main/func_X.s:` and 48 `+src/main/func_X.<suffix>:`
  pairs, and a script confirmed each pair changes only the extension. Each
  suffix equals the latest shipped row's `tier`, and each block's `.text`
  start/end span equals the row's `text_size`. The two parked blocks
  (`func_02056c34`, `func_0205c258`) are not in the diff.
- **Ledger (check 4).** 106 added rows (the diff is additions only, so
  existing rows are untouched). 50 distinct addresses, all `brief=batch-05`,
  none of which had a row on `origin/main` (script: the overlap is empty). 49
  `shipped` rows (48 files plus `0x0205c258`), the rest `parked`. Every tier
  tried has its own row. Parked `.s` files and blocks are byte-identical to
  `origin/main` (not in the diff). `validate_attempts.py` exits 0;
  `tool-anomaly` has a row in `tools/park_class_map.tsv` (line 320).
  - `func_0205c258`: it has a `shipped` row (default, 100) followed by a
    `parked`, `unknown`, `tool-anomaly` row. `func_0205c258.s` and its
    `delinks.txt` block are untouched by the diff, and there is no
    `func_0205c258.c`, so it really is back on `.s`. The stated reason holds
    up: the original's fifth pool word is `data_02100b70+0x4`, which the
    reference check resolves to `data_02100b74`; `symbols.txt` lists that
    symbol but `src/main/data/data_02100b70.c` defines it only as part of a
    20-byte `unsigned int` bundle. That is a missing data symbol rather than a
    tool anomaly (NOTE 2).
  - `func_02056c34`: three `parked` rows (`.c` 70.7, `.legacy_sp3.c` 22.4,
    `.legacy.c` 3.3), file back on `.s`.
- **Gate (check 5).** Passed, quoted above, run on `da1fb9839` itself.
- **Progress (check 6).** The gain equals the matched functions' sizes,
  6,816 B.
- **Candidates (check 7).** The unfiltered headroom run lists 27 candidates;
  the filtered one lists 0. The ledger has rows for all 50 batch-05 addresses
  and the other candidates have rows from earlier briefs. Five more `.s`
  files I counted by hand without a ledger row (`02051c4c`, `020529e8`,
  `02054700`, `020548f4`, `0205c9a0`) are 276-320 B by their `delinks.txt`
  spans, so over the 256 B limit.
- **Least trusted three.** `func_020534d4` (64-bit compare), `func_02056b38`
  (redundant-looking tail) and `func_02053114` (the `0xedb88320` immediate,
  the 0x400-byte table, the `0x3c` length and the compare against
  `[r4,#0x3c]` all agree with the original). No wrong reference, wrong type
  or accidental match found.

## Pass two

I opened `docs/batches/batch-05.md` for its `func_0205c258` section while
still in pass one (a search for that address, for the check-4 question). I
had already derived the same conclusion from the ledger, `.s` and
`delinks.txt` diffs, so it did not change a finding.

- The summary's numbers agree with mine: 48 matched, 6,816 B, gate lines,
  `rows 2093`, `errors 0`, `431298`, `wrong-target 412 (5926)`.
- It says `reference_baseline.txt` is identical to `origin/main`: confirmed
  by the diff (no `tools/` file).
- "Things to check", on the merits:
  - *Callee declarations differ from definitions.* Real. For example
    `src/main/func_02052b0c.legacy_sp3.c` defines a `void` function and
    calls `func_020529e8` as `void`, while `func_02052974` declares it `int`
    and tests the result; the original caller does `bl func_02052b0c; cmp
    r0,#0`. The callee definitions are what is imprecise (they drop an `r0`
    the original returns) and they were not touched. Each C file compiles on
    its own, so nothing breaks (NOTE 1).
  - *Casts, function-pointer casts, local struct types, struct by value.*
    Acceptable. The casts reproduce the original's untyped `int` arguments
    and the byte-for-byte match shows they do not change code. Field names
    are guesses, as the summary says.
  - *Redundant-looking C that mirrors the original.* Confirmed for
    `func_02056b38` and `func_0205d6f8` above; `func_0205fd94`'s `return n`
    matched without a zero move.

## Findings

1. [NOTE] `src/main/func_02052b0c.legacy_sp3.c`, `func_0206eea0.legacy.c`,
   `func_02054c64.legacy.c`, `func_02054840.c`, `func_02054cf8.legacy_sp3.c`,
   `func_0205d674.c`: older callee definitions are under-declared (void or
   fewer parameters) while the new callers declare the real shape. How it
   fails: nothing now, since the build compiles each file on its own. A
   future C caller written against the old definitions would lose a return
   value or an argument. Fixing the definitions is outside this batch's
   scope; worth a follow-up.
2. [NOTE] `docs/ledger/attempts.tsv`, last row for `0x0205c258`: class
   `tool-anomaly` with `match_pct` `unknown`. The cause is a missing
   `data_02100b74` definition inside a data bundle, so the class says "tool
   follow-up" for a data-carve problem (the Worker flagged this). Also the
   earlier `shipped` row for the same address stays in the ledger, so a
   script that counts `shipped` rows per address, rather than the latest row,
   would count this `.s` function as shipped: the batch has 49 `shipped` rows
   for 48 shipped files. The latest row is correct.
3. [NOTE] `docs/ledger/attempts.tsv`, `0x02056c34`: the latest row by file
   position is the `.legacy.c` 3.3% attempt, not the best attempt (`.c`
   70.7%). All three are `parked` and the file is on `.s`, so the state is
   right; only a "latest row = best score" reading would be off.

No BLOCKER and no SHOULD FIX. No UNPROVEN CLAIM: every number in the Worker
summary that I tried to reproduce, reproduced.

## Not verified

- `origin/main`'s own Natural-C before the batch (424,482 B). I derived it as
  431,298 - 6,816; it agrees with the figure in the task and with the batch-02
  review, but I did not build `origin/main`.
- Whether the files would also match under other compilers or tiers beyond
  those I compared (2.0/sp1p5 against the shipped tier). The ledger records
  what the Worker tried.
- USA and JPN beyond the gate's `SHA1 PASS` (the batch does not touch them).
- Struct field names and inferred types beyond what the original
  instructions and relocations show.
- The 13,999 `dsd-placeholder name` warnings from `check_match_invariants.py`
  (all warnings, the same class as earlier batches).

## Verdict

I believe `da1fb9839` does what the objective says: 48 EUR main functions of
256 bytes or less in 0x02050000-0x0205ffff are now honest C that matches 100%
(resolved) and rebuilds all three ROMs byte-identical, the gain is exactly
6,816 B, every non-default tier is needed, the delinks and ledger edits are
confined to the batch, the two parked functions are back on `.s` exactly, and
the reference baseline did not change. The findings are notes about
neighbouring definitions and ledger bookkeeping. Confidence is high.
