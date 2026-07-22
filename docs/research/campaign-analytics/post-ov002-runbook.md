[//]: # (markdownlint-disable MD013 MD041)

# Post-`ov002` USA/JPN drain — push-button runbook

**Status:** brief 553 (2026-07-08); made cross-platform + Wave 11 added by
brief 561 (2026-07-09, improvement-swarm r3 finding — see § Safety flags:
"the post-ov002 runbook is Mac-only in practice"). Turns
`post-ov002-drain-workorder.md`'s 10-wave plan into copy-paste-ready
command blocks — one per wave, each self-contained. Every module's
`--min-addr`/`--srcdir` is already filled in; no lookup, no per-module
setup guesswork. Census-refreshed same session (see that doc's own §
Census refresh) — zero drift on any of the 21 modules below, so this plan
is current as of brief 553. All command blocks use plain `python` (not
`python`) and repo-relative paths, so they run unmodified on both
Mac/Linux and Windows.

**Do not touch `ov002` in Waves 1-10** — during those waves it's the
scaffolder's own active lane. **Wave 11 (below) is the exception**: it
runs *after* the main ov002 lane's pivot logic has moved on and left a
residual population behind (see § Wave 11 for why), so it's a distinct,
later-stage cleanup step, not a conflict with the active lane. If the
scaffolder's own ov002 lane is still running when you'd start Wave 11,
wait for it to finish (or coordinate) first.

## Before wave 1 — one-time setup (if starting a fresh worktree)

From your `brain` worktree (see AGENTS.md § Worktree convention for the
exact path/mechanism on your platform — manual sibling worktrees on Mac,
Claude Code sandbox worktrees on Windows):

```bash
git fetch origin
git worktree add ../claude-<NNN> -b claude/post-ov002-drain-<NNN> origin/main
cd ../claude-<NNN>
cp -R ../brain/tools/mwccarm tools/ && cp ../brain/objdiff-cli ../brain/dsd .
```

The `cp -R ../brain/...` line assumes a sibling `brain` worktree
(Mac/manual convention); on a Windows Claude Code sandbox worktree, copy
the same three git-ignored paths (`tools/mwccarm/`, `objdiff-cli`, `dsd`)
from whichever existing worktree already has them — `configure.py` will
otherwise re-download them on first run, which works but is slower.

If reusing an existing worktree, skip straight to whichever wave is
next — every wave block below is self-contained and starts with its own
region resync, so there's no cross-wave state to restore by hand.

## Wave 1 — `ov000` (170 ships)

```bash
python tools/configure.py usa && ninja delink
python tools/configure.py jpn && ninja delink

mkdir -p src/usa/overlay000 src/jpn/overlay000

python tools/batch_carve.py --version usa --overlay ov000 --srcdir src/usa/overlay000 --min-addr 0x021aa3c0 --batch 20 --limit 150
python tools/batch_carve.py --version jpn --overlay ov000 --srcdir src/jpn/overlay000 --min-addr 0x021aa3c0 --batch 20 --limit 150
```

## Wave 2 — `ov008` (142 ships)

```bash
python tools/configure.py usa && ninja delink
python tools/configure.py jpn && ninja delink

mkdir -p src/usa/overlay008 src/jpn/overlay008

python tools/batch_carve.py --version usa --overlay ov008 --srcdir src/usa/overlay008 --min-addr 0x021aa3c0 --batch 20 --limit 150
python tools/batch_carve.py --version jpn --overlay ov008 --srcdir src/jpn/overlay008 --min-addr 0x021aa3c0 --batch 20 --limit 150
```

## Wave 3 — `ov005` (126 ships)

```bash
python tools/configure.py usa && ninja delink
python tools/configure.py jpn && ninja delink

mkdir -p src/usa/overlay005 src/jpn/overlay005

python tools/batch_carve.py --version usa --overlay ov005 --srcdir src/usa/overlay005 --min-addr 0x021aa3c0 --batch 20 --limit 150
python tools/batch_carve.py --version jpn --overlay ov005 --srcdir src/jpn/overlay005 --min-addr 0x021aa3c0 --batch 20 --limit 150
```

## Wave 4 — `ov010` (124 ships)

```bash
python tools/configure.py usa && ninja delink
python tools/configure.py jpn && ninja delink

mkdir -p src/usa/overlay010 src/jpn/overlay010

python tools/batch_carve.py --version usa --overlay ov010 --srcdir src/usa/overlay010 --min-addr 0x021b2180 --batch 20 --limit 150
python tools/batch_carve.py --version jpn --overlay ov010 --srcdir src/jpn/overlay010 --min-addr 0x021b2180 --batch 20 --limit 150
```

## Wave 5 — `ov016` (112 ships)

```bash
python tools/configure.py usa && ninja delink
python tools/configure.py jpn && ninja delink

mkdir -p src/usa/overlay016 src/jpn/overlay016

python tools/batch_carve.py --version usa --overlay ov016 --srcdir src/usa/overlay016 --min-addr 0x021b2180 --batch 20 --limit 150
python tools/batch_carve.py --version jpn --overlay ov016 --srcdir src/jpn/overlay016 --min-addr 0x021b2180 --batch 20 --limit 150
```

## Wave 6 — `ov017` + `ov015` (156 ships)

Same base group (`0x021b2180`) — independent delinks/gap objects per
overlay, no cross-module risk.

```bash
python tools/configure.py usa && ninja delink
python tools/configure.py jpn && ninja delink

mkdir -p src/usa/overlay017 src/jpn/overlay017
python tools/batch_carve.py --version usa --overlay ov017 --srcdir src/usa/overlay017 --min-addr 0x021b2180 --batch 20 --limit 150
python tools/batch_carve.py --version jpn --overlay ov017 --srcdir src/jpn/overlay017 --min-addr 0x021b2180 --batch 20 --limit 150

mkdir -p src/usa/overlay015 src/jpn/overlay015
python tools/batch_carve.py --version usa --overlay ov015 --srcdir src/usa/overlay015 --min-addr 0x021b2180 --batch 20 --limit 150
python tools/batch_carve.py --version jpn --overlay ov015 --srcdir src/jpn/overlay015 --min-addr 0x021b2180 --batch 20 --limit 150
```

## Wave 7 — `main` (68 ships: 8 clean + 26 `C-absorbed`-recovered, ×2 regions)

`main`'s 26/region `C-absorbed` REFUSEs are the exact population brief
549 fixed (`diff_words()` comparator bug) and brief 553 confirmed
shipping in production on `ov002` — expect them to ship here too, not
verify-fail. No `--overlay` flag for main.

```bash
python tools/configure.py usa && ninja delink
python tools/configure.py jpn && ninja delink

mkdir -p src/usa/main src/jpn/main

python tools/batch_carve.py --version usa --srcdir src/usa/main --min-addr 0x02000000 --batch 20 --limit 150
python tools/batch_carve.py --version jpn --srcdir src/jpn/main --min-addr 0x02000000 --batch 20 --limit 150
```

## Wave 8 — `ov019` + `ov020` + `ov014` + `ov009` (232 ships)

```bash
python tools/configure.py usa && ninja delink
python tools/configure.py jpn && ninja delink

mkdir -p src/usa/overlay019 src/jpn/overlay019
python tools/batch_carve.py --version usa --overlay ov019 --srcdir src/usa/overlay019 --min-addr 0x021b2180 --batch 20 --limit 150
python tools/batch_carve.py --version jpn --overlay ov019 --srcdir src/jpn/overlay019 --min-addr 0x021b2180 --batch 20 --limit 150

mkdir -p src/usa/overlay020 src/jpn/overlay020
python tools/batch_carve.py --version usa --overlay ov020 --srcdir src/usa/overlay020 --min-addr 0x021aa3c0 --batch 20 --limit 150
python tools/batch_carve.py --version jpn --overlay ov020 --srcdir src/jpn/overlay020 --min-addr 0x021aa3c0 --batch 20 --limit 150

mkdir -p src/usa/overlay014 src/jpn/overlay014
python tools/batch_carve.py --version usa --overlay ov014 --srcdir src/usa/overlay014 --min-addr 0x021b2180 --batch 20 --limit 150
python tools/batch_carve.py --version jpn --overlay ov014 --srcdir src/jpn/overlay014 --min-addr 0x021b2180 --batch 20 --limit 150

mkdir -p src/usa/overlay009 src/jpn/overlay009
python tools/batch_carve.py --version usa --overlay ov009 --srcdir src/usa/overlay009 --min-addr 0x021aa3c0 --batch 20 --limit 150
python tools/batch_carve.py --version jpn --overlay ov009 --srcdir src/jpn/overlay009 --min-addr 0x021aa3c0 --batch 20 --limit 150
```

## Wave 9 — `ov003` + `ov007` + `ov021` + `ov012` + `ov022` (174 ships)

```bash
python tools/configure.py usa && ninja delink
python tools/configure.py jpn && ninja delink

mkdir -p src/usa/overlay003 src/jpn/overlay003
python tools/batch_carve.py --version usa --overlay ov003 --srcdir src/usa/overlay003 --min-addr 0x021c9c80 --batch 20 --limit 150
python tools/batch_carve.py --version jpn --overlay ov003 --srcdir src/jpn/overlay003 --min-addr 0x021c9c80 --batch 20 --limit 150

mkdir -p src/usa/overlay007 src/jpn/overlay007
python tools/batch_carve.py --version usa --overlay ov007 --srcdir src/usa/overlay007 --min-addr 0x021b2180 --batch 20 --limit 150
python tools/batch_carve.py --version jpn --overlay ov007 --srcdir src/jpn/overlay007 --min-addr 0x021b2180 --batch 20 --limit 150

mkdir -p src/usa/overlay021 src/jpn/overlay021
python tools/batch_carve.py --version usa --overlay ov021 --srcdir src/usa/overlay021 --min-addr 0x021aa3c0 --batch 20 --limit 150
python tools/batch_carve.py --version jpn --overlay ov021 --srcdir src/jpn/overlay021 --min-addr 0x021aa3c0 --batch 20 --limit 150

mkdir -p src/usa/overlay012 src/jpn/overlay012
python tools/batch_carve.py --version usa --overlay ov012 --srcdir src/usa/overlay012 --min-addr 0x021c9c80 --batch 20 --limit 150
python tools/batch_carve.py --version jpn --overlay ov012 --srcdir src/jpn/overlay012 --min-addr 0x021c9c80 --batch 20 --limit 150

mkdir -p src/usa/overlay022 src/jpn/overlay022
python tools/batch_carve.py --version usa --overlay ov022 --srcdir src/usa/overlay022 --min-addr 0x021aa3c0 --batch 20 --limit 150
python tools/batch_carve.py --version jpn --overlay ov022 --srcdir src/jpn/overlay022 --min-addr 0x021aa3c0 --batch 20 --limit 150
```

## Wave 10 — `ov013` + `ov018` + `ov001` + `ov023` (46 ships — mop-up)

The four smallest modules; comfortably a single short wave.

```bash
python tools/configure.py usa && ninja delink
python tools/configure.py jpn && ninja delink

mkdir -p src/usa/overlay013 src/jpn/overlay013
python tools/batch_carve.py --version usa --overlay ov013 --srcdir src/usa/overlay013 --min-addr 0x021c9c80 --batch 20 --limit 150
python tools/batch_carve.py --version jpn --overlay ov013 --srcdir src/jpn/overlay013 --min-addr 0x021c9c80 --batch 20 --limit 150

mkdir -p src/usa/overlay018 src/jpn/overlay018
python tools/batch_carve.py --version usa --overlay ov018 --srcdir src/usa/overlay018 --min-addr 0x021aa3c0 --batch 20 --limit 150
python tools/batch_carve.py --version jpn --overlay ov018 --srcdir src/jpn/overlay018 --min-addr 0x021aa3c0 --batch 20 --limit 150

mkdir -p src/usa/overlay001 src/jpn/overlay001
python tools/batch_carve.py --version usa --overlay ov001 --srcdir src/usa/overlay001 --min-addr 0x021c9c80 --batch 20 --limit 150
python tools/batch_carve.py --version jpn --overlay ov001 --srcdir src/jpn/overlay001 --min-addr 0x021c9c80 --batch 20 --limit 150

mkdir -p src/usa/overlay023 src/jpn/overlay023
python tools/batch_carve.py --version usa --overlay ov023 --srcdir src/usa/overlay023 --min-addr 0x021b2180 --batch 20 --limit 150
python tools/batch_carve.py --version jpn --overlay ov023 --srcdir src/jpn/overlay023 --min-addr 0x021b2180 --batch 20 --limit 150
```

## Wave 11 — `ov002` mop-up (orphaned candidates: USA ~107 + JPN ~73)

**Why this wave exists** (improvement-swarm r3 finding, brief 561): the
drain's pivot logic moves a region off `ov002` once its remaining
candidate count drops low enough to look "nearly done," and no later
wave ever comes back to finish it — so ~180 real candidates (USA ~107,
JPN ~73, at the time of the r3 census) sit permanently un-drained even
though the rest of the campaign has moved on. This wave is the one-time
sweep-up: same standard `ov002` recipe as the scaffolder's own lane
(`--min-addr 0x021aa3c0`), just run to exhaustion instead of stopping
early. Re-check the live counts before running — `--dry-run` first is
cheap insurance if it's been a while since the r3 census:

```bash
python tools/configure.py usa && ninja delink
python tools/configure.py jpn && ninja delink

mkdir -p src/usa/overlay002 src/jpn/overlay002

# optional sanity check first (no build, no commit):
python tools/batch_carve.py --version usa --overlay ov002 --srcdir src/usa/overlay002 --min-addr 0x021aa3c0 --dry-run
python tools/batch_carve.py --version jpn --overlay ov002 --srcdir src/jpn/overlay002 --min-addr 0x021aa3c0 --dry-run

python tools/batch_carve.py --version usa --overlay ov002 --srcdir src/usa/overlay002 --min-addr 0x021aa3c0 --batch 20 --limit 150
python tools/batch_carve.py --version jpn --overlay ov002 --srcdir src/jpn/overlay002 --min-addr 0x021aa3c0 --batch 20 --limit 150
```

If either region's `--limit 150` run doesn't exhaust its remaining
population (the r3 counts suggest one pass should for both), re-run the
same command — same idempotent re-run guarantee as every other wave (see
§ After each wave below).

## After each wave

`batch_carve.py` gates and auto-commits internally (`ninja sha1` per
batch, commit only on green) — no separate manual gate or commit step.
Push and open/update a PR same as any other wave. If a wave is
interrupted mid-module, the next attempt is safe to just re-run the
same command — `batch_carve.py` reads live `delinks.txt` state fresh
every invocation and only acts on functions still uncarved.

## Reference

Full per-module rationale, candidate/clean/recoverable breakdown, and
the census methodology: `post-ov002-drain-workorder.md` (this doc is
its execution-ready companion — the workorder explains *what* and
*why*, this one is *exactly what to paste*).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
