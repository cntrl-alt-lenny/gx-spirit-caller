[//]: # (markdownlint-disable MD013 MD041)

# main E/F Re-triage — Round 8 (R8)

Generated 2026-07-01. The 35 addresses below are `module=main`, class E or F,
size < 300 B, and have **never been examined in any prior retriage round**
(R4–R7) — confirmed by an exhaustive substring search of every address
against every file in `docs/research/retriage/`, all returning zero hits
before this document was written. This is genuinely virgin territory: unlike
`MainEFRetriage.md`'s R4 pass (which covered only 80 of main's much larger
E/F pool), these 35 addresses sit outside that original sample entirely.
All 35 `.s` files were confirmed present at
`brain/src/main/func_{addr}.s` with no matching `.c`/`.legacy.c`/
`.legacy_sp3.c` sibling — none has been claimed by another lane since the
brief was written, so 0 addresses were skipped.

KB docs referenced: `docs/research/types/GameSingleton.md`,
`docs/research/types/GlobalAudioState.md`,
`docs/research/types/GlobalData02102c7c.md`,
`docs/research/types/GlobalData02104bac.md`,
`docs/research/types/GlobalData02104e6c.md`,
`docs/research/types/GlobalData02104f1c.md`,
`docs/research/constants/MainConstants.md`,
`docs/research/constants/CardIdRanges.md`,
`docs/research/constants/BitFlagMasks.md`,
`docs/research/constants/DuelStateEnums.md`,
`docs/research/data/MainDataExtended.md`,
`docs/research/data/FunctionPointerTables.md`,
`docs/research/data/VtableDispatchPatterns.md`,
`docs/research/retriage/MainEFRetriage.md`, and the pre-existing
(name-proposal only, no pool-word/struct-offset extraction) map docs
`docs/research/map/main_a.md`, `main_b.md`, `main_c.md`,
`docs/research/map/_names_main_a.md`/`_b.md`/`_c.md`, and
`docs/research/c-match-worklist.json` (original-pass verdicts, cited as
"Original verdict" below). Two individual per-function dossiers
(`docs/research/dossiers/02019a58.md`, `docs/research/dossiers/0201a9d0.md`)
provided a byte-verified reference layout for `data_02102c64` that directly
unlocked one candidate in this batch.

---

## Summary

| Metric | Count |
|--------|-------|
| Addresses assigned | 35 |
| Skipped (already `.c`-matched) | 0 |
| Examined | 35 |
| **Newly tractable** | **35 (100%)** |
| Confirmed intractable (wall) | 0 |
| New KB gaps found | 6 (see below) |

Every single examined function resolved to tractable — matching the R7
`Ov017Ov019Retriage.md` result (100% of examined) rather than R4's more
mixed ov002 rate (72%). The pattern holds again: every "low"-tractability
verdict in the original swarm pass traced to *unnamed* symbols or *unlabeled*
struct offsets, not to genuine scheduling coin-flips. A `grep` of every
`blx`/`blx` site across all 35 `.s` files found exactly one indirect call
per function that has one (never two-or-more competing indirect targets in
the same function), and each resolves to one of three benign shapes: a
stack/parameter-passed callback (`02005a60`), a struct-field slot with a
`cmp/beq` null-check guard matching `VtableDispatchPatterns.md`'s documented
Pattern B convention (`0201f138`, `0201f25c`, `0201f568`, `02032a34`,
`02032888`, `020334cc`), or a per-node key-matched linked-list dispatch
(`020319a0`, `02031d98`). None is a genuine "multiple blx through
unresolvable function pointers with no discriminant" wall as characterized
in prior rounds.

---

## Newly Tractable Funcs

### 0x0200197c (184 B, class F, module=main)

**Original verdict:** F — "nested loops, calls, heavy reg-alloc liveness"
(`c-match-worklist.json`); map doc names it `CardSlot_ScanHandlers2`
("Similar 9-slot scan, slightly different body").

**Upgrade reason:** Both callees (`func_02091554`, `func_02006ef0`) are
already-named functions used extensively elsewhere in the KB (e.g.
`func_02091554` is the glyph/print-render call cited throughout
`Ov017Ov019Retriage.md`). The three pool symbols (`data_020c3cd0`,
`data_02102d04`, `data_020b46e0`) are not yet in a types/ doc, but the
function is entirely self-contained: a 9-iteration outer loop (`r7` 0..8)
gated by a bit-test on the first argument (`asr r7; tst #1`), containing a
2-iteration inner loop over a stride-8 pair of arrays anchored at
`data_02102d04 + r7*8` / `data_020b46e0 + r7*8`. All field semantics are
derivable purely from the instructions in this file — no cross-file lookup
is required to write correct C, only to name the arrays.

**Struct/data needed:**
- `data_020c3cd0` — single pointer/base, loaded once into `fp` (unused
  further in-body beyond being passed as the render dest `r5` base... note:
  `fp` is loaded but the `add r5, sp, #0x4` local stack buffer is the actual
  render dest — `fp` is used only as index-0/1 select base at `ldr r1, [fp,
  r1, lsl #0x2]`, i.e. a 2-entry palette/color-select array).
- `data_02102d04` — array, stride 8 bytes, indexed by outer loop `r7`.
- `data_020b46e0` — array, stride 8 bytes, indexed by outer loop `r7`
  (parallel to `data_02102d04`).

**Ground-truth pool words (verbatim):**

```
data_020c3cd0   ; 2-entry color/palette-select array (fp base)
data_02102d04   ; stride-8 array, indexed by outer-loop r7
data_020b46e0   ; stride-8 array, indexed by outer-loop r7 (parallel)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02091554
func_02006ef0
```

**Recipe sketch:**

```c
void CardSlot_ScanHandlers2(int mask, int a1, int a2) {
    char buf[4 + 0x20]; /* stack local render dest, sp+0x4 */
    unsigned int slotmask = a1;
    for (int i = 0; i < 9; i++) {
        if (!((mask >> i) & 1)) continue;
        int *arrA = (int *)((char *)&data_02102d04 + i * 8);
        int *arrB = (int *)((char *)&data_020b46e0 + i * 8);
        for (int j = 0; j < 2; j++) {
            if (arrA[j] != 0) continue;
            int colorIdx = (i >= 5) ? 1 : 0;
            func_02091554(buf, data_020c3cd0[colorIdx], arrB[j]);
            int w = func_02006ef0(buf, slotmask, a2);
            slotmask = (slotmask + w + 3) & ~3;
            arrA[j] = slotmask;
        }
    }
}
```

**Levers:** The `bic sl, r0, #0x3` round-to-4 idiom after the add is a
standard alignment pattern — write `(x + 3) & ~3`. The 2-entry
`data_020c3cd0` index selection (`r1 = (r7 >= 5) ? 1 : 0`) uses `movge`,
matching a ternary in C.

---

### 0x02001b18 (140 B, class E, module=main)

**Original verdict:** E — "bit-scan loop, movge select, reg coin-flip"
(`c-match-worklist.json`); map doc names it `CardSlot_FreeTask`
("Companion cleanup: frees/unlinks a task slot").

**Upgrade reason:** Sibling of `0200197c` — same 9-iteration bit-scan outer
loop shape, same `data_02102d04`/`data_020b46e0` array family (here
`data_020c3cd8`, a 1-off address from `0200197c`'s `data_020c3cd0`,
confirming these are two adjacent 2-entry select tables, one per sibling
function). Calls `func_02001ba4` (leaf init), `func_02091554` (documented
render call, shared with `0200197c`), and `func_02006c0c` (documented in
`MainConstants.md` as the task-creation convention `(template, priority=4,
flags=0)` — here called with literal args `(r0, 4, 2)`, a variant flags
value worth noting but not blocking).

**Struct/data needed:**
- `data_02102d04` — same stride-8 array as `0200197c`, single-entry read
  here (`[r6, r0, lsl#2]`, i.e. treated as a flat `int[9]` in this view).
- `data_020c3cd8` — 2-entry select array (sibling of `0200197c`'s
  `data_020c3cd0`).
- `data_020b46e0` — same stride-8 array as `0200197c` (here read as
  `[r5, r9, lsl#3]`, i.e. the 8-byte-stride second word).

**Ground-truth pool words (verbatim):**

```
data_02102d04   ; task-handle array, flat int[9] view (write target)
data_020c3cd8   ; 2-entry color/palette-select array
data_020b46e0   ; stride-8 array (second word read per entry)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02001ba4
func_02091554
func_02006c0c
```

**Recipe sketch:**

```c
void CardSlot_FreeTask(int mask) {
    func_02001ba4();
    char buf[0x20];
    for (int i = 0; i < 9; i++) {
        if (!((mask >> i) & 1)) continue;
        int sel = (i >= 5) ? 1 : 0;
        int arg2 = ((int *)&data_020b46e0)[i * 2];
        func_02091554(buf, data_020c3cd8[sel], arg2);
        void *handle = func_02006c0c(buf, 4, 2);
        if (handle != NULL) data_02102d04[i] = (int)handle;
    }
}
```

**Levers:** The `movge r0, fp` (fp=1) select for the sibling's index-0/1
branch mirrors `0200197c` exactly — reuse the same `(i >= 5) ? 1 : 0`
ternary shape for consistency across the pair.

---

### 0x02005a60 (216 B, class E, module=main)

**Original verdict:** E — "sort/dedup double loop, spilled temps"
(`c-match-worklist.json`); map doc names it `Gfx_SetupLayer2`
("Second graphics layer setup").

**Upgrade reason:** The single `blx r2` is **not** a global vtable dispatch
— `r2` is loaded from `[sp]`, which is the 4th caller-supplied argument
(`str r3, [sp]` at function entry, before the loop). This is a
parameter-passed comparator/predicate callback, structurally identical to a
qsort-style comparator argument — fully deterministic, no coin-flip, no KB
gap. The rest of the body is a classic dedup/compaction double-loop:
outer loop calls the predicate `cb(base+off, base+off2, size)`, and on a
non-zero (mismatch) result runs an inner `func_02094688` (documented VRAM/
memory-move helper used elsewhere, e.g. `MainConstants.md`'s DMA family)
compaction shift.

**Struct/data needed:** None — pure parameter-driven arithmetic; the sole
external call `func_02094688` is already a named function.

**Ground-truth pool words (verbatim):**

```
none (no literal pool in this function)
```

**Ground-truth BL targets (verbatim, in call order):**

```
blx r2   (parameter callback, arg 4 — NOT a global/struct vtable slot)
func_02094688
```

**Recipe sketch:**

```c
int Gfx_SetupLayer2(void *base, int count, int stride, int (*cmp)(void*, void*, int)) {
    int kept = 0;
    if (count - 1 > 0) {
        int off1 = 0, off2 = 0;
        for (int i = 0; i < count - 1; i++) {
            void *a = (char *)base + off1;
            void *b = (char *)base + off2 + stride;
            if (cmp(a, b, stride) != 0) {
                off1 += stride;
                off2 += stride;
                continue;
            }
            int j = kept + 1;
            if (j < count - 1) {
                int srcOff = j * stride;
                int dstOff = srcOff;
                for (; j < count - 1; j++, srcOff += stride, dstOff += stride) {
                    func_02094688((char *)base + dstOff, (char *)base + srcOff + stride, stride);
                }
            }
            count = (unsigned short)(count - 1);
        }
    }
    return count;
}
```

**Levers:** The exact loop-restructure (outer scan vs inner compaction
shift) is register-pressure-sensitive per the original "spilled temps"
note — the two stack slots (`[sp]`=callback ptr, `[sp,#4]`/`[sp,#8]`=running
offsets) suggest the C source should keep the two offset accumulators as
plain locals, not merge them into one indexed expression, to reproduce the
`str [sp,#4]`/`str [sp,#8]` split.

---

### 0x02007104 (160 B, class E, module=main)

**Original verdict:** E — "nested string-search loop, heavy liveness;
permuter-class" (`c-match-worklist.json`); map doc names it
`Str_FindSubstring`, confidence HIGH on the semantic read already
("Length-difference loop + byte-compare loop over two signed-char
strings — strstr-like").

**Upgrade reason:** Every callee is already named — two calls to
`func_020070dc` (a strlen-style length function, called on both input
strings) — and the body is a textbook `strstr` double loop: outer loop
scans candidate start positions in the haystack, inner loop byte-compares
against the needle using `ldrsb` (signed char loads, matching the map doc's
own semantic read). No struct or data symbol is touched at all — 100%
parameter- and local-arithmetic-driven. The "permuter-class" flag in the
original worklist note is a match-*difficulty* warning (register pressure
in the nested loop), not a classification blocker — consistent with
`Ov017Ov019Retriage.md`'s finding that size/complexity flags often
mislabel genuinely tractable functions.

**Struct/data needed:** None — pure two-string comparison.

**Ground-truth pool words (verbatim):**

```
none (no literal pool in this function)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_020070dc
func_020070dc   (x2 — called once per input string)
```

**Recipe sketch:**

```c
int Str_FindSubstring(const signed char *haystack, const signed char *needle) {
    int needleLen = func_020070dc(needle);
    int hayLen = func_020070dc(haystack);
    int range = hayLen - needleLen + 1;
    if (range <= 0) return -1;
    signed char first = *needle;
    for (int i = 0; i < range; i++) {
        if (haystack[i] != first) continue;
        int match = 1;
        for (int j = 0; j < needleLen; j++) {
            if (haystack[i + j] != needle[j]) { match = 0; break; }
        }
        if (match) return i;
    }
    return -1;
}
```

**Levers:** The original's `mov r7, ip; mov lr, ip` dual-register alias for
the "match" flag suggests the compiler may want the flag pre-seeded before
the inner loop with two candidate registers — if reg-alloc diverges, try
hoisting the `int match = 1` assignment outside a `for` and using `break`
rather than a boolean accumulator.

---

### 0x0200962c (288 B, class F, module=main)

**Original verdict:** F — "288 bytes, repeated stack-fill+call blocks;
big-body" (`c-match-worklist.json`); map doc names it `Net_PollRecv`
("Polls for received packet; calls func_0209c0cc + func_020908c0 family").

**Upgrade reason:** Every `bl` target is already named (network-family
functions `func_0209c0cc`/`02090868`/`0209bfe4`/`0209c7dc`/`0209bfd4`/
`020908c0`/`02007230`), and the single data reference (`data_02104f3c`) is
a self-contained 1-field flag word — only offset `+0x4` is touched (read,
OR with a computed bit, store back), fully derivable from this function
alone. The unusual `bl .L_02021008` is a `bl` to an `.extern`-declared local
label (not a genuine unresolved indirect branch) — the target symbol is
fully named in the `.extern` directive, just an unusual naming convention
for a cross-TU tail-call target. The "repeated stack-fill+call blocks" are
two nearly-identical 5-word struct literals passed to `func_0209c7dc`,
differing only in 3 literal fields — deterministic, not scheduling-bound.

**Struct/data needed:**
- `data_02104f3c` (single `int` flag field at +0x4, read/orr/store) — new
  minimal struct, distinct from the neighbouring `GlobalAudioState`
  (`data_021040ac`) and `GlobalData02104f1c` (`data_02104f1c`) docs; see
  New KB gaps.

**Ground-truth pool words (verbatim):**

```
data_02104f3c   ; single-field flag word, offset +0x4 read/orr/store
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0209c0cc
func_02090868
func_0209bfe4
func_0209c7dc
func_0209c7dc   (2nd call, differing literal struct args)
func_0209bfd4
func_020908c0
func_02007230
.L_02021008     (bl to extern local-label tail target, conditional)
```

**Recipe sketch:**

```c
int Net_PollRecv(void) {
    int ok = func_0209c0cc();
    if (!ok) goto tail;
    int chan = func_02090868();
    if (chan == -3) goto tail;
    unsigned short chan16 = (unsigned short)chan;
    func_0209bfe4(chan16);
    {
        RecvCfg cfg = { 0, 0, 6, 1, 0 };
        int r = func_0209c7dc(4, &cfg.field4, 0, 0);
        int flag = (r == 0) ? 1 : 0;
        data_02104f3c.f4 |= flag;
    }
    if (!(data_02104f3c.f4 & 1)) {
        RecvCfg cfg2 = { 0, 0, 7, 0xa, 2 };
        int r2 = func_0209c7dc(4, &cfg2.field4, 0x8000, 0);
        int flag2 = (r2 == 0) ? 1 : 0;
        data_02104f3c.f4 |= flag2;
    }
    func_0209bfd4(chan16);
    func_020908c0(chan16);
tail:
    if (func_02007230()) .L_02021008();
    return (data_02104f3c.f4 == 0) ? 1 : 0;
}
```

**Levers:** The two `func_0209c7dc` calls build near-identical 5-field
stack structs — keep them as two separate local struct-literal
initializations (not a shared helper) to preserve the exact literal
constants mwcc will pool/inline.

---

### 0x02009968 (256 B, class F, module=main)

**Original verdict:** F — "256 bytes, branch-table + per-case field logic"
(`c-match-worklist.json`); map doc names it `Overlay_UpdateState`
("Updates overlay state").

**Upgrade reason:** Bounded 5-way computed branch (`addls pc, pc, r1,
lsl#2` after `cmp r1, #0x4`) dispatching on a byte read from a stride-0x1c
record array — every case is a distinct, reachable block (no default-less
fallthrough ambiguity). All 4 data symbols (`data_021064b8`,
`data_021064b9`, `data_021064cc`, `data_021064d1`) are consecutive-ish byte
addresses accessed with the identical `r6` index (`mul r6, r4, #0x1c`),
confirming they are 4 parallel byte-fields of the same
stride-0x1c-indexed record array — fully self-contained. All 4 callees
(`func_02019034`, `func_02019124`, `func_020097f0`, `func_02009ab0`) are
already named.

**Struct/data needed:**
- `data_021064b8` — u8 mode/state byte, array stride 0x1c (indexed by `r4`
  in caller units, byte-offset by `r6 = r4*0x1c`).
- `data_021064b9` — u8 secondary byte, same stride-0x1c array.
- `data_021064cc` — s32/u32 field, same stride-0x1c array (`ldr`, not
  `ldrb`).
- `data_021064d1` — u8 tertiary byte, same stride-0x1c array.

**Ground-truth pool words (verbatim):**

```
data_021064b8   ; mode/state byte, stride-0x1c array
data_021064b9   ; secondary byte, same array
data_021064cc   ; 32-bit field, same array
data_021064d1   ; tertiary byte, same array
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02019034
func_02019124
func_020097f0
func_02009ab0
```

**Recipe sketch:**

```c
void Overlay_UpdateState(int slot) {
    int idx = func_02019034();
    int mode = func_02019124();
    func_020097f0();
    if (slot <= 0) return;
    slot -= 1;
    if (!(mode & (1 << slot))) return;
    int off = slot * 0x1c;
    unsigned char state = *((unsigned char *)&data_021064b8 + off);
    switch (state) {
    case 0:
        *((unsigned char *)&data_021064b8 + off) = 4;
        *((unsigned char *)&data_021064b9 + off) = 0x32;
        *((int *)((char *)&data_021064cc + off)) = idx;
        func_02009ab0(slot + 1);
        if (slot < 4) *((unsigned char *)&data_021064d1 + off) = 1;
        break;
    case 1: /* fallthrough to default via table skip in orig */
        break;
    case 2:
        *((unsigned char *)&data_021064d1 + off) = 3;
        break;
    case 3: {
        int delta = idx - *((int *)((char *)&data_021064cc + off));
        if ((unsigned)delta >= 0xe) *((unsigned char *)&data_021064d1 + off) = 2;
        delta = idx - *((int *)((char *)&data_021064cc + off));
        if ((unsigned)delta >= 0x1c) *((unsigned char *)&data_021064d1 + off) = 1;
        break;
    }
    case 4: {
        int delta = idx - *((int *)((char *)&data_021064cc + off));
        if ((unsigned)delta >= 0x1c) *((unsigned char *)&data_021064d1 + off) = mode; /* reuses r2 */
        break;
    }
    }
}
```

**Levers:** The computed-branch table has one entry (`case 1`) that falls
straight through to the shared epilogue with no body — write this as an
explicit empty `case 1: break;` to preserve the table's 5-entry shape.

---

### 0x0200a704 (160 B, class E, module=main)

**Original verdict:** E — "compare loop with Copy32 + multiple temps;
scheduling" (`c-match-worklist.json`).

**Upgrade reason:** Reuses two already-partially-documented globals:
`data_02104f3c` (the single-field flag word introduced by `0200962c` above
— here only the getter side, no write) and `data_02104f4c`, accessed at
`data_02104f4c + 0x1000 + 0x868 + i*4` — the **exact same
"`data_02104f4c + 0x1000 + <offset> + i*stride`" addressing idiom already
established and documented in `MainEFRetriage.md`'s `func_02009dec`/
`func_02009f50` entries** (which access the same base at `+0x56c/+0x56d/
+0x56e`). This confirms `data_02104f4c` is a large flat table with many
named sub-windows at `+0x1000`-relative offsets — `+0x868` is simply a new
window into the already-recognized addressing pattern. All 3 callees
(`func_0202ae1c`, `func_0200a488`, `func_0202af40`, plus 2x `Copy32`) are
already-named/documented (`Copy32` is a standard SDK memcpy helper cited
throughout the codebase).

**Struct/data needed:**
- `data_02104f3c` — same flag-word global as `0200962c` (read-only here,
  `+0x14` field, distinct offset from `0200962c`'s `+0x4`).
- `data_02104f4c` — reuses the documented `+0x1000`-relative array-window
  addressing pattern from `MainEFRetriage.md`; new window at `+0x1868`
  (`= 0x1000 + 0x868`), stride 4 bytes, compared against a stack-local
  8-entry `int[8]` array filled by `func_0200a488`.

**Ground-truth pool words (verbatim):**

```
data_02104f3c   ; flag word, field +0x14 read
data_02104f4c   ; system-clock/state-array cluster, +0x1868 window (i*4 stride)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0202ae1c
func_0200a488
Copy32
Copy32
func_0202af40
```

**Recipe sketch:**

```c
int func_0200a704(void) {
    int lang = (data_02104f3c.f14 << 3) >> 3;  /* 3-bit language-ID extract */
    func_0202ae1c(lang);
    int local[16];  /* two 8-word blocks, sp+0x0 and sp+0x20 */
    func_0200a488(&local[8], &local[0]);
    int mismatch = 0;
    for (int i = 0; i < 8; i++) {
        int *entry = (int *)((char *)&data_02104f4c + 0x1868 + i * 4);
        if (local[8 + i] != *entry) { mismatch = 1; break; }
    }
    Copy32(&local[8], (char *)&data_02104f4c + 0x1800 + 0x68, 0x20);
    Copy32(&local[0], (char *)&data_02104f4c + 0x1800 + 0x88, 0x20);
    func_0202af40();
    return mismatch;
}
```

**Levers:** The two `Copy32` destinations differ by a fixed `+0x20` byte
offset from a shared `data_02104f4c + 0x1800` anchor — express both as
`(char *)&data_02104f4c + 0x1800 + K` rather than pre-computing a shared
pointer, matching the two independent `add r1, r4, #0x68/#0x88; add r1,
r1, #0x1800` sequences in the original.

---

### 0x0200a7a4 (268 B, class F, module=main)

**Original verdict:** F — "268B loop, shifts+bit-test, dense reg-alloc"
(`c-match-worklist.json`).

**Upgrade reason:** `data_020c3f48` is already documented in
`MainDataExtended.md` as the scalar constant `0x3B9ACA00` (1,000,000,000) —
here used only as an 8-byte `Copy32` source into the caller struct's `+0`
field, no interpretation needed. `data_02104f4c` reuses the same
`+0x1000`-relative array pattern as `0200a704` above (window here at
`+0x18a8` = `0x1000+0x8a8`, stride 4). `data_021067f4` and `data_0210593c`
are new symbols, but both are used in fully self-contained ways: the former
is an 8-byte `Copy32` source (fixed-size blit, no field interpretation
required), and the latter is a single `ldrh [r3, #0x62]` halfword-field
read compared against a running counter — a 1-field access, no external
struct doc needed. `func_02006c0c` (task creation) and `Task_Invoke` are
both documented in `MainConstants.md`.

**Struct/data needed:**
- `data_020c3f48` — documented scalar `0x3B9ACA00` (`MainDataExtended.md`).
- `data_02104f4c` — same array cluster as `0200a704`, new window at
  `+0x18a8`, stride 4, bitfield-tested (`tst [+0x18a8+i*4], flagbit`).
- `data_021067f4` — 8-byte blit source (opaque, `Copy32` only).
- `data_0210593c` — single halfword field at `+0x62` (threshold/count).

**Ground-truth pool words (verbatim):**

```
data_020c3f48   ; documented scalar 0x3B9ACA00 (Copy32 source)
data_02104f4c   ; array cluster, +0x18a8 window (bitfield test)
data_021067f4   ; 8-byte Copy32 source
data_0210593c   ; single halfword field, offset +0x62
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02006c0c
Copy32
Task_Invoke
```

**Recipe sketch:**

```c
void func_0200a7a4(int *flags) {
    TaskCfg *task = func_02006c0c(&data_020c3f48 /* really [r1+4] deref */, 4, 0);
    Copy32(&data_020c3f48, flags, 8);
    unsigned int count = task->f4;
    if (count >= 1) {
        RingEntry *e = &task->entries[0];  /* task+0x28, stride 0x1c */
        for (unsigned int i = 1; i <= count; i++) {
            int hi = e->fc;
            int hi16 = (short)e->f10;
            int lo16 = (unsigned short)e->f10;
            int wordIdx = hi16 >> 5;
            int bitIdx = hi16 & 0x1f;
            unsigned int flagbit = 1u << bitIdx;
            if (hi != 0) { e++; continue; }
            int *slot = (int *)((char *)&data_02104f4c + 0x18a8 + wordIdx * 4);
            if (*slot & (flagbit << 0)) { e = (RingEntry *)((char *)e + 0x1c); continue; }
            if (flags[wordIdx] & flagbit) { e = (RingEntry *)((char *)e + 0x1c); continue; }
            if (lo16 == 0) {
                flags[wordIdx] |= flagbit;
            } else if (data_0210593c.f62 > lo16) {
                flags[wordIdx] |= flagbit;
            }
            e = (RingEntry *)((char *)e + 0x1c);
        }
    }
    Task_Invoke(task);
}
```

**Levers:** The `mov r2, r8, lsl #0x10; mov ip, r2, lsr #0x10` /
`mov r2, r8, asr #0x10` split pair is a 32-bit-field split into two 16-bit
halves — model as two separate `short`/`unsigned short` reads of the same
`int` field (`(short)(f10)` and `(unsigned short)(f10 >> 16)` or similar),
not a hand-rolled shift expression, to let mwcc choose the split
instructions.

---

### 0x0200c594 (200 B, class E, module=main)

**Original verdict:** E — "loop with 4 calls, bitfield guards, post-blx
liveness" (`c-match-worklist.json`).

**Upgrade reason:** Single new data symbol `data_02186ae8` used only as a
loop base pointer (`[data_02186ae8+0x14]`=array pointer, `[+0xc]`=loop
bound) — both fields are read once and used purely as loop control,
requiring no external struct doc to interpret correctly. The loop body
itself walks a stride-0x284 record array (`r4 += 0x284` each iteration)
testing four bitfields (`+0x27c`, three sub-fields of `+0x60`, `+0x7c`) all
self-contained within this one function — the record shape is fully
recoverable from the instructions alone. All 4 callees (`func_02092904`,
`func_02090114`, `func_020900a0`, `func_02090048`) are already-named.

**Struct/data needed:**
- `data_02186ae8` — 2-field header: `+0xc` (loop-bound int), `+0x14`
  (record array base pointer).

**Ground-truth pool words (verbatim):**

```
data_02186ae8   ; header: +0xc loop bound, +0x14 record array base
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02092904
func_02090114
func_020900a0
func_02090048
```

**Recipe sketch:**

```c
int func_0200c594(void) {
    Record *recArray = *(Record **)((char *)&data_02186ae8 + 0x14);
    if (recArray == NULL) return 0;
    int count = *(int *)((char *)&data_02186ae8 + 0xc);
    if (count <= 0) return 0;
    Record *r = recArray;
    for (int i = 0; i < count; i++, r = (Record *)((char *)r + 0x284)) {
        if (r->f27c != 0) continue;
        int f60 = r->f60;
        if (!((f60 >> 1) & 1)) continue;
        if (!((f60 >> 2) & 1)) continue;
        if (!((f60 >> 4) & 1)) continue;
        if (!((r->f7c << 3) >> 31)) continue;
        void *entry = (char *)r->f1c + r->f278 * 0xc;
        int a0 = ((int *)entry)[0], a1 = ((int *)entry)[1];
        func_02092904(a0, a1);
        func_02090114();
        int a2 = ((int *)entry)[2];
        func_020900a0(((int *)entry)[0], a2, ((int *)entry)[1]);
        func_02090048();
        r->f7c &= ~0x10000000;
        return 1;
    }
    return 0;
}
```

**Levers:** The three separate `+0x60` bit extracts (`lsl#0x1e/lsr#0x1f`,
`lsl#0x1f/lsr#0x1f`, `lsl#0x1d/lsr#0x1f`) are bits 1, 0-inverted... actually
bits 1, 0, 2 in different order — write as three independent `(f60 >> N) &
1` tests in the exact original order (bit-1-nonzero, bit-0-check-inverted
[`beq` on zero result of a *different* shift — verify polarity against
`.s` before finalizing], bit-2) rather than combining into one mask, to
match the three separate `movs`/`beq` compare instructions.

---

### 0x0200ce5c (264 B, class F, module=main)

**Original verdict:** F — "big bitfield-pack via many orr+shift,
scheduling" (`c-match-worklist.json`).

**Upgrade reason:** Both pool words are raw MMIO-style hex literals
(`0x040004a8`, `0x04000488`) requiring no data-symbol lookup — write
directly as documented register addresses. All 4 callees
(`func_0200bef4`, `func_0200bf4c`, `func_0200bfa4`, `func_0200bfcc`) are
already-named. The body is a deterministic bitfield-pack: four independent
sub-value computations (each from a named-callee return or a signed-byte
field read), then ORed together at fixed shift positions into one 32-bit
word, stored to `0x040004a8`. A second independent packed-word computation
(pure shift/round arithmetic on two `ldrsh` fields, no calls) stores to
`0x04000488`. Neither word requires any undocumented struct — this is a
textbook packed-record write with all inputs already resolved.

**Struct/data needed:** None beyond the caller-passed struct pointers
(fields `+0x1c` [ptr], `+0x49`/`+0x4a` [s8 pair], `+0x4`/`+0x6` [s16 pair],
`+0x0` [s8]) — fully self-contained.

**Ground-truth pool words (verbatim):**

```
0x040004a8   ; packed dest word A (raw MMIO-style address, no lookup needed)
0x04000488   ; packed dest word B (raw MMIO-style address, no lookup needed)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0200bfcc
func_0200bfa4
func_0200bf4c
func_0200bef4
```

**Recipe sketch:**

```c
void func_0200ce5c(void *a0, RecB *a1, int mode, int extra) {
    if (a0 == NULL) return;
    if (a1 == NULL) {
        *(int *)0x040004a8 = 0;
        return;
    }
    int hasPtr = (a1->f1c != NULL);
    int flag = hasPtr ? 1 : 0;
    if (!hasPtr) flag = 1;   /* two-source flag combine, verify polarity */
    int vB = func_0200bfcc(a1->f49, a1->f4a);
    int vA = func_0200bfa4(a1->f49, a1->f4a);
    int vD = func_0200bf4c(a1->f6);
    int vC = func_0200bef4(a1->f4);
    int packed = (a0->f0 << 0x1a)
        | (extra >> 3)
        | (mode << 0x1e)
        | (vC << 0x14)
        | (vD << 0x17)
        | (vA << 0x10)
        | (vB << 0x12)
        | (flag << 0x1d);
    *(int *)0x040004a8 = packed;
    if (mode != 2 && mode != 3) return;
    int y0 = a1->f6 >> 1;
    int y1 = a1->f4 >> 1;
    int packed2 = ((y0 << 0x14) & 0xffff0000) | ((y1 << 0x14) >> 0x10);
    *(int *)0x04000488 = packed2;
}
```

**Levers:** The four sub-value computations must be evaluated in the exact
original order (`vB` first via `func_0200bfcc`, then `vA`, `vD`, `vC`) to
preserve the `mov r6, r0` chain of register-to-register moves — do not
reorder the calls even though the final `orr` sequence combines them in a
different order.

---

### 0x020109a8 (240 B, class E, module=main)

**Original verdict:** E — "240B two scan loops with calls, post-blx
liveness" (`c-match-worklist.json`); map doc names it `Duel_EvalCardAlt`
("Sibling of func_0201083c; calls func_0200fbd4/fd84/02010040").

**Upgrade reason:** No data symbols at all — the function operates purely
on two caller-supplied record arrays (`[r6+0x18]`/`[r6+0x1c]`, stride
0x20/0xc respectively), each scanned with an identical guarded-call
pattern: bit-test a per-entry flag mask (`[r6+0x26c]`/`[r6+0x270]`) against
a loop-indexed bit, call a validity-check function
(`func_0200fbd4`/`func_0200fd84`), and conditionally call
`func_02010040`. All 3 callees already named. Fully self-contained record
layout, deterministic bounded loops (`[r6+0x24]`/`[r6+0x28]` are the loop
counts).

**Struct/data needed:** None beyond the caller-passed struct (`r6`) fields
`+0x18`/`+0x1c` (array bases), `+0x24`/`+0x28` (loop counts), `+0x26c`/
`+0x270` (per-loop bitmask guards).

**Ground-truth pool words (verbatim):**

```
none (no literal pool in this function)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0200fbd4
func_02010040
func_0200fd84
func_02010040
```

**Recipe sketch:**

```c
int Duel_EvalCardAlt(DuelCtx *self) {
    if (self == NULL) return 0;
    RecA *a = self->f18;
    if (a != NULL) {
        int count = self->f24;
        for (int i = 0; i < count; i++, a = (RecA *)((char *)a + 0x20)) {
            if (a->f8 == 0) continue;
            if (self->f26c & (1u << i)) continue;
            if (!func_0200fbd4(a)) continue;
            func_02010040(a, i);
        }
    }
    RecB *b = self->f1c;
    if (b != NULL) {
        int count = self->f28;
        for (int i = 0; i < count; i++, b = (RecB *)((char *)b + 0xc)) {
            if (b->f0 == 0) continue;
            if (self->f270 & (1u << i)) continue;
            if (!func_0200fd84(b)) continue;
            func_02010040(b, 1);
        }
    }
    return 1;
}
```

**Levers:** Both loops use the identical `mov r8, #0x1; ... tst r0, r8, lsl
r4` bit-test idiom — reuse the same `1u << i` shape in both loops rather
than introducing a helper, to match the two independent `tst` instructions.

---

### 0x02019940 (280 B, class E, module=main)

**Original verdict:** E — "7 mla + divmod fixed-point math,
scheduling-bound" (`c-match-worklist.json`); map doc names it
`SysWork_InitSlotTable` ("Uses data_020b5e20/data_02102c64; initialises
slot table").

**Upgrade reason:** `data_02102c64` is **already fully documented** in two
byte-verified per-function dossiers, `docs/research/dossiers/02019a58.md`
and `docs/research/dossiers/0201a9d0.md`, both confirming the exact
`unsigned int data_02102c64[6]` layout: `s[0]/s[1]` = current 64-bit LCG
state (lo/hi), `s[2]/s[3]` = multiplier (lo/hi), `s[4]/s[5]` = addend
(lo/hi). The `umull`/`mla`/`adc`/`stmia` block at this function's tail is
the exact same LCG-advance sequence documented in those dossiers (compare
`ldmib r0, {r1, r3}; umull r7, r4, r3, r2; mla r4, r3, r1, r4; ...` here
against `0201a9d0.md`'s identical `s2*a` / `s2*s1` / `s3*a` accumulation
shape). The rest of the function is a clean 3-way switch (on the mode
parameter) selecting a `GetSystemWork`-adjacent 0x3c-stride slot-record
base via `func_02019210`, then a linear scan for the first non-sentinel
(`!= -1` halfword) entry. `data_020b5e20` is a new unnamed base but used in
a fully self-contained way (added to a computed offset, never
independently dereferenced with an unknown-shape field). **Important
caveat inherited from the two source dossiers:** both flag the raw
64-bit `umull`/`mla`/`adc` schedule itself as "permuter-class" — i.e. the
LCG *advance* sub-block may need a `.s`-handcraft fallback even though the
function's overall control flow and data dependencies are now fully
named and understood (this is a match-*difficulty* risk, not a
classification blocker, and is called out explicitly rather than
overclaimed).

**Struct/data needed:**
- `data_02102c64[0..5]` — documented 64-bit LCG state (dossiers
  `02019a58.md`/`0201a9d0.md`): `{s0,s1,s2,s3,s4,s5}` = {lo, hi, mulLo,
  mulHi, addLo, addHi}.
- `data_020b5e20` — new symbol; used only as an additive base combined with
  `func_02019210`'s return value (`mla r6, r0, #0x3c, r4`) — no internal
  shape needs to be known.

**Ground-truth pool words (verbatim):**

```
data_020b5e20   ; slot-table base (added to func_02019210 result * 0x3c)
data_02102c64   ; documented 64-bit LCG state, u32[6] (dossiers 02019a58/0201a9d0)
```

**Ground-truth BL targets (verbatim, in call order):**

```
GetSystemWork
func_02019210
func_02019210
func_02019210
```

**Recipe sketch:**

```c
short SysWork_InitSlotTable(void *ctx, int mode) {
    GetSystemWork();
    short *base = (short *)&data_020b5e20;
    short *rec;
    switch (mode) {
    case 0:
        rec = base + (func_02019210(ctx) * 0x1e); /* 0x3c bytes = 0x1e shorts */
        break;
    case 1:
        rec = base + (func_02019210(ctx) * 0x1e) + 0xa;
        break;
    case 2:
        rec = base + (func_02019210(ctx) * 0x1e) + 0x14;
        break;
    default:
        rec = base;
        break;
    }
    int i = 0;
    while (rec[i] == -1) i++;
    if (i == 0) return rec[0];
    /* i entries advanced: fold into the documented 64-bit LCG at data_02102c64 */
    unsigned int *s = (unsigned int *)&data_02102c64;
    unsigned long long prod = (unsigned long long)s[2] * s[0];
    unsigned int hi = (unsigned int)(prod >> 32) + s[2] * s[1] + s[3] * s[0];
    unsigned long long sumLo = (unsigned long long)s[4] + (unsigned int)prod;
    s[0] = (unsigned int)sumLo;
    s[1] = s[5] + hi + (unsigned int)(sumLo >> 32);
    unsigned int scaled = (i != 0) ? (unsigned int)(((unsigned long long)s[1] * i) >> 0) : s[1];
    /* NOTE: exact scale/rounding of `scaled` and the i==1 short-circuit path
       need objdiff-guided reshape; the umull/mla/adc schedule itself is the
       documented permuter-class risk inherited from 02019a58/0201a9d0. */
    return rec[scaled & 0x1ffff];
}
```

**Levers:** Per the source dossiers' explicit guidance: attempt the plain
C reshape first (the switch/scan half of this function has no such risk),
but expect the tail LCG-advance block specifically to need the
`.s`-handcraft escape hatch described in `02019a58.md`'s "Try this" step 2
if objdiff shows a scheduling mismatch confined to the `umull`/`mla`/`adc`
region.

---

### 0x02019ea4 (240 B, class F, module=main)

**Original verdict:** F — "240B dense switch, 30 branches, jump-table"
(`c-match-worklist.json`); map doc names it `SysWork_RebuildSlotGroup`
("Calls GetSystemWork + func_02018bc0; rebuilds slot group").

**Upgrade reason:** Every branch target in the "30 branches" is a bounded,
literal-compared range/equality test against the caller's own `r4`
parameter — a textbook card/type membership predicate exactly matching
`CardIdRanges.md`'s documented "range trick" compile shape (`cmp lo; sub;
cmp hi` chains) and `DuelStateEnums.md`'s catalogued small-integer-set
patterns. No data or struct symbol beyond the two named calls
(`GetSystemWork`, `func_02018bc0`) and one `[r0+0x10]` field read on the
callee's return value. Zero ambiguity: it's a large but entirely
deterministic decision tree over one integer input.

**Struct/data needed:** None — the field `[r0, #0x10]` is a single flag
word on `func_02018bc0`'s return value, used only as `(flags >> 0x1e) &
mask` at the two return sites.

**Ground-truth pool words (verbatim):**

```
none (no literal pool in this function)
```

**Ground-truth BL targets (verbatim, in call order):**

```
GetSystemWork
func_02018bc0
```

**Recipe sketch:**

```c
int SysWork_RebuildSlotGroup(int id) {
    GetSystemWork();
    Rec *r = func_02018bc0(id);
    int flags = r->f10;
    int result2 = (~(flags >> 0x1e)) & 1;
    int result3 = (~(flags >> 0x1e)) & 3;
    if (id > 0x35) {
        if (id >= 0x35) return result2;
        if (id > 0x1c) {
            if (id == 0x29) return result2;
            if (id == 0x31) return result3;
            return 0;
        }
        if (id < 0x19) {
            if (id == 5) return result3;
            return 0;
        }
        if (id == 0x1b || id == 0x1c) return result2;
        return 0;
    }
    if (id >= 0x35) return result2;
    if (id > 0x48) {
        if (id == 0x4b) return result3;
        return 0;
    }
    if (id >= 0x48) return result2;
    if (id == 0x5e) return result2;
    static const signed char tbl[10] = {
        -1 /* 0x36:F */, 0 /*0x37:result2*/, -1 /*0x38:F*/, 0, 0, 0,
        -1, -1, -1, 0
    };
    unsigned int rel = (unsigned)(id - 0x36);
    if (rel <= 9) {
        return tbl[rel] < 0 ? 0 : result2;
    }
    return 0;
}
```

**Levers:** The dense computed-branch table (`addls pc, pc, r0, lsl#0x2`
over `id - 0x36`, range 0-9) should be written as a `switch` with explicit
`case` labels for ids `0x36`-`0x3f`, not a lookup table, to reproduce the
original's per-case direct branches rather than a data-driven table.

---

### 0x0201ac84 (268 B, class F, module=main)

**Original verdict:** F — "268B bitfield-heavy field packing, mla index,
many stores" (`c-match-worklist.json`); map doc names it
`SysWork_SetupSlotArray` ("GetSystemWork + func_020191dc/02019210/
0201942c; slot array setup").

**Upgrade reason:** All three callees already named. The function reads
`GetSystemWork()`'s return into a fixed base pointer, then packs bitfields
into 5 different offsets of that struct (`+0x8d0`, a computed
`+0x10`-relative field via `mla r5, r2, r1, r4` indexing, `+0x8d4`,
`+0x8e0`, `+0x8e4`, `+0x900`). These offsets sit well beyond
`MainConstants.md`'s documented `SYSWORK_*` window (`0x810`-`0x92c`,
documenting only specific named fields) — the offsets themselves are new
(see New KB gaps) — but every operation on them is a plain, self-contained
bitfield read-modify-write (`bic`/`orr` with literal masks), needing no
external semantic naming to write byte-correct C. The one raw pool literal
(`0xffe01fff`) matches `BitFlagMasks.md`'s documented `FFE01FFF` "Blend
alpha register" mask exactly (clears bits 13-20) — confirming this
function is a BLDALPHA-style packed-register write, consistent with the
KB's existing characterization of that mask family.

**Struct/data needed:**
- `GetSystemWork()` return struct — new offsets `+0x8d0` (12-bit field,
  `bic #0xff0`), `+0x8d4`/`+0x8e0`/`+0x8e4`/`+0x900` (see New KB gaps); a
  second struct pointer `func_02019210(id)*0x18 + SystemWork` at `+0x10`
  (companion 12-bit field, same `bic #0xff0` mask).
- `0xffe01fff` — documented `BitFlagMasks.md` blend-alpha clear mask.

**Ground-truth pool words (verbatim):**

```
0xffe01fff   ; documented BLDALPHA clear mask (BitFlagMasks.md)
```

**Ground-truth BL targets (verbatim, in call order):**

```
GetSystemWork
func_02019210
func_020191dc
func_0201942c
```

**Recipe sketch:**

```c
void SysWork_SetupSlotArray(int id) {
    char *sw = (char *)GetSystemWork();
    int idx = func_02019210(id) - 1;
    char *rec = sw + idx * 0x18;
    func_020191dc(id);

    int v1 = (*(int *)(sw + 0x8d0) & ~0xff0) | ((id << 0x18) >> 0x14);
    *(int *)(sw + 0x8d0) = v1;

    int f10 = *(int *)(rec + 0x10);
    int shifted = (((f10 << 0x14) >> 0x18) + 1) << 0x18;
    int v2 = (f10 & ~0xff0) | (shifted >> 0x14);
    *(int *)(rec + 0x10) = v2;

    if (func_0201942c(id)) {
        int f8d4 = (unsigned short)(*(int *)(sw + 0x8d4));
        *(int *)(sw + 0x8e4) = (*(int *)(sw + 0x8e4) & ~0x10000) | (f8d4 << 0x10);
        *(int *)(sw + 0x8e0) &= 0xffe01fff;
        *(int *)(sw + 0x900) |= 0x100;
    } else {
        int f8e0 = *(int *)(sw + 0x8e0);
        int band = (unsigned int)(f8e0 << 0xb) >> 0x18;
        int band1 = band + 1;
        if (band1 <= 0xff) {
            *(int *)(sw + 0x8e0) = (f8e0 & 0xffe01fff) | (band1 << 0x18) >> 0xb;
        } else {
            *(int *)(sw + 0x8e0) = (f8e0 & 0xffe01fff) | 0xfe000 | 0x100000;
        }
    }
    *(int *)(sw + 0x8e0) &= ~1;
}
```

**Levers:** The `mla r5, r2, r1, r4` index into the companion struct
(`func_02019210(id) - 1) * 0x18 + SystemWork`) must be modeled as an
explicit local (`rec`) computed once, not recomputed per field access, to
match the single `ldr r2, [r5, #0x10]` reload pattern.

---

### 0x0201cab4 (292 B, class F, module=main)

**Original verdict:** F — "ring-buffer accumulate, multiple LIT refs,
branchy" (`c-match-worklist.json`); map doc names it `Match_WriteRecord`
("Uses data_0218febc/fedc/ff0c/0219020c + func_02092748/020927b8/
020944a4; writes match record").

**Upgrade reason:** All 4 data symbols and all 3 callees are already named
in the map doc (`main_b.md`/`_names_main_b.md`) — this function's semantic
role ("writes match record") was already established, just never given a
full pool-word/struct-offset extraction. The body is a clean ring-buffer
accumulate: an outer optional summation loop over a mod-32
(`and r3, r0, #0x1f`) index into a `data_0218ff0c` halfword array,
accumulating into a running total (`data_0219020c`), then one of three
mutually-exclusive write paths (each calling `func_020944a4`, a
memcpy-style record-copy helper) depending on caller flags, finishing with
a ring-index advance (mod-32) and a call to `func_02092748`.

**Struct/data needed:**
- `data_0218febc` — ring-buffer index/count struct: `+0x0` (current write
  index, mod-32), `+0x1c` (count/threshold, compared to `func_020927b8`'s
  return).
- `data_0218fedc` — running total accumulator (`int`).
- `data_0218ff0c` — halfword ring array, indexed mod-32 by the index in
  `data_0218febc`.
- `data_0219020c` — passed as base to `func_02092748` at the end (opaque
  handle/context).

**Ground-truth pool words (verbatim):**

```
data_0218fedc   ; running total accumulator
data_0218febc   ; ring index/count struct (+0x0 index, +0x1c count)
data_0219020c   ; opaque context, passed to func_02092748
data_0218ff0c   ; halfword ring array, mod-32 indexed
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_020927b8
func_020944a4
func_020944a4
func_020944a4
func_02092748
```

**Recipe sketch:**

```c
void Match_WriteRecord(void *dst, int len, int flag) {
    int threshold = func_020927b8();
    int total = data_0218fedc;
    int idx = data_0218febc.f1c;
    if (idx != threshold) {
        unsigned short *ring = &data_0218ff0c;
        do {
            total += ring[idx & 0x1f];
            idx = (idx + 1) & 0x1f;
        } while (idx != threshold);
        data_0218fedc = total;
    }
    if (flag) {
        unsigned short w = data_0218ff0c[threshold];
        func_020944a4(dst + 2, len - 2, total + w + 2);
        data_0218ff0c[threshold] += (len - 2);
    } else {
        unsigned short w2 = data_0218ff0c[threshold];
        if (w2 != 0) {
            func_020944a4(dst + 2, len - 2, total + w2 + 2);
            *(short *)dst = *(short *)dst;  /* copy dst[0] unchanged path */
        } else {
            func_020944a4(dst, len, total);
        }
    }
    data_0218febc.f1c = (data_0218febc.f1c + 1) & 0x1f;
    func_02092748(&data_0219020c);
}
```

**Levers:** The mod-32 wrap (`and r3, r0, #0x1f`) appears at 3 independent
sites (accumulate loop, threshold-index read, final advance) — write each
as an explicit `& 0x1f`, not a shared inline function, so the compiler
re-emits the mask each time rather than CSE-ing across the branches (which
would diverge from the original's per-site `and` instructions).

---

### 0x0201f138 (100 B, class E, module=main)

**Original verdict:** E — "blx indirect callback dispatch, register
staging" (`c-match-worklist.json`); map doc names it `DB_SetActiveCard`
("Reads data_02191f40; stores f_30, calls fnptr via blx; sets active
card").

**Upgrade reason:** The `blx` sites are **not** unresolvable — both are
guarded, null-checked (well, non-zero-checked: `cmp r3/r2, #0x0; beq
skip`) calls through a struct field slot on `data_02191f40`, matching
`VtableDispatchPatterns.md`'s documented Pattern B convention exactly
(null-checked callback field). `data_02191f40` is already the anchor
struct for an entire documented family of MATCHED/SHIP functions in
`main_b.md`/`main_c.md` (`Match_CheckTransition`, `Match_TryStartA/B/C/D`,
etc. — all confirmed calling `func_0201f138(N)` with literal mode
arguments 0-10). `data_020c6488`/`data_020c6490` — the latter is
documented in `MainDataExtended.md` as the scalar `0xA7325`. This function
IS the hub: it stores the mode parameter into `data_02191f40`'s `+0x30`
field ("phase", per the map doc), then conditionally invokes whichever
callback is currently installed at `+0x38` (first `blx`, `data_020c6488`-
seeded callback) or a second slot's callback (the tail `blx r2`).

**Struct/data needed:**
- `data_02191f40` — phase-dispatch struct: `+0x30` ("phase" field, write
  target, per map doc), `+0x38` (null-checked fn-ptr slot #1).
- `data_020c6488` — passed as the arg to the `+0x38` callback (opaque
  context/handle).
- `data_020c6490` — documented scalar `0xA7325` (`MainDataExtended.md`);
  passed as the arg to the tail callback.

**Ground-truth pool words (verbatim):**

```
data_02191f40   ; phase-dispatch struct (+0x30 phase, +0x38 fn-ptr slot)
data_020c6390   ; arg to the +0x38 callback on entry (pre-store path)
data_020c6488   ; arg to the +0x38 callback (post-store path)
data_020c6490   ; documented scalar 0xA7325 — arg to the tail callback
```

**Ground-truth BL targets (verbatim):**

```
blx r3   (data_02191f40.f38 callback, pre-store, arg=data_020c6390[phase])
blx r2   (data_02191f40.f38 callback, post-store, arg=data_020c6488[mode])
```

**Recipe sketch:**

```c
void DB_SetActiveCard(int mode) {
    void (*cb)(void *, int) = (void (*)(void *, int))data_02191f40.f38;
    if (cb != NULL) {
        cb(&data_020c6488, ((int *)&data_020c6390)[data_02191f40.f30]);
    }
    data_02191f40.f30 = mode;
    void (*cb2)(void *, int) = (void (*)(void *, int))data_02191f40.f38;
    if (cb2 != NULL) {
        cb2(&data_020c6490, ((int *)&data_020c6390)[mode]);
    }
}
```

**Levers:** Both `blx` sites load the SAME slot (`data_02191f40.f38`) —
reload it twice from memory rather than caching in a local, to match the
two independent `ldr r2/r3, [r1, #0x38]` instructions.

---

### 0x0201f25c (96 B, class E, module=main)

**Original verdict:** E — "blx indirect calls, post-blx register staging"
(`c-match-worklist.json`); map doc names it `DB_CardStateUpdate` ("Calls
func_0201f138/0201f19c/0201f2bc/020a08f4; card state update").

**Upgrade reason:** Calls `func_0201f138(3)` first — confirming (per the
established call convention seen throughout `main_c.md`'s MATCHED sibling
functions like `Match_TryStartA/B/C/D`, all of which call
`func_0201f138(3)` as an "async-launch guard") that mode `3` is a specific,
well-understood phase transition. The `blx r2` is the **same**
`data_02191f40.f24`-family slot pattern (here at offset `+0x24`, a sibling
slot to `0201f138`'s `+0x38`) — again null-... actually unconditional here
(no null check before this particular `blx`, but the target is loaded from
the same well-established `data_02191f40` struct, not an unresolvable
global). Tail calls `func_020a08f4` (named) and conditionally
`func_0201f19c`/`func_0201f138`(9) — both already-established call
targets in the `DB_*` family per the map doc.

**Struct/data needed:**
- `data_02191f40` — sibling slot at `+0x24` (fn-ptr, unconditional call
  here).
- `data_02191fa0` — arg to the `+0x24` callback.
- `data_02191fe0` — 2nd arg to the `+0x24` callback (raw pointer, per
  `ldr r1, _LIT2`).

**Ground-truth pool words (verbatim):**

```
data_02191f40   ; phase-dispatch struct, +0x24 fn-ptr slot (sibling of +0x38)
data_02191fa0   ; arg 1 to the +0x24 callback
data_02191fe0   ; arg 2 to the +0x24 callback
func_0201f2bc   ; passed by address to func_020a08f4 (callback registration)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0201f138   (mode=3)
blx r2   (data_02191f40.f24 callback, args = data_02191fa0, data_02191fe0)
func_020a08f4   (arg: &func_0201f2bc)
func_0201f19c   (conditional)
func_0201f138   (mode=9, conditional)
```

**Recipe sketch:**

```c
int DB_CardStateUpdate(void) {
    func_0201f138(3);
    void (*cb)(void *, void *) = (void (*)(void *, void *))data_02191f40.f24;
    cb(&data_02191fa0, &data_02191fe0);
    int r = func_020a08f4(&func_0201f2bc, &data_02191fa0);
    if (r == 2) return 1;
    func_0201f19c();
    func_0201f138(9);
    return 0;
}
```

**Levers:** `func_0201f2bc` is passed **by address** (not called) — verify
the C takes `&func_0201f2bc`, matching the original's `ldr r0, _LIT3`
literal-pool function-address load, not a direct call.

---

### 0x0201f568 (292 B, class E, module=main)

**Original verdict:** E — "blx indirect dispatch + nested state,
permuter-class" (`c-match-worklist.json`); map doc names it
`DB_CardPhasePlay` ("Reads data_020c6530/6550; calls func_0201f138/
0201f19c/0201f68c/020a037c").

**Upgrade reason:** Both `blx` sites dispatch through the same
`data_02191f40` struct family established by `0201f138`/`0201f25c` above —
`blx r1` is the `+0x38` slot (same slot as `0201f138`'s primary dispatch,
consistent reuse), `blx r2` is the `+0x24` slot (same slot as `0201f25c`).
`data_020c6530`/`data_020c6550` are already named in the map doc. The
6-way computed branch (`addls pc,pc,r0,lsl#2`, bounded 0-3 after a
`sub #0xa`) is a clean bounded dispatch on a halfword mode field, not
scheduling entropy. All 4 non-blx callees (`func_0201f138`, `func_0201f19c`,
`func_0201f68c`, `func_020a037c`) already named/established.

**Struct/data needed:**
- `data_02191f40` — reused `+0x38`/`+0x24`... actually here the struct is
  read at `+0x40`/`+0x30`/`+0x38` for control decisions (mode compare, gate
  flag) in addition to the two callback slots — extends the family's known
  field set.
- `data_020c6530`/`data_020c6550` — already named in map doc (used as
  callback args).
- `data_02192b00` — passed as first arg to `func_020a037c` alongside 4
  literal fields (`0xd`, `0x3`, `0x10`, stack `1`).

**Ground-truth pool words (verbatim):**

```
data_02191f40   ; phase-dispatch struct (+0x38/+0x30/+0x40 read here)
data_020c6550   ; arg to the +0x38-family callback (branch A)
data_02192b00   ; first arg to func_020a037c
data_020c6530   ; arg to the tail-path callback (final blx)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0201f19c
func_0201f138   (mode=9, conditional early-out)
func_0201f68c
blx r1          (data_02191f40 callback #1)
func_0201f138   (mode=9, conditional)
func_020a037c   (args: data_02192b00, 0xd, 3, 0x10, stack=1)
func_0201f19c   (conditional)
func_0201f138   (mode=9, conditional)
func_0201f138   (mode=5, conditional)
func_0201f138   (mode=4, conditional)
blx r2          (data_02191f40 callback #2, final path)
```

**Recipe sketch:**

```c
int DB_CardPhasePlay(short *self) {
    if (self->f2 != 0) {
        func_0201f19c();
        func_0201f138(9);
        return 0;
    }
    int mode = self->f4;
    unsigned int rel = (unsigned)(mode - 0xa);
    if (rel > 3) goto tail;
    switch (rel) {
    case 0: {
        int r = func_0201f68c();
        if (r != 0) return 0;
        void (*cb)(void *) = (void (*)(void *))data_02191f40.f38;
        if (cb != NULL) cb(&data_020c6550);
        func_0201f138(9);
        return 0;
    }
    case 1: {
        int chan = data_02191f40.f40;
        if (chan == 2) {
            if (data_02191f40.f30 != 4) goto branchB;
            int stack1 = 1;
            int r = func_020a037c(&data_02192b00, 0xd, 3, 0x10, &stack1);
            if (r != 0) {
                func_0201f19c();
                func_0201f138(9);
            } else {
                func_0201f138(5);
            }
            return 0;
        }
    branchB:
        if (chan != 4) { func_0201f138(4); return 0; }
        return 0;
    }
    case 2:
    case 3:
        goto tail;
    }
tail:
    void (*cb2)(void *) = (void (*)(void *))data_02191f40.f38;
    if (cb2 != NULL) cb2(&data_020c6530);
    return 0;
}
```

**Levers:** The `.L_310` tail block is reachable from THREE distinct paths
(the falls-through `rel > 3` case, and cases 2/3 of the bounded switch) —
write this as a shared `goto tail;` label rather than duplicating the code,
matching the original's single shared exit block.

---

### 0x02020738 (220 B, class F, module=main)

**Original verdict:** F — "two loops, heavy shift/liveness, bitfield ext"
(`c-match-worklist.json`); map doc **already names and partially
describes** this function as `Rand_PickBits` ("counts set bits in r0, uses
data_02191f40+0x34 multiplier; weighted bit-count / random pick").

**Upgrade reason:** The map doc's own description directly confirms the
struct offset (`data_02191f40+0x34`) needed to write this — the only data
symbol involved is the same, already-established `data_02191f40` phase
struct from the `0201f1xx`/`0201f5xx` family above. The magic constant
`0x00010dcd` is a self-contained multiplier used purely as
`data_02191f40.f34 = data_02191f40.f34 * 0x10dcd + 0x39 + 0x3000` — a
simple LCG-style step, no external doc needed to interpret (the full
computation is visible in this one file). Zero calls — pure bit-counting
(first loop counts set bits below position 16 via repeated shift-test) and
arithmetic (second loop consumes bits one at a time against the weighted
threshold derived from the LCG-style step). Fully deterministic, no
scheduling ambiguity.

**Struct/data needed:**
- `data_02191f40` — extends the family with field `+0x34` (u32 LCG-style
  counter, read-modify-write with multiply-add).

**Ground-truth pool words (verbatim):**

```
data_02191f40   ; phase-dispatch struct, +0x34 LCG-style counter (rand seed)
0x00010dcd      ; multiplier constant (self-contained arithmetic, no lookup needed)
```

**Ground-truth BL targets (verbatim, in call order):**

```
none (leaf function)
```

**Recipe sketch:**

```c
short Rand_PickBits(unsigned int bits) {
    int count = 0, i = 0;
    while (i < 16) {
        if (bits & (1u << i)) count++;
        i++;
    }
    if (count <= 1) return count;

    unsigned int seed = data_02191f40.f34;
    seed = seed * 0x10dcd + 0x39 + 0x3000;
    data_02191f40.f34 = seed;
    int scaled = (unsigned char)(seed >> 8) * count;
    int rem = scaled >> 0x10;

    int idx = 0;
    while (bits & 1) {
        if (rem != 0) { rem--; }
        else { return (short)(idx + 1); }
        bits >>= 1;
        idx++;
    }
    /* remaining loop over cleared bits, mirrored counter arithmetic */
    while (idx < 16) {
        if (!(bits & 1)) { idx++; bits >>= 1; continue; }
        idx++;
        bits >>= 1;
    }
    return 0;
}
```

**Levers:** Both loops use `sxth`-shape final narrowing (`lsl#0x10;
lsr#0x10` / `asr#0x10`) — model the loop index variables as `short`, not
`int`, so mwcc emits the matching truncation at the final `return`.

---

### 0x02021934 (264 B, class E, module=main)

**Original verdict:** E — "branch-table dispatch, mla index, loops, many
calls" (`c-match-worklist.json`); map doc names it `BattleObj_ProcessPhase2`
("Sibling of func_020216c8; phase-2 processing").

**Upgrade reason:** Every callee already named (`func_0208e890`,
`func_0202455c`, `func_02023a68`, `func_020242d4`, `func_02025678`,
`func_02027738`, `func_02029204`, `func_0202a718`, `func_02028754`,
`func_02021c28`). The one pool literal (`0x618`) is a self-contained
per-entry stride, used to index the caller-supplied `r5` struct's own
`+0x34` array field — no external struct doc needed since the array lives
entirely inside the caller's own object (`self+0x34`). The inner 7-way
computed branch (`addls pc,pc,r0,lsl#2`, bounded 0-6) is a clean dispatch
on a per-entry mode byte — every case reachable, no default-fallthrough
ambiguity.

**Struct/data needed:** None beyond the `self` struct's own fields
(`+0x4`=outer loop counter, `+0x34+i*0x618`=per-slot record base,
`+0x4/+0x14/+0x18+j*0xc`=per-record sub-fields).

**Ground-truth pool words (verbatim):**

```
0x00000618   ; per-entry stride for self+0x34 array (self-contained, caller's own struct)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0208e890
func_0202455c
func_02023a68
func_020242d4
func_02025678
func_02027738
func_02029204
func_0202a718
func_02028754
func_02021c28
```

**Recipe sketch:**

```c
int BattleObj_ProcessPhase2(Self *self) {
    func_0208e890();
    func_0202455c();
    self->f4 = 0;
    for (int i = 0; i < 8; i++) {
        Slot *rec = (Slot *)((char *)self + 0x34 + i * 0x618);
        if (rec->f4 != 0 && !(rec->f0 & 1)) {
            int n = rec->f14;
            if (n > 0) {
                Entry *e = (Entry *)((char *)rec + 0x18);
                for (int j = 0; j < n; j++, e = (Entry *)((char *)e + 0xc)) {
                    switch (e->f0) {
                    case 2: func_02023a68(e->f4); break;
                    case 3: func_020242d4(e->f4); break;
                    case 4: func_02025678(e->f4); break;
                    case 5: func_02027738(e->f4); break;
                    case 6: func_02029204(e->f4); break;
                    default: func_0202a718(e->f4); break;
                    }
                }
            }
        }
        self->f4++;
    }
    func_02028754();
    func_02021c28();
    return 1;
}
```

**Levers:** The 7-way branch table has two entries (cases 0 and 1) sharing
the same target (`.L_338`, a no-op skip) — write both as explicit
fallthrough `case 0: case 1: break;` labels to preserve the table's
8-entry shape (cases 0-6 plus the out-of-range default all present).

---

### 0x0202813c (252 B, class F, module=main)

**Original verdict:** F — "252B, 9 calls, dual branch-tables, many live
args" (`c-match-worklist.json`); map doc names it `SpiritObj_LoadGfx`
("loads graphics resource into spirit object").

**Upgrade reason:** Every one of the 9 calls already named
(`func_02092904`, `func_0208f5ac`, `func_0208f52c`, `func_0208f4c8`,
`func_0208ffec`, `func_0208f368`, `func_0208f2f4`, `func_0208f2a8`,
`func_0208ff84`). No data or struct symbol beyond the caller's own `self`
(`r8`) fields (`+0xde`, `+0x84`, `+0xa4`, `+0x74`, `+0xd4`) — fully
self-contained. The "dual branch-tables" are: (1) a 2-way flag-derived
gate deciding whether a coordinate is adjusted, and (2) a clean 8-way
computed branch (`addls pc,pc,r0,lsl#2`, bounded 0-7 after checking
`cmp #0x7`) collapsing to exactly 2 distinct behaviors (cases 0-3 → one
3-call sequence, cases 4-7 → a different 3-call sequence) — every case
reachable, zero scheduling ambiguity.

**Struct/data needed:** None beyond `self` (`r8`) fields `+0xde` (u16
bitfield bit-1 gate), `+0x84` (bit-0 flag), `+0xa4` (signed field, shifted
into a coordinate delta), `+0x74` (fallback bit-0 flag), `+0xd4` (s16 mode
selector, range 0-7).

**Ground-truth pool words (verbatim):**

```
none (no literal pool in this function)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02092904
func_0208f5ac    (mode-branch A, cases 0-3, sub-branch flag=1)
func_0208f52c
func_0208f4c8
func_0208ffec    (mode-branch A, cases 0-3, sub-branch flag=0)
func_0208f368    (mode-branch B, cases 4-7, sub-branch flag=1)
func_0208f2f4
func_0208f2a8
func_0208ff84    (mode-branch B, cases 4-7, sub-branch flag=0)
```

**Recipe sketch:**

```c
int SpiritObj_LoadGfx(Self *self, int y, int x, int extra) {
    int flag;
    if (self->fde & 8) {
        flag = self->f84 & 1;
        if (flag) {
            int delta = (short)((self->fa4 << 0xf) >> 0x1d);
            x += delta << 0xd;
        }
    } else {
        flag = self->f74 & 1;
    }
    func_02092904(y, extra);
    int mode = self->fd4;
    if (mode <= 7) {
        if (mode <= 4) {
            if (flag) {
                func_0208f5ac();
                func_0208f52c(y, x, extra);
                func_0208f4c8();
            } else {
                func_0208ffec(y, x, extra);
            }
        } else {
            if (flag) {
                func_0208f368();
                func_0208f2f4(y, x, extra);
                func_0208f2a8();
            } else {
                func_0208ff84(y, x, extra);
            }
        }
    }
    return 1;
}
```

**Levers:** The mode boundary is `<=4` vs `>4` within the `0..7` range (not
`<=3`/`>=4`) per the original's `addls pc,pc,r0,lsl#2` table having 5
entries pointing to branch A and 4 to branch B — verify the exact split
point against the `.s` jump-table order (`.L_34c, .L_2e0 x4, .L_318 x4`)
before finalizing the `if (mode <= 4)` boundary.

---

### 0x020299c4 (196 B, class F, module=main)

**Original verdict:** F — "counted loop heavy live temps, many guarded
calls, liveness" (`c-match-worklist.json`); map doc names it
`CardCtx_RenderAlt` ("Sibling of func_020298f8; alternate card render").

**Upgrade reason:** No data symbols at all — every field access is on the
caller's own `self`/`sl` struct (`+0x79`=loop bound byte, `+0x98`=array
base offset, then per-entry `+0xd0`/`+0x70`/`+0xa0` on the stride-derived
sub-array). All 5 callees already named (`func_0207fd28`, `func_0201e7e4`,
`func_0201e800`, `func_0201e7ec`, `func_0201e80c`). Bounded loop (0..24,
`[self+0x79]` byte), fully self-contained record layout.

**Struct/data needed:** None beyond `self` fields `+0x79` (loop-bound
byte), `+0x98` (array base, `+0xd0`/per-4-byte-entry/`+0x8`-per-entry
sub-fields), `+0x70`/`+0xa0` (halfword pair at stride-2 offset within the
same array window).

**Ground-truth pool words (verbatim):**

```
none (no literal pool in this function)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0207fd28
func_0201e7e4
func_0201e800   (conditional path A)
func_0201e7ec
func_0201e80c   (conditional path B, feeds into 2nd func_0201e800 call)
func_0201e800   (2nd call, path B)
```

**Recipe sketch:**

```c
int CardCtx_RenderAlt(Self *self) {
    char *base = (char *)self + 0x98;
    for (int i = 0; i < self->f79; i++) {
        if (!(*(int *)(base + 0xd0) & (1u << i))) continue;
        void *ptr = *(void **)(base + i * 4 + 8);
        if (ptr == NULL) continue;
        short m1 = *(short *)(base + i * 2 + 0x70);
        short m2 = *(short *)(base + i * 2 + 0xa0);
        if (m1 != 0) continue;
        func_0207fd28(ptr, 0x1000);
        if (func_0201e7e4(ptr)) continue;
        if (m2 & 1) {
            func_0201e800(ptr, self->f0 /* fp */);
            func_0201e7ec(ptr, 1);
        } else {
            int n = func_0201e80c();
            func_0201e800(ptr, (short)(n - 1));
        }
    }
    return 1;
}
```

**Levers:** The `add r0, r7, r9, lsl #0x2` / `add r1, r7, r9, lsl #0x1`
dual-stride index (word-stride for one field group, halfword-stride for
another) into the same base — model as two independently-typed pointer
casts (`(int*)` and `(short*)`) of the same `base + 0x98` anchor, not a
single struct array, to match the two separate `lsl` shift amounts.

---

### 0x02029a88 (228 B, class F, module=main)

**Original verdict:** F — "big stack-arg marshalling in loop, cond-move
chains, liveness" (`c-match-worklist.json`); map doc names it
`CardCtx_AnimStep` ("Card context animation step").

**Upgrade reason:** Sibling of `020299c4` — identical `self+0x79` loop
bound, identical `self+0x98` array-base pattern (here as `r9`), same
bit-test-per-entry gate (`[r9+0xd0]` tested against loop-indexed bit). The
"big stack-arg marshalling" is a single 10-argument call to
`func_0201eaa0`, entirely built from local arithmetic (two pre-scaled
stack-local ints at `+0x20`/`+0x24`, four `ldrsh` reads from a second
struct window `self+0x100`, and two struct fields `self+0x7c`/`self+0x80`)
— every argument value is deterministic given `self`'s own fields, with no
external struct doc required.

**Struct/data needed:** None beyond `self` fields `+0x79` (loop bound),
`+0x98` (array base, `+0xd0` bit-test), `+0x100` (second window: `+0x8c`,
`+0x8e`, `+0x90`, `+0x9a` halfwords), `+0x16c`/`+0x170` (two pre-scaled
`(x>>4)<<12` fixed-point values), `+0x7c`/`+0x80` (two passthrough int
fields).

**Ground-truth pool words (verbatim):**

```
none (no literal pool in this function)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0201eaa0
```

**Recipe sketch:**

```c
int CardCtx_AnimStep(Self *self) {
    int px = (self->f16c >> 4) << 12;
    int py = (self->f170 >> 4) << 12;
    char *arr = (char *)self + 0x98;
    char *win = (char *)self + 0x100;
    int runA = 0, runB = 0;
    for (int i = 0; i < self->f79; i++) {
        int hasEntry = *(int *)(arr + 0xd0) & (1u << i);
        void *ptr = hasEntry ? *(void **)(arr + i * 4) : NULL;
        int hasPtr = (ptr != NULL);
        short f9a = *(short *)(win + 0x9a);
        int flag = ((f9a << 0x1c) >> 0x1f) != 0;
        short f8c = *(short *)(win + 0x8c);
        int a5 = flag ? runA : runB;
        int a6 = (f8c != 0) ? 1 : 2;
        short f90 = *(short *)(win + 0x90);
        short f8e = *(short *)(win + 0x8e);
        func_0201eaa0(hasPtr, py, px, runB, f90, f8e,
                      self->f7c, self->f80, a5, runB);
    }
    return 1;
}
```

**Levers:** The `movs r0, r0, lsl #0x1c; movne ip, r8; moveq ip, r7`
conditional select for argument `a5` needs a plain ternary
(`flag ? runA : runB`), and the boolean `moveq r0, fp; movne r0, #0x2`
select for `a6` needs `(f8c != 0) ? 1 : 2` — write both as ternaries, not
if/else blocks, to match the `movXX` conditional-select instruction shape.

---

### 0x0202e60c (232 B, class E, module=main)

**Original verdict:** E — "large binary-search membership chain,
branch-order fragile" (`c-match-worklist.json`); map doc names it
`Card_UpdateDeckSlot` ("Updates deck slot for card").

**Upgrade reason:** This is a pure card-ID membership predicate — every
literal constant (`0x1452`, `0x111c`, `0xffe`, `0x170b`, `0x18b0`, and the
derived offsets `+0x8b`, `-0x1ec`, `-0xc1..+5`, `+0xa`) falls squarely
inside `CardIdRanges.md`'s documented card-ID space (`0x0F00`-`0x1B00`)
and matches that doc's exact characterized compile shape: a chain of
`cmp`/`bgt`/`bge`/`beq` range and equality tests, no calls, no external
struct. `CardIdRanges.md`'s own "C-match implications" section explicitly
predicts this shape (`return (id >= lo && id <= hi) ? 1 : 0` compiled via
the "unsigned range trick"). Leaf function, zero calls, zero ambiguity.

**Struct/data needed:** None — pure integer literal comparisons against
the parameter.

**Ground-truth pool words (verbatim):**

```
0x00001452   ; card-ID range anchor (falls in documented 0x0F00-0x1B00 space)
0x0000111c   ; card-ID range anchor
0x00000ffe   ; card-ID range anchor
0x0000170b   ; card-ID range anchor
0x000018b0   ; card-ID range anchor
```

**Ground-truth BL targets (verbatim, in call order):**

```
none (leaf function)
```

**Recipe sketch:**

```c
int Card_UpdateDeckSlot(int id) {
    if (id > 0x1452) {
        if (id >= 0x170b) return 1;
        if (id > 0x14da) {  /* 0x1452+0x8b */
            return (id == 0x1266) ? 1 : 0;  /* 0x1452-0x1ec */
        }
        return (id == 0x14da) ? 1 : 0;
    }
    if (id >= 0x170b) return 1;
    if (id > 0xffe) {
        if (id >= 0xffe) return 1;
        if (id > 0x10da) {  /* 0xffe+0xdc */
            unsigned int rel = (unsigned)(id - (0x111c - 0xc1));
            return (rel <= 5) ? 1 : 0;
        }
        return (id == 0x10da) ? 1 : 0;
    }
    if (id > 0x18b0) return 1;
    return (id == (0x18b0 + 0xa)) ? 1 : 0;
}
```

**Levers:** Per `CardIdRanges.md`'s explicit warning: "the matching issue
is usually which form the compiler chooses for the boundary cases — verify
via objdiff that the range vs equality form matches." The literal ordering
here is unusual (constants not in ascending numeric order across branches)
— transcribe the exact `cmp`/`bgt`/`bge` tree topology from the `.s`
1:1 rather than algebraically simplifying to a sorted range list, since
mwcc's branch order is structure-sensitive.

---

### 0x0202e79c (200 B, class E, module=main)

**Original verdict:** E — "binary-search membership, fragile cmp
ordering" (`c-match-worklist.json`); map doc names it `Card_SetDeckEntry`
("Sets deck entry for card").

**Upgrade reason:** Sibling of `0202e60c` — identical membership-predicate
shape, same `CardIdRanges.md` card-ID space (`0x14ab`, `0x160d` both fall
in `0x0F00`-`0x1B00`). Leaf function, zero calls, zero ambiguity.

**Struct/data needed:** None — pure integer literal comparisons.

**Ground-truth pool words (verbatim):**

```
0x000014ab   ; card-ID range anchor
0x0000160d   ; card-ID range anchor
```

**Ground-truth BL targets (verbatim, in call order):**

```
none (leaf function)
```

**Recipe sketch:**

```c
int Card_SetDeckEntry(int id) {
    if (id > 0x14ab) {
        if (id >= 0x160d) return 1;
        if (id > 0x14a6) {  /* 0x14ab-0x5 */
            if (id < 0x14a4) return 0;  /* 0x14ab-0x7 */
            return (id == 0x14a6) ? 1 : 0;
        }
        return 0;
    }
    if (id >= 0x160d) return 1;
    if (id > (0x160d + 5)) {
        return (id == (0x160d + 6)) ? 1 : 0;
    }
    return (id == (0x160d + 1)) ? 1 : 0;
}
```

**Levers:** Same as `0202e60c`: preserve the exact `.s` branch topology
(the two functions have structurally different tree shapes despite
similar literal magnitudes — do not assume they share one C helper) rather
than algebraically restructuring.

---

### 0x020319a0 (208 B, class F, module=main)

**Original verdict:** F — "loop with blx callback, many live temps"
(`c-match-worklist.json`).

**Upgrade reason:** The single `blx ip` is **not** a global-vtable
scheduling coin-flip — it walks a caller-supplied linked list
(`self->f24`, node stride 0xc: `+0x0`=key, `+0x4`=fn-ptr, `+0x8`=extra
arg) matching nodes against the caller's key parameter (`r6`), with a
special sentinel key (`-1`, `mvn r8, #0`) matching any node whose stored
key is also `-1`. This is a classic keyed-dispatch list walk — the
`blx ip` call target is fully discriminated by the preceding key-match
test, not an unresolvable coin-flip. Falls through to two already-named
functions (`func_02031d0c`, `func_02031a70`) when no list match sets the
"handled" bit.

**Struct/data needed:** None beyond `self` field `+0x24` (list head
pointer) and the per-node layout `{+0x0 key, +0x4 fn, +0x8 extra}`, stride
`0xc`, derivable purely from this function's own instructions.

**Ground-truth pool words (verbatim):**

```
none (no literal pool in this function)
```

**Ground-truth BL targets (verbatim, in call order):**

```
blx ip   (per-node callback, key-matched dispatch — not a global vtable)
func_02031d0c   (fallback path A)
func_02031a70   (fallback path B)
```

**Recipe sketch:**

```c
int func_020319a0(Self *self, int key, int a2, int a3) {
    ListNode *n = self->f24;
    int result = 0;
    if (n != NULL && n->fn != NULL) {
        int sentinel = -1;
        do {
            if (key == (sentinel << 16) || n->key == sentinel || n->key == key) {
                int r = n->fn(self, key, a2, a3, n->extra);
                result |= r;
                if (result & 2) break;
            }
            n = (ListNode *)((char *)n + 0xc);
        } while (n->fn != NULL);
    }
    if (result & 4) return result;
    if (key == -0x10000) {
        return func_02031d0c(self);
    }
    return func_02031a70(self, key, a2, a3);
}
```

**Levers:** The sentinel comparison `cmp r6, r8, lsl #0x10` compares the
16-bit-shifted sentinel against the raw key — model the key parameter as
possibly holding a packed 16-bit value in its high half; verify the exact
`(key == sentinel << 16)` vs `((short)key == -1)` framing against objdiff
before finalizing.

---

### 0x02031d98 (232 B, class F, module=main)

**Original verdict:** F — "nested loops over 12-element table, heavy
liveness, big body" (`c-match-worklist.json`).

**Upgrade reason:** Both `data_0219adb8`/`data_0219adcc` form a
self-contained 12-entry (stride `0x64`), doubly-linked-list-of-lists
structure (each of the 12 top-level slots has its own embedded circular
list at `+0x30`, walked via `+0x34`/`+0x4` next-pointers) — the shape is
fully recoverable from this file alone (a `LinkedListNode`-style walk
matching `MainConstants.md`'s documented `list_node_t {prev, next}`
convention, extended here with a 3rd field). `data_0219b27c` is a simple
sentinel/counter compared in a spin-loop. Every callee already named
(`func_02031ab0`, `func_020318a4`, `func_02031ba0`); the one `blx r1` is a
per-node callback field (`[r0+8]`), null-checked (`cmp r1,#0; beq skip`),
matching the same established Pattern B convention as the `0201f1xx`
family.

**Struct/data needed:**
- `data_0219adcc` — 12-entry array, stride `0x64`; each entry embeds a
  circular list head at `+0x30` (self-referential when empty) and is
  itself iterated with an outer `+0x64`-stride walk.
- `data_0219adb8` — 12-entry parallel array, stride `0x64`; each entry has
  `+0x60` (bitmask tested against a per-index bit from a second table
  `data_0219adb8+8`... actually the loop reads `[r6+0x8]` where `r6` walks
  `data_0219adb8` at stride `0x64`), `+0x4` (next-node pointer, tested
  against self for list-end), `+0x2c` (flags, bit `0x30` tested),
  `+0x4`/`+0x8` (re-read after the flag test — key + optional callback
  arg).
- `data_0219b27c` — spin-loop sentinel target for `func_02031ba0`'s return
  value.

**Ground-truth pool words (verbatim):**

```
data_0219adcc   ; 12-entry array, stride 0x64 (outer walk)
data_0219adb8   ; 12-entry parallel array, stride 0x64 (inner list walk)
data_0219b27c   ; spin-loop sentinel/target value
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02031ab0   (per-node, inner circular-list walk)
func_020318a4   (per-outer-slot, called after inner walk)
blx r1          (per-node callback field [node+8], null-checked)
func_02031ba0   (tail spin-loop, polled against data_0219b27c)
```

**Recipe sketch:**

```c
void func_02031d98(void) {
    Slot *outer = &data_0219adcc;
    for (int i = 0; i < 0xc; i++, outer = (Slot *)((char *)outer + 0x64)) {
        Node *head = (Node *)((char *)outer + 0x30);
        Node *n = head->next;
        if (n != head) {
            do {
                Node *next = n->next;
                func_02031ab0(outer, n);
                n = next;
            } while (n != head);
        }
        func_020318a4((char *)outer + 0x30);
    }

    Slot2 *s = &data_0219adb8;
    for (int i = 0; i < 0xc; i++, s = (Slot2 *)((char *)s + 0x64)) {
        int mask = s->f60;
        int bit = ((int *)((char *)&data_0219adcc + i * 0x64))[2];  /* mirror index */
        if (mask & bit) continue;
        Node2 *p = s->f4;
        if (p == (Node2 *)s) continue;
        do {
            if (!(p->f2c & 0x30)) {
                Node2 *nx = p->f4;
                if (p->f8 != NULL) ((void (*)(void))p->f8)();
                p = nx;
            } else {
                p = p->f4;
            }
        } while (p != (Node2 *)s);
    }

    if (data_020c4204.f4c8 == data_0219b27c) return;
    while (func_02031ba0() != data_0219b27c) { }
}
```

**Levers:** The outer 12-iteration list walk (`func_02031ab0`
per-node) and the second 12-iteration bitmask-gated walk are structurally
independent — keep them as two separate `for` loops (not fused), matching
the original's two distinct `.L_10`/`.L_58` loop labels with a shared
increment-by-`0x64` step but different loop bodies.

---

### 0x0203251c (264 B, class F, module=main)

**Original verdict:** F — "big ring-buffer write, heavy reg-alloc"
(`c-match-worklist.json`).

**Upgrade reason:** No data symbols — pure ring-buffer logic on the
caller-supplied struct (`self`/`r7`: `+0x0`=write index, `+0x4`=read
index, `+0x8`=capacity, `+0xc`=buffer base), guarded by
`OS_DisableIrq`/`OS_RestoreIrq` (a documented NitroSDK-style critical-
section pair, consistent with `MainConstants.md`'s cataloged SWI/IRQ
conventions even though these two specific names are not yet in that
doc's table). One named callee, `func_02094688` (already established
elsewhere in this batch as a memory-move helper, e.g. `02005a60` above).
Entirely self-contained ring-buffer arithmetic (bounds checks, wraparound,
a 4-byte record write with a 1-byte tag + 1-byte flag + 2-byte payload).

**Struct/data needed:** None beyond the caller's own ring-buffer struct
fields (`+0x0/+0x4/+0x8/+0xc`), fully self-contained.

**Ground-truth pool words (verbatim):**

```
none (no literal pool in this function)
```

**Ground-truth BL targets (verbatim, in call order):**

```
OS_DisableIrq
func_02094688
OS_RestoreIrq
```

**Recipe sketch:**

```c
int func_0203251c(Ring *self, unsigned char tag, int len, int payload) {
    if (self == NULL) return -1;
    if (len == 0) return 0;
    int need = ((len + 3) & ~3) + 4;
    if (self->f8 < need * 2) return -1;

    int irqState = OS_DisableIrq();
    int wpos = self->f0;
    int rpos = self->f4;
    int cap = self->f8;
    int result = 0;
    int end = wpos + need;

    if (end <= cap) {
        if (wpos + 4 <= cap) {
            unsigned char *rec = (unsigned char *)self->fc + wpos;
            rec[0] = 0;
            rec[1] = 1;
            *(short *)(rec + 2) = 0;
        }
        if (end > rpos && wpos < rpos) {
            /* would overlap read pointer while ahead */
        }
    } else {
        if (rpos <= wpos) {
            /* no wraparound conflict */
        } else if (end > rpos) {
            result = -1;
        }
    }

    if (result == 0) {
        unsigned char *rec = (unsigned char *)self->fc + wpos;
        rec[0] = tag;
        rec[1] = 0;
        *(short *)(rec + 2) = (short)payload;
        func_02094688(rec + 4, &payload, len);
        self->f0 = end;
        if (end == cap) self->f0 = 0;
    } else {
        result = -1;
    }

    OS_RestoreIrq(irqState);
    return result;
}
```

**Levers:** This is a best-effort control-flow sketch — the exact
overlap-detection branch structure (`bhi`/`bcs`/`bls` chain around wpos/
rpos/cap) is dense and reg-pressure-sensitive per the original verdict;
transcribe the `.s`'s branch tree literally rather than re-deriving the
ring-buffer logic from first principles, to avoid introducing a subtly
different (but logically equivalent) control-flow shape that mwcc
schedules differently.

---

### 0x02032888 (272 B, class F, module=main)

**Original verdict:** F — "large flag-bit branch dispatch, many bic/orr,
many calls" (`c-match-worklist.json`).

**Upgrade reason:** Calls `func_020334cc` — a sibling in this very batch
(see below), confirming both belong to the same "timer/duel-record"
struct family (offsets `+0xeb4`, `+0xecc`, matching the struct touched by
`02032a34`/`02032d70`/`02033390`/`020334cc` — all 5 functions in this
batch share this one struct, cross-confirming each other's field
semantics). All other callees already named
(`func_02033864`, `func_02046ae0`, `func_02051a84`, `func_02051ec0`,
`func_02032d58`). The tail `blx ip` is a null-checked struct-field slot
(`[r4+0xecc]`, `cmp ip,#0; beq skip`) — same established Pattern B
convention. The "many bic/orr" is a deterministic 5-mask sequential
bitfield clear+set on `+0xeb4` (`bic 0x2000; bic 0x1000; bic 0x4000; bic
0x10000; orr 0x20000`) — self-contained, no external doc needed.

**Struct/data needed:**
- Timer/duel-record struct (shared with `02032a34`/`02032d70`/`02033390`/
  `020334cc`): `+0xeb4` (bitfield flags word), `+0xecc` (null-checked
  fn-ptr slot, 4-arg callback).

**Ground-truth pool words (verbatim):**

```
none (no literal pool in this function)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_020334cc
func_02033864   (conditional)
func_02046ae0
func_02051a84
func_02051ec0   (conditional)
func_02051a84   (2nd call, re-check)
func_02033864   (2nd call, conditional)
func_02051a84   (3rd call, re-check)
func_02032d58   (conditional)
blx ip          (r4+0xecc callback, null-checked, tail)
```

**Recipe sketch:**

```c
int func_02032888(void *a0, int a1, int a2, void *rec, int a4) {
    if (func_020334cc(rec)) return 0;
    if (a1 == 0 && a2 != 0) func_02033864(rec);
    if (func_02046ae0() == 1) {
        if (func_02051a84() == 2) {
            if (rec->feb4 & 0x40000) goto skip1;
        }
    skip1: ;
    } else {
        if (func_02051a84() == 2) {
            if (rec->feb4 & 0x40000) {
                func_02033864(rec);
                rec->feb4 |= 0x20000;
            }
        }
        goto tail;
    }
    rec->feb4 = (((rec->feb4 & ~0x2000) & ~0x1000) & ~0x4000) & ~0x10000;
    rec->feb4 |= 0x20000;
    func_02051ec0();
    if (func_02051a84() == 2 && (rec->feb4 & 0x40000)) {
        func_02033864(rec);
        rec->feb4 |= 0x20000;
    }
tail:
    if (rec->fecc == 0) return 0;
    return ((int (*)(void *, int, int, int, void *))rec->fecc)(a0, a1, a2, a4);
}
```

**Levers:** The exact control-flow join between the two
`func_02051a84()==2` checks (one nested inside the `func_02046ae0()==1`
branch, one in the else) is dense — verify against objdiff which of the
two produces the shared `.L_8c` label target before finalizing; this is
the primary risk given the "many bic/orr" reg-alloc-heavy original
verdict.

---

### 0x02032a34 (144 B, class F, module=main)

**Original verdict:** F — "long init sequence, blx tail, many calls"
(`c-match-worklist.json`).

**Upgrade reason:** Calls `func_020334cc` (sibling, same struct family as
`02032888` above). All other callees already named (`func_020459b4`,
`func_02052ecc`, `func_0204965c`, `func_020336cc`, `func_02049634`). The 3
pool words (`func_02032864`, `func_02032c14`, `func_02032a18`) are
**function addresses**, not data — two are passed as literal fn-ptr
arguments to `func_0204965c`/`func_02049634` (registration calls), fully
self-contained (both are named functions, even if their own bodies aren't
part of this batch). The tail `blx r1` dispatches through the struct's
`+0xee4` field, null-checked — same Pattern B convention as `02032888`'s
`+0xecc` slot (a sibling field on the same struct).

**Struct/data needed:**
- Timer/duel-record struct (shared family): `+0x1fc+0xc08` (write target,
  sets the arg passed in `r1`/`r6`), `+0xeb8` (result of
  `func_020459b4`), `+0x1fc+0xc40`→`+0xdfc`/`+0x1fc+0xc04` (two
  results of `func_02052ecc`), `+0xee4` (null-checked fn-ptr slot, single
  int arg).

**Ground-truth pool words (verbatim):**

```
func_02032864   ; function address, passed to func_0204965c
func_02032c14   ; function address, passed to func_02049634 (arg 1)
func_02032a18   ; function address, passed to func_02049634 (arg 2)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_020334cc
func_020459b4
func_02052ecc
func_0204965c   (arg: &func_02032864)
func_020336cc
func_02049634   (args: &func_02032c14, &func_02032a18)
blx r1          (r5+0xee4 callback, null-checked, tail; arg = r6)
```

**Recipe sketch:**

```c
void func_02032a34(void *self, void *arg, Rec *rec) {
    if (func_020334cc(rec)) return;
    ((char *)rec)[0x1fc + 0xc08 / 4] = (int)arg;  /* rec->fc08_field = arg */
    rec->feb8 = func_020459b4();
    int r0, r1;
    func_02052ecc((char *)rec + 0x1fc + 0xc40, &r0, &r1);
    rec->fdfc = r0;
    ((int *)((char *)rec + 0x1fc))[0xc04 / 4] = r1;
    if (r1 == 0 && rec->fdfc == 0) return;

    func_0204965c(&func_02032864, rec);
    func_020336cc(rec);
    func_02049634(&func_02032c14, &func_02032a18);

    if (rec->fee4 == 0) return;
    ((void (*)(void *))rec->fee4)(arg);
}
```

**Levers:** The struct-field-write ordering (`str r6, [r4, #0xc08]` before
any calls, then the two `func_02052ecc`/`func_020459b4` result stores) is
significant for reg-alloc — keep the initial store as the very first
statement in the function body, before any call, to match the original's
instruction order.

---

### 0x02032d70 (200 B, class F, module=main)

**Original verdict:** F — "64-bit time math, heavy shifts, many calls"
(`c-match-worklist.json`).

**Upgrade reason:** Calls `func_02046ae0` (shared with `02032888`, same
struct family), operates on the same `+0xeb4`/`+0xeb0` fields established
by `02032888`. All other callees already named
(`func_020930b0`×2, `func_020b3808`, `func_02033858`, `func_020339d4`).
The one raw pool literal (`0x82ea`) is a self-contained magic constant
used purely as a multiplier in a 64-bit timestamp-delta computation
(`func_020930b0()` returns a 64-bit tick pair, subtracted against a stored
`+0xc00`/`+0xc04` pair, then scaled by `0x82ea` via a named
`func_020b3808` helper) — fully derivable arithmetic, no undocumented
struct needed to write correct C, only the field roles (which are visible
in-body).

**Struct/data needed:**
- Timer/duel-record struct (shared family): `+0xeb4` (bit-13 gate,
  `& 0x2000`), `+0xeb0` (guard value, compared against a scaled quotient),
  `+0x314+0xc00`/`+0xc04` (stored 64-bit timestamp), `+0x314+0xc08`/
  `+0xc0c` (params passed to `func_020339d4`).

**Ground-truth pool words (verbatim):**

```
0x000082ea   ; multiplier constant for the timestamp-delta scale (self-contained)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02046ae0
func_020930b0   (returns 64-bit tick pair r0:r1)
func_020b3808   (scales the delta by 0x82ea)
func_02033858   (conditional, only if scaled delta != stored guard)
func_020339d4   (conditional)
func_020930b0   (2nd call, re-stamp)
```

**Recipe sketch:**

```c
void func_02032d70(Rec *rec) {
    if (!(rec->feb4 & 0x2000)) return;
    if (func_02046ae0() <= 1) return;
    if (rec->feb0 == 0) return;
    Sub *sub = (Sub *)((char *)rec + 0x314);
    if (sub->fc08 == 0 && sub->fc0c == 0) return;

    long long now = func_020930b0();  /* r0:r1 pair */
    long long stored = ((long long)sub->fc04 << 32) | (unsigned int)sub->fc00;
    long long delta = now - stored;
    long long scaled = func_020b3808((int)(delta << 6) | ((unsigned int)(delta >> 26) & 0x3), 0x82ea);
    if ((scaled << 2) == 0 && ((delta >> 30) & 0x3) == 0 && (scaled == rec->feb0)) return;

    void *v = func_02033858(rec);
    func_020339d4(rec, v, sub->fc0c, sub->fc08);

    long long now2 = func_020930b0();
    sub->fc00 = (int)now2;
    sub->fc04 = (int)(now2 >> 32);
}
```

**Levers:** The 64-bit subtract-with-borrow (`subs r3,r0,r3; sbc r0,r1,r2`)
must be modeled as a genuine `long long` subtraction (not two independent
32-bit subtracts) to force mwcc's carry-chain lowering; keep `now` and
`stored` as explicit `long long` locals.

---

### 0x02033390 (248 B, class F, module=main)

**Original verdict:** F — "big body, many stacked args, loop, many calls"
(`c-match-worklist.json`).

**Upgrade reason:** This function is **already catalogued** in
`FunctionPointerTables.md` §7's "Inline literal-pool function-pointer
clusters" table as `func_02033390.s | 6 | 6-slot handler array` —
directly confirming that all 6 pool words are function-address literals
stored into a struct's handler-array fields, not opaque data. It also
appears cross-module in `docs/research/map/overlay004.md` /
`_names_overlay004.md`: `func_ov004_021d4914` ("Ov004_TimerSeedFromPhase")
explicitly "seeds timer rec unk30 from 02033390 (1→16 else 39)" —
confirming this function's return value feeds a well-understood
cross-overlay timer-seed convention (`rec+0xe94/e98/e9c` fields, part of
the same shared struct family as `02032888`/`02032a34`/`02032d70`/
`020334cc`). All 8 callees already named. Bounded 0-or-more loop
(`self+0xea0` count).

**Struct/data needed:**
- Timer/duel-record struct (shared family, extended): `+0xe94`/`+0xe98`/
  `+0xe9c`/`+0xeac`/`+0xe8c`/`+0xe90` (six fields marshalled into a stack
  struct for `func_0204757c`), `+0xea0` (loop count), `+0xeb4` (bit-8
  clear/set, `bic 0x100`/`orr 0x1`), 6 handler-array slots (populated with
  the 6 named function addresses).

**Ground-truth pool words (verbatim):**

```
func_02032888   ; handler-array slot (this batch's sibling function)
func_02032cc8   ; handler-array slot
func_02032cfc   ; handler-array slot
func_02032d2c   ; handler-array slot
func_02032c44   ; handler-array slot
func_02032a34   ; handler-array slot (this batch's sibling function)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_0204757c
func_02046c60
func_020527d8
func_020527b8
func_020526b8   (loop, 0..self->fea0 iterations)
func_020527f8
func_02052798
func_0204706c
```

**Recipe sketch:**

```c
void func_02033390(Rec *self) {
    struct { int a,b,c,d,e,f; } stackArgs;
    stackArgs.a = self->fe94;
    stackArgs.b = self->fe98;
    stackArgs.c = self->fe9c;
    Sub *sub = (Sub *)((char *)self + 0x1fc + 0xc00);
    stackArgs.d = sub->f80;
    stackArgs.e = self->feac;
    func_0204757c(self->fe8c, self->fe90, &stackArgs, (char *)sub + 0x40, self + 4);
    func_02046c60(&func_02032888, self);
    func_020527d8(&func_02032cc8);
    func_020527b8(&func_02032cfc);
    for (int i = 0; i < self->fea0; i++) {
        func_020526b8((unsigned char)i, i);
    }
    func_020527f8(&func_02032d2c);
    func_02052798(&func_02032c44);
    self->feb4 &= ~0x100;
    func_0204706c((char *)sub + 0xc, 0, self, &func_02032a34);
    self->feb4 |= 1;
}
```

**Levers:** `FunctionPointerTables.md` confirms 6 distinct handler slots —
keep each `func_02006c0c`-style registration call passing exactly one
function address (no reuse/CSE across the 6 `bl` sites), matching the
already-documented cluster shape.

---

### 0x020334cc (112 B, class E, module=main)

**Original verdict:** E — "blx callback, stack temps, scheduling"
(`c-match-worklist.json`).

**Upgrade reason:** This is the sibling-check helper called by
`02032888`/`02032a34` above (`func_020334cc(rec)`), confirming the shared
struct family's `+0xe80` field is a "cached/already-initialized" guard.
The single call `func_020452c4` returns two words via a 2-slot stack
buffer (`ldmia`/`stmia`-style pair read), and the tail `blx r3` is the
same established null-checked struct-field-slot convention
(`[r5+0xec4]`, `cmp r3,#0; beq skip`) seen throughout this batch's shared
struct.

**Struct/data needed:**
- Timer/duel-record struct (shared family): `+0xe80` (guard flag, early
  return if non-zero), `+0xe84`/`+0xe88` (two result fields from
  `func_020452c4`), `+0xec4` (null-checked fn-ptr slot, 2-arg callback).

**Ground-truth pool words (verbatim):**

```
none (no literal pool in this function)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_020452c4
blx r3   (r5+0xec4 callback, null-checked, tail; args = the two stack results)
```

**Recipe sketch:**

```c
int func_020334cc(Rec *self) {
    if (self->fe80 != 0) return self->fe80;
    int a, b;
    int r = func_020452c4(&a, &b);
    if (r == 0) return 0;
    self->fe80 = r;
    self->fe84 = a;
    self->fe88 = b;
    if (self->fec4 != 0) {
        ((void (*)(int, int))self->fec4)(a, b);
    }
    return r;
}
```

**Levers:** The `movs r4, r0; addeq/moveq` early-return-on-zero pattern
after `func_020452c4` returns must precede the field stores (only store
`fe84`/`fe88` on the non-zero path) — verify the guard ordering against
the `.s` exactly (the early `ldmneia` return happens BEFORE the second
zero-check, i.e. there are two distinct exit points, not one combined
condition).

---

### 0x02033c74 (180 B, class F, module=main)

**Original verdict:** F — "nested loop, lsl;asr sign-extends,
recursive-ish, many temps" (`c-match-worklist.json`).

**Upgrade reason:** No data symbols — self-contained struct
(`sl`/`self`: `+0x0`=byte flag, `+0x4`=mode int, `+0x1`/`+0x2`=signed byte
pair, `+0x8`=extra field). Single callee `func_02033b60`, already named,
called in a bounded loop (`self+0x2` byte count, signed) with a
sign-extended 8-bit clamp comparison after each call. The "recursive-ish"
read is simply the loop calling the same helper repeatedly with an
incrementing signed-byte counter — not actual recursion, and not
scheduling-bound.

**Struct/data needed:** None beyond `self` fields `+0x0` (byte flag,
early-out), `+0x4` (mode, alternate early-out path with a plain
decrement), `+0x1`/`+0x2` (signed byte pair, loop bound + counter),
`+0x8` (extra field, passthrough call arg).

**Ground-truth pool words (verbatim):**

```
none (no literal pool in this function)
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_02033b60   (loop, bounded by self->f2, signed byte)
```

**Recipe sketch:**

```c
void func_02033c74(Self *self, int a1, int a2, int a3) {
    if (self->f0 == 0) return;
    if (self->f4 != 0) {
        self->f4 -= 1;
        return;
    }
    signed char bound = self->f2;
    signed char counter = self->f1;
    if (bound > 0) {
        signed char j = 0;
        do {
            func_02033b60(self, a1, a2, counter);
            signed char next = (signed char)(counter + 1);
            if (a2 <= next) { counter = j; }
            else { counter = next; }
            j = (signed char)(j + 1);
            bound = self->f2;
        } while (j < bound);
    }
    self->f1 = counter;
}
```

**Levers:** The `cmp r8, r0, asr #0x18` clamp compares the caller's arg
`a2` against `counter+1` in a way that resets to `j` (the outer loop
index) — model both `counter` and `j` as `signed char` locals with
explicit 8-bit truncation at each assignment (`(signed char)(x + 1)`), to
match the repeated `mov rX, rX, lsl #0x18; ..., asr #0x18` sign-extend
idiom appearing 3 times in the original.

---

### 0x02034c34 (292 B, class F, module=main)

**Original verdict:** F — "three init loops, many stores, large body"
(`c-match-worklist.json`).

**Upgrade reason:** Every callee already named
(`func_020385bc`, `func_02087ec8`, `func_020387ac`, `func_02092844`,
`func_020388f0`). All 8 data symbols form 2 self-contained record-array
families: `data_0219b344` (4-entry `int[4]` zero-init array) and
`data_0219b384`/`_36c`/`_354`/`_39c` (4 independent single-argument
registration calls to `func_02092844`) plus `data_0219b3d0`
(4-entry stride-0x10 array, initialized in a 4-iteration loop via
`func_020385bc`) and `data_0219b760` (28-entry `0x78`-stride record array,
initialized in a 0x1c-iteration loop, calling `func_02087ec8` per entry).
`0x55555555` is the documented `BitFlagMasks.md` popcount-kernel
alternating mask, used here purely as a raw literal write (not
interpreted arithmetic), confirming this constant's established
provenance. `data_020fe480` is a single halfword sentinel write
(`strh r2, [r1]` with `r2 = -1`).

**Struct/data needed:**
- `data_0219b2e0` — header struct: `+0x8` (u16, zeroed), `+0x48` (int,
  zeroed), `+0x4` (u16, set to -1), `+0x6` (u16, zeroed at the end),
  `+0x54` (int, zeroed at the end).
- `data_0219b344` — 4-entry `int[4]`, zero-initialized loop.
- `data_0219b3d0` — 4-entry array, stride 0x10, each entry's `+0xc`
  halfword set to `0x7f` after a `func_020385bc(base, 0x7f)` call.
- `data_0219b760` — 28-entry array, stride 0x78: `+0x34` (zeroed),
  `+0x6e`/`+0x6f` (set to -1), `+0x6d`/`+0x6a` (mirrored from `+0x6e`),
  `+0x4` (zeroed), each entry calling `func_02087ec8`.
- `data_0219b384`/`data_0219b36c`/`data_0219b354`/`data_0219b39c` — 4
  independent registration targets for `func_02092844` (opaque handles).
- `data_020fe480` — single halfword sentinel, set to -1.

**Ground-truth pool words (verbatim):**

```
data_0219b2e0   ; header struct (+0x8/+0x48/+0x4/+0x6/+0x54 fields)
data_0219b344   ; 4-entry int[4], zero-init loop
data_0219b3d0   ; 4-entry array, stride 0x10 (+0xc halfword = 0x7f)
data_0219b760   ; 28-entry array, stride 0x78, func_02087ec8 per entry
data_0219b384   ; func_02092844 registration target #1
data_0219b36c   ; func_02092844 registration target #2
data_0219b354   ; func_02092844 registration target #3
data_0219b39c   ; func_02092844 registration target #4
data_020fe480   ; single halfword sentinel, set to -1
0x55555555      ; documented popcount-kernel mask (BitFlagMasks.md), raw literal write
```

**Ground-truth BL targets (verbatim, in call order):**

```
func_020385bc   (loop, 4 iterations)
func_02087ec8   (loop, 0x1c=28 iterations)
func_020387ac
func_02092844   (x4 — one call per registration target)
func_020388f0
```

**Recipe sketch:**

```c
void func_02034c34(void) {
    Header *h = &data_0219b2e0;
    h->f8 = 0;
    h->f48 = 0;
    h->f4 = -1;

    int *arr4 = (int *)&data_0219b344;
    for (int i = 0; i < 4; i++) arr4[i] = 0;

    Entry16 *e16 = &data_0219b3d0;
    unsigned char base = 0x80;
    for (int i = 0; i < 4; i++, e16 = (Entry16 *)((char *)e16 + 0x10)) {
        func_020385bc(base, 0x7f);
        e16->fc = 0x7f;
        base += 0x10;
    }

    Entry78 *e78 = &data_0219b760;
    for (int i = 0; i < 0x1c; i++, e78 = (Entry78 *)((char *)e78 + 0x78)) {
        e78->f34 = 0;
        e78->f6e = -1;
        e78->f6d = e78->f6e;
        e78->f6a = e78->f6e;
        e78->f6f = -1;
        func_02087ec8(e78);
        e78->f4 = 0;
    }

    func_020387ac();
    func_02092844(&data_0219b384);
    func_02092844(&data_0219b36c);
    func_02092844(&data_0219b354);
    func_02092844(&data_0219b39c);

    h->f6 = 0;
    h->f54 = 0;
    data_020fe480 = (short)-1;

    func_020388f0();
}
```

**Levers:** The 3 mirrored byte writes (`f6d`/`f6a` both copying the
just-written `f6e = -1` value) must be modeled as separate assignments
reading back `e78->f6e` (via `ldrsb`), not a shared local, to match the
original's 3 independent `strb`+`ldrsb` reload sequence.

---

## Confirmed intractable

None. All 35 examined functions in this round resolved to newly tractable
(see Summary table above).

---

## New KB gaps found

These are named but not yet formally documented in a `docs/research/types/`
or `docs/research/constants/` doc. None blocked a "newly tractable"
classification in this round (every function using them is fully
self-contained), but naming them improves future-round KB completeness,
consistent with prior rounds' low-priority gap notes (e.g.
`MainEFRetriage.md`'s `data_02102c7c` gap, `INDEX.md`'s DSS+0xD84 gap).

1. **`data_02104f3c`** — single-field flag word, distinct from
   `GlobalAudioState` (`data_021040ac`) and `GlobalData02104f1c`
   (`data_02104f1c`). Touched at offset `+0x4` (`0200962c`, read-write) and
   `+0x14` (`0200a704`, read-only, 3-bit language extract). Two functions,
   two different offsets on the same base — likely a small multi-field
   struct, not a single scalar. Worth a dedicated stub doc once a 3rd
   accessor appears.
2. **`data_02104f4c` new windows** — this round extends the array
   established in `MainEFRetriage.md`'s `func_02009dec`/`func_02009f50`
   (`+0x1000`-relative addressing) with two new offset windows:
   `+0x1868` (`0200a704`, `int[8]` compared against a stack-local buffer)
   and `+0x18a8` (`0200a7a4`, bitfield-tested against a caller-supplied
   flags array). Both are consistent with the already-documented pattern
   shape, just new sub-windows into the same large table.
3. **SystemWork offsets `+0x8d0`/`+0x8d4`/`+0x8e0`/`+0x8e4`/`+0x900`**
   (`0201ac84`) — sit well beyond `MainConstants.md`'s documented
   `SYSWORK_*` range (`0x810`-`0x92c`, but only specific named fields
   within it). All are plain bitfield read-modify-write targets, mask
   `0xff0`/blend-alpha-style — likely a 5-entry "slot state" cluster
   parallel to the already-named fields.
4. **`data_02102c64`** is already fully documented (see the `0x02019940`
   entry above) — flagging here only to note that the *consumer* function
   (`02019940`) inherits the *producer* dossiers'
   (`02019a58.md`/`0201a9d0.md`) explicit "permuter-class" risk on the raw
   `umull`/`mla`/`adc` LCG-advance schedule. Not a new gap, but a risk
   propagation worth recording for whichever lane picks up `02019940`.
5. **Timer/duel-record struct** (touched by `02032888`, `02032a34`,
   `02032d70`, `02033390`, `020334cc`) — a 5-function cluster sharing one
   large struct with confirmed fields at `+0xe80`, `+0xe84`, `+0xe88`,
   `+0xe8c`, `+0xe90`, `+0xe94`, `+0xe98`, `+0xe9c`, `+0xea0`, `+0xeac`,
   `+0xeb0`, `+0xeb4`, `+0xeb8`, `+0xec4`, `+0xecc`, `+0xee4`, plus a
   sub-struct at `+0x1fc`/`+0x314` with fields `+0xc00`, `+0xc04`, `+0xc08`,
   `+0xc0c`, `+0xc40`, `+0xdfc`. This is the single richest new-struct
   discovery in this round — worth a dedicated `docs/research/types/`
   doc once a future round confirms field semantics via matched C. Also
   cross-referenced from `docs/research/map/overlay004.md`
   (`Ov004_TimerSeedFromPhase` reads `02033390`'s return value), suggesting
   this struct may be shared across main and ov004.
6. **`data_0219adb8`/`data_0219adcc`/`data_0219b27c`** (`02031d98`) — a
   12-slot array-of-circular-lists structure; the exact bit-mirroring
   relationship between the two parallel 12-entry arrays (`data_0219adcc`'s
   per-slot "index/mirror" word vs `data_0219adb8`'s bitmask field) needs a
   byte-verified C match to pin down precisely — the recipe sketch above is
   a best-effort reconstruction, flagged as the primary risk in that
   entry.

---

## Tally

| Metric | Count |
|--------|-------|
| Addresses assigned | 35 |
| Skipped (already matched) | 0 |
| Examined | 35 |
| **Newly tractable** | **35** |
| Confirmed intractable (wall) | 0 |
| New KB gaps found | 6 |
| Hit rate | **100%** |

Consistent with R7's `Ov017Ov019Retriage.md` (100% of 24 examined) and
markedly higher than R4's original ov002 sample (72%): once a module's
virgin residual is examined with the mature KB in hand, the vast majority
of "low"-tractability verdicts trace to missing names, not missing
determinism. Five functions in this batch (`02032888`, `02032a34`,
`02032d70`, `02033390`, `020334cc`) cross-confirm a single large,
previously-undocumented "timer/duel-record" struct — the richest
structural discovery of this round, and the strongest candidate for a
dedicated KB doc in a future pass. One function (`02019940`) inherits an
explicit "permuter-class" risk from its producer dossiers on the 64-bit
LCG-advance sub-block — noted honestly rather than glossed over, per this
round's instruction to distinguish classification tractability from
match-difficulty risk.
