[//]: # (markdownlint-disable MD013 MD041)

# Brief 542 — USA/JPN mechanical `.s` drain: ov002 wave 3

**Brief:** 542 (Claude scaffolder). Own worktree `claude-542`, branch
`claude/usajpn-ov002-drain-542`. Continues
[brief 540](brief-540-usajpn-ov002-drain-w2.md)'s ov002 drain — wave 3 of
~several, same recipe, same `--min-addr 0x021aa3c0`.

## What shipped

| Region | Shipped | REFUSE | verify-fail | gate-fail | Commits |
|---|---:|---:|---:|---:|---:|
| USA | **148** | 2 | 0 | 0 | 8 |
| JPN | **148** | 2 | 0 | 0 | 8 |
| **Total** | **296** | 4 | 0 | 0 | 16 |

Same command as waves 1-2 for both regions: `batch_carve.py --overlay
ov002 --min-addr 0x021aa3c0 --batch 20 --limit 150`, region-specific
`--srcdir`. Tool binaries (`tools/mwccarm/`, `objdiff-cli`, `dsd`) copied
into the fresh worktree immediately after `git worktree add`, plus one
`ninja delink` per region before the first real carve — both prerequisites
per the standing brief-538 gotcha. No verify-fails, no interruptions this
wave (unlike waves 1-2, which each hit an accidental tool-call interruption
during the JPN portion) — both regions ran start-to-finish in one pass.

**First-gate cold-build note:** each region's very first `ninja sha1` gate
in this fresh worktree took noticeably longer than later batches (tens of
minutes, not the ~1-2 min/batch cadence seen once warm) — this is a fresh
worktree with no cached `build/<region>/` object files, so the first gate
compiles the *entire* ARM9 image (all overlays + main), not just the 20
new carves. Confirmed via `ps aux` that `mwldarm`/`mwasmarm` were actively
working throughout (not stalled/deadlocked) before each first commit
landed; every batch thereafter gated green in the expected short window.

**Cumulative ov002 progress (waves 1-3):** 888 `.s` shipped (296/wave ×
3, ~444/region) against the ~1,443-1,579 tractable population brief 537
originally measured. **Remaining runway after this wave:** USA 999
tractable, JPN 1,135 tractable (both a fresh dry-run, 99% clean-rate) —
ov002 has crossed the halfway mark for USA and is closing in on it for
JPN.

## Verification

```text
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

Both re-confirmed with a full independent rebuild after the wave (not
just the last per-batch gate). EUR untouched — `git diff --stat
origin/main -- config/eur src/overlay* src/main` is empty.

## For the next ov002 wave

Same recipe, same `--min-addr 0x021aa3c0`. At ~999 USA / ~1,135 JPN
remaining and ~148/region per wave, ov002 alone is roughly 7-8 more waves
at this size. [Brief 539's work-order
doc](campaign-analytics/usajpn-drain-workorder.md) has the next-module
queue ready (small overlays sharing ov002's `0x021aa3c0` base, then
`main`) for once ov002 is exhausted. Note brief 541 prototyped an
`asm_escape --allow-absorbed-offset` unlock (validated separately in
brief 543, owns ov004/ov006) that, if it holds, could cut this drain's
own `kind:data` REFUSE rate — worth revisiting as a drain default once
that verdict lands.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
