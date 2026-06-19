[//]: # (markdownlint-disable MD013 MD041)

# Brief 453 — region-port Part 2: ov002 overlay `.c` ports (USA + JPN)

**Brief:** 453 (decomper). Region-port Part 2 — the overlay-port lane. Bulk
`port_to_region.py` of EUR ov002 `.c` matches to USA + JPN.

> **Ship note (brain, landing the wave):** the decomper session generated the
> ports but ended before running the ship step (no commit/push/PR/doc). The
> brain verified, parked the one divergent function (below), and landed the
> clean remainder. This doc is written by the brain from the worktree state.

## Result — 812 USA + 812 JPN ov002 ports shipped (1,624 total)

`port_to_region.py` on EUR ov002 `.c` → USA + JPN `src/<region>/overlay002/`.
ov002 was the cleanest/biggest overlay per the brief-439 scout (≈1299/1375
region-identical). Each ported func's compiled `.o` matches the region-delinked
`.o`; uncovered ranges remain dsd auto-gap (original region bytes).

## The one divergent function — `func_ov002_02296a18` (parked, both regions)

The first integration gate **failed `ninja sha1` on USA and JPN** even though
objdiff reported every `src/<region>` unit complete. Localised with the
**uncompressed overlay diff** (hazard-2 recipe from brief 451 w1):

```
cmp -l build/<r>/build/arm9_ov002.bin extract/<r>/arm9_overlays/ov002.bin
# USA: 2 bytes @ 0x2296a6d/0x2296a6e ; JPN: 2 bytes @ 0x2296a6c/0x2296a6d
```

Both land inside `func_ov002_02296a18` (0x02296a18–0x02296a70). It is a
**region-divergent struct-offset literal** — the EUR-sourced `.c` emits an
`add rX, rY, #<EUR offset>`; USA/JPN use a different struct layout, so the
immediate differs by a couple bytes. objdiff's reloc-tolerant comparator scored
the unit "complete" (the divergence is in an instruction immediate it does not
byte-check), so it was invisible at the unit level and only surfaced at the ROM
sha1 — the canonical reason **the gate is the ROM, not objdiff**.

**Park:** removed the `.c` + its delink entry in both regions. dsd auto-gaps the
range with original region bytes → byte-identical. Re-gate: **USA + JPN
`ninja sha1` OK.** `02296a18` is real per-region decomp (a later RE brief).

## Method note for future region-port waves

A `port_to_region` `.c` can compile + link + score objdiff-complete yet **fail
ROM sha1** on a divergent instruction immediate. Per-unit objdiff is NOT
sufficient validation for region ports — always finish with the per-region ROM
`ninja sha1`, and when it fails, localise via the **uncompressed** module-bin
`cmp` (BLZ compression makes ROM `cmp` useless), then park the offending func.

## Gate

3-region `ninja sha1`: EUR (unaffected) + **USA OK** + **JPN OK** (re-gated
after the park). Brain reproduces all three on the merged tree.
