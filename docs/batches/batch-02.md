# Batch 02: Worker summary

Scope: EUR main, `.s`-only functions of 256 bytes or less, never attempted,
in 0x02030000-0x0203ffff. That was 55 candidates: func_0203244c (skipped by
batch 01), then func_0203671c through func_0203f6cc. I attempted all 55, in
address order: 45 now match at 100% and 10 are parked. Each match is its own
commit, recorded with `record_shipped.py` under the tier it ships in. The
parks are restored to `.s` with `park_one.py`. After the batch,
`wall_aware_headroom.py` with the same filters reports `TOTAL candidate EUR
.s remaining: 0`. No function in the walked range was left unattempted.

## Matched (45 functions, 6,136 B)

| Function | Size | Tier |
|---|---|---|
| func_02037328 | 80 | `.c` |
| func_020379f8 | 120 | `.c` |
| func_02037a70 | 72 | `.c` |
| func_02037b58 | 140 | `.c` |
| func_02037be4 | 112 | `.c` |
| func_02037ca0 | 136 | `.c` |
| func_02037fe4 | 248 | `.c` |
| func_020380dc | 140 | `.c` |
| func_020381bc | 144 | `.c` |
| func_020385f8 | 124 | `.c` |
| func_02038674 | 128 | `.c` |
| func_020387c0 | 80 | `.c` |
| func_02038810 | 224 | `.c` |
| func_02038908 | 80 | `.c` |
| func_02038d70 | 60 | `.c` |
| func_02038ddc | 124 | `.c` |
| func_02039990 | 76 | `.c` |
| func_0203a780 | 204 | `.c` |
| func_0203aeec | 88 | `.c` |
| func_0203b2f4 | 196 | `.c` |
| func_0203b880 | 124 | `.c` |
| func_0203bad0 | 220 | `.c` |
| func_0203c3dc | 144 | `.c` |
| func_0203c89c | 100 | `.legacy_sp3.c` |
| func_0203c900 | 104 | `.legacy.c` |
| func_0203cc58 | 224 | `.legacy_sp3.c` |
| func_0203cff8 | 128 | `.legacy_sp3.c` |
| func_0203d078 | 104 | `.legacy_sp3.c` |
| func_0203d0e0 | 224 | `.legacy_sp3.c` |
| func_0203d258 | 144 | `.legacy_sp3.c` |
| func_0203d2e8 | 180 | `.legacy_sp3.c` |
| func_0203d5b0 | 248 | `.legacy_sp3.c` |
| func_0203def0 | 152 | `.legacy_sp3.c` |
| func_0203e198 | 108 | `.legacy_sp3.c` |
| func_0203e204 | 80 | `.legacy_sp3.c` |
| func_0203e2f0 | 228 | `.legacy_sp3.c` |
| func_0203e400 | 96 | `.legacy_sp3.c` |
| func_0203e460 | 224 | `.legacy_sp3.c` |
| func_0203e870 | 72 | `.legacy_sp3.c` |
| func_0203e95c | 80 | `.legacy_sp3.c` |
| func_0203eaa8 | 108 | `.legacy_sp3.c` |
| func_0203eb14 | 52 | `.legacy_sp3.c` |
| func_0203ed80 | 84 | `.legacy_sp3.c` |
| func_0203f590 | 256 | `.legacy_sp3.c` |
| func_0203f6cc | 76 | `.legacy_sp3.c` |

From 0x0203c89c on, most of this range is compiled with mwcc 1.2/sp3. The
signs are the `sub sp, #4` prologue and literal-pool constants such as
0x474 and 0x47c. func_0203c900 is 1.2/sp2p3 (`ands` kept rather than
`tst`).

## Attempted, not matched (10, parked)

| Function | Size | Best (fastmatch) | Park class | What is left |
|---|---|---|---|---|
| func_0203aae8 | 176 | 97.8% | P-38-tentative-void-loop-trailing-epilogue | one dead trailing `pop` after a `for (;;)` loop. This is a second instance of the documented wall: every loop form and the sp3 tier keep it. |
| func_0203671c | 192 | 91.7% | P-36-literal-store-order | two constant `mov`s scheduled before an unrelated store |
| func_0203c730 | 160 | 90.0% (sp3) | P-20-family | registers only, after 720 declaration orders. It has two rows: 10.0% under 2.0, then 90.0% under sp3. |
| func_0203d1c0 | 152 | 71.0% (sp3) | P-20-family | registers only; all 120 declaration orders tried |
| func_0203b6b4 | 192 | 70.8% | P-20-family | registers of compiler-made induction variables |
| func_0203244c | 116 | 62.1% | address-fold | the original adds a known-zero register to a base; mwcc folds it away |
| func_020384e8 | 172 | 53.5% | P-20-family | registers only |
| func_02038e58 | 228 | 43.1% | load-scheduling-residual | a stack argument is loaded once in the original and twice in mine (56.1% under sp3, not recorded as a new row) |
| func_0203724c | 220 | 38.2% | P-20-family | same structure, different registers |
| func_0203f30c | 112 | 25.0% | unknown | the original keeps `sub #0x61; add #26` unfolded; every spelling and tier I tried folds it |

## Checks

Run on 8a44a64dd, the last code commit; this summary is the only change after it:

- `python tools/check_delink_dupes.py`:
  `check_delink_dupes: OK (81 delinks.txt, no duplicate .text addresses)`,
  exit 0.
- `python tools/check_match_invariants.py --version eur`:
  `Found 13999 issue(s): 0 error(s), 13999 warning(s).` It exits 1, which
  means warnings only. The count is the same as before the batch.
- `python tools/validate_attempts.py`: exit 0, `"rows": 1980`,
  `"errors": 0`. No notes for batch-02 rows.
- `python tools/check_fake_matches.py`: `check_fake_matches: OK`, with
  baseline entries unchanged at 4.
- `python tools/progress.py --version eur`: Natural-C went from 418,346 B to
  424,482 B (17.53% to 17.79%), a gain of 6,136 B. That equals the sum of the
  45 shipped rows' `text_size`.
- `python tools/fastmatch.py eur <file>` shows 100.0% OK for each shipped
  file at the moment it was committed.

The three-region gate runs on the commit that adds this file. Its log-check
lines are in the handoff reply.

## For the Verifier: things to check

- **Callee prototypes that differ from their matched definitions.** In each
  case the definition is under-declared: it forwards r1/r2 untouched, and
  the original callers pass those arguments.
  - func_02087da4, func_02087dcc, func_02087d54 and func_02087d7c are
    defined with one parameter. func_02037fe4, func_020380dc and
    func_020381bc declare them as `(void **pp, int mask, int value)`.
  - func_0203f690 is defined with one parameter. func_0203d5b0 declares it
    with two.
- **Other prototype differences between files.**
  - func_0203c89c is defined as `(unsigned char)`, but func_0203cc58 uses
    the existing `(int)` declaration.
  - func_02037328 is now defined as taking an entry pointer, but batch 01's
    func_02034bd8 declares it `(int)`.
  - func_0203f590 is defined as `(void *, unsigned char *)`, while older
    callers declare `(int, void *)` or `(void *, void *)`.
- **Pointer-to-int casts.** These follow the existing definitions'
  `int`-typed parameters: `(int)rec->name` in func_0203d2e8, and
  `(int)data_020bee7c` and `(int)data_020bee84` in func_0203e95c.
- **`volatile` struct members** in func_02038908 (`seed_lo` and
  `seed_hi` of `data_0219b2e0`). The original reloads every access,
  including right after a store. The quirks doc lists member-level
  `volatile` as a lever, and it is a member of a global, not a local or
  a pointer; the lint passes it.
- **Dead or redundant tests that mirror the original.**
  - The `index < 0` test in func_0203b2f4 (the IMA-ADPCM decoder) is on a
    value that comes from a byte, so it can never be true; the original
    has the `cmp; blt`.
  - `i = 0; if (i < n) { ... do { } while (i < n); }` in func_0203d258
    gives the hoisted loop-invariant placement. The plainer
    `if (n > 0)` scores 88.9%.
- **Symbol references.** func_0203e198 and func_0203e204 name
  `data_020bec44`, and func_0203f590 names `data_020bed04`. The `.s`
  files spelled these as `data_020bec3c+0x8` and `data_020bece4+0x20`,
  but the delinked objects relocate against the named symbols, and the
  reference check compares against those.
- **Small `static inline` helpers.** func_0203cff8 and func_0203d078 use
  `GetLevel`; func_0203d2e8 uses `IsFlag10`. They reproduce the
  original's redundant `& 0xff` and the order its tests are evaluated in.
- **Struct layouts.** Each file declares its own local struct types. The
  offsets agree with the other matched files for the same objects
  (`data_0219b760` entries, the `data_0219d9b8` game state, the
  0xc0-byte peer records). The field names are guesses.

## Limitations and blockers

- No tool defect blocked any function, and no tools were changed. Every
  draft was written by hand. Helper scripts in my scratch space automated
  only fastmatch runs, side-by-side disassembly and searches over
  local-declaration orders.
- Before the gate, I re-ran the 2.0-parked functions under
  `.legacy_sp3.c`. Only func_0203c89c changed outcome: parked at 64.0%,
  then matched (two ledger rows). The others went back to `.s` exactly
  and keep their earlier park rows.
- func_0203c900 first got a `default` tier in its ledger row. A
  follow-up commit corrected it to `legacy`.
