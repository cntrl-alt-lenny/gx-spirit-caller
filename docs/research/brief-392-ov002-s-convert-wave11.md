[//]: # (markdownlint-disable MD013 MD041)

# Brief 392 — ov002 reg-alloc → `.s`, upper-half wave 11 (Windows lane)

**Brief:** 392 (scaffolder). Continue the ov002 upper-half `.s`-bound reg-alloc
backlog from waves 1–10 (= 80 ships). **New discipline:** append carve blocks
anywhere in `ov002/delinks.txt`, then run `tools/sort_delinks.py` before
committing — it keeps the file address-sorted so my upper-half blocks and the
decomper's lower-half land in disjoint regions and git auto-merges (no more
conflict markers). Target ~8.

## Headline — 8 upper-half `.s` shipped, sorted-delinks discipline adopted, 3-region `ninja sha1` green

**8 byte-exact upper-half ov002 `.s` shipped.** Adopted the `sort_delinks.py`
workflow and verified it **lossless**: the ov002 `.s` func-entry set went 207 →
215 (= +my 8 exactly, 0 dropped), and the file is now fully address-sorted. This
ends the recurring merge conflict — concurrent upper/lower-half waves now edit
disjoint sorted regions.

## The 8 ships (all ov002, upper half ≥ 0x02234000)

| addr | size | bl |
|---|---|---|
| `02267f40` | 0x50 | 1 |
| `0226b1b4` | 0x50 | 1 |
| `0225bcf4` | 0x58 | 1 |
| `02254a2c` | 0x58 | 3 |
| `0226ae50` | 0x58 | 0 |
| `0223b16c` | 0x58 | 3 |
| `02264558` | 0x5c | 3 |
| `02259aec` | 0x60 | 2 |

All `asm_escape` → `✅ byte-identical vs the delinked .o`. Link-clean — every
`data_` reference is `kind:bss` (the mandatory check). No byte-pack.

## The `sort_delinks.py` discipline (new, every wave)

```
# 1. asm_escape + copy .s + append "complete .text" blocks anywhere
# 2. python tools/sort_delinks.py config/eur/arm9/overlays/ov002/delinks.txt
# 3. ninja sha1
```

This wave: appended 8 blocks at the end (4 inversions vs the sorted file), the
tool re-sorted to 0 inversions. Verified **lossless** (orig 207 funcs + my 8 =
215, dropped = ∅) and **address-sorted** (1203 blocks, strictly ascending). The
sha1 build confirms the reordered file links byte-identically — `dsd` is
block-order-agnostic, so sorting is purely a merge-hygiene transform.

## The `kind:bss` check dropped 1 (`022627ac`)

`022627ac` verified byte-exact but references `data_ov002_022cb96c` (**`kind:data`**)
→ would fail the link gate. Dropped. (Plus the known wave-9 `kind:data` trio
`02253638`/`0225368c`/`022536e8` is pre-excluded from the enumeration.)

## Gate — 3-region `ninja sha1`

| EUR | USA | JPN |
|:---:|:---:|:---:|
| **OK** | **OK** (unaffected — `src/overlay002/*.s` is EUR-only) | **OK** |

## Thinning watch — NOT thinning

The upper-half `≤0x60` non-arg-pack non-byte-pack uncarved pool is **79**
candidates (8 shipped → ~71 remain), verifying ~100% with the store-merge fix —
**~9 more waves** of runway at this band; past 0x60 widens it. Healthy.

## Files

`src/overlay002/` +8 `.s`; `arm9/overlays/ov002/delinks.txt` +8 blocks
(sort-normalised). No main/USA/JPN change. Running total scaffolder reg-alloc
`.s`: 8×11 = **88** (main 17, ov002 71).

🤖 Generated with [Claude Code](https://claude.com/claude-code)
