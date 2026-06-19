[//]: # (markdownlint-disable MD013 MD041)

# Brief 455 — region-port wave 11 — overlay-port lane at scale (582/region)

**Brief:** 455 (decomper). Wave 11 of the USA/JPN region-port lane. Wave 10
(brief 453) shipped 812/region of ov002; this wave finishes ov002's reclaimable
tail and drains the **other 20 overlays** with a ground-truth byte comparator
that catches the wave-10 sha1-blind-spot *before* the gate. Mechanism:
[`brief-453-region-port-overlays-w2.md`](brief-453-region-port-overlays-w2.md).

## Result

- **582 USA + 582 JPN `.c` ports** (1,164 total) across 21 overlays, each gated
  **byte-identical** on the per-region ROM `ninja sha1`.
- **40 region core-headers generated** (`src/<region>/overlayNNN/ovNNN_core.h`)
  with data/func externs rewritten EUR→region via the ground-truth address map.
- **1 SDK alias** (`Copy32` @ 0x020943e0, USA + JPN) — unblocked its overlay
  callers (same pattern as wave-1's Fill32/OS_RestoreIrq).
- **3-region `ninja sha1`: EUR / USA / JPN all `OK`.**

## Per-overlay port / park

| Overlay | ports | parked | Overlay | ports | parked |
|---------|------:|-------:|---------|------:|-------:|
| ov000 | 56 | 26 | ov011 | 84 | 15 |
| ov002 (reclaim) | 1 | 41 | ov012 | 6 | 1 |
| ov003 | 12 | 1 | ov013 | 4 | 1 |
| ov004 | 58 | 5 | ov014 | 3 | 0 |
| ov005 | 20 | 18 | ov015 | 28 | 9 |
| ov006 | 142 | 54 | ov016 | 21 | 3 |
| ov007 | 11 | 5 | ov017 | 14 | 2 |
| ov008 | 17 | 2 | ov018 | 18 | 0 |
| ov009 | 9 | 2 | ov019 | 10 | 1 |
| ov010 | 34 | 8 | ov020 | 15 | 1 |
| | | | ov021 | 19 | 5 |

**Total: 582 ports / region.** Parks split: **no-sibling** (size/reloc-sig
mismatch — genuinely region-divergent, mostly `.s`-matched EUR funcs),
**divergent** (instruction-immediate diverges), and **10 overlay-swap-group**
funcs (relocs into `overlays(5,9)`-style shared addresses — deferred, genuinely
hard per-region work).

## Method — the ground-truth byte comparator (closes the wave-10 blind spot)

A port `EUR_func → target_func` is shipped **only if** all three hold:

1. **same size**,
2. **same `reloc_sig`** (offset+kind+target-module of every reloc),
3. **every non-reloc 4-byte word is byte-identical** between the EUR and target
   function (read from the clean per-region uncompressed overlay bins).

(1)+(2) are `find_siblings` HIGH; **(3)** is what catches the region-divergent
struct-offset immediates that objdiff's reloc-tolerance ignores — the func that
failed wave-10's ROM sha1 (`func_ov002_02296a18`).

**Callee/data resolution is ground-truth, not confidence-guessed:** because the
reloc_sig matches, the EUR and target reloc tables pair offset-for-offset → an
exact `EUR_addr → target_addr` map for every symbol the function references. No
`find_siblings` confidence floor; no MEDIUM mis-resolution risk.

## Three blind-spots found and closed this wave

The wave-10 comparator passed `func_ov002_02296a18` (objdiff-clean) but it failed
ROM sha1. Root cause + the general fixes:

1. **Raw address literals in pool words.** A code address passed as an *integer
   arg* (`func_helper(bit, 0x0202f430)`) is a bare `0x…` literal, not a symbol
   token — `port_to_region` left it EUR-valued → wrong region pool word. **Fix:**
   rewrite raw `0x<eur_addr>` literals that match a reloc target to
   `0x<region_addr>`. Genuine constants (e.g. `0x19fd`) are untouched (not reloc
   targets).
2. **Unrewriteable reloc targets → PARK.** If a diverging reloc target is
   referenced as neither a symbol token nor a literal the source can express,
   the port is parked (real divergence) rather than shipped wrong.
3. **Region-stable NAMED symbols** (`GetSystemWork`, `Copy32`, …) need *no*
   rewrite — the linker resolves them per-region — but the naïve unrewriteable
   check flagged them. **Fix:** recognise non-addr-encoded EUR names present in
   the target region by the same name; skip them. (`Copy32` was EUR-named but
   USA/JPN-unnamed → aliased `func_020943e0 → Copy32`, reclaiming its callers.)

Plus the wave-10 **single-pass substitution** (avoids the cascading-alias bug
where self `X→Y` and callee `Y→Z` in the same file double-rewrite the self).

## Shared overlay headers

Many overlays' `.c` `#include "ovNNN_core.h"` (struct defs + data externs named
by EUR address). `-gccinc` resolves `"..."` from the source's own dir, so each
region needs `src/<region>/overlayNNN/ovNNN_core.h` with the data/func externs
rewritten EUR→region (struct defs unchanged). The porter generates these from
the accumulated ground-truth map; an existing header is never clobbered by a
partial idempotent re-run.

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`**. objdiff is *not* used for
validation (its reloc-tolerance is the wave-10 trap) — the per-region ROM sha1
is the gate, and the pre-gate byte comparator makes it pass first try.

## Runway

ov002 `.c` is essentially complete (892 ported + 41 divergent). The big remaining
overlays after this wave: residual `.s`-matched funcs (not `.c`-portable) and the
overlay-swap-group refs. The next region-port vein is the `data_*` overlay
symbols + the overlay-swap-group resolution.
