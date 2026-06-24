[//]: # (markdownlint-disable MD013 MD041)

# Brief 491 — USA/JPN main `.s` drain, chunk 4 (FINAL, stacked PR 4/4): both veins drained

**Brief:** 485-series rolling autonomous drain, final chunk. Stacked off chunk-3
(`decomper/usajpn-main-s-489`, PR #1028). USA + JPN main only. This closes the
4-PR stack: **USA and JPN main are both drained to the hard-residue floor.**

## Result (chunk 4)

- **482 ships: JPN 482 + USA 0** (USA mop-up found 0 carveable — confirms USA
  drained; all 49 USA residue funcs are already-parked refuse/verify-fail/gate-fail).
  JPN: SHIPPED 482 / REFUSE 8 / verify-fail 3 / gate-fail 1, clean-rate **97%**.
- 3-region `ninja sha1`: **EUR / USA / JPN all `OK`** (per-batch region gates + final confirm).

## Session total (4 stacked PRs)

| chunk | PR | USA | JPN | total |
|------:|----|----:|----:|------:|
| 1 | #1025 | 636 | 640 | 1276 |
| 2 | #1027 | 630 | 631 | 1261 |
| 3 | #1028 | 696 | 629 | 1325 |
| 4 | (this) | 0 | 482 | 482 |
| **total** | | **1962** | **2382** | **4344** |

**4,344 main `.s` ships across the session**, every batch gated byte-identical on
its region's `ninja sha1`, all 4 chunks 3-region green.

## Both veins DRAINED

| region | uncarved at session start | **uncarved now** | of 4093 arm funcs |
|--------|--------------------------:|-----------------:|------------------:|
| USA main | 2011 | **49** (42 ≤0x200) | drained |
| JPN main | 2430 | **48** (41 ≤0x200) | drained |

The remaining ~48-49/region is the non-`.s`-able floor — and it's the *same*
residue in both regions (region-identical funcs). Composition:

- **kind:data REFUSE** (the majority) — clean-C / data territory, not
  whole-function `.s`.
- **verify-fail** (~6/region) — `asm_escape`'s `to_mwasm`/objdump can't
  byte-reproduce them = the **to_mwasm coverage tooling lever** (same class as the
  EUR `.s` tail).
- **2 gate-fails, region-identical: `func_02020fa4` + `func_020b3988`** — see below.

## ⚠️ The remaining gap class for the next tooling lever

**`func_02020fa4` and `func_020b3988` gate-fail in BOTH regions** (same addresses).
asm_escape self-verifies each as byte-exact, but the linked ROM `sha1` differs.
This is **NOT** the brief-483 name≠addr drift (these are name==addr) and **NOT** a
`to_mwasm` assemble gap (they assemble). It's a **link/placement byte-mismatch** —
most likely a self-referential relocation or literal-pool placement the delink
can't reproduce in isolation. They are skip-listed (won't recur). **This is the
next autopsy target** if more `.s` is wanted from main: characterize why an
assembled-correct func links to different bytes (probably needs an asm_escape
reloc-emit fix, analogous to the size-overrun fix).

## to_mwasm gaps

No NEW `to_mwasm` "did-not-assemble" gaps across the whole 4-chunk run. The
verify-fail residue is the pre-existing class. Clean-rate held 95–98% throughout.

## Method / tooling notes

Rolling `batch_carve` per region per chunk (`python -u`, batch 25–50,
commit-on-pass, gate-each-batch, reap python between runs, self-sorted delinks).
**`--skip-list`/`--verifyfail-list` (seeded from chunk 3) persist parks across
chunks** so the recurring gate-fails / refuses stop costing re-attempts — a worthy
default for any future multi-chunk run. Stacked branches (each off the prior
pushed branch); brain merges #1025 → #1027 → #1028 → this in order.
