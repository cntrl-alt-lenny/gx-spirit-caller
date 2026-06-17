[//]: # (markdownlint-disable MD013 MD041)

# Brief 437 — region port, wave 8 — both regions reach the main `.c` tail

**Brief:** 437 (decomper). Wave 8 of the USA/JPN region-port lane (briefs 421
scout, 423–435). Mechanism: see
[`brief-423-region-port-scale.md`](brief-423-region-port-scale.md).

## Result

- **7 USA (MEDIUM) + 70 JPN (10 HIGH + 60 MEDIUM)** = 77 `.c` ports, gated
  **byte-identical** on the first try (no MEDIUM mis-resolutions this wave).
- **3-region `ninja sha1`: EUR / USA / JPN all `OK`**.

## Both regions now at the main `.c` tail (the headline)

This wave both regions' "easy" pools ran out and we can see the floor of the
main `.c` lane:

- **USA `main` is essentially DRAINED.** USA MEDIUM yielded only 7 of 65
  candidates — the rest are now 47 SDK-name-blocked + ~14 sub-MEDIUM/mismatch
  residue. There is **~0 cleanly-portable USA `main` `.c` left**. USA `main` lane
  total: **330**.
- **JPN HIGH also thinned** — it yielded only 10 of 145 (down from 40-50 in prior
  waves), because the HIGH-clean JPN pool is nearly gone. So I **pivoted JPN to
  MEDIUM** (the same gate-validated lever USA used): +60 clean, all byte-identical.
  JPN `main` lane total: **314**.

### Standing after this wave

| Region | Lane total | Portable-unported | of which |
|--------|-----------:|------------------:|----------|
| USA | 330 | 61 | 47 SDK-blocked + ~14 sub-MEDIUM/mismatch (≈0 cleanly portable) |
| JPN | 314 | 78 | ~31 MEDIUM-reachable (~½ wave) + 47 SDK-blocked |

**So the main `.c` region-port lane is nearly done for both regions:** ~½ more
JPN wave, after which the only remaining `main` region work is the **47
SDK-blocked funcs per region (94 total)** — `Fill32` / `OS_RestoreIrq` callers.

### Decision point — now for BOTH regions

To continue region porting past the imminent tail, pick a lever (was USA-only at
brief 435, now applies to both):

1. **Verified `Fill32` / `OS_RestoreIrq` region alias** — unblocks the 94
   SDK-blocked funcs (47 USA + 47 JPN). Their `find_region_siblings` confidence is
   LOW (tiny 0x14/0x18 leaves), so this is a careful by-hand map of 2 symbols ×
   2 regions, validated by the `sha1` gate.
2. **Pivot to clean overlay funcs** — the brief-421 scout found the overlay pools
   (ov002 etc.) mostly port-clean; a large untouched lane.

My recommendation: **one more wave finishes JPN `main` (~31) + starts the SDK
alias or overlay pivot.** The alias is the higher-leverage single action (unblocks
94 at once).

## MEDIUM-floor health

Cumulative MEDIUM ports across waves 6-8: **129 / 130 byte-identical** (one
wave-7 wrong-sibling, gate-caught). MEDIUM remains safe because every wave is
sha1-gated (objdiff is symbolic → useless for region ports; the gate is the only
real check).

## Method

USA MEDIUM, JPN HIGH then MEDIUM (`build/_region_port.py <region> N <floor>`).
Both delinks `sort_delinks.py`-canonicalised; static collision scan clean;
`KNOWN_BAD_OUTPUTS` held; proactive MD018 doc sweep before push.

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`**.
