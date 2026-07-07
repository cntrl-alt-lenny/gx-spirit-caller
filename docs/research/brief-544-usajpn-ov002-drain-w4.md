[//]: # (markdownlint-disable MD013 MD041)

# Brief 544 — USA/JPN mechanical `.s` drain: ov002 wave 4

**Brief:** 544 (Claude scaffolder). Own worktree `claude-544`, branch
`claude/usajpn-ov002-drain-544`. Continues
[brief 542](brief-542-usajpn-ov002-drain-w3.md)'s ov002 drain — wave 4 of
~several, same recipe, same `--min-addr 0x021aa3c0`.

## What shipped

| Region | Shipped | REFUSE | verify-fail | gate-fail | Commits |
|---|---:|---:|---:|---:|---:|
| USA | **148** | 2 | 0 | 0 | 8 |
| JPN | **168** | 2 | 0 | 0 | 9 |
| **Total** | **316** | 4 | 0 | 0 | 17 |

Same command as prior waves for USA: `batch_carve.py --overlay ov002
--min-addr 0x021aa3c0 --batch 20 --limit 150`, clean run, 148 shipped, 2
REFUSE, matching every prior wave exactly. JPN shipped 168 (not the usual
148) — see recovery note below for why; every batch, including the
recovered/resumed ones, gated green independently, so the extra 20 are
just as verified-correct as the rest, only unplanned in count.

**Cumulative ov002 progress (waves 1-4):** 1,204 `.s` shipped (592 USA,
612 JPN) against the ~1,443-1,579 tractable population brief 537
originally measured.

**Remaining runway after this wave:** USA 851 tractable, JPN 967
tractable (both a fresh dry-run, 99% clean-rate).

## Recovery note — interrupted JPN batch, and a limit-recalculation slip

A tool-call interruption hit during the JPN wave (same recoverable shape
as waves 1, 2, and (absent in) 3 — this makes it 3 of 4 waves so far with
a JPN-side interruption, likely just this environment's actual failure
mode rather than anything JPN-specific). This time the interruption also
reset the shell's persistent working directory (a `git status` right
after came back `fatal: not a git repository` from the parent
`spirit-caller/` directory) — recovered by explicitly `cd`-ing into the
worktree on every command until a normal call re-established it.

The staged batch (20 `.s` + a modified `delinks.txt`) was verified 1:1
against the diff, gated directly via `ninja sha1` (OK), and committed by
hand. Its commit message's size-range label (`0x100-0x104`) was a guess
carried over from the last known-good commit rather than a freshly
computed value — turned out to duplicate the label of an *earlier* batch
(`e7212718`) that had, unbeknownst to this guess, already landed before
the interruption. Purely cosmetic (the label is descriptive metadata
only; the actual staged files were independently verified against the
diff and gated before committing), but it fed a real accounting error:
when resuming `batch_carve`, the reduced `--limit` was computed as "40
already committed, so `--limit 150-40=110`" — actually **60** had already
committed by that point (three batches: the two pre-interruption plus the
one just recovered), not 40. The correct resume value should have been
`--limit 90`. Using `110` instead let the resumed run process 20 more
candidates than the wave's original 150-candidate scope called for,
hence JPN's 168 vs. USA's 148.

Not a correctness issue — every one of the 168 gated green independently,
batch by batch, same as always — just a scope overshoot from mis-adding
up already-committed batches under interruption pressure. Worth a
standing note for future recoveries: **count already-committed batches
from `git log`, don't reconstruct the count from memory of an
interruption's timing.**

## Verification

```text
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

Both re-confirmed with a full independent rebuild after the wave. EUR
untouched — `git diff --stat origin/main -- config/eur src/overlay*
src/main` is empty.

## For the next ov002 wave

Same recipe, same `--min-addr 0x021aa3c0`. At ~851 USA / ~967 JPN
remaining, ov002 has roughly 6 more waves per region at the usual ~150
candidates/wave pace (JPN slightly ahead of that pace after this wave's
overshoot). [Brief 539's work-order
doc](campaign-analytics/usajpn-drain-workorder.md) has the next-module
queue ready for once ov002 is exhausted. Brief 545 is wiring the
validated `--allow-absorbed-offset` unlock into `batch_carve` as a drain
default — the *next* wave after this one should pick up that change and
can report whether it measurably cuts the (currently constant, ~2/region)
REFUSE rate.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
