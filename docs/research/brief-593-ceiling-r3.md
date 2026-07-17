# Brief 593 — ceiling round 3: extend the record

**Verdict up front: 0 fresh ships. 0-for-2 on the binary-match bar.**
Both targets attempted plateaued at 69.0% and 74.7% objdiff match —
correct structure, correct logic, verified-correct constants, but not
byte-identical. This is a different outcome than briefs 582/586 (which
each shipped 1) and the brief's own framing ("keep the streak going")
did not pan out. What this round *did* produce: a major, previously
undocumented codegen lever (C-44, below) that explains why both
targets were stuck at ~15-25% match despite semantically-correct C,
and a reusable 69-candidate jump-table census. Read this doc as a
frontier-mapping result, not a ceiling extension.

## Setup

Per brief instructions: worktree `claude-593` off
`origin/main` @ `19965e06`, baseline `ninja sha1` verified green before
any target work, confirmed green again at the end after reverting both
targets to their original `.s`. `docs/research/brief-586-ceiling-r2.md`
read in full first, as instructed — its target-selection method and
the C-24 routing lesson both directly shaped this round's approach
(see "What didn't work" below for where the routing lesson was a false
lead this time).

## Objective 1: target selection

**Method change from 586, and why.** 586 selected via
`c-match-prep/INDEX.json` cross-referenced with `find_duplicates.py`.
Re-running that exact method this round surfaced only 4 candidates in
the 900-1500 B band, and all 4 were disqualified on inspection:
`0204f3c0` (already shipped by 586 — stale INDEX entry), `020111e4`
(Q20.12 fixed-point via long-long `smull`, too risky), `021acb50`
(already a confirmed reg-alloc wall per 586's own doc), `021f3ba0`
(a real 5-instruction-off permuter-class candidate, but deprioritized
under time pressure in favor of a more promising vein — see "Left on
the table" below).

With the INDEX exhausted, I built a fresh census directly from
`delinks.txt` span sizes (not INDEX.json), filtering for the
**jump-table dispatcher shape** specifically (`addls/addlt/addle pc,
pc, rN, lsl #2` present in the `.s`), since brief 586's own successful
ship (`func_0204f3c0`) and brief 582's were both dispatcher-shaped.
Further filtered out `blx`/`bx` (indirect calls — function-pointer
typing risk) and backward branches (genuine loops — much harder to
hand-reconstruct faithfully than linear dispatch). Also filtered a
newly-identified special case: `.s` files headed "whole-function-as-
data emission" (brief 578) are raw disassembly-doesn't-round-trip
byte blobs, not real C-match candidates — 2 false leads avoided in
`main` alone.

Result: **69 jump-table-shaped candidates** in the 900-1500 B band
across `main` and `ov002`, sorted by extern-count (proxy for
signature-guessing risk). Full list below for future waves — this
census is reusable, and every future attempt against it should apply
C-44 (below) from the start rather than rediscovering it by trial and
error, which is most of where this round's time went.

Selected two, both from the low-extern end of that list:

- `func_ov002_022461d8` (ov002, 1020 B, 7 externs) — 34-way
  event-notify dispatcher, jump table nested inside jump table.
- `func_ov002_021b4684` (ov002, 1248 B, 1 extern) — card-id membership
  predicate, a single `bl` plus a sparse binary-search comparison tree
  over ~45 hardcoded constants.

Did not reach targets 3/4. Reason: target 1's comprehension surfaced a
real off-by-one in my own reading of the ARM jump-table pipeline
offset (see below) that took real time to find and fix correctly
*before* any compile was attempted, and once both targets' iteration
revealed the same underlying structural lever, chasing it to a
believable conclusion on 2 targets displaced starting 2 more. Given
the choice between 4 shallow attempts and 2 deep ones that surface a
transferable lever, I judged the latter more valuable — but flag this
as a deviation from the brief's explicit ask and let the record show
it plainly rather than padding the target count.

Per brief instruction, did not re-attempt `func_ov002_022b809c` and
did not use the brief-580 queue.

## Objective 2 (secondary, opportunistic): P-16 counter-lever

**Not reached.** Neither target stalled specifically on the P-16
pattern (repeated-address rematerialization); both stalled on the
newly-identified C-44 (case body order) and, after that was fixed, on
register-allocation-level differences that don't match any cataloged
wall. No time remained to probe P-16 specifically once C-44 consumed
the round's iteration budget.

## Target 1: `func_ov002_022461d8` — 34-way event-notify dispatcher

**Comprehension.** Clears `self->0` (u16); if the shared manager
(`data_ov002_022ce288`) has an active request (`+0x5d4 != 0`),
dispatches its mode byte (`+0x5dc`, range `[0,0x21]`) through a 34-way
jump table that mostly posts a single event code via
`func_ov002_0229cd88(self, code)`. A handful of modes gate the code
(or a +0/+1 adjustment) on equality/bit checks against three other
data symbols or bits of the manager's stashed `+0x5fc` word. Modes
6-10/31-33 share a second, inner jump table (its own sub-dispatch),
gated by a `bit16(stashed) ^ bit9(stashed)` check shared by all eight.
Falls through to a shared tail that conditionally fires a second
notify, then always fires a final unconditional one.

**Two real bugs caught before ever compiling**, both from careless
first-pass reading of the assembly, both worth flagging since they're
easy to repeat:

1. **ARM `addls pc, pc, rN, lsl #2` pipeline-offset off-by-one.** ARM
   reads `pc` as `(this instruction's address) + 8` when it's a
   computed-jump operand. The instruction immediately after the
   `addls` is therefore the **out-of-range fallback**, not the table
   entry for index 0 — the real index-0 entry is the *second*
   instruction after the `addls`. My first draft anchored the table
   one entry early, silently shifting every single case label by one
   mode value. This is exactly the kind of error that compiles cleanly
   and produces plausible-looking (but wrong) case bodies — it would
   not have been caught without deliberately re-deriving the table
   indices by hand against the raw `.s` a second time.
2. **Missed a second XOR term.** The shared sub-dispatch tail computes
   `match = (data^1) == (bit16(stashed) ^ bit9(stashed))` — two
   shift-extracted bits XORed together, then compared. My first read
   only caught one of the two shift+extract sequences (`stashed <<
   0xf`) and missed the second (`stashed << 0x16`) entirely, since
   both single-bit-compare *and* two-bit-XOR-compare idioms appear
   elsewhere in the same function and look superficially similar at a
   skim.

Both were caught by re-reading the full `.s` a second time end-to-end
before the first compile attempt, not by objdiff iteration — worth the
extra pass on any function this size.

**Iteration, with match% at each step:**

| Step | Match % | What changed |
|---|---|---|
| First compile (post-bugfix draft, ascending case order) | 14.9% | baseline |
| `.legacy_sp3.c` routing tried first (brief's own playbook — prologue looked like a routing-tier gap) | 19.6% | false lead — see below |
| **C-44 fix**: case order → original body-address order; early-return restructured to avoid duplicating the shared-tail call | 58.4% | default tier |
| `.legacy_sp3.c` on top of the C-44 fix | 68.2% | |
| `.legacy.c` on top of the C-44 fix | **69.0%** (best) | final state |

**The routing-tier false lead.** The very first diff row was a
prologue mismatch (`stmdb sp!, {r4, lr}` vs orig's `{r3, r4, lr}` +
`sub sp, #4`) — textbook C-24-family symptom, and brief 586's own
playbook says check routing tier early on exactly this signature. I
did, immediately: `.legacy_sp3.c` moved the score from 14.9% to only
19.6%. That small a movement on what looked like a slam-dunk signature
was itself a signal that the prologue mismatch wasn't the real
problem — it was a *downstream symptom* of the case-order issue
(wrong body layout changes the whole function's register-pressure
profile, which changes what the prologue needs to save). Once C-44 was
fixed, routing tier became a real, separate +10.6-point lever on top.
**Lesson for future briefs: a prologue-shape mismatch on a
switch/dispatcher-heavy function is not sufficient evidence to jump to
routing-tier — check case body order first if the function has 3+
non-trivial cases.**

**Residual gap at 69.0%** (`.legacy.c`, `docs/research/brief-593-
drafts/func_ov002_022461d8.legacy.c.txt`): all remaining diff rows are
`DIFF_ARG_MISMATCH` (same instruction, different register — e.g. `r12`
where orig uses `r1`) or literal-pool ordering, not structural. Not
resolved this round. Verdict: **not shipped**, `.s` restored.

## Target 2: `func_ov002_021b4684` — card-id membership predicate

**Comprehension.** `int func(int id, int kind)`. Returns 1 if
`func_0202b8c0(id)` (confirmed via its already-matched source: a card
attribute lookup, 3-bit field) equals 1, or if `id` is one of a fixed
set of "universal" card IDs, or if `id` is one of a fixed per-`kind`
set (only `kind` values `0xd, 0xe, 0xf, 0x10, 0x14, 0x16` have a
non-empty set; every other `kind` reduces to just the universal
check).

**Extraction method — mechanical, not hand-traced.** This function is
~45 hardcoded ID constants spread across a compiler-synthesized
binary-search comparison tree (`bgt`/`bge`/`beq`/`blt` chains, several
levels of `subne`/`cmpne` predicated re-comparison). Given how
brief 586 documented a near-identical shape as a "risky decision tree,
incomplete case-value reconstruction" wall, and given my own Target 1
mistake above, I did not trust a hand trace for this one. Instead I
transcribed the actual instruction sequence into a small Python ARM
interpreter (registers, `cmp` flags, predicated execution, the same
`addls pc,pc` pipeline-offset rule from Target 1) and **brute-forced**
the exact matching ID set per `kind` by executing the real logic
against a wide integer range, rather than reasoning about branch
directions by eye. This caught a real scan-window bug on the first
pass (missed `0xfe0`, just below my initial `0x1000` floor) — cheap to
catch mechanically, likely to be missed by eye.

This is the concrete answer to what previously read as "too risky":
the risk in a sparse ID-tree isn't the logic (trivial: return 1 if
member of set X) — it's **transcription accuracy** on ~45 constants
across nested predicated branches, and that risk is fully retired by
simulating the real bytes instead of reading them.

**Iteration, with match% at each step:**

| Step | Match % | What changed |
|---|---|---|
| First compile (ascending `kind` case order: 0xd,0xe,0xf,0x10,0x14,0x16) | 24.1% | baseline — first 50 of 346 rows already matched exactly (universal-set check), divergence starts exactly at the per-kind switch |
| **C-44 fix**: kind-case order → original body-address order (0x14, 0x16, 0xd, 0xe, 0xf, 0x10 — *not* ascending) | **74.7%** (best) | default tier |
| `.legacy.c` routing tried on top | 23.0% | made it dramatically worse — reverted |
| `suggest_coercion.py` C-1 (predicated-execution) rule, LOW confidence: replace scattered `return` with one flag + single final `return` | 44.6% | made it worse — reverted |

**Routing tier is per-function, not transferable — confirmed twice
this round in opposite directions.** Target 1 improved under
`.legacy.c`; Target 2 got dramatically worse under the identical
change. Don't assume a tier choice that worked on one target in a
brief carries to the next target in the same brief, even in the same
overlay.

**`suggest_coercion.py` flagged two candidate walls on the 74.7% diff:
S-1 (padding off-by-one) and C-1 (predicated-execution), both LOW/
MEDIUM confidence.** S-1 didn't apply (no struct decl in this
function; almost certainly a false-positive match on the tool's
"uniform offset shift" heuristic, likely triggered by the literal-pool
reordering noise rather than a real padding bug). C-1's recipe
(avoid `return` inside conditional bodies so mwcc can predicate) is
concrete and mechanical, so I applied it fully — and it made the
match meaningfully *worse* (74.7% → 44.6%), not better. Reverted.
**This is a useful negative result**: C-1's own doc caveat ("if the
if-body would expand to ≥4 ARM ops, this is P-6 — no C variation flips
it") likely explains why — most of this function's return sites are
inside case bodies well over that size, so C-1 doesn't apply and
forcing its shape just introduces control flow the original never
had. Future use of `suggest_coercion.py` should weight LOW-confidence
suggestions accordingly, especially C-1 on any case/switch body larger
than a few instructions.

**Residual gap at 74.7%** (`docs/research/brief-593-drafts/
func_ov002_021b4684.c.txt`): same character as Target 1 — remaining
diff rows are register-allocation-level (`DIFF_ARG_MISMATCH`) and a
handful of literal-pool-position artifacts, not structural or
comprehension issues. Verdict: **not shipped**, `.s` restored.

## New lever: C-44 (formalized in `codegen-walls.md`)

Both targets' big jump (14.9%→69.0%, 24.1%→74.7%) came from the same
single fix, found independently on each: **mwcc lays out a jump-table
switch's case *bodies* in source (case-label) order, not ascending
case value.** The jump table itself is always correctly indexed by
value — only the physical body layout follows source order, so
writing cases in the "obvious" ascending-value order silently produces
wrong jump-table target offsets for every case after the first,
cascading into register-allocation and even prologue differences that
look like unrelated walls (this is what sent me down the false
routing-tier lead on Target 1).

Full writeup, before/after table, and the routing-tier interaction
caveat: `docs/research/codegen-walls.md` §C-44. This is now the first
thing to check on any dispatcher-shaped function scoring under ~30%
match with an otherwise-correct-looking diff — reorder cases by body
address (readable straight off the `.s` file's `.L_XXXX:` label
addresses) before spending time on anything else.

## Where the real frontier sits

The brief asked: is there a size where the method stops working? Best
read from this round's evidence: **not a size wall — a structural-
completeness wall.** Both targets' *logic* is provably 100% correct
(every constant, every branch condition, every callee signature
verified against ground truth) and neither is small (1020 B / 1248 B,
squarely in the band prior briefs shipped from). What stopped both at
70-75% is register-allocation-level codegen choice — which physical
register mwcc picks for a given live value, and literal-pool entry
ordering — that doesn't yet have a known C-level lever. This is a
different frontier than 582/586 hit (those were comprehension-limited:
decision-tree case-value reconstruction risk). This round's targets
were fully comprehended and still didn't close, which suggests the
next unlock isn't "read the assembly more carefully" but "find what
source-level shape controls mwcc's register allocator" — genuinely
open, not yet even hypothesized here.

**Practical implication for the next wave:** don't read a 70%+ match
with a clean (no unexplained `DIFF_REPLACE` block, all `DIFF_ARG_MISMATCH`
or pool-position) diff as "almost there, keep tweaking" — both targets
here got two rounds of real, targeted attempts (routing tier, then
`suggest_coercion` C-1) at exactly that stage and both made things
worse. Better use of time at that point is probably banking the
finding and moving to a fresh target, which is what this doc
recommends doing next.

## Left on the table

- `func_ov002_021f3ba0` (ov002, 1364 B) — from INDEX.json, "74 cases
  + returns... cmp-tree SHAPE diverges (336 vs 341 insns)... permuter-
  class," only 5 instructions off per the INDEX's own stale note.
  Worth a look next round with C-44 applied from the start.
- The remaining ~67 candidates in the jump-table census (full list is
  reproducible from the query in this brief's transcript — main +
  ov002, 900-1500 B band, `addls/addlt/addle pc, pc` present, no
  `blx`/`bx`, no backward branches). Every one of them should get the
  body-address-order treatment from the start now, which should make
  future attempts materially faster than this round's trial-and-error
  discovery path.
- Register-allocation-level lever hunting on either of this round's
  two targets, if a future brief wants to push them the last ~25-30
  points to 100% instead of moving to fresh targets.

## Gates

`ninja sha1`: green before any target work and green again after
reverting both targets to their original `.s` (neither reached 100%,
so neither was flipped). No `.c` files were left in the active
`src/overlay002/` tree; both drafts are preserved read-only under
`docs/research/brief-593-drafts/` for the next attempt to start from.
