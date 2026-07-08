[//]: # (markdownlint-disable MD013 MD041)

# Brief 546 — USA/JPN mechanical `.s` drain: ov002 wave 5 (first b545-wired run)

**Brief:** 546 (Claude scaffolder). Own worktree `claude-546`, branch
`claude/usajpn-ov002-drain-546`. Continues
[brief 544](brief-544-usajpn-ov002-drain-w4.md)'s ov002 drain — wave 5 of
~several, same recipe, same `--min-addr 0x021aa3c0`. First wave to run on
the b545-wired `batch_carve` (merged since brief 544): pure `C-absorbed`
`base+offset` REFUSEs now auto-route through `asm_escape
--allow-absorbed-offset` instead of being parked outright.

## What shipped

| Region | Shipped | REFUSE | absorbed-routed | verify-fail | gate-fail | Commits |
|---|---:|---:|---:|---:|---:|---:|
| USA | **148** | 0 | 2 | 2 | 0 | 8 |
| JPN | **148** | 0 | 2 | 2 | 0 | 8 |
| **Total** | **296** | 0 | 4 | 4 | 0 | 16 |

Same command as every prior wave for both regions: `batch_carve.py
--overlay ov002 --min-addr 0x021aa3c0 --batch 20 --limit 150`,
region-specific `--srcdir`. Net shipped count is identical to waves 1-3
(148/region) — the wiring didn't change the *ship* total this wave, only
which bucket the perennial 2-per-region REFUSE candidates land in.

## First live proof of the b545 wiring

Both regions hit the exact same two addresses every prior wave has
flagged as REFUSE — `func_ov002_022626c4` and `func_ov002_022b9434`
(identical addresses in USA and JPN, consistent with ov002 sharing EUR-
baseline code across regions). This wave, instead of an immediate
`⊘ REFUSE (parked)`, the log showed:

```text
◆ func_ov002_022626c4 REFUSE (C-absorbed, base+offset-recoverable — attempting)
✗ func_ov002_022626c4 verify-fail (parked)
◆ func_ov002_022b9434 REFUSE (C-absorbed, base+offset-recoverable — attempting)
✗ func_ov002_022b9434 verify-fail (parked)
```

Confirms the wiring is live and firing (`classify()` correctly identifies
the pure-`C-absorbed` sub-case and routes it through `whole_function()`
with `--allow-absorbed-offset` instead of parking on sight) — but for
**these specific two candidates, in both regions, the offset-substitution
attempt still failed verification**. **0 of 4 absorbed-routed attempts
this wave actually shipped** (2 USA + 2 JPN, all ended up `verify-fail`
rather than a recovered ship). Net effect this wave: REFUSE bucket count
dropped from the usual 2/region to 0/region, but verify-fail rose from 0
to 2/region — same two candidates, just reclassified, not recovered.

Not a regression and not evidence against b543's validation (which
proved the flag recovers real ov004/006 walls) — these two ov002
candidates apparently aren't the same `base+small_offset` sub-case the
flag targets, or hit some other blocking factor upstream of the offset
substitution itself. Worth a closer look in a future brief if these two
keep resisting every wave; they're a fixed, non-growing cost (same 2
addresses since brief 538) so they're not blocking throughput, just an
open question on why the recovery didn't apply here.

## Remaining runway (dry-run estimate — read the caveat)

| Region | SHIPPED (dry-run) | absorbed-routed (dry-run) |
|---|---:|---:|
| USA | 707 | 4 |
| JPN | 823 | 4 |

**Caveat, confirmed by reading `batch_carve.py`'s own `Report.summary()`
docstring:** `--dry-run` never calls `whole_function()` — it only runs
`classify()`, so its `absorbed-routed` count (and the `SHIPPED` count
that folds absorbed candidates into it) is an **unattempted estimate**,
not proof any of them will actually ship. This wave's real-run result
(0/4 absorbed-routed attempts shipped) is a live demonstration of exactly
that gap — the dry-run's optimistic count doesn't guarantee a real-run
ship. Treat these numbers as upper bounds on remaining runway, same as
every prior wave's dry-run estimate, now with the added wrinkle that a
few of each dry-run's "SHIPPED" are absorbed-routed candidates whose real
outcome is unverified until a real wave reaches them.

## Verification

```text
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

Both independently re-verified with a full rebuild after the wave (not
just the last per-batch gate). EUR untouched — `git diff --stat
origin/main -- config/eur src/overlay* src/main` is empty.

## Setup note — one build interruption, no git impact

The JPN pre-carve `ninja sha1` gate-sync (a large cold build in this
fresh worktree, same as every wave's first gate) was killed once by a
tool-call interruption mid-build. Unlike a `batch_carve` interruption,
this carried no git risk at all — no `.s` files or `delinks.txt` had been
touched yet, so recovery was just re-running `ninja sha1` directly; ninja
picked up incrementally from its already-built objects (this run needed
only 5,198 remaining steps vs. the original 8,586, confirming nothing
already-compiled was lost).

## For the next ov002 wave

Same recipe, same `--min-addr 0x021aa3c0`. At ~707 USA / ~823 JPN
(dry-run estimate, treat as upper bound per the caveat above), ov002 has
roughly 5 more waves per region at this size. Worth flagging to whoever
owns the next wave: watch whether the same two absorbed-routed addresses
keep resisting recovery, or whether other `C-absorbed` REFUSEs further
into the remaining pool *do* recover — that would clarify whether
brief 546's 0-for-4 result is specific to these two candidates or a
broader pattern worth investigating.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
