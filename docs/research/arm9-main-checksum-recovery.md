# ARM9 main checksum recovery — scoping + brief 130+ plan

**Brief:** 127 (cloud scoping). ARM9 main has been FAILED across all
3 regions since session start (24/27 → 25/27 only via DTCM in
briefs 115/116). 647 cluster A `.bss` symbols + 37 cluster C
Pattern 1 + 20 cluster D-1 tables claimed in main, but the module
checksum remains FAILED. **Brief 127 does NOT recover ARM9 main** —
it scopes what recovery entails and outputs a future brief plan.

## TL;DR

**The gap is 21 bytes across 6 symbols.** That's it. Brief 113
hypothesized a substantial cross-module reloc residue + uncarved
data; the actual gap is much smaller and concentrated. Two distinct
recovery paths:

- **Phase 1 (immediate, ~30 min decomper)**: fix 3 source files
  that reference the wrong target symbol. 5 of 21 bytes (24% of
  the gap). Won't flip main alone but proves the recipe.
- **Phase 2 (depends on ov004 recovery)**: 16 of 21 bytes (76%)
  are POINTERS INTO OV004 that resolve to wrong addresses because
  ov004's internal layout is shifted. ARM9 main checksum CANNOT
  flip until ov004 matches. Brief 118 already predicted this
  cascade.

**Bottom line**: main + ov004 are coupled. Recovering ov004 is
the higher-leverage move; main's 16 bytes auto-fix when ov004
matches.

## Bisection — what differs

`cmp -l build/eur/build/arm9.bin extract/eur/arm9/arm9.bin` returns
**21 differing bytes** spread across 6 distinct symbols.

```
Per-section summary:
  .text:   5 bytes differ (3 functions)
  .rodata: 4 bytes differ (2 large symbols)
  .data:  12 bytes differ (1 large struct array)
  .ctor:   0
  .bss:    0 (zero-fill at runtime, not in file)
```

ARM9 main file size matches orig exactly (1,059,936 bytes both
sides). No section-length mismatch → no W6-style cascade. This
is purely a content gap.

### Per-symbol mapping

| Symbol | Section | Diff bytes | Size | Container |
|---|---|---|---|---|
| `func_02048f98` | .text | 1 (+0x10) | 0x14 (5 insns) | matched TU `src/main/func_02048f98.c` |
| `func_02052bc4` | .text | 2 (+0xc..+0xd) | 0x10 (4 insns) | matched TU `src/main/func_02052bc4.c` |
| `func_0206255c` | .text | 2 (+0xc..+0xd) | 0x10 (4 insns) | matched TU `src/main/func_0206255c.c` |
| `data_020bf280` | .rodata | 2 (+0xba1, +0xba5) | 0xd00 (3328) | uncarved; large rodata table |
| `data_020c1f80` | .rodata | 2 (+0x15d, +0x161) | 0x1000 (4096) | uncarved; large rodata table |
| `data_020c9694` | .data | 12 (stride 0x18) | 0x39ac (14764) | uncarved; cluster D-3 nested struct (per brief 121) |

## Category 1 — Wrong source-target in matched TUs (5 bytes, 3 symbols)

The 3 .text functions have matched TUs whose source code references
the **wrong target symbol**. The bytes that differ are pool
literals (`.word target`) carrying the address. The TUs are marked
`complete` but produce bytes that don't byte-match orig.

### Worked diagnosis

**func_02052bc4** — thunk that does `bl ip; .word target`.

```text
Orig last 4 bytes:  34 2b 05 02   = 0x02052b34  → func_02052b34
Built last 4 bytes: 00 30 05 02   = 0x02053000  → func_02053000
```

Source `src/main/func_02052bc4.c`:

```c
extern int func_02053000(int a, int b, int c, int d);

int func_02052bc4(int a, int _unused, int c, int d) {
    return func_02053000(a, 1, c, d);    /* WRONG TARGET */
}
```

**Fix**: change `func_02053000` → `func_02052b34` (function exists at
that address with size 0x90).

**func_0206255c** — same shape:

```text
Orig: 0c 20 06 02 = 0x0206200c  → func_0206200c
Built: 20 23 06 02 = 0x02062320  → func_02062320
```

Source calls `func_02062320`; should call `func_0206200c`.

**func_02048f98** — `*data = 0;` shape:

```text
Orig: 80 dc 19 02 = 0x0219dc80  → data_0219dc80
Built: 88 dc 19 02 = 0x0219dc88  → data_0219dc88
```

Source references `data_0219dc88`; should reference `data_0219dc80`.

### Recipe for Category 1

For each of the 3 source files:
1. Identify the wrong target via bisection (already done in brief 127).
2. Update the `extern <target>` declaration + the call/reference to
   use the correct symbol name.
3. Rebuild + verify the diff disappears.

All 3 are simple one-line s/wrong/correct/ edits in `.c`. Decomper
effort: **~30 min total**.

### Why did the wrong targets land?

These are matched TUs from prior decomper waves. The decomper used
the right STRUCTURAL shape (thunk-with-pool-word, or store-to-global)
but inferred the wrong specific target. dsd's "objdiff bytes" check
likely flagged the byte diff, but the TU was marked complete anyway
— possibly the diff was inside the pool-word region which the
decomper assumed would auto-resolve.

**Future-proofing**: brief 094-style byte-diff matched-TU detection
could pre-flight this. Worth a small tooling brief candidate after
brief 130 phase 1 to scan all matched TUs for byte-diffs vs orig.

## Category 2 — `.rodata` pointers into OV004 (4 bytes, 2 symbols)

The 2 .rodata symbols `data_020bf280` and `data_020c1f80` are LARGE
(3-4 KB tables). 4 bytes differ across them, in 2 stride-4 pairs.

Each pair is a `(u8, u24)` tuple where the u24 high-3-bytes is a
pointer into the **0x021xxxxx-0x022xxxxx** overlay range. Built
values are 0x400 higher than orig.

```text
data_020bf280 +0xba0:
  built:  db 13 27 02 / dc 13 21 02  (LE u32 = 0x022713db, 0x022113dc)
  orig:   db 0f 27 02 / dc 0f 21 02  (LE u32 = 0x02270fdb, 0x02210fdc)
  delta:  +0x400 bytes

data_020c1f80 +0x15c:
  built:  24 f4 21 02 / 25 f4 27 02  (LE u32 = 0x0221f424, 0x0227f425)
  orig:   24 f0 21 02 / 25 f0 27 02  (LE u32 = 0x0221f024, 0x0227f025)
  delta:  +0x400 bytes
```

The consistent +0x400 delta is the **signature of an overlay layout
shift** — specifically OV004 (which we know fails). OV004's data
section has 0x400 more bytes than orig (or equivalent shift); every
pointer INTO OV004 in main's `.rodata` carries the wrong address.

**Recipe**: these are NOT independent matchable bytes. The fix
comes from recovering OV004's correct layout. Once OV004's bytes
match orig, mwldarm resolves the relocs to the correct addresses,
and these `.rodata` pool words update automatically.

## Category 3 — `.data` struct array into OV004 (12 bytes, 1 symbol)

`data_020c9694` is the BIG cluster D-3 candidate (brief 121 noted
it at 0x39ac = 14.8 KB). It contains a 24-byte-stride struct array
where each entry's pointer field (offset +4 within each 24-byte
entry) points into ov004.

Sample of 12 affected entries:

```text
Entry 1 (+0x32d0): built 25 19 1e 02 / orig 1c 19 1e 02
                   built ptr 0x021e1925 / orig 0x021e191c (delta +9)
Entry 2 (+0x32e8): built 25 19 1f 02 / orig 1d 19 1f 02
                   built 0x021f1925 / orig 0x021f191d (delta +8)
Entry 3 (+0x3300): built 4b 19 20 02 / orig 43 19 20 02
                   built 0x0220194b / orig 0x02201943 (delta +8)
Entries 4-12:      built 1d 19 XX 02 / orig 19 19 XX 02
                   delta +4 (consistent across 9 entries)
```

The pointers are to slightly different positions within OV004 (the
delta varies 4-9 bytes per entry rather than a uniform 0x400 shift).
This suggests each pointer references a SPECIFIC offset within an
OV004 data structure, and OV004's internal layout has multiple
sub-shifts.

**Same recipe as Category 2**: fix OV004 → main's pool word resolves
correctly.

## Quantification — total recovery effort

| Phase | Bytes | Symbols | Effort | Output |
|---|---|---|---|---|
| Phase 1 | 5 | 3 (.text fns) | ~30 min decomper | 5 bytes fixed; main still red on 16 |
| Phase 2 | 16 | 3 (in main: 2 .rodata + 1 .data) | OV004 recovery scope | Main auto-fixes when ov004 lands |
| **Total** | **21** | **6** | Phase 2 effort = ov004 brief | Main → OK |

ARM9 main recovery is **coupled with OV004 recovery**. Phase 1 alone
won't flip main; OV004 recovery alone WOULD flip main (Phase 1 is
nice-to-have).

## Brief 130+ application plan

### Brief 130 — Phase 1: matched-TU byte-diff fixes (decomper)

Effort: ~30 min decomper time.

Tasks:
1. Edit `src/main/func_02048f98.c`: change `data_0219dc88` →
   `data_0219dc80` (extern + reference).
2. Edit `src/main/func_02052bc4.c`: change `func_02053000` →
   `func_02052b34` (extern + call).
3. Edit `src/main/func_0206255c.c`: change `func_02062320` →
   `func_0206200c` (extern + call).
4. `ninja rom` + `dsd check modules` — confirm 5 fewer differing
   bytes, still 25/27 (main + ov004 still fail).

**Expected outcome**: 5/21 bytes resolved; main stays FAILED;
phase 1 proves the recipe works on the 3 immediate fixes.

### Brief 131 — OV004 checksum recovery SCOPING (cloud)

Mirror brief 127 for OV004: bisect built vs orig, categorize the
diff, identify root cause. Hypothesis (per brief 118 + brief 127
section data analysis): OV004's data section is shifted internally
by 0x400 bytes due to a W6-like rounding cascade OR uncarved
.data/.rodata residue.

Likely sub-phases parallel to brief 127's: matched-TU byte-diffs +
uncarved data needing layout-correct carving.

### Brief 132+ — OV004 recovery application (decomper)

Per brief 131's plan. Once OV004 matches orig, main's 16 pointer
bytes auto-fix → main flips to OK → 26/27 baseline achieved
across all 3 regions.

### Optional brief 133 (tooling) — matched-TU byte-diff scanner

Brief 094 surfaced 3 matched TUs with byte diffs. Brief 127 found
3 more. There may be more in the project. A scanner tool that
compares every `complete` TU's `.o` against the corresponding
range in `extract/.../arm9.bin` would surface them all.

Pseudo-code:

```python
for tu in delinks.complete_tus():
    built_o = read_section(tu.o_path)
    expected = read_extract(tu.start, tu.end)
    if built_o != expected:
        report_diff(tu, byte_offsets_that_differ)
```

Likely 5-10 candidates surface. Each is a ~5-min fix per brief 130
phase 1's recipe. Cluster the fixes into a single brief.

## Risk assessment

### Low-risk (immediate ROI)

- **Brief 130 phase 1 byte-diff fixes**: 3 source files, 30 min.
  Zero risk of breaking anything; the byte changes are local.

### Medium-risk

- **Brief 133 matched-TU scanner**: low risk of false-positives;
  scanner output is human-reviewable.

### Higher-risk (dependent on OV004 understanding)

- **Brief 131 OV004 scoping**: similar shape to brief 127 — bisect +
  categorize. Risk is that OV004 might have substantial uncarved
  data needing significant work (vs main's 1 large uncarved data
  symbol).
- **Brief 132+ OV004 recovery**: depends on what brief 131 finds.
  Could be 1 brief (if also small) or many (if OV004 has
  substantial uncarved data).

### No new toolchain investment needed

The recovery does NOT require:
- dsd init re-run with better overlay analysis (cross-overlay calls
  via `--allow-unknown-function-calls` are NOT the residue source).
- Custom LCF templates (the existing LCF generates correct layouts;
  the issue is in symbol references + a single overlay's internal
  layout).
- New compiler routing tiers.

The recovery uses **existing recipes only** (brief 094-style byte-diff
fixes + cluster A/B/C/D techniques for OV004).

## Cross-references

- [`docs/research/data-tier-scoping.md`](data-tier-scoping.md) —
  brief 113's 5-cluster taxonomy that scoped the data-tier work.
- [`docs/research/cluster-c-recipe.md`](cluster-c-recipe.md) —
  brief 119's W6 wall (relevant for OV004 if it's a W6 cascade).
- [`docs/research/cluster-d-recipe.md`](cluster-d-recipe.md) —
  brief 121's D-3 sub-cluster (data_020c9694 is in this bucket).
- [`tools/cluster_c_pattern3_gen.py`](../../tools/cluster_c_pattern3_gen.py)
  — brief 125 generator, usable for OV004 .rodata carving if needed.
- CLAUDE.md "Bootstrapping config/<ver>/" section — explains
  `--allow-unknown-function-calls` (NOT the residue source per
  brief 127's analysis).

## Methodology data point

Brief 127 is the **2nd "checksum recovery scoping" brief** after
brief 113 (data-tier scoping). Pattern emerging: **scoping briefs
bisect the gap mechanically + bucket findings + size each bucket
for the next-wave brief plan**. Brief 113 scoped 5 clusters and 5
walls; brief 127 scopes 3 categories and 1 cascade dependency.

The total gap (21 bytes) is dramatically smaller than brief 113's
hypothesis suggested. **Bisection-first is the right strategy** for
checksum scoping: don't speculate about what residue might be, just
diff the built vs orig and follow the bytes.

## TL;DR for brain

- ARM9 main gap is **21 bytes / 6 symbols** (not "thousands").
- **5 bytes** are fixable immediately via 3-source-file edits.
- **16 bytes** cascade from OV004 — won't fix until OV004 matches.
- ARM9 main + OV004 are coupled per brief 118's prediction.
- **Brief 130** = phase 1 (3 source edits, ~30 min).
- **Brief 131** = OV004 scoping (similar to brief 127).
- **Brief 132+** = OV004 recovery (depends on brief 131 findings).
- **Brief 133 (optional)** = matched-TU byte-diff scanner tool.
- **No new toolchain needed** — existing recipes suffice.
- **End state**: 3-region 26/27 once OV004 lands. Likely 27/27 if
  the OV004 fix also helps other overlays (unlikely but possible).
