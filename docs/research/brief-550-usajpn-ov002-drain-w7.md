[//]: # (markdownlint-disable MD013 MD041)

# Brief 550 — USA/JPN mechanical `.s` drain: ov002 wave 7 (first live wave on the b549 fix)

**Brief:** 550 (Claude scaffolder). Own worktree `claude-550`, branch
`claude/usajpn-ov002-drain-550`. Continues
[brief 548](brief-548-usajpn-ov002-drain-w6.md)'s ov002 drain — wave 7 of
~several, same recipe, same `--min-addr 0x021aa3c0`. First full wave on
the b549-fixed `asm_escape` (the comparator bug that made brief 546's
C-absorbed `base+offset` recoveries falsely verify-fail is now fixed;
the brain independently proved `func_ov002_022626c4` ships via a real
`ninja sha1`). Per LANE STATE's instruction, ran **without** a
`--verifyfail-list` seed this wave — the whole point was to let the two
previously-parked addresses through and confirm they ship for real.

## What shipped

| Region | Shipped | REFUSE | absorbed-routed | verify-fail | gate-fail | Commits |
|---|---:|---:|---:|---:|---:|---:|
| USA | **150** | 0 | 2 | 0 | 0 | 8 |
| JPN | **150** | 0 | 2 | 0 | 0 | 8 |
| **Total** | **300** | 0 | 4 | 0 | 0 | 16 |

Same command as every prior wave for both regions: `batch_carve.py
--overlay ov002 --min-addr 0x021aa3c0 --batch 20 --limit 150`,
region-specific `--srcdir`, **no** `--verifyfail-list` this time.

## First live confirmation of the b549 fix — 4/4 absorbed-routed shipped

Both regions hit the same two addresses as every prior wave —
`func_ov002_022626c4` and `func_ov002_022b9434` — and this time both
landed in `+ ... staged` (shipped), not `✗ verify-fail`:

```text
◆ func_ov002_022626c4 REFUSE (C-absorbed, base+offset-recoverable — attempting)
+ func_ov002_022626c4 (0x58) staged [1/20]
◆ func_ov002_022b9434 REFUSE (C-absorbed, base+offset-recoverable — attempting)
+ func_ov002_022b9434 (0x88) staged [2/20]
```

Both were part of a batch that gated green (`ninja sha1 OK`) and both
final REPORT lines confirm it numerically: `absorbed-routed 2` with
`verify-fail 0` in both regions — **4 of 4 absorbed-routed attempts
shipped this wave**, versus 0 of 4 in brief 546. This is the first live,
full-wave confirmation of the b549 fix (previously only proven on a
single hand-picked function by the brain). Net effect vs. brief 548
(which used a seed to seal these two off): identical 150/150 clean
sweep, except now the two candidates are genuinely recovered ships
instead of pre-filtered skips — one wave's worth of real functions that
would otherwise still be sitting unclaimed.

## Recovery note — one interrupted USA batch, clean JPN run

A tool-call interruption hit during the USA wave, mid-6th-batch (same
recoverable shape documented in prior waves). At the point of
interruption, 4 batches (80 shipped, including both absorbed-routed
functions in batch 1) had already committed; a 5th batch (20 more) was
staged with a matching `delinks.txt` diff but never gated. Verified the
diff was 1:1 with the new files, gated it directly via `ninja sha1`
(OK), committed it by hand, then resumed `batch_carve --limit 50` (100
already committed, 150 target − 100 = 50 remaining) for the rest —
yielding 50 more shipped across 3 commits, 150 total for USA, matching
JPN's clean-run total exactly. JPN ran the full 150-candidate wave in
one pass with no interruption.

## Verification

```text
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

Both independently re-verified with a full rebuild after the wave. EUR
untouched — `git diff --stat origin/main -- config/eur src/overlay*
src/main` is empty.

## Remaining runway (dry-run estimate)

| Region | SHIPPED (dry-run) | absorbed-routed (dry-run) |
|---|---:|---:|
| USA | 407 | 2 |
| JPN | 523 | 2 |

A **different** pair (`func_ov002_022b856c`, `func_ov002_022b9c94`) now
shows up as the dry-run's `absorbed-routed` estimate, further into the
remaining pool — same shape as this wave's confirmed-recoverable pair,
untested by a real wave yet. Given this wave's 4/4 result, there's good
reason to expect these ship too, but per the standing caveat (dry-run
only classifies, never calls `whole_function()`) that's still an
expectation, not a confirmed fact until a real wave reaches them.

## For the next ov002 wave

Same recipe, same `--min-addr 0x021aa3c0`, **no verifyfail-list needed**
— the fix means every wave going forward should naturally recover its
own C-absorbed candidates instead of needing a growing skip-list. At
~407 USA / ~523 JPN remaining, ov002 has roughly 3 more waves per region
at this size before moving to the small-overlay/main queue in
[brief 539's work-order doc](campaign-analytics/usajpn-drain-workorder.md)
(brief 551 is producing the turnkey post-ov002 plan in parallel).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
