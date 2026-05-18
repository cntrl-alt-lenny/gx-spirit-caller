### decomper/ov004-cluster-sweep

**Goal:** Multi-cluster data-tier sweep of ov004 — now-
accessible post brief 134's binary patcher landed (W7
mitigation Phase 3). Parallel-track decomper work while
cloud brief 140 closes the SHA1 final gate.

**Context — why ov004 was deferred:**

Brief 122 explicitly excluded ov004 from cluster work due to
the W7 wall (mwldarm overlay-swap blindness — 86 spurious
veneers cascaded section addresses by 0x400). Brief 134's
post-link binary patcher (`tools/patch_ov004_veneers.py`)
fixed that — ov004 has been at OK module-checksum across all
3 regions since brief 134 (and remained OK through briefs
135 + 136 + 138 + 139). The cluster pool inside ov004 is now
safely accessible.

Brief 139's non-scope explicitly flagged this:

> ❌ ov004 cluster C / D-1 / D-2 sweep (separate brief 141+
> candidate now-accessible post brief 134).

Brief 118 already shipped 156 cluster A `.bss` symbols in
ov004 + ov006. The remaining structural-data pool inside
ov004 (cluster C / D-1 / D-2) was deferred.

**Brief 141 deliverables (multi-cluster, single overlay):**

### Part 1 — Cluster C wave on ov004 (Pattern 1)

Per brief 122 / brief 126 recipe. Native `.rodata` integer
arrays + Pattern 1 strings in ov004's `.rodata`. Enumerate
via:

```bash
arm-none-eabi-objdump -t build/eur/.../arm9_ov004.bin \
    | grep '\.rodata' | sort -k1
```

Target: 10-25 Pattern 1 chunks. Recipe: `.s` files
mirroring brief 122's shape:

```asm
        .rodata
        .global data_ov004_<addr>
data_ov004_<addr>:
        .word ...   # or .ascii / .asciz
```

Stack into `src/overlay004/data/` + claim in
`config/eur/arm9/overlays/ov004/delinks.txt`.

### Part 2 — Cluster D-1 wave on ov004 (dispatch tables)

Brief 124 recipe. Multi-pointer dispatch tables in ov004's
`.data`. ~10-15 tables expected from brief 121's D-1 pool.
Same `.s` shape; `.global data_ov004_<addr>` with `.word
<sym>` entries.

### Part 3 — Cluster D-2 wave on ov004 (scalar arrays)

Brief 130 / 133 / 135 recipe. Strict-alignment scalar
arrays in ov004's `.data`. ~5-10 candidates.

### Part 4 (optional) — Pattern 3 chunks on ov004

If ov004's `.rodata` contains contiguous Pattern 3 regions
(per brief 125 generator), apply 3-5 chunks. Brief 135's
generator is already established. Note the known generator
gap from brief 139: manual `.extern` declarations for
`.word <name>` references (brief 142+ candidate to fix
upstream).

**Target: 25-50 total ov004 symbols** across all four
parts. Self-extend optional if pool is deeper than
expected.

**Method:**

For each cluster part:

1. Enumerate gap symbols in ov004 via `objdump -t` on the
   relevant `_dsd_gap@ov004_*.o` file.
2. Generate `.s` file under `src/overlay004/<cluster>/`.
3. Add TU claim to `config/eur/arm9/overlays/ov004/
   delinks.txt`.
4. `ninja rom && ./dsd check modules` — ov004 stays OK
   across 3 regions.
5. Repeat for next cluster.

**Cross-region note:** ov004 stays at OK across EUR + USA +
JPN per brief 134's Phase 3 patcher. Source-level claims in
EUR project to USA / JPN via the cross-region applies that
landed pre-brief-141. Verify each region's checksum after
the sweep.

**Non-scope:**

- ❌ Brief 140's SHA1 work (separate cloud track).
- ❌ Cluster B wave 1 (separate brief).
- ❌ Cross-region cluster A apply (separate brief).
- ❌ 30 KB main mega-array (separate brief).
- ❌ Pattern 3 generator `.extern` emission fix (brief 142+
  cloud candidate).
- ❌ data_symbol_sizes.py `kind:bss` extension (brief 142+
  cloud candidate per brief 139 funnel).
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- ≥ 25 ov004 symbols claimed across cluster C + D-1 + D-2
  (+ optional Pattern 3).
- All 3 regions stay at 27/27 module baseline.
- ov004 module-checksum stays OK across all 3 regions
  (most important — verify W7 binary patcher unaffected).
- Per-wave PR with cluster breakdown + funnel.

**Branch:** `decomper/ov004-cluster-sweep`

**After this brief lands:**

1. **ov004 data-tier coverage** opened up — first pass; future
   waves close the rest.
2. **Brief 140's SHA1 PASS may land in parallel** — if so, this
   PR may be the first decomp-tier wave that lands AFTER
   `ninja sha1` passes (i.e., into a fully-byte-matching
   project). New milestone framing.
3. **Cluster pool depth narrowing**. Post-brief-141 the
   remaining waves are mostly Cluster B (true scalars), 30 KB
   mega-array, cross-region applies, and Pattern 3 generator
   fix. The decomp-tier funnel is well-defined for the next
   3-5 briefs.
