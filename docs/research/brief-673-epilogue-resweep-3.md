# Brief 673 — continue the epilogue-wall-corpus sweep (queue item cm-epilogue-resweep-3)

**Result: 17/23 shipped (73.9%), 6 parked.** All 17 ported to USA + JPN,
individually verified 100% — 2 real porting bugs found and fixed along
the way, including a new HIGH-confidence variant of the "wrong
same-size sibling" collision. 3-region `gate3.py --scope all
--no-tests` PASS. One stale-queue-state bug fixed too (see below).

## Scope

Same corpus as briefs 668/672: `docs/research/campaign-analytics/epilogue-wall-corpus.md`'s
205-row mechanical census, continuing past the 48 rows already
addressed (24 from brief 668, 17 from brief 672, 7 found already
routed by other parallel branches). Worked the next 23 smallest
still-`.s` rows (68–80 bytes) from the remaining 157.

## Queue-state bug found and fixed first

Before starting, `work_queue.py next` surfaced `cm-epilogue-resweep-2`
as an EMPTY, unclaimed `[TODO]` stub — a queue-restock/hygiene commit
(`5fa0b9bc`) had found two duplicate header lines for that item (a
stale `[TODO]` and the real `[DONE]`, landed back-to-back by an earlier
merge with no blank line between them) and resolved the duplicate
backwards: it kept the stale `[TODO]` and deleted the `[DONE]` header
along with its entire Gate + Result body, silently reverting an
already-shipped, already-merged item (PR #1304, brief 672) back to
looking like unstarted work. Restored the `[DONE]` status and Result
paragraph verbatim from the original commit. Flagged the underlying
dedup-script bug as a separate task — not fixed here, out of scope for
this brief.

## Ships (17)

- **`func_0208541c`** / **`func_02085460`** — sibling pair: a
  struct-relative table lookup using a byte-address (not
  index-scaled) `u16` lookup, then a multiply-accumulate to locate an
  entry, then a bitfield read/modify/write on a shared field (`&~0xc0`
  `|(v<<6)` vs `&~0xf`  `|v`). Modeled with register-named intermediate
  variables tracking the raw pointer-arithmetic chain literally, since
  the address computation has no natural "clean" C expression.
- **`func_0209bb60`** / **`func_0209bc20`** — sibling pair: forward the
  incoming pointer plus a function-pointer constant to a helper,
  cache the result in a global, and conditionally call a fallback if
  the result is zero, then re-read the (potentially just-written)
  global as the return value.
- **`func_02045cb8`** — four sequential calls/stores with no control
  flow, straightforward once routed.
- **`func_0205000c`** — the "re-fetch, don't cache" accessor lever
  (now confirmed on its 5th+ distinct function across 3 briefs) — the
  same `func_020498f0()` accessor is called 4 separate times, never
  cached in a local, each call's result used for exactly one field
  access before being discarded.
- **`func_0207cd34`** — conditional indirect call through a global
  callback pointer, forwarding 3 pointer-offset arguments plus a
  loaded `u16` as the 4th (register) argument.
- **`func_0208c98c`** — MMIO register read-modify-write: extract a
  2-bit field via mask+shift, store it to one global, zero another,
  then clear the field in the original register and write it back.
- **`func_02090114`** — call result used both as a direct store and as
  a shift-derived table index; needed `unsigned short` (not `short`)
  for the lookup table to get an unsigned `ldrh` instead of a signed
  `ldrsh`.
- **`func_02079ac4`** — a carry-propagate array-add loop (add running
  carry into each element, store the truncated low 16 bits, shift the
  carry down by 16, stop when the carry is exhausted or the array is
  exhausted). Needed both stopping conditions expressed as one
  compound `while (carry != 0 && i < count)` loop condition rather
  than a `while` combined with a body-internal early return — the
  latter compiles to inline-predicated per-iteration checks instead of
  the target's single unconditional jump to a shared condition block.
- **`func_0203db24`** / **`func_0203ee94`** — sibling pair: call a
  guard function (return a fixed value if non-zero), then call a
  second function whose result is checked against 0 OR a specific
  negative sentinel (`-39` / `0xffffffda`) via `mvn r1,#0x26` — modeled
  directly as `r == 0 || r == -39` rather than deriving the sentinel
  from the raw hex.
- **`func_020469d0`** — a per-bit flag test using a *variable* shift
  amount (`1 << a0`, shift count is a parameter, not a constant) against
  a struct field, forwarding the same parameter to a tail call whose
  return value is the function's own return value.
- **`func_02055fec`** — chained double-null-check (`if (a0==0 ||
  *a0==0) return 2;`) merging cleanly into one shared-return branch,
  then a field check, then a forwarding call.
- **`func_02062118`** — threshold-then-conditional-call dispatch: the
  in-range early-return needed combining into the SAME final `return 1`
  used at the bottom of the function via `if (delta > threshold &&
  call(...) == 0) return 0; return 1;` — an early separate `if
  (delta <= threshold) return 1;` predicated inline instead of
  branching to the shared exit (the same brief-655 lever as
  `func_0207d4dc` in brief 672, now confirmed a 3rd time on a
  genuinely different shape: threshold-gated dispatch, not a
  range/alignment check).
- **`func_02082198`** — flag-test-then-populate-once pattern: check a
  bit in a global flags field, and only if unset, call a populate
  function and set the bit — always returns the same fixed pointer
  regardless of which branch ran.
- **`func_02088d8c`** — null-check-then-clear-then-two-calls, no
  control flow beyond the single guard.

Each ship verified 100% via `objdiff-cli diff --format json` before
staging; each ported to USA + JPN and re-verified 100% at the ported
address.

## Parked (6)

All 6 are logic-correct (traced from the raw disassembly with no
ambiguity) but plateaued on residuals that repeated reshaping did not
move — the project's established reg-alloc-choice wall class, plus one
genuinely novel shift-sequence mismatch:

- **`func_0207db00`** (88.2%) — identical shape to brief 672's
  `func_0207d4dc`/`func_0207dab4` (range/alignment check dispatch); a
  **3rd sibling** hitting the exact same r2-vs-r3 scratch-register
  choice for the `end - start` intermediate. Not re-tested with
  reshapes given 2 prior confirmations of insensitivity for this exact
  pattern — parked immediately.
- **`func_02091c44`** (52.9%) — double-indirect callback
  clear-then-invoke. Pure register-choice shift (mine picks r0 first,
  target picks r1, cascading through the whole dependent chain) with
  zero live parameters to explain the preference either way — tried
  both a cached-local and a direct-chained-access variant, byte-identical
  result both times.
- **`func_020938f8`** (76.5%, up from 52.4%) — a 7-bit bitfield
  extraction at bit-offset 8 gated a real, structural bug first: taking
  the address of a parameter (`&a1`) to reinterpret it as a bitfield
  struct triggers the documented brief-663 "spills all 4 argument
  registers" wall. Switching to a union (copy the value in, read the
  bitfield member, no address-of) fixed that structural issue (52.4%→70.6%),
  and matching the mask-then-shift instead of a bitfield-typed read
  closed further (→76.5%) — but the target's exact instruction shape
  (`and` + `lsl #8` + `lsr #0x10`, three separate ops) never matched any
  of a plain masked shift, an unsigned-cast masked shift, or a real
  bitfield read (which produces a *different* two-op lsl/lsr pair with
  wrong shift amounts). Whatever source form produces exactly this
  3-instruction sequence remains unidentified — parked as a genuine
  near-miss rather than a clean wall.
- **`func_0206e4a4`** (44.4%) — guard-then-call-then-boolify. Missing an
  explicit `mov r1, r0` register copy that an explicit local-variable
  reshape (`int x = a0;`) did not reproduce — byte-identical output
  with or without the local, confirming this specific register
  preference is allocator-internal, not reshape-sensitive.
- **`func_02079c74`** (63.2%) — bitwise-NOT array loop + call. Same
  "missing explicit register copy" pattern as `func_0206e4a4` above,
  this time for the loop's count parameter (`mov r3, r1` in target);
  an identical local-variable-copy reshape (`int n = count;`) produced
  byte-identical output to the un-reshaped version — 2nd confirmation
  in this brief that this specific "compiler copies a live-in parameter
  to a different register before its first use" choice does not
  respond to a local-variable source hint.
- **`func_020905dc`** (16.7%) — an IME/IE hardware-register
  disable-mask-restore sequence. Structurally wrong, not just a
  register-choice residual: target allocates a full stack frame
  (`stmdb sp!,{lr}; sub sp,sp,#4`) that my version omits entirely,
  alongside a complete register reshuffle — suggesting my model uses
  fewer live temporaries simultaneously than the real source did.
  Time-boxed after one revision; needs a fresh diagnostic pass, not
  another blind reshape.

## Levers confirmed / new

- **Epilogue-wall-corpus census, 3rd consecutive brief, still strongly
  above prose-catalog baseline**: 15/24 (62.5%, brief 668) → 13/17
  (76.5%, brief 672) → 17/23 (73.9%, this brief) = **45/64 (70.3%)
  cumulative** from the same mechanical source.
- **The brief-655 "converge to shared return" lever generalizes to a
  3rd distinct shape** (`func_02062118`: threshold-gated dispatch) —
  now confirmed across range-checks, alignment-checks, and
  threshold-checks alike. General form: an early
  `if (cheap_condition) return X;` that shares its return value with
  the function's final fallthrough should be rewritten as
  `if (!cheap_condition && expensive_check) return Y; return X;` to
  force one shared exit instead of an inline-predicated early one.
- **"Re-fetch, don't cache" continues to recur** (`func_0205000c`, its
  5th+ confirmed instance across 3 briefs) — worth trying as a first
  hypothesis whenever a near-miss shows the same accessor called
  multiple times in the raw disassembly.
- **New confirmed wall sub-class: "explicit register copy of a live
  parameter" is allocator-internal, not reshape-sensitive.** Two
  independent instances this brief (`func_0206e4a4`, `func_02079c74`)
  where target copies an incoming parameter into a different register
  before first use (`mov r1,r0` / `mov r3,r1`) for no apparent
  liveness reason, and an explicit local-variable source hint
  (`int x = a0;`) produced byte-identical codegen to not having one —
  confirming the compiler's choice of *which* register to copy a
  live-in value into is not something a source-level reshape can
  influence, joining the existing P-4 scratch-register family as a
  distinct-but-related pattern (this one on a *parameter* register,
  not a temporary).
- **Taking the address of a parameter to reinterpret its bits
  (`&a1`) reproduces brief 663's "spills all 4 arg registers" wall
  even for pure bitfield-extraction purposes, not just genuine pointer
  use** — a union-based value copy avoids it while still producing
  real bitfield-read codegen.
- **`unsigned` vs signed element type matters for array lookups even
  when the loaded value is immediately widened** (`func_02090114`):
  `short` produced `ldrsh` where the target used `ldrh` — a pure
  type-signedness fix with no other code changes needed.

## Porting bugs found and fixed (2)

Individually objdiff-verifying every port (not trusting the resolution
confidence or a clean gate alone) caught 2 real bugs, both matching
previously-documented classes from brief 668:

1. **HIGH-confidence "wrong same-size sibling" collision.** The
   `func_0209bb60`/`func_0209bc20` sibling pair (identical shape,
   different callees) both auto-resolved to the *same* USA/JPN target
   name (`func_0209bb2c`) at HIGH confidence — the first time this
   session has seen this porting-bug class occur at HIGH rather than
   LOW confidence. Computed the expected address shift from 4
   independently-confirmed HIGH-confidence neighbors in the same
   region (a consistent `-0xf4` in every case) and found it predicted
   `func_0209bb60` should map to `func_0209ba6c` instead — a real,
   correctly-sized (0x44 bytes) USA/JPN function the auto-matcher never
   considered because its compiled bytes are apparently
   indistinguishable from `func_0209bb2c`'s to the tool's similarity
   heuristic. Wrote that port manually in both regions; the sibling's
   own auto-match (`func_0209bc20` → `func_0209bb2c`) was independently
   confirmed correct by the same shift check and used as-is.
2. **Region-specific struct-offset shift** (`func_020469d0`'s USA/JPN
   ports): the EUR struct's `flags` field sits at offset `0x644`, but
   both USA and JPN place the equivalent field at `0x63c` (8 bytes
   earlier) — invisible to `port_to_region.py` since it only rewrites
   symbol references, never hardcoded struct-literal offsets in
   hand-written C. Caught only because the ported object diffed at
   94.7% instead of 100% against each region's own ground truth.

## Gate

`python tools/gate3.py --scope all --no-tests` — 3-region PASS (EUR,
USA, JPN), forced-clean rebuild. `check_delink_dupes.py` clean
throughout (81 delinks.txt, no duplicate `.text` addresses).
