# cm-ov002-unknown-sweep-4: 59/145 shipped (40.7%) (2026-07-27)

## Method

Continued `cm-ov002-unknown-sweep-3` (#1376, 108-120B band, 49.4% shipped)
with the next size band up: `wall_aware_headroom.py --exclude-attempted
--min-size 124 --max-size 132` → **145 candidates**, all `src/overlay002/*.s`,
sizes 124-132 bytes. Partitioned round-robin (by ascending address) into 5
batches of 29, same WORKTREE-PARALLEL SWEEP PROTOCOL as the prior three
sweeps: 5 `git worktree`s (`sweep4-1..5`), each seeded with all 3 baseroms +
toolchain and independently configured/built/sha1-verified before dispatch.

## Result: 59/145 shipped (40.7%)

| Batch | Shipped | Notes |
|---|---:|---|
| 1 | 2/29 (6.9%) | Lowest yield. New levers: constant-immediate placement in a chained pointer-add can flip which operand becomes Rn vs Rm; the 13-bit-bitfield shift-pair lever generalizes to any field width (6/8/9-bit confirmed), not just 13-bit; `u16` fields need the `(unsigned)` cast before right-shift too (integer promotion to signed `int`); `do`-`while` is required, not just preferred, whenever a loop bound is re-read from memory rather than a cached local (`for` makes mwcc hoist a redundant entry guard the original lacks). |
| 2 | 16/29 (55.2%) | Highest-yield batch alongside 5. New levers: loop-invariant pointers declared *inside* the loop body (not hoisted) combined with a fresh per-iteration reread of the bound, which is what produces `bls` instead of `beq`; splitting a 3-term pointer add into two separate assignment statements to fix ADD operand order; a function-pointer cast to call a core.h-declared sink at a different arity than its header prototype (redeclaring in the same TU is a hard error). Correctly identified the "brief 302/294" `.s` header as generic campaign boilerplate, not a per-function verdict, via direct investigation of the source briefs. |
| 3 | 11/29 (37.9%) | New residual class identified: 5 parked functions share a `(player&1)*0x868` row-index idiom and land at exactly 87.9%/81.2% on a consistent small-scratch-register swap, unresponsive to every lever tried — see new **P-20** below. Lever refinement: the `ls`/`hi` unsigned condition code only survives a variable-vs-variable comparison, even in positive polarity; variable-vs-literal-0 always collapses to EQ/NE. |
| 4 | 13/29 (44.8%) | Directly confirmed (via `tools/asm_escape.py` source) that the "GLOBAL_ASM endgame, brief 302 / brief 294 reg-alloc-walled" header is mechanically stamped by `--whole-function` mode on every remaining `.s` file, not a per-function record — see note below. New lever: for a detached per-player counter guard, compare against an already-initialized variable (not a literal) to preserve the `ls`/`hi` condition code; watch for mwcc opportunistically deriving the fail-constant from that same variable if its fail path has only one predecessor. |
| 5 | 17/29 (58.6%) | Highest-yield batch. New lever: an explicit trailing `mov r0,#0` before the final `pop` means the function returns `int` with an explicit `return 0;`, not `void` — declaring it `void` silently drops the instruction. Refined lever: loop bodies consistently advance a real incrementing pointer rather than recomputing `base + idx*stride` each iteration (5 of 29 candidates). |

## The "brief 302/294" header: recurrence of an already-settled question, not a new one

All 145 candidates carried the identical bulk-stamp header ("whole-function
ship-as-.s (GLOBAL_ASM endgame, brief 302)... reg-alloc-walled functions
with no C match (brief 294 endgame)"). Batches 1 and 3 independently read
this as evidence the whole band was a previously-exhausted re-crack pool,
explaining their lower yields. Batches 2 and 4 independently concluded it
was mechanical boilerplate, not a per-function verdict — batch 2 by tracing
briefs 294/302 directly, batch 4 by noting the header appears verbatim on
`.s` files far outside this sweep's candidate range.

Verified directly for this writeup: `tools/asm_escape.py`'s `--whole-function`
mode (lines 467-469) stamps this exact text on *any* function it's pointed
at — it's generic documentation of the tool's own ship-as-.s mechanism,
not a per-function record of exhaustive prior investigation. This question
was already settled twice before this sweep even started: both
`cm-ov002-unknown-sweep-2` and `cm-ov002-unknown-sweep-3` independently
confirmed the same thing and said so in their own writeups, and
`codegen-walls.md`'s C-45 entry already called it "at least the 8th
confirmed instance" as of two sweeps ago. This sweep's dispatch prompt did
not carry that resolved context forward into the batch briefs, which is why
2 of 5 batches spent effort re-litigating it. **Fix applied:** future sweep
dispatch prompts should state the resolution outright rather than let each
batch rediscover it independently. This is a recurrence of the
already-documented `GLOBAL_ASM`/brief-302 bulk-stamp failure mode (now
9+ confirmed instances by batch 2/4's count alone), not a new third
category — the actual 40.7% shipment rate this round (continuing the
63.2%/65.5%/49.4% decline curve rather than flooring near 0%) is itself
the clearest evidence the header was never a real per-function wall.

## codegen-walls.md updates (this PR)

- Extended **C-46** (unsigned cast preserves logical shift): applies to
  `u16` fields too (integer promotion to `int` before shift), and the
  underlying shift-pair-over-mask lever generalizes past 13-bit to any
  field width (6/8/9-bit confirmed this sweep).
- Added **P-20** (new): the `(player&1)*0x868` per-player row-offset
  register-letter-swap wall — 11 independently-attempted cohort members
  across 3 batches (2/3/4), all landing at 87.9% or 81.2%, unresponsive to
  every source-level lever tried. Flagged as a strong permuter candidate
  once that lane is unblocked on a non-Windows machine.
- Updated the brief-294 P-wall-index note and
  [`brief-294-regalloc-wall-scout.md`](brief-294-regalloc-wall-scout.md)'s
  UPDATE section with this sweep's 40.7% data point (third consecutive
  sweep, continuing the decline curve).

## Verification

- **Three-way count**: `.c` added == `.s` deleted == `delinks.txt` flips ==
  **59 == 59 == 59** (verified via `git diff origin/main`). Each worktree's
  own change count matched the `shipped*2+1` formula exactly before merge
  (5, 33, 23, 27, 35 for batches 1-5) — no stray drafts needed cleanup this
  round; all 5 batches' own `ninja -n` pre-merge checks were clean, and a
  final post-merge `configure.py eur && ninja -n` on the consolidated
  branch confirmed zero "multiple rules generate" errors.
- `python tools/check_delink_dupes.py`: OK, 81 delinks.txt, no duplicate
  `.text` addresses.
- 5 worktree branches merged via `git merge --no-ff` — zero conflicts on
  source files; `delinks.txt` auto-merged cleanly across all 5 (disjoint
  address ranges per batch, as expected).
- Every shipped function independently verified at 100.0% by its own
  worker via `fastmatch.py` before being reported shipped.
- `python tools/gate3.py --scope all --clean`: PASS — all three of
  `[eur]`/`[usa]`/`[jpn] SHA1 PASS` individually grepped from the full log.
- `python -m pytest tests/test_fastmatch.py -v`: 35 passed.
- `python -m ruff check` / `npx markdownlint-cli2`: clean.

## No mid-flight main catch-up needed this time

Unlike the prior two sweeps, `origin/main` had not moved since this
branch's base commit (`904fbb436`) — confirmed via `git fetch` +
`git rev-list --left-right --count origin/main...HEAD` showing the branch
only 1 commit ahead (the queue claim marker), 0 behind. No catch-up merge,
no conflict resolution needed.

## What's left

86/145 of this size-gated slice remain parked (documented per-batch above
with match% and residual class). The `(player&1)*0x868` register-swap
class (P-20, 11 confirmed members) and the pure register-allocation/
naming-permutation class (dominant across all 4 sweeps so far) are both
strong permuter candidates once that lane is unblocked on a non-Windows
machine. USA/JPN porting not attempted, matching the phased EUR-first
convention.
