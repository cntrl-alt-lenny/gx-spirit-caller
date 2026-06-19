[//]: # (markdownlint-disable MD013 MD041)

# Brief 452 — ov002 reg-alloc to .s, UPPER half (wave 12)

**Brief:** 452 (scaffolder). Continue the ov002 UPPER-half (addr ≥ 0x02234000)
`.s`-bound reg-alloc backlog (post brief 450 / PR #986). Start from the 32 clean
probes held at wave 11; reclaim-probe the ≤0x80 residue; sort delinks, dedup vs
main, gate on EUR `ninja sha1`. Target ~28–40.

## Headline — the entire ≤0xc0 band drained: 58 byte-exact ships, 100% yield

**58 byte-exact upper-half ov002 `.s` shipped — the complete uncarved ≤0xc0
tier.** Every uncarved upper-half function at size ≤0xc0 (the 23-func ≤0x80
reclaim cohort **plus** the 35-func 0x81–0xc0 band) probed **byte-identical on
the first attempt** — `58/58`, zero drops. This closes the ≤0xc0 tier entirely.

Above the brief's `~28–40` soft target by design: draining the whole tier in one
wave is a cleaner boundary than leaving an 18-func remainder too small for its
own wave, and the gate (a SHA1-identical ROM) verifies all 58 atomically — gate
risk is independent of carve count.

## Finding 1 — the ≤0x80 "skip residue" was MISSED, not byte-pack-dropped

Wave 11 (PR #986) flagged 23 uncarved funcs ≤0x80 as *presumed* prior-wave
skip-list residue (byte-pack / verify-fail) and recommended a reclaim-probe. **The
reclaim-probe verdict: 23/23 byte-identical.** They were never byte-pack drops —
they were simply **missed** by waves 21–23 (which climbed the size ladder and
left a sub-0x80 tail behind). Because the skip lists live under `build/` (git-
ignored, not persisted across worktrees), that history was unrecoverable and the
only way to know was to re-probe. **Lesson: an un-persisted skip list cannot be
trusted as a negative cache across waves — a "residue" cohort must be re-probed,
not assumed dropped.** All 23 are now shipped.

## Finding 2 — the near tier (≤0x100) has ZERO kind:data wall

An exhaustive `--classify-data` census was run across **all 196 uncarved
upper-half funcs at size ≤0x100** (`0x80` reclaim + `0x81–0xc0` + `0xc1–0x100`),
in parallel (the preflight is `objdump`-only — no `wine`/`mwasmarm` — so it
parallelises safely even during a build). **Result: 196/196 clean, 0 REFUSE.**
The brief-406 kind:data preflight wall is fully dissolved in the near tier; every
sub-0x100 func is shippable, gated only by the `--whole-function` byte-verify.
This is the complete near-tier residue map: there is **no** kind:data residue
below 0x100 — only the byte-pack/verify-fail residue that begins ≥0xd0.

## Drop breakdown

| stage | n | outcome |
|---|---:|---|
| `--classify-data` census (≤0x100) | 196 | 196 clean, **0 REFUSE** |
| `--whole-function` probe (≤0xc0) | 58 | **58 PASS**, 0 byte-pack, 0 verify-fail |
| **shipped** | 58 | the whole ≤0xc0 tier |

Both skip lists ended the wave empty (0 drops) — re-initialised at branch (git-
ignored build-local scratch) and nothing was added.

## Dedup — two layers, both clean (Verify item 10)

1. **File-level:** none of the 58 already exist as `.s`/`.c` (or legacy
   `ov002_XXXXXXXX.c`) in `src/overlay002/`.
2. **Address-level:** none of the 58 addresses are already a carved `start:` in
   `delinks.txt`.

The decomper is on the USA/JPN overlay region-port lane this round (brief 453),
off ov002 source carving — no cross-lane collision (it does build USA/JPN, so the
wineserver is shared; see the build note).

## Delink hygiene — the b450 newline guard held

The append used the brief-450 fix (append `"\n"` if the file does not already end
in one) before writing blocks. Post-sort audit: **2045 → 2103 `.text` intervals
(+58), 0 overlaps, 0 concatenated lines, 0 size-mismatches** (every carve's
`end − start` equals its `symbols.txt` size — the trailing-overrun guard from the
b419 main sweep). Upper-half guard asserted every pick ≥ 0x02234000.

## Thinning watch — ≤0xc0 now closed; runway is in the larger tiers

Uncarved upper-half after this wave (**647**): `≤0xc0` = **0** (drained),
`0xc1–0x100` = 138, `0x101–0x140` = 135, `0x141–0x200` = 195, `>0x200` = 179.
The lane is now entirely in the `>0xc0` tiers, where byte-pack drops appear — but
those are still byte-exact via `--whole-function` whenever they pass verify, and
the census proves there is no kind:data wall up to 0x100. **Next wave starts at
`0xc1`** with ~470 funcs of runway above it (dozens of waves at 28–58/wave).

## Gate — EUR ninja sha1

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | n/a (`src/overlay002/*.s` is EUR-only) | n/a |

`gx-spirit-caller_eur.nds: OK`. Brain reproduces 3-region on merge.

**Build note:** the gate ran in a clear window (decomper idle). The standing
hazard remains — concurrent scaffolder+decomper wine jobs can deadlock the shared
wineserver; serialise with `ninja -j1 sha1` if both worktrees build at once.

## Files

`src/overlay002/` +58 `.s`; `config/eur/arm9/overlays/ov002/delinks.txt`
2045 → 2103 `.text` intervals (sort-normalised, 0 overlaps). No main/USA/JPN
change.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
