[//]: # (markdownlint-disable MD013 MD041)

# Brief 378 — main/ov002 reg-alloc → `.s`, wave 4 (Windows lane)

**Brief:** 378 (scaffolder). Continue the main + ov002 `.s`-bound reg-alloc
backlog from waves 1–3 (#894 + #897 + #898 = 24 ships). Next batch of the
LOW/plateau tier, `asm_escape --whole-function` each, gate on 3-region
`ninja sha1`. Target ~8. Flag if the tier is thinning.

## Headline — 8 ov002 `.s` shipped, 3-region `ninja sha1` green

**main is drained** (wave 3 took the last main straggler `02067328`), so wave 4
is **ov002-only** — the deep vein flagged in wave 3. Re-ran the wave-3 method on
fresh `main`: enumerate uncarved ov002 gap funcs ≤0x44 that don't call the
arg-pack sink `021d479c` and have no byte-pack ops → **26 remaining** → probe a
batch → **8 byte-exact `.s` shipped**, all link-clean.

## The 8 ships (all ov002, reg-alloc leaf walls)

| addr | size | words |
|---|---|---|
| `022ae718` | 0x2c | 11 |
| `02259324` | 0x38 | 14 |
| `0220472c` | 0x3c | 15 |
| `022072d0` | 0x3c | 15 |
| `021b9b20` | 0x44 | 17 |
| `021fbf30` | 0x44 | 17 |
| `0220d930` | 0x44 | 17 |
| `022968bc` | 0x44 | 17 |

All `asm_escape` → `✅ byte-identical vs the delinked .o`. The `data_` references
(`data_ov002_022d0254`/`…ce288`/`…cd73c`/`…d016c`/`…cf16c`, `data_02104f4c`) are
all `kind:bss` (linkable).

## Caught a real brief-361 link risk in practice

`0229a060` verified byte-exact but references **`data_ov002_022ca370` —
`kind:data`, not `kind:bss`**. dsd emits no linkable definition for a non-bss
`data` symbol (brief 361), so it would fail the link gate despite the byte-match.
**Dropped it.** This is the first `.s` pick to hit the non-bss-data risk — the
`kind` check before shipping is load-bearing, not theoretical. (All shipped picks
across waves 1–4 reference bss/MMIO/literal only.)

## asm_escape translation failure (skip, tool-fix pending)

`0222ceac` emitted a `.s` that **did not assemble** — an objdump→mwasm gap (the
class the decomper flagged in 373). Of the 12 probed, 11 verified and 1 failed
(~8%); skipped.

## Gate — 3-region `ninja sha1`

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

## Thinning watch

- **main reg-alloc `.s` is drained** (17 ships across waves 1–3; residue is
  asm_escape-translation-blocked or permuter-class).
- **ov002 is NOT yet exhausted but the easy seam is thinning.** After this wave
  ~17 `≤0x44` candidates remain in the enumeration, but they skew **bl≥1** (the
  clean bl=0 leaf walls are being consumed); the remaining bl≥1 funcs are more
  likely to have a clean-C path or a complex shape. Extending past 0x44 brings in
  bigger funcs (more clean-C-drainable risk). Plus a steady **~8–25% asm_escape
  translation-failure rate** drags each batch.
- **Recommendation:** one more ov002 `.s` wave is viable (wave 5, bl=0 remainder +
  a careful bl=1 pass), but the higher-leverage move is now the **asm_escape
  `parse_objdump`/`to_mwasm` fix** — it recovers the accumulating translation
  failures across BOTH lanes and unlocks the larger/complex reg-alloc funcs that
  the seam is otherwise reduced to.

## Files

`src/overlay002/` +8 `.s`; `arm9/overlays/ov002/delinks.txt` +8 `complete .text`.
No main/USA/JPN change. Running total scaffolder reg-alloc `.s`: 8+8+8+8 = **32**
(main 17, ov002 15).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
