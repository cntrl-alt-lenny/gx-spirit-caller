# Brief 674 — build a systematic reg-alloc-park discriminator (queue item cm-regalloc-discriminator)

**Result: 1 ship (a mis-classified "permanent wall" corrected), 1
false-positive correction to `codegen-walls.md`'s P-4 entry, and a
documented discriminator distinguishing falsifiable forwarded-argument
parks from genuine local-temporary register-choice walls.** EUR-only
this brief — USA/JPN port blocked by a genuine pre-existing un-carved
gap in both regions' ov004 delinks.txt, flagged separately (see
"USA/JPN porting blocked" below). 3-region `gate3.py --scope all
--no-tests` PASS (the gate covers all 3 regions' existing state; this
brief's own source change is EUR-only).

## Scope

R&D swarm r8 flagged reg-alloc/predication parks as 44 of 74 total
parks, shipping 0%, with `match_pct` actively anti-informative (walls
plateau HIGH at 84-88%, mimicking near-misses). r8 bet 3 additionally
named a specific, already-diagnosed false positive:
`func_ov004_021dbe68`, parked 3 sessions (P-4, briefs 641/671) as an
"unbeatable r2/r3 swap," is actually a byte-exact ship once the
tail-callee's real arity is read. This brief's job: verify that ship,
find the general discriminator that predicts convertible vs
genuinely-stuck, and document the r2↔r3 permanent signature precisely
enough to park future instances correctly on sight.

## Ship (1): `func_ov004_021dbe68`

The trampoline swaps its first two arguments and tail-calls
`func_02094688`:

```
mov r3, r0 / mov r0, r1 / mov r1, r3 / ldr r3, =func_02094688 / bx r3
```

Previous attempts (this session's own brief 671 included) modeled this
as a 2-argument swap-and-forward (`void func(int, int)`), landing at a
documented, seemingly-permanent 71.4% with an r2-vs-r3 residual on the
swap temp. Reading `func_02094688`'s own raw disassembly shows it
reads `r2` as a genuine input at its very *first* instruction
(`cmp r2, #0x0`) and uses it throughout as a memcpy-style length
parameter. The trampoline never touches r2 — it passes through
untouched from `func_ov004_021dbe68`'s own (previously unmodeled) 3rd
parameter. Modeling the true 3-argument signature:

```c

#pragma thumb on

extern void func_02094688(void *, void *, int);
void func_ov004_021dbe68(void *a0, void *a1, int a2) {
    func_02094688(a1, a0, a2);
}
```

reaches 100% immediately. Its sibling `func_ov004_021de264` (same
family, adjacent address) had already been independently fixed and
shipped to `main` by the time this brief started — same error pattern
(0 modeled args, real arity is 1 forwarded `void *`).

## USA/JPN porting blocked (pre-existing, not this brief's doing)

`port_to_region.py` correctly resolves the USA/JPN target
(`func_ov004_021dbc54`, via the region's consistent address offset),
but there's no delinks.txt entry to attach a port to: both USA's and
JPN's `config/<region>/arm9/overlays/ov004/delinks.txt` have a genuine
70-byte gap (`0x021dbc46`–`0x021dbc8c`) that was never split into
individual functions, even though `symbols.txt` already lists all 3
functions inside it (sizes `0xc`/`0x10`/`0x26`, cleanly filling the gap
with 2 bytes of trailing pad). `func_ov004_021dbc54` — our port
target — is the middle one. Tried `asm_escape.py --whole-function` to
carve the first function as a raw `.s` fallback; it emitted a
malformed, truncated file (ends mid-body with a literal `....`
placeholder and an oddly-placed literal-pool word) and failed to
assemble — looks like a real tool bug on this specific address shape,
not a quick fix. Flagged as a separate task rather than scope-creeping
this brief; EUR ships alone this time.

## False-positive correction to `codegen-walls.md` P-4

A prior "cm-regalloc-ship" pass (a different session, landed on `main`
before this brief) had re-tested `func_ov004_021dbe68` under the WRONG
2-argument model, confirmed the r2-vs-r3 residual across "4 additional
source rewrites," and recorded it as a *confirmed permanent instance*
of the swap-tail-call sub-shape. That conclusion was itself downstream
of the same missing-3rd-argument error every earlier attempt made —
re-testing more source *forms* of a wrong *signature* just re-confirms
the wrong signature's own residual, it doesn't test the real one.
Corrected the entry to remove this function from the confirmed-list
and recorded the real fix (see codegen-walls.md's P-4 entry for the
full correction).

## The discriminator

Read the **callee** (or the callee's real callers, if it's already C)
before parking any tail-call/thunk/trampoline shape as reg-alloc-permanent:

1. **Forwarded-argument false positive (falsifiable).** The park is a
   tail-call/trampoline shape (swap-and-call, cache-and-call, vtable
   dispatch) and the residual is that an *entire argument* is missing
   from the model — not a register-letter swap on an argument both
   sides already agree exists. A callee that reads a register (r2, r3,
   whichever) as real input in its own first few instructions proves
   the caller must be forwarding that register, whether or not the
   caller's own body ever appears to touch it — forwarding *is* the
   use, and is invisible if you only read the caller's disassembly.
   Same underlying lever as brief 671's "grep actual call sites for
   true arity" (`func_020a71e4`/`func_020a724c`), generalized: reading
   the callee directly is cheaper than finding call sites when the
   callee is available.
2. **Genuine r2↔r3 (or r0↔r1) permanent wall — park-on-sight,
   correctly.** Every argument the caller forwards is already
   correctly modeled (confirmed via #1), and the sole residual is a
   register choice for a value **computed locally** within the
   function — a scratch swap-temp, a pool-load pointer, or an
   intermediate like `sub rX, r1, r0` for a range/threshold check —
   never a value received from the caller's own parameter list. This
   session (briefs 672/673) independently reconfirmed this exact shape
   3 times (`func_0207d4dc`, `func_0207dab4`, `func_0207db00` — all
   range/threshold-check dispatch with a local `end-start`-style
   intermediate mwcc allocates to r2, target to r3) with zero movement
   across every reshape tried (named locals, statement/declaration
   order, operand order). If the diff shows the entire rest of the
   function byte-identical and the sole residual is one register-operand
   swap on a value that never crosses a call boundary, stop reshaping
   — brief 218's own 12-variant exhaustive sweep already proved this
   for the original swap-tail-call examples; a new instance matching
   this exact shape doesn't need the same 12 variants re-run.
3. **`match_pct` is not a valid signal for either case.** Confirmed
   directly this brief: candidates checked ranged 58-92% and the
   percentage correlated with neither "how close" nor "which
   discriminator case" — only reading the callee (or, for genuine
   walls, confirming every argument already matches) tells you
   anything. A 91%-plateaued park is not closer to shippable than a
   58% one.

## Other candidates checked (not shipped, not re-parked — already correctly classified)

Applied the discriminator to a handful of the highest-match_pct
entries in `attempts.tsv`'s reg-alloc/predication rows as a spot-check,
prioritizing ones this session hadn't already personally diagnosed:

- **`func_ov002_021ef7b4`** (table-call, ov002, 91.7% per ledger) — an
  existing campaign-prep draft tested at 58-64% here (a different,
  rougher variant than whatever reached 91.7% previously). Diagnosed 2
  real issues (an unnecessary `u32` cast let the compiler fold a
  bitfield double-shift into a single `and`, diverging from target's
  un-folded shift pair; a named `flags` local changed register
  allocation vs. target's direct re-reads) but still had unresolved
  predication-vs-branch residuals on 2 early-returns after both fixes.
  Time-boxed rather than chased further per the match_pct-is-anti-informative
  finding above — multi-issue MED-tier candidate, not a quick
  discriminator win. Reverted cleanly.
- **`func_020534b4`** (callback-pointer-return, 62.5%), **`func_02052ecc`**,
  **`func_02077ab4`** (both "pointer-holding register differs," brief
  668) — read all 3 raw disassemblies and their existing draft models;
  none show the forwarded-argument signature (all callees are already
  correctly modeled with their real arity in the existing drafts).
  Confirms these are genuinely NOT trampoline-arity false positives —
  their actual residuals (instruction-selection choice for a
  conditional mask-select; a preserved-pointer register choice) are a
  different, real wall class. Not re-attempted further; already
  correctly parked.

## Gate

`python tools/gate3.py --scope all --no-tests` — 3-region PASS (EUR,
USA, JPN), forced-clean rebuild. `check_delink_dupes.py` clean
throughout (81 delinks.txt, no duplicate `.text` addresses).
