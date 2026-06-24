[//]: # (markdownlint-disable MD013 MD041)

# Brief 482 — ov002 LOWER batch-carve (Windows dual-lane)

**Brief:** 482 (scaffolder). Continue EUR ov002 **LOWER** (addr < 0x02234000)
with `batch_carve.py`. Windows dual-lane (decomper on USA/JPN main = different
files). `sort_delinks.py`, 3-region `ninja sha1`, commit-on-pass, PR. Cap ~300;
flag when ov002 lower thins.

## Headline — 100 ov002 lower-half .s carved (2 gated batches), 3-region green

**100 byte-exact ov002 LOWER-half `.s` carved + committed** in two gated batches
of 50, continuing smallest-first from brief 481's `0x17c–0x1b8` into the big-body
tail:

- `+50 (size 0x1b8–0x1f0)` — `76b80c3c` (auto-gated by `batch_carve`, `[auto, eur sha1 OK]`)
- `+50 (size 0x1f0–0x254)` — `879b800b` (**manually gated** — see below)

All 100 are `< 0x02234000` (addr range `021bb068`–`02232d20`, **0 upper leak** —
the 32 upper-uncarved are skip-listed via `build/skip_upper_482.txt`).

## ⚠️ Operational — batch_carve wrapper died (exit 127) mid-batch-2; salvaged by hand

The `batch_carve` run committed batch 1 cleanly, then the run **died with exit
127** during batch 2's gate, leaving an **orphaned python process** (the bash
wrapper exited, the child kept a stalled gate). State at that point: 50 committed
(batch 1) + **50 uncommitted `.s`, each already individually `asm_escape`-verified
byte-exact** but never batch-gated. Recovery:

1. Confirmed the orphan was stalled (no `ninja`/`mwasm`/`wine` children, frozen
   for >60 s), killed it, confirmed 0 procs.
2. Confirmed all 50 uncommitted are lower-half (`021bb068`–`02232d20`, 0 leak)
   and that the 50 `.s` exactly match the 50 new `delinks.txt` blocks.
3. `sort_delinks.py` (already sorted) → `configure.py eur` → **3-region
   `ninja sha1` by hand** → committed the 50 as a manual batch.

**Lesson: a dead batch_carve wrapper does NOT waste the in-flight batch.** The
written `.s` are individually `asm_escape`-clean; reverting them throws away real
work. Instead: kill the orphan, verify `.s`↔delinks consistency + lower-only,
then `sort_delinks` + 3-region gate the partial batch by hand and commit on pass.

## ⚠️ Transient — USA gate threw 10 concurrent mwasmarm/dsd -1 crashes (retry OK)

The first 3-region pass: **EUR OK, JPN OK**, but USA failed with **10 simultaneous**
`[code=4294967295]` (exit -1) failures — 9 × `build/usa/src/usa/main/func_*.o`
plus `build/usa/delinks/delink.yaml`. This is the documented transient
`mwasmarm`/`dsd` heavy-parallelism crash (briefs 446/448), here **amplified**:
switching `configure` to the huge USA port tree (2600+ `.s`) and launching a
fresh full parallel build triggered many concurrent assembler crashes at once.
**Not broken main, and not caused by this wave** (ov002 `.s` are EUR-only,
region-excluded from USA/JPN). A single `configure usa && ninja sha1` retry
rebuilt them incrementally → `gx-spirit-caller_usa.nds: OK`. **Lesson: the
transient -1 flake scales with tree size — a region switch can surface a CLUSTER
of them in one gate; retry the whole region, ninja resumes incrementally.**

## ⚠️ FLAG — ov002 lower is deep into its hard-tail (strong thinning signal)

After this wave: **162 lower uncarved** (was 262), and the remainder is almost
entirely the big-body tail:

| band | uncarved (lower) | note |
|---|---:|---|
| `≤0x80` | 19 | persistent argpack/bytepack/parked residue (drop/refuse, not ship) |
| `0x201–0x300` | 50 | big |
| `>0x300` | **93** | huge — slow, ≈2 min/func and rising |

So the shippable remainder is **~143 big bodies (143 funcs `>0x200`, of which 93
are `>0x300`)** — the small/mid tiers are fully drained and the funcs are getting
*bigger* (and slower) each wave. Throughput this wave: **100 ships in ≈2.5 h**
(batch 1 ≈75 min, batch 2 ≈75 min + manual gate), ~40 ships/hr and declining.

**Recommendation for the brain:** ov002 lower is ~143 slow big bodies from done —
roughly **2–3 more ~100-ship waves**, each slower than the last. This is the
brief's thinning cue. Weigh finishing ov002 lower (≈2–3 more slow waves) against
**pivoting now to USA/JPN consolidation or the EUR hard-tail campaign** — the
mechanical-`.s` ROI on ov002 lower is falling as the tail gets heavier.

## Lower-lane invocation (unchanged from brief 471/481)

`batch_carve` has `--min-addr` (upper guard) but **no `--max-addr`**, so the lower
lane runs `--min-addr 0` + a per-wave `--skip-list` of the upper-uncarved addrs
(`build/skip_upper_482.txt`, 32 addrs):

```text
python tools/batch_carve.py --version eur --overlay ov002 \
  --min-addr 0 --min-size 0x8 --max-size 0x2000 \
  --skip-list build/skip_upper_482.txt \
  --verifyfail-list build/known_verifyfail_ov002.txt \
  --batch 50 --limit 250 --gate-retries 3
```

## Gate — 3-region ninja sha1

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (on retry past 10 transient -1 crashes; unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

Batch 1 eur-sha1-gated by `batch_carve` at commit; batch 2 manually 3-region-gated;
final 100-ship tree is the gated state.

## Files

`src/overlay002/` +100 `.s`; `arm9/overlays/ov002/delinks.txt` +100
(sort-normalised). No main/USA/JPN change.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
