[//]: # (markdownlint-disable MD013 MD041)

# Brief 548 — USA/JPN mechanical `.s` drain: ov002 wave 6

**Brief:** 548 (Claude scaffolder). Own worktree `claude-548`, branch
`claude/usajpn-ov002-drain-548`. Continues
[brief 546](brief-546-usajpn-ov002-drain-w5.md)'s ov002 drain — wave 6 of
~several, same recipe, same `--min-addr 0x021aa3c0`.

## What shipped

| Region | Shipped | REFUSE | absorbed-routed | verify-fail | gate-fail | Commits |
|---|---:|---:|---:|---:|---:|---:|
| USA | **150** | 0 | 0 | 0 | 0 | 8 |
| JPN | **150** | 0 | 0 | 0 | 0 | 8 |
| **Total** | **300** | 0 | 0 | 0 | 0 | 16 |

Same command as prior waves: `batch_carve.py --overlay ov002 --min-addr
0x021aa3c0 --batch 20 --limit 150`, region-specific `--srcdir`, plus one
addition this wave: `--verifyfail-list build/ov002-verifyfail-seed.txt`,
seeded upfront with the two addresses (`func_ov002_022626c4`,
`func_ov002_022b9434`) that brief 546 proved route-then-verify-fail on
every wave. **First 150/150 clean sweep of the campaign** — both regions
hit 100% clean-rate, 0 wasted absorbed-offset attempts, 0 verify-fail.

## Seed file — confirmed working exactly as intended

Per LANE STATE's explicit ask, seeded a git-ignored scratch file
(`build/ov002-verifyfail-seed.txt`, one func name + reason per line — the
format `parse_skiplist()` expects, confirmed by reading
`tools/batch_carve.py` before use) with the two known-bad addresses, then
passed it to `--verifyfail-list` for both regions. Confirmed by absence:
neither wave's log showed the `◆ REFUSE (C-absorbed...)` line for either
address — they were filtered out of the candidate pool before
enumeration entirely, rather than being attempted and failing. Net
result: both regions shipped exactly 150/150 with zero waste, versus
148/150 (2 wasted attempts) every prior wave since the b545 wiring
landed.

Note: this seed only covers the two addresses already proven to fail.
Fresh dry-run checks after this wave (see below) show a **different**
pair (`func_ov002_022b856c`, `func_ov002_022b9c94`) still showing
`absorbed-routed` in the remaining pool — same shape of case, further
into the address range, not yet reached by a real wave. Whether *these*
also verify-fail (matching the b546 pattern) or actually ship is still
open — brief 549's autopsy should clarify, and future waves will find
out empirically regardless.

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
| USA | 555 | 2 |
| JPN | 671 | 2 |

Same caveat as brief 546 documented: dry-run's `absorbed-routed` count is
an unattempted classify()-only estimate, not a shipped guarantee.

## For the next ov002 wave

Same recipe, same `--min-addr 0x021aa3c0`, same
`--verifyfail-list build/ov002-verifyfail-seed.txt` (the seed file
persists in this worktree's `build/` — if a future wave starts a fresh
worktree, recreate it with the same two addresses, or grow it if brief
549's autopsy identifies more permanently-failing candidates). At ~555
USA / ~671 JPN remaining, ov002 has roughly 4 more waves per region at
this size.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
