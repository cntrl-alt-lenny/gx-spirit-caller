### decomper/cluster-a-wave-4-pattern3-wave-2

**Goal:** Two-part parallel-track data-tier wave while
cloud brief 138 closes the SHA1 gap. Cluster A is now
the deepest remaining pool; Pattern 3 application
continues the brief 125 generator scale-up.

**Part 1 — Cluster A wave 4 (small overlays).**

Brief 113 estimated cluster A at 1586 candidates.
Briefs 116 + 118 + 120 shipped 1145 across main +
ov002/4/6/9/14/21. **~441 cluster A candidates remain**
across smaller overlays (ov001/3/5/7/8/10/11/12/13/15/
16/17/18/19/20/22/23).

Recipe unchanged: mwasmarm `.s` + LCF auto-routing
`.bss` per briefs 115/116:

```asm
        .bss
        .global data_ov<NNN>_<addr>
data_ov<NNN>_<addr>:
        .space 0x<size>
```

**Target: 100-300 cluster A symbols** in this wave.
Brief 116 shipped 647 in one wave (main); brief 118
shipped 307 across ov004+ov006; brief 120 shipped 175
across ov009/14/21. Per-wave throughput depends on
gap-list size per overlay.

**Method:**

For each small overlay:
1. Find gap `.o` containing `.bss`:
   `_dsd_gap@ov<NNN>_<idx>.o`.
2. Enumerate via `arm-none-eabi-objdump -t`.
3. Generate `src/overlay<NNN>/bss/data_ov<NNN>_bss.s`
   with all symbols in address order.
4. Add TU claim to `config/eur/arm9/overlays/ov<NNN>/
   delinks.txt`.

Cover 3-5 overlays per wave. Self-extend optional if
budget allows.

**Stretch:** if any of these overlays were FAILED at
baseline (per `dsd check modules`), they might flip
to OK — closing more of the 27/27 → SHA1 path. But
since all 27 modules are now OK across 3 regions
(brief 134 + 136), this likely doesn't shift baseline.

**Part 2 — Cluster C Pattern 3 wave 2.**

Brief 135 shipped 7 Pattern 3 chunks in wave 1. ~17
main `.rodata` chunks remain per brief 135's analysis.
Brief 125's generator (`tools/cluster_c_pattern3_gen
.py`) is the established tool.

**Target: 5-10 chunks** in wave 2 from the next-
highest cross-module-reader pool.

Per-chunk workflow per brief 135:

```bash
python tools/cluster_c_pattern3_gen.py --version eur \
    --module main --start 0x<chunk_start> \
    --end 0x<chunk_end>
```

Generator emits `.s` file + delinks.txt entry. Apply
to all 5-10 chunks.

**Known generator gap (per brief 135):** `.word
<name>` references in chunks need manual `.extern`
declarations added post-generation. Add the externs
manually; flag for brief 141+ generator fix.

**Method:**

Both parts: same workflow as brief 116/120 (Part 1)
and brief 135 (Part 2).

**Self-extend clause:**

Both sub-pools have depth. If combined Part 1 + Part 2
exceeds 30 candidates, optionally extend.

**Non-scope:**

- ❌ ov004 cluster C / D-1 / D-2 sweep (separate
  brief 141+ candidate now-accessible post brief 134).
- ❌ Cluster B wave 1 (separate brief candidate).
- ❌ 30 KB main mega-array (separate brief).
- ❌ Cluster D-2 wave 3 (separate brief).
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- Part 1 cluster A: ≥ 100 symbols claimed across
  small overlays.
- Part 2 Pattern 3: ≥ 5 chunks byte-identical.
- **Combined: ≥ 105 effective.**
- All 3 regions stay at 27/27 module baseline.
- Per-wave PR with funnel + per-overlay + per-chunk
  notes.

**Branch:** `decomper/cluster-a-wave-4-pattern3-wave-2`

**After this brief lands:**

1. **Cluster A drains** to ~141-341 remaining; 1-2
   more waves close it.
2. **Pattern 3 main `.rodata`** drains to ~7-12
   remaining; 1-2 more waves close.
3. **Brief 138's SHA1-gap fix lands in parallel** —
   if successful, brief 140's CRC16 + patcher fix
   completes the SHA1 match path.
