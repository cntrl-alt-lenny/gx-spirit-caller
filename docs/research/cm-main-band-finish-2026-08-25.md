[//]: # (markdownlint-disable MD013 MD041)

# cm-main-band-finish: the 257-320 B n=20 sample completes — MARGINAL (20.0%)

**Status:** done. Full sample: 20 candidates, 4 shipped, 16 parked, 20.0%
ship rate. Falls in the pre-registered 10-25% marginal zone. See
`codegen-walls.md` BR-4 for the permanent record; this doc carries the
per-candidate detail for the 11 processed this round.

## Recap

`cm-main-band-followthrough` (#1563) sampled n=20 at 257-320 B, fully
processed 9 (2 shipped, 7 parked), and deferred 11 as disproportionately
complex for one round's budget — explicitly refusing to report the
partial 2/9 = 22.2% as a verdict, since the pre-registered thresholds
were written against a full n=20 denominator. This round processes the
11 deferred candidates and applies those same thresholds, unchanged, to
the completed sample.

## Draft-then-verify workflow

Given the scale (11 candidates, each requiring careful assembly-reading,
prototype-hunting across the existing matched-`.c` corpus and the
`docs/research/c-match-prep/` archive, and struct-layout inference), this
round used a parallel drafting pass: 11 independent research agents each
read one candidate's raw `.s`, traced it instruction-by-instruction,
hunted down real prototypes for every callee (preferring an already-shipped
`.c`'s own definition over any guessed `extern` declaration), and produced
a complete C draft with an honest confidence rating and risk notes. Every
draft was then independently built and iterated against the real
toolchain — the drafting pass does not touch fastmatch/ninja/mwcc, only
the verification pass that follows does, keeping the actual byte-exact
check exactly as authoritative as it has been in every prior round.

The drafts' self-reported confidence was informative but not reliable
in isolation: of the two "high confidence" drafts, one shipped on the
first try (`func_ov018_021ace68`, a verbatim adaptation of an
already-matched sibling — genuinely as safe as claimed) and the other
needed 4 real iterations and still only reached 15.3%
(`func_ov020_021ad910` — the confidence rating undersold how much the
loop's strength-reduction behavior would resist source-level correction).
Two "medium confidence" drafts shipped clean on the first or second try.
Treat drafting-agent confidence as a useful prior, not a substitute for
the build.

## The 11, in full

| # | Function | Module | Size | Outcome | match% | Attempts | Note |
|---|---|---|---|---|---|---|---|
| 1 | `func_02071fb0` | main | 260 | parked | 1.5 | 1 | structural mismatch (extra stack slot in target) on top of two already-flagged unverified callee prototypes; needs deeper rework than this round's per-candidate budget allowed |
| 2 | `func_02072f00` | main | 320 | parked | 78.8 | 2 | 9x repeated 16-bit byte-swap idiom; switching every `(x>>8)\|(x<<8)` to `(x<<8)\|(x>>8)` took it from 61.2% to 78.8% (see codegen-walls.md BR-4 lever #2); remainder is a 1-register-count mismatch plus a tail-section scheduling difference |
| 3 | `func_ov002_022112f8` | ov002 | 312 | parked | 8.9 | 1 | confirmed P-20-row-offset member in one of 5 switch cases — guaranteed not to reach 100% regardless of source quality; the dispatcher's own switch-lowering also diverged from the real 2-tier compare+jump-table split on the first attempt. Given the hard ceiling, only one attempt was spent here to preserve budget for candidates with real ship potential |
| 4 | `func_ov003_021cbf08` | ov003 | 264 | parked | 27.3 | 2 | draft's own risk note flagged this function family (shared with 2 known siblings) as a suspected brief-294 reg-alloc wall; confirmed — a wholesale register-set shift (7 saved registers, different letters) persisted across 2 source restructurings with zero movement |
| 5 | `func_ov005_021aef74` | ov005 | 284 | parked | 38.9 | 4 | dispatcher/setup half matches exactly (first 22 of 71 words); the while-loop-bound computation (a shared `(1<<f8)&0x19` idiom also used correctly elsewhere in this same function) resists register-letter and instruction-scheduling fixes; one restructuring attempt actively regressed (changed the function's overall register count) and was reverted |
| 6 | `func_ov012_021ca6dc` | ov012 | 312 | **parked, 94.9%** | 94.9 | 6 | biggest single jump of the round: 10.3% -> 85.9% from modeling the `f18` 17-bit mask as real C bitfields instead of a manual `& ~0x1ffff` (codegen-walls.md BR-4 lever #1); -> 94.9% from reordering 3 statements to match field-read order; final 4 diffs are a resistant register-letter rotation in the block's tail |
| 7 | `func_ov013_021ca15c` | ov013 | 312 | parked | 2.6 | 4 | same `f18` bitfield lever applied on the first attempt (learned from #6, same round) did not reproduce the gain here — blocked by an unrelated, more fundamental register-allocation difference (2 extra callee-saved registers vs the target's stack-spill of the same two template pointers); confirms the bitfield lever fixes bitfield-mask codegen specifically, not every function touching this struct family |
| 8 | `func_ov014_021b4294` | ov014 | 292 | shipped (prior round) | — | — | listed for completeness; not part of this round's 11 |
| 9 | `func_ov017_021b40d8` | ov017 | 292 | **shipped** | 100.0 | 1 | first-try 100% match; a 6-byte draw-command record built from an already-matched sibling's proven `Packed{tag,param}` struct shape |
| 10 | `func_ov018_021ace68` | ov018 | 280 | **shipped** | 100.0 | 1 | first-try 100% match; RGB555-to-HSV decomposition verbatim-adapted from an already-matched sibling (`func_ov022_021ab4b0.c`) — confirmed byte-identical body via `diff` before building, not just claimed by the draft |
| 11 | `func_ov019_021b2938` | ov019 | 272 | parked | 55.1 | 2 | first 35 of 68 words match exactly (both VRAM-fill calls, the whole setup); the deinterleave loop's induction-variable initialization order (moving `j=0` before the early-return check, deriving `r7`/`r8` from `j` instead of independent literal `0`s) improved 49.3% -> 55.1%, remainder is the same resistant register-numbering-permutation class documented elsewhere this campaign |
| 12 | `func_ov020_021ad910` | ov020 | 268 | parked | 15.3 | 4 | drafting agent's "high confidence" (verbatim struct-offset reuse, clean control-flow trace) did not predict this: the loop's `i*2`/`i*8` array-index expressions get strength-reduced into two separate incrementing accumulator registers by mwcc regardless of whether written as multiplication or explicit shift, while the target recomputes both fresh from the loop counter every iteration — a compiler optimization-level choice that resisted 4 source-level variations, including one that fixed the function's overall register *count* (prologue now matches) without closing the remaining diff |

(Candidate #8 in the table is the prior round's ship, included only so
the numbering matches the original 20-item sample list; it contributes
nothing new this round.)

## Full n=20 result

| | n | shipped | ship rate |
|---|---:|---:|---:|
| `cm-main-band-followthrough` (#1563) | 9 | 2 | 22.2% |
| `cm-main-band-finish` (this round) | 11 | 2 | 18.2% |
| **Combined n=20** | **20** | **4** | **20.0%** |

Applying the thresholds pre-registered in `cm-main-band-followthrough`'s
own brief, unchanged: **>=25% band holds; <=10% frontier closed; 10-25%
marginal. 20.0% is marginal.**

## Two reusable levers (detail in codegen-walls.md BR-4)

1. A wide (here, 17-bit) bitfield mask written as a single combined
   `& ~constant` compiles differently from the same field modeled as
   real C bitfield members — even when the combined constant is
   algebraically identical to a chain of the narrower masks. This is a
   genuine, confirmed lever (10.3% -> 85.9% in one change on
   `func_ov012_021ca6dc`), but it is scoped to the specific bitfield
   codegen, not a blanket fix for every function sharing that struct
   (it did not help `func_ov013_021ca15c`'s structurally-identical
   field, which was blocked by an unrelated issue).
2. A 16-bit byte-swap idiom's exact operand order (`(x>>8)|(x<<8)` vs
   `(x<<8)|(x>>8)`) mattered for `func_02072f00` (61.2% -> 78.8%,
   9 occurrences, one mechanical change). This is reported as a
   single-instance finding pending a second confirming or disconfirming
   instance — the next unshipped candidate using this idiom should test
   both orders early rather than assuming one is canonical.

## Toolchain contention

`tasklist` showed 0-2 `mwcc`/`mwld`/`mwasm`/`ninja` processes at every
check this round (all quick single-file `fastmatch.py` compiles, no link
step) — no sustained CC Scaffolder contention was observed during the
drafting-verification phase. The two real `batch_sha1.py` runs and all
three region `--clean` gates were run with the toolchain otherwise idle.

## A process note worth keeping

After confirming 100% via `fastmatch.py` on both `func_ov017_021b40d8`
and `func_ov018_021ace68`, this round moved directly to the next
candidate without running the actual ship sequence (`batch_sha1.py` +
`record_shipped.py`) — a real gap caught only when cross-checking the
ledger tally against `attempts.tsv` directly before writing this doc
(`grep cm-main-band-finish` initially showed 9 rows and 0 shipped,
not 11 and 2). Both candidates were still fully recoverable (`.c` draft
and hidden `.s` sibling both still on disk) and were shipped for real
immediately after the gap was found — `batch_sha1.py` confirmed both
byte-identical against a fresh `configure.py` run, and both are recorded
in `attempts.tsv` with `result=shipped`. No incorrect claim reached this
writeup or the PR body. Recorded here as the same category of lesson as
`feedback_claimed-change-was-never-written.md`: verify the ledger
directly against what actually happened before writing up a round,
every time, even — especially — when the fastmatch result already looked
like a clean win.
