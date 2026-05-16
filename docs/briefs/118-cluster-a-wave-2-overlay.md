### decomper/cluster-a-wave-2-overlay

**Goal:** Cluster A wave 2 — scale brief 116's
`.bss` placement recipe to overlay coverage. Brief
116 took 647 cluster A symbols in main; **939
remaining across overlays** (1586 total - 647).
Brief 113 noted per-module concentration:
ov004/6/7/9/14/21 each ~525 KB of data tier. Wave 2
picks **one large-pool overlay** to validate the
recipe scales beyond the main module.

**Context — what brief 116 established:**

Recipe (mwasmarm `.bss` source + dsd LCF auto-
routing):

```asm
        .bss
        .global data_X
data_X:
        .space 0x<N>
```

Per-symbol cost: one symbol + `.space N` directive.
mwasmarm preserves source order = address order.
dsd's LCF auto-routes based on delinks.txt claims.
Recipe scales linearly with section gap-list size.

Brief 116 covered:

- Pre-cluster main (`src/main/bss/data_main_bss_pre.s`)
- Main residue (`src/main/bss/data_main_bss.s`) —
  637 syms in one file via address-order enumeration

**Wave 2 method:**

1. **Pick the overlay.** Two candidates:
   - **ov004** — 84 KB code, 743 KB data (brief 113
     per-module table). Largest data pool.
   - **ov006** — 102 KB code, 601 KB data. Second-
     largest.
   Pick one. Brief 113 doesn't prefer either; pick the
   one with the cleanest cluster A candidate list per
   `data_worklist.py v2`:

   ```bash
   python tools/data_worklist.py --version eur \
       --cluster A --module ov004 --top 100
   ```

   (Substitute `ov006` if ov004's list shows blockers.)

2. **Enumerate the overlay's `.bss` gap list.** Per
   brief 116's pattern: read `config/eur/arm9/overlays/
   ov<NNN>/symbols.txt`, identify `kind:bss
   addr:0x<addr>` entries that aren't already in a
   claimed TU range. Sort by address.

3. **Write the source file.**
   `src/overlay<NNN>/bss/data_ov<NNN>_bss.s` (or
   similar — match brief 116's convention from main).
   Per-symbol:

   ```asm
           .bss
           .global data_ov<NNN>_<addr>
   data_ov<NNN>_<addr>:
           .space 0x<size>
   ```

   Symbols in address order.

4. **Add TU claim** to `config/eur/arm9/overlays/
   ov<NNN>/delinks.txt`.

5. **Build + verify.**
   - `python tools/configure.py eur && ninja rom`
   - `dsd check modules -c config/eur/arm9/config.yaml`
   - Watch which module's checksum flips:
     - **If overlay flips to OK** = data-tier coverage
       was the sole remaining gap. **Multi-module-
       baseline improvement (25/27 → 26/27).**
     - **If overlay still FAILED** = there are `.text`
       or `.data` cross-module relocations remaining
       (similar shape to ARM9 main's residue). Wave 2
       still ships value (cluster A coverage in the
       overlay) but doesn't flip baseline.

6. **Document outcome.** Per-overlay PR funnel + sym
   count + checksum-flip status.

**Self-extend clause:**

If wave 2 covers the overlay's full .bss pool in one
wave (likely per brief 116's recipe scaling), the
chain naturally continues with **wave 3 = next
overlay**. Self-extend in this brief: optionally
add a second overlay if time permits. Cap at 2
overlays per brief.

**Non-scope:**

- ❌ ARM9 main checksum recovery (separate brief
  pending cross-module reloc work).
- ❌ Cross-region `.bss` apply to USA + JPN (separate
  brief; the EUR-side coverage is the immediate value).
- ❌ Cluster B / C / D waves (separate briefs 120+).
- ❌ Function-tier carryovers.
- ❌ AGENTS.md / state.md edits beyond the wave PR.

**Success:**

- ≥ 200 cluster A `.bss` symbols claimed in the
  selected overlay.
- All 3 regions stay at 25/27 baseline (brief 116's
  achievement).
- **Stretch: overlay flips to OK = 26/27 baseline.**
- Per-wave PR with funnel + per-overlay breakdown.

**Branch:** `decomper/cluster-a-wave-2-overlay`

**After this brief lands:**

1. **If overlay flips:** brain queues brief 123+ as
   continuation across remaining overlays (one per
   wave). Realistic path to 28/27+ baseline.
2. **If overlay stays FAILED:** the .bss claim still
   ships value (cluster A reduction); brain pivots to
   either (a) ARM9 main checksum recovery scope brief
   or (b) cluster B wave 1 (small but quick) to
   maintain data-tier momentum.
3. **Cluster A pool drain:** ~939 candidates split
   across 6 overlays; per-overlay coverage of ~150
   symbols means ~6 waves to drain cluster A
   completely. With brief 116's 647-sym single wave,
   the upper bound is more like 3-4 waves.
