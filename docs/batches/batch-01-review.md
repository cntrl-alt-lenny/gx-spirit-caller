# Batch 01: Verifier review

Reviewed commit: `08ab04cf4` on `worker/batch-01` (34 commits on top of
`origin/main`; the last, `batch-01: worker summary`, adds only
`docs/batches/batch-01.md`). Reviewed in `.worktrees/verifier-batch-01` on
branch `verifier/batch-01`, on Windows 11 with `python`.

## Commands I ran myself

| Command | Exit | Real output |
|---|---|---|
| `git diff --stat origin/main...08ab04cf4` | 0 | 65 files: 31 `src/main/*.c` added, the same 31 `.s` deleted, `config/eur/arm9/delinks.txt`, `docs/ledger/attempts.tsv`, `docs/batches/batch-01.md`. Nothing else; no `tools/`, baseline, settings, USA/JPN or symbols change. |
| `python tools/gate3.py --scope all --log <scratch>/gate-batch01.log` (first try) | 2 | `gate3: ./dsd (or ./dsd.exe) missing` — the fresh worktree had no `dsd.exe`. Copied the primary checkout's `dsd.exe` (same SHA-1 `2f5346c5…`) and re-ran. Not a content failure. |
| `python tools/gate3.py --scope all --log <scratch>/gate-batch01.log` | 0 | see the log check below |
| PowerShell log check from `AGENTS.md`, verbatim | 0 | `27173:[eur] SHA1 PASS`, `52771:[usa] SHA1 PASS`, `78370:[jpn] SHA1 PASS`, `78410:1330 passed, 15 skipped, 132 subtests passed in 26.81s`, `78413:==================== GATE PASS ====================`, `78414:gate3: GATE EXIT 0`. No region `SKIP` line (the 15 are pytest skips). |
| (inside the gate) `tools/check_delink_dupes.py` | 0 | `check_delink_dupes: OK (81 delinks.txt, no duplicate .text addresses)` |
| (inside the gate) `tools/check_references.py --version eur --version usa --version jpn` | 0 | `check_references: OK` (baseline entries 5931) |
| (inside the gate) `tools/check_fake_matches.py --version eur --version usa --version jpn` | 0 | `register-pin 0, do-while-zero 3, volatile-local 1 (baseline entries 4)`, `check_fake_matches: OK` |
| `python tools/fastmatch.py eur <file>` on each of the 31 new `.c` files | 0 ×31 | every one `100.0%  OK  (resolved, N words, …)`; word counts × 4 equal the ledger sizes (e.g. `func_02031d98` 58 words = 232 B) |
| `python tools/validate_attempts.py` | 0 | `"rows": 1923, "errors": 0`; only pre-existing `shape-conflict` notes, none for batch-01 |
| `python tools/progress.py --version eur` | 0 | `Natural-C: 418346 / 2385948 bytes (17.53%)` |
| `python tools/check_match_invariants.py --version eur` | 1 | `Found 13999 issue(s): 0 error(s), 13999 warning(s).` Exit 1 = warnings only. The 9 `orphan_extern` warnings are all in ov006/ov020 headers; the rest are `complete_tu_rename` placeholder-name warnings, which the batch may not act on (no renames). |
| `python tools/wall_aware_headroom.py --exclude-attempted --max-size 256 --min-addr 0x02030000 --max-addr 0x0203ffff` | 0 | `TOTAL candidate EUR .s remaining: 55`, i.e. 92 before the 37 attempts |
| A script over `delinks.txt` and `attempts.tsv` (ranges, routing, sizes, prior attempts) | 0 | see below |

Natural-C: 418,346 − 414,738 = **3,608 B**, exactly the sum of the 31
shipped rows' `text_size` and of their `delinks.txt` spans.

## What pass one found

- **Routing.** All 31 `delinks.txt` edits are `.s:` → `.c:` flips on the
  existing block with unchanged `start`/`end`; every span equals its
  ledger `text_size`; every address is in 0x02030000-0x0203ffff and ≤256 B.
  No other block changed.
- **Ledger.** 37 new rows, all `brief=batch-01`: 31 `shipped 100 n/a`,
  6 `parked` with mapped park classes (`P-20-dual-register-swap`,
  `address-fold`, `fold-predication-alloc` all have rows in
  `tools/park_class_map.tsv`; the `PROVISIONAL:` text is in the
  `park_family` column, where the map puts it). None of the 37 addresses
  had a row before this batch, so "never attempted" holds.
- **Parks back on `.s` exactly.** None of the six parked `.s` files or
  their `delinks.txt` blocks appear in the diff.
- **Honest C.** No raw data words, inline asm, `volatile`, register pins,
  do-while-zero wrappers or section tricks in any of the 31 files. I read
  every file. Each construct that looks odd matches an instruction in the
  original `.s` (read from `origin/main`):
  - `func_02031ebc`/`func_020320f8` `&l->tail != 0` ↔ `adds r0, r5, #0xc; beq`
    in the original: the real null test of a member address, as from an
    inlined pointer-taking helper.
  - `func_0203194c` dead u64 high-word test ↔ `mvn r0,#0; and r0,r0,#0;
    and r1,r4,#0; cmp; cmpeq; beq` guarding `bl func_02093bfc`. Only `r0`
    is read as input, so the 32-bit parameter is right.
  - `func_02033770` double `&= ~0x40000` ↔ two `bic #0x40000` in a row.
  - `func_020312a0` separate `case 0x1a0c: return 1;` ↔ the original's
    second `mov r0,#1; bx lr` block (`.L_d34`), reached only from
    0x1962+0xaa = 0x1a0c.
  - `func_02033f40` `x == 0xc79b || (x >= 0xc79c && …)` ↔ the original's
    lone `beq` on 0xc79b before the 0xc79c-0xc79e range test.
  - `func_02034bd8` `0x08f00004` ↔ a plain pool word with no relocation
    (the GBA-slot address range), so a raw constant is correct here.
  - `func_02034a84` `(unsigned int)data_0219b760` / `data_0219c408` ↔ real
    relocations `_LIT1`/`_LIT2` to exactly those symbols.
- **Three I trusted least, attacked.**
  1. `func_02031d98` (232 B, three externs at overlapping addresses): the
     queue stride 0x64, `pending` at +0x30, `mask` at +0x60, node `flags`
     at +0x2c, `data_0219adb8.mask` at +8, `cursor` at +0, `idle_next` at
     +0x4c8 and the sentinel `data_0219b27c` (= `data_0219adb8`+0x4c4) all
     agree with the original's offsets and its `_LIT0..2` relocations.
     The C's `q`/`q2` naming is inverted against the asm's `r6`/`r4` roles,
     but the semantics are the same. No wrong reference found.
  2. `func_0203194c`: see above; correct width, real call, real dead check.
  3. `func_02034a84`: the order of operations (kind loaded before the
     range test, `(unsigned short)x` re-index after `|= 0x1000000`) follows
     the original's `mla`/`lsl #0x10; lsr #0x10` sequence. Bounds are
     `bcc`/`bls`, i.e. `x < b760 || x > c408` → 0, as written.
  I found no construct that matches only by accident.

## Findings

- [SHOULD FIX] `docs/batches/batch-01.md:5` and `:110-111` — the report
  says the Worker "worked in address order from 0x0203058c to 0x020358cc"
  and that the next unreached candidate "in address order is
  func_0203671c". `func_0203244c` (116 B, 0x0203244c-0x020324c0, `.s`,
  in range, ≤256 B) lies inside that walk, has no ledger row and is not
  mentioned anywhere. How it fails: the next batch resumes from
  0x0203671c and this function falls out of the scan, or, if it was tried
  and dropped, a failed attempt is missing from the ledger (an
  invariant). Fix: either attempt it and ledger the result, or correct the
  two sentences to say it was skipped and why.
- [NOTE] `src/main/func_020336cc.c:7`, `src/main/func_02033718.c:7`,
  `src/main/func_02033770.c` and `src/main/func_020337b8.c` (the
  `extern void func_02032…(void);` lines), and `src/main/func_02031d98.c`
  (`func_02031ab0` declared as taking `queue_02031d98_t *`) — callbacks
  are declared with prototypes that differ from their own matched
  definitions (e.g. `func_02032c78` is `void (int, int, obj *)` in its
  own file). It is harmless while each lives in its own TU and only its
  address is taken, but these declarations would conflict the day the
  files share a header.
- [NOTE] `src/main/func_0203194c.c:6`, `src/main/func_02031ba0.c:17`,
  `src/main/func_02031d98.c:25` — three different struct types for the
  same `data_0219adb8`. The layouts I compared do not contradict one
  another (+4 counter, +8 mask, +0x10 default_remove, +0x4c8 idle_next),
  and the Worker discloses this, but the names are guesses and a later
  shared header must reconcile them.
- [NOTE] `docs/batches/batch-01.md:42` — the Worker's gate evidence is for
  `c9eb28e74`, not for the delivered `08ab04cf4`. The only later change is
  the report itself, and my own gate on `08ab04cf4` passed, so this has no
  consequence.
- [UNPROVEN CLAIM] `docs/batches/batch-01.md:35-40` — the six parks' best
  scores ("78.6%", "76.5%", "70.0%", "15.0%", "14.3%", "4.0%") and their
  "what is left" diagnoses. I did not redraft the parked functions, so I
  cannot confirm the numbers or the stated walls. The ledger rows are
  consistent with the table.

## Not verified

- The six parked functions' best scores and wall diagnoses (no drafts are
  committed to re-run).
- Whether `func_0203244c` was looked at and dropped or simply skipped:
  nothing in the commits or the report records it.
- `check_delink_dupes.py` on the *merged* tree: I ran it (through the gate)
  on `08ab04cf4` only. Brain should re-run it after any other `delinks.txt`
  change lands on `main`.
- USA/JPN: untouched by design; their SHA-1 PASS shows only that nothing
  broke, not that ports exist (none were in scope).

## Verdict

I believe the 31 matches are real, honest and complete. Each is 100% under
`fastmatch` at `08ab04cf4`. All three ROMs rebuild byte-identical with the
reference check and the fake-match lint green. The routing touches exactly
those 31 blocks. The ledger has one correct row per attempt, and the
Natural-C gain equals the shipped bytes exactly (3,608 B). I checked every
unusual construct against the original instructions; none is a trick. My
confidence in the matches is high. The one substantive problem is in the
report rather than the code: `func_0203244c` was silently skipped inside
the claimed address-order walk. That should be corrected or attempted,
but it does not make the shipped code wrong. Nothing here blocks a merge.
