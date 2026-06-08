[//]: # (markdownlint-disable MD013 MD041)

# Brief 390 — ov002 reg-alloc → `.s`, upper-half wave 10 (Windows lane)

**Brief:** 390 (scaffolder). Continue the ov002 upper-half `.s`-bound reg-alloc
backlog from waves 1–9 (= 72 ships). The decomper is setting up a per-lane
delinks split so the merge collision stops recurring — use my lane's file if it
landed. `asm_escape --whole-function` each, gate on 3-region `ninja sha1`. Target
~8. Flag if my half thins.

## Headline — 8 upper-half `.s` shipped, 3-region `ninja sha1` green

**8 byte-exact upper-half ov002 `.s` shipped.** The wave-9 conflict-marker fix
held (no markers lingered on `main`), and the per-lane delinks split is **not on
`main` yet** (only the single `ov002/delinks.txt`), so this wave appends to that
file as before — see the coordination note.

## The 8 ships (all ov002, upper half ≥ 0x02234000)

| addr | size | bl |
|---|---|---|
| `022593a8` | 0x4c | 1 |
| `02257704` | 0x4c | 2 |
| `0225b2e8` | 0x50 | 1 |
| `02244088` | 0x50 | 3 |
| `022584ac` | 0x54 | 1 |
| `0225753c` | 0x58 | 1 |
| `02259990` | 0x58 | 2 |
| `022599e8` | 0x58 | 2 |

All `asm_escape` → `✅ byte-identical vs the delinked .o`. Link-clean — every
`data_` reference is `kind:bss` (the mandatory check; no `kind:data` drops this
batch — the 0x50–0x58 funcs picked were all bss). No byte-pack.

## Coordination — per-lane delinks split not yet on `main`

At branch time `config/eur/arm9/overlays/ov002/` still has only the single
`delinks.txt` (no `delinks-scaffolder.txt`/include yet). So this wave appends to
`delinks.txt` as before, staying strictly in the **upper half** (addr ≥
`0x02234000`) so my entries never touch the decomper's lower-half region. If the
decomper's per-lane PR lands before this one merges, the brain should route my 8
upper-half entries into the scaffolder lane file (they're append-only `complete`
blocks; no overlap with the lower half). Once the split exists, future waves will
target the scaffolder lane file directly — ending the recurring merge conflict.

## Gate — 3-region `ninja sha1`

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

## Thinning watch — NOT thinning

The upper-half `≤0x60` non-arg-pack non-byte-pack uncarved pool is **90**
candidates (8 shipped → ~82 remain), verifying ~100% with the store-merge fix.
That's **~10 more waves** of upper-half runway at this band; extending past 0x60
widens it further. Healthy.

## Files

`src/overlay002/` +8 `.s`; `arm9/overlays/ov002/delinks.txt` +8 `complete .text`.
No main/USA/JPN change. Running total scaffolder reg-alloc `.s`: 8×10 = **80**
(main 17, ov002 63).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
