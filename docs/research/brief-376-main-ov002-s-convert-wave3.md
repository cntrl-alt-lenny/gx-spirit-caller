[//]: # (markdownlint-disable MD013 MD041)

# Brief 376 — main/ov002 reg-alloc → `.s`, wave 3 (Windows lane)

**Brief:** 376 (scaffolder). Continue the main + ov002 `.s`-bound reg-alloc
backlog from waves 1–2 (#894 + #897 = 16 main ships). Next batch of the
LOW/plateau tier, `asm_escape --whole-function` each, gate on 3-region
`ninja sha1`. Target ~8.

## Headline — 8 more `.s` (1 main + 7 ov002), 3-region `ninja sha1` green; the lane pivots to ov002

Waves 1–2 drained the **main** reg-alloc pile (16 ships); the residue there is
`asm_escape`-translation-blocked or permuter-class. The productive move this wave
was **ov002**: the decomper has moved to the ov-\* overlays (briefs 371/373 did
ov000/003/007/009/011/016/017/019), so **ov002 is now the scaffolder's lane** —
my waves 1–2 deferral of it was over-cautious. Mined its reg-alloc gap directly:
**8 byte-exact `.s` shipped, all link-clean.**

## Method — enumerate the ov002 gap, filter, probe

1. Re-`dis` ov002; enumerate uncarved gap funcs ≤ 0x44 that do **not** call the
   arg-pack sink `021d479c` (those are the decomper's clean-C drain family) → **39
   candidates**.
2. `asm_escape --whole-function` a batch — it byte-verifies **and** reports
   carve-status (a carved func errors "not found in delinks"), so it auto-filters
   anything already shipped.
3. Drop **byte-pack** hits (e.g. `021aff4c`, 3× `and #0xff`/`orr lsl#8`) — those
   have a clean-C path (the `(u8)` cast), so they're not `.s` targets.

## The 8 ships

| addr | mod | size | note |
|---|---|---|---|
| `02067328` | main | 0x2c | bounded array append (10v11; mwcc drops one guard) — last main straggler (brief 353) |
| `02202b2c` | ov002 | 0x2c | leaf reg-alloc wall |
| `02216530` | ov002 | 0x30 | leaf reg-alloc wall |
| `0227aa50` | ov002 | 0x30 | leaf reg-alloc wall |
| `0223dad0` | ov002 | 0x34 | leaf reg-alloc wall |
| `021c9af0` | ov002 | 0x3c | reg-alloc wall |
| `021b9210` | ov002 | 0x44 | reg-alloc wall |
| `0223def4` | ov002 | 0x44 | reg-alloc wall |

All 8: `asm_escape` → `✅ byte-identical vs delinked .o`. Link-clean — the data
references are all `kind:bss` (`data_ov002_022cd300`/`…ce288`/`…ce720`/`…cf170`/
`…cf174`/`…d016c`, `data_022d016c`), which link; brief-361's false-pass risk is
only non-bss `kind:data`, none here.

## asm_escape translation failures (skip, tool-fix pending)

In the probe batch, `021b1d48` / `02273500` / `022592b8` emitted a `.s` that
**did not byte-verify** (objdump→mwasm translation gaps — the same class the
decomper flagged in 373, `parse_objdump` trailing-pool-reloc + opcode-order). They
are genuinely uncarved but `asm_escape` can't currently translate them; flagged
for the tool fix, skipped.

## Gate — 3-region `ninja sha1`

| region | result | why |
|---|:---:|---|
| EUR | **OK** | the 8 `.s` link clean, ROM byte-identical |
| USA | **OK (unaffected)** | `src/main/*.s` **and** `src/overlay002/*.s` are EUR-only (`_is_region_source_excluded` → `region != "eur"` for no-prefix paths); USA delinks untouched |
| JPN | **OK (unaffected)** | same |

## Files

`src/main/` +1 `.s`; `src/overlay002/` +7 `.s`; EUR `arm9/delinks.txt` +1,
`arm9/overlays/ov002/delinks.txt` +7 `complete .text`. No USA/JPN change. Running
total scaffolder reg-alloc `.s`: wave 1 (8) + wave 2 (8) + wave 3 (8) = **24**
(main 17, ov002 7).

## Note for the next wave

ov002 has **~32 more** small non-arg-pack uncarved reg-alloc candidates from this
enumeration alone (39 found, 8 shipped, 3 translation-failed) — a deep vein, so
wave 4 can stay in ov002. The arg-pack family (`021d479c` callers) and byte-pack
shapes are left for a clean-C drain (whoever owns that next); the asm_escape
translation failures want the `parse_objdump`/`to_mwasm` fix first.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
