[//]: # (markdownlint-disable MD013 MD041)

# Brief 554 — USA/JPN mechanical `.s` drain: ov002 wave 9

**Brief:** 554 (Claude scaffolder). Own worktree `claude-554`, branch
`claude/usajpn-ov002-drain-554`. Continues
[brief 552](brief-552-usajpn-ov002-drain-w8.md)'s ov002 drain — wave 9,
same recipe, same `--min-addr 0x021aa3c0`.

## What shipped

| Region | Shipped | REFUSE | absorbed-routed | verify-fail | gate-fail | Commits |
|---|---:|---:|---:|---:|---:|---:|
| USA | **150** | 0 | 0 | 0 | 0 | 8 |
| JPN | **150** | 0 | 1 | 0 | 0 | 8 |
| **Total** | **300** | 0 | 1 | 0 | 0 | 16 |

Same command as every wave since b545: `batch_carve.py --overlay ov002
--min-addr 0x021aa3c0 --batch 20 --limit 150`, region-specific `--srcdir`,
no `--verifyfail-list`. Both regions another 150/150 clean sweep,
100% clean rate.

JPN's wave shipped `func_ov002_022b856c` — the address brief 552 flagged
as unattempted for JPN (it had already shipped on the USA side that same
wave). It went through the full real carve and gated green, so both
regions have now independently confirmed this address recovers via
`--allow-absorbed-offset`. The one remaining unattempted absorbed-routed
address, `func_ov002_022b9c94`, still shows up in both regions' fresh
dry-run census below — same shape, expected to ship whenever a real wave
reaches it.

### Operational note: JPN batch interruption + recovery

The JPN carve run was interrupted mid-second-batch by a tool-call hiccup
(unrelated to the carve itself — the underlying `batch_carve.py` process
was killed with 20 `.s` files already written and staged but no gate
confirmation yet printed). Recovered per the standard procedure:
confirmed `git status --short` showed exactly 20 new `.s` files + 1
modified `delinks.txt` (cross-checked against the log's staged list),
independently re-ran `rm -f gx-spirit-caller_jpn.nds && ninja sha1` to
confirm the staged batch gated green on its own, committed it by hand
with the tool's own message convention, then resumed `batch_carve` with
`--limit` reduced by the 40 candidates already committed (150 → 110).
The resumed run picked up cleanly with no duplicate or skipped
candidates. All 150 JPN commits verify identically whether shipped by
the tool or recovered by hand — the table above counts both.

## Verification

```text
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

Both independently re-verified with a full rebuild after the wave (USA
verified before switching build.ninja to JPN; JPN verified after its
wave completed). EUR untouched — `git diff --stat origin/main..HEAD`
shows zero changes outside `src/usa/overlay002/`,
`src/jpn/overlay002/`, and the two regions'
`config/*/arm9/overlays/ov002/delinks.txt` (302 files changed, all
insertions, 0 deletions).

## Remaining ov002 runway — USA drops below threshold

| Region | Remaining (fresh dry-run, full census) | absorbed-routed (unattempted est.) |
|---|---:|---:|
| USA | **107** | 1 (`func_ov002_022b9c94`) |
| JPN | **223** | 1 (`func_ov002_022b9c94`) |

USA's remaining count (107) is now **below the ~150/wave "running low"
threshold** — USA's *next* wave should pivot to
[`post-ov002-runbook.md`](campaign-analytics/post-ov002-runbook.md)
(ov000 first, copy-paste blocks) instead of another ov002 pass. JPN
still has runway for one more full ov002 wave (223, finishing to ~73
remaining), after which it too pivots.

## For the next wave

- **USA**: switch to `post-ov002-runbook.md`, ov000 first.
- **JPN**: one more ov002 wave, same recipe, same `--min-addr
  0x021aa3c0`, no verifyfail seed — expect it to land JPN under the
  threshold too (~73 remaining), setting up the following wave to pivot
  both regions onto the post-ov002 sweep together.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
