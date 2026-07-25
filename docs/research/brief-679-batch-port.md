# Brief 679 — `batch_port.py`: turnkey gated loop for the cross-region port backlog

**Queue item:** `q-batch-port` — "turn the 438-port harvest into a turnkey
gated loop." Built on `tools/batch_carve.py`'s existing Ops seam per the
queue's explicit ask.

## What shipped

`tools/batch_port.py` (PR, this brief) + `tests/test_batch_port.py` (31
tests, pure helpers + FakeOps driver tests, mirroring `test_batch_carve.py`'s
two-tier structure).

Design, in one line: reads `build/port_backlog.json`'s `sim>=0.9999` entries,
runs `port_to_region.py --json` per candidate (never writes to disk itself),
flips the target's delinks.txt header from `.s:` to `.c:` (reusing
`batch_sha1._flip_delinks` for its proven CRLF-safe in-place edit), gates
the whole batch with one `ninja sha1`, auto-commits on green, bisects and
parks the culprit(s) on red (reusing `batch_carve.bisect_plan` /
`branch_guard_message` / `GateTimeout` verbatim via a `PortOps(bc.Ops)`
subclass).

### The four must-haves, and how each was met

- **(a) branch guard** — reused `batch_carve.branch_guard_message` verbatim
  in `main()`; refuses on `main` or a detached HEAD at origin/main's tip.
- **(b) `.s` revert target must exist before gating** — see "The bug this
  brief actually found" below; the real fix ended up more subtle than the
  queue text's framing suggested.
- **(c) routing-tier suffixes in `.c`↔`.s` derivation** — `batch_sha1.py`'s
  own suffix-stripping gap was already fixed earlier this session (the
  `cm-crossregion-ports` brief). `batch_port.py` doesn't need to re-derive a
  `.s` name from a `.c` at all, which sidesteps the whole class of bug a
  different way — see "The flip, precisely" below.
- **(d) `sim == 1.0` only** — `filter_sim1_backlog()`, a 4-line pure
  function, applied before the main loop even starts (`test_sub_1_0_
  entries_excluded_before_run` pins this: a sub-1.0 sibling entry is never
  even looked at, not just skipped-with-a-reason).

## The flip, precisely (why this isn't just batch_carve with s/c swapped)

A `port_backlog.json` entry names an EUR source and a target function/
address — it does **not** name the target's current delinks.txt path.
Deriving that path by guessing a naming convention from the EUR source's
filename is exactly the bug this campaign hit repeatedly this session (see
`brief-677-crossregion-ports.md`: an EUR source's own filename convention
ported under the wrong convention because the target region's tree already
used a different one for that same address, caught only by hand across ~20
candidates). `batch_port.py` never guesses: `find_tu_header_for_addr()`
reads the target module's delinks.txt directly and takes whichever TU
header currently owns the port's target address as ground truth for BOTH
the directory and the filename stem. The routing-tier suffix
(`.legacy`/`.legacy_sp3`/`.thumb`/none) is a compiler-tier fact carried by
the EUR source instead — a `.s` file has no routing concept of its own (it's
assembled, not compiled, so there's no per-TU compiler-tier decision to
route), so `compute_port_output_path()` takes the stem from the `.s`
(ground truth for this region's naming) and the routing suffix from the EUR
source (ground truth for this function's compiler-tier requirement). Four
unit tests pin this split explicitly, including the exact brief-677 bug
shape (`test_target_naming_convention_wins_over_eur_naming_convention`).

## The bug this brief actually found (must-have (b), the hard way)

The queue text's framing of must-have (b) — "the `.s` revert target must
exist before gating, or the bisect reports a false '0 confirmed' for an
entire correct batch" — is the KNOWN `batch_sha1.py` bisection bug (this
session's `cm-crossregion-ports` brief re-confirmed it directly: reverting
during bisection only flips delinks.txt text, never restores a deleted
physical `.s`). The obvious-looking fix is "just never delete the `.s`
until the whole batch is proven green and commits." That's what v1 of
`batch_port.py` did.

**It's wrong**, and the first real gated run against the live USA backlog
(batch of 10, `--limit 10`) proved it immediately: all 7 staged candidates
bisected out as culprits, one by one, down to a "0 confirmed" report — the
EXACT failure shape the must-have warns about, but produced by the fix
itself rather than avoided by it. Reproducing one candidate by hand and
reading `ninja`'s raw error text (the tool's own `gate()` only returns a
bool, so the driver never surfaces *why* a gate failed) found the real
cause: `ninja: error: build.ninja:36403: multiple rules generate
build/usa/src/usa/main/func_02000e70.o`. dsd's per-TU ninja-rule generation
keys the object filename off the function's **stem**, not its extension —
so a `.s` and a `.c` with the same stem sitting in the tree simultaneously
makes `ninja` refuse the whole build outright, before a single line of
actual C ever gets compiled. Leaving the `.s` "just in case" doesn't
protect a revert; it guarantees every gate in the batch fails, for every
candidate, regardless of whether any of them are actually wrong.

The real fix: cache the `.s` content in memory (mirrors
`batch_carve.Ops`'s own `_reapply()` pattern for its freshly-carved `.s`
content) *before* touching anything, delete the `.s` immediately once the
delinks.txt flip succeeds, and restore it from the cache on any revert.
This satisfies the must-have's actual intent (a revert must always produce
a buildable `.s`) without the two files ever coexisting on disk during the
gate window. `test_revert_leaves_s_file_buildable` pins the end state (not
the intermediate one, which is deliberately different from what the
must-have's literal wording suggested).

## Real gated runs (the queue's own gate criterion)

Two live batches, `--batch 10 --limit 10`, one per region, run against the
actual `build/port_backlog.json` on this branch:

| region | staged | shipped | refused (conf. floor) | gate-fail (bisected) | commits |
|--------|--------|---------|------------------------|------------------------|---------|
| usa    | 7/10   | 6       | 3                       | 1 (`func_020139a0`)    | 3       |
| jpn    | 7/10   | 6       | 3                       | 1 (`func_020139a0`)    | 3       |

Both regions: 3 of the 10 candidates were refused pre-stage (a callee/data
symbol below the HIGH confidence floor — never touched disk, never gated).
Of the 7 staged, bisection split the batch into halves of 3/2/1/1, the
3+2+1 = 6 clean ones each auto-committed the moment their sub-batch gated
green (3 separate commits per region, matching `batch_carve`'s own
commit-per-green-subset behavior), and `func_020139a0` was correctly
isolated and parked in both regions identically — it's a **known** issue,
not a new one: the same fingerprint-sibling-confusion class this session's
`cm-crossregion-ports` brief already root-caused (`find_region_siblings`
occasionally prefers a near-identical-shape wrong sibling over the true
match). After the park, `func_020139a0.s` is back exactly where it started
in both regions — confirmed directly (`git status` clean, `.s` present,
delinks.txt still says `.s:`) rather than just inferred from the report.

12 total port commits landed (6 USA + 6 JPN, all `src/*/main/`), each
individually `ninja sha1`-gated. A subsequent `python tools/gate3.py
--scope all --no-tests` confirms all three regions (EUR untouched, USA,
JPN) still gate green.

**Deliberately not drained further.** The `sim==1.0` backlog is still
~244/region on this branch — essentially unchanged from the original
census — because this session's earlier `cm-crossregion-ports` brief
(PR #1335, 234/region shipped) lives on a sibling branch that hasn't merged
to `main` yet; per the one-branch-per-queue-item discipline this branch was
cut fresh from `origin/main` and can't see that work. Running `batch_port`
further here would duplicate PR #1335's harvest and create needless
delinks.txt merge-conflict surface against it for zero added proof value —
the queue's gate criterion ("≥1 batch per region") is about validating the
*tool*, which the runs above do concretely (real auto-commit of green,
real bisect-isolated culprit, real clean revert). Once both PRs land,
`batch_port.py` is the standing turnkey tool for whatever `sim==1.0`
backlog accumulates going forward as more EUR functions get matched — no
hand-porting required.

## Gate

- `python -m pytest -q tests`: 2943 passed, 13 skipped, 2 failed (both
  `test_m2c_feed.py`, pre-existing — confirmed via `git stash` that they
  fail identically with none of this brief's changes present; a missing
  `gcc` on this machine's `PATH`, unrelated to this work).
- Two real gated runs (table above), one per region, auto-commit of green
  + bisect-isolated + cleanly-reverted red, confirmed directly against the
  live tree state (not just the tool's own self-report).
- `python tools/gate3.py --scope all --no-tests`: 3-region PASS.
