[//]: # (markdownlint-disable MD013 MD041)

# Brief 451 — region-port frontier, wave 1 — SDK-name alias quick win

**Brief:** 451 (decomper). Pivot to the USA/JPN region-port frontier (the biggest
untapped easy vein). The `main` `.c` clean-port lane drained at brief 439
(USA 330 + JPN 330 = 660). Two moves were queued: **(1) the SDK-name alias quick
win**, **(2) the overlay region-port lane**. This wave delivers **Part 1** in full
and characterises a region-divergence hazard that gates Part 2's batching method.
Mechanism / prior tooling: see
[`brief-423-region-port-scale.md`](brief-423-region-port-scale.md).

## Result

- **2 SDK symbols aliased × 2 regions** (`OS_RestoreIrq`, `Fill32`) — these were
  named in EUR but address-named (`func_020936d0` / `func_020943cc`) in USA/JPN,
  so every byte-portable caller referencing them was undefined-at-link and parked
  since brief 423.
- **49 USA + 49 JPN `.c` caller ports** (98 total), each gated byte-identical.
- **3-region `ninja sha1`: EUR / USA / JPN all `OK`**.
- **5 callers/region parked** as region-divergent (struct-offset divergence, see
  below) — *not* byte-portable, correctly excluded from the clean set.

## Part 1 — the SDK-name alias

`OS_RestoreIrq` and `Fill32` are NitroSDK leaves (0x18 / 0x14 bytes) shipped as
`.s` in EUR `src/main/`. In USA/JPN they sat un-renamed as `func_020936d0` and
`func_020943cc`. The two are immediately after `OS_DisableIrq` (already named in
all three regions), so the identification is unambiguous:

| Symbol | EUR addr | USA/JPN addr | Size | Anchor |
|--------|----------|--------------|------|--------|
| `OS_RestoreIrq` | 0x020937b8 | 0x020936d0 | 0x18 | next after `OS_DisableIrq` (0x020936bc) |
| `Fill32` | 0x020944c0 | 0x020943cc | 0x14 | size-0x14 leaf, reloc-clean |

Renaming the two `symbols.txt` lines per region (`func_… → OS_RestoreIrq /
Fill32`) unblocks every caller at once. The rename alone gates clean (no caller
ports yet) — verified before porting, isolating the alias from the port wave.

## Part 1 — caller ports

66 EUR `src/main/*.c` reference `Fill32` / `OS_RestoreIrq`. Of those:

| Bucket | Count/region | Disposition |
|--------|-------------:|-------------|
| HIGH-floor byte-portable | ~44 | ported (incl. the IRQ-setter twin cluster, fixed below) |
| MEDIUM-floor (callee neighbor-consensus) | 3 | ported (gate-validated) |
| `Task_InvokeLocked` / `Task_PostLocked` (renamed in EUR) | 2 | ported via the `main_<addr>.c` filename trick |
| **region-divergent struct offset** | **5** | **parked** (deferred divergent tail) |
| sub-floor / no-sibling | ~12 | parked (already-counted residue) |

Net **49 clean ports/region**.

`Task_InvokeLocked` / `Task_PostLocked` have non-`func_` filenames that
`port_to_region.py` rejects. Worked around by copying to `src/main/main_<eur_addr>.c`
(the `main_` filename prefix the tool accepts) and porting that; the tool resolves
the sibling and writes the correctly-named region file. `Task_PostLocked` resolved
3/5 at HIGH (one callee `func_020067f8 → func_020067dc` flagged a LOW anti-match) —
shipped at `--confidence-floor LOW` and **the sha1 gate confirmed the bytes are
correct**, i.e. the anti-match warning was a false alarm here.

## Hazard 1 (recurrence) — duplicate-shape twin mis-resolution

The 8 IRQ-setter siblings at `0x02032f74..0x02033038` (`OS_DisableIrq();
*(u32*)(obj+0xeNN) = v; OS_RestoreIrq();`) are byte-identical *except* the store
offset immediate. `port_to_region`'s byte-sim resolver can't tell them apart, so
several EUR siblings resolved to the **same** USA target — the brief-423 hazard #1,
which the turnkey `_region_port.py` filters but my fresh batch script did not. Two
USA targets (`func_02032f90`, `func_02032fc8`) got **two** EUR sources each;
last-writer-wins corrupted their content + double-appended delinks.

**Fix:** rebuild the bijection from the **store-offset immediate** (the only
distinguishing key), read from the baserom gap-object disassembly:

| EUR | offset | USA target | offset | status |
|-----|--------|-----------|--------|--------|
| f74 | 0xec4 | f3c | 0xec4 | ✓ |
| f90 | 0xecc | f74 | 0xecc | ✓ |
| fac | 0xed0 | f90 | 0xed0 | ✓ (re-ported to fix overwrite) |
| fc8 | 0xed4 | fac | 0xed4 | ✓ |
| fe4 | 0xed8 | — | — | **park** (no USA sibling) |
| 3000 | 0xedc | fc8 | 0xedc | ✓ (re-ported) |
| 301c | 0xee4 | — | — | **park** |
| 3038 | 0xf08 | — | — | **park** |

EUR `fe4`/`301c`/`3038` have no offset-matching USA sibling (USA's family stops at
0xf00 / different members) → genuinely non-portable, parked. JPN is identical.

## Hazard 2 (the headline finding) — region-divergent struct offsets

5 callers/region built and *linked* cleanly but failed sha1. Localised by diffing
the **uncompressed** `build/<r>/build/arm9.bin` against a clean-`main` reference
(ARM9 is BLZ-compressed — ROM-offset cmp is useless, one wrong byte cascades to
~35 KB; the uncompressed diff was exactly **5 bytes**). At `0x02032e48`:

```
mine : add r1, r4, #0x23c   ; struct offset 0xe3c  (copied verbatim from EUR)
truth: add r1, r4, #0x234   ; struct offset 0xe34  (USA/JPN layout)
```

The `bl` targets all resolve correctly — only the **data-structure offset
literal** diverges (EUR 0xe3c vs region 0xe34). `port_to_region` copies literals
verbatim (they aren't symbols), so a region whose struct layout shifted by 8 bytes
produces a wrong-but-linkable port. The 5 affected
(`func_02032e38/e70/ea8/ee4`, `func_020338a8`) are part of the **283/region
divergent tail** the brief defers, not the byte-portable SDK set. **Parked**; USA
and JPN diverge identically (same 5 bytes).

**Method note for future batches:** gate-validate via `ninja sha1`, and when it
fails, diff the *uncompressed* `arm9.bin` against a known-good reference to
localise — objdiff is symbolic (useless for region ports) and the compressed ROM
scrambles the offset. A struct-offset divergence is *not* catchable by the static
collision/confidence filters; only the gate (or an uncompressed diff) sees it.

## Part 2 — overlay region-port lane (next wave)

Not started this wave — Part 1 plus the two hazards filled it. The overlay lane
(brief-421 scout: ov002 1299/1375, ov004 243/276, ov011 171/193, … port-clean) is
the big mechanical vein and remains queued. **Before batching it, port the
duplicate-shape-twin filter + an uncompressed-arm9 localisation step into the
overlay batch tooling** — both hazards above will recur on overlays.

## Running totals (region-port lane)

| Region | This wave | `main` `.c` lane total |
|--------|----------:|----------------------:|
| USA | 49 | 379 |
| JPN | 49 | 379 |

## Gate

3-region `ninja sha1`: **EUR / USA / JPN all `OK`**.
