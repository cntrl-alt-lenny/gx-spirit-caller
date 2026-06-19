[//]: # (markdownlint-disable MD013 MD041)

# Brief 450 — ov002 reg-alloc to .s, UPPER half (wave 11)

**Brief:** 450 (scaffolder). Continue the ov002 UPPER-half (addr ≥ 0x02234000)
`.s`-bound reg-alloc backlog (post brief 448 / PR #985). Enumerate uncarved
upper-half, probe with `asm_escape`, sort delinks, dedup vs main, gate on EUR
`ninja sha1`. Target ~28.

## Headline — 28 upper-half .s shipped, 100% probe yield in the 0x80–0x98 band

**28 byte-exact upper-half ov002 `.s` shipped.** This wave worked the bottom of
the remaining `0x81–0xc0` band (the brief's priority — ~64 left at branch). A
60-func probe across `0x80–0xd4` came back **60/60 clean** (0 `kind:data` REFUSE,
0 byte-pack, 0 verify-fail) — the byte-pack drops the prior waves saw begin
*above* this band (≥0xd0+), so the small-end is uniformly clean. Shipped the 28
smallest (sizes **0x80–0x98**), held the other 32 clean probes for the next wave.

## ⚠️ Gotcha this wave — `delinks.txt` has NO trailing newline (append corruption)

The first gate **failed** at `dsd lcf` / `dsd delink` with a *real* parse error
(not the transient — see below):

```
config/eur/arm9/overlays/ov002/delinks.txt:9027: failed to parse end address
'0x022cd300src/overlay002/func_ov002_022bd940.s:': invalid digit found in string
```

**Root cause:** `origin/main`'s `ov002/delinks.txt` does **not** end with a
trailing newline (its last block is the `.data start:0x022cd090 end:0x022cd300`
gap). A naïve `open(path, "a")` append therefore concatenates the first new
block's header directly onto `…end:0x022cd300`, producing the un-parseable
`…end:0x022cd300src/overlay002/func_ov002_022bd940.s:`. `sort_delinks.py` does
**not** repair an already-merged line — it normalises block *order*, not
intra-line corruption — so the bad token survived the sort and only surfaced at
the dsd parse step.

**Fix (now standard for this lane):** read the file, append `"\n"` if it does
not already end in one, *then* append blocks. After the guard, `dsd lcf` parses
clean (exit 0) and the gate passes. This is a build-hygiene item worth a Verify
note: **always newline-guard before appending to `delinks.txt`.**

## Transient retry rule still applies (distinct from the above)

Per the brief (Verify item 11b), a `dsd delink` / `mwasmarm` crash under
parallelism is a large-tree transient — re-run once. **The newline corruption
above is NOT that** — it is a deterministic parse error pointing at a specific
line, reproducible across runs, and fixed by editing the file, not by retrying.
The distinguishing tell: a transient crashes mid-step with a Rust backtrace and
**no file:line**; a real error names `delinks.txt:NNNN` and the offending token.

## Drop breakdown (60 probed)

| outcome | n | note |
|---|---:|---|
| **SHIP** | 60 | took 28 (0x80–0x98); 32 held (0x98–0xd4) for the next wave |
| byte-pack | 0 | (none in this band — they start ≥0xd0) |
| verify-fail | 0 | |
| `kind:data` REFUSE | 0 | |

Both skip lists were re-initialised this wave (they live under `build/`, which is
git-ignored, so they do not persist across worktrees); 0 new entries — every
probe was clean.

## Dedup — two layers, both clean (Verify item 10)

1. **File-level:** none of the 60 candidates already exist as `.s`/`.c` (or the
   legacy `ov002_XXXXXXXX.c`) in `src/overlay002/`.
2. **Address-level:** none of the 60 candidate addresses are already a carved
   `start:` in `delinks.txt`.

The decomper is on the USA/JPN region-port lane this round (brief 451) — off
ov002 entirely — so there is no cross-lane collision risk, but the dedup is run
regardless.

## Thinning watch — runway is deep

Uncarved **upper-half** funcs after this wave (705 total): `≤0x80` = 23 (see
note), `0x81–0xc0` = 35 (~1 wave left in-band), `0xc1–0x100` = 138, `>0x100` =
509. **No thinning** — the `>0xc0` tier alone is dozens of waves of runway at
~28/wave.

**≤0x80 residue note (23 funcs):** these sit below this wave's probe floor. The
brief positioned the ≤0x80 band as drained by waves 21–23, so they are *presumed*
prior-wave skip-list residue (byte-pack / verify-fail). Because those skip lists
are not persisted in git, that is unverified — and this wave's 60/60 yield in the
adjacent band suggests some may actually be clean. **Recommend a future wave
reclaim-probe the 23 ≤0x80** before treating the small tier as closed.

## Gate — EUR ninja sha1

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | n/a (unaffected — `src/overlay002/*.s` is EUR-only) | n/a |

Brain reproduces 3-region on merge.

## Files

`src/overlay002/` +28 `.s`; `config/eur/arm9/overlays/ov002/delinks.txt` +28
(2017 → 2045 `.text` intervals, sort-normalised, 0 overlaps). No main/USA/JPN
change.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
