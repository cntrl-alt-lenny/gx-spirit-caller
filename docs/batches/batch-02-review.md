# Batch 02: Verifier review

Reviewed commit: `b2556d0194fc03070ec850afb8504836dd62cd3e` on
`worker/batch-02` (55 commits on top of `origin/main` at `a42868fb3`, which
is still the tip of `main`). Reviewed in `.worktrees/verifier-batch-02` on
branch `verifier/batch-02`, on Windows 11 with `python`.

## Commands I ran myself

| Command | Exit | Real output |
|---|---|---|
| `git diff --stat origin/main...b2556d019` | 0 | 94 files: 45 `src/main/*.c` added (23 `.c`, 1 `.legacy.c`, 21 `.legacy_sp3.c`), the same 45 `.s` deleted, `config/eur/arm9/delinks.txt`, `docs/ledger/attempts.tsv`, `docs/batches/batch-02.md`, `tools/reference_baseline.txt` (5 deletions, 0 additions). No renames, ports, USA/JPN, symbol, settings or other tool changes. |
| `python tools/gate3.py --scope all --log <scratch>/gate-batch02.log` (not piped) | 0 | see the log check below |
| PowerShell log check from `AGENTS.md`, verbatim | 0 | `27130:[eur] SHA1 PASS`, `52728:[usa] SHA1 PASS`, `78327:[jpn] SHA1 PASS`, `78367:1330 passed, 15 skipped, 132 subtests passed in 24.40s`, `78370:==================== GATE PASS ====================`, `78371:gate3: GATE EXIT 0`. No region `SKIP` line (the 15 are pytest skips). |
| (inside the gate) `tools/check_delink_dupes.py` | 0 | `check_delink_dupes: OK (81 delinks.txt, no duplicate .text addresses)` |
| (inside the gate) `tools/check_references.py` | 0 | `wrong-target 412 (baseline entries 5926)`, `check_references: OK`. Batch 01 had 5931 entries; 5931 − 5 = 5926. |
| (inside the gate) `tools/check_fake_matches.py` | 0 | `register-pin 0, do-while-zero 3, volatile-local 1 (baseline entries 4)`, `check_fake_matches: OK`, the same counts as batch 01 |
| `python tools/fastmatch.py eur <all 45 new files>` | 0 | 45 × `100.0%  OK  (resolved, …)`. Word count × 4 equals the ledger `text_size` for every one. |
| `python tools/validate_attempts.py` | 0 | `"rows": 1980, "errors": 0`, `"shape_conflicts": 66`. None of the notes concern batch-02 rows. |
| `python tools/progress.py --version eur` | 0 | `Natural-C: 424482 / 2385948 bytes (17.79%)` |
| `python tools/check_match_invariants.py --version eur` | 1 | `Found 13999 issue(s): 0 error(s), 13999 warning(s).` Exit 1 = warnings only. The new files raise only `dsd-placeholder name` warnings, which the batch may not act on (no renames). |
| `python tools/fastmatch.py` and the headroom tool need a populated `build/`, so I ran them after the gate; `ninja build/eur/report.json` | 0 | `Writing to build\eur\report.json` |
| `python tools/wall_aware_headroom.py --exclude-attempted --max-size 256 --min-addr 0x02030000 --max-addr 0x0203ffff` | 0 | `TOTAL candidate EUR .s remaining: 0`. Without `--exclude-attempted`: `main 28` `.s`, all of them with ledger rows. Batch 01 left 55 candidates; this batch has rows for 55 distinct addresses. |
| A script over `attempts.tsv` and `delinks.txt` (sizes, routing, tiers, prior rows) | 0 | see below |
| A script that compiles each tier-suffixed file and two `.c` files under all three compilers with the build's own flags (`-lang=c99`, checked in `build.ninja`) and compares `.text` | 0 | see "Tiers" below |

Natural-C: 424,482 − 418,346 = **6,136 B**. That is exactly the sum of the
45 shipped rows' `text_size`, and of their `delinks.txt` spans.

## What pass one found

- **Routing.** All 45 `delinks.txt` edits change only the path line of an
  existing block: `.s` becomes `.c`, `.legacy.c` or `.legacy_sp3.c`. The
  `start`/`end` lines do not change. Every span equals its ledger
  `text_size`, and every suffix matches the row's `tier`. Every address is
  in 0x02030000-0x0203ffff and ≤256 B. No other block changed.
- **Ledger.** 57 new rows, all `brief=batch-02`: 45 `shipped 100 n/a` and
  12 `parked`, covering 55 distinct addresses. None of the 55 had a row
  before this batch. Two addresses have two rows, and both pairs are
  consistent:
  - `0x0203c89c`: parked, 64.0, `default`, then shipped under
    `legacy_sp3`.
  - `0x0203c730`: parked, 10.0, `default`, then parked, 90.0,
    `legacy_sp3`.

  Every `park_class` has a row in `tools/park_class_map.tsv`.
- **Parks back on `.s` exactly.** None of the ten parked `.s` files or
  their `delinks.txt` blocks appear in the diff.
- **Baseline prune.** The five deleted lines are all `wrong-target` entries
  keyed to `src/main/func_0203e198.s`, `func_0203e204.s`, `func_0203e95c.s`
  (two lines) and `func_0203f590.s`. Those paths no longer exist. The new
  C names the symbols the reference check reports as the original targets:
  - `data_020bec44` and `data_020bed04` are defined in
    `src/main/data/data_020bec3c.s` and `data_020bece4.s`.
  - `data_020bee7c` and `data_020bee84` are defined in `data_020bee6c.s`.

  The gate's reference check passes with 5926 entries. The five lines
  were stale, and nothing was added.
- **Honest C.** I read all 45 files. They have no raw data words, inline
  asm, register pins, do-while-zero wrappers, section tricks or volatile
  locals. Odd-looking constructs, checked against the original `.s` on
  `origin/main`:
  - `func_02038908`: the `volatile` members match the original's
    six loads of `+0x5c` and `+0x60`. It loads `+0x60` three times
    with no store in between, which CSE would merge without `volatile`.
  - `func_02037b58`: `id` is range-checked against `data_0219b760` and
    `data_0219c408`, matching the real `_LIT1`/`_LIT2` relocations.
    `0x0219c408` = `0x0219b760` + 27 × 0x78, the last entry.
  - `func_02038ddc` walks backwards from `data_0219d00c`
    (= `data_0219c4e8` + 31 × 0x5c). The original relocates against
    `data_0219d00c` itself.
  - `func_0203b2f4`: `data_027e0000`/`data_027e0010` are the original's own
    relocations. The table stride 89 × 2 = 0xb2 is the `mov r6, #0xb2`.
  - The game-state offsets agree across files: mode at 0xd0c/0xd0d,
    slot at 0xd11, count at 0xd12, self at 0xd13, players at 0x444 with
    stride 4, and entries at 0x470 with stride 0xc0. So do the original
    instructions in `func_0203c89c` (`ldrb [r4,#0xd0d]`, `ldrb [r4,#0xd13]`,
    `ldrb [r0,#0x444]`).
- **Tiers.** I compiled every tier-suffixed file and `func_02038908.c` /
  `func_0203b2f4.c` under 2.0/sp1p5, 1.2/sp2p3 and 1.2/sp3. The 2.0 compile
  of `func_0203e95c` is byte-identical to the build's own `.legacy_sp3.o`,
  which shows the method reproduces the build.
  - 16 of the 21 `.legacy_sp3.c` files differ under both other tiers, so
    sp3 is required.
  - `func_0203c900.legacy.c` differs under 2.0 (`tst` instead of
    `ands r1, r0, #1`), so a 1.2 tier is required.
  - `func_02038908.c` and `func_0203b2f4.c` need 2.0.
  - Five `.legacy_sp3.c` files compile byte-identically under 2.0 (see
    the NOTE below).
- **Three I trusted least, attacked.**
  1. `func_02038908`: the load order of the C is hi, lo, then hi, hi, lo.
     It gives exactly the original's `lr`, `ip`, `r3`, `r2`, `r1` loads,
     with the store, the reload after it and the final reload. The
     `volatile` is the only C mechanism I know that gives three loads of
     one address with no store in between. No wrong reference.
  2. `func_0203f590`: the stack copy of `data_020bed04` (0x18 bytes,
     `data_020bed04`..`data_020bed1c`) is the 12 × 2-byte loop.
     `from` and `cur` are always equal; they are redundant in the C but
     reproduce the `r6`/`r7` pair. The cycle-following permutation is
     correct as written. No wrong reference.
  3. `func_0203c89c`: the original never zero-extends `r0`
     (`mov r6, r0; cmp r6, #0x10; ldmcs`), so the `unsigned char`
     parameter relies on callers to pass a byte. Its callers
     (`func_0203cc58`, `func_0203cb40`) declare it `(int)` and pass `int`.
     The binary is fixed either way, so this is a declaration
     inconsistency, not a wrong match (see the NOTE below).

  I found no construct that matches only by accident.

## Findings

- [SHOULD FIX] `docs/ledger/attempts.tsv:1948` (the `0x02038e58` row) and
  `docs/batches/batch-02.md:78`, `:168-171`.
  - **What is wrong:** the report says `func_02038e58` reached "56.1%
    under sp3, not recorded as a new row". It also says every 2.0-parked
    function was re-run under `.legacy_sp3.c`, yet only `func_0203c730`
    and `func_0203c89c` got `legacy_sp3` rows. The sp3 attempts on
    `0203244c`, `0203671c`, `0203724c`, `020384e8`, `02038e58`,
    `0203aae8` and `0203b6b4` are failed attempts that are not in the
    ledger, which is an Invariant. The ledger is an event log, and its
    `0x02038e58` row records the worse figure (`default`, 43.1).
  - **How it fails:** the next attempt reads the ledger and starts from
    the wrong tier and the wrong best score. For `func_02038e58` the ledger
    under-reports by 13 points, and the better tier is lost.
  - **Fix:** append a `parked … legacy_sp3` row for each of the seven,
    with its measured sp3 score (56.1 for `func_02038e58`).
- [NOTE] `src/main/func_0203e400.legacy_sp3.c`,
  `func_0203e95c.legacy_sp3.c`, `func_0203eb14.legacy_sp3.c`,
  `func_0203ed80.legacy_sp3.c`, `func_0203f6cc.legacy_sp3.c`.
  - These five compile byte-identically under the default 2.0 compiler.
    Nothing in their code justifies sp3 over `.c`.
  - Likewise `func_0203c900.legacy.c` compiles identically under sp3. It
    needs a 1.2 tier, but `ands` does not tell sp2p3 from sp3, as
    `docs/batches/batch-02.md:64-65` claims.
  - The ROM is the same either way, and grouping them with their sp3
    neighbours is defensible. But the report's stated evidence (the
    `sub sp, #4` prologue, `:62-63`) is absent from these files, and a
    future reshape may pick the wrong compiler from the suffix.
- [NOTE] Callee declarations that differ from their own matched
  definitions, all disclosed by the Worker:
  - `func_0203cc58.legacy_sp3.c:6` declares `func_0203c89c(int)`; the
    definition takes `unsigned char`.
  - `func_0203d0e0.legacy_sp3.c:16-17` uses its own struct types.
  - `func_02037fe4`, `func_020380dc` and `func_020381bc` declare three
    parameters for `func_02087da4`, `func_02087dcc`, `func_02087d54` and
    `func_02087d7c`, which are defined with one.

  I checked `func_02087d54.legacy_sp3.o`: it leaves `r1`/`r2` untouched
  into its tail call, so the three-parameter callers are the more accurate
  side, as the Worker says. Harmless while each function is in its own TU;
  they conflict the day a shared header exists.
- [NOTE] `src/main/func_02037328.c:10`: the EUR definition now takes an
  entry pointer. `src/main/func_02034bd8.c:9` declares `(int)` and passes
  `0`, which is consistent: NULL means "any live entry". The USA/JPN
  `func_02037328.c` are a different two-argument function at the same
  address. That is not a problem for this batch, but the names will need
  care when the USA/JPN ports are reconciled.
- [NOTE] `docs/ledger/attempts.tsv`, row `0x0203f30c`:
  - `park_class` is `unknown` (`UNCLASSIFIED:unknown`), though the report
    gives a concrete diagnosis ("keeps `sub #0x61; add #26` unfolded").
  - The `0x0203c900` row was edited in place (`default` → `legacy`, commit
    `67d48d71b`) in a log the schema calls append-only. It is unmerged
    and the corrected value is right, so it has no consequence.
- [NOTE] `docs/batches/batch-02.md:113-114`: the gate evidence for the
  delivered commit is "in the handoff reply", not in the document. My own
  gate on `b2556d019` passed, so this has no consequence.
- [UNPROVEN CLAIM] `docs/batches/batch-02.md:71-80`: the ten parks' best
  scores ("97.8%", "91.7%", "90.0% (sp3)", "71.0% (sp3)", "70.8%",
  "62.1%", "53.5%", "43.1%", "38.2%", "25.0%"), the "720"/"120 declaration
  orders" and the wall diagnoses. No drafts are committed, so I could not
  re-run them. The ledger rows match the table, apart from the sp3 scores
  in the SHOULD FIX above.

## Pass two: the "For the Verifier" items

- **Prototypes that differ from definitions.** Confirmed as described.
  The under-declared definitions are real: `func_02087d54` forwards
  `r1`/`r2`. See the NOTE.
- **Other prototype differences** (`func_0203c89c`, `func_02037328`,
  `func_0203f590`). All confirmed. `func_0203f740.legacy_sp3.c` declares
  `func_0203f590(int, void *)` and `func_0203f718.c` declares
  `(void *, void *)`; both are pre-existing files. All of these are
  harmless today.
- **Pointer-to-int casts** in `func_0203d2e8` and `func_0203e95c`. They
  follow the existing `int`-typed definitions (`func_0203e3d4(int, int,
  int, int)` in `func_0203e3d4.legacy_sp3.c:5`). Acceptable.
- **`volatile` members in `func_02038908`.** I agree, on the merits. The
  original reloads `+0x60` three times with no store in between and
  reloads `+0x5c` right after storing it. Only `volatile` produces that.
  It is on two members of a global, not a dummy local, and
  `docs/compiler-quirks.md:145` documents member-level `volatile` as a
  lever. The local struct type is this TU's own view of `data_0219b2e0`.
  Other TUs see it without `volatile`. That is fine for matching, but a
  shared header must carry the qualifier.
- **Dead or redundant tests.**
  - The entry `index < 0` test in `func_0203b2f4` mirrors the original's
    `cmp lr, #0; blt`. The loop's own `index < 0` test is live, because of
    the signed table add.
  - The guarded `do`/`while` in `func_0203d258` is ordinary C, not a
    do-while-zero.
  - Both are honest.
- **Symbol references.** Confirmed: the four named symbols exist as
  `.global` labels at those addresses, and the reference check passes.
  This is more accurate than the `.s`, which used base+offset.
- **`static inline` helpers** in `func_0203cff8`, `func_0203d078` and
  `func_0203d2e8`. They are honest C, with no tricks.
- **Struct layouts.** The offsets agree across files (see above).

Where I disagree with the report: the tier evidence (NOTE above), and the
unrecorded sp3 attempts (SHOULD FIX).

## Not verified

- The ten parked functions' best scores and wall diagnoses, and the sp3
  re-runs' scores: no drafts are committed.
- Whether the owner approved the baseline prune: I have only the
  Worker's word. The prune itself is correct: 5 stale lines, nothing
  added.
- `check_delink_dupes.py` on the *merged* tree. `main` has not moved since
  the branch point, so it is the same tree today. Re-run it if anything
  else lands first.
- USA/JPN: untouched by design. Their SHA-1 PASS shows only that nothing
  broke.

## Verdict

I believe the 45 matches are real, honest and complete. Each one:

- is 100% under resolved `fastmatch` at `b2556d019`;
- rebuilds byte-identical in all three ROMs, with the reference check and
  the fake-match lint green;
- has routing that touches exactly its own block;
- adds exactly its own size to Natural-C (6,136 B in total).

Every in-range candidate now has a ledger row. I checked each unusual
construct against the original instructions, including the `volatile`
members of `func_02038908`; none is a trick, and the five pruned baseline
lines were stale. My confidence in the shipped code is high.

The one substantive gap is in the ledger. Seven sp3 re-attempts, one of
them a better score (`func_02038e58`, 56.1% vs the recorded 43.1%), were
run but not recorded. That should be fixed in this batch, but it does not
make any shipped code wrong. The tier evidence for five sp3 files and for
`func_0203c900` is weaker than the report states, but it has no ROM
consequence. Nothing here blocks a merge.
