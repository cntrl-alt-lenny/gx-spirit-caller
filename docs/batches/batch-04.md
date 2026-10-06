# Batch 04: Worker summary

Scope: EUR main, `.s`-only functions of 256 bytes or less, never attempted,
in 0x02040000-0x0204ffff. `wall_aware_headroom.py` listed 49 candidates,
func_02040258 through func_0204fc38. I attempted all 49, in address order:
45 now match at 100% and 4 are parked. No function in the walked range was
left unattempted, and I stopped at the end of the range (func_0204fc38).
After the batch, the same headroom command reports
`TOTAL candidate EUR .s remaining: 0`.

Each match is its own commit, recorded with `record_shipped.py` under the
tier it ships in. Every tier I tried that did not match has its own
`parked` row from `park_one.py` (51 rows), including tier probes on
functions that later matched under another tier. The four parks are back
on their `.s` files and `delinks.txt` routing, unchanged from `main`.

## Matched (45 functions, 5,604 B)

10 ship as `.c` (mwcc 2.0) and 35 as `.legacy_sp3.c` (mwcc 1.2/sp3). For
every sp3 file I also compiled the same function under 2.0; the 2.0 score
and what differs are in the "2.0 result" column, and each has a `default`
ledger row. None ships as `.legacy.c`.

| Function | Size | Tier | 2.0 result (evidence for the tier) |
|---|---|---|---|
| func_02040258 | 148 | sp3 | 59.5%: 2.0 folds the pool literal 0x1008 into `add #8; add #0x1000`. sp2p3 60.5% (`pop {lr}; bx lr` epilogue) |
| func_020402ec | 80 | sp3 | 50.0%: 0x13d8 pool literal folded. sp2p3 18.2% (epilogue) |
| func_02040cc0 | 148 | sp3 | 2.7%: 2.0 pushes `r3` where the original has 9 registers and `sub sp, #4`. sp2p3 23.1% (epilogue) |
| func_02040d94 | 84 | `.c` | matches; sp3 81.0% and sp2p3 26.1% on the first draft |
| func_020413b0 | 192 | sp3 | 6.2%: `push {r3, ...}` vs `sub sp, #4` |
| func_020414b0 | 112 | sp3 | 0.0%: same frame difference |
| func_02040de8 | 84 | sp3 | 50.0%: 2.0 branches to the found-return, the original predicates it (`addeq/ldreq/popeq`) |
| func_0204152c | 156 | sp3 | 0.0%: frame difference |
| func_02041dbc | 92 | sp3 | 56.5%: 0x1134 pool literal folded |
| func_02041ea0 | 100 | sp3 | 68.0%: 0x1bf4 and 0x1b34 pool literals folded |
| func_02042190 | 72 | sp3 | 27.8%: 0x11dc pool literal folded |
| func_02043168 | 140 | sp3 | 42.9%: `push {r3, lr}; sub sp, #8` vs `push {lr}; sub sp, #0xc` |
| func_0204320c | 68 | sp3 | 41.2%: 0x11dc pool literal folded |
| func_02044254 | 124 | sp3 | 58.1%: frame difference |
| func_02044424 | 140 | sp3 | 31.4%: frame difference |
| func_02044610 | 224 | sp3 | 19.6%: 2.0 makes 0x7ff as `sub r0, r1, #2048` and drops the `and #-1`; the original loads it from the pool |
| func_02044c60 | 88 | sp3 | 45.5%: `push r3` + `sub #0x14` vs `sub #0x18` |
| func_02044e58 | 80 | `.c` | matches |
| func_02044ea8 | 68 | sp3 | 64.7%: same as func_02044c60 |
| func_0204559c | 124 | sp3 | 0.0%: `push {r3, lr}` vs `push {lr}; sub sp, #4` |
| func_02045618 | 96 | `.c` | matches |
| func_02045678 | 204 | sp3 | 0.0%: frame difference |
| func_02045744 | 148 | sp3 | 0.0%: frame difference |
| func_020457d8 | 80 | sp3 | 0.0%: frame difference |
| func_02045954 | 96 | `.c` | matches |
| func_02045c34 | 72 | sp3 | 0.0%: frame difference |
| func_02046498 | 164 | sp3 | 87.8%: 2.0 derives the negative codes as `sub r2, r0, #n` from the other register; the original uses `mvn` |
| func_02046770 | 116 | sp3 | 0.0%: frame difference |
| func_02046fc4 | 168 | `.c` | matches |
| func_02048bc0 | 104 | sp3 | 0.0%: frame difference |
| func_02048fac | 140 | sp3 | 17.1%: 2.0 predicates the `&&` guard, the original branches |
| func_02049038 | 164 | sp3 | 31.8%: 2.0 branches the three default-argument blocks, the original predicates them |
| func_02049120 | 108 | sp3 | 14.8%: 2.0 predicates the guard, the original branches |
| func_020491ec | 132 | `.c` | matches |
| func_020492d0 | 76 | sp3 | 68.4%: frame difference |
| func_02049554 | 224 | `.c` | matches |
| func_02049684 | 140 | sp3 | 77.1%: `push r3` + `sub #0x100` vs `sub #0x104` |
| func_0204a8bc | 164 | sp3 | 87.8%: as func_02046498 |
| func_0204aa0c | 232 | sp3 | 69.0%: as func_02046498 |
| func_0204aaf4 | 148 | sp3 | 83.8%: as func_02046498 |
| func_0204b034 | 116 | sp3 | 13.8%: 2.0 predicates the second guard |
| func_0204b370 | 96 | sp3 | 0.0%: frame difference |
| func_0204f040 | 104 | `.c` | matches |
| func_0204f9cc | 88 | sp3 | 13.6%: 2.0 emits `tst r0, r4, lsl r6`; the original has `lsl` then `ands` |
| func_0204fc38 | 100 | `.c` | matches |

"Frame difference" means the original pushes an odd number of registers and
then does `sub sp, sp, #4` (or a larger `sub` with the pad folded in), while
2.0 pushes an extra `r3` instead; the epilogue is the one-step `pop {..., pc}`.
`docs/compiler-quirks.md` lists that as 1.2/sp3 only.

## Attempted, not matched (4, parked)

| Function | Size | Best per tier | Park class | What is left |
|---|---|---|---|---|
| func_020432d0 | 256 | 2.0 92.2%, sp3 92.2% | P-20-family | registers only, in the first five instructions: the original loads `data_0219d9f0` into `r1` and `data_0219d9fc` into `r0`; mine swaps them. Nine source variants (declaration order, a local copy, struct and cast forms) all give the same code. |
| func_02043a78 | 192 | 2.0 85.4%, sp3 89.6% | P-36-ldm-fusion | the original copies the 64-bit field at +8 into a local with two `ldr` and two `str`; both compilers emit `ldm`/`stm`. Assembling it from two 32-bit halves leaves an `orr #0` (6.0%); a type-punned copy scores 87.5%. Under 2.0 there is also the mask-to-shift-pair peephole. |
| func_02046694 | 96 | 2.0 16.7%, sp3 33.3% | P-20-family (sp3), frame-shape (2.0) | the original keeps the loop index in `r0` and the count in `r1`; mine does the reverse. Six variants tried (for/while, declaration order, pointer walk, inverted test). |
| func_02049270 | 96 | 2.0 29.2%; sp3 code 100% but cannot link | tool-anomaly (match_pct `n/a`) | see below |

**func_02049270 is blocked by a data symbol, not by the code.** Under sp3
the C compiles to the original's bytes (fastmatch 100.0%, resolved), and
it was committed as a match. The original relocation at `.text+0x58`
names `data_020ff928`. That name is in `symbols.txt` but no object
defines it: the address lies inside the 64-byte `data_020ff920` bundle in
`src/main/data/data_020ff920.c`. The first gate run failed the EUR link
with `Undefined : "data_020ff928"`, `Referenced from "func_02049270"`.
Spelling it `data_020ff920 + 8`, as the `.s` does, links but adds a
`wrong-target` reference finding for a new unit name, which the baseline
cannot gain. Defining the label means changing the data bundle, outside
this batch's files. So I reverted it to its `.s` and routing (commit
`ce0dca47c`). Its ledger rows are `default` parked 29.2, `legacy_sp3`
shipped 100 (commit `10af44190`), then `legacy_sp3` parked `n/a` `tool-anomaly`.
I recorded the last one as `n/a` because a parked row at 100 fails
`validate_attempts.py`. **For Brain:** it ships as soon as `data_020ff928`
is a real label (split it out of the `data_020ff920` bundle); the C is
in that shipped commit.

## Constructs to check

- **func_02048fac's 0x210-byte local.** The original frame is 0x210 bytes
  and the buffer passed on is at `sp+0x108`. I declare a local struct of two
  0x108-byte arrays and use the second. func_020491ec (matched in this
  batch) uses the same 0x210-byte shape, with its first part written by
  `func_020557b8` and the text at +0x108, so the type is real. In
  func_02048fac only the second half is touched, because `func_020498c4`
  passes zero for the first output.
- **Uninitialised locals.** func_02046498, func_0204a8bc, func_0204aa0c and
  func_0204aaf4 switch on an error code and leave `kind`/`sub` unset for
  codes with no case. The original does the same: on that path it calls on
  with whatever the registers hold.
- **func_02045678 returns `data_0219dad0->field_4`** on the `== 1` path.
  The original returns the loaded value (`r0` from the `ldrh`), not a fresh
  constant.
- **A 64-bit field at +0x0c.** func_02049554's state struct has an
  `unsigned long long` at +0x0c (mwcc aligns it to 4); that is what makes
  the two zero stores share one base load, as in the original. With two
  `int` fields there it scored 41.4%.
- **Prototypes that follow existing definitions.** func_02050054 is defined
  as `(void *, void *)`, so func_0204a8bc, func_0204aa0c and func_0204aaf4
  cast the error kind and code to `void *`. func_02043bdc and
  func_02043c28 are called with their defined `(void *...)` and
  `(int, int, int)` signatures from func_02044424, with casts.
  func_02044228 is defined with one parameter; func_02044254 passes one.
- **Struct layouts** are local to each file, as before. The
  `data_0219dad0` struct copies `struct S0219dad0` from
  `src/main/func_02045828.legacy_sp3.c` and names two of its padding
  fields (`field_0`, `field_6`); the offsets are unchanged.

## Checks

All run on `ce0dca47c`, the last code commit; this summary is the only
change after it.

- `python tools/gate3.py --scope all --log <scratch>/gate2.log` (not
  piped), then the PowerShell log check from `AGENTS.md`:

  ```text
  13449:[eur] SHA1 PASS
  13491:[usa] SHA1 PASS
  13533:[jpn] SHA1 PASS
  13573:1330 passed, 15 skipped, 132 subtests passed in 19.01s
  13576:==================== GATE PASS ====================
  13577:gate3: GATE EXIT 0
  ```

  No region `SKIP` line. Inside the gate:
  `check_references: ... wrong-target 412 (baseline entries 5926)`,
  `check_references: OK`; `check_fake_matches: ... do-while-zero 3,
  volatile-local 1 (baseline entries 4)`, `check_fake_matches: OK`.
- The first gate run, on `8fecfbc57`, ended `gate3: GATE EXIT 2`
  (`[eur] INFRASTRUCTURE ERROR`; USA and JPN `SHA1 PASS`): the EUR link
  failed on `data_020ff928` (see func_02049270 above). Reverting that one
  function fixed it.
- No baseline change. The stale-line prune was not needed: the only
  baseline line for a file this batch touched belongs to
  `src/main/func_02049270.s`, which is back.
- `python tools/check_delink_dupes.py`:
  `check_delink_dupes: OK (81 delinks.txt, no duplicate .text addresses)`,
  exit 0.
- `python tools/check_match_invariants.py --version eur`:
  `Found 13999 issue(s): 0 error(s), 13999 warning(s).`, exit 1
  (warnings only; the same count as after batch 02).
- `python tools/validate_attempts.py`: exit 0, `"rows": 2084`,
  `"errors": 0`. This batch adds 97 rows: 45 `shipped` for the matches,
  1 `shipped` for func_02049270 that was later reverted, and 51 `parked`.
- `python tools/progress.py --version eur`: Natural-C went from
  424,482 B to 430,086 B (17.79% to 18.03%), a gain of 5,604 B. That
  equals the sum of the 45 matched functions' sizes.
- `python tools/fastmatch.py eur <file>` showed `100.0%  OK (resolved)`
  for each matched file when it was committed.
- `wall_aware_headroom.py --exclude-attempted --max-size 256 --min-addr
  0x02040000 --max-addr 0x0204ffff`:
  `TOTAL candidate EUR .s remaining: 0`.

## Limitations and blockers

- No tool defect blocked any function. Every draft was written by hand;
  helper scripts in my scratch space only ran fastmatch, a side-by-side
  disassembly and the park/ship sequence.
- Two ledger rows record a first draft's failure under a tier that the
  final source also matches: func_02049554 (`legacy_sp3`, 41.4%) and
  func_0204fc38 (`legacy_sp3`, 0.0%). Both failures came from the source
  shape (all-`int` fields; pointer arithmetic instead of array indexing),
  not from the compiler. Both ship as `.c`.
