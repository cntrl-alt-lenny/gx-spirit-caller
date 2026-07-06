[//]: # (markdownlint-disable MD013 MD041)

# USA/JPN mechanical `.s`-drain work order

**Status:** brief 539 (2026-07-06), wine-free follow-on to brief 537's
census (verdict: RESUME). Turns that census into a **turnkey, re-runnable
multi-wave work order** — every module gets an exact `batch_carve.py`
invocation, its true base address, its tractable count/size tiers, and
any gotcha to pre-empt, so the scaffolder (or a future PC dual-lane
round) can execute wave after wave without re-deriving anything.

**Freshness note.** Counts here are a snapshot re-measured from this
brief's own worktree (origin/main as of this commit) using the same
method as brief 537 — not copy-pasted from that doc. Brief 538 may be
draining ov002 concurrently; re-running the exact commands below is
always safe (they only ever act on functions still uncarved at run
time — see "How this stays correct as waves land," below) even if the
counts have since shrunk.

## Headline numbers (this snapshot)

| | USA | JPN |
|---|---:|---:|
| Uncarved | 2,152 | 2,287 |
| Tractable (preflight-clean) | 2,107 | 2,242 |
| REFUSE (confirmed `C-absorbed` wall) | 45 | 45 |
| Tractable bytes | 1,160,352 | 1,185,984 |

Every REFUSE in every module in both regions is `C-absorbed` — a
genuine kind:data wall, not a config artifact (see brief 537 for the
validation method).

## How this stays correct as waves land

`batch_carve.py` re-reads `symbols.txt` + `delinks.txt` fresh on every
invocation and computes "uncarved" from that live state (see
`carved_addrs()` in `tools/batch_carve.py`). **The exact same command
for a module can be re-run indefinitely** — each run only ever touches
functions still uncarved at that moment, commits on a green gate, and
reverts on red. There is no manual bookkeeping between waves: run the
module's command with `--limit 150` (or your chunk size), let it
finish, check the report line, and re-run the identical command next
session. Stop when a run reports 0 candidates (module exhausted, modulo
REFUSEs) or when the report's remaining REFUSE-only residue matches the
table below.

## Universal command template

```bash
python tools/batch_carve.py \
    --version <usa|jpn> \
    --overlay ov<NNN>              `# omit entirely for main` \
    --srcdir src/<usa|jpn>/overlay<NNN>   `# src/usa/main or src/jpn/main for main` \
    --min-addr <MODULE_BASE>       `# see table -- NEVER rely on the 0x02234000 default` \
    --batch 20 --limit 150
```

- `--min-addr` **must** be set to the module's own base (below) on every
  invocation. The tool's default (`0x02234000`) silently *skips*
  candidates below it rather than erroring — it was tuned for a
  specific prior main-only wave and is wrong for every overlay and for
  main's own lower address range.
- `--batch 20 --limit 150` matches established convention (chunked
  gate/commit inside one run, capped per AGENTS.md's "cap every wave at
  ~150-300 ships" rule). Raise `--limit` once a module's tractable count
  is confirmed comfortably small (e.g. ov023's single candidate).
- Add `--gate-timeout 600 --gate-retries 2` if running concurrently with
  any other wine-backed lane on the same machine (Mac = one heavy wine
  lane at a time — see Gotcha 1).
- Gate is per-region `ninja sha1` (built into `batch_carve.py`'s own
  commit-on-pass loop) — no separate manual gate needed.

## SKIP — confirmed walls, do not attempt

| Module | Uncarved | REFUSE | Why |
|---|---:|---:|---|
| `ov004` | 2 | 2 (100%) | Both `C-absorbed`. Confirmed wall, both regions. |
| `ov006` | 13 | 13 (100%) | All `C-absorbed`. Confirmed wall, both regions. |
| `ov011` | 0 | — | Already fully drained (0 uncarved) — nothing to do. |

Running `batch_carve.py` against these will only re-confirm the same
REFUSEs at the cost of a wasted invocation — skip them entirely for
this campaign. They are candidates for a *different* technique (the
kind:data-absorption class needs a source-side fix — see brief 537 §
Caveats — not a carve retry).

## Gotchas to pre-empt

### 1. Overlay-swap base-sharing groups (measured, not assumed)

DS overlays share RAM "slots" — multiple overlay files load at the same
address at different times, never simultaneously. This project's
overlays fall into **three** such groups (measured directly from this
snapshot's `symbols.txt`, not the historically-cited `{0,2,5,8}`/
`{0,2,5,8,9}` subsets — the real groups are wider):

| Shared base | Overlays |
|---|---|
| `0x021aa3c0` | ov000, ov002, ov005, ov008, ov009, ov018, ov020, ov021, ov022 |
| `0x021b2180` | ov006, ov007, ov010, ov014, ov015, ov016, ov017, ov019, ov023 |
| `0x021c9c80` | ov001, ov003, ov004, ov011, ov012, ov013 |

**This is not a per-carve risk.** Each overlay has its own independent
`delinks.txt`, `symbols.txt`, and gap objects; `batch_carve.py` and the
region `ninja sha1` gate operate per-overlay-file, so there is no
cross-overlay file collision. The only place this pattern historically
caused trouble was **`dsd init`'s cross-overlay call-graph analysis**
(a function in one overlay statically referencing an address that
*also* exists in a sibling overlay, at init/analysis time — already
solved project-wide via `--allow-unknown-function-calls`, see
`CLAUDE.md`) and **`port_to_region.py`'s module-name parsing** (next
gotcha) — neither applies to a plain `batch_carve`/`asm_escape
--whole-function` carve. Proceed normally; the region `sha1` gate is
sufficient proof of isolation (confirmed clean across every prior wave
that touched these overlays, e.g. brief 348's GOTCHA-18 audit).

### 2. The b459/b461 porter class — not triggered by this drain, but know it exists

Brief 459 fixed two `port_to_region.py` bugs, both specific to the
overlay-swap groups above: (a) dsd's reloc table sometimes represents a
swap zone as the plural `overlays(5,9)` instead of `overlay(5)` — the
porter's module-name normalizer didn't handle the plural form; (b) dsd
emits `_unk`-suffixed placeholder symbols (e.g.
`func_ov000_021b3810_unk`) for unresolved cross-overlay calls, which a
naive `\b`-boundary regex fails to match. **Both fixes are already
merged into the tracked `tools/port_to_region.py`** (search `_norm_mod`
/ `_unk` in that file — cites brief 459 directly), so this is a
non-issue for any *future* porting work too.

**Why it's mentioned here at all:** this mechanical `.s`-drain does
**not** call `port_to_region.py` — `asm_escape --whole-function` carves
each region's *own* original bytes directly, with no cross-region
porting step. This gotcha only becomes relevant if a *later* brief
takes one of this drain's shipped `.s` functions and tries to hand-match
it to C + port that C across regions — at that point, the fix is
already in place, so proceed normally.

### 3. USA/JPN name≠address drift band — already fixed in `batch_carve.py`

Some USA/JPN functions keep a symbol *name* derived from their EUR-era
address while `dsd` places their real bytes at a different address
(observed band: −0xF4 / −244 bytes, brief 483). `batch_carve.py` reads
the real address from `symbols.txt`'s `addr:` field for every delink
block it writes (`parse_symbol_addrs()`, used in `run()` via
`sym_addrs.get(func, func_addr(func))`) — **not** the name-derived
address — so this drift is already handled transparently. No special
action needed; mentioned so a future maintainer doesn't "fix" it again
or panic if they notice a function whose name doesn't match its
`.text start:` address in a freshly-written delink block (that's
`--min-addr`/drift working as intended, not a bug).

## Wave order

Ordered per the brief: `ov002` first (the whale), then the small
overlays largest-tractable-first, then `main`. USA and JPN have
**identical** tractable counts and size tiers for every overlay this
snapshot (only `main` differs by one function, a region-specific
`C-absorbed` split) — one set of numbers covers both regions; swap
`--version`/`--srcdir` between runs.

### Wave 1 — `ov002` (the whale: ~77% of all tractable bytes)

| | USA | JPN |
|---|---:|---:|
| Tractable | 1,443 (1,347 zero-dep) | 1,579 (1,481 zero-dep) |
| REFUSE | 4 (`C-absorbed`) | 4 (`C-absorbed`) |
| Tractable bytes | 898,448 | 924,196 |

Size tiers (USA / JPN nearly identical — JPN has 136 more in 97-256B):

| ≤96B | 97-256B | 257-512B | 513-1024B | >1024B |
|---:|---:|---:|---:|---:|
| 0 | 341 (USA) / 477 (JPN) | 684 | 252 | 166 |

**This module alone needs ~10 successive waves** at `--limit 150` per
region (1,443/150 ≈ 10). Largest single tractable candidate seen:
12,972 bytes (`func_ov002_021c4bbc`) — comfortably within `asm_escape
--whole-function`'s scope (it re-assembles the original bytes, not a
compile match, so size alone isn't a risk factor the way it would be
for c-match).

```bash
python tools/batch_carve.py --version usa --overlay ov002 \
    --srcdir src/usa/overlay002 --min-addr 0x021aa3c0 --batch 20 --limit 150
python tools/batch_carve.py --version jpn --overlay ov002 \
    --srcdir src/jpn/overlay002 --min-addr 0x021aa3c0 --batch 20 --limit 150
```

Re-run both (identical command) until the report shows only the 4
confirmed REFUSEs remaining per region.

### Wave 2+ — small overlays, in tractable-count order

Every row: same `--batch 20 --limit 150` is enough to clear the module
in one run (all comfortably under 150 tractable). USA and JPN tractable
counts and tiers are identical for every row below.

| Order | Module | Base addr | Tractable (zero-dep) | Bytes | ≤96 / 97-256 / 257-512 / 513-1024 / >1024 |
|---|---|---|---:|---:|---|
| 2 | ov000 | `0x021aa3c0` | 85 (76) | 18,504 | 45 / 17 / 11 / 10 / 2 |
| 3 | ov008 | `0x021aa3c0` | 71 (53) | 31,216 | 4 / 32 / 19 / 9 / 7 |
| 4 | ov005 | `0x021aa3c0` | 63 (51) | 27,296 | 31 / 9 / 8 / 6 / 9 |
| 5 | ov010 | `0x021b2180` | 62 (56) | 22,696 | 16 / 17 / 12 / 13 / 4 |
| 6 | ov016 | `0x021b2180` | 56 (37) | 24,408 | 16 / 12 / 11 / 10 / 7 |
| 7 | ov017 | `0x021b2180` | 39 (26) | 21,480 | 9 / 10 / 9 / 5 / 6 |
| 7 | ov015 | `0x021b2180` | 39 (35) | 11,364 | 15 / 10 / 6 / 5 / 3 |
| 8 | ov019 | `0x021b2180` | 32 (24) | 12,092 | 11 / 6 / 7 / 4 / 4 |
| 8 | ov020 | `0x021aa3c0` | 32 (27) | 12,840 | 3 / 16 / 10 / 1 / 2 |
| 9 | ov014 | `0x021b2180` | 28 (21) | 9,268 | 8 / 7 / 7 / 4 / 2 |
| 10 | ov009 | `0x021aa3c0` | 24 (19) | 12,228 | 8 / 5 / 4 / 3 / 4 |
| 11 | ov003 | `0x021c9c80` | 21 (15) | 19,072 | 3 / 6 / 4 / 3 / 5 |
| 12 | ov007 | `0x021b2180` | 19 (18) | 2,060 | 12 / 5 / 1 / 1 / 0 |
| 13 | ov012 | `0x021c9c80` | 16 (8) | 8,140 | 1 / 5 / 5 / 3 / 2 |
| 14 | ov013 | `0x021c9c80` | 9 (5) | 6,216 | 0 / 3 / 4 / 1 / 1 |
| 14 | ov018 | `0x021aa3c0` | 9 (7) | 8,756 | 1 / 1 / 4 / 2 / 1 |
| 15 | ov022 | `0x021aa3c0` | 13 (8) | 4,648 | 2 / 5 / 3 / 2 / 1 |
| 16 | ov021 | `0x021aa3c0` | 18 (16) | 4,068 | 10 / 3 / 1 / 4 / 0 |
| 17 | ov001 | `0x021c9c80` | 4 (3) | 980 | 1 / 1 / 2 / 0 / 0 |
| 18 | ov023 | `0x021b2180` | 1 (1) | 48 | 1 / 0 / 0 / 0 / 0 |

Per-row command (substitute `<NNN>` and `<BASE>` from the table above):

```bash
python tools/batch_carve.py --version usa --overlay ov<NNN> \
    --srcdir src/usa/overlay<NNN> --min-addr <BASE> --batch 20 --limit 150
python tools/batch_carve.py --version jpn --overlay ov<NNN> \
    --srcdir src/jpn/overlay<NNN> --min-addr <BASE> --batch 20 --limit 150
```

### Wave 3 (final) — `main`

| | USA | JPN |
|---|---:|---:|
| Base addr | `0x0200009e` | `0x0200007e` |
| Tractable | 23 (20 zero-dep) | 22 (20 zero-dep) |
| REFUSE | 26 (`C-absorbed`) | 26 (`C-absorbed`) |
| Tractable bytes | 4,524 | 4,408 |
| Tiers (≤96/97-256/257-512/513-1024/>1024) | 17/2/1/2/1 | 17/1/1/2/1 |

`main` is nearly fully carved already (4,044-4,045 of 4,093) — this is
mop-up, not a lane. No `--overlay` flag; `--srcdir` is `src/usa/main` /
`src/jpn/main`.

```bash
python tools/batch_carve.py --version usa \
    --srcdir src/usa/main --min-addr 0x02000000 --batch 20 --limit 50
python tools/batch_carve.py --version jpn \
    --srcdir src/jpn/main --min-addr 0x02000000 --batch 20 --limit 50
```

(`0x02000000` rather than the exact measured base — main's true minimum
is a few dozen bytes above the region base and using the round number
costs nothing; it's still far below the harmful `0x02234000` default.)

## Projected outcome if fully executed

| Region | Now | + this work order's tractable | Projected |
|---|---:|---:|---:|
| USA | 49.7% | +1,160,352 B | **~98.7%** |
| JPN | 48.6% | +1,185,984 B | **~98.7%** |

Residual after full execution: the 45 confirmed `C-absorbed` REFUSEs
per region (mostly `ov002`'s 4 + `main`'s 26 + `ov004`/`ov006`'s 15) —
a small, well-characterized tail for a separate technique, not more
mechanical carving.

## Final state

Wine-free, read-only brief — no delinks/source files touched. `git
status` shows only this doc + the regenerated research README.
