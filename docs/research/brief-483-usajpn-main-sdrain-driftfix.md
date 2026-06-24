[//]: # (markdownlint-disable MD013 MD041)

# Brief 483 — USA + JPN main `.s` drain + the `func_020a60a8` autopsy (name≠addr drift fix)

**Brief:** 483 (decomper). Another USA/JPN main `.s` wave (main only; ov004/006/011
stay drained), plus: autopsy `func_020a60a8` (JPN main) — the b477 size-overrun fix
unparked `func_020943b0` but NOT this one, so it's a different failure class.
Fix-and-carve or flag the new gap class.

## 🔬 Autopsy: `func_020a60a8` was a `batch_carve` delink-address bug, not a tooling gap

`asm_escape` **self-verifies the `.s` as byte-identical** (6 words — a bit-0 flag
getter). So it was a *gate-fail*, not a verify-fail: the `.s` is correct in
isolation, but the linked ROM `sha1` mismatched. Root cause:

- **The symbol's NAME ≠ its real address.** `func_020a60a8` lives at
  **`0x020a5fb4`** (`symbols.txt addr:` field) — `0xF4` (244 bytes) below its name.
  This is the documented USA/JPN-main **−0xF4 drift band**: the symbol kept its
  nominal EUR name (EUR *does* have it at `0x020a60a8`) while dsd placed it 0xF4
  lower in the region binary. `func_020943b0` (which carved clean) has name==addr.
- **`batch_carve` derived the delink address from the NAME, not `symbols.txt`.**
  `func_addr("func_020a60a8")` → `0x020a60a8`, and `delink_block` wrote
  `.text start:0x020a60a8 end:0x020a60c0`. asm_escape, however, resolves the
  symbol to its real addr (`0x020a5fb4`) — so it carved the *right bytes* but
  `batch_carve` told dsd to place them at the *wrong location* → ROM mismatch.
- **`audit()` missed it** because it only checks the delink *size* (`end-start`
  = `0x18` = the symbols size) — never the absolute *start* position. So the bad
  block passed audit and only the per-byte `sha1` gate caught it (as a gate-fail).

**This is a CLASS, not one func: 46 JPN-main symbols have name≠addr** (and a
similar set in USA) — every one would have gate-failed on carve before this fix.

## 🔧 The fix (tools/batch_carve.py)

- New `parse_symbol_addrs()` reads the real `addr:` per func from `symbols.txt`.
- The carve loop now uses `sym_addrs.get(func, func_addr(func))` — the real ROM
  addr, name-derived only as a fallback. For name==addr funcs (the vast majority)
  behaviour is identical; only drift-band funcs change (and they only ever
  gate-failed before).
- Regression test `test_parse_symbol_addrs_drift_band` added (26 tests green).
- **Validated end-to-end:** a targeted carve shipped `func_020a60a8` —
  `SHIPPED 1, gate-fail 0, clean-rate 100%`, delink block now
  `.text start:0x020a5fb4 end:0x020a5fcc`, JPN `sha1` OK.

(The `audit()` position-blindness is a latent hardening opportunity — it could
also assert `start == symbols_addr[func]` — but the root fix removes the bug at
source; flagged for the tool owner.)

## Result (carve)

- **290 main `.s` ships: USA 149 + JPN 141** (within the ~300 / ~one-module cap).
  USA: SHIPPED 149 / REFUSE 3 / verify-fail 3 / **gate-fail 0**, clean-rate 96%.
  JPN: SHIPPED 141 (incl the validation carve of `func_020a60a8`) / REFUSE 2 /
  verify-fail 3 / **gate-fail 0**, clean-rate 96%.
- **gate-fail 0 in BOTH regions** — the drift fix eliminated the gate-fail class
  (brief 480 had 1 in each). `func_020a60a8` shipped in USA *and* JPN.
- 3-region `ninja sha1`: **EUR / USA / JPN all `OK`** (per-batch region gates +
  final confirm).

## Scope discipline

main only, both regions. ov004/006/011 untouched (drained). `batch_carve` carves
USA → `src/usa/main/`, JPN → `src/jpn/main/` (region-specific; EUR untouched) and
self-sorts the per-region delinks (post-run `sort_delinks.py` = no-op).
