# Batch 05: Worker summary

Scope: EUR main functions that are matched only as `.s`, 256 bytes or less,
never attempted, in 0x02050000-0x0205ffff. That was the 50 functions that
`wall_aware_headroom.py --exclude-attempted --max-size 256 --min-addr
0x02050000 --max-addr 0x0205ffff` listed, func_02050140 through
func_0205fd94.

I attempted all 50, in address order:

- 48 now match at 100% in C, one commit each.
- 2 are back on `.s` exactly, with ledger rows: func_02056c34 and
  func_0205c258.

I walked the whole list and stopped after the last function, func_0205fd94
(0x0205fd94). I skipped none.

## Matched (48 functions, 6,816 B)

The last column lists every other tier I compiled that did not match. Each
has its own `parked` ledger row with that score and class.

| Function | Size | Tier | Other tiers tried (ledger rows) |
|---|---|---|---|
| func_02050140 | 140 | `.legacy_sp3.c` | .c 0.0% (push-vs-subsp-alignment-padding); .legacy.c 94.4% (epilogue-shape) |
| func_02052098 | 200 | `.legacy_sp3.c` | .c 60.0% (push-vs-subsp-alignment-padding); .legacy.c 32.7% (epilogue-shape) |
| func_02052398 | 140 | `.legacy_sp3.c` | .c 65.7% (address-fold) |
| func_02052870 | 116 | `.legacy_sp3.c` | .c 44.8% (push-vs-subsp-alignment-padding); .legacy.c 93.3% (epilogue-shape) |
| func_02052974 | 116 | `.legacy_sp3.c` | .c 44.8% (push-vs-subsp-alignment-padding); .legacy.c 93.3% (epilogue-shape) |
| func_02053114 | 68 | `.c` | .legacy.c 72.2% (epilogue-shape); .legacy_sp3.c 94.1% (P-20-cmp-operand-r0-r1-swap) |
| func_0205340c | 124 | `.legacy_sp3.c` | .c 0.0% (push-vs-subsp-alignment-padding); .legacy.c 81.2% (epilogue-shape) |
| func_020534d4 | 112 | `.legacy_sp3.c` | .c 60.7% (constant-zero-register-materialization-not-reproduced); .legacy.c 33.3% (epilogue-shape) |
| func_020538b0 | 188 | `.legacy_sp3.c` | .c 61.7% (instr-selection); .legacy.c 11.5% (epilogue-shape) |
| func_02053a64 | 80 | `.legacy_sp3.c` | .c 80.0% (push-vs-subsp-alignment-padding); .legacy.c 57.1% (epilogue-shape) |
| func_02053ab4 | 132 | `.legacy_sp3.c` | .c 6.1% (push-vs-subsp-alignment-padding) |
| func_02053b38 | 108 | `.legacy_sp3.c` | .c 0.0% (push-vs-subsp-alignment-padding) |
| func_02053ba4 | 88 | `.legacy_sp3.c` | .c 68.2% (P-20-family) |
| func_02053c34 | 116 | `.c` | none |
| func_02053ca8 | 104 | `.legacy_sp3.c` | .c 0.0% (push-vs-subsp-alignment-padding) |
| func_020542b8 | 92 | `.legacy_sp3.c` | .c 21.7% (load-fusion) |
| func_02054338 | 128 | `.legacy_sp3.c` | .c 0.0% (push-vs-subsp-alignment-padding) |
| func_020543b8 | 116 | `.legacy_sp3.c` | .c 0.0% (push-vs-subsp-alignment-padding) |
| func_02054dfc | 88 | `.legacy_sp3.c` | .c 37.5% (P-36-store-postindex-fusion) |
| func_02054ec0 | 132 | `.legacy_sp3.c` | .c 81.8% (P-31-if-conversion) |
| func_02054f44 | 140 | `.legacy_sp3.c` | .c 45.7% (reg-alloc) |
| func_02055030 | 248 | `.legacy_sp3.c` | .c 95.2% (ANDS-vs-TST-instruction-choice) |
| func_02055128 | 72 | `.legacy_sp3.c` | .c 55.6% (stack-slot-assignment-mismatch) |
| func_02055170 | 72 | `.legacy_sp3.c` | .c 77.8% (stack-slot-assignment-mismatch) |
| func_020551b8 | 76 | `.legacy_sp3.c` | .c 5.3% (push-vs-subsp-alignment-padding) |
| func_02055204 | 76 | `.legacy_sp3.c` | .c 5.3% (push-vs-subsp-alignment-padding) |
| func_0205538c | 148 | `.legacy_sp3.c` | .c 2.7% (push-vs-subsp-alignment-padding) |
| func_02055c70 | 232 | `.legacy_sp3.c` | .c 5.2% (push-vs-subsp-alignment-padding) |
| func_02055d58 | 208 | `.legacy_sp3.c` | .c 1.9% (push-vs-subsp-alignment-padding) |
| func_02056a58 | 224 | `.legacy_sp3.c` | .c 1.8% (push-vs-subsp-alignment-padding) |
| func_02056b38 | 252 | `.legacy_sp3.c` | .c 17.5% (push-vs-subsp-alignment-padding) |
| func_02057f3c | 252 | `.legacy_sp3.c` | .c 25.4% (P-20-family) |
| func_020581a8 | 156 | `.legacy_sp3.c` | .c 20.5% (ldm-fusion-residual) |
| func_02058244 | 240 | `.legacy_sp3.c` | .c 8.3% (P-20-family) |
| func_02058528 | 172 | `.legacy_sp3.c` | .c 37.2% (frame-shape) |
| func_0205888c | 200 | `.legacy_sp3.c` | .c 76.0% (P-31-if-conversion) |
| func_02059d1c | 116 | `.legacy_sp3.c` | .c 0.0% (push-vs-subsp-alignment-padding) |
| func_0205aecc | 196 | `.c` | none |
| func_0205bd58 | 96 | `.legacy_sp3.c` | .c 0.0% (push-vs-subsp-alignment-padding) |
| func_0205c6e4 | 100 | `.legacy_sp3.c` | .c 59.3% (push-vs-subsp-alignment-padding) |
| func_0205ce40 | 208 | `.legacy_sp3.c` | .c 11.3% (register-set-mismatch) |
| func_0205d560 | 64 | `.c` | none |
| func_0205d5c8 | 76 | `.c` | none |
| func_0205d6f8 | 236 | `.legacy_sp3.c` | .c 3.4% (reg-alloc) |
| func_0205d944 | 92 | `.legacy_sp3.c` | .c 13.0% (push-vs-subsp-alignment-padding) |
| func_0205fa30 | 148 | `.legacy_sp3.c` | .c 16.2% (push-vs-subsp-alignment-padding) |
| func_0205fac4 | 196 | `.legacy_sp3.c` | .c 0.0% (push-vs-subsp-alignment-padding) |
| func_0205fd94 | 132 | `.legacy_sp3.c` | .c 57.6% (push-vs-subsp-alignment-padding) |

### Tier evidence

5 functions ship as `.c` and 43 as `.legacy_sp3.c`. For every
`.legacy_sp3.c` function I compiled the same final draft under 2.0, and it
does not match:

- **Most of them (the `push-vs-subsp-alignment-padding` rows):** the
  original pushes an odd number of registers and pads with `sub sp, sp, #4`
  (or a larger `sub sp`), then returns with a one-step `pop {..., pc}`. 2.0
  instead pushes an extra `r3` and shrinks its `sub sp`. That is the 1.2/sp3
  frame described in `docs/compiler-quirks.md`.
- **Same frame, but 2.0 still differs.** The ledger class for each is in
  brackets.
  - func_02052398 (`address-fold`): 2.0 folds an `add` into the `strb`
    addressing.
  - func_020534d4: 2.0 does not put zero in a register for the 64-bit
    compare.
  - func_020538b0 (`instr-selection`): 2.0 uses `ldrb` and drops a mask, so
    its output is one instruction shorter.
  - func_020542b8 (`load-fusion`): 2.0 forwards values it has just stored,
    where the original loads them again.
  - func_02054dfc: in the struct copy, 2.0 does not use post-increment
    `ldrb`/`strb`.
  - func_02054ec0 (`P-31-if-conversion`): 2.0 turns the final compare
    chain into predicated instructions.
  - func_02055030 (`ANDS-vs-TST-instruction-choice`): 2.0 emits `tst` where
    the original has `ands`.
  - func_020581a8 (`ldm-fusion-residual`): 2.0 merges two loads into an
    `ldm`.
  - func_0205888c (`P-31-if-conversion`): 2.0 predicates a guard where the
    original branches.
  - func_02053ba4, func_02054f44, func_02057f3c, func_02058244,
    func_0205ce40 and func_0205d6f8 (`P-20-family`, `reg-alloc` or
    `register-set-mismatch`): 2.0 allocates registers differently, and the
    sp3 compile is exact.
- **1.2/sp2p3 (the `.legacy.c` rows):** I tried it for 10 functions. Every
  time it failed, it emitted the two-step `pop {..., lr}; bx lr` epilogue,
  which the originals do not have.
- **Two functions also match under 1.2/sp2p3:**
  - func_02052398 is a leaf with no epilogue to tell the 1.2 tiers apart.
  - func_02058528 spills its arguments and has the
    `ldmia {..., lr}; add sp; bx lr` epilogue, which both 1.2 tiers produce.

  Both ship as `.legacy_sp3.c`, like their neighbours.
- **func_02053114** has a `.legacy_sp3.c` row at 94.1%. That score comes
  from an earlier draft whose compare-operand order was wrong. The fixed draft
  matches under `.c`, which is what ships.

## Attempted, not matched (2)

| Function | Size | Best per tier | Park class |
|---|---|---|---|
| func_02056c34 | 232 | `.c` 70.7%, `.legacy_sp3.c` 22.4%, `.legacy.c` 3.3% | frame-shape; new-repeated-addr-cse-vs-target-recompute; epilogue-shape |
| func_0205c258 | 232 | `.c`: bytes 100%, but the reference check fails, so `unknown` | tool-anomaly |

### func_02056c34

Under 2.0 the body matches, and only the stack frame differs:

- **2.0:** builds the 0xdb4-byte frame with two `sub` immediates.
- **The original:** uses `ldr ip, =0xdb4; sub sp, sp, ip`.
- **The 1.2 tiers:** produce the original's frame, but keep `s + 0x1f4` in a
  register. The original recomputes `add r1, r4, #0x1f4` before each of its
  nine calls.

I tried four spellings: array member, struct member, re-reading `*pp` and a
late load. None stopped the 1.2 tiers from caching the address.

### func_0205c258

The C matches byte for byte under 2.0, but it cannot ship within this
batch's scope:

- **The cause:** the original's pool word relocates against `data_02100b74`.
  That symbol is in `symbols.txt`, but no source defines it. Its four bytes
  are part of the `unsigned int data_02100b70[5]` bundle in
  `src/main/data/data_02100b70.c`, which is outside this batch's scope.
- **Naming `data_02100b74`:** the EUR link fails with
  `Undefined : "data_02100b74"`.
- **Writing `data_02100b70 + 4`:** the ROM links byte-identical, but the
  reference check fails, and keeping it would need a new baseline line.

So it is back on `.s` exactly. Matching it needs `data_02100b74` defined as
its own symbol in the data carve.

What happened in the ledger:

1. It was first committed as shipped (bb1903e91), so its ledger has a
   `shipped` row.
2. The gate then failed on it, and it was parked in d7ad52a2f, which
   appended a `parked` row with the raw class
   `data-symbol-absorbed-into-bundle`.
3. That class has no row in `tools/park_class_map.tsv`, so three
   `test_normalise_park_class.py` tests failed.
4. In cc7e9f613 I edited that one unmerged row to the mapped class
   `tool-anomaly`.

No row from before this batch was touched.

## Checks

Run on cc7e9f613, the last code commit. This summary is the only change after
it.

### The three-region gate

`python tools/gate3.py --scope all --log <scratchpad>/gate-batch05-4.log`,
not piped. The PowerShell log check from `AGENTS.md`:

```text
55:[eur] SHA1 PASS
97:[usa] SHA1 PASS
139:[jpn] SHA1 PASS
179:1330 passed, 15 skipped, 132 subtests passed in 19.41s
182:==================== GATE PASS ====================
183:gate3: GATE EXIT 0
```

The two checks the gate runs itself:

- **Reference check:** `check_references: eur, usa, jpn: 32903 units
  compared; missing-reloc 5514, extra-reloc 0, wrong-target 412 (baseline
  entries 5926)`, then `check_references: OK`.
- **Fake-match lint:** `check_fake_matches: ... register-pin 0,
  do-while-zero 3, volatile-local 1 (baseline entries 4)`, then
  `check_fake_matches: OK`.

### Other checks

| Command | Exit | Result |
|---|---|---|
| `python tools/check_delink_dupes.py` | 0 | `check_delink_dupes: OK (81 delinks.txt, no duplicate .text addresses)` |
| `python tools/check_match_invariants.py --version eur` | 1 | `Found 13999 issue(s): 0 error(s), 13999 warning(s).` Exit 1 means warnings only. |
| `python tools/validate_attempts.py` | 0 | `"rows": 2093`, `"errors": 0` |
| `python tools/progress.py --version eur` | 0 | `Natural-C: 431298 / 2385948 bytes (18.08%)` |
| `python tools/fastmatch.py eur <file>`, for each shipped file when it was committed | 0 | `100.0% OK (resolved)` |

Natural-C went from 424,482 B before the batch to 431,298 B, a gain of
6,816 B. That equals the sum of the 48 shipped functions' sizes.

### The reference baseline

`tools/reference_baseline.txt` is identical to `origin/main`:

1. In 9e1aa819b I pruned one stale line, for `func_0205c258.s`.
2. In 734cb6c1a I reverted that prune, because the function went back to
   `.s`.

### Earlier gate runs

| Commit | Exit | Why |
|---|---|---|
| 44900e2c7 | 1 | All three SHA1 checks and pytest passed; the reference check failed on func_0205c258. |
| 9e1aa819b | 2 | The EUR link failed: `data_02100b74` is undefined. |
| 734cb6c1a | 1 | pytest failed on the unmapped park class. |
| cc7e9f613 | 0 | Passed (above). |

## For the Verifier: things to check

### Callee declarations that differ from their matched definitions

In every case the definition is under-declared: it forwards or returns
registers it does not name, and the original caller passes or uses them.

- `func_02052b0c` is defined `void`. func_02052974 declares it as returning
  `int` and tests the result. It tail-calls func_020529e8.
- `func_0206eea0` is defined `void`. func_02054dfc uses its result. It
  tail-calls func_0206c9b0.
- `func_02054c64` is defined `(void)`. func_020551b8 and func_02055204
  pass it five arguments. It is a stub that ignores them.
- `func_020453b4` is defined with four parameters. func_02056a58 and
  func_0205888c call it with one, as two existing callers already declare.
- `func_0205d674` is defined with one parameter. func_02056a58 and
  func_0205888c pass two, because the original loads r1 explicitly.
- `func_02058038` is defined with two parameters. func_0205aecc passes
  three, as existing callers already declare.
- `func_02054cf8`, `func_02054bfc` and `func_020aac84`: func_02057f3c and
  func_0205fd94 pass arguments or use results that the `(void)` or `void`
  definitions do not declare.
- `func_02054840` is `asm void (void)`. func_0205d944 passes it five
  arguments.

### Casts

- **Pointer/int casts** follow existing definitions with `int` parameters:
  `func_020a66e8`, `func_020a6754`, `func_0205ffc0`, `func_02058070`,
  `func_02054568` and `func_0205fe18`.
- **Function-pointer casts:** func_0205d560 casts `func_0205d5a0`, and
  func_0205d5c8 casts `func_0205d614`, because their callback types differ.

### C that looks redundant but mirrors the original

- **func_02056b38** ends with `if (r == 0) return 0; return r;`. This
  reproduces the original's `cmp r0, #0; moveq r0, #0`.
- **func_0205fd94** returns the zero result itself (`n = ...; if (n == 0)
  return n;`). The original has no `mov r0, #0` on that path.
- **func_0205d6f8** zero-initialises a local struct with `= {0}` and then
  stores zero to five of its fields again. The original has both sets of
  stores.

### Struct by value

func_02058528 takes a two-word struct in r1/r2 and copies it with a single
struct assignment. That is what gives the original's argument spill and
reload.

### Struct layouts

Each file declares its own local types. Where a matched definition already
has the type, my copy agrees with it:

- `Self02054568`, `cb_table_0205d5a0_t`, `Arg1_0205d614` and
  `Arg2_0205d614` are copied verbatim.
- `struct node_0205c748` and `struct node` are used as incomplete tags.

The field names are guesses.

## Limitations and blockers

- **Blocked by things outside this batch's scope:**
  - The data carve does not define `data_02100b74`, which blocks
    func_0205c258.
  - `tools/park_class_map.tsv` has no class for "symbol absorbed into a
    data bundle". Brain may want one for that row.
- **No tool defect blocked any function.**
- **No file under `tools/` changed in the net diff.**
- **Every draft is hand-written.** Two scratch helpers did the mechanical
  work:
  - One compiled drafts with each tier's `mwccarm` and compared them using
    fastmatch's own resolver.
  - One ran `park_one.py`, `configure.py`, `fastmatch.py` and
    `record_shipped.py` for each function.
- **USA and JPN are untouched by design.** Their SHA1 PASS shows only that
  nothing broke.
