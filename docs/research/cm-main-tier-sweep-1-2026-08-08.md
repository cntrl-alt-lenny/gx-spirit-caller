# cm-main-tier-sweep-1: first worktree-parallel sweep of `main`'s small guard-chain tier — 71/100 shipped (2026-08-08)

## Purpose

Sweep-17 closed at 42/100 on `ov002` and is the campaign's best round
to date; `attempts.tsv` is mid-repair (PR #1467, open/changes-requested)
and cannot safely drive an `--exclude-attempted` selection against
`ov002` right now — it would record never-attempted candidates as
`parked` and writes a module key (`overlay002`) the selector can't
match (`ov002`). This round deliberately sweeps a different module,
**`main`**, selected from a committed worklist
(`docs/research/campaign-analytics/main-small-tier-worklist.md`)
instead of the ledger, so the round cannot be poisoned by the repair
in flight. `main` is also the one module where `park_one.py`'s
module-key bug does not bite (writer and consumer both say `main`).

**Path discrepancy, flagged transparently.** Both the dispatch message
and the queue item's own text (`docs/queue/claude-decomper.md:984`)
cite the selector as `docs/research/main-small-tier-worklist.md`. That
path does not exist; the real file is one directory level deeper, at
`docs/research/campaign-analytics/main-small-tier-worklist.md`. Confirmed
via `git log --all -- "*worklist*"` and cross-reference with the queue
header before proceeding — this is a documentation typo present in two
independent places, not a missing artifact, and the real file's content
matches the described selector shape exactly (1,640 rows, S-/D- split,
rank/address/size/shape columns, mechanical selection criteria in its
own header).

## Result: 71/100 shipped, 6,720 bytes — well above the 35–55% floor estimate

| Batch | Shipped | Bytes | Parked | Notes |
|---|---|---:|---|---|
| 1 | 14/20 | 1,452 | 6 | 2 compound-compare walls with no working recipe (→ P-33); `long long`-disguised-as-two-ints lever (→ C-70) |
| 2 | 14/20 | 1,304 | 6 | Leaf-function legacy-tier routing lever (→ C-71); new "guard-chain double-deref +1 register" wall family (3 members) |
| 3 | 16/20 | 1,432 | 4 | Best batch; volatile-for-reload-after-store lever; address-taken-local stack-span lever (→ C-74) |
| 4 | 16/20 | 1,316 | 4 | Non-adjacent OR-of-equality wall (→ P-32); signed/unsigned ASR-vs-LSR lever; cross-region same-address symbol collision confirmed real |
| 5 | 11/20 | 1,128 | 9 | Canary lever's structural half confirmed 5/5, but its register-choice half failed 5/5 (→ P-30); new predication-resistance wall (→ P-31) |
| Canary | 1/1 | 88 | 0 | `func_0204037c`, 100% first attempt; seeded the named-base-variable lever |
| **Total** | **71/100** | **6,720** | **29** | Prior worklist floor estimate (brief 661) was 35–55% |

**Read this rate with its context, not as "main is easier than ov002."**
The worklist's own mechanical criteria front-load size (≤128B priority
bands) and shape (trivial stubs and tail-call forwarders first) — and
this round's 100-candidate pool drew **zero** trivial-stub or
tail-call-forwarder rows from the `D-` (Decomper) half of the worklist
(confirmed by grep before pool construction), because none exist in
that range. Every candidate this round was shape-classified "guard
chain," 40–128B — a specifically homogeneous, small, pre-filtered
population by the worklist's own design, not a random cross-section of
`main`. The 71% figure describes this tier, not the module as a whole.

## Preflight and canary

Preflight followed the queue header's WORKTREE-PARALLEL SWEEP PROTOCOL.
The candidate pool was built once (`build_pool.py`, scratchpad) by
parsing the worklist's `D-` rows and cross-referencing every address
against the live `config/eur/arm9/delinks.txt` (not a stale snapshot),
keeping only rows still `.s:`. An early version of this script stripped
leading zeros from 8-digit addresses before zero-padding them back
inconsistently, producing zero matches on the first run — caught before
use, fixed, re-verified against a handful of addresses by hand.

The canary (`func_0204037c`, guard chain, 88B) ran through the full
loop — route, draft, `fastmatch.py --verbose`, ship — directly in the
`decomper` checkout before any batch worktree was created, as required.
It matched 100% but only after discovering that a struct accessed
through a global handle at two offsets individually exceeding `0xFFF`
(the ARM LDR immediate limit) needed an **explicit named local variable**
for the shared base pointer — direct offset expressions compiled
correctly in structure but left the shared base in the wrong register.
This became the round's seed lever (documented in each batch's dispatch
prompt) — later shown by batch 1 and batch 5 to be real but **not
universal**: see the P-30 counter-example below.

**Process incident, caught and fixed twice.** The canary shipped its
`.c` without deleting the superseded `.s` — the exact "orphaned .s
file" bug sweep-17 batch 4 discovered and documented as a process
lesson one round ago. It went unnoticed through `fastmatch.py`'s
isolated per-TU build, and was only caught when `configure.py eur &&
ninja delink` was run in all 5 freshly-created batch worktrees (which
had all branched from the buggy canary commit) — all 5 failed
identically with `ninja: error: ...multiple rules generate
build/.../func_0204037c.o`. Fixed on the main `decomper` checkout
first, then independently in each of the 5 worktrees (each had already
checked out the buggy commit and needed its own commit carrying the
same fix — not something a later merge could inherit automatically).
Flagged transparently at the time: this is the same mistake documented
as a lesson from the immediately preceding round, reproduced in the
very next one. Every batch's dispatch prompt carried an explicit,
detailed warning about this exact failure mode as a direct result.

## Lever and wall findings

9 new catalogue entries were added to `docs/research/codegen-walls.md`
this round: **C-70** through **C-76** (7 new levers) and **P-30**
through **P-33** (4 new wall entries), plus a boundary-condition
extension appended to the existing **C-55** entry. Summary (full detail
in the catalogue itself):

- **C-70** — a `cmp;cmpeq` pair sharing a materialized-zero register on
  adjacent even-offset fields is often a disguised 64-bit `long long
  == 0` compare, not two independent `int` guards.
- **C-71** — a leaf function (no push/pop at all) can still require
  `.legacy.c` tier routing; the 3-tier discriminator gives no signal
  with no prologue/epilogue to read. Mechanism: mwcc 2.0 peephole-
  optimizes a non-rotatable AND-immediate mask into a shift-pair that
  mwcc 1.2 doesn't perform.
- **C-72** — a goto-target label's physical position in the source
  must match the original's actual block address order, not just "a
  goto exists with the right polarity" — hit independently by 3
  batches, 8 instances. Includes the mirror-image over-merging symptom
  (two textually-distinct `return` statements needed when exit blocks
  are physically separated in the target).
- **C-73** — an explicit `volatile` qualifier on the specific struct
  member (not the whole object) is needed to survive mwcc's CSE, for
  both a repeated read with zero aliasing risk and a read immediately
  after a store.
- **C-74** — an address-taken local passed to an opaque callee must be
  sized to the callee's full reserved stack span, not just the bytes
  the caller visibly reads back, or the "missing" bytes fold into an
  extra push register and cascade into a different register allocation
  throughout the function.
- **C-75** — pure statement-order (scheduling) sensitivity, with no
  register/type/control-flow change, can be the only lever a function
  needs; reorder C statements to mirror the target's exact instruction
  sequence.
- **C-76** — signed/unsigned typing controls ASR-vs-LSR shift selection,
  and can be needed at only ONE use site (a comparison) while a related
  idiom elsewhere (a modulo pattern) needs to stay signed.
- **C-55 extension** — the goto-to-distinct-labels fix for two
  same-action guards has a hard boundary: it works for different-
  variable guard pairs but not for repeated-equality tests on the same
  already-loaded register (see P-33).
- **P-30** (tentative) — the canary lever's named-base-variable pattern
  reliably reproduces structure but not which physical register the
  base lands in; 5/5 hit rate in batch 5, with a clean batch-1
  counter-example where the trigger didn't fire at all.
- **P-31** (tentative) — a mirror image of C-55: mwcc fully if-converts
  a guard that no source restructuring (goto, switch, ternary,
  accumulator) can force into a real branch.
- **P-32** — an OR of two NON-ADJACENT equality values resists
  suppression into genuine branches, compiling to a sticky CMP/CMPNE
  predicated form regardless of phrasing; the adjacent-value case in
  the same batch matched instantly with no special handling.
- **P-33** (tentative) — same-register repeated-equality compound-
  compare-merge; the C-55 boundary case above, no working recipe found
  across 2 members / 7 combined restructuring attempts.

The codegen-walls.md summary table was also corrected in passing: it
had undercounted by omitting P-27/28/29 from the index table after
they were added as body entries in sweep-17 without a table update.
Recounted directly against the file's body entries rather than
propagated from the stale figure — 28 live P-entries after this
round's additions (was stated as 21, actually 24 even before this
round's own additions).

## Ledger backfill — the batch-worktree `attempts.tsv` gap reproduced

Every one of the 5 batch branches showed a **zero-line diff** against
`attempts.tsv` — the same batch-worktree ledger gap sweep-17's
completion pass found and manually backfilled one round ago
(`park_one.py` records correctly for single-lane runs; batch-worktree
runs still do not, independent of the separate module-key bug PR #1467
targets). Rather than wait for the Codex Scaffolder's ledger fix,
all **101** attempts this round (1 canary + 100 batch candidates — 71
shipped, 29 parked) were reconstructed directly from the 5 batch result
reports and appended to `attempts.tsv`, with every byte size
independently recomputed from `delinks.txt`'s own start/end spans — not
copied from any batch's self-report — after a real bug in the
reconstruction script's own extension-parsing regex was caught and
fixed first (greedy backtracking let a bare `.c` alternative match
before `.legacy_sp3.c`/`.legacy.c`, silently mis-parsing every tiered
shipped file's tier; fixed by switching to a lazy prefix match before
trusting any of the 71 shipped rows' tier field).

## Verification

**Merge.** All 5 batch branches merged `--no-ff` into
`claude/cm-main-tier-sweep-1` with zero conflicts (all touch the same
shared `config/eur/arm9/delinks.txt`, but at disjoint line ranges).
`.c` files added, `.s` files deleted, and `delinks.txt` activation
flips all agree exactly: **72 == 72 == 72** (71 batch ships + 1
canary). `check_delink_dupes.py`: OK, 81 delinks.txt files, no
duplicate `.text` addresses. `check_activation_invariant.py`: OK.

```
range: origin/main..HEAD
function .c added:       72
function .s deleted:     72
delinks activations:     72
data .c additions:       0 (informational)
classification sources: symbols=72
check_activation_invariant: OK
```

**Gate — `gate3.py --scope all --clean --invariants`.** The background
task notification reported the wrapper's own exit code (0), not
gate3.py's — the log itself showed a real failure at first pass:
`tests/test_generate_state_table.py::TestCommittedTableIsCurrent::
test_check_passes_on_the_committed_table` failed because
`docs/state-table.md` was stale relative to the 72 newly-shipped
functions. Fixed with `python tools/generate_state_table.py` (see
before/after below) and re-verified with a second `--scope tests` pass:
`3214 passed, 15 skipped, 63 subtests passed`, `GATE PASS`. The 3
per-region sha1 lines below are from the original full `--clean` pass
(state-table.md is doc-only and does not feed the ROM build, so they
remain valid ground truth):

```
gx-spirit-caller_eur.nds: OK
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

The `[invariants]` block's ~11,800 placeholder-symbol-name warnings are
the pre-existing advisory check (`--invariants`, explicitly documented
as "never gates" — see gate3.py's own help text) and are unrelated to
this round's changes.

**`docs/state-table.md` before → after:**

| region | natural-C before | natural-C after |
|---|---:|---:|
| eur | 340,770 B (14.28%) | 347,490 B (**14.56%**) |

Shipped `.text` 344,674 B → 351,394 B (+6,720 B, exactly matching the
71 batch ships' + 1 canary's summed byte total — independent
cross-check that the merge and the state-table generator agree).

**`wall_aware_headroom.py --json` before → after** (measured via a
throwaway detached-HEAD worktree at the pre-round merge-base commit
`605e378ec`, removed after use):

| scope | before | after | delta |
|---|---:|---:|---:|
| project-wide `total_candidate` | 5,079 | 5,007 | −72 |
| `main` module `candidate` | 2,186 | 2,114 | −72 |
| `main` module `unknown` | 2,132 | 2,060 | −72 |

All three deltas land on exactly 72 — the full shipped count,
independently cross-checked against both the activation invariant and
the state-table byte delta.

**Working tree hygiene.** `gate3.py --clean` deleted the 3 committed
heatmap SVGs under `assets/` as a known side effect (not a real
change) — restored with `git restore` before committing so the PR diff
stays scoped to this round's actual work.

## Partition (100 candidates, 5×20, main module, `D-` worklist range)

Full per-address partition with sizes, shapes, and worklist ranks is in
each batch's own dispatch record; the shipped/parked roll-up per batch
is the table above. Every one of the 100 addresses is now recorded in
`attempts.tsv` (module `main`, brief `cm-main-tier-sweep-1-batch{1-5}`
or `cm-main-tier-sweep-1-canary`) with a ground-truth byte size,
result, and — for parks — a match percentage and wall classification,
closing the same evidence gap sweep-17 needed a completion pass to
close.
