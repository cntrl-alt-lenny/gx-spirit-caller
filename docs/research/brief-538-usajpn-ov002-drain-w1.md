[//]: # (markdownlint-disable MD013 MD041)

# Brief 538 — resume the USA/JPN mechanical `.s` drain: ov002 wave 1

**Brief:** 538 (Claude scaffolder). Own worktree `claude-538`, branch
`claude/usajpn-ov002-drain-538`. The single wine lane this round (the
decomper's brief 539 is wine-free — no contention). RESUME the USA/JPN
mechanical `.s` drain per
[`brief-537-usajpn-runway-census.md`](brief-537-usajpn-runway-census.md)'s
verdict: `ov002` is the whale, ~1,443-1,579 tractable functions per region,
~77-78% of all remaining tractable bytes. This is wave 1 of ~several.

## What shipped

| Region | Shipped | REFUSE | verify-fail | gate-fail | Commits |
|---|---:|---:|---:|---:|---:|
| USA | **148** | 2 | 0 | 0 | 8 |
| JPN | **148** | 2 | 0 | 0 | 8 |
| **Total** | **296** | 4 | 0 | 0 | 16 |

Both regions: `batch_carve.py --overlay ov002 --min-addr 0x021aa3c0
--batch 20 --limit 150`, region-specific `--srcdir` (`src/usa/overlay002`
/ `src/jpn/overlay002`). ov002's real `.text` base is `0x021aa3c0` for
both USA and JPN (confirmed from each region's own
`config/<region>/arm9/overlays/ov002/delinks.txt` first line) — the
documented `0x02234000` default would have silently started ~563KB into
ov002's ~1.1MB address range, skipping roughly half the module.
Commit-on-pass, per-batch `ninja sha1` gate; every batch this wave gated
green on the first attempt (no bisect/park needed).

**Remaining ov002 runway after this wave:** USA 1,295 tractable, JPN
1,431 tractable (both ~99% clean-rate on a fresh dry-run) — confirms
brief 537's "whale" framing; this wave alone accounts for only ~10% of
one region's ov002 opportunity, several more waves remain.

## Setup gotcha — fresh worktree, missing wine tool binaries

First real (non-dry-run) invocation returned `SHIPPED 0 | verify-fail
145` out of 150 — every candidate failing verification, not a handful.
Traced to the actual root cause via a direct manual `asm_escape.py
--whole-function` call on one candidate: `wine: failed to open
"./tools/mwccarm/2.0/sp1p5/mwasmarm.exe"`. `git worktree add` doesn't
carry git-ignored downloaded-tool assets (`tools/mwccarm/`,
`objdiff-cli`) — a fresh worktree needs them copied from an existing one
(or re-downloaded) before any wine-dependent step, not just before
`ninja`'s own build steps (which auto-download via `tools/
download_tool.py`; `asm_escape.py`'s direct wine invocation does not).
Copied `tools/mwccarm/` and `objdiff-cli` from the `brain` worktree;
re-ran the exact same command with the same 150 candidates — 148
shipped, 2 REFUSE, 0 verify-fail. Confirmed safe to just re-run: neither
`--skip-list` nor `--verifyfail-list` was passed, so the failed run's
"parked" candidates were never persisted to disk — nothing to clean up
before retrying.

Also needed one `ninja delink` (a native `dsd` step, no wine) per region
before `asm_escape`'s data-preflight could resolve gap-object symbols —
`build/<region>/delinks/` doesn't exist in a fresh worktree either.

## Recovery note — an interrupted JPN batch

Partway through the JPN wave, a tool-call interruption killed the
`batch_carve` process mid-batch, leaving 20 candidates staged (new `.s`
files + a modified `delinks.txt`) but never gated or committed —
`batch_carve` itself refuses to *start* on a dirty `delinks.txt`
(by design, so it never mistakes leftover state for its own baseline),
so simply re-running would have errored. Verified the 20 staged files
exactly matched a clean `delinks.txt` diff (one entry per file, no
partial/corrupt writes), ran `ninja sha1` directly to confirm the staged
batch was genuinely green, then committed it by hand in the tool's own
message convention before resuming `batch_carve` for the rest — a clean
tree again, no re-derivation needed since nothing had actually been lost.

## Verification

```text
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

EUR untouched this brief (confirmed via `git diff --stat` against the
pre-wave commit showing zero EUR/main/overlay changes — this lane only
touches `src/usa/overlay002/`, `src/jpn/overlay002/`, and the two
regions' `config/*/arm9/overlays/ov002/delinks.txt`).

## For the next ov002 wave

Same recipe, same `--min-addr 0x021aa3c0`, continue from where `--limit`
left off (the tool's own delinks.txt state is the source of truth for
what's already carved — no separate bookkeeping needed). At the current
~99% clean rate, ov002 alone could plausibly finish in ~9 more waves of
this size per region — a good candidate for a larger `--limit` (300-500)
once a wave has confirmed the pattern holds, per the brief's own
"several waves" framing, though the "cap every wave" convention (b476
lesson) argues for staying in the 150-300 range regardless. Once
`brief-539`'s work-order doc lands, subsequent waves can pull the exact
next-module recipe from there instead of re-deriving `--min-addr` by
hand.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
