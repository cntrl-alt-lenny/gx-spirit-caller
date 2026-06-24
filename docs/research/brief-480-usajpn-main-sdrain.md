[//]: # (markdownlint-disable MD013 MD041)

# Brief 480 — USA + JPN main `.s` drain (dual-lane)

**Brief:** 480 (decomper). Resume the USA/JPN `.s` drain on **main only** (do NOT
touch ov004/006/011 — drained). Re-attempt the 2 previously-parked JPN-main
gate-fails now the b477 asm_escape size-overrun fix is on main. `batch_carve` per
region, gate each ship on its region `ninja sha1`, commit-on-pass. Cap ~300 ships.

## Result

- **298 main `.s` ships: USA 153 + JPN 145** — each gated on its region's
  `ninja sha1` (commit-on-pass), 3-region `ninja sha1` EUR / USA / JPN all `OK`.
- USA: SHIPPED 153 / REFUSE 3 / verify-fail 3 / gate-fail 1, clean-rate **95%**, 8
  commits. JPN: SHIPPED 145 / REFUSE 1 / verify-fail 3 / gate-fail 1, clean-rate
  **96%**, 7 commits.
- Within the ~300-ship cap; reviews in ~1-2h.

## The two re-attempt funcs (b477 size-overrun fix)

- **`func_020943b0` (0x1c): SHIPPED** ✅ — the b477 `parse_objdump` size-overrun
  fix (no longer swallows adjacent SDK/data symbols) resolved this one.
- **`func_020a60a8` (0x18): STILL gate-fails** ⚠️ — `batch_carve` carved it but
  isolated it as a gate-fail and parked it (the ROM `sha1` still doesn't match).
  **So b477 did NOT fully resolve this class** — `020a60a8` is a deeper residual
  (carves + assembles, but the linked bytes differ). Flagging for the tooling
  lever: it's not a `to_mwasm` *assemble* gap (it carves), it's a *byte-mismatch*
  gate-fail — likely a reloc/adjacent-symbol case the size-overrun fix doesn't
  cover. One func; parked.

## to_mwasm gaps

**No NEW `to_mwasm` "did-not-assemble" gaps this wave.** The 6 verify-fails
(USA 3 + JPN 3) + 2 gate-fails are the pre-existing hard residue (byte-mismatch
class, incl `020a60a8`), not new opcode-coverage gaps. The mechanical lane is
healthy at 95-96% clean on USA/JPN main.

## Scope discipline

- **main only**, both regions. Did NOT touch overlays ov004/006/011 (drained —
  `batch_carve`'s own enumerate returns 0 clean there; the raw `.s` remainder is
  `.c` region-ports / kind:data, not this lane).
- `batch_carve` carves USA → `src/usa/main/` + `config/usa/arm9/delinks.txt`, JPN
  → `src/jpn/main/` + `config/jpn/arm9/delinks.txt` (region-specific, EUR
  excludes them → EUR untouched). It **sorts the per-region delinks itself**
  (post-run `sort_delinks.py` = no-op, both already sorted).

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`** (per-batch region gates +
final confirm).
