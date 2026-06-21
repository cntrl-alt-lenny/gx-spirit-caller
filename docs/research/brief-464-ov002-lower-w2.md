[//]: # (markdownlint-disable MD013 MD041)

# Brief 464 — ov002 LOWER-half ARM `.s` drain, wave 2

**Brief:** 464 (scaffolder). Continue `tools/batch_carve.py` over the ov002
lower-half range (`addr < 0x02234000`). The lane was CONFIRMED real by b462
(shipped 100, EUR sha1 OK) after b460/#997 wrongly declared it exhausted.
Run a **bounded** wave (`--limit ~150`) that completes in-session and ships
without leaving an uncommitted batch (the b462 ship-step miss).

## What shipped — 150 carves, 100% clean, EUR sha1 OK

Three batches of 50, each auto-committed on a green EUR `ninja sha1`:

| commit | carves | size band |
|---|---|---|
| `3edd22a0` | +50 | 0x94–0x9c |
| `c6ffb75b` | +50 | 0xa0–0xa8 |
| `920762ea` | +50 | 0xa8–0xb8 |

**150 files, 8108 insertions, clean-rate 100% (0 REFUSE, 0 verify-fail,
0 gate-fail).** Final authoritative gate — clean rebuild
(`rm -f gx-spirit-caller_eur.nds && ninja sha1`, 5932 steps) —
`gx-spirit-caller_eur.nds: OK`.

### Exact size histogram (from `symbols.txt` `size=` field)

| size | count | | size | count |
|---|---|---|---|---|
| 0x94 | 15 | | 0xa8 | 18 |
| 0x98 | 15 | | 0xac | 18 |
| 0x9c | 20 | | 0xb0 | 14 |
| 0xa0 | 19 | | 0xb4 | 11 |
| 0xa4 | 16 | | 0xb8 | 4  |

A clean, contiguous size band **0x94 → 0xb8** — the next rung up the
lower-half size ladder from b462 (which drained ≤~0x90, starting at 0x4c).
Still 100% byte-identical, consistent with the upper-half finding (b458):
byte-pack drops do **not** climb with size in ov002.

## The lane is real — and large. Runway after this wave

Authoritative dry-run (`--min-addr 0x0 --dry-run`) after the wave:

```
REPORT: SHIPPED 772 | REFUSE 2 | verify-fail 0 | clean-rate 99%
```

**772 carvable ov002 lower-half ARM funcs remain** (+2 upper-half kind:data
REFUSE already parked: `func_ov002_022b867c`, `func_ov002_022b5590`). That is
~5 more waves of 150. Combined lower-half batch_carve progress:

| wave | brief | ships | sizes |
|---|---|---|---|
| w1 | 462 | 100 | 0x4c–~0x90 |
| **w2** | **464** | **150** | **0x94–0xb8** |
| remaining | — | **772** | 0xbc+ |

This settles the census the b462 round flagged: the original full-range
enumeration found 1024 lower-half candidates; b462 shipped 100, w2 ships 150,
772 remain — the arithmetic closes (1024 − 100 − 150 = 774 = 772 + the 2
kind:data parks). The "EUR ARM lane exhausted" claim from b460 was an
enumeration error (`batch_carve --min-addr` defaults to `0x02234000`, so every
prior census silently saw only the upper half).

## Root cause of the b462 ship-step miss — and the fix

**Diagnosis:** long-running background tasks in this harness hit a wall-clock
cap (~8–10 min) and get killed. The b462 full-`--limit` run died ~9 min in,
mid-batch-2 (49/50 staged, never gated) — exactly reproducing here on the
first attempt at a single 150-wide background run (`bto3f8luz` killed after
batch 1 committed, batch 2 orphaned).

**Fix — chunked, durable batches:** run `--limit 50` (one batch) per invocation.
Each stages → gates → **commits on green inside ~5 min**, comfortably under the
cap. batch_carve's commit-on-pass makes every completed batch durable, and the
drain is idempotent/resumable (a re-run skips committed funcs via delinks
dedup). An orphaned batch from a kill is cleaned with
`git reset --hard HEAD && git clean -fd src/overlay002/` (the abort-on-dirty
guard would otherwise refuse the next run) and re-driven. Per the b454 note,
orphaned `.s` files are **not** trusted — asm_escape writes the `.s` before its
byte-verify, so a killed probe's files are attempts, not a PASS set; they are
discarded and regenerated.

This wave shipped all three batches durably with zero orphan left at the end
(worktree clean, verified before push).

## Pivot note (unchanged)

ov002 lower-half remains the **biggest open mechanical lane** (~772 funcs).
The EUR **Thumb** lane (ov004 only: ~48 uncarved, ~32 ≤0x40 ≈ 1 wave) is a
separate thin vein, deferred per the brief — flagged here as the natural
follow-on once the lower-half ARM ladder is climbed or if a parallel lane is
wanted.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
