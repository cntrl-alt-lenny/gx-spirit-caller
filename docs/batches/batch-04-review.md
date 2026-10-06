# Batch 04: Verifier review

Reviewed commit: `8a0f9cff6eb9849bcd99b45205e163297145f244` on
`worker/batch-04`, 51 commits on top of `origin/main` at
`0cc273a7aed2c0367414776967cfba35ab0bab8a`, which is also the merge base. Reviewed
in `.worktrees/verifier-batch-04` on branch `verifier/batch-04`, on Windows 11
with `python`. I did pass one (the diff, the checks, the attacks) before
opening `docs/batches/batch-04.md`.

## Commands I ran myself

| Command | Exit | Real output |
|---|---|---|
| `git diff --name-status origin/main...8a0f9cff6` | 0 | 46 `A` (45 `.c`, `docs/batches/batch-04.md`), 45 `D` (the 45 `.s`), 2 `M` (`config/eur/arm9/delinks.txt`, `docs/ledger/attempts.tsv`). No renames, no `tools/`, no USA/JPN, no symbols, no baseline change. Only the allowed paths changed. |
| `python tools/gate3.py --scope all --log <scratch>/gate-batch04.log` (not piped) | 0 | background shell reported `[exited with code 0]` |
| PowerShell log check from `AGENTS.md`, verbatim | 0 | `27085:[eur] SHA1 PASS`, `52683:[usa] SHA1 PASS`, `78282:[jpn] SHA1 PASS`, `78322:1330 passed, 15 skipped, 132 subtests passed in 28.73s`, `78325:==================== GATE PASS ====================`, `78326:gate3: GATE EXIT 0`. No `INFRASTRUCTURE`, `CLEAN-FAIL` or region `SKIP` line (the 15 are pytest skips). |
| (inside the gate) `check_delink_dupes.py` | 0 | `check_delink_dupes: OK (81 delinks.txt, no duplicate .text addresses)` |
| (inside the gate) `check_references.py` | 0 | `wrong-target 412 (baseline entries 5926)`, `check_references: OK`. Same numbers as batch 02, so no baseline growth. |
| (inside the gate) `check_fake_matches.py` | 0 | `register-pin 0, do-while-zero 3, volatile-local 1 (baseline entries 4)`, `check_fake_matches: OK` |
| `python tools/fastmatch.py eur <all 45 new .c files>` | 0 | 45 lines, each `100.0%  OK  (resolved, N words, gap=...)`. 36 report `cc=sp3`, 9 report `cc=2.0`. |
| `python tools/validate_attempts.py` | 0 | `"rows": 2084`, `"errors": 0`, `"shape_conflicts": 66` (the same 66 as before; none is a batch-04 row) |
| `python tools/progress.py --version eur` | 0 | `Natural-C:        430086 / 2385948    bytes  (18.03%)` |
| `python tools/check_match_invariants.py --version eur` | 1 | `Found 13999 issue(s): 0 error(s), 13999 warning(s).` Exit 1 is warnings only. |
| `python tools/check_fake_matches.py` (stand-alone) | 0 | `check_fake_matches: OK` |
| `ninja build/eur/report.json`, then `python tools/wall_aware_headroom.py --exclude-attempted --max-size 256 --min-addr 0x02040000 --max-addr 0x0204ffff` | 0 | `TOTAL candidate EUR .s remaining: 0`, `TOTAL excluded by attempts ledger: 974` |
| the same headroom command without `--exclude-attempted` | 0 | `main 27 4 0 23 0 23` (27 `.s` candidates: 4 confirmed-permanent, 23 never-assessed) |
| script over `attempts.tsv` and `delinks.txt` (routing, spans, tiers, prior rows) | 0 | see below |
| script that compiles every new `.c` under all three compilers with the build's own flags (`-lang=c99`, copied from `build.ninja`) into scratch and compares `.text` | 0 | see "Tiers" |
| `git diff --quiet origin/main -- src/main/func_02049270.s` | 0 | silent, i.e. identical to `main` |

Natural-C: 430,086 − 424,482 = **5,604 B**. The sum of the 45 shipped rows'
`text_size` (leaving out `func_02049270`) is 5,604, and so is the sum of the
45 replaced `delinks.txt` spans.

## What pass one found

- **Routing.** `delinks.txt` has 45 `+` and 45 `-` lines, all of them the path
  line of an existing block (`.s` becomes `.c` or `.legacy_sp3.c`). `start`
  and `end` do not change. For every one of the 45, the span equals the
  ledger `text_size` and the suffix matches the shipped row's `tier`. All are
  in 0x02040000-0x0204ffff and 256 B or less. No other block changed.
- **Ledger.** 97 new rows, all `brief=batch-04`: 46 `shipped` and 51 `parked`,
  over 49 distinct addresses. The first 1,988 lines of the file are
  byte-identical to `origin/main`, so no existing row was touched. None of the
  49 addresses had a row before this batch. For the 45 shipped functions the
  last row is the `shipped` row. The 4 parked functions (`func_020432d0`,
  `func_02043a78`, `func_02046694`, `func_02049270`) are all on their original
  `.s` and block, unchanged from `main`.
- **`func_02049270`, the one with several rows.** Rows in order: `default`
  parked 29.2, `legacy_sp3` shipped 100, then `legacy_sp3` parked `n/a`
  `tool-anomaly`. The latest row reflects the real final state: the file in
  the tree is `src/main/func_02049270.s`, identical to `main`, and its
  `delinks.txt` block still says `.s` (`start:0x02049270 end:0x020492d0`). The
  `.legacy_sp3.c` file is gone. See the NOTE on its cause.
- **Candidates.** After the batch every one of the 27 `.s` candidates in range
  has a ledger row, and the 49 batch addresses are exactly those with no
  earlier row. So nothing in range was skipped. I did not re-run the headroom
  tool on `main` itself (see "Not verified"); I reasoned from the ledger.
- **Tiers.** I compiled each of the 45 files under 2.0/sp1p5, 1.2/sp2p3 and
  1.2/sp3 and compared the `.text` bytes with the compile under the file's own
  tier:
  - all 36 `.legacy_sp3.c` files differ under 2.0 **and** under sp2p3, so sp3
    is required for every one, and no `.legacy.c` is needed;
  - the 9 `.c` files (`func_02040d94`, `02044e58`, `02045618`, `02045954`,
    `02046fc4`, `020491ec`, `02049554`, `0204f040`, `0204fc38`) differ under
    sp2p3 and are byte-identical under sp3, so the default tier needs no
    justification.

  This is stronger than the report's table, which gives a reason for each.
- **Honest C.** I read all 45 files. There is no raw data, inline asm, register
  pin, do-while-zero, section trick or volatile local. The constructs that look
  odd are in the originals; I checked the ones below against `origin/main`'s
  `.s`.
- **Three I trusted least, attacked** (original `.s` on `origin/main` against
  the C):
  1. `func_0204aa0c` (also `02046498`, `0204a8bc`, `0204aaf4`). `kind` and
     `sub` are unset for codes with no case. The original's jump table sends
     codes above 5 to `.L_588` with `r4`/`r5` unset, so the C mirrors it. The
     constants are right: `sub r1, r5, #0xfa00` = −64000, `0xfffedef0` =
     −74000, `0xfffeb7e0` = −84000, `0xfffe90d0` = −94000. No wrong reference.
  2. `func_02049554`. The original takes four register arguments plus a
     stack argument (`ldr r0, [sp, #0x8]`, stored at +0x14). The C's field
     assignment order matches (`a1`→+4, `a4`→+0x14, `a3`→+0x18, `a2`→+0x28).
     The `unsigned long long` at +0x0c is the two zero stores at +0xc and +0x10.
     No wrong reference. The Worker's claim that two `int`s there scored 41.4%
     is the ledger's `legacy_sp3` row for this address.
  3. `func_02040258`. The C reads `data_0219d9d4 + 0x1008` even when the
     pointer is null, after clearing `out`. That is the original: it
     `memcpy`s from `[data_0219d9d4] + 0x1008` whether or not the null test
     fired. Faithful, not a guess.

  I also read `func_02044424` and `func_0204f9cc` against their originals
  (loop and `ands` shape) and `func_02046fc4` (8-argument tail call, the
  stack-argument order is right). I found no construct that matches only by
  accident.

## Findings

- [NOTE] `docs/ledger/attempts.tsv` (last `0x02049270` row) and
  `docs/batches/batch-04.md:84-102`.
  - **What it is:** `func_02049270` has a real 100% C match that cannot
    ship in this batch. The draft named `data_020ff928`, which `symbols.txt`
    lists but no object defines. I confirmed this: `grep -rln data_020ff928
    src config` lists only `config/eur/arm9/symbols.txt`, `grep` finds no
    `data_020ff928:` label under `src/`, and the address is inside the
    64-byte `data_020ff920` bundle in `src/main/data/data_020ff920.c`. The
    Worker's explanation of the failed first gate (the EUR link failing on the
    undefined symbol, `INFRASTRUCTURE ERROR`) is consistent with that, and I
    could not have expected anything else from that draft. I did not re-run
    that gate (the log is not committed).
  - **I re-derived the Worker's claim that `data_020ff920 + 8` is not
    shippable.** I compiled the draft with `extern char data_020ff920[];` and
    `data_020ff920 + 8` under sp3 into scratch. `arm-none-eabi-objdump -dr`
    shows `58: R_ARM_ABS32  data_020ff920+0x8`, the form the `.s` uses, so it
    would link. But `tools/reference_baseline.txt:455-456` shows what that
    form costs: `func_020489c4.c` is baselined as `original ABS32
    data_020ff924+0x0 built ABS32 data_020ff920+0x4`, and
    `func_02049270.s` as `data_020ff928+0x0` vs `data_020ff920+0x8`. A new
    unit name `func_02049270.legacy_sp3.c` would be a new `wrong-target` line,
    and the baseline may only shrink. So the Worker's decision to revert,
    not to edit `tools/` and not to touch the data bundle, is right for this
    batch.
  - **Consequences:** (1) the ledger's last row says `tool-anomaly`, which
    `tools/park_class_map.tsv:320` defines as "fastmatch/sha1 disagreement".
    The real cause is a data-label gap, and it is only in the report. A future
    attempt will re-derive it. (2) `fastmatch` reported 100.0% `resolved` for
    a unit that does not link. It does not check that a symbol exists, so
    the gate is what catches this class, not `fastmatch`. (3) The earlier
    `shipped` row for this address stays in the log, so any reader that counts
    `shipped` rows per address will count one that is not in the tree. It is
    correct under the append-only rule, because the last row is the truth.
  - **For Brain:** the 96 B ships once `data_020ff928` is a real label, with
    the Worker's draft plus no other change (the C is in commit `10af44190`),
    or with the `+ 8` spelling if a baseline line may be swapped one for one.
- [SHOULD FIX] `docs/batches/batch-04.md:19`. The report says "10 ship as `.c`
  (mwcc 2.0) and 35 as `.legacy_sp3.c`". The tree has 9 and 36, and the
  report's own table counts 9 `.c` and 36 `sp3` rows (I counted `| .c |` and
  `| sp3 |` lines: 9 and 36). The total of 45 is right. It has no effect on the
  ROM, but it is a wrong count in the document Brain will read.
- [NOTE] `src/main/func_02048fac.legacy_sp3.c:20-23`. The local struct has an
  unused `char name[0x108]` before `info`. It exists only to reproduce the
  0x210-byte frame, with the buffer at `sp+0x108`. The original does have a
  0x210 frame and passes `sp+0x108` to `func_020498c4`, which forwards it as the
  fourth argument of `func_020497a8(a, 0, 0, b)`. The Worker discloses this and
  ties it to the 0x210-byte shape in `func_020491ec`, where the text is at
  +0x108 of a real 0x210 struct. I accept that it is not a trick, but it is a
  dummy half-struct, so the type is a guess about the unused half.
- [NOTE] `src/main/func_0204a8bc.legacy_sp3.c:38`, `func_0204aa0c.legacy_sp3.c:43`,
  `func_0204aaf4.legacy_sp3.c:35`: `(void *)kind` and `(void *)(sub - n)` pass
  integers to `func_02050054`, because its existing definition
  (`src/main/func_02050054.legacy_sp3.c`) is `(void *, void *)`.
  `func_02049910.legacy_sp3.c:2` and `func_0204ab88.legacy_sp3.c:7` declare it
  `(int, int)`. Likewise `func_02044424.legacy_sp3.c:12` passes the size
  `0x100` as `(void *)0x100` because `func_02043bdc` is defined with four
  `void *`, while `func_02044384.legacy_sp3.c:4` declares the third as `int`.
  Bytes are the same either way, so nothing fails today. They conflict the
  day a shared header exists.
- [NOTE] Other declaration drift, all harmless while each function is its own
  TU: `func_02049038` is now defined `(int, char *, char *)`, but
  `func_02050054.legacy_sp3.c` declares it `(int, void *, int)`;
  `func_02046fc4.c:6` names the first two parameters of `func_0204937c`
  `unused0`/`unused1`, but they carry `data_0219daec + 0xe0` and `+ 0x1e0`;
  `struct S0219dad0` has two layouts across the batch (`func_0204559c` and
  `func_02045618` use `pad_00`/`pad_06`, the other four name `field_0` and
  `field_6`), with the same offsets.
- [NOTE] The four error-code functions leave `kind`/`sub` uninitialised on
  codes with no case. That is undefined behaviour in C, but it is what the
  original does (verified above), and the Worker discloses it
  (`batch-04.md:113-116`).
- [NOTE] `sp2p3` (`legacy`) rows exist for only 4 of the 36 sp3 functions
  (`02040258`, `020402ec`, `02040cc0`, `02040d94`). The other 32 went from
  `default` straight to `legacy_sp3`. My compile shows each of the 32 also
  differs under sp2p3, so the choice is right and no tier is missing a
  justification. The report's wording "every tier I tried" is accurate; it
  does not claim sp2p3 was tried everywhere.
- [UNPROVEN CLAIM] `docs/batches/batch-04.md:26-70` and `:77-84`: the per-tier
  scores and diagnoses of the failed attempts ("59.5%", "92.2%", "89.6%",
  "87.5%", "6.0%", "nine source variants", "six variants tried", and the
  `.legacy.c` probes). No drafts are committed, so I could not re-run them.
  The ledger rows carry the same scores as the report. Whether a tier needs a
  given epilogue is covered by my own compiles above, not by these numbers.
- [UNPROVEN CLAIM] `docs/batches/batch-04.md:156-159`: the first gate (on
  `8fecfbc57`) ended `gate3: GATE EXIT 2` with `[eur] INFRASTRUCTURE ERROR`
  and the link failure on `data_020ff928`. The log is not committed and I did
  not rebuild that commit. The explanation fits the evidence (see the NOTE).

## Pass two: items the report flags for review

- **`func_02049270` blocked by a data symbol.** Agreed on the merits; see the
  first NOTE. I reproduced the compile and the baseline reasoning. I disagree
  only with the label `tool-anomaly`, which hides the cause in the ledger.
- **`func_02048fac`'s 0x210-byte local.** Matches the original's frame (see the
  NOTE above).
- **Uninitialised locals.** Confirmed against the original.
- **`func_02045678` returns `field_4`** on the `== 1` path: its C compiles to
  100% and the original returns the loaded halfword, so a constant would
  differ. Confirmed by `fastmatch`.
- **The 64-bit field at +0x0c in `func_02049554`.** Confirmed; see attack 2.
- **Prototypes that follow existing definitions.** Confirmed; see the NOTEs.
- **Struct layouts local to each file.** Confirmed; see the NOTE.
- **Checks.** Everything the report quotes, I reproduced on `8a0f9cff6`: 5,604 B
  gain, 97 rows, 45+1 `shipped` and 51 `parked`, headroom 0, gate PASS, delink
  dupes OK. The one number it gets wrong is the 10/35 split.
- **Parked ones' state.** Back on `.s`, unchanged from `main`, confirmed.

## Not verified

- The best scores, variant counts and wall diagnoses of the four parks and of
  the 36 default-tier probes: no drafts are committed.
- The first gate's `INFRASTRUCTURE` log (not committed, not re-run).
- That the 49 addresses are exactly what `wall_aware_headroom.py` listed on
  `main` before the batch. I did not run the tool on `main`; I only showed
  that all 27 `.s` candidates left in range now have rows and that none of the
  49 had a row before.
- `check_delink_dupes.py` on the merged tree: `main` has not moved since the
  merge base (`origin/main` is `0cc273a7a`), so it is the same tree today.
  Re-run it if anything else lands first.
- USA/JPN: untouched by design; their `SHA1 PASS` shows only that nothing broke.

## Verdict

I believe the 45 matches are real, honest and complete. Each is 100% under
resolved `fastmatch`, all three ROMs rebuild byte-identical at `8a0f9cff6`
with the reference check and the fake-match lint green, its `delinks.txt` edit
touches only its own block with the right suffix, and the 45 add exactly
5,604 B to Natural-C. Every non-default tier is justified by my own compiles:
all 36 `.legacy_sp3.c` files differ under both 2.0 and sp2p3. I compared the
unusual constructs with the original instructions and none is a trick. The
four parks are back on `.s` exactly, no existing ledger row changed, and every
candidate in range now has a row. The one function with several rows,
`func_02049270`, really is back on `.s`; its 100% C is held back by a missing
data label, not by the code, and the Worker's decision to revert it was
correct, though the `tool-anomaly` row hides that cause. The only thing I
would change in this batch is the 10/35 count in the report. My confidence in
the shipped code is high; nothing here blocks a merge.
