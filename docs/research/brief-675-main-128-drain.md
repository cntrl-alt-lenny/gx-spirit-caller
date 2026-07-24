# Brief 675 — drain the untouched main <=128B high-yield cell (queue item cm-main-128-drain)

**Result: 9 ships, 3-region (`gate3.py --scope all --no-tests` PASS: EUR,
USA, JPN), all individually objdiff/fastmatch-verified at 100% before
being handed to the aggregate byte-identical gate.** One HIGH-confidence
wrong-same-size-sibling porting collision caught and fixed by hand. A
much larger number of near-misses (30 candidates checked, 9 shipped, 21
parked with real word-level diffs) — documented below since several
reveal genuine, reusable levers even where they didn't convert this
round.

## Scope

r9's drain-aware analysis flagged `main`'s <=128B tranche as the
largest untouched high-yield cell: 873 candidates by the user's own
count (829 real functions after excluding 2 misclassified `data_`
symbols from `wall_aware_headroom.py`'s candidate list), vs. only ~10
previously sampled. Per the queue item's explicit instructions: route
by epilogue before drafting, and do not chase high-`match_pct` reg-alloc
parks.

## Finding: the "GLOBAL_ASM endgame" comment is universal, not a signal

790 of 829 candidates (95.3%) carry an identical boilerplate comment:

```
; func_XXXXXXXX — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).
```

This is not a per-function verdict — it's a stamp applied in bulk by an
early-campaign pass (briefs 294/302), predating the wall-taxonomy fix
(brief 651) that stopped trusting blanket markers as proof of
permanence. Reading the raw disassembly directly (ignoring the
comment) shows the overwhelming majority of this pool is ordinary,
tractable C: struct inits, linked-list searches, bitfield toggles,
hardware-register pokes, lookup tables, byte-search loops. This
reconfirms brief 655's own finding on a different corpus slice ("30 of
40 main C-34 citations sharing ONE boilerplate header are flat
mistagged") at even higher prevalence. **The comment should not gate
triage decisions for any future main sweep.**

The very smallest size sub-tier (0–~48 bytes) is the exception: this
region is dominated by genuinely non-C-expressible shapes — shared
epilogue-only stubs (`ldmia sp!, {regs}; bx lr` with no matching
prologue in the same function), and cross-function raw `.word`
branches jumping into the middle of a *different* function's body.
Confirmed on 6 of the smallest ~20 candidates sampled. These are
mechanically filterable (no prologue at all, or an inline raw `.word`
branch encoding) before ever drafting C — matching the tiny-anchor
false-positive pattern already documented in brief 662's family-sweep
memory.

## Ships (9)

All EUR sources, all individually fastmatch-verified at 100.0% via a
custom single-shot diagnostic (`cmatch_loop.py`'s own
`TemporaryGap`/dossier machinery driving a real `mwccarm` compile +
`objdiff`-based word comparison, reused directly rather than through
its m2c-skeleton path — see "Tooling" below) before being batched
through `batch_sha1.py` for the real link-level gate.

- **`func_02067328`** — range-checked byte-buffer push
  (`if(count>=0xfe) return; if(a1<1||a1>0xfe) return; buf[count++]=a1;`).
  Lever: combining the trailing two early-return guards with `||`
  avoids mwcc predicating the guarded body (a variant of the brief-655
  shared-return-convergence lever, but for two *void* early returns,
  not two differing return values). Also needed array-indexing syntax
  (`a0[count]`) rather than pointer arithmetic to match the
  register-indexed `STRB r1,[r0,r3]` addressing mode.
- **`func_020a73e8`** / **`func_020a7414`** — a forward/backward
  byte-search pair (memchr-style). Lever: a plain `while(cond) {...}`
  loop, not a `do-while` with a separate upfront zero-check, so both
  the "empty input" and "search exhausted" exits share ONE tail
  (`mov r0,#0; bx lr`) instead of the compiler emitting it twice.
- **`func_0204b3d0`** — stride-12 byte-array scan returning a
  wraparound-adjusted index.
- **`func_020525dc`** — reload-through-global-pointer indirect-call
  dispatch (calls a helper, then re-reads the same callback pointer
  before invoking it with the result — the double-reload matches the
  project's established "reload via pointer, not a cached local"
  lever).
- **`func_020644c4`** — three-stage guarded init (`if already-init
  return; mark init; call A; if (call B fails) return; call C;`).
- **`func_02093acc`** — zero-fill loop across a 9-entry `u16` array
  plus one unrelated `s32` global, both anchored off two separate pool
  literals.
- **`func_02097074`** — struct-field-writes-then-tail-call trampoline
  (writes 5 fields, reassigns `a1` to a literal, tail-calls a helper
  via `bx`, not `bl`+return). mwcc reproduced the tail call directly
  since the call is the function's last statement and there's no stack
  frame to unwind.
- **`func_020a2f9c`** — MMIO/global-struct setup with a reload-through
  pointer between two field writes (same lever as `func_020525dc`).

## Porting collision (HIGH confidence, caught before it shipped wrong)

`port_to_region.py` auto-resolved **both** `func_020a73e8` and
`func_020a7414` to the *same* USA/JPN target, `func_020a7320` — the
second `port_to_region.py` invocation silently overwrote the first
one's output file on disk (both write to the same computed path).
EUR's two source functions are adjacent (`0x020a73e8`, size `0x2c`,
immediately followed by `0x020a7414`, also size `0x2c`) and USA/JPN
have an equally-adjacent same-size pair (`func_020a72f4` / size `0x2c`,
`func_020a7320` / size `0x2c`) — a same-size-neighbor collision
identical in shape to brief 673's finding, just LOW confidence
end-to-end rather than HIGH.

Fixed by computing the address shift from three independently-verified
neighboring functions (sizes `0x20`, `0x4c`, `0x14` — EUR
`0x020a7368/0x020a7388/0x020a73d4` against USA/JPN
`0x020a7274/0x020a7294/0x020a72e0`), all agreeing on a consistent
`-0xf4` shift. That pins `func_020a73e8 → func_020a72f4` (the
forward-search function, whose port had been silently dropped) and
confirms `func_020a7414 → func_020a7320` (the backward-search function,
whose port happened to already be sitting at the correct address).
Manually wrote the missing `func_020a72f4.c` for both USA and JPN;
`batch_sha1.py` confirmed both regions clean afterward.

## Negative findings / parked near-misses (21 checked, not shipped)

Word-level diffing (see "Tooling") on each of these showed a small,
specific residual — recorded here so a future attempt doesn't have to
re-derive the same diff from scratch:

- **`func_0208be70`** (90.91%, 1-word residual): hardware busy-wait
  poll (`while(*(volatile u16*)REG & 0x8000);`). `volatile` is required
  (dropping it collapses the match to 0%, confirming this project's
  hardware-register code needs `volatile` on every MMIO access, not
  just the loop condition). The one remaining residual is `TST`
  (discard result) vs. the original's `ANDS` (keep result in the
  register) — same immediate, same flags, pure instruction-selection
  choice. Tried a named intermediate variable and both `while`/`do-while`
  forms; none changed it. Mechanism not identified — flagged as a
  reusable lever gap, not just this-candidate noise, since it recurred
  verbatim on `func_0207e6bc` below.
- **`func_0207e6bc`** (33.33%): if/else pointer-shift merge. The
  original **duplicates** the two field reads inside *each* branch
  rather than hoisting them before the if — the opposite of the
  natural-looking C. Fixing that got the overall shape right, but hit
  the exact same `TST`-vs-`ANDS` residual as `func_0208be70` on the
  flag test.
- **`func_02032724`** (55.56%): a nested-offset field guard
  (`a0+0x1fc` then `+0xc80` within that). mwcc folds both additions
  into one constant offset (`0xe7c` from `a0`) in every source form
  tried (raw pointer arithmetic, an intermediate named pointer, a
  typed nested-struct field access) — the original keeps the
  `add r4,r0,#0x1fc` materialized as a real value, reused with a
  smaller embedded `#0xc80` offset in the two dependent loads/stores.
  Both hypotheses tested changed nothing; the fold appears to be
  purely a compiler heuristic decision, not source-shape-controllable
  by the levers tried here.
- **`func_020919ac`** (36.36%): linked-list search-until-flag. Multiple
  restructurings tried (if-break inside `while`, single combined `&&`
  condition matching the `func_02079e20`-style shared-tail lever);
  neither reproduced the original's real-branch topology.
- **`func_02068d24`** (36.36%, 1-word/1-instruction gap): call, compare
  result to `-1`, conditionally call a second helper. The original
  computes the sentinel `-1` into a *different* register than the one
  holding the call result (an extra `mov`), before comparing; a named
  result variable didn't reproduce this register shuffle.
- **`func_02079e20`** (27.27%): rtrim-style backward index scan.
  Combining the loop guard into one `&&` condition (the lever that
  fixed `func_020a73e8`/`func_020a7414`'s shared-tail issue) did not
  fully converge here — the original computes the array index via two
  separate instructions (`sub` then `lsl`) where mwcc's compilation of
  the `a0[a1-1]` expression combines them into one shifted-register
  `ADD`.
- **`func_020b005c`** / **`func_020b0034`** (0%): both spill all four
  incoming argument registers (`stmdb sp!,{r0,r1,r2,r3}`) up front —
  the classic address-of-parameter wall signature — but taking the
  address of one argument to modify it in place gets **dead-code
  eliminated entirely** (compiles to a bare `bx lr`) once the return
  value doesn't observably depend on the modified value. Tried four
  models: a union-based `f64` reinterpret (avoids the spill entirely,
  per the established lever, so doesn't match the ABI shape either),
  plain address-of with an unrelated return value (eliminated), a
  2-word struct return built from the address-of'd value (still
  doesn't trigger the 4-register spill), and a 16-byte struct-by-value
  parameter (spills, but via `SUB sp` + individual stores, not the
  `STMFD` bulk-push the original uses). None reproduced the original's
  exact ABI entry sequence. Genuinely unresolved — flagged as a
  candidate for a future dedicated investigation rather than continued
  guessing here.
- **`func_0208b300`** (0%): a 3×3-plus-zero-row struct transpose. The
  original uses one bulk `LDM` (9 registers) plus three `STM`s — a
  register-transfer pattern that neither flat-array-indexed nor
  recomputed-intermediate-pointer C source triggered; both attempts
  compiled to plain per-word `ldr`/`str` pairs (23 words vs. the
  original's 11).
- 12 more (`func_0202b9b0` 93.33%, `func_020938c8`/`func_0209adb4`
  83.33%, `func_0205272c`/`func_0205d6bc`/`func_02064544` 73.33%,
  `func_0202bb88` 68.75%, `func_0205d560` 62.5%, `func_0203eb14`/
  `func_0208df0c`/`func_0208df60`/`func_0208e1cc`/`func_0208e220`/
  `func_020a3308`/`func_020a5f10` 46–54%, `func_020338b8`/
  `func_02038d70` 43.75%, `func_0205c7f4`/`func_0205bccc` 31–33%,
  `func_02025840` 29.41%, `func_020558fc` 26.67%, `func_020442f8`/
  `func_02095c18` 25%, `func_0208c9d4` 23%, `func_02045c7c` 12.5%,
  `func_0208e5ec`/`func_020908c0` 8.33%, `func_020624cc`/
  `func_0207d37c`/`func_02090574`/`func_020953e4`/`func_02098388`/
  `func_020aaf10` 0%) — checked via the bulk first-pass fastmatch sweep
  only (no individual word-diff yet); time-boxed given the size of the
  remaining pool. Draft sources for all of these are NOT included in
  this PR (kept in the working session only) since none reached
  100% — a future brief re-attempting this pool should re-derive
  drafts from the raw disassembly rather than assume any specific
  draft form was already tried and rejected, since only a subset above
  got genuine word-level scrutiny.

## Tooling notes

- **`arm-none-eabi-objdump`/`m2c` were not initially available on this
  machine**: `tools/arm-none-eabi/bin/` exists in-repo but isn't on
  `PATH` by default, and `tools/_vendor/m2c/` needs
  `python tools/m2c_bootstrap.py` run once before `cmatch_loop.py`'s
  dossier step can produce anything but an immediate
  `M2CMissing`/`FileNotFoundError`. Both are one-time, machine-local
  setup steps, not code changes.
- **`cmatch_loop.py`'s m2c-skeleton auto-draft is a weak first-pass for
  small functions**: for functions under ~48 bytes, m2c frequently
  emits an empty stub (`void func(void) {}`) rather than a real
  attempt, since there's too little to type-infer from. It remains
  useful as a **cross-reference AFTER drafting by hand** — its
  suggested parameter types (`s32` vs. inferred pointer casts) and
  struct-field-vs-raw-offset framing caught real issues on several
  candidates — but blindly adopting its exact control-flow shape
  (goto-heavy, `var_rN`-named locals) made several candidates
  measurably *worse* (e.g. `func_020a73e8` went from 16.67% to 8.33%
  before reverting to a plain, hand-written `while`/`do-while` form and
  re-deriving the fix from the real word diff instead).
- **A lightweight single-candidate diagnostic script** was written this
  brief (not committed — session-local, matches this project's
  existing `--verbose` word-diff feature in `fastmatch.py` that
  `cmatch_loop.py`'s own wrapper discards): opens one function's
  `TemporaryGap`, stages a candidate source, compiles, and prints the
  exact `objdiff` word-level diff (decoded ARM instruction mnemonics,
  not just raw hex) before always restoring the `.s`/delinks state.
  This is what made the 9 ships and the specific residuals above
  possible to pin down — a full `cmatch_loop.py` invocation with
  `--source-overrides-dir` gives only a percentage, and the aggregate
  `batch_sha1.py`/`ninja sha1` gate gives only pass/fail across the
  WHOLE rom. Recommend promoting an equivalent to `tools/` in a future
  brief (flagged as a follow-up, not done here to keep this brief
  scoped to the queue item itself).
- **Two real tool bugs found and flagged via `spawn_task`, not fixed
  inline** (kept this brief scoped to shipping candidates):
  1. `cmatch_loop.py --keep-drafts` leaves a stray `.c` file in `src/`
     for the s-routed ("c-match") candidate path when a candidate
     doesn't reach 100% — the code restores the `.s` sibling
     unconditionally but skips deleting the kept draft, so the very
     next `ninja delink`/`configure.py` hits "multiple rules generate
     the same output."
  2. `batch_sha1.py`'s `.c`→`.s` reverse-mapping only strips a trailing
     `.c`, so a `.thumb.c`/`.legacy.c`/`.legacy_sp3.c` candidate looks
     for a nonexistent `func_X.thumb.s` instead of the real
     `func_X.s` — blocked using it directly on the 2 Thumb-tier
     candidates drafted this brief (parked, not shipped, since their
     match% never got past a first attempt given the detour).
- **Process lesson (this session, not a tool bug): `batch_sha1.py`'s
  bisection assumes the candidate's original `.s` file still exists on
  disk as a valid "revert" target** — its precondition is "delinks.txt
  still says `.s`," not "the file is still there." Deleting a `.s`
  sibling and relying on `batch_sha1.py`'s own revert-on-failure to put
  it back produces a **false negative across the entire batch**: once
  the `.s` file is gone, "reverting" a bad candidate just leaves its
  `.c` definition as the only one the linker can find regardless of
  what delinks.txt's text says, so the bisection can never actually
  isolate a clean subset. (Confirmed directly — a batch that later
  turned out to be 9/9 correct first reported "0 confirmed, 12
  culprits" while contaminated this way.) The safe sequencing is:
  verify each candidate's real match% individually FIRST (fastmatch,
  not just compiles-without-error), and only delete `.s` siblings for
  candidates already known-good, immediately before the one
  `batch_sha1.py` call that ships them for real.

## Gate

`python tools/gate3.py --scope all --no-tests` — 3-region PASS (EUR,
USA, JPN), forced-clean rebuild, each region's `batch_sha1.py`
independently confirmed all 9 candidates before the combined gate ran.
