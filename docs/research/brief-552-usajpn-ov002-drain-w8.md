[//]: # (markdownlint-disable MD013 MD041)

# Brief 552 — USA/JPN mechanical `.s` drain: ov002 wave 8

**Brief:** 552 (Claude scaffolder). Own worktree `claude-552`, branch
`claude/usajpn-ov002-drain-552`. Continues
[brief 550](brief-550-usajpn-ov002-drain-w7.md)'s ov002 drain — wave 8 of
~several, same recipe, same `--min-addr 0x021aa3c0`.

## What shipped

| Region | Shipped | REFUSE | absorbed-routed | verify-fail | gate-fail | Commits |
|---|---:|---:|---:|---:|---:|---:|
| USA | **150** | 0 | 1 | 0 | 0 | 8 |
| JPN | **150** | 0 | 0 | 0 | 0 | 8 |
| **Total** | **300** | 0 | 1 | 0 | 0 | 16 |

Same command as every wave since b545: `batch_carve.py --overlay ov002
--min-addr 0x021aa3c0 --batch 20 --limit 150`, region-specific `--srcdir`,
no `--verifyfail-list` (per LANE STATE — the b549 comparator fix makes
seeding unnecessary now). Both regions another 150/150 clean sweep.

USA's wave surfaced one more absorbed-routed function,
`func_ov002_022b856c` — the same address flagged as "unattempted" in
brief 548's dry-run and confirmed shipping in brief 550's wave. This
wave it went through the full real carve (not just dry-run) and shipped
cleanly, reconfirming the b549 fix generalizes past the original two
addresses brief 550 first proved.

## Verification

```text
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

Both independently re-verified with a full rebuild after the wave. EUR
untouched — `git diff --stat` against the pre-wave commit shows zero
changes outside `src/usa/overlay002/`, `src/jpn/overlay002/`, and the
two regions' `config/*/arm9/overlays/ov002/delinks.txt`.

## Remaining ov002 runway — USA closing in

| Region | Remaining (fresh dry-run, full census) | absorbed-routed (unattempted est.) |
|---|---:|---:|
| USA | **257** | 1 (`func_ov002_022b9c94`) |
| JPN | **373** | 2 (`func_ov002_022b856c`, `func_ov002_022b9c94`) |

Neither region is below the ~150/region "running low" threshold yet, so
**ov002 is not fully drained this wave** — the next scaffolder wave
continues the same recipe. USA is close: at ~150/wave, USA's remaining
257 is under two more waves (one wave of 150 would leave only ~107,
likely finishing USA's ov002 portion in wave 9 or 10). JPN has more
runway (373, ~2-3 more waves). Once **both** regions drop under one
wave's worth, the following wave should switch to
`post-ov002-drain-workorder.md` (ov000 first) per LANE STATE.

The lone recurring REFUSE-then-ship address `func_ov002_022b9c94` shows
up in both regions' remaining pool — same C-absorbed shape as the others,
expected to ship cleanly once a real (non-dry-run) wave reaches it,
consistent with every other absorbed-routed candidate seen since b549.

## For the next ov002 wave

Same recipe, same `--min-addr 0x021aa3c0`, no verifyfail seed. Watch for
ov002 crossing the drain-complete threshold on both regions — when it
does, pivot to `docs/research/campaign-analytics/post-ov002-drain-workorder.md`
(ov000 first, per LANE STATE's turnkey runbook).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
