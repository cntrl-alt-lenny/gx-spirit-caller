[//]: # (markdownlint-disable MD013 MD041)

# ov000 Deep Retriage (round 2 — the 26 never-examined hard-tier funcs)

ov000 has 32 class E/F hard-tier functions total. The first retriage pass
(`docs/research/retriage/OverlayEFRetriage.md`, "ov011, ov000, ov013, ov021
Newly Tractable Funcs" section) only reached **8 of 32** — it found 4
newly-tractable (`0x021AC72C`, `0x021AA8D4`, `0x021AB798`, `0x021AC920`,
`0x021AC098` — that's actually 5 addresses; the section header says "4 found
tractable" counting `021ab798`/`021ac098` together as one pattern-family
credit) plus `0x021AB01C` confirmed `tract=never`. **26 functions were never
looked at.** This document gives every one of them the full second pass,
cross-referencing the KB that has grown since: `OverlayConstants.md`,
`OverlayConstantsExtended.md`, `Ov004Ov006DataTables.md`,
`OverlayDataGlobs.md`, `GlobalData02102c7c.md`, and — critically — the
byte-proven `src/overlay000/ov000_core.h` (co-drain briefs 317/319/321) and
the semantic map `docs/research/map/overlay000.md`, both of which already
diagnose most of these 26 as either shipped-`.s`-by-design or dedicated-RE
targets. Nothing here duplicates an existing `.c` match.

**Result: 26 examined, 2 newly tractable as clean single-purpose recipes, 3
more written up as byte-verified twin/near-twin pairs that halve to "same
struct, different table row" (net new modeling effort ~2), 21 confirmed
intractable with a named, specific wall** (mostly the previously-flagged
fixed-point/permuter class and multi-field bitfield-PACK class — this round's
contribution is turning "low, complex" into a *precise, named* reason with
exact pool constants and callee targets, not new matches). This matches
`ov000_core.h`'s own thinning verdict for this address range (wave 3: "36 ->
39", the residue explicitly named as fixed-point math, multi-field PACKs, and
command-record builders) — this deep pass independently re-derives and
confirms that verdict function-by-function rather than superseding it.

Two twin pairs confirmed structurally identical (same struct/computation,
register-allocation-only or single-constant-row difference):
`0x021ABE64`/`0x021ABEC8` (bitfield-unpack-and-scale, byte-identical formula)
and `0x021AD660`/`0x021AD8DC` (dual VRAM/task command-record builder, same
0x27C-byte body differing only in the data-table row and one constant).

---

## Newly tractable

### 0x021AE218 (180B, class F, overlay=ov000)

**Original verdict:** low — "5 calls, 6 branches, guard-chain control flow"

**Upgrade reason:** This is a plain **input-event handler**, not a struct
puzzle. It reads `data_02104bac+0x54` (documented in `OverlayDataGlobs.md`
"Main BSS globals accessed from overlays" — `data_02104bac` "+0xa8 (new;
u16)"; this function is the sibling access at +0x54) and tests bit 0. If that
bit is set, or `func_02006164()` (a button/stick-state poll, same idiom as
`func_ov000_021ac578`/`021ae69c` below) returns nonzero, it walks the ov000
config struct `data_ov000_021c758c` at the byte-proven offsets `+0x270`
(bits 20/21/22 — matches the `ov000_core.h` "+0x270" family already used by
`021ae654`/`021af47c`) and conditionally fires a `func_02001e84`/`func_02001e5c`
"is idle" check pair (same pair already MATCHED at the call sites in
`func_ov000_021aed8c`, see below — `func_02001e84` then `func_02001e5c` is a
confirmed idiom: "run the immediate check, if it says busy fall back to the
polling check"). If both checks say idle, it posts toast id `0x9b - 0x9c = -1`
via `func_02037208(msg, -1, 0, 1)` — the exact `func_02037208(ID,-1,0,a3)`
signature already banked in `ov000_core.h` ("`func_02037208(int id, int a1,
int a2, int a3)` status/notify; a1 conv. -1 (mwcc derives -1 as `(56-57)`
reusing the id reg)" — here it's `(0x9b - 0x9c)` reusing r0, same lever).
Finally it always calls `func_02001e5c(&cfg+0x1ac)` once more and, if it
returns nonzero, clears bit 11 of `+0x270`.

This was marked "orchestrator tier — dedicated RE" in `ov000_core.h`'s wave-2
wall list ("021ae218 / 021adc50: complex orchestrators… dedicated RE") —
that note is accurate about the *shape* (nested nested nothing tricky, just
many guard branches) but the struct facts needed to model it (the `+0x270`
bit layout, the `func_02001e84`/`func_02001e5c` idle-check pair, and the
`ID,-1,0,a3` toast idiom) are now all separately confirmed elsewhere in the
KB, so the "dedicated RE" is now a mechanical transcription, not open
research. Upgrading class F -> tractable.

**Struct/data needed:** `data_02104bac` (SystemWork-adjacent joypad/input
state, +0x54 bit 0 — extends the existing +0xa8 u16 entry in
`OverlayDataGlobs.md`); `data_ov000_021c75c4` (config struct, bits at +0x270
per `ov000_core.h`).

**Ground truth (verbatim):**
- `.word data_02104bac`, `.word data_ov000_021c75c4` — the only two pool words.
- `bl func_02006164` — button/idle poll (same callee as `021ac578`/`021ae69c`).
- `bl func_02001e84` — first idle probe.
- `bl func_02001e5c` — second idle probe (called twice total in this function).
- `bl func_02037208` — toast/notify, args `(0x9b-0x9c, 0, 1)` = `(-1, 0, 1)`.

**Complete C sketch:**

```c
extern short data_02104bac[];              /* joypad/input state; +0x54 bit0 */
extern char  data_ov000_021c75c4[];         /* config struct */
extern int   func_02006164(void);
extern int   func_02001e84(void *cfg_1ac);
extern int   func_02001e5c(void *cfg_1ac);
extern void  func_02037208(int id, int a1, int a2, int a3);

void func_ov000_021ae218(void) {
    struct { char pad[0x54]; unsigned short f54; } *in =
        (void *)data_02104bac;
    char *cfg = data_ov000_021c75c4;
    if (!(in->f54 & 1)) {
        if (!func_02006164()) return;
    }
    int *f270 = (int *)(cfg + 0x270);
    if ((*f270 & (1 << 20)) && !(*f270 & (1 << 22))) {
        int busy = func_02001e84(cfg + 0x1ac);
        if (!busy) busy = func_02001e5c(cfg + 0x1ac);
        if (busy) goto ready_check;
    }
    if (!(*f270 & (1 << 21))) {
        func_02037208(0x9b - 0x9c, 0, 1, 0);   /* id = -1 via r0-reuse */
    }
ready_check:
    *f270 |= (1 << 9);           /* orr #0x200 */
    if (func_02001e5c(cfg + 0x1ac)) {
        *f270 &= ~(1 << 11);     /* bic #0x800 */
    }
}
```

Note: exact bit numbering for `+0x270` should be re-verified against the
literal `.word` masks (`0x100000`/`0x400000`/`0x200000`/`0x200`/`0x800`) at
build time — the masks above are read directly off the `.s` immediates, not
guessed, but the C encoding of "which named flag" may shuffle vs the real
enum once one exists.

---

### 0x021AE2CC (200B, class F, overlay=ov000)

**Original verdict:** low — "mla-indexed struct, stack-arg marshalling, 5 calls"

**Upgrade reason:** Structurally this is `Ov000_ProcessTouchInput` (already
named in `docs/research/map/overlay000.md` line 122, MED confidence) — the
sibling to `021ae218` above. It indexes the mode-word derived offset into
`data_ov000_021b56b4` exactly like `021ae394`'s already-drafted recipe
(`docs/research/c-match-prep/021ae394.c`: "table data_ov000_021b56b4 (row =
a0*0x28 + 8, two shorts at +0/+2 reused)") — confirming the `0x28`-stride /
`+8`-short-pair table shape independently. It calls the already-tractable
`func_ov000_021adf18` (`Ov000_ScanTextNewline`, one of this same batch — see
below, also newly clean) and the already-confirmed
`func_ov000_021add24`/`Ov000_ComputeTextOffset` (MATCHED, HIGH). The three
`_unk` callees (`func_ov000_021b33d8_unk`, `021b33f8_unk`, `021b3474_unk`)
are named `Ov000_UnkStub_33d8/33f8/3474` in the map (LOW confidence, but
`extern` + `bl`-reloc already resolves regardless of body — per
`ov000_core.h`'s note that these overlay-overlap-zone placeholders "still
match" via reloc). The remaining work is pure stack-arg transcription: build
a `{scan_result, table_row_val, 0}` triple on the stack and pass it to
`func_ov000_021b33f8_unk` by `ldmia`.

**Struct/data needed:** `data_ov000_021c758c` (+0x2a4 mode word, already
proven), `data_ov000_021b56b4` (stride-0x28 table; +8/+10 shorts already
confirmed by `021ae394`'s draft — this function reads the *same* table at
`+2` inside the row, one short, distinct field from the `021ae394`/`021ae510`
reads), `data_ov000_021c763c` / `data_ov000_021c7660` (parallel scalar
config words — new, see gaps).

**Ground truth (verbatim):**
- `.word data_ov000_021c758c`, `.word data_ov000_021b56b4`,
  `.word data_ov000_021c7660`, `.word data_ov000_021c763c`.
- `bl func_ov000_021adf18` — arg (`r5-1`, `&stack_buf[0xc]`) — this is the
  SAME newline-scanner examined below, called here as a genuine sub-routine.
- `bl func_ov000_021b33d8_unk(r4 /* =021c763c */, &buf, 0xc)`.
- `bl func_ov000_021add24(&buf, 0xc, 0x100)`.
- `bl func_ov000_021b33f8_unk(r4, e[2]<<0xc, (row_val)<<0xc, 0)` — 3-word
  stack block built via `ldmia r1!, {r1,r2,r3}` from `sp+0`.
- `bl func_ov000_021b3474_unk(r4)`.
- Tail: `data_ov000_021c763c[0x20] = (word & ~0x3000) | 0x1000` — a 2-bit
  mode-nibble set at bits [13:12], independent little RMW.

**Complete C sketch:**

```c
extern char data_ov000_021c758c[];
extern short data_ov000_021b56b4[];  /* stride 0x28 shorts, row = idx*0x28/2 */
extern int   data_ov000_021c7660[];  /* base ptr / index seed, new global */
extern int   data_ov000_021c763c[];  /* per-instance context, new global */
extern int   func_ov000_021adf18(int mode, int idx, char *buf);
extern void  func_ov000_021b33d8_unk(void *ctx, char *buf, int n);
extern int   func_ov000_021add24(char *buf, int a1, int a2);
extern void  func_ov000_021b33f8_unk(void *ctx, int a1, int a2, int a3);
extern void  func_ov000_021b3474_unk(void *ctx);

void func_ov000_021ae2cc(int idx) {
    int mode = (data_ov000_021c758c[0x2a4/4] << 23) >> 30;   /* 2-bit field */
    int *tbl = data_ov000_021c7660 + mode * 10;              /* mla r3,r1,r0,r2 */
    char *row = (char *)data_ov000_021b56b4 + idx * 0x28 + 8;
    char buf[0xc];

    int n = func_ov000_021adf18(idx - 1, 0 /*unused*/, buf) - 1;
    func_ov000_021b33d8_unk(data_ov000_021c763c, buf, 0xc);
    int off = func_ov000_021add24(buf, 0xc, 0x100);
    short row_val = ((short *)(tbl + (idx - 1) * 2))[1];      /* row+idx*8+2 */

    func_ov000_021b33f8_unk(data_ov000_021c763c,
                             (n) << 0xc, row_val << 0xc, 0);
    func_ov000_021b3474_unk(data_ov000_021c763c);
    data_ov000_021c763c[0x20/4] =
        (data_ov000_021c763c[0x20/4] & ~0x3000) | 0x1000;
}
```

This is a best-effort structural sketch (the exact `tbl` addressing needs the
`data_ov000_021c7660` base confirmed at build time — see gaps below); it is
listed as tractable because every callee and every constant is now
identified, unlike the confirmed-intractable entries below where a genuine
scheduling ambiguity remains.

---

## Twin/near-twin pairs (byte-verified structural identity)

### 0x021ABE64 + 0x021ABEC8 (100B + 96B, class F, overlay=ov000)

**Original verdict:** low (both) — "bitfield unpack + mul + call, dense
reg-alloc"

`0x021ABE64` is already NAMED in the map:
`Ov000_ComputeScrollOffset` (HIGH confidence, "reads obj dims, calls
func_020b3a7c (sqrt/div?); computes scroll offset; called 4x" — it is the
**#5 most-called function in all of ov000**, per the map's call-graph table).
`0x021ABEC8` is `Ov000_UpdateScrollEntry` (MED, "sibling to
ComputeScrollOffset; updates scroll entry").

**Diff-verified identity:** a byte-level diff of the two `.s` bodies (renaming
registers to normalize) shows **the exact same arithmetic**: both read three
fields from the object (`[r,#0x4]`, `[r,#0x8]`, `[r,#0xc]`), extract the same
9-bit sub-fields via `lsl`/`lsr` pairs, compute
`center = ((f4_hi - f4_lo*2) * (f8_hi - fc_lo)) + ((f4_lo2 - f4_lo3*2 -
f4_lo4) + round) >> 1`, and tail-call `func_020b3a7c` with the sum as `r0`.
`021abe64` additionally re-loads `[r5]` (a 4th field, `+0x0`) after the call
and adds one more small term before returning — this is the ONLY structural
difference; `021abec8` returns the `func_020b3a7c` result directly. This
matches `ov000_core.h`'s `Ov000Row`-adjacent stride-family shape but for a
*different* per-object struct (this one has fields at +0/+4/+8/+0xc, not the
44-byte row).

**Upgrade reason:** `func_020b3a7c` is a confirmed KB identity — "the
divmod helpers — `func_020b3870` (signed) / `func_020b3a7c`… quotient via
`extern int`->r0, remainder via `extern long long` + `(int)(x>>32)`->r0"
(brief-393-ov004-realc.md), further corroborated by
`docs/research/c-match-prep/0206b1f8.c`: "`func_020b3a7c(h, div)` ->
(quotient r0, remainder r1)". Here only the quotient (`r0`) is consumed, so
it is used as a plain `int func_020b3a7c(int a, int b)`. All bitfield extracts
match documented mwcc idioms (`lsl #0x10/lsr #0x18` = byte extract at bit 16,
etc.) — no undocumented struct is needed, just careful transcription of the
extract chain. However: **both remain WALL, not tractable**, because
`ov000_core.h` already tried the C reshape for this exact family and it
FAILED — this is the "0x021ac920 the object-builder 2-byte near-miss" wall
class and, more specifically, the sibling call site `021ac098` (already
matched-tractable in round 1) explicitly calls `021abe64` as an unexamined
callee — meaning round 1 already established this function must stay `.s`
(it is a dependency of a function that ships, not a candidate to ship
itself). The dense back-to-back `lsl`/`lsr`/`rsb`/`sub` chain interleaves
three live registers (`r1`/`r2`/`r3`/`ip`) with no natural C statement
ordering that reproduces mwcc's exact instruction interleave — this is
**reg-alloc/schedule residue**, the same class flagged for `021ab850`
("structurally perfect… but the allocator will not reorder from C") in
`ov000_core.h`.

**Struct/data needed:** the object struct is 4 fields at `+0x0/+0x4/+0x8/
+0xc` — NOT `data_ov000_021c7530`'s 44-byte `Ov000Row` (offsets don't align:
0xc < 44 but the two known Row fields are at +8/+12 as *bytes*, not the 16/16/
9/9-bit packed layout seen here). This is a distinct, currently-undocumented
4-word struct — flagged as a new KB gap below (tentatively "scroll/hit-box
dimension record", since `021ac098`'s recipe calls it `HitRect` — but the
actual `HitRect.md` struct (12 bytes, u16 x/y + u8 w/h + u16 attr) does NOT
match this bit-packed layout, so `021ac098`'s `HitRect *r` typing was
itself an approximation; the real struct is likely 3 packed 32-bit words of
sub-byte-granularity dimension fields).

**Ground truth (verbatim), 0x021ABE64:**
- No `.word` pool entries (leaf constants only — pure register arithmetic).
- `bl func_020b3a7c` — sole callee, args `(mul_result, round_term)`.

**Ground truth (verbatim), 0x021ABEC8:**
- No `.word` pool entries.
- `bl func_020b3a7c` — sole callee, same signature.

**Verdict:** confirmed intractable (both) — **reg-alloc/instruction-schedule
wall on a dense 4-live-register bitfield-extract-then-multiply chain with no
natural C statement order that reproduces mwcc's interleave**, consistent
with `021ac920`'s already-diagnosed permuter-trivial-but-not-C-reshapeable
class. `021abec8`'s write-up is intentionally short per the task brief: same
struct, same computation, only the final add-back term (present in
`021abe64`, absent in `021abec8`) differs.

---

### 0x021AD660 + 0x021AD8DC (636B + 636B, class F, overlay=ov000)

**Original verdict:** low (both) — "143-insn task setup[variant], struct
field packs, big body"

Named in the map: `0x021AD660` = `Ov000_SetupMainVram` (HIGH, "large; sets
BGCNT/DISPCNT for main display, DMA-fills VRAM; installed in fn_1a4").
`0x021AD8DC` = `Ov000_SetupMainVramAlt` (MED, "same size as SetupMainVram;
alternate VRAM layout path"). `ov000_core.h` wave-3's wall list names this
EXACT pair: "command-record builders: 021ad660/021ad8dc (0x27c clone pair,
dual record + MMIO + packs)… dedicated RE."

**Diff-verified identity:** a line-level diff of the two `.s` files (see
scratch analysis) shows **the two function bodies are structurally
identical**, differing only in:
1. Fourteen `.extern`/`.word` symbols are *parallel, not shared* —
   `021ad660` reads `data_ov000_021b55dc/55e4/5600/561c/5644/5650/568c`;
   `021ad8dc` reads the equivalent `data_ov000_021b55de/5610/5614/5628/562c/
   5638/565c` — a per-instance data block (main-screen vs. sub/alt-screen
   VRAM descriptor set), same shapes, different addresses.
2. The initial BGCNT halfword literal changes: `021ad660` writes
   `and #0x43 / orr #0x700` then `and #0x43 / orr #0x600` to the two
   registers `[r2]`/`[r2+2]`; `021ad8dc` writes `orr #0x700` then
   `orr #0x2600` to `[r3]`/`[r3-4]` (same base register content, addressed
   via `sub r2,r3,#4` instead of `+2` — the two writes are the *same two
   halfwords*, just addressed from a pointer 4 bytes further up. The second
   BGCNT value differs: `0x600` (021ad660) vs `0x2600` (021ad8dc) — bit 13
   set, i.e. a different BG **priority/8bpp** flag).
3. `021ad660`'s tail block has one extra bit: after the `func_02006c0c` task
   spawn, `021ad660` does `orr r0, r0, #0x3` on the halfword at `[sp+0x48]`
   that `021ad8dc` does NOT do (compare lines: `021ad660` has
   `strh r0, [sp, #0x48]` immediately preceded by `orr r0, r0, #0x3`;
   `021ad8dc`'s equivalent write omits that `orr`).
4. `021ad660` clears `[r0]`/`[r0,#4]` (two adjacent words); `021ad8dc` clears
   `[r0]`/`[r0,#-8]` (base pointer offset by +8, same two logical fields).

Every `bl` target is IDENTICAL between the two: `Task_InvokeLocked`,
`func_02006c0c`, `func_0201d47c`, `func_0201d4b4`, `func_0201e5b8`,
`func_0201e7e0`, `func_0201ef90`, `func_0208ff1c`, `func_02094504`,
`func_ov000_021ac478`, `func_ov000_021ac508`, `func_ov000_021ac530`,
`func_ov000_021b3314_unk`, `func_ov000_021b33f8_unk` — same 14 callees, same
call order, same argument-marshalling shape. This is the "OBJECT-BUILDER
family template" pattern already banked in `ov000_core.h` §wave-3, just at a
much larger scale (this is the ~0x27C command-record-builder tier the header
explicitly separates from the small `021ad540/021ad49c` object-builder pair
that DID crack).

**Upgrade reason for the write-up (not a match):** `func_0201d47c` and
`func_0201e5b8` are both independently confirmed sinks
(`docs/research/c-match-prep/0201d47c.c`: zero a 0x28-byte block + set two
low bytes of word+0x1c to 0x20/0x20; `docs/research/c-match-prep/0201e5b8.c`:
FourCC tag-dispatch scan over the block, tags `OBJD`/`BGDT`/`PALT`). This
means the `sp+0x34..0x5c` stack block each function builds really is a
`0201e5b8`-format tagged descriptor list, not an opaque blob — the KB now
explains *what* the function is building, even though it still can't be
matched.

**Struct/data needed:** `data_ov000_021b55dc`..`021b568c` (021ad660) /
`021b55de`..`021b565c` (021ad8dc) — 7 parallel data words each, sizes/shapes
unconfirmed (new gap, see below); `data_ov000_021c758c`+0x2a4 (mode word,
already proven); `data_ov000_021c7718`/`021c760c`/`021c75c8`/`021c75c4` (VRAM
config sub-blocks, partially known via `ov000_core.h`'s "+0x264(612) base").

**Ground truth — 0x021AD660 `.word` pool (verbatim):**
`data_ov000_021b5644`, `0x0400000c`, `0x04000018`, `data_ov000_021c758c`,
`data_ov000_021c763c`, `data_ov000_021b5650`, `data_020b4748`,
`data_ov000_021b568c`, `data_ov000_021c75c4`, `data_ov000_021c75c8`,
`data_ov000_021c760c`, `data_ov000_021c7718`, `data_ov000_021b561c`,
`data_ov000_021b5600`, `data_ov000_021b55e4`, `data_ov000_021b55dc`.

**Ground truth — 0x021AD660 `bl`/`blx` targets (verbatim, in call order):**
`func_0201d4b4`, `func_02094504`, `func_0201d47c`, `func_02006c0c`,
`func_0201e5b8`, `Task_InvokeLocked`, `func_ov000_021b3314_unk`,
`func_ov000_021b33f8_unk`, `func_0208ff1c`, `func_0201e7e0`, `func_0201ef90`
(×2 loop iterations: `func_ov000_021ac478`, `func_ov000_021ac530`,
`func_ov000_021ac508` — actually a single iteration since the loop bound is
`cmp r8,#0x1 / bcc`, i.e. runs exactly once).

**Ground truth — 0x021AD8DC:** identical callee list; `.word` pool differs
only in the parallel-data symbol names listed in point 1 above plus
`data_ov000_021b562c` (in place of `_5644`), `data_ov000_021b5638` (in place
of `_5650`), `data_ov000_021b565c` (in place of `_568c`),
`data_ov000_021b5628/5614/5610/55de` (in place of `_561c/5600/55e4/55dc`).

**Verdict:** confirmed intractable (both) — **a 0x27C-byte command-record
builder assembling a `func_0201e5b8`-format tagged VRAM/task descriptor
across 14 callees with per-field bic/orr packs interleaved with stack stores;
the exact interleave order of the ~30 stack writes vs the 14 calls is
schedule-determined and not recoverable from a natural C statement order**
(the same wall class as the smaller stride-44 `Ov000Row` PACK family, scaled
up). `021ad8dc`'s write-up is intentionally short: identical structure to
`021ad660`, only the parallel data-table addresses and one BGCNT constant
(`0x600`->`0x2600`) and one missing `orr #0x3` differ.

---

## Confirmed intractable (21 total, including the 4 above counted once each)

Each entry: address + the *specific* scheduling ambiguity, with ground-truth
pool words and callees so a future pass doesn't have to re-derive them.

### 0x021AA4C4 (244B, class F) — `Ov000_InitObj`

Zeroes a 4-word block via `Fill32`, writes 8 literal fields (`0x1000`,
`0x200000`, `-0xbf000`, `0xff000`, `0xa000` ×2) plus two `ldrsh` samples from
`data_020bf280+0x5c/0x5e` (a large uncarved rodata table — offsets `+0x5c`
are far from the only other known access to this table, `+0xba0`, per
`arm9-main-checksum-recovery.md`, so no conflict, but the table's element
type at this offset is undocumented). Calls `func_ov000_021aa840`
(`Ov000_WrapFacingHandler`, already SHIP-MED) then `func_ov000_021aaac8`
(the 876-byte function examined next) then `func_ov000_021aa5b8`
(`Ov000_RefreshObjTransform`, already SHIP-HIGH but itself TRUNCATED per
`docs/research/c-match-prep/021aa5b8.c` — "the JSON body ends mid-function").
**Wall: three consecutive bic/orr packs into the SAME word `[r4,#0x140]`
interleaved with two unrelated register loads (`r6<<0x1e`, `r5<<0x1f`) whose
mwcc evaluation order this project's own recipe library has never cracked
for >2-field packs (the stride-44 `Ov000Row` class) — plus the function's
downstream callee `021aa5b8` is independently known-truncated, so a correct
call-order transcription can't even be verified against a complete sibling.**
`.word` pool (verbatim): `data_ov000_021c73e0`, `data_ov000_021c73e4`,
`data_020bf280`, `0x00001555`. `bl` targets (verbatim): `Fill32`,
`func_ov000_021aa840`, `func_ov000_021aaac8`, `func_ov000_021aa5b8`.

### 0x021AAAC8 (876B, class F) — `Ov000_DispatchObjMove`

Already NAMED HIGH confidence in the map ("large SHIP; tests facing field
1-4, dispatches move directions, calls RefreshObjTransform"). Reads the
active-object struct at fields `+0x100..+0x144` (facing/status region, byte-
proven range per `ov000_core.h`) and a parallel record at
`data_020bef80` (the sin/cos LUT, confirmed) indexed by `(coord+0x100)*
0x1000` scaled through an `asr #0xd` fixed-point shift. **Wall: NINE
near-identical `ldrsh`-index-into-LUT-then-`mul`-then-`add` blocks
(`.L_6f8`/`.L_740`/`.L_788` and five more further down), each reading a
DIFFERENT struct field pair (`+0x78/+0x124`, `+0x7c/+0x128`, … through
`+0x8c/+0x140`) but sharing register `r0` as scratch across all nine with no
loop — mwcc's choice of which sub-expression to CSE (the repeated
`(r4+0x100)<<7>>4<<1+1` index computation appears 9 times, textually
identical, but only SOME instances share the computed value across blocks)
is a pure schedule/CSE decision with 9-way multiplicity, not a 2-3 instruction
near-miss.** `.word` pool (verbatim): `data_ov000_021c73e0`, `data_020bef80`.
`bl` targets (verbatim): `func_ov000_021aa840` (once, mid-function).

### 0x021AAEE4 (312B, class F) — `Ov000_InitTaskNode`

Already NAMED in the map (MED, "likely allocates/inits a task node") and
independently flagged by name in `ov000_core.h`'s wave-3 wall list under
"Fixed-point (smull/mla) class: 021ae510, 021ab01c, **021aaee4**, 021aa8d4,
021ac578… m2c/permuter territory," with the brief-457 FX crib attached. This
IS the FX crib in action: `smull r1,r3,r2,r5` with pool constant
`0x80808081` (the documented `/255` alpha-normalize reciprocal from
`OverlayEFRetriage.md`'s `021ab798` writeup) computes a min/max/clamp tree
over three inputs, then conditionally calls `func_0208bfa8` — which per
`src/main/func_0208bfa8.legacy.c` is **already MATCHED**: `void
func_0208bfa8(void) { func_0208be38(); func_0208bed8(); }` (a void thunk,
twin of `func_0208bf8c`, takes NO return value despite being called in an
`r0`-consuming position in this .s — meaning **the disassembly's apparent
"blx r1 -> use r0" pattern for this callee is misleading**: the real call
target per its confirmed C body returns nothing, so the `str r0,[r6]`
immediately after must be capturing a DIFFERENT register's value that
survives the call, not the callee's return). **Wall: the
call-target/return-value mismatch above is itself the open question — until
someone re-verifies whether `func_0208bfa8` at THIS call site is really the
same symbol as the matched main-arm9 one (overlay `bl` vs `main` `bl` could
resolve differently pre-link), the function can't be modeled with
confidence; separately, the min/max/clamp min-of-3 tree (`movge`/`movlt`/
`movgt`/`movle` predicated chain, 8 conditional-moves across 6 live
registers `r4/r5/r7/r8/r9/sl`) is the exact reg-alloc-dense shape this
project's canon defers to permuter.** `.word` pool (verbatim): `0x80808081`.
`bl` targets (verbatim): `func_0208bfa8` (conditional, guarded by
`cmp r5,#0x0 / beq`).

### 0x021AB258 (540B, class F) — `Ov000_SetBgTileParams`

Already NAMED HIGH in the map ("indexes stride-0x2c table
`data_ov000_021c7540` by engine×channel, writes BG scroll/tile regs" — this
IS the confirmed struct, `data_ov000_021c7540`, stride `0x2c` (`mov ip,#0x2c
/ mla r5,r0,ip,r4`), confirmed by the map entry). **Wall: a 4-way switch
(engine 0/1 × sub-table 0/1) where each of the 4 arms performs the SAME
6-halfword byte-shuffle-and-repack (`bic #0x3f`/`orr #0x20` low-byte-shift
dance across `ldrsh sp[0..6]` inputs) into a DIFFERENT pair of MMIO
addresses (`0x04000048/4a` main-engine BG2/3 vs `0x04001048/4a` sub-engine
BG2/3) — the repack sequence is textually near-identical across all 4 arms
(confirmed by direct comparison of `.L_6c`/`.L_c0`/`.L_144`/`.L_198`) but each
arm's register-to-field binding rotates by one position, which is the
documented un-reproducible mwcc bitfield-insert-order behavior (`ov000_core.h`
recipe class 1, stride-44 family) scaled to 4 clones instead of ~6 — same
wall, more instances.** `.word` pool (verbatim): `data_ov000_021c7540`,
`0x04000048`, `0x0400004a`, `0x04001048`, `0x0400104a`. `bl` targets: none
(leaf function, pure MMIO writes).

### 0x021ABD50 (260B, class F) — `Ov000_SetupBgLayers`

Named MED in the map ("configures BG layer registers"; `ov000_core.h`
wave-3 lists it explicitly among "command-record builders… dedicated RE").
Zeroes a 0x14-byte block via `Fill32`, then packs SEVEN incoming arguments
(6 register + several stack, per the `[sp,#0x18..0x28]` reads) into 4 output
words at `[r6+0x0/0x4/0x8/0xc]` using 3 different non-trivial masks
(`0xffff803f`, `0xff007fff`, `0xfc01ffff`) each ANDed against a DIFFERENT
shift-combination of the inputs, then ORs in a final `bic #0x1/orr #0x3` on
the first word. **Wall: a genuine multi-argument bitfield-struct packer (the
task brief's own description) — 7 arguments distributed across 4 output
words with per-field bit-widths of 9/9/8/8/8/8/2 bits and NO argument maps
1:1 to a single output word (arg `r7` alone feeds bits in BOTH word+0x0 and
word+0xc) — this is a compressed record format where the packing order is
the entire difficulty, squarely the stride-44-class wall scaled to
non-uniform field widths.** `.word` pool (verbatim): `0xffff803f`,
`0xff007fff`, `0xfc01ffff`. `bl` targets (verbatim): `Fill32` (once, at
entry).

### 0x021AC144 (820B, class F) — `Ov000_ProcessScrollEntry`

Already NAMED HIGH in the map ("large; dispatches per scroll-entry type;
calls ComputeScrollOffset, AdvanceScrollLo/SubScrollLo" — every callee here
IS already matched/named: `func_ov000_021abe64`/`021abec8` (the twin pair
above — themselves confirmed intractable), `func_ov000_021abf78`
(`Ov000_ScrollEntryUpdate`, SHIP-MED), `func_ov000_021abfbc`
(`Ov000_DecrCounter16`, MATCHED), `func_ov000_021abfec`
(`Ov000_AdvanceScrollLo`, MATCHED), `func_ov000_021ac050`
(`Ov000_SubScrollLo`, MATCHED), `func_ov000_021ac098`
(`Ov000_UpdateScrollState`, already tractable round 1), plus
`func_02006110`/`02006164`/`0200617c`/`02006194` (button-poll family, no
struct dependency). **Wall: this function's own body is a clean
7-branch dispatcher over `data_ov000_021c758c+0xc/+0x10` bitfields (all
struct facts ARE known) BUT it calls `021abe64`/`021abec8`, which this
document independently reconfirms are permuter-class — so
`021ac144` can never be more than "correct except for the two callee bodies
it can't verify," i.e. it inherits its wall from its dependencies rather than
having one of its own. Listed here as intractable-by-inheritance, not by
local complexity** (the branch-table itself, using `addls pc,pc,r0,lsl#2`
with 6 targets, is a completely standard mwcc jump-table that this project
matches routinely elsewhere). `.word` pool (verbatim): `0xfc01ffff`,
`0xfffe00ff`. `bl` targets (verbatim, in order): `func_ov000_021abe64` (×3
call sites), `func_02006194`, `func_0200617c`, `func_02006110`,
`func_ov000_021ac098`, `func_02006164`, `func_ov000_021abfbc`,
`func_ov000_021ac050`, `func_ov000_021abfec`, `func_ov000_021abf78`,
`func_ov000_021abec8`.

### 0x021AC578 (436B, class F) — `Ov000_UpdateScrollAnimEntry`

Already NAMED HIGH in the map ("iterates scroll animation; calls font
rendering helpers func_0200617x") and explicitly named in `ov000_core.h`'s
wave-3 fixed-point wall list alongside `021aaee4`/`021ae510` ("021ac578
(distance test)"). Computes a squared-distance test
(`mul r1,r3,r3 / mla r2,r3,r3,r1 / mul r1,r0,r0 / cmp r2,r1`) between a
stored point and the input coordinates — the exact "distance without sqrt"
comparison idiom, NOT the `FX_Sqrt(FX_Mul+FX_Mul)` crib (no `smull`/`+0x800`
round-bias appears — this is plain 32-bit `mul`/`mla`, i.e. integer
Euclidean-distance-squared, a DIFFERENT and simpler idiom than the Q12 FX
crib). **Wall: not the FX crib after all (re-examined and ruled out) — the
actual wall is four predicated `bl func_02006164`/`0200617c`/`02006194`
guard calls each gating a DIFFERENT one of 4 mutually-exclusive tail blocks
that all write overlapping bits of the SAME word `data_ov000_021c758c[0]`
and `[8]`, where the bit patterns (`0x78`, `0x8`, `0x4`, `0x30000`, `0x20000`,
`0x10000`, `0x40000`) interleave across the 4 arms in a way that only mwcc's
specific arm-ordering (not a natural switch/if-chain) reproduces — reclassify
as a config-state-machine bitfield-pack wall, same family as `021abd50`
above, NOT fixed-point.** `.word` pool: none (leaf constants only). `bl`
targets (verbatim, in order): `func_02006110`, `func_02006194`,
`func_0200617c` (×2), `func_02006164` (×2).

### 0x021ACAF8 (352B, class E) — `Ov000_ProcessAnimFrame`

Already NAMED MED in the map ("processes animation frame; calls
DispatchDeferredTask/FlushDeferredHandle" — actually the call targets are
`func_0201e7e4`/`func_0201e800`/`func_0201e7ec`/`func_0207fd28`, all now
independently confirmed signatures: `func_0201e7e4(p)` = `Obj_GetWordF8`
(MATCHED, `return *(int*)(p+8)`), `func_0207fd28(h,flags)` = free-handle
(confirmed via `OV011_CELL_FREE_FLAGS` and the `021caea8`/`021cd0dc`
c-match-prep drafts), `func_0201e800`/`func_0201e7ec` = re-init/finalize pair
(confirmed via the same drafts). The function's OWN loop (3 iterations over
`sl+0x8+i*4`, discriminant = a 1/2/5-bit test on `sl+0x98`) is fully
comprehensible: dispatch to `func_0201e800`+`func_0201e7ec` OR
`func_0207fd28` based on `Obj_GetWordF8`'s result — a clean guarded-call
loop, no wall there. **Wall is confined to the SECOND half:** an 8-bit
color/index field RMW into `data_ov000_021c758c+0x9c` feeding
`func_020b3870` (the SIGNED sibling of `func_020b3a7c`, per brief-393 — here
truly signed divmod, quotient only) whose result indexes `data_020bef80`
(sin/cos LUT, confirmed) and feeds a `FX_Mul`-shaped `smull/adds#0x800/adc/
lsr#0xc/orr,lsl#0x14` pair — genuinely the brief-457 FX_Mul crib this time
(confirmed: the `+0x800`/`lsr#0xc`/`lsl#0x14` fingerprint IS present, unlike
`021ac578` above) — computing TWO output fields at `[sl+0x80]`/`[sl+0x84]`
from FOUR input fields (`[sl+0x90]`/`[0x88]`, `[sl+0x94]`/`[0x8c]`) that
share the SAME loaded LUT sample `r4` across both `FX_Mul` calls. **This is
the FX_Mul crib applied twice with a shared multiplicand held live across
both — the exact reg-alloc-sharing shape brief-457 flags as the boundary
between "cracks" (single FX_Mul) and "stays walled" (shared-operand
multi-FX_Mul, cf. VEC_DotProduct's near-miss).** `.word` pool (verbatim):
`data_020bef80` (LUT). `bl` targets (verbatim, in order): `func_0201e7e4`
(×2 in loop), `func_0201e800` (×2), `func_0201e7ec`, `func_0207fd28`,
`func_020b3870`.

### 0x021ACC58 (360B, class E) — `Ov000_LoadNextAnimFrame`

Already NAMED MED in the map ("sibling to ProcessAnimFrame; loads next
animation frame"; explicitly listed in `ov000_core.h`'s fixed-point wall
list alongside `021ac578`/`021aaee4`). Range-checks two VRAM-offset fields
(`[r5+0x80]+0x80000`, `[r5+0x84]+0x60000`) against a pool bound
`0x0017f000`/`(0x100000 - bound)`, and — same FX_Mul-adjacent shape as
`021acaf8` — conditionally calls `func_0201942c` (confirmed:
`Card_IsValidTypeCode(x)`, "Sub 0x4c, check range 0..0x11" per
`docs/research/dossiers-high/0201942c.md` and `map/main_b.md` — MED
confidence but a real, simple range classifier) and, if true, computes
`0x80808081`-scaled (the `/255` alpha idiom, confirmed) byte-index into
`data_020bef80` to advance `[sp+0x24]` by a LUT-derived step. The tail loop
(`.L_23c`) then builds a 12-word stack argument block and calls
`func_0201e964` for up to 3 iterations — the SAME 12-arg window-builder sink
already confirmed by the object-builder family
(`ov000_core.h`: "func_0201e964(...) — 12-arg window build (4 reg + 8 stack
args)"; exact same call shape as `021ad49c`/`021ad540`, which DID crack).
**Wall: unlike `021ad49c`/`021ad540` (which pass FIXED per-call constants),
this function's `func_0201e964` call reads THREE stack fields per-iteration
from `[r5+0x98]` (mode/algorithm selector), `[r5+0x78]`/`[r5+0x7c]`
(base pointers), interleaved with a `Card_IsValidTypeCode`-gated conditional
LUT step that only runs ONCE before the loop, not per-iteration — meaning the
loop body's `func_0201e964` argument marshalling depends on control flow
OUTSIDE the loop in a way the simpler `021ad49c` pattern didn't have to
handle, and the interaction between the pre-loop conditional step and the
loop's stack-argument layout (8 stack words per call, built fresh each
iteration from a MIX of loop-invariant and loop-varying fields) is the
open scheduling question.** `.word` pool (verbatim): `data_ov000_021c758c`,
`0x80808081`, `data_020bef80`, `0x0017f000`. `bl` targets (verbatim, in
order): `func_0201942c`, `func_020b3870` (implied via the `0x80808081`
scale — actually this is inline `smull`, no call), `func_0201e964` (×1..3,
loop-bounded).

### 0x021ACEF8 (396B, class F) — `Ov000_SetupBgControl`

Already NAMED HIGH in the map ("sets BG control regs (BGCNT via 0xNNN half-
word writes), calls func_0201d47c and func_0201e5b8" — both sinks confirmed,
see the `021ad660` writeup above for their bodies). **Wall: a 3-way switch
on `data_ov000_021c758c+0x26c` bits[17:16] (0/1/other) where arms 0 and 1
perform the SAME 6-halfword bic/orr repack (matching `021ab258`'s exact
pattern above — `bic #0xff/orr #0x20` low-byte then `bic #0x7f/#0x3f80/
orr #0x780 or 0xb00` high nibbles) into the SAME three stack locations
(`sp+0x14/0x16/0x18`) but with DIFFERENT final OR-constants (`0x780`/`0x900`
vs `0xb00`/`0x900`/`0xb00`) — again the stride-44-class un-reproducible
bit-insert-order wall, this time gating which of 2 near-identical constant
sets applies rather than which of N struct rows.** `.word` pool (verbatim):
`data_ov000_021c75c4`, `0x0400100c`. `bl` targets (verbatim, in order):
`func_0201d47c`, `func_0208e0a0` (conditional), `func_02094504`
(conditional), `func_0201e5b8`.

### 0x021AD084 (868B, class F) — `Ov000_SetupSubVram`

Already NAMED HIGH in the map ("large; sets BGCNT/DISPCNT for sub display,
calls func_02094504 to DMA-fill VRAM"). This is the direct sibling of the
`021AD660`/`021AD8DC` twin pair above (installed at `data_ov000_021c758c+
0x1a4` fnptr per `ov000_core.h`: "the main dispatcher func_ov000_021adb58
branches through fnptr_1a4, which is wired to either func_ov000_021ad660
(main-screen VRAM setup) or func_ov000_021ad084 (sub-screen VRAM setup)").
Every callee is independently confirmed: `func_ov000_021ab4ec`
(`Ov000_ClearObjRecordByte`, MATCHED), `func_ov000_021ab8f8`
(`Ov000_UpdateDisplayEngine`, SHIP-HIGH hub), `func_ov000_021acef8` (the
sibling examined immediately above — itself confirmed intractable),
`func_ov000_021af3f0` (`Ov000_EnterMainMode`, MATCHED),
`func_ov000_021ad464` (`Ov000_SetSubCtrlBit1`, MATCHED). **Wall: same class
as the twin pair (208-instruction VRAM/task command-record builder using the
same `func_0201e7e0`+`func_0201ef90`+`func_0201e5b8` triad, this time with
TWO separate `func_0201ef90` call sites each building a different 6-word
config block from `data_ov000_021b566c`/`021b567c` literal tables via
`ldmia`/`stmia` — the two blocks' field-to-argument binding differs subtly
(`mov r3,#0x1c000` vs `#0x1c400`) in a way that's readable off the `.s` but
whose CORRECT C encoding (as two structurally-similar-but-not-identical
call sites, not a loop) has the same schedule-fragility as the twin pair.**
`.word` pool (verbatim): `data_ov000_021c75c4`, `0x0400100c`,
`data_ov000_021b65e4`, `data_ov000_021c758c`, `data_ov000_021b6600`,
`data_020b4748`, `data_ov000_021b566c`, `data_ov000_021b567c`,
`0x04001018`. `bl` targets (verbatim, in order): `func_ov000_021ab4ec`,
`func_ov000_021ab8f8`, `func_0208c8b0`, `func_0201d4b4` (×3),
`func_02094504` (×3), `func_02006c0c` (×2), `func_ov000_021acef8`,
`func_0201d47c`, `func_0201e5b8`, `func_0208ffec`, `func_0208ff84`,
`func_0201ef3c` (×2, conditional), `func_0201e7e0` (×2), `func_0201ef90`
(×2), `func_0201d530`, `func_ov000_021af3f0` (conditional),
`func_ov000_021ad464` (conditional), `func_ov000_021ab4ec`.

### 0x021ADC50 (212B, class F) — `Ov000_SetupScrollTable`

Explicitly named "orchestrator tier" in `ov000_core.h`'s wall list
("021ae218 / 021adc50: complex orchestrators (nested goto-tail control flow
/ many-stack-arg pass-through calls) — dedicated RE"), and named MED in the
map. Every callee is a confirmed sink: `func_0201d530`/`func_0201d4b4`
(VRAM-offset-by-mode, per `ov000_core.h`), `func_02001d0c`/`02001d68`/
`02001cd0`/`02001e94`/`02005374` (the same cell-config sink family
documented across `OverlayConstants.md` §Cell config flags AND
brief-321/324/334's "12-arg object builder" / "cell-config box-render sink"
families — this is the ov011/ov013/ov016/ov017-shared `func_0201e964`-adjacent
cell-config API, here accessed via its OV000-specific wrapper set). Reads
`data_02104f4c+0x4` for a 3-bit mode extract (confirmed shape:
`OverlayDataGlobs.md` "+0x04 | u32 | read | 3-bit mode extract... display-mode
enum" — that entry is documented for OV010's access to the SAME global,
confirming `data_02104f4c` is a shared arm9-main singleton, not
ov000-private). **Wall: NINE sequential calls into the `02001dXX`/`02005374`
cell-config family, each consuming a DIFFERENT mix of 2-6 arguments where
several arguments are shared sub-expressions (`r6+r4` VRAM sum reused 3
times, `func_0201d4b4(8)+0xc2+0x300` reused once) — the exact interleave of
"reload vs. keep-live" for these shared sub-expressions across 9 calls with
no loop structure is schedule-determined, matching the class of wall
`ov000_core.h` itself defers to "dedicated RE" rather than sweep-pick.**
`.word` pool (verbatim): `data_ov000_021c75c4`, `data_02104f4c`. `bl` targets
(verbatim, in order): `func_0201d530`, `func_02001d0c`, `func_02001d68`,
`func_ov000_021adb9c`, `func_02001cd0`, `func_02005374`, `func_0201d4b4`,
`func_02001e94`.

### 0x021ADD44 (468B, class F) — `Ov000_RenderText`

Already NAMED HIGH in the map ("calls Strlen+ComputeTextOffset; renders text
into BG tile buffer" — both `func_ov000_021ac7dc`/`Ov000_Strlen` and
`func_ov000_021add24`/`Ov000_ComputeTextOffset` are confirmed MATCHED). This
is the SAME cell-config sink family as `021adc50` immediately above
(`func_02001d0c`/`02001d68`/`02001d84`/`02001dc4`/`02001cd0`/`02001ddc`/
`02001e94`/`02005298`/`02005374`, 9 distinct sinks, several never seen
elsewhere in this batch: `02001d84`/`02001dc4`/`02001ddc` are NEW callees not
in `021adc50`'s set — confirming the family is larger than the 6 members
`ov000_core.h` names). Two internal helper calls
(`func_ov000_021adbdc`=`Ov000_ClearVramRegionB`, MATCHED;
`func_ov000_021add24`=`Ov000_ComputeTextOffset`, MATCHED) are fully known.
**Wall: a 3-way switch (0/1/other) selecting BETWEEN
`func_02001d0c(...,0x1c,6)` and `(...,0x20,6)` (a size-parameter swap only)
feeding into a SECOND 3-way switch (0/1/other) selecting between
`func_02001cd0(...,0xf,5)` + `func_02001ddc(9 args incl. func_02005298 as a
literal function-pointer ARGUMENT)` OR `func_ov000_021add24(...)` +
`func_02001ddc(9 args incl. func_02005374 as a literal function-pointer
argument)` — passing a DIFFERENT confirmed sink's ADDRESS as a plain data
argument to a THIRD sink is an unusual calling convention this project
hasn't modeled before in this batch, and the two switches' arm-count (3×3=9
logical paths, only 3 physically realized via fallthrough) is exactly the
"nested goto-tail control flow" `ov000_core.h` flags for this address's
sibling.** `.word` pool (verbatim): `data_ov000_021c75c4`, `data_02104f4c`,
`func_02005298`, `func_02005374` — note the LAST TWO pool words are function
ADDRESSES loaded as data, not call targets, confirming the function-pointer-
as-argument reading above. `bl` targets (verbatim, in order): `func_0201d530`,
`func_02001d0c` (one of two size variants), `func_02001d68`, `func_02001d84`,
`func_02001dc4`, `func_ov000_021adbdc`, `func_02001cd0` (one of two field
variants), `func_02001ddc`, `func_0201d4b4`, `func_02001e94`,
`func_ov000_021add24` (alt branch).

### 0x021ADF18 (172B, class E) — `Ov000_ScanTextNewline`

Already NAMED MED in the map ("scans string for newlines up to a line
count; text layout helper"). **Re-examined fully and this one is genuinely
simple** — two independent scan loops (first: count lines up to `arg1`,
looking for `\n` vs `\0`; second: copy bytes to `arg2` until `\n`/`\0`,
writing a found/not-found byte) with NO struct or constant dependency
whatsoever — every operation is on raw `char*` pointers and immediate
values `0x0`/`0xa`/`0x1`. **This should arguably be tractable, but per
`ov000_core.h`'s own wave-2 note it is EXPLICITLY named among the confirmed
"stride-44... register-numbering... won't reorder from C" style near-misses
in spirit** — more precisely, the task brief's own characterization
("dual char-scan loops, conditional-mov coin-flips, branch-heavy") is
accurate: the SECOND loop's `strb ip, [r2], #0x1` post-increment store is
interleaved with a `cmp ip,#0x0 / cmpne ip,#0xa` DOUBLE comparison whose
short-circuit register reuse (`ip` serves as both the loaded byte AND the
comparison operand across a branch) is a "coin-flip" in the literal sense —
mwcc's choice of which comparison to predicate first is not fixed by the C
source's `||`/`&&` evaluation order (both orderings produce equivalent C but
only one produces byte-identical ARM). **This is called as a genuine
sub-routine by the already-listed-tractable `021ae2cc` above (as
`func_ov000_021adf18`), so it is a real, load-bearing dependency — flagging
it here as a low-confidence RETRY CANDIDATE (unlike the others in this
list) rather than a hard wall: a future pass trying BOTH branch orderings
of the double-comparison by hand (not swept) may crack it.** `.word` pool:
none. `bl` targets: none (leaf, pure pointer/byte loop).

### 0x021ADFC4 (596B, class F) — `Ov000_LayoutText`

Already NAMED HIGH in the map ("large; calls ComputeTextOffset +
ScanTextNewline; handles multi-line layout into VRAM" — confirms
`021adf18` above IS called from production code, not just `021ae2cc`).
Every callee confirmed: `func_0201d4b4`/`func_02094504` (VRAM DMA, per
`ov000_core.h`), `func_02001d0c`/`02001d68`/`02001cd0`/`02001e94`/
`02005374` (cell-config family, same as `021adc50`/`021add44`),
`func_020a6afc` (new — no KB hit, likely a text-measurement helper given the
call context `(base+0x9c, strptr)`), `func_ov000_021ab4bc`
(`Ov000_SetObjRecordByte`, MATCHED), `func_ov000_021add24`
(`Ov000_ComputeTextOffset`, MATCHED), `func_ov000_021adf18` (the newline
scanner just above). **Wall: a per-line LOOP (bounded by
`data_ov000_021c75c4+0x26c` bits[19:18]+2) that calls `021adf18` +
`func_ov000_021add24` + a 9-arg `func_02005374` + `func_02001e94` ONCE PER
LINE with a stack-passed 2-word block (`{line_width_+7>>3<<5, y_offset}`)
built fresh each iteration from THREE loop-carried accumulators (`r7` +=
0x800 per iter, `r9` += 0x40 per iter, `r8` += 1 per iter) — three
independent linear strides updated in lockstep is exactly the kind of
multi-accumulator loop this project's reg-alloc canon has never cracked
without the permuter (no single canonical C `for`-loop update order
reproduces which accumulator mwcc recomputes vs. carries).** `.word` pool
(verbatim): `data_ov000_021c758c`, `data_ov000_021b56b4`,
`data_ov000_021c75c4`, `data_02104f4c`. `bl` targets (verbatim, in order):
`func_0201d4b4` (×3), `func_02094504` (×2), `func_0201d530`,
`func_02001d0c`, `func_02001d68`, `func_02001cd0`, `func_ov000_021add24`,
`func_02005374`, `func_02001e94`, `func_020a6afc`, `func_ov000_021adf18`
(loop-bounded), `func_ov000_021ab4bc`.

### 0x021AE510 (324B, class F) — `Ov000_LoadCardLayout`

Already NAMED HIGH in the map ("reads data_021b56b4 table, calls
BuildWindowA; sets up card-display layout"), explicitly named in
`ov000_core.h`'s fixed-point wall list ("021ae510, 021ab01c, 021aaee4,
021aa8d4, 021ac578, 021acc58 — m2c/permuter territory"). Indexes
`data_ov000_021b56b4` (the same stride-0x28 table as `021ae2cc`/`021ae394`,
now confirmed used by at least 4 distinct functions), applies a
`0xffe01fff`-masked RMW (this exact mask is documented — `OverlayConstants.md`
"combined: (field & 0xffe01fff) | 0xfe000 | 0x100000" for `func_ov000_021ae4d8`
— but here the SAME mask feeds a DIFFERENT computation:
"`bcc`-guarded 4-bit rotation of `data_ov000_021c75c4+0x26c` bits[26:24]"),
then applies the confirmed FX_Mul crib (`smull/adds#0x800/adc/lsr#0xc/
orr,lsl#0x14`, twice, sharing the SAME `data_020bef80` LUT sample across
both — the identical shared-operand shape flagged for `021acaf8` above) to
compute two output words at `[r3+0x14c]`/`[0x150]`, and tail-calls the
CONFIRMED sink `func_ov000_021ad49c` (`Ov000_BuildWindowA`, MATCHED — see
its body above) with a 2-word stack block. **Wall: identical class to
`021acaf8` — the FX_Mul crib applied twice with a shared multiplicand,
PLUS an antecedent bit-rotation computation
(`sub r4,r4,#0x10 / mov r2,r4,lsl#0x18 / orr r2,r5,r2,lsr#0xb`) whose
result feeds BOTH FX_Mul calls' base offset — three-way data dependency
(shared LUT sample + shared rotation result + two independent per-axis
deltas) across a single basic block with no natural decomposition into
separable C expressions.** `.word` pool (verbatim): `data_ov000_021c758c`,
`data_ov000_021b56b4`, `data_ov000_021c75c4`, `0xffe01fff` (confirmed shared
constant, different use), `0x80808081`, `data_020bef80`. `bl` targets
(verbatim): `func_ov000_021ad49c` (tail call, once).

### 0x021AE69C (704B, class F) — `Ov000_UpdateTextDisplay`

Already NAMED HIGH in the map ("large; reads data_021b56b4 table, calls font
helpers (func_0200617x), updates scroll anim"). Every callee confirmed:
`func_02006110`/`02006164`/`0200617c` (button/idle-poll family, per
`021ac578`/`021ae218` above), `func_02037208` (toast/notify, confirmed
signature), `func_ov000_021ac760`/`021ac770` (`Ov000_GetBit2`/
`Ov000_SetReadyFlag`, both MATCHED), `func_ov000_021ae4d8`
(`Ov000_CopyScrollParams`, MATCHED — body shown above), `func_ov000_021ae654`
(`Ov000_NotifyFacingChange`, MATCHED). **Wall: a bounds-checked LOOP over
`data_ov000_021b56b4` rows (`r7` iterations, row stride 8, testing 4
DIFFERENT halfword sub-fields per row against 2 STACK-held thresholds from
`func_02006110`'s out-params) that, INSIDE the loop, conditionally calls
`func_ov000_021ae4d8` + `func_0200617c` and THEN re-tests a DIFFERENT bit of
the SAME word it just wrote — a read-after-write-in-the-same-iteration
hazard where the compiler's choice to re-load vs. keep the just-computed
value in a register is exactly the "cached-base" vs. "MMIO double-RMW
exception" tension `brief-457`'s broader crib explicitly flags as needing
case-by-case judgment ("MMIO double-RMW is the exception: use absolute
addresses") — but this is NOT an MMIO address (it's the `data_ov000_021c75c4
+0x270` config word), so the exception doesn't obviously apply, and testing
both ways is a real experiment this pass didn't have scope to run.**
`.word` pool (verbatim): `data_ov000_021c758c`, `data_ov000_021b56b4`,
`data_ov000_021c75c4`, `data_02104bac`. `bl` targets (verbatim, in order):
`func_0200617c`, `func_02006164`, `func_02006110`, `func_ov000_021ae4d8`
(loop-conditional), `func_0200617c` (loop-conditional, ×1 more),
`func_ov000_021ac760`, `func_ov000_021ac770`, `func_02037208` (×2),
`func_ov000_021ae4d8` (×2 more, post-loop), `func_ov000_021ae654` (×2).

### 0x021AE95C (892B, class F) — `Ov000_RunStateUpdate`

Already NAMED HIGH in the map ("large state-machine; dispatches on top-byte
of [0x2a8]; calls LoadCardLayout, UpdateTextDisplay" — both callees are the
confirmed-intractable `021ae510`/`021ae69c` above, so this inherits their
wall the same way `021ac144` inherits `021abe64`'s). Every OTHER callee is
independently confirmed: `func_ov000_021ac578` (confirmed intractable
above), `func_ov000_021ac72c` (`Ov000_TickScrollAnim`, already tractable
round 1), `func_ov000_021ab4bc`/`021ab4ec`/`021ab5d8`/`021ab62c`/`021ab688`
(the entire stride-44 `Ov000Row` accessor family, all independently MATCHED
already — meaning THIS function's calls into them are fine, only the
functions themselves walled on their OWN bodies), `Task_InvokeLocked`
(confirmed sink). **Wall: an 8-way branch-table dispatch
(`data_ov000_021c75c4+0x270` top byte, `addls pc,pc,r2,lsl#2`) where 3 of
the 8 arms (`.L_46c`/`.L_504`/`.L_57c`) perform the SAME
`(byte-field ± const) -> range-clamp -> 0x80808081-scaled FX_Mul-style call
into func_ov000_021ab688` pattern with slightly different clamp bounds
(`0xff`/`0x18` vs `0x0`/`0x1f` vs `0x18`/`0x0`) — three clones of the SAME
computation embedded in a switch rather than factored into a shared helper,
which is itself telling (mwcc's inliner or the original source genuinely
duplicated this logic 3x) but means there is 3x the schedule-fragile
FX_Mul-adjacent surface of a single-instance wall.** `.word` pool (verbatim):
`data_ov000_021c758c`, `data_ov000_021c75c4`, `0x80808081`, `0x04000018`.
`bl` targets (verbatim, in order): `func_ov000_021ac578` (×2, unrolled loop
of 1), `func_ov000_021ac72c` (×2), `func_ov000_021ae510`,
`func_ov000_021b3544_unk`, `func_ov000_021ac810` (arm 0),
`func_ov000_021ac834` (arm 1 guard), `func_ov000_021ab4bc`,
`func_ov000_021ab62c`, `func_ov000_021ab5d8`, `func_ov000_021ab688`,
`func_ov000_021ab8f8`, `func_ov000_021adb58`, `func_ov000_021adfc4`,
`Task_InvokeLocked` (×2, conditional), `func_ov000_021ae69c` (arm 3),
`func_ov000_021ab688` (arms 4/6, ×2 more), `func_ov000_021ab62c` (arm 5),
`func_ov000_021ab5d8` (arm 5), `func_ov000_021ab4ec` (arm 6),
`func_ov000_021ac834` (arm 7 guard).

### 0x021AED8C (1452B, class F) — `Ov000_MainUpdate`

Already NAMED HIGH in the map as "largest function; 7-state jump table on
[0x2a4] sub-byte; the main per-frame entry point" — this is the single
biggest function in the entire overlay (0x5AC bytes). Calls the just-examined
`func_ov000_021ae95c` UNCONDITIONALLY at entry (so inherits its wall), then
dispatches through a 7-arm `addls pc,pc` table. Every non-wall callee is
confirmed: `func_ov000_021ab4bc`/`021ab4ec`/`021ab5d8`/`021ab688` (Row
family, MATCHED), `func_ov000_021ae218` (newly tractable, this document),
`func_02001dc4`/`02001e5c`/`02001e84` (idle/cell-config family, confirmed),
`func_020055b4` (new — no KB hit), `func_0201eaa0` (new — 12-arg-shaped
call, likely another `func_0201e964`-family variant given the arg count and
`0x1c000`/`0x600` literal shape matching that family's known constants),
`func_0207fd28` (free-handle, confirmed). **Wall: this function is the
union of every wall already cataloged in this document — it contains its
OWN copy of the "3-clone FX_Mul-scaled clamp" pattern from `021ae95c` (arms
1 and 5, verbatim-matching `021ae95c`'s arms `.L_46c`/`.L_57c` byte-for-byte
including the `0x80808081` scale and `func_ov000_021ab688` call shape —
this is NOT a coincidence, it's the SAME state machine's logic appearing at
TWO dispatch levels, `021aed8c`'s state N calling into `021ae95c`'s
sub-states), plus the idle-check-pair pattern from `021ae218`, plus a
never-before-seen 12-arg `func_0201eaa0` call with an 8-word stack block
built from THREE different source expressions
(`0x11`/`0x1c000`/`0x600`/loop-computed handle). At 1452 bytes with 7
top-level arms each 40-208 bytes, this is simply too large and too densely
cross-referential to the OTHER already-walled functions in this same batch
to be tractable independent of solving `021ae95c`/`021ac578`/`021ae510`
first.** `.word` pool (verbatim): `data_ov000_021c758c`, `data_ov000_021c75c4`,
`0x01ff0000`, `0x04001018`, `0x80808081`, `0x0007fff8`, `data_020bef80`,
`data_02104f4c`, `0x807fffff`. `bl` targets (verbatim, in call order):
`func_ov000_021ae95c`, `func_ov000_021ab688` (×2, arms 1/5),
`func_ov000_021ab5d8` (×2), `func_ov000_021ab4bc` (×2), `func_ov000_021ab4ec`
(×2, arms 3/5), `func_020055b4`, `func_02001e84` (×2), `func_02001e5c` (×3),
`func_02001dc4` (×2), `func_ov000_021ae218`, `func_02094504`,
`func_0207fd28`, `func_0201eaa0`.

### 0x021AF5E0 (320B, class F) — `Ov000_SetupAltEntry`

Already NAMED MED in the map ("larger init sequence for alt entry/slot") and
explicitly named in `ov000_core.h`'s wave-3 wall list ("command-record
builders: 021ad660/021ad8dc… 021abd50, **021af5e0** — dedicated RE"). Copies
a literal 6-word block from `data_ov000_021b569c` (new global, `ldmia/stmia`
pair identical in shape to the confirmed `data_ov000_021b566c`/`021b567c`
copies in `021ad084`), packs a BGCNT-style halfword at `0x0400100c` (main
screen BG3 control — same MMIO family as `021acef8`), calls the confirmed
sinks `func_ov000_021ab62c` (`Ov000_ClearObjPalBright`, MATCHED),
`func_0201d47c`+`func_0201e5b8` (config-block init/dispatch pair, confirmed
above), `func_02006c0c` (task-create, confirmed `(template,4,0)` convention
per `MainConstants.md` §func_02006c0c), `func_ov000_021ab4bc`
(`Ov000_SetObjRecordByte`, MATCHED). **Wall: identical class to
`021ad660`/`021ad8dc` above but smaller (320B vs 636B) — a single
`func_0201e5b8`-format config block built via 15 individual bic/orr/str
operations across `sp+0x18..0x30`, where the SOURCE of the task-create
template pointer is itself computed via `ldr r0,[r0,#0x34] / lsl#0x14/
lsr#0x1c / ldr r0,[r2,r0,lsl#2]` — a 3-bit-field-indexed table lookup INTO
the 6-word literal block just copied from `data_ov000_021b569c` — meaning
the template selection depends on a value written earlier in the SAME
function, a genuine read-after-write across the whole function body, not
just one block.** `.word` pool (verbatim): `data_ov000_021b569c`,
`data_ov000_021c758c`, `0x0400100c`, `0x04001018`. `bl` targets (verbatim,
in order): `func_ov000_021ab62c`, `func_0201d47c`, `func_02006c0c`,
`func_0201e5b8`, `func_ov000_021ab4bc`.

---

## New KB gaps found

These are undocumented data globals/constants surfaced by this pass. None of
the shared KB docs were edited per the task instructions — listed here for a
future KB-writing pass.

1. **`data_ov000_021c7660` / `data_ov000_021c763c`** (used by `021ae2cc`,
   tractable write-up above) — a small per-instance context pair, likely a
   parallel-structured pair like the `data_0210674c`/`data_02105f4c` pair
   already documented in `OverlayDataGlobs.md`. Evidence: both accessed via
   the SAME mode-derived index (`mla` with the `+0x2a4` 2-bit field), and
   `021c763c` additionally appears as `_LIT4` in BOTH `021ad660` AND
   `021ad8dc` (the twin pair) — so it is NOT ov000-private-per-instance, it's
   a shared config-table base pointer. Needs a dedicated survey pass.

2. **The `021ABE64`/`021ABEC8` object struct** — 4 packed fields at
   `+0x0/+0x4/+0x8/+0xc`, each subdivided into 9-bit/16-bit sub-ranges via
   `lsl`/`lsr` pairs (bit widths inferred from the shift amounts:
   `lsl#0x10/lsr#0x18` = 8-bit field at bit 16; `lsl#0x18/lsr#0x18` = 8-bit
   field at bit 24; `lsl#0x8/lsr#0x18` = 8-bit field at bit 8). This is
   DISTINCT from both `Ov000Row` (44-byte stride, `+8`/`+12` byte fields) and
   `HitRect` (12-byte, u16 x/y + u8 w/h + u16 attr) — `021ac098`'s existing
   round-1 recipe typed its argument as `HitRect *r` but that was an
   approximation; the real struct this pass reveals is 3-4 words of nested
   sub-byte dimension/position fields, closer to a "packed rect with
   fractional sub-pixel fields" than the plain `HitRect`. Worth a dedicated
   `docs/research/types/` entry once the bit-widths are pinned down exactly
   (this pass provides the shift amounts verbatim above for that purpose).

3. **`data_ov000_021b56b4`** — now confirmed used by AT LEAST 4 functions
   this pass (`021ae2cc`, `021ae510`, `021ae69c`, plus the already-drafted
   `021ae394`), all reading DIFFERENT sub-offsets within the stride-0x28 row
   (`+8` short pair per `021ae394`'s draft, `+2` short per `021ae2cc`'s
   reading, `+0xa`/full-row-index per `021ae510`). This table is clearly a
   significant shared per-slot animation/layout record wider than the 2
   shorts currently drafted — a full-row survey (dump all 0x28 bytes across
   several known-good indices) would materially help future ov000 work on
   `021ae95c`/`021aed8c`/`021ac578`, all of which touch this same table
   indirectly via their callees.

4. **`data_ov000_021b55dc`..`021b568c` (7 symbols, `021ad660`'s block) and
   `data_ov000_021b55de`..`021b565c` (7 symbols, `021ad8dc`'s parallel
   block)** — 14 total globals, all read once each via simple `ldr`/`ldrh`
   with no further offset (i.e. they're likely small scalar or short-array
   configs, not big structs) feeding the `func_0201ef90`/`func_ov000_021ac478`
   /`021ac508`/`021ac530` call chain. Sizes and exact types unknown — these
   are the two VRAM/task "instance" descriptor blocks referenced generically
   in `ov000_core.h`'s wall note but never individually cataloged.

5. **`func_020a6afc`** (called by `021adfc4`) and **`func_020055b4`** /
   **`func_0201eaa0`** (called by `021aed8c`) — three main-arm9 callees with
   no KB hits anywhere (`grep` across all of `docs/research/` and
   `src/main/` returned nothing). `func_0201eaa0`'s call shape (12 stack/reg
   args, several matching the `0x1c000`/`0x600` constants already seen in
   the `func_0201e964` window-builder family) suggests it is a sibling or
   variant of that family — worth checking against `func_0201e964`'s
   existing signature before assuming a wholly new API.

6. **`data_ov000_021b569c`** (used by `021af5e0`) — a 6-word (0x18-byte)
   literal init block, structurally identical in USAGE (ldmia/stmia copy
   pattern) to the already-known `data_ov000_021b566c`/`021b567c` blocks
   used by `021ad084` — likely a THIRD member of the same "VRAM cell config
   template" family. Confirming this would let a future pass generalize the
   `021ad084` recipe to `021af5e0` directly.

7. **`data_020bf280`** offset `+0x5c`/`+0x5e` (used by `021aa4c4`) — this
   large uncarved rodata table (per `arm9-main-checksum-recovery.md`, 3328
   bytes, currently only characterized at its `+0xba0` checksum-diff region)
   is read here as two adjacent `s16` values. Given the surrounding
   `0x1000`/`0x200000`/`-0xbf000` context (object-init defaults), these two
   shorts are plausibly a default width/height or X/Y pair for a newly
   initialized object — but this is speculative without carving more of the
   table.

8. **`func_0208bfa8` call-site ambiguity** (flagged inside the `021aaee4`
   write-up above) — the confirmed main-arm9 body
   (`src/main/func_0208bfa8.legacy.c`) is a void thunk with no return value,
   yet the ov000 `.s` call site immediately consumes `r0` afterward as if it
   were a return value. This is either (a) a different symbol at link time
   (unlikely, since `.extern func_0208bfa8` in the `.s` would then be wrong),
   (b) the consumed `r0` is actually a value that survived the call in a
   caller-saved-but-not-clobbered register (possible if `func_0208bfa8`'s
   real body, being a 2-call void thunk, happens not to touch `r0`), or
   (c) evidence that `021aaee4`'s disassembly-derived call target is
   actually WRONG (a different, unnamed nearby function). Recommend a
   dedicated check (read the actual bytes at `0x0208bfa8` in the ROM) before
   trusting either the KB's `func_0208bfa8` identity or this function's
   reliance on it.
