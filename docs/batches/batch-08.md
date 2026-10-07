# Batch 08: Worker summary

Scope: EUR main functions that are matched only as `.s`, 256 bytes or less,
never attempted, in 0x02000000-0x0200ffff. That was the 58 functions that
`wall_aware_headroom.py --exclude-attempted --max-size 256 --min-addr
0x02000000 --max-addr 0x0200ffff` listed, func_02000cc4 through
func_0200fd1c. I walked all 58 in address order and skipped none.

- 47 now match at 100% in C (6,608 B), one commit each.
- 11 are back on `.s` exactly, with ledger rows for every tier tried.
- No entry was a non-function (no shared epilogue tail without an entry).

## Matched (47 functions, 6,608 B)

All 47 ship in the default tier (`.c`, mwcc 2.0). None needed a non-default
tier, so no tier evidence is required. Each matched in 2.0 after C-level
changes only; I did not compile the 1.2 tiers for these.

| Function | Size | Tier | Shape |
|---|---|---|---|
| func_02000ef8 | 140 | `.c` | state-switch-dispatch |
| func_02000f84 | 68 | `.c` | state-increment-reset |
| func_02001448 | 248 | `.c` | state-machine-switch |
| func_020018d4 | 168 | `.c` | mask-nested-loop-sprintf |
| func_02001a34 | 228 | `.c` | mask-loop-task-post |
| func_02001b18 | 140 | `.c` | mask-loop-sprintf |
| func_02001bc8 | 208 | `.c` | rgb555-blend-table |
| func_020037d0 | 240 | `.c` | switch-dispatch-call |
| func_02003a4c | 116 | `.c` | dispatch-two-way |
| func_02003d98 | 256 | `.c` | switch-dispatch-call |
| func_02003e98 | 132 | `.c` | dispatch-two-way-8arg |
| func_02004ef4 | 100 | `.c` | conditional-tailcall-wrapper |
| func_02005088 | 256 | `.c` | flag-sweep-calls |
| func_02005188 | 68 | `.c` | bitfield-field-call |
| func_020051cc | 68 | `.c` | bitfield-field-call |
| func_02005240 | 88 | `.c` | bitfield-flag-call |
| func_020054f0 | 100 | `.c` | stack-buf-call-return |
| func_02005554 | 96 | `.c` | stack-buf-call-return |
| func_02005b74 | 136 | `.c` | switch-pool-init |
| func_02005ca0 | 108 | `.c` | switch-pool-init |
| func_02005e20 | 192 | `.c` | pool-free-list |
| func_02006264 | 104 | `.c` | distance-check |
| func_02006e28 | 200 | `.c` | text-search |
| func_020091f4 | 88 | `.c` | small-fn |
| func_02009758 | 76 | `.c` | small-fn |
| func_02009a68 | 72 | `.c` | small-fn |
| func_02009e9c | 180 | `.c` | slot-update-loop |
| func_02009f50 | 196 | `.c` | slot-decay-random |
| func_0200a19c | 104 | `.c` | const-table-lookup |
| func_0200a204 | 104 | `.c` | small-fn |
| func_0200a26c | 136 | `.c` | small-fn |
| func_0200a2f4 | 140 | `.c` | ring-lookup |
| func_0200a3b8 | 84 | `.c` | flag-sweep |
| func_0200a40c | 72 | `.c` | flag-scan |
| func_0200a928 | 108 | `.c` | snapshot-compare-copy |
| func_0200b250 | 164 | `.c` | entry-convert-loop |
| func_0200bff4 | 132 | `.c` | slot-claim |
| func_0200c23c | 72 | `.c` | small-fn |
| func_0200c594 | 200 | `.c` | list-scan-trigger |
| func_0200c79c | 136 | `.c` | flag-setter |
| func_0200ed48 | 112 | `.c` | free-slot-find |
| func_0200f044 | 248 | `.c` | bitfield-mode-setter |
| func_0200fa90 | 104 | `.c` | list-lookup |
| func_0200fb18 | 188 | `.c` | list-lookup |
| func_0200fbd4 | 164 | `.c` | list-lookup |
| func_0200fc78 | 164 | `.c` | list-lookup |
| func_0200fd1c | 104 | `.c` | list-lookup |

Levers that mattered (for the Verifier, so they are not read as tricks):

- **Bitfields** give the `lsl`/`lsr` shift pairs and the `bic`/`orr` inserts.
- **Explicit pointer plus counter loops** (`p += n` in the loop header, or
  `e = tbl; for (...; i++, e++)`) fixed register order in func_02009e9c,
  func_02009f50, func_0200a3b8, func_0200a40c, func_0200ed48 and
  func_0200bff4. In func_0200a40c and func_0200ed48 the declaration order of
  the locals also mattered.
- **func_0200a928** writes the inequality as `(a ^ b) != 0`, which is how 2.0
  gets the original's `teq`. The plain `!=` scores 96.3%.
- **func_0200fa90 and func_0200f044** return through a single
  `if (ok) { ...; return x; } return 0;`, so the failure path is a shared
  branch, as in the original. func_0200f044 relies on switch fall-through
  (cases 0, 6, 5).
- **func_02005e20** passes `&p->out[cnt++]` inside the call, which is where
  the original increments.
- **func_02001bc8** keeps both colour arrays in one `int w[2][3]`.
- **func_0200a19c, func_0200a204, func_0200a26c** copy a local table from the
  named data labels `data_020b47ac`, `data_020b485a`, `data_020b4794` and
  `data_020b477c`, which the data bundle defines. Their first commits used
  `data_020b476c + offset`, which matched bytes but not the relocation
  target; one later commit fixed that.

## Attempted, not matched (11 functions, 1,656 B)

Best score per tier, from the ledger. Each tier has its own `parked` row.

| Function | Size | `.c` (2.0) | `.legacy_sp3.c` | `.legacy.c` | Park class | Attempts |
|---|---|---|---|---|---|---|
| func_02000cc4 | 72 | 44.4% | 44.4% | 21.1% | register-choice | 6 |
| func_02000d0c | 64 | 75.0% | 75.0% | 41.2% | load-scheduling-interleave | 5 |
| func_02000d4c | 80 | 20.0% | 0.0% | 0.0% | load-scheduling-interleave | 4 |
| func_020054a4 | 76 | 55.0% | 33.3% | 31.8% | store-coalescing | 6 |
| func_020055b4 | 240 | 1.7% | 1.7% | 1.7% | constant-materialization | 5 |
| func_020059b0 | 176 | 50.0% | 2.1% | 2.0% | reg-alloc | 30 |
| func_02005a60 | 216 | 0.0% | 0.0% | 0.0% | reg-alloc | 3 |
| func_02005dac | 116 | 3.5% | 3.5% | 16.7% | register-choice | 4 |
| func_02006a38 | 216 | 3.7% | 0.0% | 0.0% | pool-constant-caching-resistance | 2 |
| func_02007104 | 160 | 87.5% | 57.5% | 38.1% | reg-alloc | 130 |
| func_0200edb8 | 240 | 90.0% | 25.4% | 13.8% | register-choice | 4 |

Notes:

- func_020055b4 scores 1.7% because one extra register shifts every later
  word. The structure is complete and compiles to the same shape; the
  original keeps a zero in r4 for the whole function and I could not get 2.0
  to hold one.
- func_02000cc4, func_02000d0c and func_02000d4c: the original copies a
  12-byte struct as `ldr, ldr, str, ldr, str, str`. 2.0 emits `ldm`/`stm` for
  a struct copy and one load-store pair per field otherwise; neither matches.
  func_02000d0c is exact apart from that tail.
- func_02005dac: the original starts with a `mov r2, r0` that no source shape
  I tried produced.
- func_02006a38: the original has two pool words for the same symbol
  (`data_02104f1c`), which needs a second symbol alias in `symbols.txt`. That
  is outside this batch's scope.
- func_02007104 (87.5%) and func_020059b0 (50%): only register letters
  differ. I scanned every declaration order (120 and 24 variants).
- func_0200edb8 (90%): only the first three scratch registers differ.

## Checks

Run on 936fe90fd, the last code commit. This summary is the only change after
it.

### The three-region gate

`python tools/gate3.py --scope all --log gate-batch-08.log`, not piped. The
log check from `AGENTS.md`:

```text
55:[eur] SHA1 PASS
25653:[usa] SHA1 PASS
51252:[jpn] SHA1 PASS
51258:check_references: OK
51263:check_fake_matches: OK
51292:1330 passed, 15 skipped, 132 subtests passed in 19.13s
51295:==================== GATE PASS ====================
51296:gate3: GATE EXIT 0
```

- **Reference check:** `check_references: eur, usa, jpn: 32903 units
  compared; missing-reloc 5514, extra-reloc 0, wrong-target 407 (baseline
  entries 5921)`.
- **Fake-match lint:** `register-pin 0, do-while-zero 3, volatile-local 1
  (baseline entries 4)`. These counts are unchanged.

### Other checks

| Command | Exit | Result |
|---|---|---|
| `python tools/check_delink_dupes.py` | 0 | `check_delink_dupes: OK (81 delinks.txt, no duplicate .text addresses)` |
| `python tools/validate_attempts.py` | 0 | `"rows": 2447`, `"errors": 0` |
| `python tools/check_fake_matches.py` | 0 | `check_fake_matches: OK` |
| `python tools/check_match_invariants.py --version eur` | 1 | `Found 13999 issue(s): 0 error(s), 13999 warning(s).` Exit 1 means warnings only. |
| `python -m pytest -q tests` | 0 | `1330 passed, 15 skipped, 132 subtests passed` |
| `python tools/fastmatch.py eur <file>`, when each file was committed | 0 | `100.0% OK (resolved)` |

Natural-C went from 448,234 B to 454,842 B (19.06%), a gain of 6,608 B. That
equals the sum of the 47 matched functions' sizes.

### The reference baseline

`tools/reference_baseline.txt` has 4 lines fewer than `origin/main`
(`--prune-baseline`): the wrong-target lines for func_0200a19c.s,
func_0200a204.s and func_0200a26c.s. No line was added.

## For the Verifier: things to check

### Callee declarations that differ from their definitions

In each case the definition is under-declared (it forwards registers it does
not name, or is an `asm void f(void)` stub) and the original caller passes or
uses them, or only the address is taken.

- **Address-only (callbacks):** func_02005088, func_02005188, func_020051cc,
  func_02005240, func_020054f0, func_02005554 and func_02005b74 declare
  `func_02003c68`, `func_02003ac0`, `func_02003f1c`, `func_02003e98`,
  `func_02003400`, `func_02003b14`, `func_0208fdf0` and `func_0208fe58` as
  `void (void)`. Some of their definitions take arguments.
- **func_02004ef4** is defined with seven ints. Its callers declare the last
  as `void *fn` (a function address), and func_02005188, func_02005240,
  func_020051cc, func_020054f0 and func_02005554 type the first as a pointer.
- **asm stubs declared with arguments:** `Copy32`, `Fill32`, `func_0209448c`,
  `func_020944a4` and `func_02094550` are `asm` stubs; the callers use r0-r2.
- **Different return or parameter types:**
  - func_02006e28 declares `func_02006b4c` as returning `char *` with an
    `int` second argument (defined `int f(void *, void *, signed char *)`),
    `func_0207d3ac` as returning `unsigned int` (defined `void`), and
    `func_02038ad4` and `func_02097ff0` as `void` (defined `int`).
  - func_02001a34 declares `Task_PostLocked` as returning `void *` (defined
    `int`) and `Task_InvokeLocked(int)` (defined with `void *p`).
  - func_02005ca0 declares `func_02005d0c` as `void` (defined `int`).
  - func_02009f50 passes an `int` to `func_020a9950` (defined `void *`).
  - func_02001448 declares `func_02018b94` as returning a struct pointer
    (defined `char *`).

### Casts and odd spellings

- func_0200bff4 uses `char *` and `*(int *)(p + off)` because the original
  steps a pointer by 0x24 and reads at +0xdc.
- func_02009e9c, func_02009f50 and func_0200a928 index `data_02104f4c` as a
  byte array with large constant offsets, because a struct member at that
  offset moves the pool word to `data_02104f4c+0x156c`.
- func_0200fd1c keeps a redundant `if (s != 0)` test after `if (s == 0)`; the
  original has it.

## Limitations and blockers

- **Not matched:** 11 functions (above); no tool defect blocked any function.
- **func_02006a38** needs a second alias of `data_02104f1c` in `symbols.txt`,
  which is outside this batch's scope.
- **No file under `tools/` changed** except the four pruned baseline lines.
- **USA and JPN are untouched by design.** Their SHA1 PASS shows only that
  nothing broke.
- **Every draft is hand-written.** Scratch helpers outside the repo compiled
  drafts, ran `fastmatch.py`, `park_one.py` and `record_shipped.py`, and
  committed each match.
- **Ledger:** I edited two of my own unmerged rows (the func_02000cc4
  percentages and the func_02009e9c attempt count) before the final commit;
  no row from before this batch was touched.
