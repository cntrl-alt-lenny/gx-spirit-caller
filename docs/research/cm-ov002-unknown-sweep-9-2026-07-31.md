# cm-ov002-unknown-sweep-9: plain selection, one consolidated gate (2026-07-31)

## Purpose

Sweep-8's corrected data showed callee-coverage doesn't predict
shippability within the 149-512B band as sharply as sweep-7's
cross-band comparison suggested (true 100% coverage: 4/4 shipped, a
small but perfect sample; below that, no clean gradient). This round
dropped the coverage selector and went back to plain, module-agnostic
selection across the same band — still the project's best-measured
productivity, ~33pp of the remaining project and only ~12%/2%
complete.

This round also carried three process fixes prompted directly by
sweep-8's own incidents, described below.

## Process fixes this round

**1. One gate, not five.** Sweep-6/7/8's setup step ran
`configure.py eur && ninja sha1` — a full ROM build — across all 5
worktrees in parallel, and each batch's own end-of-task verification
ran a second `ninja sha1`. The mwcc toolchain serializes machine-wide;
this saturated the box and blocked a separate lane (Codex Scaffolder)
twice. Worth noting: this wasn't a new rule — `docs/queue/claude-decomper.md`'s
own `⚡ WORKTREE-PARALLEL SWEEP PROTOCOL` header already said "(d) gate
ONCE on the consolidated branch, not per worktree (per-worktree gates
waste the machine)." Three rounds ran the old way without connecting
that to this session's own setup step. Fixed this round: worktree
setup runs `configure.py eur` only (config generation + baserom SHA-1
check, no compiler invocation — confirmed safe in parallel, all 5
finished in seconds), and dispatch prompts explicitly forbid `ninja
sha1` in-batch. Workers iterate with `fastmatch.py` (single object, no
link, no ROM) only. The one 3-region ROM gate runs once, here, on the
merged branch.

**2. `park_one.py`.** Abandoning a candidate previously used
`git checkout -- <module>/delinks.txt <file>.s`, which reverts the
*entire* shared `delinks.txt` to HEAD — silently discarding another
candidate's already-shipped, uncommitted entry in the same file, hit
independently by 2 batches last round. `tools/park_one.py` now reuses
`batch_sha1.py`'s own `_flip_delinks` to surgically revert exactly one
function's line. Verified before this round: a round-trip flip is
byte-identical to the original, and — the actual bug — parking one
candidate while a sibling's shipped-but-uncommitted entry sits in the
same file leaves that sibling's entry untouched. All 5 batches used it
this round; zero collision incidents.

**3. C-32 body screening.** 2 candidates in last round's dispatch were
undetected C-32 permanent walls (hand-verified cross-overlay `BL`),
one of which carried no distinguishing header text at all — only the
generic brief-302/294 stamp. The real, mechanically-checkable
signature: a direct `bl`/`blx` to a `func_ovNNN_XXXXXXXX` target whose
overlay number differs from the caller's own (no real compiler can
emit this — legitimate cross-overlay calls go through a binary-level
veneer, invisible in source). The 100-candidate pool was screened for
this before dispatch (2 caught, backfilled), and every worker was
asked to re-check per-candidate. Result: 0 further C-32 instances
found by any batch — the pre-screen appears to have caught them all.

## Result

**19/100 shipped, 4,632 bytes.** EUR `Natural-C`/`C-decompiled` moved
12.20% → 12.40% (+0.20pp), consistent with the direct byte tally
(4,632 / 2,385,948 total ARM9 code bytes ≈ 0.19pp).

| Batch | Shipped | Bytes | Notes |
|---|---|---|---|
| 1 | 3/20 | 824 | Found (independently) that a recurring prologue/epilogue shape was compiler-tier routing, not a wall — see below |
| 2 | 6/20 | 1,904 | Same tier-routing discovery, independently |
| 3 | 4/20 | 784 | Flagged a new, narrow, recurring MLA-vs-indexed-load wall (3 instances, one data table) |
| 4 | 2/20 | 368 | Found new lever C-59 |
| 5 | 4/20 | 752 | Confirmed existing P-1, P-11 instances |

Zero C-32 exclusions across all 5 batches (pre-screening worked).

## A dispatch-prompt gap, not a new finding

Two batches (1 and 2) independently reported, as if newly discovered,
that a `push {regs,lr}; sub sp,#N; ... pop{regs,pc}`-style
prologue/epilogue is compiler-tier routing (`.legacy.c` /
`.legacy_sp3.c`), not a C-source register-allocation problem. This is
**not new** — it's `docs/queue/claude-decomper.md`'s own pre-existing
"⚠️ ROUTE BEFORE YOU DRAFT (brief 667)" guidance, which this round's
dispatch prompts didn't explicitly restate (they carried the C-55
through C-58 lever set but not this older, still-load-bearing one).
Both batches got there anyway through iteration and shipped real
functions from it (`func_02049430`, `func_02086d70` 0%→86.8%,
`func_0204f310`, `func_02075928`, `func_0209f514`), so the cost was
wasted iteration, not a wrong outcome — but future dispatch prompts
should restate this explicitly rather than let it be rediscovered
per-batch. Batch 1 also found an existing unresolved dossier note in
`src/overlay002/ov002_core.h` flagging a further un-swept instance
(`0x021b91d0`) — worth a project-wide sweep for more.

## The dominant residual shape across all 5 batches

Every batch independently flagged the same pattern under different
names, on roughly half of all parks: **word count matches the target
exactly, every instruction is logically equivalent, but mwcc assigns
different physical registers to the same logical variables than the
target does.** Batch 2 alone counted ~10 of its 14 parks this way, and
named it explicitly; batch 1 called it "register-color rotation";
batch 4, "register-letter-allocation puzzle" (3 functions sharing it);
batch 5, "register-letter swap" (2 functions). This is not a new
problem — it's the existing P-4/P-11/P-12/P-15 register-allocation-
plateau wall family, and this round's workers correctly recognized
several as such on sight: batch 5 confirmed a direct **P-1** instance
and 2 **P-11** instances; batch 3's `func_ov002_021efe44` is a
documented **P-17** cohort member (the P-17 lever moved it 23.9%→59.6%
before hitting the same register-letter wall P-17's own entry already
describes). P-4's own entry already concludes this class isn't
coercible from pure C source without register-renaming
post-processing (which would break the byte-identical-from-C
invariant) — this round's volume of independent hits reconfirms that
conclusion rather than overturning it.

One narrower, more specific sub-pattern recurred enough to be worth a
dedicated look rather than filed under the general plateau: an
MLA-fusion-vs-separate-MUL-plus-register-indexed-load choice, tied
specifically to one packed-record table
(`data_ov002_022cf16c`, `0x868`/`0x30`-or-`0x40`/20-stride addressing)
in ov002. Batch 3 hit it 3 times (`func_ov002_021ed1f8` 75%,
`func_ov002_0222ad54`, likely `func_ov002_0223cf18`); batch 1 hit the
same shape once more independently (`func_ov002_0220d974`, 36%) — 4
total, all touching the same table. Unlike the general plateau, this
is narrow enough (one specific table, one specific addressing choice)
that a dedicated investigation might actually crack it, the way P-17's
was.

## New lever: C-59

Added to `codegen-walls.md`: a trivial guard whose branch target is
shared with a nearby `switch`'s default case still gets predicated
(not branched) even when written with `goto` — C-55's fix doesn't
reach it. Rewriting the guard itself as a 2-outcome `switch` does.
One instance (`func_02007e8c`, batch 4); flagged for reconfirmation.

C-58 (unsigned/signed comparison selecting condition code) was
independently reconfirmed on a second function (`func_0209f514`,
batch 2) — now believed systemic, per its own entry's stated bar.

## A citation worth a note, not a correction

Batch 1 cited "C-45" for `func_ov002_022814f0` (a membership predicate
matched first-try via plain `switch`). C-45's actual documented shape
is a small contiguous-range compare chain avoiding mwcc's range-fold;
the worker's own description ("binary-search compare tree") doesn't
quite match. The function is verified 100% regardless — the citation
is what's imprecise, not the ship. Filed here rather than corrected in
`codegen-walls.md`, since it doesn't rise to a new lever or change any
existing entry; a future pass through the C-N index might turn this
into a genuinely new, more precisely-described lever if the pattern
recurs.

## Verification

- `check_activation_invariant.py 77e64a1f9..HEAD`: OK — 19 `.c` added
  == 19 `.s` deleted == 19 delinks activations.
- `check_delink_dupes.py`: OK — 81 `delinks.txt`, no duplicate `.text`
  addresses.
- `gate3.py --scope all --clean`: run ONCE, on this consolidated
  branch (per the process fix above) — all three regions SHA1 PASS.
- Research index regenerated before push.
- Each batch independently verified `git status`, per-function
  `delinks.txt` lines, and re-ran `fastmatch.py` before committing —
  no full build in any batch worktree, per the corrected protocol.
- No file-corruption or self-heal-race evidence in any of the 5
  worktrees' git history — the no-sub-agent rule held across all 5
  batches (one batch's own report mentioned using the sanctioned
  suggestion-chip tool to flag a follow-up sweep, not a prohibited
  concurrent worker; the worktree's commit history shows exactly the
  expected single commit with no anomalies).
