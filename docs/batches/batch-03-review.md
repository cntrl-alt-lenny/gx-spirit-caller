# Batch 03: Verifier review

Reviewed commit: `8e17a14d0655e96b3cc4d44d57f1960168a01020` on
`worker/batch-03` (106 commits on top of `origin/main` at `0cc273a7a`, which is
the merge-base and tip of `main`). Reviewed in
`.worktrees/verifier-batch-03` on branch `verifier/batch-03`, Windows 11,
`python`. The worktree from the first `git worktree add` was a half-finished
checkout (locked, `index.lock`, every file shown deleted) with no live `git`
process of mine; I unlocked it, removed the empty lock and ran
`git reset --hard HEAD`, which restored exactly `8e17a14d0` (0 changes in
`git status` afterwards).

## Commands I ran myself

| Command | Exit | Real output |
|---|---|---|
| `git diff --name-status origin/main...8e17a14d0` | 0 | 152 files: 74 `src/main/*.c` added (6 `.c`, 15 `.legacy.c`, 53 `.legacy_sp3.c`), the same 74 `.s` deleted, `config/eur/arm9/delinks.txt`, `docs/ledger/attempts.tsv` (+177, 0 deleted), `docs/batches/batch-03.md`, `tools/reference_baseline.txt` (1 deletion, 0 additions). Nothing else. |
| `python tools/gate3.py --scope all --log <scratch>/gate-batch03.log` (not piped) | 0 | see next row |
| AGENTS.md PowerShell log check, verbatim | 0 | `27057:[eur] SHA1 PASS`, `52655:[usa] SHA1 PASS`, `78254:[jpn] SHA1 PASS`, `78294:1330 passed, 15 skipped, 132 subtests passed in 21.95s`, `78297:==================== GATE PASS ====================`, `78298:gate3: GATE EXIT 0`. No region `SKIP` line (the 15 are pytest skips). |
| (inside the gate) `check_references.py` | 0 | `wrong-target 411 (baseline entries 5925)`, `check_references: OK`. Main had 5926 entries, minus the one pruned line. |
| (inside the gate) `check_fake_matches.py` | 0 | `register-pin 0, do-while-zero 3, volatile-local 1`, `check_fake_matches: OK` |
| `python tools/check_delink_dupes.py` | 0 | `check_delink_dupes: OK (81 delinks.txt, no duplicate .text addresses)` |
| `python tools/check_baseline_growth.py --base origin/main` | 0 | `5925 entries, 0 added since 0cc273a7aed2`, `OK` |
| `python tools/check_match_invariants.py --version eur` | 1 | `Found 13999 issue(s): 0 error(s), 13999 warning(s).` Exit 1 is warnings only; same count as batch 02. |
| `python tools/fastmatch.py eur <all 74 new files>` | 0 | 74 × `100.0%  OK  (resolved, N words, gap=...)`. Sum of words × 4 = 11,332, equal to the sum of the ledger `text_size` of the 74 shipped rows and of their `delinks.txt` spans. |
| `python tools/validate_attempts.py` | 0 | `"rows": 2164, "errors": 0, "shape_conflicts": 66`. 1987 + 177 = 2164; the 66 conflicts are the same count as batch 02 and none concern batch-03 rows. |
| `python tools/progress.py --version eur` | 0 | `Natural-C: 435814 / 2385948 bytes (18.27%)`. 435,814 − 424,482 = **11,332 B**, exactly the 74 matched functions' sizes. |
| `python tools/wall_aware_headroom.py --exclude-attempted --max-size 256 --min-addr 0x02060000 --max-addr 0x0206ffff` | 0 | `TOTAL candidate EUR .s remaining: 1 (coercible 0 + unknown/never-assessed 0 + no-marker 1)`. `--json` names it: `src/main/func_0206be1c.s`, 12 B. |
| A script over the diff, `delinks.txt` and the new ledger rows | 0 | see "Pass one" |
| A script compiling each of the 74 files under 2.0/sp1p5, 1.2/sp2p3 and 1.2/sp3 with the build's own flags (copied from `build.ninja`, `-lang=c99`) and comparing `.text` bytes plus relocations | 0 | see "Tiers" |

## Pass one

- **Routing.** The 74 changed blocks of `delinks.txt` are exactly the 74
  added files. In every one only the path line changes (`.s` to `.c`,
  `.legacy.c` or `.legacy_sp3.c`); the `complete` line and the `.text
  start/end` line are byte-identical, and the old path is the deleted `.s`.
  6454 blocks before and after. Every span is ≤256 B and inside
  0x02060000-0x0206ffff, and equals the ledger `text_size`. Every file suffix
  equals the final row's `tier`.
- **Ledger.** 177 new rows, all `brief=batch-03`, none editing or deleting an
  existing row. They cover 91 distinct addresses, none of which had a row
  before the batch: 74 end `shipped 100 n/a` and 17 end `parked`. Every
  parked `park_class` has a row in `tools/park_class_map.tsv`; no raw
  `park_class` carries a `PROVISIONAL:` prefix. Where a function has several
  rows the last one is its real state: for `0x0206c52c` the order is default
  parked 11.7, `legacy` parked 80.0, `legacy` shipped 100. Of the 17 parked,
  every one has a row for the default tier and for the tier its prologue and
  epilogue point to (sp3-style frames got `legacy_sp3`, the one
  `ldmfd {lr}; bx lr` function and `0x0206d404` got `legacy`). None of the 17
  parked `.s` files or `delinks.txt` blocks appear in the diff.
- **Baseline prune.** The one deleted line is the `wrong-target` entry keyed
  to `src/main/func_020688fc.s` (`.text+0x5c`, original `data_020bee74`). That
  `.s` no longer exists, the new C names `data_020bee74` (the original's own
  target), the gate's reference check passes at 5925 entries, and
  `check_baseline_growth` reports 0 added. Correct and deletion-only.
- **Honest C.** I read all 74 files. They have no raw data words, inline
  asm, register pins, do-while-zero wrappers, pragmas or section tricks. The
  only `volatile` is `func_0206dad8.legacy.c`'s `short flags` member: the
  original loads `[r4, #0x70]` with `ldrsh` four times with no store between
  (once twice in a row), and removing the `volatile` makes the compile differ,
  so it is the member-level lever, not a hidden pin. The `do { } while` loops
  seen in older files are not in this batch.
- **Tiers.** Each file's own tier output equals the build's. Results of the
  three-compiler run:
  - All 68 tier-suffixed files differ under the default 2.0 compiler, so a
    1.2 tier is required for each.
  - All 15 `.legacy.c` files differ under sp3, so sp2p3 is required.
  - 51 of the 53 `.legacy_sp3.c` files differ under sp2p3, so sp3 is required.
    `func_02060c10.legacy_sp3.c` and `func_02068890.legacy_sp3.c` compile
    byte-identically under sp2p3 (see NOTE).
  - The 6 default `.c` files (`func_0206133c`, `func_02061e88`,
    `func_020621dc`, `func_02065fa8`, `func_020688fc`, `func_02068d50`) need
    nothing special; they also compile identically under sp3, which only
    shows that a suffix would be unneeded.
- **Candidates.** The headroom tool lists one remaining candidate,
  `func_0206be1c`. See pass two for what it is.
- **Three I trusted least, attacked.**
  1. `func_0206a984`: reads the remainder as
     `(int)(func_020b3870(i, n) >> 32)`. The original does `bl func_020b3870`
     then `ldrsb r1, [r4, r1]`, using the remainder in `r1` after the call.
     The repo already documents this divmod-helper idiom
     (`src/jpn/overlay010/ov010_core.h:32-38`, `symbols.txt:4147`). I checked
     the offsets against the original: `name` at 0x54, `key` at 0x74
     (0x54 + 0x20), and the `_LIT0 = 0x4bc` second argument equals
     0x74 + 8 + 0x440, the `sbox` offset. No wrong reference.
  2. `func_0206dad8`: see "Honest C"; the volatile is justified.
  3. The `func_02062eec` caller family (`func_02062aec`, `b48`, `ba4`,
     `c18`, `d88`, `df8`): each declares `func_02062eec(void *, int, void *,
     int *)` and passes `(void *)7`, `(void *)0x27` or `len + 7` with
     `unsigned char *len`. The same batch defines `func_02062eec` with
     `int need`, and the callers' own callers declare the length as `int`
     (`func_020622c8.legacy.c:12`: `(Obj *, int, int)`). I recompiled all six
     with `int arg2`, `int len` and no pointer casts: the `.text` bytes and
     relocations are identical under sp3 in all six. So these are wrong types
     that the match does not need (see SHOULD FIX). The bytes are right, so
     this is not an accidental match.

## Findings

- [SHOULD FIX] `src/main/func_02062aec.legacy_sp3.c:1,7`,
  `func_02062b48.legacy_sp3.c:1,7`, `func_02062ba4.legacy_sp3.c:1,5,14`,
  `func_02062c18.legacy_sp3.c:1,7`, `func_02062d88.legacy_sp3.c:1,5,10`,
  `func_02062df8.legacy_sp3.c:1,5,13`.
  - **What is wrong:** `func_02062eec`'s second-to-last parameter is declared
    `void *arg2` in all six callers while its own definition
    (`func_02062eec.legacy_sp3.c:11`) takes `int need`. The callers pass
    integer constants through `(void *)`, and `func_02062ba4` and
    `func_02062df8` type a byte count as `unsigned char *len` and then cast it
    back to `unsigned int`. The length is an `int` in the real callers
    (`func_020622c8`, `func_0206280c` declare `(…, int, int)`).
  - **How it fails:** nothing today (each file is its own TU, and the ROM is
    byte-identical). It misleads the next reader and any reshape work: it
    reads as a pointer-arithmetic idiom where the original is plain integer
    math, and a shared header would conflict with the definition.
  - **Fix:** declare `arg2` as `int` in the six externs, take `int len` in
    `ba4`/`df8`, drop the `(void *)` and `(unsigned int)` casts; I verified
    the result is unchanged.
- [NOTE] `docs/batches/batch-03.md:7-12`, `src/main/func_0206be1c.s`: the
  12 bytes at 0x0206be1c are not a separate function and not a branch
  target. Nothing in `src/` references `func_0206be1c`. They are the compiler's
  trailing copy of the epilogue after the infinite loop at the end of
  `func_0206bd74` (`b .L_2a0` is the last instruction of that function; the
  loop has its own conditional exit with the same
  `add sp, sp, #4; ldmia {r4-r9, lr}; bx lr`). `func_0206bd74` is parked as
  P-42 at 93.3% (`attempts.tsv:1501`, size 168, which excludes these 12
  bytes). So the Worker's decision to skip it is right, but "shared tail with
  no entry" is a loose description, and its symbol/delinks block
  (`delinks.txt:12259`) stays split from the function it belongs to. The
  headroom tool will keep listing it as the one remaining candidate.
- [NOTE] `src/main/func_02060c10.legacy_sp3.c`,
  `func_02068890.legacy_sp3.c`: both compile byte-identically under sp2p3.
  Their report evidence (`docs/batches/batch-03.md`: "if-converts where the
  original branches", "re-reads memory") only separates 1.2 from 2.0, not sp3
  from sp2p3, so the suffix choice between the two 1.2 tiers is not
  justified by the code. The ROM is the same either way.
- [NOTE] Callee declarations that differ from their own matched definitions,
  all harmless while each function is its own TU: `func_020613d8` is called as
  `(void *, void *, unsigned int)` but defined `(buf *, signed char *, int)`
  (five callers); `func_02061b60`, `func_02061c5c`, `func_02062280`,
  `func_0206371c`, `func_02068b54` are declared with `void *` for a struct
  pointer; `func_020698fc.legacy_sp3.c:12` declares `func_020684c8` as
  returning `void *`, the definition returns a struct pointer;
  `func_0206d0b0.legacy.c:9` takes `int c, int d` and casts them to
  `unsigned short *` and `int *` (I confirmed pointer-typed parameters give
  the same bytes). The Worker discloses the pointer-to-int casts in its
  report.
- [NOTE] Field names and struct layouts are the Worker's own guesses (it says
  so). I found no inconsistency in the offsets: the 0x0206xxxx socket object
  is `+0x70 flags`, `+0x72 mode`, `+0x73 state`, `+0x74 port`, `+0x68 owner`
  in `func_0206c52c`, `c9b0`, `dad8` and `e38c`, and `data_0219e968` /
  `data_0219e518` are treated as the same list type in every function that
  uses them.

## Pass two: comparison with `docs/batches/batch-03.md`

- **Agrees:** 74 matched, 11,332 B, 6/53/15 by tier, 17 parked, 91
  attempted, 92 candidates; Natural-C 424,482 to 435,814; the gate lines
  (my gate lines are on the same set of PASS markers; line numbers differ
  because my run built from a clean tree); the baseline prune and its
  reason; `func_0206c52c` parked at 80.0% under `legacy` then matched.
- **Re-checked from the table:** I compared the 68 "(2.0: N%)" scores in the
  Worker's table with the default-tier ledger rows: 0 mismatches. The 17
  parked best-per-tier scores match the ledger rows.
- **Flagged items, judged:**
  - *Under-declared callee definitions* (`func_0206be54`, `func_0206be44`,
    `func_02063710`, `func_02065ee0`, `func_02054e8c`, `func_020ace00`):
    confirmed. `func_0206be54.c:5` and `func_0206be44.c:5` take `(int *p)`,
    `func_02063710.c:5` is `void`, `func_02065ee0.legacy_sp3.c:15` is
    `void (void)`, `func_02054e8c.legacy_sp3.c:8` is `int (void)`,
    `func_020ace00.c:5` has four parameters. The Worker's callers declare what
    the original passes; none of those definitions were touched. The
    right fix is in those definitions (a separate change), so this is a
    NOTE, not a defect of this batch.
  - *`volatile` in `func_0206dad8`:* accepted, see above.
  - *Explicit divide helpers:* `func_020b3870` / `func_020b3a7c` by name is
    the repo's documented idiom; accepted.
  - *Named symbols where the `.s` used base+offset* (`data_020bed5c`,
    `data_020bee74`): the reference check passes; accepted.
  - *Pointer-to-int casts at calls:* the listed ones are consistent with the
    definitions. The `func_02062eec` family above is not on the Worker's
    list and is the one place where the casts go the wrong way.
  - *Struct layouts:* see NOTE above.
  - *`func_0206be1c`:* see NOTE above.

## Not verified

- The parked functions' scores (the 17 parks and every default-tier park
  score): no drafts are committed, so I could not re-run them. The ledger
  matches the report's table.
- The semantic correctness of field names and the meaning of any struct
  member: the match proves the bytes, not the names.
- Whether the 17 parked functions could be matched with more work; I only
  checked that each has rows for the tiers its code points to.
- USA and JPN were verified only through the three-region gate (both
  `SHA1 PASS`); no USA/JPN file is in the diff.

## Verdict

The batch does what its objective says. All 74 converted functions are
natural C that reproduces the original at 100% under the resolved comparison,
the three-ROM gate passes at this exact commit, and the Natural-C gain
(11,332 B) equals the matched functions' sizes to the byte. Routing changes
touch only the 74 batch blocks and only their path line; the ledger is
append-only, complete for 91 addresses and every tier tried, and the 17
parked functions are still on `.s` untouched. The baseline change is a
justified deletion of one stale line. I found no fake-match construct, no
wrong reference and no accidental match; the one `volatile` is justified by
the original's repeated loads. The one thing I would fix is the six
`func_02062eec` callers, whose pointer-typed length and `void *` argument are
needless type disguises (identical bytes with plain `int`); the rest are
notes. Confidence is high on the bytes and the ledger, moderate on the field
names, which are guesses.
