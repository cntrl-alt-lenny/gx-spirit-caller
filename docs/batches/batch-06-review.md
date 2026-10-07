# Batch 06: Verifier review

Reviewed commit: `ccc764447` on `worker/batch-06` (merge-base with `origin/main`
is `0cc273a7a`). Reviewed in `.worktrees/verifier-batch-06` on branch
`verifier/batch-06`, Windows 11, `python`. The worktree checkout completed
without a lock. The Worker was a different model (GPT-6.1 Sol in Codex), so
every number and command in its report was re-run; the result for each is in
"Pass two".

## Commands I ran myself

| Command | Exit | Real output |
|---|---|---|
| `git diff --name-status origin/main...ccc764447` | 0 | 77 files: 37 `src/main/*.c` added (29 `.legacy.c`, 8 `.legacy_sp3.c`, 0 plain `.c`), the same 37 `.s` deleted, `config/eur/arm9/delinks.txt`, `docs/ledger/attempts.tsv`, `docs/batches/batch-06.md`. Nothing else. |
| `python tools/gate3.py --scope all --log <outside worktree>` (not piped) | 0 | see next row |
| AGENTS.md PowerShell log check, verbatim | 0 | `27096:[eur] SHA1 PASS`, `52694:[usa] SHA1 PASS`, `78293:[jpn] SHA1 PASS`, `78333:1330 passed, 15 skipped, 132 subtests passed in 19.82s`, `78336:==================== GATE PASS ====================`, `78337:gate3: GATE EXIT 0`. No `SKIP` for a region. |
| (inside the gate) | 0 | `check_references: eur, usa, jpn: 32903 units compared; missing-reloc 5514, extra-reloc 0, wrong-target 412 (baseline entries 5926)`, `check_references: OK`; `check_fake_matches: ... register-pin 0, do-while-zero 3, volatile-local 1 (baseline entries 4)`, `check_fake_matches: OK` |
| `python tools/fastmatch.py eur <the 37 new files>` | 0 | 37 lines `100.0%  OK  (resolved, N words, ...)`, none else |
| `python tools/check_delink_dupes.py` | 0 | `check_delink_dupes: OK (81 delinks.txt, no duplicate .text addresses)` |
| `python tools/check_fake_matches.py` | 0 | `check_fake_matches: OK` |
| `python tools/check_match_invariants.py --version eur` | 1 | `Found 13999 issue(s): 0 error(s), 13999 warning(s).` (warnings only; same count as batch 03) |
| `python tools/validate_attempts.py` | 0 | `"rows": 2101, "errors": 0, "shape_conflicts": 66` (none are batch-06 rows) |
| `python tools/progress.py --version eur` | 0 | `Natural-C: 428966 / 2385948 bytes (17.98%)`; 428,966 − 424,482 = **4,484 B** |
| `python -m ruff check .` | 0 | `All checks passed!` |
| `python tools/wall_aware_headroom.py --exclude-attempted --max-size 256 --min-addr 0x02070000 --max-addr 0x0207ffff` | 0 | `TOTAL candidate EUR .s remaining: 3`, `confirmed-permanent: 2`; `--json` names `func_02074e4c`, `func_0207708c`, `func_0207fd60` (candidates) and `func_0207db8c`, `func_0207dbf8` (permanent, wall P-12) |
| My script over `delinks.txt`, the diff and the ledger | 0 | see "Pass one" |
| My script compiling each of the 37 files under 2.0/sp1p5, 1.2/sp2p3 and 1.2/sp3 with the flags from `build.ninja` (`-lang=c99 -d eur`), comparing `objdump -d -r` of `.text` | 0 | see "Tiers" |
| Scratch compiles of variants (volatile removals, two skipped functions) outside the repo | 0 | see "Pass one" and findings |

## Pass one

- **Scope.** Only the batch's `src/main` files, `delinks.txt`,
  `attempts.tsv` and `docs/batches/batch-06.md` changed. No `symbols.txt`,
  baseline or tool change.
- **Routing.** `delinks.txt` has 28,180 lines before and after and 6,454
  blocks before and after. Exactly 37 lines differ, every one a path line
  (`.s:` to `.c:`), and the `complete` and `.text start/end` lines are
  untouched. For all 37, the suffix equals the tier of the final `shipped`
  ledger row, the block start equals the address and the span equals the
  ledger `text_size`; the spans sum to 4,484 B, equal to the Natural-C gain.
  The 18 parked functions' `.s` files and blocks are not in the diff;
  `func_0207845c.s` is byte-identical to `origin/main`.
- **Ledger.** 114 rows are appended, 0 existing lines changed or deleted, the
  pre-batch file is a byte-identical prefix (224,769 B), no CRLF, 11 columns
  throughout. 55 distinct addresses, none had a prior row; 38 ever shipped
  and 37 are shipped at the end (`func_0207845c` is the 38th, see below), 18
  parked. Every parked `park_class` (`tool-anomaly`, `frame-shape`,
  `reg-alloc-instr-scheduling`, `structural`, `instruction-selection`,
  `P-17-commutative-add-operand-order`) is in the raw column of
  `tools/park_class_map.tsv`; no raw value carries `PROVISIONAL:` (that text
  is only in the family column, as in other batches). `validate_attempts.py`
  exits 0.
- **Candidate accounting.** On `origin/main`, 108 `.s` blocks of 256 B or less
  lie in 0x02070000-0x0207ffff: 48 had earlier ledger rows, 55 are this batch,
  5 remain: `func_02074e4c`, `func_0207708c`, `func_0207fd60` (the three
  skipped) and `func_0207db8c`, `func_0207dbf8` (P-12, permanent). None of
  the batch's 55 addresses lies outside that set, and none had a prior row.
- **Honest C.** I read all 37. No inline asm, pragma, `register`, raw data
  word, `goto` or do-while-zero wrapper. The only `volatile`s are the five in
  `func_0207391c`/`func_0207397c` and two in an unused struct (below). I
  checked the logic of several against the original instructions:
  - `func_02072144` (byte-swap helpers, `func_020930b0() >> 16` as a 64-bit
    return pair), `func_02072444` (option parser, signed divide by 4),
    `func_0207c3b0` (list unlink/append and the `found` flag): same behaviour
    as the `.s`.
  - `func_0207b548` reads `[ctx+0x2264]` before the null test, exactly as the
    original does (`ldr r4, [r3, #0x264]` before `cmp r1, #0`).
- **Volatile, attacked.** I recompiled `func_0207391c` and `func_0207397c`
  under sp2p3 with each `volatile` removed in turn. In all six variants the
  output differs from the shipped one, so each is needed to match; they match
  the original's re-reads (three loads of the cursor in `0207391c`; the
  waiter store, then clear, in the `0207397c` loop). No other file in `src/`
  mentions those globals, so there is no conflicting declaration. The
  volatile on `data_0219ef28` in `0207391c`, where the original loads once,
  is a scheduling lever rather than a re-read (NOTE below).
- **Tiers.** Own-tier output equals the build's. Result of the three-compiler
  run:
  - 36 of the 37 differ under 2.0, so a 1.2 tier is required for them.
    **`func_02072444.legacy.c` compiles to identical `.text` and relocations
    under 2.0, sp2p3 and sp3**, so no suffix is required for it (SHOULD FIX).
  - Of the 29 `.legacy.c` files, 26 differ under sp3, so sp2p3 is required.
    `func_02072444`, `func_02078d88` and `func_0207deb0` are identical under
    sp3 as well; for the last two, sp2p3 versus sp3 is not decided by the
    code (NOTE).
  - All 8 `.legacy_sp3.c` files (`0207cff4`, `0207dc5c`, `0207e124`,
    `0207e1c4`, `0207e54c`, `0207e664`, `0207e6f0`, `0207e748`) differ under
    both 2.0 and sp2p3, so sp3 is required for each.
- **Skipped candidates.**
  - `func_02074e4c` (`add sp; ldmia {r4-r9, lr}; bx lr`, 12 B) and
    `func_0207708c` (`ldmia {r4-r6, lr}; bx lr`, 8 B) are trailing epilogues
    of neighbouring functions with no prologue. Skipping is right.
  - `func_0207fd60` (68 B): skipping is **not** right (finding 2).
- **Three matches I trusted least, attacked.**
  1. `func_0207397c` (224 B, volatile and a do-while): reproduced under all six
     volatile variants (above); the loop structure and the final
     `buffer + cursor + 2` return agree with the original.
  2. `func_0207e1c4`: `&data_02102120 + a` with a 24-byte `DuelHeapSlot` gives
     `mla` with 0x18 and the five stores to `data_0210210c[0..4]`, as in the
     original. Offsets and stride agree.
  3. `func_0207dc5c`: `fields = heap + 0x24`, `(int)(fields + 3)` is
     `heap + 0x30`, equal to the original's `add r2, r4, #0xc` with
     `r4 = heap + 0x24`; the magic is 0x46524d48. The pointer is passed as an
     `int` to match `func_0207d1e8`'s declared parameter (type disguise, NOTE).
- **The five callers corrected to callee prototypes.** I checked each against
  the callee's definition in `src/main`:
  - `func_02070b4c` and `func_0207397c`: `func_02091a8c(void *q)` is the
    definition's signature.
  - `func_020745fc`: `func_020919d8(ctx_020919d8_t *ctx)` is the definition's
    own typedef (`flag` at 0x64).
  - `func_02076c5c`: `func_02076cc0(unsigned char *p, int count, int stride,
    int target)` is the definition's signature.
  - `func_02077b98`: `func_020a7440(unsigned char *, unsigned char *, int)`
    is the definition's signature.
  All five now agree with their definitions. One preexisting mismatch is not
  this batch's: `func_02070ac0.legacy.c` declares `func_02091a8c(int v)`.

## Findings

- [SHOULD FIX] `docs/ledger/attempts.tsv:2100` — the last row for
  `func_02078d88` is `default parked 82.3 instruction-selection`, appended
  after its `legacy shipped 100` row (line 2039). The function is shipped
  (`func_02078d88.legacy.c`, routed), but any consumer that takes the last
  row for an address reads it as parked. The Worker's report calls these
  "classification corrections". The ledger is append-only, so the fix is to
  append a final `legacy shipped 100 n/a` row for it. (`func_02078eec`,
  line 2101, is parked either way, so it is harmless.)
- [SHOULD FIX] `src/main/func_0207fd60.s` (no ledger row) — skipped without an
  attempt, and the stated reason does not hold. The report says the original
  passes a second value to `func_0207fd48`, whose matched C prototype takes
  one argument, so "respecting that prototype cannot express this caller".
  Other callers in this very batch declare their own per-TU prototype (the
  five prototype corrections go the other way), and a local three-argument
  declaration is enough. A scratch compile (outside the repo, not committed)
  of
  `void func_0207fd60(int *a, void *b, int c) { a[12] = c; a[13] = -1;
  func_0207f8c8(a + 14, 1); func_0207e8b8(a); func_0207fd48(a, b); }`
  under 1.2/sp3 gives `push {r4,r5,lr}; sub sp,#4; mov r5,r0; mov r4,r1;
  str r2,[r5,#0x30]; mvn r2,#0; add r0,r5,#0x38; mov r1,#1;
  str r2,[r5,#0x34]; bl; mov r0,r5; bl; mov r0,r5; mov r1,r4; bl;
  add sp,#4; pop {r4,r5,pc}`, which I read instruction by instruction against
  the `.s` and found identical (I did not run it through fastmatch). So a
  68 B function is left on `.s` that very likely converts at `legacy_sp3`.
  Because it has no ledger row, `wall_aware_headroom.py --exclude-attempted`
  still lists it as a candidate and the next Worker will be offered it
  (see also the next finding).
- [SHOULD FIX] `src/main/func_02074e4c.s`, `func_0207708c.s` (no ledger rows) —
  correctly skipped, but with no row they stay in the headroom candidate list
  (`no_marker_files`) and will be offered again to every later Worker. A
  `parked` row with an `n/a`-style class, or a marker comment in the `.s`,
  would stop that.
- [SHOULD FIX] `src/main/func_02072444.legacy.c` — the file is not required to
  be `.legacy.c`. The shipped source compiles to byte-identical `.text` and
  relocations under 2.0/sp1p5 (my run: default SAME, sp3 SAME). So the
  ledger row `attempts.tsv:2000` (`default ... 21.2 instruction-selection`)
  describes an earlier draft, not the shipped source, and the report's
  evidence "default instruction selection differs" is contradicted. The ROM
  is the same either way; the cost is a wrong tier and a false "2.0 cannot do
  this" record (the compiler-quirks guide says to prefer the default tier).
  Fix: rename to `func_02072444.c`, update the `delinks.txt` path line, and
  append a correcting row.
- [SHOULD FIX] `src/main/func_0207e664.legacy_sp3.c:2` — the typedef `Bank`
  declares two `volatile` members (`names`, `extra`) that nothing reads or
  writes (the function only casts and passes the pointer). Removing both
  gives identical bytes and relocations (my run: SAME). It looks like a
  re-read lever where the original has none, and the lint cannot see
  member-level volatile. Fix: plain `int`s, or `void *`.
- [NOTE] `src/main/func_0207391c.legacy.c:4,6` — the volatile on
  `data_0219ef28` (read once in the original, in a different position than
  the compiler would pick without it) and the missing `volatile` on the data
  pointer `data_0219ef24` make the declaration set a matching lever more than
  a statement about the IRQ queue. It is needed to match (variant DIFF) and
  the original does re-read `data_0219eefc` three times; I accept it.
- [NOTE] `src/main/func_0207b548.legacy.c:1`, `func_0207b13c.legacy.c:1` — the
  shared `GxState` has `int state` at 0x2260 but the code reads and writes
  0x2264 by raw cast; the layout names a field that is not the one used. No
  byte effect.
- [NOTE] Type disguises that match the callee definitions but read oddly:
  `func_0207dc5c` passes a pointer as `int`; `func_02075d74.legacy.c` casts the
  `int` result of `func_02070ac0` to `void *` and casts its `struct
  S02074b90 *` parameter to `struct S0980 *` for `func_02070980`;
  `func_0207e664` and `func_0207e748` cast `char *` to local struct types.
  Each is consistent with the definition in `src/main`.
- [NOTE] `docs/ledger/attempts.tsv:1989` — the first `func_0207084c` row
  stores `0` in `match_pct` for an unscored tool-anomaly (the Worker says so).
  A numeric column now holds a placeholder that reads as a measurement.
  `validate_attempts.py` does not object. No change needed to the outcome.
- [NOTE] Tier coverage of the 18 parked functions. Every parked function lacks
  a row for one tier:
  - default and legacy only, no sp3: `0207084c`, `0207103c`, `02073f28`,
    `02077018`, `02077a28`, `02077b5c`, `0207845c`, `02078eec`, `0207c484`,
    `0207c4ec`. Their originals use `ldmia/ldmfd {..., lr}; bx lr` (the
    `02077018` shape is not decided by its last two instructions), which is
    the sp2p3 shape, so omitting sp3 is defensible.
  - default and sp3 only, no legacy: `0207d3ac`, `0207d458`, `0207e0a8`,
    `0207e594`, `0207ef90`, `0207f05c`, `0207f510`, `0207ff84`. Every one ends
    `pop {..., pc}` (sp3 or 2.0 shape), so omitting sp2p3 is defensible.
  None of the 18 has all three rows; I cannot say any of them would match.
- [NOTE] `func_02078eec` (28 B, parked `structural` at 0.0 in both tiers): the
  original is not a 32-bit read; it loads four halfwords and builds two
  words (`r1 = h[-1] | h[0] << 16`, `r0 = h[-3] | h[-2] << 16`) and returns
  both, a 64-bit return. My two scratch drafts with an `unsigned long long`
  return got within a few instructions (loads grouped before the `orr`s,
  plus `adds/adc` or `orr #0`) but did not match. So the 0.0 reflects the
  wrong return type in the drafts, and I could not match it either; the park
  stands as unproven rather than correct.
- [NOTE] `func_0207845c` (final state). The `.s` and its `delinks.txt` block
  are byte-identical to `origin/main`, and the latest row (line 2102) is
  `legacy parked unknown tool-anomaly` with shape
  `objdiff-100-reference-blocked`; the earlier `shipped 100` row (line 2033) is
  the history. The reason is sound: `symbols.txt` has both `data_021020b4` and
  `data_021020b5` (lines 11041, 11042), the original `.s` says
  `data_021020b4+0x1`, the first shipped C used `data_021020b4 + 1`, and the
  correction to `data_021020b5` produced `Undefined : "data_021020b5"` at
  link, which the Worker reports. The label is a byte inside the
  `data_021020b4` data bundle, so a fix needs a symbol-file decision outside
  this batch. I did not try the `+ 1` form through the reference check
  (see "Not verified"). The `unknown` score is honest.
- [NOTE] `func_02078d88`, `func_0207deb0` use `.legacy.c` but compile
  identically under sp3 (leaf functions with no frame). Either suffix gives
  the same ROM.

## Pass two: comparison with `docs/batches/batch-06.md`

Read after pass one.

- **Reproduced:** 37 matched, 4,484 B, 29/8 by suffix; 18 parked; 3
  skipped; "58 = 37 + 18 + 3"; the gate lines (`SHA1 PASS` in three regions,
  `GATE PASS`, `GATE EXIT 0`; my line numbers differ because my run built a
  clean tree); `check_references` numbers exactly (`32903 units`, 5514, 0, 412,
  5926); `check_fake_matches` line exactly; `check_delink_dupes`;
  `check_match_invariants` 13,999 warnings, 0 errors; `validate_attempts`
  2,101 rows, 66 shape conflicts; `ruff` clean; `progress` 428,966 / gain
  4,484 equals the sum of the 37 spans; pre-batch ledger prefix identical;
  the 21 retained `.s` files are unchanged.
- **Differs, explained:** the Worker's pytest line is `1331 passed, 14
  skipped`; mine is `1330 passed, 15 skipped`. Same suite on macOS versus
  Windows (platform skips); no failures in either.
- **Not reproduced:** `python -m unittest discover -s tests` (`Ran 1345 tests`)
  I did not run; the gate's pytest covers the same tree and I report it as
  UNPROVEN below. The per-function default/legacy/sp3 partial scores in the
  "Attempted but not shipped" table: no drafts are committed, so I cannot
  re-run them; the ledger rows match the report's table.
- **Contradicted:** the evidence column for `func_02072444` ("default
  instruction selection differs"): the shipped source needs no 1.2 tier.
  The `func_0207fd60` skip reason does not hold.
- **Acceptance evidence is on `6822eacc4`.** `git diff --name-status
  6822eacc4 ccc764447` shows one file, `M docs/batches/batch-06.md`, and
  `git log 6822eacc4..ccc764447` is one commit. So the later commit changes
  only the report. My own gate ran at `ccc764447`.
- **Items the report flags, judged:**
  - *Volatile on IRQ queue globals:* needed to match, tested (above); accepted
    with the NOTE on `data_0219ef28`.
  - *Five callers aligned to callee prototypes:* confirmed against the
    definitions (above).
  - *`func_0207845c` reverted after the link blocker:* accepted, see NOTE.
    The report is accurate that the restored `.s` is byte-identical.
  - *Append-only classification rows for `func_02078d88`/`func_02078eec`:*
    the `02078d88` correction lands after its shipped row (SHOULD FIX).
  - *`func_0207e1c4` and `DuelHeapSlot`:* checked, matches stride 0x18.
  - *`func_0207fd60` as an "existing prototype defect":* not accepted
    (SHOULD FIX).
  - *Libzstd workaround on macOS:* a Mac-only setup note; nothing in the diff.
  - *`func_0207084c` placeholder zero:* confirmed, NOTE.

## Not verified

- The parked functions' scores and whether any would match with more work:
  the drafts are not committed.
- Whether `func_0207845c` with `data_021020b4 + 1` would pass the reference
  check and baseline rules (I did not run a build with that form), so I
  cannot say the park was the only way out.
- `python -m unittest discover -s tests` (UNPROVEN CLAIM: "Ran 1345 tests ...
  OK (skipped=14)").
- The `func_0207fd60` scratch draft through fastmatch or a link; I compared
  its instructions against the `.s` by reading only.
- Field names and struct layouts: bytes are proven, names are the Worker's
  guesses.
- USA and JPN: through the gate only (`SHA1 PASS` both); no USA/JPN file is
  in the diff.

## Verdict

The 37 conversions are real. They are plain C with no fake-match construct
that I could find, every one is 100% under fastmatch, the three-ROM gate
passes at this exact commit, the routing change is the 37 path lines and
nothing else, the ledger is append-only with a valid shape, and the
Natural-C gain (4,484 B) equals the matched sizes to the byte. The five
prototype corrections agree with their definitions, and `func_0207845c` is
back on `.s` byte for byte for a sound reason. I found no BLOCKER. What I
would fix before merge, none of it changing a ROM byte: the `func_02078d88`
ledger row order, `func_02072444` routed to the wrong tier (and its false
default row), the unused volatile members in `func_0207e664`, and the
`func_0207fd60` skip, which leaves a function that very probably matches at
`legacy_sp3` on `.s` with no row so it will be offered again. Confidence is
high on the bytes, the routing and the ledger bookkeeping, moderate on field
names, and low on whether any of the 18 parked functions is truly beyond
reach.
