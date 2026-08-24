# State of play

Churn-heavy brain log. Split out of `AGENTS.md` so the manifest stays
stable while this file turns over every working chunk.

The brain updates this file at the end of every session so the next
brain (possibly on a different machine or LLM) can catch up in under a
minute. Keep it short. If you're the brain reading this cold: `git
log --oneline -20` and the open-PR list fill in whatever this misses.

**Round 0822b (2026-08-22, Windows PC, brain=Fable 5) — owner-approved hardening
package, no lane dispatch (all four mid-flight).** cntrl_alt_lenny reviewed the
brain's six-item hardening proposal and approved all of it. Executed this round:
(1) **`unittest` is now a REQUIRED check on every PR** — #1531 unfiltered
`tests.yml`, added the context to `required-checks.txt` and the live
`main-protection` ruleset; `check_ci_contract.py --verify-ruleset` clean. The
machine-local-SHA class from #1520 now fails in CI, not at the brain's gate.
(2) **[`docs/dispatch-log.md`](dispatch-log.md)** — one row per round: host,
model, lanes, transcript location. Closes the machine-locality gap structurally;
appending a row is now part of every seeding PR (see durable convention 5).
(3) **[`docs/research/post-small-pool-strategy.md`](research/post-small-pool-strategy.md)**
— decision rules pre-staged for `cm-main-exploit-drain-2`'s boundary result, so
the fleet redirects the day it lands. (4) Three queue seeds: `cm-progress-dashboard`
(CC-S), `q-make-kickoff-generator` (CX-S, after pool-freshness),
`q-worktree-gc` (CX-D). (5) `q-unittest-required-evidence` PARKED as superseded
by the executed toggle. (6) Local worktree GC on the PC (registered+merged only;
orphaned dirs reported to the owner, never `rm -rf`'d).

**Last updated:** 2026-08-24 — **(Windows PC, brain=Opus 5; roster unchanged.)
Round 0824: eleven PRs merged and the campaign reached a real inflection. The
193-256 B band came back 0/20 at MATCHED effort, so the small-code frontier is
closed on evidence rather than on a confounded number. The data pool is the
campaign's remaining axis — and it turns out to need a verifier before most of
it can ship.**

Merged **#1542** and **#1544** through **#1553** — eleven PRs. Closed **#1534**
(superseded by #1542). The Codex Decomper cleared all
seven of its items; the Codex Scaffolder cleared one and correctly paused.

✅ **Transcript audit executed in full** — all four lanes on this host, both
Claude sessions via `mcp__ccd_session_mgmt__*`, both Codex lanes from
`~/.codex/sessions/**/rollout-*.jsonl` by mtime. It changed two outcomes.

**THE HEADLINE — the cap is real, and this time the number can be spent.**
`cm-main-boundary-rerun` (#1545) re-tested the 193-256 B slice with a **fresh
20-candidate sample, zero overlap with #1536's 40**, under the full 2-4-iteration
protocol. Result: **0/20**. Brain-verified against the ledger: 20 rows, all
parked, sizes 196-256 B (no band drift), median `match_pct` **5.2%**, 16/20 below
50%, **8/20 at flat 0.0%**, 2 above 85%.

Read that against #1536's Part 2 (median 12.9%): **matched effort made the
numbers worse, not better.** Different samples, so not a controlled comparison —
but an under-iteration artifact would have improved under more iteration, and
this did the opposite. Combined with the ≤192 B pool now standing at **0
candidates**, `post-small-pool-strategy.md`'s **Outcome B** is the honest read.

The lane also declined to lower its own bar: it hunted **10 extra candidates**
looking for a clean canary ship, never found one, and said so plainly rather
than relaxing the criterion. It flagged that
`check_activation_invariant.py` correctly refuses a vacuous pass on a 0-ship
round. And it documented a new wall, `P-20-mode-switch-selector`, on two
independent confirmations. P-20 row-offset is now **20 consecutive hits across
three rounds, zero ships**, cohort 55.

**#1547 `cm-restock-carve-11` — a 1.4% result that is the round's second-best
piece of work.** 46 of 3,187 symbols / 1,060 B shipped (brain-verified: 23 files,
46 declarations, 1,060 declared bytes, exact). The number is small because the
lane **tested an assumption instead of inheriting it**, and the test broke EUR:
its full 31-window tranche failed EUR SHA1 with a **93 MB divergence** and a
ROM-header ARM9-size shift — a file-layout signature. It bisected to the 8
differing-size windows, root-caused it by standalone compile plus
`objdump -h`, and found that **`char[N]` globals initialised from string
literals compile to their OWN `.data` section per declaration**, not one merged
section with internal offsets. The alignment-wall recipe's "in-section offset"
language describes struct-typed globals and does not describe this pool; the
lane corrected that doc in the same PR. It then shipped only the 23 verified-safe
same-size windows. Canary-then-tranche discipline working exactly as designed.

**The data lane's real lever is now sized:** 576 windows / **3,069 symbols /
66,096 B** are *geometrically* composable but blocked behind the standing wave-4
rule that an n>=3 composed group must be compiled and its `.o` symbol table
inspected before it is trusted. Nobody will do that 576 times by hand.
`cm-restock-carve-12` is rewritten to build that verifier and drain what passes.

**Codex Decomper: 7 for 7, and one of them found a real latent bug.**
`q-worktree-gc-mac-parity` (#1552) confirmed the failure the item predicted —
the keep-set was Windows-only, so `codex-decomper-queue` and
`codex-scaffolder-queue`, the two **live Mac lanes**, classified as REMOVABLE.
On a Mac, `--prune` would have deleted working lanes. Caught before anyone ran
it there. `q-ledger-effort-column` (#1544) added the `attempts` column
append-safely — brain-verified all **1,735 existing rows blank, none zero**,
which is the distinction that matters. `q-tentative-wall-audit` (#1548) promoted
exactly one wall (P-33, three members, bidirectional) and left eight tentative
rather than reaching for tag matches.

⚠️ **Brain finding against a merged tool — two of #1546's three "contradictions"
are false positives.** The contradiction audit infers event sequence from **row
order**, and row order is not chronology for the **485 of 1,735 rows** carrying
the backfilled `PR#<n>:<sha>` provenance from `q-ledger-ship-coverage`. Both
flagged `parked after shipped` groups have the *park* at the **lower PR number**
(#1414) — ordinary park-then-ship, not a defect:

```text
main/0x02033b60    shipped PR#1435 (row 566)   parked PR#1414 (row 583)
ov002/0x021b34f4   shipped PR#1425 (row 444)   parked PR#1414 (row 628)
```

Merged anyway and safe to merge: `--check` exits 1 but is **wired into no
workflow**, and the tests use synthetic fixtures rather than asserting zero on
the live ledger, so it is advisory-only. `q-ledger-chronology` is seeded to use
the PR number as the ordering key and to fail toward AMBIGUOUS rather than
CONTRADICTORY when sequence cannot be established.

**Codex Scaffolder paused correctly, and its paused work was one command from
destruction.** #1542 rescoped the pool-freshness tool (all-modules default;
live figures `<=192 B = 0/0 B`, `193-256 B = 224/50,548 B`, `main = 99/22,432 B`),
superseding #1534. It then **stopped before item 2** because that item's own spec
says not to build against an unmerged interface — the right call. But the
generator was already written and gate-passing (**8/8 lane-host emissions clean,
sabotaged establishment REFUSED**) and sat **uncommitted in `kb-types`**: 199
lines of `make_kickoff.py` plus 60 of tests. The standard preflight opens with
`git reset --hard`, which would have deleted it. Brain took a backup before
touching anything and the next dispatch commits it first. **New standing rule:
when a lane reports paused-but-implemented work, verify what is uncommitted in
its worktree BEFORE writing a kickoff that resets it.**

**Last updated (previous):** 2026-08-22 — **(Windows PC, brain=Opus 5; roster unchanged.)
Round 0822c: all four lanes delivered, eight PRs reviewed, seven merged. The
boundary experiment came back 0/40 and the lane disclosed the confound that makes
it uninterpretable — so it is being re-run at matched effort rather than acted on.
The data pool is now the campaign's largest measured frontier and it is
shipping.**

Merged **#1526**, **#1528**, **#1529**, **#1530**, **#1532**, **#1535**, **#1536**.
**Held #1534.** Closed **#1520** (superseded by #1530).

✅ **Transcript audit performed in full this round** — all four lanes ran on this
machine, so control 12 was actually executable for the first time since 0817.
Both Claude sessions read via `mcp__ccd_session_mgmt__*`; both Codex lanes read
from `~/.codex/sessions/2026/08/22/rollout-*.jsonl` located by mtime and parsed
in Python. This is exactly the gap `docs/dispatch-log.md` was created to close
last round, and the log's 0822c row records it.

| Lane | Session located | Caveat found in transcript but NOT in the PR title | Reconciled |
|---|---|---|---|
| CC Decomper (#1536) | ✓ | **the round's headline is confounded** — see below | ✓ |
| CC Scaffolder (#1526) | ✓ | none; report matched branch exactly | ✓ |
| Codex Decomper (#1528/#1529/#1532) | ✓ | left its own `q-batch-sha1-stale-s` marker at CLAIMED; the next branch corrected it | ✓ |
| Codex Scaffolder (#1530/#1534/#1535) | ✓ | **refused to report QUEUE-EMPTY** when a re-claim made it look empty, and undid the accidental claim | ✓ |

**#1536 `cm-main-exploit-drain-2` — 0/40, and the lane told us why that number
can't be spent.** Part 1 finished the ≤192 B tail: 5/32 shipped, 608 B. Part 2
ran the falsification test on the 193-256 B slice: **0/40**. Brain-verified
mechanically — 5 `.c` added == 5 `.s` deleted == 5 activations, 72 ledger rows
(5 shipped + 67 parked), per-brief split 31 + 1 canary + 40 exactly.

The lane then disclosed, in the PR body *and* the writeup, that **Part 2 got
materially less iteration than Part 1** — mostly one fastmatch attempt each
versus Part 1's 2-4 and versus the protocol #1524 used to reach 73% — and called
its own 0% *a lower bound, not a measurement*. It declined to invoke
`post-small-pool-strategy.md`'s Outcome B on evidence it knew was confounded.
That is the correct call and it is why the memo exists rather than a reflex.

**Brain's independent read of the round's own ledger, which partly answers the
question the lane thought it couldn't:**

| | n | median `match_pct` | ≥85% | <50% |
|---|---:|---:|---:|---:|
| Part 1 (≤192 B tail, 2-4 attempts) | 27 | 17.8% | 2 | 19 |
| Part 2 (193-256 B, ~1 attempt) | 40 | 12.9% | 1 | 36 |

Under-iteration would leave a pile of high-percentage near-misses that one more
pass closes. It doesn't — 36 of 40 sit below 50% and exactly one is above 85%.
The bias also runs *against* that reading: Part 1's figures are best-of-several
while Part 2's are best-of-one, so Part 1 is flattered and the gap is still only
~5 points. Caveat stated plainly: `match_pct` is agent-reported, not
tool-derived (`park_one.py` takes it as a free-text argument) — it is evidence,
not proof; what makes the *comparison* usable is that both arms were recorded by
one lane under one convention. **Read together: the evidence leans toward the cap
being real, and no one should spend the 0% until it is re-run clean.**
`cm-main-boundary-rerun` does exactly that — n=20, Part 1's protocol, arm-blind
where batching allows, thresholds stated in advance.

**Brain correction at merge:** the writeup's prose said the P-20 wall took 9
Part 2 hits for 16 total. The round's own ledger says **8**, for **15** (7 + 8),
and `codegen-walls.md` says 2 re-confirmations + 13 new for a cohort of **50** —
which is internally correct. Only the prose was off; corrected in place. The
P-20 reproduction itself is the round's one unconfounded result and it is a
strong one: 15 hits, zero ships, zero exceptions.

**#1526 `cm-restock-carve-10` — the data pool is real, reachable, and shipping.**
Brain-verified: **739 new `src/main/data/*.c`, declared array bytes summing to
exactly 15,732**, 748 files total, zero deletions, `typed_array_bytes` delta
reconciling to the same figure. The `data_size_of` extension is opt-in and the
lane checked all 16 real `build_call_graph` call sites stay byte-identical by
default — the right way to widen a shared tool. `screen_names_against_src` is now
code, not prose.

**And the fourth consecutive inherited-count correction.** `cm-restock-carve-8`'s
~9,690-symbol / ~227,820 B figure is superseded by the lane's own census:
**5,826 symbols / 215,668 B**, of which **5,751 / 213,220 B (98.7%)** have a real
data-attributed reader and only **75 / 2,448 B** are genuinely reader-less. The
next two tranches are sized by the same census — 3,187 string-shaped / 68,613 B
needing TU composition (P-50 live), 1,825 non-string / 128,875 B needing
shape-specific recipes — and are seeded as `cm-restock-carve-11`.

**#1534 `q-pool-freshness-tool` — HELD, and the reason is subtle enough to be
worth stating precisely: the tool is arithmetically correct and one default is
wrong, which is worse than a bug.** `_wall_bl4_pool()` defaults to
`module="main"`, but `wall-bl4-small` is a **full-EUR, all-modules** pool by
definition. Brain ran the lane's own tool three ways on one tree:

```text
module='main'   -> count=3   bytes=440
module=None     -> count=34  bytes=5224      <-- known-answer case, EXACT
module=''       -> count=0   bytes=0         <-- silent empty, no error
```

**With the right scope it reproduces 34 / 5,224 B exactly** — the tool works.
But the narrowed default led the PR to conclude that round 0822's
`34 / 5,224 B` figure was *stale on this tree*. It was not stale; it was correct.
**A scope mismatch was reported as staleness — precisely the inference this tool
exists to make impossible**, and it arrives stamped with a reproducer command,
so it would have been believed. The re-take item carries all three findings plus
the `module=""` silent-zero footgun. The lane's `data-string-pool` `0 / 0 B`
reading is correct and needs no change (carve-9 shipped that pool in full).

**#1530 supersedes #1520 and the held work paid off twice.** Control 7 satisfied
on the brain's own reproduction: the new establishment check goes **red on the
literal round-0822 kickoff as sent** and green with `Set-Location` prepended, and
all four of this round's real dispatches pass every required check. The
self-sourcing fixture removes the machine-local SHA. #1520 closed as superseded.

**#1528 is byte-safe by construction** — 155 added lines in `src/`, every one a
`;` comment, zero removals, and the before/after canary goes 4 matching lines →
none. It also declined to manufacture headers for 10 catalog entries with no live
source, including the retracted `0x02253304`. **#1532** is correctly scoped: the
new `--version` runtime probe covers **only** `arm-binutils` (the tool that
actually failed); `mwccarm`/`wibo`/`dsd`/`objdiff` return `[]` and are untouched,
so there is no fresh-bootstrap risk. **#1535** validates last round's toggle
directly: 50 sampled `unittest` runs, 43 pass, and **all 7 failures were true
red with no same-SHA passing rerun — zero flakes**, several of them the exact
`pytest`-import-in-a-unittest-only-job class. Making it required adds no spurious
friction.

**Integration hazard checked and clean:** #1528 edits `.s` headers while #1536
deletes `.s` files. Zero overlap between the 155 touched and the 5 deleted — the
partition written into both kickoffs held. One benign queue-marker conflict
resolved to DONE.

**Last updated (previous):** 2026-08-22 — **(Windows PC, brain=Opus 5; roster unchanged.)
Round 0822: the exploit round landed at 73/100 and settled the pool-vs-selector
question for good — but it also drained the pool it was exploiting down to 32
candidates. The next question is no longer "which selector"; it is "where does
this pool's boundary actually sit".**

Merged **#1524** (`cm-main-exploit-drain-1`) and **#1522** (`cm-toolchain-adopt-2`).
**Held #1520** (`q-kickoff-lint-canary-check`). Codex Decomper's queue was found
empty; all four lanes are re-seeded.

⚠️ **Transcript audit — this round it could not be done, and that is stated
rather than papered over (AGENTS.md control 12).** Round 0819 was dispatched from
the **Mac**; this brain is on the **Windows PC**. `mcp__ccd_session_mgmt__*` lists
no `gx-spirit-caller` session on this machine, and the newest local
`~/.codex/sessions/**/rollout-*.jsonl` is dated 2026-07-12. **Zero of the four
lanes' transcripts were readable here.** Every judgement below therefore rests on
repository state, the PR bodies as *claims*, and the brain's own re-derivations —
which is why more of this round's review than usual is independent measurement.
Nothing was inferred from a branch's appearance. (This is the same
machine-locality trap that produced the wrong "three missed rounds" reading in
round 0817 and was corrected in #1504.)

**#1524 `cm-main-exploit-drain-1` — 73/100, and every load-bearing number
re-derived independently.** Not accepted from the PR body:

| Claim | Brain's independent check |
|---|---|
| 73 shipped / 23 parked | ledger diff vs `origin/main`: **96 new rows, 73 `shipped` + 23 `parked`** |
| 9,488 B | sum of `text_size` over the 73 shipped rows: **9,488** |
| 73 `.c` added == 73 `.s` deleted | `git diff --name-status`: **73 A `.c`, 73 D `.s`** |
| zero `asm` escapes | grep for `asm` / `__asm` / `GLOBAL_ASM` over all 73: **no hits** |
| P-23 downgraded | `codegen-walls.md`: **"LIVE (tentative — was confirmed, downgraded 2026-08-18)"** |
| 28 in reserve | reconciles exactly — see the pool re-derivation below |

Per-brief row counts reconcile against the round's own "4 not reached" account
(canary 1 + b1 19 + b2 20 + b3 20 + b4 17 + b5 19 = 96). The round corrected the
catalog *against itself* (P-23 confirmed → tentative after a listed member shipped
clean via an unrelated fix), filed **C-95** (bit-packed fields need a real C
bitfield; a manual mask/shift always collapses to one instruction), and reported
three real tooling defects as defects rather than quirks — `batch_sha1.py` leaving
superseded `.s` files on disk, `fastmatch.py` masking an objdump launch crash as
"no functions in compiled .o", and `wall_aware_headroom.py`'s citation-trust blind
spot. All three are now queued to the Codex Decomper.

**THE HEADLINE — the pool-vs-selector question is closed, and the pool is nearly
empty.** Three rounds now: sweep-7 34-36%, #1508 60.8%, #1524 **73%**. The
variable was never a selector; it was the pool definition (full EUR, `.text`
≤192 B, ≥4 `bl`/`blx`, unattempted). But the brain re-derived that pool at this
round's `main`, reusing `wall_aware_headroom.py`'s own `scan()` plus the `bl`
filter, and it is **34 candidates / 5,224 B** — of which 2 are documented-permanent
(P-25 `0x02212bc4`, P-21 `0x0224b01c`), leaving **32 drainable / 4,916 B**. That
reconciles exactly with #1524's own account (28 reserve + 4 not-reached + 2 swapped
out pre-dispatch). All 34 are `unknown_files`; none coercible.

**So the next question is the pool's BOUNDARY, and it is measured, not guessed.**
Same `≥4 bl` filter, same `--exclude-attempted`, one axis moved:

| `.text` cap | candidates | bytes |
|---|---:|---:|
| ≤192 B | 34 | 5,224 |
| ≤256 B | 298 | 64,784 |
| ≤320 B | 581 | 146,464 |
| ≤384 B | 781 | 217,016 |

The 193-256 B slice alone is **264 candidates / 59,560 B**. This is *not* a third
selector study — the standing ban is on selecting *within* a pool, and this asks
where the pool stops. There is a real prior on the other side:
`cm-main-tier-sweep-7` Part 2 (4+ calls, **200-376 B**) shipped **8/50 = 16%**.
The 193-256 B slice is the bottom sliver of that band and has never been isolated.
`cm-main-exploit-drain-2` dispatches 40 from it with the falsification test written
down in advance: ≥50% ⇒ sweep-7 Part 2's 16% was a whole-band artifact and 59,560 B
plus a 146 KB tail are open; ≤25% ⇒ the ~192 B cap is real and this campaign's
small-function pool is genuinely near its end. Either answer redirects the lane.

**#1522 `cm-toolchain-adopt-2` — DECLINE dsd v0.12.0, and the third attempt was
the one that got the machine.** Scheduling it first worked exactly as intended: it
found the Decomper's gate live, ran a bounded poll instead of reporting blocked,
and had the wine lane clear in ~1 minute. The finding is real, not a contention
report. v0.12.0's function-boundary analysis is *better* — it is the DECLINE cause
anyway, because adopting it moves `ov000`'s `.text`/`.rodata` split by **0x5E0C
(24,076 B)** and `ov004`'s by **0x22784 (141,700 B)**, reclassifying former rodata
as real code (+52 genuine `kind:function` symbols in ov000 alone). Adopting means
re-deriving the whole committed `config/eur/` tree — a project-wide re-bootstrap,
not a pin bump. **Brain-verified the one claim the whole argument rests on:**
`config/eur/arm9/overlays/ov000/delinks.txt` and `.../ov004/delinks.txt` on `main`
today show `0x021af7d0` and `0x021de638` — exactly the lane's v0.11.0 baseline.
The comparison was against reality, not a hypothetical. Separately real: v0.12.0
restructured `config.yaml`'s two flat padding fields into an 11-key `padding:`
block, so v0.11.0's `init` cannot parse a v0.12.0 extraction at all. The toolchain
arc is now closed on all three legs — m2c **ADOPTED** (#1515), permuter
**DECLINED** (#1512), dsd **DECLINED** (#1522).

**#1520 `q-kickoff-lint-canary-check` — HELD, and the reason is almost too neat.**
The work is right: three new checks (`referenced-paths`, `referenced-commits`,
`platform-coherence`) with a `git show <rev>:<path>` history escape, and the brain
reproduced the incident canary itself rather than trusting the report — red on the
impossible form (`referenced-paths` firing on `src/main/func_0209e628.s`), green on
the `git show 010616b65^:` form. Control 7 satisfied on this machine.

**But `tests/test_kickoff_lint.py` hardcodes four commit SHAs and one of them —
`3afd6df27c4119906a6895be605d6cfa87590493` — is a bad object in this repository.**
`git branch -a --contains` returns `error: no such commit`. The other three are real
merged commits. On the integration tree that is `1 failed, 3283 passed`, and the
failure is `['referenced-commits'] != []` inside the tool's own fixture. It is a
machine-local object: green where it was written, red everywhere else. **The tool
built to catch a canary that cannot run elsewhere shipped a test that cannot run
elsewhere.** Dropping #1520 from the integration cleared the failure and nothing
else, confirming attribution — the same isolation that held #1505.

**THE BRITTLENESS CLASS IS NOW 0-FOR-3.** #1499 killed cardinality assertions
against the live ledger in `test_validate_attempts.py`. #1505 was held when a
different lane wrote four fresh hardcoded counts into a different file. This is a
third file, with a commit SHA instead of a count. Two per-file fixes have not
generalised, so `q-kickoff-lint-sha-brittleness` asks for the *general* guard —
fail any test that asserts against a hardcoded 40-hex SHA or a live repo-state
constant — and explicitly accepts a well-argued negative if that line cannot be
drawn mechanically.

**Manifest-vs-practice drift, flagged not fixed.** `AGENTS.md` puts `tools/`
in the Codex Decomper's *hands-off* column, but that lane's last ~20 items
(`q-cascade-ci-quadratic`, `q-park-family-column`, `q-metric-canon-guard`, …) are
all tooling. The practice is settled and productive; the manifest is stale. This
round's Codex Decomper seed keeps the same shape. **cntrl_alt_lenny's call whether
to widen the column or re-slice the lanes** — the brain is not re-partitioning
agent scope on its own initiative.

**Last updated (previous):** 2026-08-18 — **(Mac M1, brain=Fable 5; roster unchanged.)
Round 0818: all four lanes delivered, and the second selector programme in a row
returned null — while the round's own yield hit 60.8%, the best measured this
campaign. The lever was never the selector; it was the pool.**

**Round 0818b (partial round — 3 of 4 lanes; the CC Decomper is still draining
`cm-main-exploit-drain-1`).** Merged **#1511** (`q-park-class-remap`) and
**#1512** (`q-toolchain-repin-eval`); closed **#1505** as superseded.

- **#1511 finished the held work properly.** Cardinality assertions gone,
  invariant scoped to parked rows, and an **identity rule** for bare `C-`/`P-`/
  `OQ-` anchors so future anchors need no table row — better than the brief
  asked for. The two taxonomy calls the brain declined to guess both check out:
  `strength-reduction` → **C-65**, which is literally "Loop-body strength
  reduction" and already has `C-65-strength-reduction` rows mapping there; and
  `tool-anomaly` → `UNCLASSIFIED:tool-anomaly`, correctly **refused** a wall
  family because it records a fastmatch-vs-SHA1 tooling discrepancy, not a
  codegen wall. Both runners green.
- **#1512 evaluated honestly and reported a blocked leg rather than forcing it.**
  m2c **ADOPT** (fixes a real stack-argument-by-reference misresolution on 2/8
  live panel functions), permuter **DECLINE** with *no evidence either way* —
  proved by experiment that all 3 documented plateau candidates are `.s` TUs
  that `import.py` cannot stage, independently rediscovering the known
  permuter/`.s`-TU prerequisite — and `dsd` **NOT ATTEMPTED** because `pgrep`
  showed the Decomper's `ninja sha1` live. It also caught that 7 of 8 cited
  panel functions were already matched, and rebuilt the panel instead of
  reporting a dead comparison.

⚠️ **METRIC CORRECTION — do not let this one propagate.** #1512's incidental
census (**30 unmatched functions project-wide**: 18 `ov004`, 10 ITCM stubs, 4
overlay-swap residues, via `objdump -t` over every `_dsd_gap@*.o`) is a real
measurement of a real thing — **delink gaps** — and the 30-function pool is a
genuine small closeable target. But the doc's framing that the project is
*"materially closer to done"* and wants *"a headline update"* is wrong and would
badly misstate campaign state. **A `.s` file is byte-matched by construction** —
that is exactly why `ninja sha1` passes with **4,642** of them still shipped in
the EUR baseline — **but it is not decompiled C.** The campaign headline is
natural-C: ~16.5% EUR, 11.84% USA. Different axis. `q-metric-canon-guard` is
seeded to correct the doc in place and make the conflation mechanically hard.

**The Codex lanes were finishing in minutes because their queues were one item
deep.** Both queue headers already say *loop until QUEUE-EMPTY*, so a lane that
completes its single item and stops is obeying the protocol, not failing it. The
Codex Scaffolder additionally produced **nothing** this round — branch created at
`origin/main`, clean tree, item never claimed — and no Codex session log exists
on this Mac for 2026-08-18, so that lane's cause is **unread, not diagnosed**.
Both Codex queues are now **three items deep**.

<!-- main-sha: 157de4a54 -->
<!-- parked-prs: 1020 -->

## Durable conventions (lifted out of the archived round narrative)

Per-round narrative for rounds 0805-0810 now lives in
[`docs/research/brain-rounds-0805-0810.md`](research/brain-rounds-0805-0810.md).
These four conventions were buried inside it and are load-bearing, so
they stay here:

1. **The two HTML markers above are machine-checked** by
   `tools/queue_state_drift.py`. `main-sha` is the `main` commit this
   document describes — drift fires when `main` runs more than
   `_STALE_MERGE_TOLERANCE` (2) PR-merges ahead of it, so a stale handoff
   is caught even when this file makes no PR-count claim. `parked-prs` is
   the EXPLICIT parked list: parked is never inferred from GitHub's draft
   bit, because the worker lanes publish ordinary output as drafts.
2. ⚠️ **The active-PR count EXCLUDES the doc-PR carrying this update.**
   That PR is open while you write the number and merged moments later, so
   counting it makes the claim wrong on `main` the instant it lands, and
   fails `drift-check` on the NEXT PR's CI. Write the count you expect to
   be true *after* this update merges. The `main-sha` anchor has an
   explicit merge tolerance for the same reason; the PR-count claim has
   none.
3. **The canonical dispatch rule**: the brain hands over **one complete
   paste-ready message per active standing lane that needs dispatch,
   normally all four**, in the same final response — never deferred to a
   later message. `docs/agents/brain-onboarding.md` holds the canonical
   statement; `AGENTS.md` and `.claude/agents/brain.md` defer to it.
4. **Branch protection is LIVE** (ruleset `main-protection`). Required
   checks are `Python (ruff)`, `Markdown (markdownlint-cli2)`, `drift-check`
   and — since round 0822b (#1531) — `unittest`, the four that run on EVERY
   PR (`pr-invariants` and the compile checks are paths-filtered; requiring
   them would hang docs-only PRs — the required set and the workflows are
   contract-checked by `tools/check_ci_contract.py`). Force-push and deletion
   are blocked; repo-admin bypass keeps the brain's gated integ→main flow
   working. The brain's 3-region `ninja sha1` gate remains the real merge
   gate, always run locally.
5. **Every seeding/doc PR appends a row to
   [`docs/dispatch-log.md`](dispatch-log.md)** — round, date, host, brain
   model, lanes dispatched, transcript location. Machine-locality has burned
   this campaign at least five distinct ways (#1504's correction, the 0822
   transcript-audit gap, #1520's local git object, the WRONG-WORKTREE void
   dispatch); the log is the structural fix. A kickoff is written for the
   host in that row, never forwarded across machines.

## In flight (post this brain-PR)

**Active PRs: 0** once `brain/integ-0824b` lands. **#1020** (decomp.dev CI)
remains the one genuinely parked draft and is declared in the `parked-prs`
anchor above. **#1534 is CLOSED**, superseded by #1542's rescope.

**All four queues re-seeded.** Dispatch host: the Windows PC (recorded in
[`docs/dispatch-log.md`](dispatch-log.md), row 0824). Every seeded item was
verified to resolve via `work_queue.py next` on the integration tree.

⚠️ **The Codex Scaffolder's next kickoff must NOT open with `git reset --hard`.**
Its `q-make-kickoff-generator` work is written, gate-passing and **uncommitted**
in `kb-types` (199 lines of `tools/make_kickoff.py` + 60 of tests). It paused
before committing because the item's own spec forbade building against an
unmerged interface — correct behaviour that the standard preflight would then
have destroyed. Brain holds a backup; the kickoff commits it as step one.

| Lane | Next item | Why |
|---|---|---|
| CC Decomper | `cm-main-band-followthrough` | The re-run answered: 0/20 at matched effort. Its Outcome-B branch fires — record the closure in the catalog, then the bounded 257-512 B pilot with the <15% kill criterion stated in advance. |
| CC Scaffolder | `cm-restock-carve-12` (rewritten) | Wave 11 sized the lever precisely: 576 windows / 3,069 symbols / 66,096 B are geometrically composable but blocked behind a per-group `.o` inspection nobody will do 576 times by hand. Build the verifier, drain what passes. |
| Codex Decomper | `q-ledger-chronology`, then `q-remaining-opportunity-census` | The first fixes a false-positive class in its own just-merged audit. The second writes down what is actually left now that the small-code frontier has closed. |
| Codex Scaffolder | `q-make-kickoff-generator` | Commit the paused work first, then finish it against the now-merged #1542 interface. Three more items behind it. |

## Active clusters (post-pivot reality)

**The scaffold phase is officially DONE.** Cluster work is no
longer the primary axis; the project is now grinding C source
against the curated function queue. Cluster status snapshot
retained below for handoff context but cluster-side residue is
intentionally DEFERRED per pivot discipline — if any cluster
residue actively blocks a code-decomp brief, file as a brief 190+
followup; do NOT pre-emptively grind it.

- **Cluster A** — `.rodata`. Largely drained pre-SHA1; brief 141
  closed the ov004 sweep. **DEFERRED (no remaining open work
  surfacing in code-decomp wave 1).**
- **Cluster B** — main `.data`. **FULLY CLOSED** post brief 181 +
  185 (`data_ov006_021ceae4` worked example shipped under the
  raised 4096-byte cap). Single residue: `data_ov002_022ccc2e`
  (odd-aligned size=2, no nearby 4-aligned predecessor) —
  DEFERRED.
- **Cluster C / D-1 / D-2** — ov004 sub-clusters. 73 EUR syms
  shipped pre-pivot. Brief 184 wired the cross-region apply
  subcommands (EUR dry-run smoke 1855 / region). **Cross-region
  apply at scale is DEFERRED** — would be a follow-on to brief 178
  if revived, but pivot discipline says no.
- **Cluster D-3** — nested struct arrays. **EFFECTIVELY CLOSED**
  post brief 178 + 181 (~105 chunks / ~110 KB shipped). Single
  residue: `data_020c9694` 14.8 KB mega — DEFERRED.
- **Cluster D** — `.bss`/zeros. **W7 patcher chain CLOSED for EUR**
  via brief 182 (134 → 142 → 146 → 150 → 162 → 164 → 168 → 180 →
  183 → 186 → 182). USA + JPN cross-region of brief 182's two
  claims hit a +36 B cascade exceeding `MAX_SHIFT_BYTES = 4`;
  reverted, deferred indefinitely. 34 of 35 odd-aligned ov004 data
  symbols remain unclaimed — DEFERRED.

## Code-decomp resumption (post-pivot active work)

**Canonical metric** (changed 2026-05-23 evening per brief 203
investigation): `complete_units` from `build/eur/report.json`.
Brief 199 / 202 / 203 investigation found that
`matched_code_percent` + `matched_functions` systematically
under-count `.legacy.c` + `.s` ships because objdiff requires
unrelocated-`.o` byte-identity, while our ship paths have
different reloc records than dsd's delink (post-link bytes match
— SHA1 PASS verifies). `complete_units` IS the SHA1-aligned
indicator. Full diagnosis:
[`docs/research/objdiff-fuzzy-vs-complete-metric.md`](../docs/research/objdiff-fuzzy-vs-complete-metric.md).

**Current (post #671 + #672 merge):**

| Metric | Value | Notes |
|---|---|---|
| **complete_units** | **1,749 / 2,660** | SHA1-aligned headline. 65.75 %. +46 over post-#668/#669 (1,703 baseline at last round). |
| matched_code_percent | **5.0263 %** | +0.046 pp this round — mostly `.s` ships which are headline-light but complete-units-heavy. |
| matched_functions | **1,786 / 9,801** (18.22 %) | +46 over post-#668/#669 baseline of 1,740. The brief 210 `$d → $a` chain credits `.s` ships cleanly now. |
| fuzzy_match_percent | **5.7246 %** | +0.047 pp this round |
| complete_code_percent | (per-unit) | for individual ships, 100 % means byte-identical at the linker level |
| **easy-tier matched ratio** | **92.9 %** | up from 88.7 %. 79 unmatched easy-tier picks remain, of which 39 are Wall-2-blocked (leaf-no-pool reg-alloc divergence). |

**Resumption queue:** [docs/research/code-decomp-resumption-queue.md](../docs/research/code-decomp-resumption-queue.md)
— 52 picks across trivial (12) / easy (25) / medium-easy (15).
Brief 188 is grinding the trivial bucket; brief 190+ picks up
easy + medium-easy once brief 189's wall pre-emption lands.

**Resumption playbook:** [docs/decomp-workflow.md](../docs/decomp-workflow.md)
§ "Code-decomp resumption — the post-scaffold playbook" (NEW in
brief 187). Routing decision tree, scratch flow, permuter staging,
3-region SHA1 PASS as headline gate.

## Worktree convention — isolation per agent, two equivalent mechanisms

Each agent runs in its own worktree to prevent parallel-session
interference that bit briefs 138 + 140 earlier. **AGENTS.md is the
canonical spec** (worktree-convention section there now covers both
mechanisms — updated in this brain-PR). Two mechanisms are
equivalent:

- **Mac convention (manual sibling worktrees):** `~/Dev/spirit-caller/brain`,
  `~/Dev/spirit-caller/decomper`, `~/Dev/spirit-caller/scaffolder`
  — three named siblings under one parent, set up once via `git worktree
  add`. Each has its own `orig/` baseroms. Adopted during the
  SHA1-milestone arc; PR #564 documented this in state.md.
- **Windows convention (Claude Code automatic sandboxes):** Claude
  Code creates per-session worktrees inside `.claude/worktrees/<auto-
  name>/` for each agent. No manual setup. They share the main
  checkout's `orig/` baseroms. Side-effect: `gh pr merge --delete-
  branch` may fail to clean up the local branch while the agent
  session is active — harmless, server-side merge still succeeds.

Brief 142's clean scaffolder-side work + brief 143's clean decomper-side work
were the validation that worktree separation (either mechanism) is
sufficient.

## Brain-pattern locked

- **Self-merge by default.** Brain reviews + merges autonomously per
  cntrl_alt_lenny's stated working pattern. User gets the scaffolder /
  decomper messages afterward, doesn't gate each merge.
- **PR-URL deliverable.** Every agent message MUST end with "push the
  branch, run `gh pr create`, reply with the PR URL." Brain verifies
  origin before claiming review-ready; PRs missing from origin → ask
  user to nudge the agent rather than silently waiting.
- **Verify gate is now 3-region SHA1 PASS** (was 24/27 module check
  before brief 140). For tools-only PRs that don't touch the build
  path, EUR-only SHA1 PASS is sufficient evidence.

## Next-brain TODO

**0a. SEEDED-NOT-DISPATCHED (Mac brain, 2026-08-17) — three CI/tooling items
from an external read-only audit.** They sit **second** in their lanes' queues,
behind round 0817's four items, so `work_queue.py next` is unaffected until
those clear. Every premise was verified live on `main` twice (`b1015c872` and
`fcb39a4c2`); re-verify before dispatch anyway.

- `q-cascade-ci-quadratic` (codex-decomper) — `find_mega_cascades.py`,
  `find_cascades.py` and `propagate_template.py` rebuild per-target what they
  should index once; ~78 s of CI wall per triggering PR, and all three tools run
  in PR CI on essentially every conversion PR. Brain re-measured
  `find_cascades.py` at 10.36 s for a zero-result run.
- `q-ci-timeout-cache` (codex-scaffolder) — 12 of 12 workflows lack
  `timeout-minutes`; `compile-check.yml` re-downloads the ~87 MB toolchain on
  every run of a 3-region matrix.
- `q-toolchain-repin-eval` (claude-scaffolder) — `dsd` / `m2c` / permuter pins
  have drifted 2-4 months. **Evaluation only, adoption is a separate item.**
  Carries a layer correction: upstream m2c cannot subsume our `.legacy` /
  `.legacy_sp3` routing (compile-tier vs draft-generation).

**Rejected in the same pass, with reasons — do not re-litigate without new
information.** A `git filter-repo` scrub of the `.wine-lane` blobs in history
is real (the three largest objects in the pack are `.wine-lane` files; 1,822
wine-path blobs; ~150 MB pack) but was **declined**: rewriting every commit hash
invalidates 47 unique commit-sha citations across `docs/`, this file's own
`main-sha` drift anchor, and the standing `git show <sha>` convention in briefs
and kickoffs, and forces a re-clone on both machines. Reclaiming ~74 MB does not
buy that. Preconditions if ever revived: between rounds, both machines synced,
commit-map retained, and docs sha-citations remapped in the same change.
Separately, `wine_link_lock.py` was examined and is **correctly scoped** — per-
worktree WINEPREFIXes already parallelise compile (3.66× at 4 lanes, brief
608/614); only the final link serialises, and wider-than-2-way concurrent
linking was never tested. That test is the next experiment if anyone wants one.

**0. ✅ DECIDED 2026-08-05 (round 0805, see top): adopted the pret-style public
ladder + verdict-complete gate; rejected attainment-as-completion. Original item
kept below for the reasoning trail.** (2026-07-25, q-readable-c-done-definition)
Decide the "readable-C done" definition; ceiling model corrected, not a completion
criterion anymore. r11 found the tractable-C ceiling self-contradicting (48.03%
vs r7-14's 14-24% band); fixed with shown arithmetic (main's headroom
fraction 0.75 -> 0.10, region-wide ceiling 48.03% -> 30.19%) but
explicitly NOT reconciled to the band — see
[`docs/research/q-readable-c-done-definition-2026-07-25.md`](../docs/research/q-readable-c-done-definition-2026-07-25.md)
for why forcing an exact match would be false precision, and for the
larger still-flagged-not-fixed `FINISHABLE_HEADROOM_FRACTION` residual.
That doc gives 3 candidate "readable-C done" definitions (pret-style
public ladder / attainment=100%-of-ceiling / internal verdict-complete
gate) with a recommendation (adopt the ladder + verdict-gate together,
reject attainment as a completion criterion) — **the brain decides**
which to formally adopt. If verdict-complete is chosen, note the
freshness-cutoff nuance in that doc (key it per-lever-family off
`codegen-walls.md`'s own correction history, not one global date).

1. **Brief 234 (decomper)** — C-39 drain wave 6 + C-40 3-pick
   mechanical cleanup. Kicked off this round. (A) Continue
   C-39b-solo drain (122 picks remain after brief 232's 35).
   (B) Ship the 3 remaining brief-219 C-40 picks via brief 233's
   locked recipe (`func_0208df40`, `_0208e1ac`, `_0208e200`).
   Target: 25-35 ships, hard-tier 7.42 % → 7.7-7.9 %.
2. **Brief 235 (scaffolder)** — Three small pilots. Kicked off
   this round. (A) **C-39e sub-classification** on brief 232's
   new `movs r4, r1` null+helper-at-top sub-shape (2 known
   picks `0228b810`, `0228b850`); if ≥2 ship, classify + extend
   detector. (B) **Brief 232's 2 deferred picks**:
   `func_ov002_02295284` (double-call disjunction),
   `func_ov002_0220673c` (cross-call compare with dead-store
   artifact). (C) **Broader-C-40 corpus pilot**: brief 233 noted
   459 broader `0x04001xxx`-pool occurrences beyond the 4 strict
   C-40 picks; pilot 5 picks outside the strict signature.
3. **Brief 236 candidates** (post-234/235):
   - **C-39e drain wave** if brief 235 (A) locks.
   - **Broader-C-40 / C-42 drain wave** if brief 235 (C) locks.
   - **C-39 mega-batch wave** — combine a/b/d/e + base into one
     cross-shape uniform-batch using brief 230 + 232's variant
     tables.
   - **Permuter wave 2** on hard-tier picks — brief 198 left
     this open; brief 218 bitfield insight may help.
   - **`.s` → `.c` upgrade pass on accumulated punts** — brief
     221 + 223 + 224 + 228 + 230 + 232's deferred cohorts;
     ~100+ `.s` ships with non-permanent walls.
4. **Carryover candidates from prior rounds:**
   - **Hard-bucket pilot** (Track 2 long-form decomp). Brief 220
     is the structural prerequisite for this.
   - Brief 213's brief-201 doc correction, C-24 wall extension,
     C-15 `mvn #0` refinement, P-11 reg-alloc-hint research —
     all still available as smaller scaffolder slots.
5. **Scope brain candidates to keep ready:**
   - **C-24 wall** (predicated cascade research from brief 103):
     pending classifier upgrade, same shape as C-23/C-31/C-32/C-33
   - **Brief 197's mis-tagged C-15 prediction caveat** — `mvn #0`
     isn't always mwcc 1.2 routing; refine the C-15 predictor
   - **Decomp.me scratch upload automation** — productivity
     multiplier (brief 201's success makes this higher priority)
   - **P-11 reg-alloc-hint research** — brief 200 left this open
     as a separate brief candidate; sweep mwcc 2.0 SPs +
     optimization levels on E-12 to see if any produce orig form
   - **Brief 201's "two pool loads" correction in C-23 entry** —
     trivial doc edit (mwcc CSE'd already; the recipe still
     works but the explanation in pick #5's `.legacy.c` worked
     example is imprecise)
6. **Deferred indefinitely (per pivot discipline):**
   - `data_020c9694` 14.8 KB D-3 mega
   - `data_ov002_022ccc2e` odd-aligned size=2
   - 34 remaining odd-aligned ov004 data symbols (brief 182
     self-extend pool)
   - USA + JPN cross-region apply of brief 182's claims (+36 B
     cascade exceeds `MAX_SHIFT_BYTES = 4`)
   - Cluster C / D-1 / D-2 cross-region apply at scale (brief
     184 wired the subcommands; never run)
   - Brief 190 Cluster D (predicated saturation chains, 3-4 picks)
     — waits for a C-1 saturation recipe or permuter coverage
   - Brief 188 epilogue orphans (2 picks) — likely linker-emitted
     scaffolding or dead code
   - These items are NOT lost. If a code-decomp brief actively
     blocks on one, file the followup it deserves; otherwise
     leave them.
7. **Pre-existing carryovers (unchanged):**
   - `func_ov021_021aaf58` placeholder-in-complete-TU warning.
   - ov005 placeholder-name warnings.
   - `match-invariants` not yet a required branch-protection check.
8. **Known infrastructure state:**
   - Agent-inbox hook fix landed in PR #634 but agent sessions
     started BEFORE that PR will continue to silently fail (Claude
     Code reads `.claude/settings.json` once at session start).
     Inbox populates from next FRESH session start onward — brain
     should mention "exit your previous session" explicitly in
     kickoffs until it stops being a problem.
   - CI comment-upsert workflows hardened in PR #641 (shared
     `.github/scripts/upsert-pr-comment.sh`, REST-only, 3-retry,
     fail-soft). `pr-tier-delta` and 5 sibling workflows no longer
     fail on transient API 401s.
   - `objdiff_filter_panic_units.py` fixed to handle `.legacy.c`
     paths properly (this brain-PR). dsd emits `.o` paths; mwcc
     produces `.legacy.o` / `.legacy_sp3.o`. Filter now rewrites
     via `source_path` as the authoritative routing signal.
     **+198 matched_functions previously invisible** were the
     immediate recovery; the fix permanently closes the gap for
     all future `.legacy.c` ships.
   - **Worktree-pointer breakage from parent-dir rename** (fixed
     this brain-PR via `git worktree repair`): the parent dir was
     renamed `gx-spirit-caller-NEW` → `gx-spirit-caller` at some
     point; `decomper/.git` + `scaffolder/.git` (and the
     corresponding `brain/.git/worktrees/<slug>/gitdir`
     back-pointers) kept the stale `-NEW` paths. Symptom: agent
     worktrees can't run git commands. Fix is non-destructive —
     `git worktree repair <path>...` from the main worktree
     rewrites all four pointer files. Future brains starting on
     a renamed-parent setup should `git worktree list` and check
     for `prunable` markers before assuming agent worktrees work.
   - **Brief 212 `TestStragglerSmoke` becomes idempotent-no-op
     post-merge.** The two tests (`test_021cb574_collapses_one_trailing_a`
     + `test_021d02a4_collapses_four_trailing_a`) load `.o.resolved`
     files from a sibling decomper build and expect the rewriter to
     collapse 1 / 4 trailing `$a` markers. Pre-#668 they passed; post-
     #668 they FAIL because decomper's post-merge rebuild ran the
     rewriter in production, so the on-disk `.o.resolved` files are
     already collapsed (`trailing_promoted_collapsed: 0` on re-run).
     Not a regression — test design depends on pre-rewriter build
     state that no longer exists in normal workflows. Fix candidate
     for whichever scaffolder brief touches `patch_arm_mapping_symbols.py`
     next: either (a) check for already-collapsed shape and skip,
     (b) read pre-resolve `.o` files instead of `.o.resolved`, or
     (c) check in a fixture rather than depending on a build
     artifact.
   - `tools/permute.py` macOS workarounds folded in (PR #655):
     PEP 668 externally-managed-environment fallback auto-creates
     `.venv_permuter/` and patches `sys.path` in-process; disasm
     path resolver scans the tree-mirroring layout (`disasm/src/
     <path>/func_<addr>.s`) when the flat layout is absent.
     Brief 198's symlink workarounds no longer needed.

## Cross-machine handoff notes

User alternates brain between Windows PC and Mac. The role is tied to
the local machine (toolchain + baserom on disk), not to a specific
Claude session. State.md is the bridge. Standing conventions:

- **Working pattern:** brain reviews + merges autonomously; user
  receives the scaffolder / decomper messages afterward.
- **Verify command (Windows):** `python tools/configure.py eur &&
  ninja sha1 && python tools/configure.py usa && ninja sha1 && python
  tools/configure.py jpn && ninja sha1`. **On Mac substitute `python3.13`**
  (macOS ships no plain `python`; `/usr/bin/python3` is Apple's 3.9.6
  which lacks `match` statements — `tools/configure.py` requires 3.11+
  per CLAUDE.md). POSIX paths and `./dsd` instead of `dsd.exe`.
- **Memory per-machine:** Each side's `~/.claude/projects/...` memory
  doesn't follow. State.md is the bridge.
- **Worktrees:** see *Worktree convention* above; 3-worktree split is
  now standard.

## New agents?

No. Continuing with 4-slot setup (brain + decomper + scaffolder +
auto-progress-badge bot).
