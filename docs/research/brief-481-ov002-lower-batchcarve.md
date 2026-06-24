[//]: # (markdownlint-disable MD013 MD041)

# Brief 481 — ov002 LOWER batch-carve (Windows dual-lane)

**Brief:** 481 (scaffolder). Continue EUR ov002 **LOWER** (addr < 0x02234000)
with `batch_carve.py`. Now collision-free: the decomper is on USA/JPN main
(different files), so both can run wine `batch_carve` at once with no wineserver
contention. `sort_delinks.py`, 3-region `ninja sha1`, commit-on-pass, PR. Cap at
~300; flag when ov002 lower thins.

## Headline — 100 ov002 lower-half .s carved (2 gated batches), 3-region green; CAPPED at 100 (big-body slowdown)

**100 byte-exact ov002 LOWER-half `.s` carved + committed** in two auto-gated
batches of 50 (`batch_carve.py`, each `[auto, eur sha1 OK]`):

- `+50 (size 0x154–0x17c)` — `7bedbeb1`
- `+50 (size 0x17c–0x1b8)` — `ca7bc604`

All 100 are `< 0x02234000` (addr range `021b0c54`–`02233de8`, **0 upper leak** —
the 32 upper-uncarved are skip-listed, staying the decomper's). The dry-run
classified 298/300 ships (2 auto-refused), 99% clean.

## ⚠️ Capped at 100 — the lower remainder is the SLOW big-body hard-tail

I targeted ~300 (`--limit 300`) but **capped at the 100-ship boundary**: ov002
lower has reached its **large-body hard-tail**, where each func is slow to
asm_escape (≈1.5 min/func — wine-startup-dominated per-func cost, not throttling;
this run was collision-free). At that rate 300 funcs ≈ 5–6 h, defeating the
"reviews in 1–2 h" intent. 100 ships (~70 min carve) is the sustainable cap for
this tier.

`batch_carve` processes **smallest-first**, so the small/mid funcs are drained
and only the slow `>0x140` bodies remain. **Recommend ~100/wave caps for the
ov002-lower hard-tail** (or that the brain weigh the EUR hard-tail campaign /
USA-JPN consolidation — see below).

## ⚠️ FLAG — ov002 lower has entered its hard-tail (the brief's thinning cue)

After this wave: **262 lower uncarved**, and the band mix has flipped to large
bodies:

| band | uncarved (lower) | note |
|---|---:|---|
| `≤0x80` | 19 | likely argpack/bytepack/parked residue (drop, not ship) |
| `0x141–0x200` | 63 | mid |
| `>0x200` | **180** | the big-body bulk — slow ≈1.5 min/func |

The small/mid ARM funcs are essentially drained; **the lower lane is now the
slow `>0x140` big-body hard-tail (~243 real candidates)**. This is the thinning
cue the brief asked for: at ~100/wave that's ~2–3 more waves to finish ov002
lower, after which the cue is to **consolidate onto USA/JPN or open the EUR
hard-tail campaign**.

## Lower-lane invocation (unchanged from brief 471)

`batch_carve` has `--min-addr` (upper guard) but **no `--max-addr`**, so the lower
lane runs `--min-addr 0` + a `--skip-list` of the current upper-uncarved addrs
(census per wave → `build/skip_upper_481.txt`, 32 addrs):

```text
python tools/batch_carve.py --version eur --overlay ov002 \
  --min-addr 0 --min-size 0x8 --max-size 0x2000 \
  --skip-list build/skip_upper_481.txt \
  --verifyfail-list build/known_verifyfail_ov002.txt \
  --batch 50 --limit 300 --gate-retries 3
```

Cap discipline: `TaskStop` at a batch boundary → revert the partial
`delinks.txt` + untracked `.s` → re-`configure.py eur` → 3-region gate → push.

## Gate — 3-region ninja sha1

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

Each batch eur-sha1-gated at commit; final 100-ship tree re-verified 3-region.
`sort_delinks.py`-normalised.

## Files

`src/overlay002/` +100 `.s`; `arm9/overlays/ov002/delinks.txt` +100. No
main/USA/JPN change.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
