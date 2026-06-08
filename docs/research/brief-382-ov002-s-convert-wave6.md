[//]: # (markdownlint-disable MD013 MD041)

# Brief 382 — ov002 reg-alloc → `.s`, wave 6 (Windows lane)

**Brief:** 382 (scaffolder). Continue the ov002 `.s`-bound reg-alloc backlog from
waves 1–5 (#894/#897/#898/#900/#902 = 40 ships). The decomper is on the WSL
permuter lane now, so **ov002 `.s` is all the scaffolder's — no split**. Target
~8. Flag if the tier thins.

## Headline — 8 ov002 `.s` shipped, 3-region `ninja sha1` green; runway is wide, not thinning

With the upper-half split lifted (decomper off ov002), the **full-range**
enumeration has **54** `≤0x4c` non-arg-pack non-byte-pack uncarved candidates.
The store-merge fix keeps the verify rate high — **11 of 12 probed verified** this
batch, including `021b1d48` (a wave-3/4 "did not verify" failure, now **recovered**
on `main`'s fixed `to_mwasm`). This is **not** a thinning tier.

## The 8 ships (all ov002)

| addr | size | note |
|---|---|---|
| `021b1d48` | 0x3c | leaf wall — **recovered** (failed in waves 3–4, passes now) |
| `021bbf50` | 0x48 | leaf wall |
| `021e2e38` | 0x48 | leaf wall |
| `022016bc` | 0x48 | leaf wall |
| `02202ae4` | 0x48 | leaf wall (shares `data_ov002_022cd3f4` with `022016bc`) |
| `021b3c10` | 0x4c | leaf wall |
| `021cb174` | 0x4c | leaf wall |
| `02206e64` | 0x4c | leaf wall |

All `asm_escape` → `✅ byte-identical vs the delinked .o`. Link-clean — every
`data_` reference is `kind:bss` (the wave-4 mandatory check; no `kind:data` risks
this batch). No byte-pack shapes.

## The one persistent failure mode

`0222ceac` again emitted a `.s` that **did not assemble** (it failed in wave 4
too). This is **not** the store-merge class the recent fix solved — it's a
separate `to_mwasm` opcode/addressing gap that survives. A small handful of ov002
funcs hit it; they're skipped and want a follow-up `to_mwasm` patch. (The
store-merge "did not verify" class is now fixed.)

## Gate — 3-region `ninja sha1`

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

## Thinning watch — NOT thinning

54 `≤0x4c` candidates remain in the full-range enumeration (8 shipped this wave),
verifying at ~92%. That's **5+ more waves** of runway at this size band alone,
before even extending past 0x4c. ov002's reg-alloc `.s` tier is healthy.

## Files

`src/overlay002/` +8 `.s`; `arm9/overlays/ov002/delinks.txt` +8 `complete .text`.
No main/USA/JPN change. Running total scaffolder reg-alloc `.s`: 8×6 = **48**
(main 17, ov002 31).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
