[//]: # (markdownlint-disable MD013 MD041)

# Brief 540 — USA/JPN mechanical `.s` drain: ov002 wave 2

**Brief:** 540 (Claude scaffolder). Own worktree `claude-540`, branch
`claude/usajpn-ov002-drain-540`. Continues
[brief 538](brief-538-usajpn-ov002-drain-w1.md)'s ov002 drain — wave 2 of
~several, same recipe, same `--min-addr 0x021aa3c0`.

## What shipped

| Region | Shipped | REFUSE | verify-fail | gate-fail | Commits |
|---|---:|---:|---:|---:|---:|
| USA | **148** | 2 | 0 | 0 | 8 |
| JPN | **148** | 2 | 0 | 0 | 8 |
| **Total** | **296** | 4 | 0 | 0 | 16 |

Same command as wave 1 for both regions: `batch_carve.py --overlay ov002
--min-addr 0x021aa3c0 --batch 20 --limit 150`, region-specific `--srcdir`.
Copied the git-ignored `tools/mwccarm/`, `objdiff-cli`, `dsd` binaries
into the fresh worktree immediately after `git worktree add` (brief 538's
own documented gotcha) — no verify-fails from missing tools this time.
Every batch gated green on the first attempt; no bisect/park needed.

**Cumulative ov002 progress (waves 1+2):** 592 `.s` shipped (296/region)
against the ~1,443-1,579 tractable population brief 537 originally
measured. **Remaining runway after this wave:** USA 1,147 tractable, JPN
1,283 tractable (both a fresh dry-run, 99% clean-rate) — ov002 alone
still has several more waves of this size ahead per region.

## Recovery note — a second interrupted batch (same shape as brief 538)

A tool-call interruption during the JPN wave killed `batch_carve`
mid-first-batch, leaving 20 candidates staged (new `.s` files + a
modified `delinks.txt`) but never gated or committed — identical shape
to the recovery brief 538 already documented and the exact scenario
`batch_carve`'s dirty-tree startup refusal exists to guard against.
Same recovery: confirmed the 20 staged files matched the `delinks.txt`
diff exactly (one entry per file), ran `ninja sha1` directly to confirm
the staged batch was genuinely green, committed it by hand in the tool's
own message convention, then resumed `batch_carve --limit 130` for the
rest. Worth noting as a *pattern* now (twice in two waves) rather than a
one-off — any future wave should expect an interruption may leave a
dirty-but-recoverable staged batch, and the recovery procedure is now
routine: verify the diff is 1:1 with the new files, gate it directly,
commit by hand, resume.

## Verification

```text
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

Both re-confirmed with a full clean rebuild after the wave (not just the
last per-batch gate). EUR untouched — `git diff --stat origin/main` shows
zero changes outside `src/usa/overlay002/`, `src/jpn/overlay002/`, and
the two regions' `config/*/arm9/overlays/ov002/delinks.txt`.

## For the next ov002 wave

Same recipe, same `--min-addr 0x021aa3c0`. At ~1,147 USA / ~1,283 JPN
remaining and ~148/region per wave, ov002 alone is roughly 8-9 more
waves at this size — [brief 539's work-order
doc](campaign-analytics/usajpn-drain-workorder.md) landed during this
wave and confirms the same base address and recipe independently, plus
has the next-module queue ready (small overlays, then `main`) for once
ov002 is exhausted.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
