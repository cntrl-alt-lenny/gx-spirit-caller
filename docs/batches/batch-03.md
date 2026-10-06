# Batch 03: Worker summary

Scope: EUR main, `.s`-only functions of 256 bytes or less, never attempted,
in 0x02060000-0x0206ffff. That was 92 candidates. I walked all of them in
address order, from func_020601d0 to func_0206fb64 (the last one). I
attempted 91: 74 match at 100% and 17 are parked. I skipped one,
func_0206be1c, because it is not a function: it is a 12-byte shared
epilogue tail (`add sp, sp, #4; ldmia sp!, {r4-r9, lr}; bx lr`) with no
entry, so there is no C to write. After the batch, `wall_aware_headroom.py`
with the same filters reports `TOTAL candidate EUR .s remaining: 1`, and
that one is func_0206be1c.

Each match is its own commit, recorded with `record_shipped.py` under the
tier it ships in. Every function went into plain `.c` first. Each attempt
that did not match has its own ledger row, one per tier tried; no row was
edited or deleted.

## Matched (74 functions, 11,332 B)

6 ship as `.c`, 53 as `.legacy_sp3.c` and 15 as `.legacy.c`. For each
non-default tier, the evidence column says what in the original 2.0 cannot
produce, and gives the 2.0 attempt's score (each has its own parked ledger
row):

- **sp3 frame.** The original pushes an odd number of registers and does
  `sub sp, #4` (or more), where 2.0 pushes `r3` as an alignment pad.
  This is the documented 1.2/sp3 signature.
- **Two-step return.** `pop {…, lr}; bx lr` is 1.2/sp2p3 only.
- **Other 1.2 behaviour, where both prologues are the same.** The original
  branches where 2.0 if-converts, keeps `ands` where 2.0 emits `tst`,
  re-reads memory right after a store or inside a loop, or loads a
  constant from the literal pool. In each such case the 1.2/sp3 compile
  matched and 2.0 did not.

| Function | Size | Tier | Evidence for the tier (2.0 score) |
|---|---|---|---|
| func_020601d0 | 244 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 73.8%) |
| func_020603cc | 216 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 14.8%) |
| func_02060b84 | 140 | `.legacy_sp3.c` | 2.0 if-converts where the original branches (2.0: 45.7%) |
| func_02060c10 | 128 | `.legacy_sp3.c` | 2.0 if-converts where the original branches (2.0: 3.1%) |
| func_02060cbc | 208 | `.legacy_sp3.c` | post-indexed byte copy 2.0 does not emit (2.0: 9.4%) |
| func_0206133c | 156 | `.c` | — |
| func_020613d8 | 140 | `.legacy_sp3.c` | 2.0 if-converts where the original branches (2.0: 5.7%) |
| func_02061578 | 248 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 25.8%) |
| func_02061a8c | 212 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 1.9%) |
| func_02061b60 | 252 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 1.6%) |
| func_02061c5c | 256 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 1.6%) |
| func_02061e88 | 152 | `.c` | — |
| func_02062164 | 120 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 0.0%) |
| func_020621dc | 164 | `.c` | — |
| func_02062280 | 72 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 66.7%) |
| func_02062320 | 108 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 0.0%) |
| func_02062834 | 124 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 0.0%) |
| func_02062aec | 92 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 65.2%) |
| func_02062b48 | 92 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 65.2%) |
| func_02062ba4 | 116 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 72.4%) |
| func_02062c18 | 92 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 65.2%) |
| func_02062d88 | 112 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 0.0%) |
| func_02062df8 | 116 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 72.4%) |
| func_02062eec | 212 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 3.8%) |
| func_02063188 | 256 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 78.1%) |
| func_02063548 | 216 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 1.9%) |
| func_0206371c | 236 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 0.0%) |
| func_02064208 | 148 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 8.1%) |
| func_02064db0 | 76 | `.legacy_sp3.c` | original predicates where 2.0 branches (2.0: 20.0%) |
| func_02064f84 | 200 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 0.0%) |
| func_020652b8 | 232 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 0.0%) |
| func_020653a0 | 208 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 1.9%) |
| func_0206553c | 84 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 0.0%) |
| func_020657c0 | 204 | `.legacy_sp3.c` | constant/store order 2.0 cannot reproduce (2.0: 56.9%) |
| func_0206588c | 168 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 0.0%) |
| func_02065dc0 | 84 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 38.1%) |
| func_02065fa8 | 104 | `.c` | — |
| func_02066224 | 88 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 0.0%) |
| func_020665e0 | 112 | `.legacy_sp3.c` | original re-reads memory 2.0 keeps in a register (2.0: 42.9%) |
| func_020669c4 | 196 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 4.1%) |
| func_02066a88 | 96 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 0.0%) |
| func_02066d44 | 188 | `.legacy_sp3.c` | 2.0 if-converts where the original branches (2.0: 19.1%) |
| func_02067294 | 96 | `.legacy_sp3.c` | original re-reads memory 2.0 keeps in a register (2.0: 83.3%) |
| func_02067c58 | 144 | `.legacy_sp3.c` | constant from the literal pool, which 2.0 folds into immediates (2.0: 69.4%) |
| func_02067f3c | 256 | `.legacy_sp3.c` | `ands` kept where 2.0 emits `tst` (2.0: 98.4%) |
| func_0206803c | 144 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 2.8%) |
| func_020684c8 | 176 | `.legacy_sp3.c` | original re-reads memory 2.0 keeps in a register (2.0: 31.8%) |
| func_02068890 | 108 | `.legacy_sp3.c` | original re-reads memory 2.0 keeps in a register (2.0: 11.1%) |
| func_020688fc | 96 | `.c` | — |
| func_02068b54 | 64 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 75.0%) |
| func_02068bb8 | 80 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 0.0%) |
| func_02068d50 | 72 | `.c` | — |
| func_02068d98 | 88 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 81.8%) |
| func_0206904c | 176 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 0.0%) |
| func_020698fc | 248 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 83.9%) |
| func_02069de4 | 224 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 23.2%) |
| func_0206a984 | 172 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 2.3%) |
| func_0206b5e8 | 92 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 4.3%) |
| func_0206b778 | 96 | `.legacy_sp3.c` | sp3 frame: no `r3` pad push, `sub sp` instead (2.0: 0.0%) |
| func_0206baec | 124 | `.legacy.c` | two-step return `pop {…, lr}; bx lr` (2.0: 3.2%) |
| func_0206c074 | 156 | `.legacy.c` | two-step return `pop {…, lr}; bx lr` (2.0: 38.5%) |
| func_0206c52c | 240 | `.legacy.c` | two-step return `pop {…, lr}; bx lr` (2.0: 11.7%) |
| func_0206c9b0 | 156 | `.legacy.c` | two-step return `pop {…, lr}; bx lr` (2.0: 0.0%) |
| func_0206ceb8 | 88 | `.legacy.c` | two-step return `pop {…, lr}; bx lr` (2.0: 0.0%) |
| func_0206d0b0 | 152 | `.legacy.c` | two-step return `pop {…, lr}; bx lr` (2.0: 0.0%) |
| func_0206d360 | 164 | `.legacy.c` | two-step return `pop {…, lr}; bx lr` (2.0: 0.0%) |
| func_0206dad8 | 228 | `.legacy.c` | two-step return `pop {…, lr}; bx lr` (2.0: 0.0%) |
| func_0206e1e8 | 60 | `.legacy.c` | two-step return `pop {…, lr}; bx lr` (2.0: 0.0%) |
| func_0206e5a8 | 200 | `.legacy.c` | two-step return `pop {…, lr}; bx lr` (2.0: 4.0%) |
| func_0206e690 | 144 | `.legacy.c` | two-step return `pop {…, lr}; bx lr` (2.0: 8.3%) |
| func_0206ea90 | 120 | `.legacy.c` | two-step return `pop {…, lr}; bx lr` (2.0: 3.3%) |
| func_0206ebe8 | 204 | `.legacy.c` | two-step return `pop {…, lr}; bx lr` (2.0: 0.0%) |
| func_0206ee40 | 96 | `.legacy.c` | two-step return `pop {…, lr}; bx lr` (2.0: 91.7%) |
| func_0206fb64 | 200 | `.legacy.c` | two-step return `pop {…, lr}; bx lr` (2.0: 2.0%) |

## Attempted, not matched (17, parked; best score per tier)

| Function | Size | Best per tier (park class) |
|---|---|---|
| func_02060520 | 228 | `.c` 16.4% (P-36-store-postindex-fusion); `.legacy_sp3.c` 70.2% (P-36-call-adjacent-scheduling) |
| func_02060958 | 228 | `.c` 86.0% (frame-shape); `.legacy_sp3.c` 71.9% (P-20-family) |
| func_020628b0 | 76 | `.c` 31.6% (frame-shape); `.legacy_sp3.c` 31.6% (load-scheduling-interleave) |
| func_0206292c | 140 | `.c` 60.0% (load-scheduling-interleave); `.legacy_sp3.c` 60.0% (load-scheduling-interleave) |
| func_020629b8 | 104 | `.legacy_sp3.c` 69.2% (load-scheduling-interleave); `.c` 38.5% (load-scheduling-interleave) |
| func_02063664 | 172 | `.c` 0.0% (frame-shape); `.legacy_sp3.c` 46.5% (address-fold) |
| func_02063dc8 | 68 | `.legacy_sp3.c` 88.2% (P-31-if-conversion-mirrored); `.c` 88.2% (P-31-if-conversion-mirrored) |
| func_02065470 | 204 | `.legacy_sp3.c` 49.0% (load-scheduling-interleave); `.c` 31.4% (frame-shape) |
| func_02065d4c | 116 | `.legacy_sp3.c` 34.5% (epilogue-tail-merge-residual); `.c` 0.0% (frame-shape) |
| func_02067024 | 208 | `.legacy_sp3.c` 75.0% (P-36-instruction-scheduling); `.c` 0.0% (frame-shape) |
| func_020699f4 | 144 | `.c` 8.3% (frame-shape); `.legacy_sp3.c` 11.1% (load-scheduling-interleave) |
| func_0206afec | 92 | `.c` 8.7% (frame-shape); `.legacy_sp3.c` 8.7% (load-scheduling-interleave) |
| func_0206b1f8 | 96 | `.c` 0.0% (frame-shape); `.legacy_sp3.c` 29.2% (P-31-if-conversion) |
| func_0206b88c | 112 | `.c` 42.9% (frame-shape); `.legacy_sp3.c` 42.9% (P-36-pool-load-hoist) |
| func_0206b8fc | 112 | `.c` 42.9% (frame-shape); `.legacy_sp3.c` 42.9% (P-36-pool-load-hoist) |
| func_0206ba4c | 100 | `.c` 0.0% (frame-shape); `.legacy_sp3.c` 84.0% (load-scheduling-interleave) |
| func_0206d404 | 188 | `.c` 0.0% (pop-lr-bx-vs-pop-pc-epilogue); `.legacy.c` 76.6% (reg-alloc-instr-scheduling) |

func_0206c52c parked at 80.0% under `.legacy.c` and later matched; both
rows are in the ledger. The parks fall into a few groups:

- **Unaligned byte copies through pointer registers** (func_02063664,
  func_02065470, func_020699f4, func_0206afec). This is the documented
  "load-pair scheduling for an unaligned struct-like copy" wall.
- **Pool-load hoisting** in two sort comparators (func_0206b88c,
  func_0206b8fc).
- **Register allocation or scheduling residuals.** These are the rest.

## Checks

On 43aafa04f, the last match commit, the gate failed on one stale baseline
line, `STALE: [eur] src/main/func_020688fc.s: wrong-target at .text+0x5c
original ABS32 data_020bee74+0x0 built ABS32 data_020bee6c+0x8`. The
matched C names `data_020bee74`, as the original relocation does. As the
brief allows, I ran `python tools/check_references.py --version eur
--version usa --version jpn --prune-baseline` (`pruned 1 stale baseline
entries`). The diff is that single deleted line in
`tools/reference_baseline.txt`, and it went in as its own commit,
60e148bf5. The pruned line is:

```text
eur	src/main/func_020688fc.s	wrong-target	.text+0x5c original ABS32 data_020bee74+0x0 built ABS32 data_020bee6c+0x8
```

These checks ran on 60e148bf5, the last code commit:

- `python tools/gate3.py --scope all --log <scratch>/gate_final.log` gave
  exit 0. The PowerShell log check printed:

  ```text
  55:[eur] SHA1 PASS
  97:[usa] SHA1 PASS
  139:[jpn] SHA1 PASS
  179:1330 passed, 15 skipped, 132 subtests passed in 19.37s
  182:==================== GATE PASS ====================
  183:gate3: GATE EXIT 0
  ```

  Inside the gate: `check_delink_dupes: OK (81 delinks.txt, no duplicate
  .text addresses)`, `check_references: OK` and `check_fake_matches:
  OK`. No region SKIP lines appeared (the 15 are pytest skips).
- `python tools/check_baseline_growth.py --base origin/main`:
  `check_baseline_growth: OK`.

These ran on 43aafa04f; the only change after it is the one-line baseline
prune:

- `python tools/check_delink_dupes.py`: `check_delink_dupes: OK (81
  delinks.txt, no duplicate .text addresses)`, exit 0.
- `python tools/check_match_invariants.py --version eur`: `Found 13999
  issue(s): 0 error(s), 13999 warning(s).` It exits 1, which means
  warnings only. The count is the same as before the batch.
- `python tools/validate_attempts.py`: exit 0, `"rows": 2164`,
  `"errors": 0`. No notes for batch-03 rows.
- `python tools/check_fake_matches.py`: `check_fake_matches: OK`, with
  baseline entries unchanged at 4.
- `python tools/progress.py --version eur`: Natural-C went from 424,482 B to
  435,814 B (17.79% to 18.27%), a gain of 11,332 B. That equals the sum of
  the 74 shipped rows' `text_size`.

## For the Verifier

- **Under-declared callee definitions.** Each of these definitions forwards
  arguments it does not declare. The original passes them, and I declared
  them as called:
  - func_0206be54 and func_0206be44 take a second (request) argument.
  - func_02060c9c takes `(msg, key)`.
  - func_02063710 returns a value.
  - func_02065ee0 and func_02054e8c return values.

  Other prototypes I declared as called are `func_020ace00(int)` (its
  definition has four parameters), `func_02062fc0(…, unsigned short, …)`
  (the definition says `short`, but the original loads with `ldrh`), and
  `func_0206e38c(void *)`.
- **`volatile`.** func_0206dad8 uses a struct with one `volatile short
  flags` member at +0x70. The original re-reads that field on every
  access, including twice in one condition. This is the member-level lever
  in compiler-quirks, not a volatile local; the lint passes.
- **Explicit runtime divide calls.** func_0206a984 (`func_020b3870`,
  remainder in the high word), func_0206b1f8 (`func_020b3a7c`) and
  func_0206d404 (`func_020b3870`, quotient) call these helpers by name, as
  batch 01's func_0203e8b8 already does.
- **Named symbols where the `.s` used base+offset.** func_02060520 uses
  `data_020bed5c` and func_020688fc uses `data_020bee74`; the reference
  check passes.
- **Pointer-to-int casts.** These are at calls whose existing definitions
  take `int`: `func_020604a4` (a variadic stub), `func_0205ffd4`,
  `func_02065934`, `func_0206fc2c`, `func_0206bf60` and
  `func_02092614`.
- **Struct layouts.** Each file declares its own local struct types. The
  offsets agree with the other matched files for the same objects (the
  0x0206xxxx socket and request objects, `data_0219e518` lists and the
  `data_0219ecd4` sorter). The field names are guesses.

## Limitations and blockers

- No tool defect blocked any function. The only change under `tools/` is
  the one-line baseline prune the brief allows.
- Every draft was written by hand. Helper scripts in my scratch space
  automated only fastmatch runs, side-by-side disassembly, ledger/routing
  plumbing and searches over local-declaration orders.
- I stopped at the end of the list (0x0206fb64).
