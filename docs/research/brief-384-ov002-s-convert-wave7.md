[//]: # (markdownlint-disable MD013 MD041)

# Brief 384 — ov002 reg-alloc → `.s`, wave 7 (Windows lane)

**Brief:** 384 (scaffolder). Continue the ov002 `.s`-bound reg-alloc backlog from
waves 1–6 (= 48 ships). `asm_escape --whole-function` each, gate on 3-region
`ninja sha1`. Target ~8. Flag if the tier thins.

## Headline — 8 ov002 `.s` shipped, 3-region `ninja sha1` green

**8 byte-exact ov002 `.s` shipped.** The verify rate held at **13/13 = 100%** this
batch — and notably, the **bl≥1 funcs (small walls with 1–2 calls) translate just
as cleanly as the bl=0 leaves**, which matters for the thinning read below.

## The 8 ships (all ov002)

| addr | size | bl |
|---|---|---|
| `022bdb18` | 0x2c | 0 |
| `021b2094` | 0x38 | 1 |
| `021d63fc` | 0x38 | 1 |
| `021fa0ec` | 0x3c | 1 |
| `022074dc` | 0x4c | 0 |
| `02209048` | 0x4c | 0 |
| `021d48a8` | 0x4c | 1 |
| `021f7798` | 0x4c | 1 |

All `asm_escape` → `✅ byte-identical vs the delinked .o`. Link-clean — every
`data_` reference is `kind:bss` (the wave-4 mandatory check). No byte-pack.

## The `kind:bss` check earns its keep again

`021bc6e8` verified byte-exact but references **`data_ov002_022bdfc4` —
`kind:data`, not bss** → would fail the link gate (dsd emits no linkable def).
**Dropped it.** This is the **second** pick caught by the check (after wave-4's
`0229a060`) — non-bss `data` refs are a real, recurring `.s` link risk, so the
`kind:` grep before every ship is non-negotiable.

## Thinning watch — the leaf sub-seam thins, the tier does not

- The clean **bl=0** leaf walls at `≤0x4c` are down to ~4 (this wave took 3 of
  them). That narrow sub-seam **is** thinning.
- But the **bl≥1** `≤0x4c` pool is **37** candidates and they verify at the same
  ~100% rate — a function with 1–2 calls that's still uncarved is just as much a
  reg-alloc wall as a leaf. So the reg-alloc `.s` tier overall is **healthy**; the
  shift is from pure-leaf to call-bearing walls, not toward exhaustion.
- **45** `≤0x4c` candidates remain total; extending past 0x4c (most ov002 walls
  are 0x48–0x60) opens far more. **Not thinning — keep going on bl≥1.**

## Gate — 3-region `ninja sha1`

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

## Files

`src/overlay002/` +8 `.s`; `arm9/overlays/ov002/delinks.txt` +8 `complete .text`.
No main/USA/JPN change. Running total scaffolder reg-alloc `.s`: 8×7 = **56**
(main 17, ov002 39).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
