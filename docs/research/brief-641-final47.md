[//]: # (markdownlint-disable MD013)

# Brief 641 - convert the remaining known-tractable frontier (47 functions)

Branch: `claude/cmatch-final47-641`

Scope: `python3.13 tools/wall_aware_headroom.py --json`'s reported convertible
pool at brief start — main 43, overlay004 3, overlay011 1 = **47 total**.
Per the brief's own warning, that list is an upper bound (the tool can't
detect free-form prose walls with no taxonomy citation) — every candidate
was header-read before compiling.

## Outcome

**3/47 converted to byte-verified C-match.** 3 more were mis-classified as
"convertible" and reclassified (2 pure data / already-exhaustively-documented
walls, flagged below for brief 640). The remaining 41 (15 individually
attempted and parked, 26 skipped at header-read as prose walls) are genuine
near-miss/wall candidates — several attempts landed within one instruction of
matching and are documented in detail below as reusable signal.

| Category | Count |
|---|---:|
| Converted (EUR objdiff 100%) | 3 |
| Mis-classified — not real candidates (see "Signal for brief 640") | 3 |
| Attempted, hit a genuine wall (parked, reverted cleanly) | 15 |
| Skipped as prose walls at header-read (not individually re-verified) | 26 |
| **Total** | **47** |

`gate3.py --scope all --no-tests`: **3-region sha1 PASS** (EUR/USA/JPN). The
pytest step was skipped — see "Known pre-existing pytest failure" below;
not caused by this brief's changes.

## Converted (3)

### `func_0203d6c4` (main) — 2-bit shift-pair field extract

`ldrb; lsl #0x1e; lsr #0x1e; cmp #1; moveq/movne` — masks a 2-bit field via
a shift-up/shift-down pair rather than a plain AND. mwcc canonicalizes any
mathematically-equivalent C mask expression (`&3`, or explicit matching
shifts) back to a single `and` — the only way to reproduce the shift-pair is
a real C bitfield (`unsigned char field : 2` inside a padded struct). Same
lever as brief 579 Family 6. **100%, 9/9 bytes.**

### `func_0208b190` (main) — Thumb 9-field struct initializer

Matrix-style struct init from 2 scalar args (offsets 0x0-0x20). Natural C
with fields written in original instruction order matched **on the first
try** — no lever needed beyond the established main-Thumb recipe: plain
`.c` file (NOT `.thumb.c` — that suffix is scoped to the overlay004 cohort
per `configure.py`'s `is_thumb_c()` docstring), wrapped in `#pragma thumb on`
/ `#pragma thumb reset`, compiled through the default mwcc 2.0/sp1p5 binary.
**100%, 28/28 bytes.**

### `func_0201aaf4` (main) — asm void, documented-precedent match

Clears bit `(arg-0x75)` in byte 0 of `GetSystemWork()->field_0x900` via a
shift-pair byte extraction. The **adjacent file** `func_020186b0.c` already
documents this exact shape as a wall (mwcc canonicalizes shift-pair
extraction to a shorter AND-based form) with the sanctioned fix being
`asm void {}`. Applied the same fix directly rather than re-discovering the
wall. **100%, 56/56 bytes.**

## Signal for brief 640 (mis-classified candidates)

Three reported "convertible" files are not real C-match targets:

- **`data_020b52d4`** (main) — 2+2 bytes of pure zero `.rodata`, not code.
  The `.s` header is a complete worked example from briefs 119/121
  demonstrating dsd's symbol-size-deduction clustering rules, not an
  unattempted function. `wall_aware_headroom.py`'s wall-regex doesn't
  recognize data symbols as a distinct class from code — same blind spot
  as brief 578's `func_020b2d2c`/`func_020b3c78` (byte-blob data that
  doesn't round-trip through disassembly as real C).
- **`func_ov004_021dbdbc`** (overlay004) — an 8-byte Thumb→ARM interwork
  veneer. Header cites brief 191's exhaustive investigation: a `.c`
  reproduction is provably worse (159K bytes / 19,693 runs, +5-byte
  `.rodata` shift exceeding the brief 180 patcher cap) because mwcc
  defaults to ARM-mode codegen for `.c` in this project, and an 8-byte
  Thumb veneer has no natural-C equivalent shape.
- **`func_ov011_021d2c64`** (overlay011) — a cross-overlay hardcoded `.word`
  branch dsd can't attribute to one overlay. Header cites brief 192;
  `docs/queue/claude-scaffolder.md`'s cm-smalls entry confirms it was
  independently re-tried and confirmed **not** portable to `asm void`
  either (raw `.word` encoding directives are rejected by mwcc's inline
  assembler, unlike the labeled-pool-literal case that has an
  `ldr rX,=symbol` workaround).

All three should be excluded from `wall_aware_headroom.py`'s convertible
count — recommend brief 640 add a data-symbol filter (kind:data, not
kind:function) and consider whether prose headers citing a specific prior
brief number should be regex-matched even without a `[CP]-\d+` taxonomy
citation.

## Attempted and parked (15) — near-miss detail

Every entry below was reverted cleanly (`git checkout --` on the original
`.s` + a targeted single-line `delinks.txt` edit); `git status --short`
clean on all paths before moving to the next candidate.

### Predication-vs-branch wall (2 instances — matches brief 579 Family 5)

- **`func_02067b8c`** (main): all-predicated 3-statement if-body
  (`addlt`/`strlt`/`strltb`). 3 structurings tried (single if-block,
  3 separate ifs, early-return) — all either branch instead of predicate
  or produce a worse shape. Best: 77.8%.
- **`func_0207f8f8`** (main): same shape, 2-statement predicated if-body.
  Recognized as the identical wall class immediately (37.5% match, same
  `bxne`-vs-predication signature as `02067b8c`) — not re-attempted with
  fresh variants since the class is already exhaustively characterized.

### Register-allocation / scratch-register-choice wall (7 instances)

The single largest wall class this session — mwcc's -O4 register allocator
picks a *different* scratch register than the original for an otherwise
byte-identical instruction sequence, and this proved completely
insensitive to every C-level lever tried (named vs. inline temporaries,
dummy unused parameters, statement reordering, explicit local pointers).

- **`func_0207e214`** (main): 2-field reset (`cur=0; end=base;`). Best 57%
  — original hoists the `base` load above the first store using register
  r2 for the constant; any C shape that gets mwcc to hoist the load also
  triggers an *unwanted* `stmia` fusion (wrong register-to-offset order
  blocks fusion in the original but not in 3 of my 4 attempted variants).
- **`func_0208b1ac`** (main): 9-field struct-init variant (permutation of
  `0208b190`'s pattern). Best 75% — isolated the exact register-liveness
  rule (`b`'s last use must come after its own negation, forcing a fresh
  register instead of in-place reuse) via 4 attempts, but the final store
  ordering/deferral still didn't match.
- **`func_02096040`** (main): returns a zero-initialized 2-int struct by
  value. Best 75%, sizes match exactly — 6 attempts spanning aggregate
  init, individual field assignment, designated init, and a direct
  compound-literal return all hit one of two outcomes (right order + 1
  extra `add r2,sp,#0`, or right size + 2 swapped stores), never both.
- **`func_020a71e4`** / **`func_020a724c`** (main): tail-call trampolines
  through a double-indirected function-pointer struct field (offsets
  0x8 and 0x4 of the same global). Both structurally perfect (identical
  instruction sequence) except the scratch register holding the loaded
  pointer (r3/r2 in the originals vs r0 in both my compiles) — confirmed
  as a genuine family-level wall after the fix attempted on the first
  sibling (3 unused dummy params) had zero effect on the second.
- **`func_020b3850`** (main): 64-bit unsigned multiply
  (`unsigned long long a * b`). The formula matched **exactly**
  (`umull`+2×`mla`, same operands) — only the destination/scratch
  registers differ (r4/r5, callee-saved, vs my r12/lr, caller-saved),
  producing a leaner-but-different prologue.
- **`func_ov004_021dbe68`** (overlay004): argument-swap tail-call
  trampoline (`return target(b, a);`). Identical 6-instruction shape,
  one swap-temp register differs (r3 vs r2) — 3 attempts (base, dummy
  3rd param, explicit local swap) all landed at 71.43%, unchanged.
- **`func_ov004_021de264`** (overlay004): guarded optional-callback call
  (`if (cb) cb(); return 0;`). Same pattern, 69.23% — the pointer-load/
  test/call sequence uses r0 in my compile vs r1 in the original.

### Other genuine walls

- **`func_02078eec`** (main): returns 2 packed 32-bit halfwords as
  `r0`/`r1`. 5 distinct encodings tried (named-local `long long`, small
  struct return, union, inlined single-expression, operand-swapped) —
  struct/union both forced an indirect-return calling convention (much
  worse); every `long long` shift-combine form produced the right *values*
  but 2 extra no-op `orr rX,rX,#0` instructions mwcc's 64-bit-construction
  codegen always emits and never folds away, regardless of how the
  shift/OR is written.
- **`func_0208b1c8`** (main): Thumb 9-field struct init using `stmia`
  register-batch stores in the original. 3 attempts (pointer-increment
  `*p++=x` idiom, fixed-offset struct fields, both — identical output)
  confirmed mwcc's Thumb-mode codegen never auto-batches sequential
  scalar stores into `stmia`, unlike the ARM-mode case seen in
  `0207e214` where the *same* fusion happened unprompted.
- **`func_020947b8`** (main): zeroes 9 words via 3×`stmia{r1,r2,r3}`.
  4 attempts (real loop, manually-unrolled scalar stores, static-const
  struct-copy, compound-literal struct assignment) — a real loop
  survives as a loop (no auto-unroll), unrolled scalar stores don't
  auto-batch (same Thumb-`stmia` gap as `0208b1c8`), and struct-copy
  approaches add address-load overhead the original doesn't have.
- **`func_02098cdc`** (main): predicated if/else computing a *return
  value* (not a side-effecting statement — a different C shape from the
  `02067b8c`/`0207f8f8` predication wall). Best 57.14%: the predication
  itself matched perfectly (`ldrne`/`ldreq` both correct) once the byte
  load was made explicitly unsigned, and a real C bitfield reproduced the
  original's shift-pair 24-bit extraction (replacing mwcc's preferred
  1-instruction `bic` encoding) — but the compound `ands` vs `tst`
  instruction-selection difference resisted every variant tried
  (5 attempts: shift-pair, bitfield-pointer-cast, union, volatile,
  split-statement).
- **`func_020b005c`** (main): 4-word by-value struct parameter with a
  field mutation that never escapes the callee. Best 62.5%: plain
  by-value struct modeling gets the mutation fully dead-code-eliminated
  (proving it's genuinely unobservable), `volatile` on a pointer to the
  local forces the write to survive but the original also materializes a
  dedicated address register (`r2=sp`) that direct `[sp,#N]` addressing
  in my version never does (4 attempts: plain, volatile-pointer,
  double-read-through-pointer, volatile-parameter).

## Known pre-existing pytest failure (not caused by this brief)

`gate3.py --scope all` (with pytest) fails on 12 tests, all in files this
brief never touched (`test_m2c_feed.py`, `test_objdiff_resolve_relocs.py`,
`test_cluster_c_pattern3_gen.py`, `test_cross_region_cluster_apply.py`,
`test_patch_ov004_veneers.py`, `test_generate_research_index.py`) — every
failure is a Windows path-separator (`\` vs `/`) assertion mismatch.
Documented pre-existing in
`docs/research/improvement-swarm-2026-07-15-r5.md` ("`post_edit.py`'s test
gate is permanently RED on Windows... 12 pre-existing failures"), dated
before this session. Used `gate3.py --scope all --no-tests` to isolate the
3-region sha1 check that actually verifies this brief's changes; both
passed clean.

## Verification

```text
$ python tools/gate3.py --scope all --no-tests
...
[eur] SHA1 PASS
[usa] SHA1 PASS
[jpn] SHA1 PASS
==================== GATE PASS ====================
```

Each of the 3 matches was individually confirmed at EUR objdiff 100%
(`objdiff-cli diff -1 <delink>.o -2 <built>.o <symbol>`) before committing.
No USA/JPN porting was needed or attempted — these 3 addresses don't appear
in USA/JPN's own `delinks.txt` files (the brief's task list did not
include a porting step, unlike brief 579).

## What's next

- The register-allocation/scratch-register-choice wall (7 of 15 parked
  candidates, the largest single class) is worth a dedicated investigation
  independent of more C-reshaping attempts — every lever available at the
  C-source level (naming, ordering, dummy parameters, explicit locals) was
  tried and had zero effect on which physical register mwcc's allocator
  picks for an otherwise-identical instruction sequence.
- The 3 mis-classified candidates are concrete, ready-to-apply signal for
  brief 640's wall-classification audit.
- 26 main candidates were skipped as prose walls purely from the header
  read (not individually re-verified in this window) — consistent with
  the brief's own "roughly half will be prose walls" expectation, though
  the actual split (skip-heavy in main, driven by main's unusually large
  concentration of documented walls) came out closer to 60/40 than 50/50.
