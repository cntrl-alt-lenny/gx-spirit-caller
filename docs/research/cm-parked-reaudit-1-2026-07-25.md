# cm-parked-reaudit-1: full-toolkit re-audit of C-34 parks (2026-07-25)

Re-audit of 30 previously-parked functions cited under codegen-walls.md's
C-34 ("address-CSE duplicate pool slot") taxonomy, plus the marquee P-16
candidate — this time applying the FULL current toolkit (typed-struct
access, trampoline-arity checks, tier routing, branch-order/predication)
rather than the single struct-member lever that drove cm-overlay-small-
sweep's reversals, per this item's own explicit instruction not to
assume that one lever generalizes.

**Result: 13/29 attempted shipped (44.8%)**, 1 candidate deferred as
out-of-scope (`func_ov002_022b595c`, see below). Well above the item's
own >25% "restocks itself" threshold — **this lane restocks itself.**
A likely batch 2 should draw from the wider C-34 corpus (58 members
total per the original candidate census; this pass sampled 30) using
the corrected lever below from the start.

## What actually happened (this is the interesting part)

Three parallel worktree-isolated agents (the now-standard pattern, see
cm-overlay-small-sweep) each took ~10 candidates. The three batches
produced genuinely different, initially-contradictory results, and
reconciling them is the real finding:

- **Batch A** (P-16 + 9 main-region C-34): **6/10 shipped**, using a
  technique NONE of the batches were explicitly pointed at —
  **literal-address-cast**. Also produced the P-16 partial-crack (see
  below) and correctly identified 2 candidates as mistagged (only one
  real pool word, not true C-34).
- **Batch B** (4 main + 1 ov001 + 5 ov002): **3/10 shipped**, using
  the pre-existing **C-27 alias trick** (`symbols.txt` + BSS split)
  properly applied to C-34 targets for the first time. Correctly
  triaged 5 giant, never-before-attempted functions (1380–3172
  instructions each, 2 independently P-13/C-39c-walled) as out of
  scope for a lever-application pass.
- **Batch C** (ov002/ov004/ov006/ov008): **0/10 shipped on the first
  pass.** This agent tried typed-struct-member access (the lever that
  drove cm-overlay-small-sweep's reversals) and a forced-register-
  reload diagnostic, both failed, and it concluded C-34 is a genuine
  **toolchain-level wall** — mwasmarm dedupes the literal pool by
  symbol+addend identity *after* mwcc emits code, independent of C
  source form or register allocation. It even checked two of
  cm-overlay-small-sweep's own "confirmed reversal" citations directly
  against their original delinked objects and found **neither actually
  had a duplicate pool word** — they were single-`ldr` cases misfiled
  as C-34 all along.

Batch C's mechanism diagnosis was correct but its generalization was
premature — it hadn't tried the technique that actually works. Once
batch A's and B's results came in, batch C was resumed **in the same
worktree** with the two proven techniques and specific per-candidate
guidance (which of its 9 remaining candidates were offset-0-both-sites
vs. mixed-offset, from its own first-pass diagnostic notes). **Retry:
4/9 shipped.** The corrected framing is now in codegen-walls.md:
typed-struct-member access alone does not split a duplicated pool
slot, but giving the two access sites genuinely distinct *symbol*
identities does — because mwasmarm's dedup is symbol-based, not
value-based or form-based.

## The two working techniques

**Literal-address-cast** (offset-0 fields only): cast the symbol's
raw numeric address to the target pointer type instead of referencing
the symbol — `((T *)0x022cacc0)->field`, not a `volatile` qualifier
trick. mwcc pool-materializes a literal integer differently than a
symbol reference; mwasmarm doesn't dedup a literal against a symbol.
Casting a literal plus a nonzero offset lets mwcc fold the offset into
the literal itself, losing the effect — offset-0 only.

**Registered alias** (any offset): a second symbol name for the same
address, wired via `symbols.txt` **and** a matching zero-size BSS
split (symbols.txt alone is metadata-only and link-fails — this
tripped up two different sub-agents independently before landing on
the correct two-file recipe). Works regardless of offset since it
sidesteps mwasmarm's symbol-based dedup entirely rather than relying
on the literal-vs-symbol distinction.

Full mechanism, code examples, and the complete "why previous attempts
failed" table are now in `docs/research/codegen-walls.md`'s C-34
entry.

## P-16 partial crack (not shipped, but reclassified)

`func_ov002_02269534`, the marquee P-16 candidate ("repeated-address
rematerialization after a call"), had its park note quote the exact
rejected pointer-cast form verbatim with no typed-struct attempt on
record. Batch A confirmed the pool-fold this wall describes is fully
fixable via real struct-member access (`D016C->f_d20]`, zero extra
pool words) — got from a 1.46% floor to 50.36%, with 5 of 7 persistent
registers now exactly correct. What remains is a separate 2-instruction
scratch-register-pairing residual, resistant to 4 different
restructurings — looks like an independent instruction-scheduling wall,
not further evidence against the pool-fold fix. codegen-walls.md's P-16
entry is updated from "PERMANENT" to "pending-scheduling-lever."

## Other findings

- **2 mistagged C-34 citations** (`func_020037d0`, `func_02003d98`):
  the corpus census shows `.word=1` (one pool word) for both — the
  real issue is a jump-table dispatch register-allocation mismatch,
  unrelated to pool duplication. Left parked, header should be
  corrected in a future doc pass.
- **1 composite wall** (`func_02021b38`, C-35): pool-dup fix plus a
  push-list fix took it from ~10% to 37.93%; residual is a genuine
  loop-strength-reduction + store-reordering wall, per this item's own
  guidance not to over-invest once the pool fix alone doesn't finish a
  composite pick.
- **1 size-forced exception, deferred**: `func_ov002_022b595c`'s two
  pool references are 6088 bytes apart, beyond ARM's ±4095B
  `ldr [pc,#imm]` range — its dual pool islands may not need any
  anti-CSE trick at all, just a faithful from-scratch decompile. At
  2801 lines it's its own project, not a slot in this sweep.
- **Shared-worktree infrastructure hiccup**: batch C's first-pass
  worktree was found deleted out from under it when resumed for the
  retry (this repo has other cooperating agent sessions sharing the
  same underlying repo — see the `shared-worktree-git-race` lesson
  from an earlier campaign). The agent correctly stopped and reported
  rather than guessing or operating against the shared `brain/integ`
  branch it found in the wreckage; no work was lost since that batch's
  first pass had already reverted cleanly to a 0-diff state before the
  retry began. Fresh worktree resolved it. Batches A and B's
  uncommitted ships were committed to their own worktree branches
  immediately upon report, before any consolidation work, specifically
  because of this risk.

## Verification

3 worktree branches merged via `git merge --no-ff` into
`claude/cm-parked-reaudit-1` — zero conflicts despite 3 batches
independently touching `config/eur/arm9/delinks.txt`. Sanity check:
13 new `.c` files == 13 deleted `.s` files == 13 flipped `delinks.txt`
lines, nothing orphaned. 3-region `gate3.py --scope all --no-tests`
PASS (see PR for full log).

## Verdict

**44.8% hit rate (13/29 attempted) — this lane restocks itself.** The
corrected distinct-symbol lever is now documented and should be tried
first on any future C-34-tagged candidate, ahead of the raw-`.s`
explicit-pool-words recipe. Recommend a batch 2 drawing from the
remaining ~28 untried C-34 corpus members plus a second confirmed
instance of P-16's scratch-register-pairing residual, if one turns up,
to determine whether that's a real independent wall worth its own
taxonomy entry.
