[//]: # (markdownlint-disable MD013 MD041)

# Brief 471 — ov002 LOWER batch-carve (Windows lane)

**Brief:** 471 (scaffolder). Continue the ov002 **LOWER** lane (addr < 0x02234000)
with `tools/batch_carve.py`. The decomper rejoined EUR on the UPPER half +
next-module frontier, so stay < 0x02234000 to avoid overlap. Batch-carve,
`sort_delinks.py`, 3-region `ninja sha1`, open PR. Target: usual batch scale.

## Headline — 100 ov002 lower-half .s carved (2 gated batches), 3-region green

**100 byte-exact ov002 LOWER-half `.s` carved + committed**, in two auto-gated
batches of 50 (`batch_carve.py`, each `[auto, eur sha1 OK]`):

- `+50 (size 0x38–0xc8)` — `9cdda130`
- `+50 (size 0x10c–0x120)` — `d68695fa`

All 100 are `< 0x02234000` (verified — 0 upper leak). The lane is far from thin:
**562 uncarved lower** at branch → **462 after**.

## Lower-lane invocation (derived — the lane flipped since brief 448)

The agent split flipped: **scaffolder = ov002 LOWER (<0x02234000)**, decomper =
UPPER + next module. `batch_carve.py`'s `--min-addr` is an *upper-half* guard
(default 0x02234000) with **no `--max-addr`**, so the lower lane runs with
`--min-addr 0` plus a **skip-list of the current upper-half uncarved addresses**
to guarantee no overlap with the decomper's active upper work:

```text
# census the uncarved upper addrs → build/skip_upper_<n>.txt (32 at brief 471)
python tools/batch_carve.py --version eur --overlay ov002 \
  --min-addr 0 --min-size 0x8 --max-size 0x140 \
  --skip-list build/skip_upper_471.txt \
  --verifyfail-list build/known_verifyfail_ov002.txt \
  --batch 50 --gate-retries 3
```

Belt-and-suspenders: the `0x81–0x140` size band has **zero** uncarved upper funcs
(upper residue is all `≤0x80` or `>0x140`), so the size window alone keeps it
lower-only; the skip-list also covers the `≤0x80` overlap. `batch_carve` is
self-contained (enumerate → asm_escape verify → classify/drop bytepack/argpack/
`kind:data` → `sort_delinks.py` → `configure.py` → `ninja sha1` gate with
`--gate-retries` → commit-on-pass, bisect-on-fail).

## ⚠️ Throttling — coexisting with the decomper's concurrent worktree build

The run was heavily throttled (~50 min/batch vs the usual few) by `batch_carve`'s
**patient wait-for-quiet** deferring to a concurrent worktree build (the decomper
on the upper/next-module frontier). This is by-design coexistence (the `--call-timeout`/
`--gate-timeout` defer-on-hang seam), not a fault. I **capped the wave at the
100-ship (2-batch) boundary** rather than block for hours; the lower lane has deep
runway (462 uncarved) for subsequent waves. Future waves: run during quiet windows,
or accept the slower cadence.

## ov002 lower census (after this wave)

| band | uncarved (lower) |
|---|---:|
| `≤0x80` | ~0 (drained by the 0x8–0x140 sweep) |
| `0x81–0x140` | ~64 left (this wave took ~100 of the small/mid) |
| `>0x140` | 378 (the big-body bulk — next waves; 2 upper `>0x140` need the skip-list) |

**NOT thinning** — 462 lower uncarved remain, dominated by the `>0x140` tier.

## Gate — 3-region ninja sha1

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

Each batch was eur-sha1-gated at commit time; the final 100-ship tree re-verified
3-region.

## Files

`src/overlay002/` +100 `.s`; `arm9/overlays/ov002/delinks.txt` +100 (sort-normalised,
both lanes auto-merge). No main/USA/JPN change.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
