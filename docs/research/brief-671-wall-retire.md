# Brief 671 — systematically re-test P-NN "permanent" walls (queue item cm-wall-retire)

**Result: 2/7 shipped from r6's flagged candidates, 1 false-positive
correction (r6 was wrong about a specific function), 4 partial-progress
parks with a critical tooling discovery.** All 2 ships ported to USA +
JPN, individually verified 100%. 3-region `gate3.py --scope all
--no-tests` PASS.

## Scope

P-7/P-8/P-10's stale "why permanent" framing was already corrected in
brief 669 (merged) — verified still live on `origin/main` before
starting anything new. This queue item's fresh content is an r6 R&D
report (`docs/research/rnd-swarm-2026-07-23-r6.md`) claiming "6 of 8
brief-641-named reg-alloc functions, plus P-4's own cited
`func_02084ac4`, are byte-falsified — mostly routing-tier gap + one
signature-arity fix, not a new allocator lever." The report names 7
specific functions across 3 routing tiers (plain `.c`, `.legacy.c`,
`.thumb.c`) and points at a `scratchpad/rega/` directory from a
different session that no longer exists on this machine — every
function was independently reconstructed from the raw disassembly and
call-site evidence, not copied from a prior attempt.

## Ships (2)

Both are P-4-adjacent (the "swap/pool-load tail-call" reg-alloc family)
but neither is one of P-4's own named examples — both are from the
broader brief-641 catalog r6's report also cites:

- **`func_020a71e4`** — double-indirect vtable-style call
  (`data.inner->fn0(...)`). This session's own brief 670 attempt (and
  this brief's first attempt) modeled it as taking 0-1 parameters and
  parked at 37.5-42.9% on a residual register choice. **The real fix:
  grep the actual call sites.** All 3 callers (`func_020a7268`,
  `func_020a9e58`, `func_020ae474`) set up 3 live argument registers
  (r0, r1, r2) before the `bl` — the callee's own disassembly never
  reveals this since it just forwards them untouched to another call,
  so nothing in `func_020a71e4`'s own body hints at its arity. Modeling
  the true 3-parameter signature, all forwarded to the inner call,
  reached 100% immediately.
- **`func_020a724c`** — the direct sibling (calls the struct's second
  function-pointer field, `fn4`, instead of `fn0`). Its only caller
  (`func_020a72f0`) sets up r0 fresh right before the call but r1/r2
  persist live from earlier in the caller — same 3-argument-reaching
  pattern, just less visually obvious at the call site. But its actual
  inner function (`fn4`) turned out to take only **2** parameters —
  the raw disassembly shows the chase overwriting r2 (the incoming
  `a2`) before the call, meaning `a2` is received but genuinely never
  used. Modeling `a2` as an unused parameter (received, not forwarded)
  reached 100% — matching brief 670's "unused param doesn't reserve a
  register" refinement, but here the exact opposite intent: this time
  I *wanted* the register free, and an unused parameter delivered that
  correctly.

Each ship verified 100% via `objdiff-cli diff --format json` before
staging; each ported to USA + JPN and individually re-verified 100% at
the ported address.

## r6 was wrong about one specific function

**`func_02084ac4`** (P-4's own cited fnptr-cache example, not the
broader catalog) was independently re-tested with 3 source variants
(direct field access, named local `void (*fn)(void) = p->fn`,
alternate call syntax `(*p->fn)()`) — all 3 landed on the **exact same
70.0%**, with the identical r0-vs-r1 register-choice mismatch the P-4
entry already documents for this sub-shape. r6's report claims this
function is falsified; it is not. Updated P-4's entry to record the
re-test and correct the record rather than silently drop the claim.

## Partial progress + a critical tooling finding (not shipped)

- **`func_0207e214`** (also parked in brief 670 as a P-2 stmia-fusion
  wall) — re-tested with `.legacy.c` routing specifically per r6's
  claim: the stmia fusion disappeared (confirming legacy routing does
  fix *that* specific issue), improving 28.6%→42.9%, but a *different*
  residual surfaced — a pure r1-vs-r2 register swap for which of two
  values (a loaded field vs. a zero constant) gets which register,
  tested across both legacy tiers and 4 statement/declaration
  orderings with zero movement. Closer, but not shippable.
- **`func_02096040`** (the compound-literal 2-int-zero near-miss from
  much earlier this session) — retested under both `.legacy.c` and
  `.legacy_sp3.c` specifically because r6's report names this tier for
  it. Neither tier reproduces target's exact shape; the default tier's
  66.7% (from earlier this session) remains the best result across 7
  total attempts now.
- **`func_ov004_021dbe68`** and **`func_ov004_021de264`** (the two
  `.thumb.c`-routed candidates) — see the tooling finding below; both
  reached 69-71% after the fix, with the P-4 register-choice pattern
  (r2-vs-r3 swap-shape, r0-vs-r1 fnptr-cache-adjacent) as the sole
  remaining residual on each, confirmed insensitive to every source
  variant tried.

**Critical, broadly-applicable tooling finding:** a `.thumb.c`-suffixed
source file that omits an explicit `#pragma thumb on` does not
reliably compile in Thumb mode. Both candidates above initially showed
catastrophic 0% mismatches with ARM-style *predicated* instructions
(`addeq`/`moveq`) appearing in the diff — output that has no Thumb
encoding at all, and looks exactly like a deep semantic modeling
error, not a missing compiler flag. Adding the pragma (already present
in every sibling `.thumb.c` file already in the tree, e.g.
`func_ov004_021dd20c.thumb.c`, but trivial to omit when drafting a
fresh file rather than copying a sibling) immediately jumped both
functions from 0% to 69-71%. **Any future `.thumb.c` draft that shows
bizarre predicated-ARM-looking output instead of a clean near-miss is
almost certainly missing this pragma.**

## Gate

`python tools/gate3.py --scope all --no-tests` — 3-region PASS (EUR,
USA, JPN), forced-clean rebuild. `check_delink_dupes.py` clean
throughout (81 delinks.txt, no duplicate `.text` addresses).
