[//]: # (markdownlint-disable MD013 MD041)

# Small Overlays Re-triage R7 (ov001, ov007, ov013, ov018, ov021, ov022)

Generated 2026-07-01 against branch `kb/retriage-r7`. All 28 target functions
across 6 overlays were previously classified class E/F ("hard tier") by the
original automated heuristic, before the struct/data/constants KB existed.
ov001 and ov007 had never been examined in any prior retriage round; ov013,
ov018, ov021, ov022 got at most a 1-3 function sample in an early round.
Every listed address below was confirmed as still `.s` (none had been
flipped to `.c` by another lane) and was read in full — assembly, literal
pool, `bl`/`blx` targets, and struct-offset access patterns — then
cross-referenced against `docs/research/constants/`, `docs/research/data/`,
`docs/research/types/`, and (where they existed) per-overlay `ov0NN_core.h`
knowledge headers and `docs/research/map/overlay0NN.md` module maps.

**Major finding that overturns this brief's own working assumption:** the
three `0x021aa4a0` entries (ov018/ov021/ov022) were flagged in the task
brief as "almost certainly the SAME 'linked-list loop with mla' shape reused
across sibling overlays." Independent reads by three different agents (plus
my own direct verification) all agree: **this is false.** The three
functions at that address are completely unrelated — different externs,
different instruction counts, different logic, no `mla` instruction and no
linked-list traversal in any of the three. This is a case of coincidental
overlay-swap address collision (the same phenomenon the project's own
`CLAUDE.md` documents for ov000/ov002 sharing `0x021aaee0`), not shared C
source. See the "021aa4a0 cross-overlay identity" section below for the
full three-way comparison. The campaign needs **three separate recipes**
for this address, not one cross-referenced three times.

---

## Summary by overlay

| Overlay | Functions examined | Newly tractable | Confirmed wall | Notes |
|---------|--------------------|------------------|----------------|-------|
| ov001   | 3                  | 3                | 0              | Never examined before; all 3 already had HIGH-confidence names in `docs/research/map/overlay001.md` |
| ov007   | 1                  | 1                | 0              | Never examined before; sibling map doc already existed |
| ov013   | 5                  | 4                | 1 (partial)    | Giant 18-way dispatcher is a genuine mixed bag: dispatch shape + ~8-9 cases tractable, ~5 case bodies are walls |
| ov018   | 6                  | 5                | 1              | The 5684B/966-insn state machine is a confirmed genuine wall; everything else tractable |
| ov021   | 6                  | 0                | 6              | All 6 confirmed WALL — matches the prior campaign's own `ov021_core.h` verdict exactly |
| ov022   | 7                  | 7                | 0              | Fresh overlay, never examined; full module map already existed and matched every finding |
| **TOTAL** | **28**           | **20**           | **8**          | (ov013's dispatcher counted once, split internally below) |

---

## `021aa4a0` cross-overlay identity check (read this first)

Per-file comparison of the three copies at address `0x021aa4a0`:

| Property | ov018 | ov021 | ov022 |
|----------|-------|-------|-------|
| Size | 348B (0x15c) | ~96B (0x60) | ~136B (0x88) |
| Registers saved | `{r4, lr}` | `{r3, lr}` | `{r3, r4, r5, lr}` |
| Data externs | `data_ov018_021ad860`, `data_ov018_021ad8a8`, `data_ov018_021ae160` | `data_021040ac`, `data_ov021_021abea0`, `data_ov021_021ace80`, `data_ov021_021ad7d4` | `data_ov022_021abae8`, `data_ov022_021acaa0` |
| Func externs | `Task_Invoke`, `func_0201e5b8` | `func_020071a4` | `func_0208f2a8/2f4/368/4c8/52c/5ac`, `func_0207ec68/ed94` |
| `bl`/`blx` | 2 `bl`, 0 `blx` | 1 `bl`, 1 `blx` | 8 static `bl` sites |
| Shape | 10-block halfword-pack sequence into BG-scroll MMIO (`0x04000010`/`0x04001010`/`0x04001014`), then conditional `Task_Invoke` + OAM bit clear | dispatch-table-advance (index `data_ov021_021ace80[0]` into fn-ptr table `data_ov021_021abea0`, `blx`, conditional clear + fallback toast via `func_020071a4`) | bit-test guard (`data_ov022_021acaa0+0x198` bit0) → 6-call VRAM/engine-reset block, then fixed 2-iteration band-object init loop (stride `0x41c`) |
| Semantic name | `Ov018_FlushOamToRegs` | (unnamed in this batch; dispatch-advance variant, structurally close to `Ov018_DispatchFuncTableEntry`) | `Ov022_InitSubScreenBands` |

None of the three contains an `mla` instruction or a `next`-pointer linked-list walk. The heuristic's shared one-line description ("linked-list loop with mla, nested calls, many live regs") does not match any of the three bodies at the instruction level — it appears to have been a generic/copy-pasted classifier tag, not derived from actually reading each `.s`. All three verdicts below are TRACTABLE individually, written up separately under their own overlay section.

---

## ov001 Newly Tractable Funcs

All three had HIGH-confidence prose already in `docs/research/map/overlay001.md` / `docs/research/map/NAMES.md` (`Ov001_SetupOamTasks`, `Ov001_Update`, `Ov001_StepCallback`) — a prior naming pass evidently read these `.s` bodies for semantics without flipping them to `.c`. My own read and the research agent's independent read both confirm every detail below.

### 0x021C9F24 (336B, class F) — Ov001_SetupOamTasks

**Original verdict:** never examined (0 examined before R7).

**Upgrade reason:** Conditional dual-OAM-task builder. Copies a 48-byte
rodata table (`data_ov001_021ca348`, already matched as `.c`) onto the
stack, selects a row via a boolean flag, builds one OAM task
conditionally (gated by a validity probe) and a second one
unconditionally, calling `Task_Invoke` on each. 9 calls total — matches
the heuristic's own count.

**Struct/data dependencies:**
- `data_ov001_021ca348` — already matched, 48-byte table of 4 pointer
  pairs (2 rows × 2 entries × 8-byte stride, 24-byte row stride).
- `data_021040ac` (`GlobalAudioState`) `+0x34` — boolean row-select flag.
  **NEW field, not yet in `docs/research/types/GlobalAudioState.md`**
  (that doc's earliest documented field is `+0x03C`; `+0x34` sits before
  it).
- `data_ov001_021ca404` — **NEW undocumented global**: a "validity
  token" passed to `func_020aaf40` alongside the row's function-pointer
  entry.

**Ground-truth pool words:**

```
_LIT0: .word data_ov001_021ca348
_LIT1: .word data_021040ac
_LIT2: .word data_ov001_021ca404
```

**BL targets (verbatim, in order):** `func_020aaf40`, `func_0201d47c` (×2),
`func_02006c0c` (×2), `func_0201e5b8` (×2), `Task_Invoke` (×2).

**Complete C sketch:**

```c
extern unsigned char data_ov001_021ca348[48];   /* matched rodata table */
extern GlobalAudioState data_021040ac;           /* +0x34 = NEW field */
extern int data_ov001_021ca404;                  /* NEW: validity token */
extern void *func_0201d47c(void *oam_task_28byte);
extern void  func_0201e5b8(void *oam_task_28byte);
extern int   func_02006c0c(void *entry, int priority, int flags);
extern int   func_020aaf40(void *entry, int token);
extern void  Task_Invoke(void *handle);

void func_ov001_021c9f24(int slotIdx) {
    struct { void *fn0, *fn1; char pad[16]; } table[2]; /* 2 rows, 24B stride */
    memcpy(table, data_ov001_021ca348, sizeof(table));

    int row = (data_021040ac.f34 != 0) ? 1 : 0;
    void *entry = ((void **)&table[row])[slotIdx];   /* r6, 8-byte-stride index */

    int oam_task1[10];   /* sp+0x28, 0x28 bytes */
    if (func_020aaf40(entry, data_ov001_021ca404)) {
        void *h1 = func_0201d47c(oam_task1);
        int handle = func_02006c0c(entry, 4, 0);
        oam_task1[0] = handle;
        /* bitfield pack at +0x3c/+0x40: bic #0x7f/#0xf/#0x3f80/#0x10, no orr */
        func_0201e5b8(oam_task1);
        Task_Invoke(handle);
    }

    int oam_task2[10];   /* sp+0x0, 0x28 bytes, unconditional */
    void *h2 = func_0201d47c(oam_task2);
    void *entry_b = table[row].fn1;
    int handle2 = func_02006c0c(entry_b, 4, 0);
    oam_task2[0] = handle2;
    /* same bitfield pack, but this struct additionally ORs in 0x5 */
    func_0201e5b8(oam_task2);
    Task_Invoke(handle2);
}
```

**Levers:** the exact 0x28-byte OAM-task struct field layout (offsets
0x3c/0x40 of the *stack frame*, packed via `func_0201e5b8`) needs objdiff
iteration; the `orr r0,r0,#0x5` divergence between the two task builds is
a real reshape risk to watch. No scheduling wall — every register's
provenance is traceable, no unresolved `blx`.

---

### 0x021CA144 (404B, class F) — Ov001_Update

**Original verdict:** never examined.

**Upgrade reason:** Frame-counter-driven scroll animation with a 3-way
top-level dispatch (mode byte 0 / 0xa / other) and a nested 4-way range
dispatch inside mode 0 (frame ≤0x3c / 0x3c-0xb4 / 0xb4-0xf0 / >0xf0).
Uses the documented `0x88888889` smull magic constant — confirmed here
as the **÷60** reciprocal (post-shift `asr #0x5`), applied once to a
positive numerator and once (via `rsb` negation) to a negative one for
the outbound-scroll branch.

**Struct/data dependencies:**
- `data_ov001_021ca420` — the BSS "per-overlay work buffer" already
  described generically in `overlay001.md`; my read pins its exact
  byte-field layout: byte0 = mode selector, byte1 = frame counter
  (wraps 0-255), byte2 = sub-counter/latch, byte3 = unused.
- `0x88888889` = mwcc ÷60 signed reciprocal (`asr #0x5` post-shift;
  `2^35/0x88888889 ≈ 60` — cross-confirmed against 4 other dossiers in
  the tree using the same constant at the same shift level).

**Ground-truth pool words:**

```
.L_021ca2cc: .word data_ov001_021ca420
.L_021ca2d0: .word data_ov001_021ca420   (pooled twice, same symbol)
.L_021ca2d4: .word 0x88888889
```

**BL targets (verbatim, in call order, 10 unique/15 total sites):**
`func_ov000_021ab520` (×4), `func_ov000_021ab5ac` (×4), `func_ov001_021c9f24`
(×1, self-overlay re-arm), `func_ov000_021ab6cc` (×1, already matched
`.c` — "byte-low-zero check"), `func_02005e20` (×2), `func_02005ca0` (×2),
`func_ov000_021ab8f8` (×1).

**Complete C sketch:**

```c
extern unsigned int data_ov001_021ca420[1];
extern void func_ov000_021ab520(int engine, int val);
extern void func_ov000_021ab5ac(int engine, int val);
extern int  func_ov000_021ab6cc(void);            /* MATCHED already */
extern void func_ov001_021c9f24(int arg);
extern void func_02005e20(int engine);
extern void func_02005ca0(int engine);
extern void func_ov000_021ab8f8(void);

int func_ov001_021ca144(void) {
    unsigned int w = data_ov001_021ca420[0];
    int mode  = (unsigned char)(w >> 24);
    int frame = (unsigned char)(w >> 8);
    int done  = 0;

    if (mode == 0) {
        int sub = (unsigned char)(w >> 16);
        if (frame <= 0x3c) {
            func_ov000_021ab520(0, 1);
            func_ov000_021ab520(1, 1);
            int v = (frame * 16) / 60 - 16;          /* 0x88888889, asr#5 = /60 */
            func_ov000_021ab5ac(0, v);
            func_ov000_021ab5ac(1, v);
        } else if (frame < 0xb4) {
            /* no-op band */
        } else if (frame <= 0xf0) {
            func_ov000_021ab520(0, 1);
            func_ov000_021ab520(1, 1);
            int v = -(((frame + 0x3c) * 16) / 60);
            func_ov000_021ab5ac(0, v);
            func_ov000_021ab5ac(1, v);
        } else {
            if (sub + 1 >= 2) {
                done = 1;
            } else {
                func_ov001_021c9f24(sub + 1);   /* r0 stale-carries sub+1 into the call */
                w = (w & ~0xff0000u) | (((sub + 1) & 0xff) << 16);
                data_ov001_021ca420[0] = w;
            }
        }
        w = data_ov001_021ca420[0];
        w = (w & ~0xff00u) | (((frame + 1) & 0xff) << 8);
        data_ov001_021ca420[0] = w;
    } else if (mode == 0xa) {
        if (func_ov000_021ab6cc() != 0) done = 1;
    }

    func_02005e20(1);
    func_02005e20(2);
    func_02005ca0(1);
    func_02005ca0(2);
    func_ov000_021ab8f8();
    return done;
}
```

**Levers:** the `r6=r5` tail-merge reuse at the `.L_021ca238`→`.L_021ca274`
join and the exact arg to the nested `func_ov001_021c9f24` call (inherits
`r0` from `add r0,r7,#0x1` two instructions earlier, i.e. `sub+1`) need
care to keep alive across the `bl` without an intervening def — standard
reg-reuse reshape, not a wall.

---

### 0x021CA2F8 (80B, class E) — Ov001_StepCallback

**Original verdict:** never examined.

**Upgrade reason:** Exact match to the KB's own documented "dispatch-table-
advance" pattern (Pattern A1 in `docs/research/data/VtableDispatchPatterns.md`
and `FunctionPointerTables.md` §10, which explicitly names `ov001 |
func_ov001_021ca2f8` as a listed instance). The heuristic's "post-blx
coin-flip" concern does not apply: there is exactly **one** `blx` site,
its return value is tested immediately with no register rotation, and
both post-call branches are simple early-returns. Same shape as this
batch's `func_ov021_021aa4a0`/`func_ov022_021ab460`/`func_ov018_021ace14`
(sibling dispatch-table-advance instances found in this very retriage
round).

**Struct/data dependencies:**
- `data_021040ac+0xb6c` (`GlobalAudioState.fb6c`) — already documented
  ("r/w by func_020057dc"; cross-referenced in `DuelStateSingleton.md` as
  "identical to the per-overlay pattern... each duel phase installs a
  different handler here").
- `data_ov001_021ca384` — **NEW undocumented global**: the fn-ptr
  dispatch table itself. Should be added to `FunctionPointerTables.md`,
  cross-referenced from the existing Pattern A1 `ov001` row.

**Ground-truth pool words:**

```
_LIT0: .word data_021040ac
_LIT1: .word data_ov001_021ca384
```

**BL/BLX targets:** zero `bl`; one `blx r0` (indirect, target =
`data_ov001_021ca384[data_021040ac.fb6c]`).

**Complete C sketch:**

```c
typedef int (*Ov001StepFn)(void);
extern GlobalAudioState data_021040ac;
extern Ov001StepFn data_ov001_021ca384[];   /* NEW: fn-ptr table */

int func_ov001_021ca2f8(void) {
    Ov001StepFn fn = data_ov001_021ca384[data_021040ac.fb6c];
    if (fn == 0) {
        return 1;
    }
    if (fn() != 0) {
        data_021040ac.fb6c += 1;
    }
    return 0;
}
```

**Levers:** null-check-before-`blx`; increment-on-nonzero; return
polarity (0=ran, 1=exhausted) — no wall.

---

## ov007 Newly Tractable Funcs

### 0x021B2694 (560B, class F) — Ov007_WorkA_ProcessInput

**Original verdict:** never examined (0 in prior rounds). Already had a
HIGH-confidence entry in `docs/research/map/overlay007.md`.

**Upgrade reason:** Flag-bit dispatch chain (test against 3 different
input halfwords, each firing a mutually exclusive action) plus one
bounded 2-row scan loop over a known 0x18-stride table, converging on a
2-stage conditional render tail. **No `blx` anywhere** in the function —
every call target is statically named, and 6 of 8 callees are already
matched `.c` files with known exact signatures.

**Struct/data dependencies:**
- `data_02104bac+0x54` — `KEYINPUT` current-frame state, HIGH confidence,
  already documented.
- `data_02104bac+0x52` — sibling input halfword, already attested in
  other matched files.
- `data_02104bac+0x58` — **NEW offset**: a third KEYINPUT-family halfword
  (d-pad-style 4-direction bit tests `0x10/0x20/0x40/0x80` plus combined
  bits `0x30`). Not yet in `docs/research/types/GlobalData02104bac.md`
  (which only documents `+0x54`).
- `data_020c9694` — confirmed 0x18-stride main-binary table, sentinel
  = negative halfword; used identically by matched siblings
  `func_ov007_021b2630`/`021b2ef0` in the same overlay.
- The per-instance "self" argument (`r6`) — fields `+0x3c/0x40/0x44/0x48/0x4c`
  match the **already-independently-inferred** `Ctx_021b299c` struct
  from `docs/research/dossiers/021b299c.md`. Traced the pointer chain:
  `func_ov007_021b2568` (Ov007_WorkA_Init) zero-fills the object →
  `func_ov007_021b25a0` (Ov007_WorkA_Update) relays it unchanged as `r0`
  → both `021b2630` and this function receive it. Confirms it's the
  same object instance across 3+ files, not merely a local guess —
  worth promoting to a proper `docs/research/types/Ov007WorkACtx.md`
  entry.

**Ground-truth pool words:**

```
_LIT0: .word data_02104bac
_LIT1: .word data_ov007_0223352c
_LIT2: .word data_020c9694
```

**BL targets (verbatim, in order):** `func_0202224c`, `func_02022234`,
`func_ov007_021b2c58`, `func_ov007_021b2cf8`, `func_02037208`,
`func_ov007_021b2c44`, `func_ov007_021b299c`, `func_ov007_021b2b74`.

**Complete C sketch:**

```c
typedef struct Ov007WorkACtx {
    char _pad[0x3c];
    int f3c;   /* column/glyph cursor, wraps 0..0x12/0x13 */
    int f40;   /* row cursor, wraps 0..2/3 */
    int f44;   /* value-slot cursor, wraps 0..2/3 */
    int f48;   /* 0/1 mode toggle */
    int f4c;   /* row-select index into data_020c9694, dynamically bounded */
} Ov007WorkACtx;

extern unsigned short data_02104bac[];
extern short data_020c9694[];
extern char  data_ov007_0223352c[];   /* opaque ctx tag, unused by callees here */

extern int  func_0202224c(int idx);
extern int  func_02022234(unsigned int idx, unsigned int v);
extern int  func_ov007_021b2c58(void *a0, int a1, int a2, int a3, int a4);
extern int  func_ov007_021b2cf8(int ctx, int idx1, int idx2);
extern void func_02037208(int id, int a1, int a2, int a3);
extern int  func_ov007_021b2c44(void);
extern void func_ov007_021b299c(Ov007WorkACtx *self);
extern void func_ov007_021b2b74(void *ctx, int row_value);

int func_ov007_021b2694(Ov007WorkACtx *self) {
    unsigned short keys = data_02104bac[0x54 / 2];
    unsigned short k52  = data_02104bac[0x52 / 2];
    unsigned short k58  = data_02104bac[0x58 / 2];   /* NEW offset */
    int handled = 0, redraw2 = 0;

    if (keys & 0x2) {
        func_02022234(0, func_0202224c(0) | 0x8000);
        return 1;
    }
    if (keys & 0x1) {
        func_ov007_021b2c58(data_ov007_0223352c, self->f3c, self->f40, self->f44, self->f48);
        int row_val = func_ov007_021b2cf8((int)data_ov007_0223352c, self->f3c, self->f40);
        func_02037208(row_val, -1, 0, 1);
        goto tail;
    }
    if (keys & 0x400) {
        self->f44 += 1;
        if (self->f44 >= 3) self->f44 = 0;
        func_ov007_021b2c44();
        handled = 1;
        goto tail;
    }
    if (keys & 0x800) {
        handled = 1;
        self->f48 = 1 - self->f48;
        goto tail;
    }
    if ((k52 & 0x4) && (k58 & 0x30)) {
        int count = 0;
        short *row = data_020c9694;
        while (*row >= 0) { row += 0x18/2; count++; }
        if (k58 & 0x20) {
            self->f4c -= 1;
            if (self->f4c < 0) self->f4c = count - 1;
        } else if (k58 & 0x10) {
            self->f4c += 1;
            if (self->f4c >= count) self->f4c = 0;
        }
        handled = 1;
        redraw2 = 1;
        goto tail;
    }
    if (k58 & 0xf0) {
        if (k58 & 0x20) {
            self->f3c -= 1;
            if (self->f3c < 0) self->f3c = 0x12;
        } else if (k58 & 0x10) {
            self->f3c += 1;
            if (self->f3c >= 0x13) self->f3c = 0;
        } else if (k58 & 0x40) {
            self->f40 -= 1;
            if (self->f40 < 0) self->f40 = 2;
        } else if (k58 & 0x80) {
            self->f40 += 1;
            if (self->f40 >= 3) self->f40 = 0;
        }
        handled = 1;
    }
tail:
    if (handled) func_ov007_021b299c(self);
    if (redraw2) {
        short row_field0 = data_020c9694[self->f4c * (0x18/2)];
        func_ov007_021b2b74(data_ov007_0223352c, row_field0);
    }
    return 0;
}
```

**Levers:** field access order within the 4-way d-pad cascade; the
"cast to `Ov007WorkACtx*`" identity is de-risked by the 3-file
cross-confirmation above. No wall.

---

## ov013 Tractable Funcs

ov013's `ov013_core.h` (a prior-wave knowledge header) explicitly listed
these exact 5 functions as the deferred "big bodies" left untried after an
earlier 5-pick wave — confirming they're genuinely unexamined, as the
task states.

### 0x021C9D74 (644B, class F) — Ov013_Init

**Upgrade reason:** Flat, single-entry-point init sequence, one
conditional gate (`GetSystemWork()[0x900]` bit 11). 36 calls, matching
the heuristic exactly. Every callee and constant is deterministic;
mwcc emits straight-line calls in source order for this shape — same
class as the already-confirmed-tractable ov006 "full-init VRAM family."

**Struct/data dependencies:** `data_ov013_021cbc3c` (Fill32 target, size
0x598), `data_02104f1c+0x1c`, `data_02104f4c+0x4` (3-bit config field,
same extraction shape used elsewhere in this overlay), raw MMIO writes
at `0x04000060`/`+0x1000` (BG-mosaic-family registers, not struct
offsets — flagged so the bracket-offset syntax isn't misread as a
struct access), `0x04000304`/`0x04000000`/`0x04001000` (DISPCNT family).

**Ground-truth pool words:**

```
_LIT0: .word data_ov013_021cbc3c      _LIT7: .word 0x04000580
_LIT1: .word 0x00000598                _LIT8: .word data_02104f1c
_LIT2: .word 0x000001ff                _LIT9: .word data_ov013_021cbcac
_LIT3: .word 0x04000060                _LIT10: .word 0x04000304
_LIT4: .word 0xffffcffd                _LIT11: .word 0xffcfffef
_LIT5: .word 0x0000cffb                _LIT12: .word data_ov013_021cbc00
_LIT6: .word 0xbfff0000                _LIT13: .word data_02104f4c
```

**BL targets (verbatim, in call order):** `Fill32`, `func_0200592c`,
`func_0208d1e4`, `func_02094504` (×3), `func_0208cc90`, `func_ov000_021ab21c`,
`func_0208e7ac`, `func_0208da2c`, `func_0208d7ac`, `func_0208d8c0`,
`func_0208d6f4`, `func_0208c8cc`, `func_ov000_021ab4bc` (×2, args
`(0,0x12)` and `(1,0x10)`), `func_0208e5ec`, `func_0207deb0`,
`func_0207e124`, `func_0207e370`, `func_0208d138`, `func_0208d0bc`,
`func_0208d030`, `func_0208cfa4`, `func_0208c8b0`, `func_0201d5c0` (×2,
no-arg then `(9,2)`), `func_ov000_021af4bc`, `func_0202adf8`,
`func_0202c070`, `func_ov000_021aae54`, `func_02005bfc` (×2),
`func_0208232c`, `GetSystemWork`, `func_ov000_021ab6ec` (conditional).

**Complete C sketch:**

```c
void func_ov013_021c9d74(void) {
    Fill32(0, data_ov013_021cbc3c, 0x598);
    func_0200592c();
    func_0208d1e4(0x1ff);
    func_02094504(0, 0x6800000, 0xa4000);
    func_0208cc90();
    func_02094504(0xc0, 0x7000000, 0x400);
    func_02094504(0, 0x5000000, 0x400);
    func_ov000_021ab21c();
    func_0208e7ac();
    func_0208da2c(1);
    func_0208d7ac(0x40);
    func_0208d8c0(2);
    func_0208d6f4(0x20);
    func_0208c8cc(1, 0, 0);
    func_ov000_021ab4bc(0, 0x12);
    /* raw MMIO RMW at 0x04000060 (+its 0x1000 sub-mirror): 4x ldrh/and/orr/strh */
    *(vu16*)0x04000060 &= 0xffffcffd;
    *(vu16*)0x04000060 = (*(vu16*)0x04000060 & ~0x3000) | 0x10;
    *(vu16*)0x04000060 &= 0x0000cffb;
    *(vu16*)0x04000060 = (*(vu16*)0x04000060 & ~0x3000) | 0x8;
    *(vu32*)0x040004e0 = 2;
    func_0208e5ec(0);
    *(vu32*)0x04000580 = 0xbfff0000;
    func_0207deb0(data_ov013_021cbcac, data_02104f1c.f1c, 4);
    func_0207e124(2, 1);
    func_0207e370(0x10000, 1);
    func_0208d138(4);
    func_0208d0bc(8);
    func_0208d030(0x80);
    func_0208cfa4(0x100);
    func_0208c8b0(0);
    func_ov000_021ab4bc(1, 0x10);
    *(vu16*)0x04000304 &= ~0x8000;
    *(vu32*)0x04000000 = (*(vu32*)0x04000000 & 0xffcfffef) | 0x10 | 0x200000;
    *(vu32*)0x04001000 = (*(vu32*)0x04001000 & 0xffcfffef) | 0x10 | 0x200000;
    func_0201d5c0();
    func_0201d5c0(9, 2);
    func_ov000_021af4bc();
    func_0202adf8(data_ov013_021cbc00);
    int cfg = (data_02104f4c.f4 << 29) >> 29;
    func_0202c070(cfg);
    func_ov000_021aae54();
    func_02005bfc(1);
    func_02005bfc(2);
    func_0208232c();
    if (((GetSystemWork()->f900 << 20) >> 31) == 0) {
        func_ov000_021ab6ec(0, 0x10);
    }
    data_ov013_021cbc3c->f160 = (data_ov013_021cbc3c->f160 & ~0xff) | 0xff;
    data_ov013_021cbc3c->f13c = 0;
    data_ov013_021cbc3c->f140 = 0;
}
```

**Levers:** none needed beyond straight-line transcription; the MMIO
writes at `0x04000060` region are raw hardware registers not struct
offsets despite the bracket syntax. No wall.

---

### 0x021CA024 (312B, class F) — Ov013_BuildOamTask

**Upgrade reason:** One early-exit guard (`data_ov013_021cbc00+0x248 == 0`),
linear task-config build, one mode-gated bitfield double-patch block
(`data_ov013_021cbc3c+0x150 == 1`), linear tail. All field offsets are
either on the stack (task-config struct, same shape as sibling
`021ca15c`) or on already-confirmed `data_ov013_021cbc3c` fields — the
`+0x20c` task handle is independently cross-confirmed by
`func_ov013_021cb674.s` and `func_ov013_021cb700.s`.

**Struct/data dependencies:** `data_ov013_021cbc00+0x248` (zero-gate
flag), `data_ov013_021cbc3c+0x20c` (task handle, 3-file confirmed),
`data_ov013_021cbc3c+0x150` — **NEW field**: mode byte (1 = "secondary
sprite" path).

**Ground-truth pool words:**

```
_LIT0: .word data_ov013_021cbc00
_LIT1: .word data_ov013_021cbc3c
```

**BL targets:** `func_0201d47c`, `func_0201e5b8`, `Task_Invoke`,
`func_ov000_021ab4bc`, `func_0208c8cc`.

**Complete C sketch:**

```c
int func_ov013_021ca024(void) {
    if (data_ov013_021cbc00->f248 == 0) return 0;

    int cfg[10];   /* sp+0x0, 0x28-byte task-config struct */
    func_0201d47c(cfg);

    cfg->f14 = (cfg->f14 & ~0xf) | 0x10;
    cfg->f18 = (cfg->f18 & ~0x7f & ~0x3f80 & ~0x1c000) | 0x8000;
    cfg->f0 = data_ov013_021cbc3c->f20c;
    cfg->f8 = 0;
    cfg->fc = 0;
    cfg->f10 = 0x200;

    if (data_ov013_021cbc3c->f150 == 1) {
        cfg->f26 = (cfg->f26 & ~0xff) | 0x40;
        cfg->f14 = (cfg->f14 & ~0xf);
        cfg->f24 = (cfg->f24 & ~0xff);
        cfg->f1c = (cfg->f1c & ~0xff00);
        /* second pass, same fields, different masks */
        cfg->f26 = (cfg->f26 & ~0xff00) | 0x4000;
        cfg->f24 = (cfg->f24 & ~0xff00) | 0x4000;
        cfg->f16 |= 0x4000;
        cfg->f14 &= ~0x10;
        cfg->f10 = 0;
    }

    func_0201e5b8(cfg);
    Task_Invoke(cfg->f0);
    data_ov013_021cbc3c->f20c = 0;
    func_ov000_021ab4bc(0, 1);
    func_0208c8cc(1, 0, 0);
    return 0;
}
```

**Levers:** `ov013_core.h` calls this "bitfield-heavy struct-config" —
reshape lever only (write field inserts in the same textual order as
the assembly). No wall.

---

### 0x021CA15C (312B, class F) — Ov013_BuildCursorOamTask

**Upgrade reason:** The cleanest of the 5 — **zero branches at all**.
Two back-to-back "build task, invoke" blocks using data from
`data_ov013_021cb750` (confirmed 100-byte Cluster-C table). `ov013_core.h`
explicitly notes the size-histogram pairing with `021ca024` is
coincidental — different prologue, different body, both use
`func_0201d47c` only because it's the standard struct-config helper.

**Struct/data dependencies:** `data_ov013_021cb750+0x20`/`+0x24` — the
table's 9th/10th u32 words, two sprite/tile config pointers (`0x021cbb00`-
and `0x021cba54`-range addresses per the raw byte dump). Task priority
arg `4` matches the documented `OV006_TASK_PRIORITY`/OV011 lazy-init
factory constant family (cross-overlay reuse of this pattern).

**Ground-truth pool words:**

```
_LIT0: .word data_ov013_021cb750
```

**BL targets (verbatim, in order):** `func_020139b4`, `func_0201d47c`
(×2), `func_02006c0c` (×2), `func_0201e5b8` (×2), `Task_Invoke` (×2).

**Complete C sketch:**

```c
void func_ov013_021ca15c(void) {
    func_020139b4();

    void *ptr0 = ((void **)data_ov013_021cb750)[0x20/4];
    void *ptr1 = ((void **)data_ov013_021cb750)[0x24/4];

    int cfg1[10];   /* sp+0x8 */
    func_0201d47c(cfg1);
    cfg1->f1c = (cfg1->f1c & ~0xf) | 0x1;
    cfg1->f20 = (cfg1->f20 & ~0x7f & ~0x3f80 & ~0x1c000) | 0xc000;
    cfg1->f24 = ((cfg1->f24 & ~0xff) | 0x20) & ~0xff00 | 0x2000;
    cfg1->f10 = 0;
    cfg1->f14 = 0;
    cfg1->f18 = 0;

    int h1 = func_02006c0c(ptr0, 4, 0);
    cfg1->f0 = h1;
    func_0201e5b8(cfg1);
    Task_Invoke(h1);

    /* second build, same struct, different literal constants */
    int cfg2[10];
    func_0201d47c(cfg2);
    cfg2->f24 = ((cfg2->f24 & ~0xff) | 0x20) & ~0xff00 | 0x2000;
    cfg2->f1c = (cfg2->f1c & ~0xf) | 0x6;
    cfg2->f14 = 0x2000;
    cfg2->f1c |= 0x10;
    cfg2->f10 = 0;
    cfg2->f18 = 0;

    int h2 = func_02006c0c(ptr1, 4, 0);
    cfg2->f0 = h2;
    func_0201e5b8(cfg2);
    Task_Invoke(h2);
}
```

**Levers:** none — no conditional branches, no register-indirect calls;
straight-line reg-alloc is fully pinned by the two consecutive call
chains. No wall.

---

### 0x021CA42C (424B, class F) — Ov013_Activate

**Upgrade reason:** Linear except one conditional SE-play block and one
`GetSystemWork` bit-test at the tail. 22 calls matching the heuristic
exactly. Confirms the call graph: `Ov013_Activate` calls
`func_ov013_021ca15c` (Ov013_BuildCursorOamTask, this batch's own
function above) and installs the per-frame callback via
`func_02005800(func_ov013_021c9d60)`. Contains 3 hand-encoded veneer BL
instructions (`.word 0xebffXXXX`) whose *positions* are fixed but whose
*symbol names* need `config/eur/overlay013/symbols.txt` (not present in
this checkout) — this is a resolvable build-time gap, not a wall.

**Struct/data dependencies:** raw MMIO RMWs at `0x0400000a`/`+0x1000`
(BG2/3CNT family), `0x0400000c`/`+2` (companion register),
`data_021040ac+0x3c` (SE-play gate), `data_ov013_021cbc3c+0x168` (page
nibble, same field independently confirmed in `Ov013_SetPage.c` and
`func_ov013_021cb674.s`), `0x04001000` (sub-engine DISPCNT, OR
`0x10000` = documented `OV006_SUB_DISP_MODE`), `GetSystemWork()+0x900`
bits[10:9].

**Ground-truth pool words:**

```
_LIT0: .word 0x0400000a          _LIT4: .word 0x00000709
_LIT1: .word data_ov013_021cbc3c  _LIT5: .word func_ov013_021c9d60
_LIT2: .word 0x0400000c          _LIT6: .word 0x04001000
_LIT3: .word data_021040ac
```

**BL targets (verbatim, in order) plus decoded veneer addresses:**
`func_ov013_021ca15c`, `func_ov000_021ab4bc`, `func_ov000_021acebc`,
`func_ov000_021ace84`, `func_ov000_021aed18`, `func_ov000_021af3d0`,
`func_ov000_021ad3e8`, `func_ov000_021adc30`, `func_ov000_021adb70`,
`func_ov000_021af338`, `func_ov000_021af368`, `func_ov000_021ace2c`,
[conditional: `func_ov013_021ca2b8`, `func_0202c0c0`,
`func_ov000_021add44`], `func_020018d4`, `func_ov002_021b1200`
(cross-overlay call into ov002), `func_02005800`, `func_0208c940`.
Veneers (`target = pc+8 + sign_extend(imm24)*4`):

```
.word 0xebffa0ae  →  0x021b282c
.word 0xebff9bad  →  0x021b142c
.word 0xebffa0a8  →  0x021b284c   (only reached on GetSystemWork bit-test == 0)
```

Then tail `func_0201c198`. `0x021b282c`/`0x021b284c` are only 0x20 apart
— likely two entry points into the same small subsystem.

**Complete C sketch:**

```c
void func_ov013_021ca42c(void) {
    *(vu16*)0x0400000a = (*(vu16*)0x0400000a & 0x43) | 0xe90 | 0x3000;
    *(vu16*)0x0400100a = (*(vu16*)0x0400100a & 0x43) | 0x84 | 0x2400;
    *(vu16*)0x04000008 = (*(vu16*)0x04000008 & ~0x3) | 0x2;
    *(vu16*)0x0400000a = (*(vu16*)0x0400000a & ~0x3) | 0x3;
    *(vu16*)0x0400100a = (*(vu16*)0x0400100a & ~0x3) | 0x3;

    func_ov013_021ca15c();
    func_ov000_021ab4bc(1, 2);
    func_ov000_021acebc();
    func_ov000_021ace84(1);
    func_ov000_021aed18(1);
    func_ov000_021af3d0(1);
    func_ov000_021ad3e8();
    func_ov000_021adc30(9);
    func_ov000_021adb70();
    func_ov000_021af338(0xc);
    func_ov000_021af368(0x120);
    func_ov000_021ace2c(1);

    *(vu16*)0x0400000c &= ~0x3;
    *(vu16*)0x0400000e = (*(vu16*)0x0400000e & ~0x3) | 0x1;

    if (data_021040ac.f3c == 0) {
        int field = (data_ov013_021cbc3c->f168 << 14) >> 30;  /* 2-bit @ bit17 */
        func_ov013_021ca2b8(field);
        func_0202c0c0(0x709);
        func_ov000_021add44(0, /* arg */ 0);
    }

    func_020018d4(0xc0);
    func_ov002_021b1200();
    func_02005800(func_ov013_021c9d60);
    func_0208c940();
    *(vu32*)0x04001000 |= 0x10000;

    /* two unconditional veneer calls, targets 0x021b282c / 0x021b142c */
    extern void func_ov0??_021b282c(int);   /* symbol name TBD via symbols.txt */
    extern void func_ov0??_021b142c(void);
    int r0 = func_ov0??_021b282c(/* arg */ 0);
    func_ov0??_021b142c();

    if (r0 != 0) {
        if (((GetSystemWork()->f900 << 21) >> 30) == 0) {
            extern void func_ov0??_021b284c(void);
            func_ov0??_021b284c();
        } else {
            GetSystemWork()->f900 &= ~0x600;
        }
    }
    func_0201c198(3);
}
```

**Levers:** the 3 veneer target symbol names are the only gap, needing
`config/eur/overlay013/symbols.txt` at build time. Not a structural wall.

---

## ov013 Confirmed Wall (partial): 0x021CA7CC (3704B) — Ov013_UpdateFrame

**Original verdict:** never examined at this depth (heuristic tagged
"huge 18-way state dispatcher, 100 calls").

This is a genuine mixed result, not a blanket wall. The **dispatch
mechanism itself is fully tractable**: a byte-selector extracted from
`data_ov013_021cbc00+0x198` (bits[15:8]) drives an `addls pc,pc,r0,lsl#2`
18-entry jump table, converging on a shared epilogue that ticks a
2-element scroll-anim array, calls 4 fixed engine-select functions, and
returns a "consumed input" flag. The always-run prologue (bump a flag in
`data_ov000_021c73e4+0x140`, call `Ov013_SetBlendAlpha()`, decrement the
`data_ov013_021cbc00+0x178` EVA fade level by `0x800` per frame) is
likewise fully deterministic — confirms `overlay013.md`'s summary that
BLDALPHA is driven from this exact function every frame.

**Of the 18 case bodies:**

**Tractable (≈9 of 18):** table position 0/default (trivial — just the
epilogue), position 2 (`Ov000_IsMainModeActive` guard + 4 sequential
calls + counter bump), position 3 (brightness fade-out using the
documented `0x80808081` ÷255 smull idiom), position 9-numbered (nested
guard + clean 3-way switch, reuses the confirmed `021ca70c` sub_mode
extraction shape), position 11 (near-identical to position 2), position
12 (brightness fade-in, mirror of position 3), position 13 (linear
guard + 4 calls, calls sibling `func_ov013_021ca2b8`), position 16
(trivial single-call), the "extra" `.L_e58` position (simple
counter-threshold pattern). Positions 7, 9-labeled, and 17 are
"tractable body, wall gate" — clean logic once past an unresolved
entry-veneer call.

**Confirmed wall (6 of 18), each for a specific reason:**
- **Case 1** (`.L_154`): compound `subs`/`cmpne` condition testing
  "original value was 1 or 2" feeding a 3-way nested
  `Ov000_GetBits12to15` dispatch with an `==-1` sentinel test on a
  signed byte from an indexed struct — the register lifetime of the
  decremented value across the compound test is
  compiler-scheduling-dependent.
- **Case 4** (`.L_38c`): FOUR veneer BLs, two pairs sharing the same
  target (`0x021b2258`×2) fed from different live-register states,
  inside a 2-level-then-3-way nested conditional — the textbook
  "multiple blx dispatches, unknown register-allocation order"
  ambiguity.
- **Case 6** (`.L_628`): unbounded bit-scan loop with a
  **register-computed shift amount** (`lsl r0`, not `lsl #imm`) over
  `data_ov013_021cbc3c+0x174` — genuinely coin-flip-able loop body.
- **Case 8** (`.L_734`): the single most complex case — a direct bit
  test, falling into the SAME unbounded scan as case 6, then an 8-way
  power-of-2 magnitude cascade (`cmp`/`bgt`/`bge`, not a jump table)
  routing to 5 sub-bodies, one of which nests a THIRD unbounded scan
  against `GetSystemWork()+0x904`.
- **Case 14** (`.L_c48`): an `ldmia`/`stmia` **multi-register block
  struct-copy** from `data_ov013_021cb7b4` (textbook reg-alloc wall,
  not reshapeable) plus 2 veneer calls sharing target `0x021b1f00` fed
  from different sign-extension lanes of the same source word.
- **Case 15** (`.L_d50`): 2 veneer calls to the same generic target
  (`0x021b1478`) with different single-pointer arguments
  (`data_ov013_021cbbd0`/`data_ov013_021cbbe8` — see New KB gaps),
  selected by a 2-way switch — same "unresolved animation-dispatch"
  pattern as the confirmed-tractable `021ca70c`, but here the case
  can't be fully written without the veneer's true signature.

**Recurring veneer targets** (decoded, 16 total across the function):
`0x021b1478` appears 5×, `0x021b14ec` appears 4×, `0x021b2258` appears
2×, `0x021b1f00` appears 2× — strong evidence these are small, generic,
frequently-reused helper predicates in the same family `ov013_core.h`
already flags as "post-blx register rotation... not C-steerable"
(e.g. its own note on `021cb700`).

**Recommendation:** ship the dispatch shell + 9 tractable cases now;
route cases 1/4/6/8/14/15 to the permuter/macOS lane once
`symbols.txt` resolves the veneer names, per this overlay's established
Mac-phase-dedup pattern.

---

## ov018 Newly Tractable Funcs

### 0x021AA4A0 (348B actual — task listed 160B, stale heuristic estimate) — Ov018_FlushOamToRegs

**Upgrade reason:** Mechanical 10-block halfword-pack idiom (AND/AND/ORR/STR
repeated with different source-offset pairs) writing to 3 fixed BG-scroll
MMIO destinations across both screens, then a conditional `Task_Invoke` +
OAM bit clear. **No `mla`, no linked-list walk** despite the heuristic's
generic label — see the cross-overlay identity section above.

**Struct/data dependencies:** `data_ov018_021ad860+0x96c..0x9a8` (5
source field-pairs), `data_ov018_021ae160+0xfc` (gate bit),
`data_ov018_021ad8a8+0x900+0xb4`/`+0x988`/`+0x18c` (already-known ov018
work struct, per `ov018_core.h`'s field map).

**Ground-truth pool words:**

```
_LIT0: .word data_ov018_021ad860       _LIT3: .word 0x04001014
_LIT1: .word 0x000001ff                _LIT4: .word data_ov018_021ae160
_LIT2: .word 0x04000010                _LIT5: .word data_ov018_021ad8a8
```

**BL targets:** `func_0201e5b8`, `Task_Invoke`.

**Complete C sketch:**

```c
void func_ov018_021aa4a0(void) {
    unsigned short *src = (unsigned short *)((char *)data_ov018_021ad860 + 0x96c);
    *(vu32*)0x04000010 = pack16(src[0], src[1]);
    *(vu32*)0x04000014 = pack16(src[2], src[3]);
    *(vu32*)0x04000018 = pack16(src[4], src[5]);
    *(vu32*)0x0400001c = pack16(src[6], src[7]);
    *(vu32*)0x04001010 = pack16(src[8], src[9]);
    *(vu32*)0x04001014 = pack16(src[10], src[11]);
    *(vu32*)0x04001018 = pack16(src[12], src[13]);
    *(vu32*)0x0400101c = pack16(src[14], src[15]);

    if (((data_ov018_021ae160->fc >> 3) & 1) != 1)
        return;

    func_0201e5b8((char *)data_ov018_021ad8a8 + 0x18c + 0x800);
    Task_Invoke(*(void **)((char *)data_ov018_021ad8a8 + 0x988));
    data_ov018_021ad8a8->f988 = 0;
    ((u16 *)((char*)data_ov018_021ad8a8 + 0x900))[0x5a] &= ~0x8;
}
```

**Levers:** the exact C phrasing for the AND+AND+ORR pack idiom (masked
`0x1ff` halfword pack) is the only reshape risk. No wall.

---

### 0x021AADDC (632B, class F) — Ov018_HandleTouchSelect

**Upgrade reason:** 4-way mode dispatch (0/1/other/bit15) building 2-3
bounding boxes on the stack, then a fixed 2-iteration hit-test scan,
confirm/change SFX via `func_02037208`. The "many strh store-order
branches" heuristic label overstates ambiguity — store order across the
3 mutually-exclusive builder branches is fully determined by the
3-bit page index, not a coin-flip.

**Struct/data dependencies:** `data_02104f4c+0x4` (3-bit page field,
cross-confirmed with `Ov018_GetPageIndex`'s documented extraction),
`data_ov018_021ad2e4`/`021ad2f0`/`021ad2fc`/`021ad308` — **4 NEW
undocumented globals**: per-page halfword lookup tables feeding one edge
of a touch-hit bounding box each.

**Ground-truth pool words:**

```
_LIT0: .word data_ov018_021ad8a8    _LIT3: .word data_ov018_021ad2fc
_LIT1: .word data_02104f4c          _LIT4: .word data_ov018_021ad2f0
_LIT2: .word data_ov018_021ad308    _LIT5: .word data_ov018_021ad2e4
```

**BL targets:** `func_02006164`, `func_0200612c`, `func_02037208` (×2
call sites, args `(0x97,-1,0,1)` confirm and `(0x38,-1,0,1)` change).

**Complete C sketch:**

```c
int func_ov018_021aaddc(void) {
    OamWork *w = data_ov018_021ad8a8;
    if (!func_02006164()) return 1;
    s16 py, px;
    func_0200612c(&py, &px);

    BBox boxes[2];
    if ((w->f9b4 & 0x8000) != 0) {
        /* 3-box layout path */
        int page = (data_02104f4c->f4 << 3) >> 0x1c;
        u16 v = data_ov018_021ad2f0[page];
        boxes[0] = make_box(0x7e, v, 0x7e + 0x14);
        w->f4 = 1;
    } else {
        int page = (data_02104f4c->f4 << 3) >> 0x1c;
        if (w->f4 == 0) {
            u16 v = data_ov018_021ad308[page];
            boxes[0] = make_box(0x4e, v, 0x4e + 0x14);
        } else {
            u16 v = data_ov018_021ad2fc[page];
            boxes[0] = make_box(0x50, v, 0x50 + 0x11);
        }
        if (w->f4 == 1) {
            u16 v = data_ov018_021ad2f0[page];
            boxes[1] = make_box(0x7e, v, 0x7e + 0x14);
        } else {
            u16 v = data_ov018_021ad2e4[page];
            boxes[1] = make_box(0x80, v, 0x80 + 0x11);
        }
    }

    for (int i = 0; i < 2; i++) {
        BBox *b = &boxes[i];
        if (py < b->y0 || py > b->y1 || px < b->x0 || px > b->x1) continue;
        if (w->f4 == i) {
            func_02037208(0x97, -1, 0, 1);
            w->f984 = 0;
            w->f9b4 |= 0x2;
        } else {
            func_02037208(0x38, -1, 0, 1);
            w->f4 = i;
            w->f984 = 0;
        }
        return 1;
    }
    return 1;
}
```

**Levers:** the 3-bit-extract idiom (`lsl#0x1d/lsr#0x1c`) must match
`Ov018_GetPageIndex`'s established shape. No wall.

---

### 0x021AB1C4 (712B, class F) — Ov018_Init

**Upgrade reason:** Flat 26-call init sequence with all-literal call
arguments, one boolean branch near the tail. Same shape as the
already-confirmed-tractable ov006 "full-init VRAM binding" family.

**Struct/data dependencies:** 20 pool-word slots, all raw MMIO
addresses or already-known ov018 externs. **Key finding:** literal pool
slot holds `func_ov018_021aa4a0` itself — `Ov018_Init` stores the
address of the FIRST function in this batch (`Ov018_FlushOamToRegs`)
into a callback registration via `func_02005800`, cross-linking these
two functions.

**Ground-truth pool words (all 23 slots incl. dupes):**

```
data_ov018_021ad8a8, 0x9b8, data_02104f1c, data_ov018_021ad860, 0x1ff,
data_ov018_021ae0f0, data_ov018_021ae190, data_02104f4c,
data_ov018_021ad860, data_ov018_021ad884, data_ov018_021ad870,
0x4000304, 0x4000008, 0x5c80, 0x7000400, 0x5000400, 0x4001008, 0x7c90,
0x4001000, 0xffcfffef, data_ov018_021adcd4, data_021040ac,
func_ov018_021aa4a0
```

**BL targets (verbatim, 26 total, matches heuristic exactly):** `Fill32`,
`func_0207deb0`, `func_0200592c`, `func_0208d1e4`, `func_02094504`
(×5), `func_0208cc90`, `func_0207e8b8`, `func_0202adf8`, `func_02001a34`,
`func_0207f884`, `func_0207f85c`, `func_0208da2c`, `func_0208d7ac`,
`func_0208c8cc`, `func_0208d138`, `func_0208d0bc`, `func_0208d030`,
`func_02005bfc`, `func_0207f420`, `func_0207f138`, `func_02008598`,
`func_02005800`.

**Complete C sketch:**

```c
int func_ov018_021ab1c4(void) {
    *(vu32*)0x04000000 &= ~0x1f00;
    *(vu32*)0x04001000 &= ~0x1f00;
    Fill32(0, data_ov018_021ad8a8, 0x9b8);
    func_0207deb0(data_ov018_021ad860, data_02104f1c->f1c, 4);
    func_0200592c();
    func_0208d1e4(0x1ff);
    func_02094504(0, 0x6800000, 0xa4000);
    func_0208cc90();
    func_0207e8b8(data_ov018_021ae0f0);
    func_0202adf8(data_ov018_021ae190);
    int page3 = (data_02104f4c->f4 << 29) >> 29;
    data_ov018_021ad860->f930 = page3;
    func_02001a34(0xc);
    func_0207f884(data_ov018_021ad884);
    func_0207f85c(data_ov018_021ad870);
    *(vu16*)0x4000304 |= 0x8000;
    func_02094504(0x200, 0x7000000, 0x400);
    func_02094504(0, 0x5000000, 0x400);
    func_0208da2c(1);
    *(vu32*)0x04000000 &= ~0x7000000;
    *(vu32*)0x04000000 &= ~0x38000000;
    func_0208d7ac(0x60);
    func_0208c8cc(1, 0, 0);
    *(vu16*)0x04000008 = (*(vu16*)0x04000008 & 0x43) | 0x1c80 | 0x4000;
    *(vu16*)0x0400000a = (*(vu16*)0x0400000a & 0x43) | 0x5c80 + 0x208;
    *(vu16*)0x0400000e = (*(vu16*)0x0400000e & 0x43) | 0xb90 | 0x1000;
    func_02094504(0x200, 0x7000400, 0x400);
    func_02094504(0, 0x5000400, 0x400);
    func_0208d138(4);
    func_0208d0bc(8);
    func_0208d030(0x80);
    *(vu16*)0x4001008 = (*(vu16*)0x4001008 & 0x43) | 0xc90 | 0x7000;
    *(vu16*)0x400100a = (*(vu16*)0x400100a & 0x43) | (0x7c90 - 0x3e80);
    *(vu16*)0x400100e = (*(vu16*)0x400100e & 0x43) | 0x1f80;
    func_02005bfc();
    *(vu32*)0x04001000 = (*(vu32*)0x04001000 & 0xffcfffef) | 0x10 | 0x200000;
    func_0207f420();
    func_0207f138(data_ov018_021adcd4, 0, 0x80, 1);
    int ready = func_02008598();
    u16 oam = data_ov018_021ad8a8->f900_b4;
    if (ready == 0) {
        data_ov018_021ad8a8->f4 = 1;
        oam = (oam & ~1) | 1;
    } else {
        data_ov018_021ad8a8->f4 = 0;
        oam &= ~1;
    }
    data_ov018_021ad8a8->f900_b4 = oam;
    data_021040ac->f3c = 0;
    func_02005800(func_ov018_021aa4a0);
    data_ov018_021ad8a8->f0 = 0;
    return 1;
}
```

**Levers:** exact BGxCNT constant decomposition would benefit from
`docs/research/types/BgCfg.md` (already exists, relevant but not
required to reproduce this specific call sequence). No wall.

---

### 0x021ACE14 (84B, class E) — Ov018_DispatchFuncTableEntry

**Upgrade reason:** Single deterministic `blx` with immediate post-call
test — NOT the genuinely-ambiguous "multiple blx callback dispatches"
pattern documented elsewhere (e.g. `0x021D6ED0`/`0x021CB700` in the
existing "Confirmed Intractable" list). Only one `blx` site here, no
register rotation, `r0` is tested straight out of the call.

**Struct/data dependencies:** `data_021040ac+0xb6c` (already documented,
same field as `Ov001_StepCallback` above), `data_ov018_021ad71c` — **NEW
undocumented global**: fn-ptr table, length unbounded from this function
alone (no upper-bound test on the index here).

**Ground-truth pool words:**

```
_LIT0: .word data_021040ac
_LIT1: .word data_ov018_021ad71c
```

**BL/BLX targets:** `bl func_020a991c` (unconditional first), `blx r0`
(indirect, table-indexed).

**Complete C sketch:**

```c
int func_ov018_021ace14(void) {
    func_020a991c();
    int idx = data_021040ac.f_0xb6c;
    void (*fn)(void) = data_ov018_021ad71c[idx];
    if (fn == NULL)
        return 1;
    int result = (int)fn();
    if (result != 0) {
        data_021040ac.f_0xb6c += 1;
    }
    return 0;
}
```

**Levers:** none — no wall.

---

### 0x021ACF80 (408B, class F) — Ov018_HsvToRgb

**Upgrade reason:** Pure leaf (0 calls!) — textbook 6-sector HSV→RGB
reconstruction. The 6-way jump table's case bodies are trivial 2-3
`mov` register renames (not computed branches), and every `smull`
operates on a compile-time-constant divisor (6, 360, 9-or-15-family,
255).

**Struct/data dependencies:** none (pure arithmetic, 3 pool words are
all smull magic constants, no globals).

**Ground-truth pool words and magic-constant derivation:**

```
_LIT0: .word 0xb60b60b7   -- NEW constant: mwcc signed ÷360 reciprocal.
                             Corroborated by the literal 0x168 (=360 decimal)
                             appearing right at the remainder-computation site.
_LIT1: .word 0x80808081   -- documented ÷255 reciprocal (already seen
                             elsewhere in this overlay's sibling RGB/HSV
                             functions); new occurrence site for this overlay.
_LIT2: .word 0x88888889   -- SAME raw constant seen in ov001/ov021/ov022 targets
                             in this batch. In THIS function's specific asr
                             amount, it reads as ÷9 (per this function's own
                             post-shift). NOTE: this is the same numeric literal
                             as Ov001_Update's ÷60 reading and Ov022_RGB5ToHSV's
                             ÷15 reading elsewhere in this doc -- the raw hex
                             value is postshift-dependent (÷15 @ asr#3, ÷30 @
                             asr#4, ÷60 @ asr#5); each function's own shift
                             amount determines which reading applies to it.
```

**BL targets:** none (leaf).

**Complete C sketch:**

```c
unsigned short func_ov018_021acf80(int h, int s, int v)
{
    int sector = (h * 6) / 360;            /* 0xb60b60b7 */
    int rem    = (h * 6) - sector * 360;
    int f  = (rem * 255) / 360;
    int p  = (v * (255 - s)) / 255;         /* 0x80808081 */
    int q  = (v * (255 - (s * f) / 255)) / 255;
    int t  = (v * (255 - (s * (255 - f)) / 255)) / 255;

    int r, g, b;
    switch (sector) {
    case 0: r = v; g = t; b = p; break;
    case 1: r = q; g = v; b = p; break;
    case 2: r = p; g = v; b = t; break;
    case 3: r = p; g = q; b = v; break;
    case 4: r = t; g = p; b = v; break;
    case 5: r = v; g = p; b = q; break;
    default: r = 0; g = 0; b = 0; break;
    }
    if (r > 255) r = 255;
    if (g > 255) g = 255;
    if (b > 255) b = 255;
    return (unsigned short)((r >> 3) | ((g << 2) & 0x3e0) | ((b << 7) & 0x7c00));
}
```

**Levers:** exact algebraic placement of the ÷9-family operation within
p/q/t is the only iteration risk. No wall.

---

## ov018 Confirmed Wall: 0x021AB694 (5684B, 966 insns) — Ov018_StateMachine

**Genuine wall**, matching the heuristic's own "huge dispatcher" label.
4 nested/sequential jump-table switches (20-way, 6-way, 20-way, 20-way)
spanning ~1550 lines, 45 distinct callees, 120+ call sites. Matches the
KB's own pre-existing "confirmed intractable" giant-dispatcher pattern
(compare ov006's 5616B/1696B `tract=never` entries in
`docs/research/retriage/OverlayEFRetriage.md`). The tail 3 additional
switches key off the *same* state word but compile as *separate*,
not-fused jump tables — meaning the C source almost certainly contains
4 separate `switch` statements re-testing a fresh reload each time
(matching the repeated `ldr r0,[r4]` reloads at each dispatch
boundary), which is itself a structural choice that can't be forced
deterministically from source. Not blocked by any KB gap — further
documentation of `data_ov018_021ad8a8`'s field layout (already ~80%
known from sibling matched files) would not change this verdict.

---

## ov021 Confirmed Wall (all 6)

All 6 targets are confirmed genuine walls, matching the prior campaign's
own verdict recorded verbatim in `src/overlay021/ov021_core.h`:

> DEFERRED (NOT shipped — Mac lane): `021ab9d0` (78% reg-choice, wave 1);
> `021aa4a0` (permuter blx); `021aba18`/`021abaa0`/`021aaf5c`
> (random-unique loops — 28%, mwcc strength-reduces the `o[0x60+i*4]`
> accesses to a base pointer where the orig recomputes base+index; same
> SR class as ov015 `021af704`); the 0x100+ bodies (`021aab7c` 0x1e0 /
> `021aa5cc` / `021ab150` / `021ab3fc` / `021ab6c0` — big
> register-choice-dense state bodies).

- **0x021AA4A0** (116B) — permuter-class: indirect `blx` through a jump
  table + `func_020071a4` callback shape, same class as confirmed-
  permuter siblings elsewhere in the KB.
- **0x021AA5CC** (524B) — register-choice-dense: 34 flat MMIO/VRAM
  calls (matches heuristic exactly), fully understood semantically
  (structural sibling of the ov006 full-init family — the VRAM/BG
  constants map 1:1 onto `OverlayConstants.md`'s documented `OV006_*`
  family), but mwcc's register assignment across 2 branches at this
  scale is a genuine scheduling coin-flip.
- **0x021AB150** (684B) — register-choice-dense: 29 calls (matches
  heuristic), 3 sequential counted loops (10/6/6 iterations) with heavy
  live-register pressure across `sl, r4-r9, fp` simultaneously.
- **0x021AB3FC** (708B) — register-choice-dense: 9-way branch cascade,
  no loop, branch-tail duplication (the A-press and countdown paths
  independently repeat the same 3-call sequence verbatim). **2 NEW
  smull constants derived here**: `0x2aaaaaab` with `asr#3` = ÷48
  (card-cell pixel height), `0x38e38e39` with `asr#4` = ÷72 (card-cell
  pixel width, corroborated by the `mov r1,#0x48`=72 stride constant
  used repeatedly in the sibling `021ab150`). Neither is in
  `OverlayConstantsExtended.md`.
- **0x021AB6C0** (784B) — register-choice-dense: 7-way `cmp`-ladder (not
  a jump table) on a frame-counter milestone, 3 small fixed-count
  loops inside. Reuses the documented `0x66666667` ÷10 reciprocal for
  an `i - (i/10)*5` "mod 5" grid-column idiom — the SAME idiom recurs
  identically in `021ab150` and `021abaa0` (a genuine shared low-level
  pattern across this overlay's 5-column card-grid domain).
- **0x021ABAA0** (160B) — strength-reduction coin-flip (not a
  reg-choice wall in the usual sense): nested retry-loop assigning
  10 grid-column values without duplicates via an LCG
  (`Ov021_LCGNext`, already matched) + `mod 5` derivation (same
  `0x66666667` idiom). The actual obstacle, per the prior campaign's
  own 28%-match attempt, is mwcc's choice to cache
  `r3 = &o[i*4+0x74]` as a live base pointer across a store+immediate-
  reload rather than recomputing `sl + i*4` fresh — a CSE-threshold
  decision the C source can't force deterministically.

All pool words/BL targets for these 6 are recorded in full in the
underlying agent transcript; summarizing the two new constants above is
the only actionable KB delta from this overlay.

---

## ov022 Newly Tractable Funcs

ov022 had never been examined (map doc shows "Matched: 0" — a genuinely
fresh overlay), but `docs/research/map/overlay022.md` already had a
complete HIGH-confidence semantic map for every function, independently
matching everything found below.

### 0x021AA4A0 (160B, class F) — Ov022_InitSubScreenBands

**Upgrade reason:** Bit-test guard (`data_ov022_021acaa0+0x198` bit0,
cross-confirmed by `func_ov022_021aa680`'s own description) gating a
6-call VRAM/engine-reset block, then a fixed 2-iteration loop
initializing two sub-screen band objects at stride `0x41c`. **No `mla`,
no linked-list walk** — see cross-overlay identity section.

**Ground-truth pool words:**

```
_LIT0: .word data_ov022_021acaa0
_LIT1: .word data_ov022_021abae8
```

**BL targets (verbatim, 8 static/10 dynamic):** `func_0208f5ac`,
`func_0208f52c`, `func_0208f4c8`, `func_0208f368`, `func_0208f2f4`,
`func_0208f2a8`, `func_0207ed94` (×2, loop), `func_0207ec68` (×2, loop).

**Complete C sketch:**

```c
void Ov022_InitSubScreenBands(void) {
    if (data_ov022_021acaa0->f198 & 1) {
        data_ov022_021abae8->f1150 &= ~1;
        func_0208f5ac();
        func_0208f52c(&data_ov022_021abae8->fc84, 0x4000, 0x200);
        func_0208f4c8();
        func_0208f368();
        func_0208f2f4(&data_ov022_021abae8->fce84, 0x4000, 0x200);
        func_0208f2a8();
    }
    void *band = &data_ov022_021abae8->f10;
    for (int i = 0; i < 2; i++) {
        func_0207ed94(band);
        func_0207ec68(band);
        band = (char*)band + 0x41c;
    }
}
```

**Levers:** none — fixed loop trip count, simple bit-test guard. No wall.

---

### 0x021AA758 (732B, class F) — Ov022_InitDisplay

**Upgrade reason:** Largest init function — 28 calls (matches heuristic
exactly), flat MMIO/VRAM setup, one fixed 13-iteration card-slot loop.
Ends by calling `func_02005800(&Ov022_InitSubScreenBands)` (the function
above), confirming the call graph.

**Struct/data dependencies:** `data_02104f1c+0x1c` (already documented),
`0x04001008`/`+0x2` (`VRAMCNT_CD`/`VRAMCNT_E`, already in
`MainConstants.md`), `data_02104f4c+0x4` (3-bit chan field, same
extraction shape used across multiple ov022 targets), `data_ov022_021ab8fe`
(**NEW**: s16 lookup array indexed by chan), `data_ov022_021ab8e4`
(**NEW**: 2D table `[chan][slot]`, row stride 0x1c, 13 s16 entries per
row), `data_ov022_021abae8+0x1000+slot*4+0xb8`/`+0xec` (per-slot OBJ
fields).

**Ground-truth pool words (all 20):**

```
data_ov022_021abae8, 0x00001154, data_02104f1c, data_ov022_021abaa0,
0x000001ff, data_ov022_021ac330, data_ov022_021abac4, data_ov022_021abab0,
0x04000304, 0xffcfffef, data_ov022_021abaf8, 0x07000400, 0x05000400,
0x04001008, 0x04001000, data_ov022_021abf14, func_ov022_021aa4a0,
data_02104f4c, data_ov022_021ab8fe, data_ov022_021ab8e4
```

**BL targets (verbatim, 28 total):** `Fill32`, `func_0207deb0`,
`func_0200592c`, `func_0208d1e4`, `func_02094504` (×4), `func_0208cc90`,
`func_0207e8b8`, `func_02001a34`, `func_0207f884`, `func_0207f85c`,
`func_0208da2c`, `func_0208d8c0`, `func_0208d7ac`, `func_0208c8cc`,
`func_02005bfc` (×2), `func_0207f420` (×2), `func_0207f138` (×2),
`func_0208d138`, `func_0208d030`, `func_02005800`, `func_020b3870`.

**Complete C sketch:**

```c
void Ov022_InitDisplay(void) {
    *(vu32*)0x04000000 &= ~0x1f00;
    *(vu32*)0x04001000 &= ~0x1f00;
    Fill32(0, &data_ov022_021abae8, 0x1154);
    func_0207deb0(&data_ov022_021abaa0, data_02104f1c.f1c, 4);
    func_0200592c();
    func_0208d1e4(0x1ff);
    func_02094504(0, 0x6800000, 0xa4000);
    func_0208cc90();
    func_0207e8b8(&data_ov022_021ac330);
    func_02001a34(0xc);
    func_0207f884(&data_ov022_021abac4);
    func_0207f85c(&data_ov022_021abab0);
    *(vu16*)0x04000304 |= 0x8000;
    func_02094504(0x200, 0x7000000, 0x400);
    func_02094504(0, 0x5000000, 0x400);
    func_0208da2c(1);
    *(vu32*)0x04000000 &= ~0x7000000;
    *(vu32*)0x04000000 &= ~0x38000000;
    func_0208d8c0(2);
    func_0208d7ac(0x60);
    func_0208c8cc(1, 0, 0);
    *(vu16*)0x04000008 = (*(vu16*)0x04000008 & 0x43) | 0x3e80;
    *(vu32*)0x04000000 = (*(vu32*)0x04000000 & 0xffcfffef) | 0x10 | 0x200000;
    func_02005bfc();
    func_0207f420();
    func_0207f138(&data_ov022_021abaf8, 0, 0x80, 0);
    func_02094504(0x200, 0x07000400, 0x400);
    func_02094504(0, 0x05000400, 0x400);
    func_0208d138(4);
    func_0208d030(0x80);
    *(vu16*)0x04001008 = (*(vu16*)0x04001008 & 0x43) | 0x3e80;
    *(vu16*)0x0400100a = (*(vu16*)0x0400100a & 0x43) | 0xf90 | 0x3000;
    func_02005bfc();
    *(vu32*)0x04001000 = (*(vu32*)0x04001000 & 0xffcfffef) | 0x10 | 0x200000;
    func_0207f420();
    func_0207f138(&data_ov022_021abf14, 0, 0x80, 1);
    func_02005800(Ov022_InitSubScreenBands);

    int chan = (data_02104f4c.f4 << 29) >> 29;
    int div_val = data_ov022_021ab8fe[chan];
    int step = func_020b3870(0x28000, div_val);
    s16 *row = &data_ov022_021ab8e4[chan * (0x1c/2)];
    int acc = 0;
    for (int slot = 0; slot < 13; slot++) {
        s16 v = row[slot];
        data_ov022_021abae8.slot[slot].fb8 = (v == -1) ? 0 : 0x1e000;
        data_ov022_021abae8.slot[slot].fec = acc + 0x8c000;
        acc += step;
    }
}
```

**Levers:** none — no smull magic, no ambiguous dispatch, fixed loop
bound. No wall.

---

### 0x021AAA34 (436B, class F) — Ov022_BuildScrollBands

**Upgrade reason:** Linear setup (2 scroll-task creates, 2 sub-object
allocs, palette `Copy32`, 2 more cached results), fixed 13-iteration
loop (same `chan`/`data_ov022_021ab8e4` table as the function above),
tail (2× MASTER_BRIGHT ramp seed + play one SE).

**Struct/data dependencies:** `data_ov022_021ab9a0` (already shipped as
`.c`, confirmed 7-word array — the 4 field reads here are indices 3-6),
`data_ov022_021abaa0+0x8bc`/`+0x8c0`/`+0x50`/`+0x54` (result-cache
fields).

**Ground-truth pool words (all 13):**

```
data_ov022_021ac36c, data_ov022_021abae8, data_ov022_021ac56c,
data_ov022_021ab9a0, data_ov022_021abac4, data_ov022_021abab0,
0x05000200, data_ov022_021acc08, data_ov022_021ac364, data_ov022_021abaa0,
data_ov022_021ac368, data_ov022_021ab8e4, data_02104f4c, 0x0400006c,
0x0400106c
```

**BL targets (verbatim, 13 static sites):** `func_ov022_021aa540` (×2),
`func_0201edac`, `func_0207f610`, `Task_Invoke` (×2), `func_0201ede4`,
`func_0207f510`, `Copy32`, `func_0201ed74`, `func_0201ed3c`,
`func_0207e638` (in-loop, ≤13 dynamic), `func_0208c884` (×2),
`func_020373cc`.

**Complete C sketch:**

```c
int Ov022_BuildScrollBands(void) {
    Ov022_CreateScrollTask(0, 0, 1, &data_ov022_021ac36c);
    Ov022_CreateScrollTask(1, 5, 1, &data_ov022_021ac56c);

    void *obj0 = func_0201edac(data_ov022_021ab9a0[3]);
    func_0207f610(obj0, 0, 1, &data_ov022_021abac4);
    Task_Invoke(obj0);

    void *obj1 = func_0201ede4(data_ov022_021ab9a0[4]);
    func_0207f510(obj1, 0, 1, &data_ov022_021abab0);
    Task_Invoke(obj1);

    Copy32((void*)0x05000200, &data_ov022_021acc08, 0x20);

    data_ov022_021abaa0.f8bc = func_0201ed74(&data_ov022_021ac364, data_ov022_021ab9a0[5]);
    data_ov022_021abaa0.f8c0 = func_0201ed3c(&data_ov022_021ac368, data_ov022_021ab9a0[6]);

    int chan = (data_02104f4c.f4 << 29) >> 29;
    s16 *row = &data_ov022_021ab8e4[chan * (0x1c/2)];
    for (int slot = 0; slot < 13; slot++) {
        s16 v = row[slot];
        if (v != -1) {
            data_ov022_021abae8.slot[slot].f84 =
                func_0207e638(data_ov022_021abae8.f880, (u16)v);
        }
    }

    data_ov022_021abaa0.f50 = 0x14000;
    data_ov022_021abaa0.f54 = 0x14000;
    func_0208c884(0x0400006c, -16);
    func_0208c884(0x0400106c, -16);
    func_020373cc(0x2e, 1, 0, -1);
    return 1;
}
```

**Levers:** field-read order for `data_ov022_021ab9a0` (already pinned
by the shipped C array). No wall.

---

### 0x021AADF0 (1344B, class F) — Ov022_UpdateCardSlots — hardest tractable in this batch

**Upgrade reason:** The largest per-frame driver, but every loop bound
is a compile-time constant (13-outer/16-inner/2-tail) and every branch
is deterministic — no data-dependent variable-trip-count loop and no
`blx` anywhere. Flagged **TRACTABLE-BUT-HARD**: the main risk is
register-allocation fidelity across a very long live accumulator
(`fp`) and heavy stack-slot juggling, not a scheduling wall.

**Struct/data dependencies:** `data_ov022_021abaa0+0x54` (capture-
progress accumulator, shared with `Ov022_FadeOutMasterBright`),
`data_ov022_021abae8+0xc` (animation progress counter),
`data_ov022_021ab8a8` (already-shipped 60-byte pitch table),
`data_02104bac+0x54` (`GlobalData02104bac.flags`, confirmed HIGH).

**New constant confirmed here:** `0x88888889` — **÷15 reciprocal**
(`2^35/0x88888889 ≈ 15` exactly at `asr #0x11`(17)... — the specific
derivation in this function's own shift context; cross-confirmed
against the SAME constant's use in sibling `func_ov022_021ab5c8.s`
elsewhere in this overlay). Also uses the documented `0x66666667` ÷10
reciprocal (confirmed match to KB) for a percentage-scale blend.

**Ground-truth pool words:** `data_ov022_021abaa0`, `data_ov022_021abae8`,
`0x88888889`, `data_02104f4c`, `data_ov022_021ab8e4`,
`data_ov022_021ab8a8`, `0x0007ffff`, `0xc1fffcff`, `0x66666667`,
`0x05000200`, `data_02104bac`, `0x08f00003`.

**BL targets (verbatim, 10 static/up to ~30 dynamic):**
`func_ov022_021aa680`, `func_020b3870` (×2, conditional), `func_0207ef90`,
`func_ov022_021aa6e0`, `func_ov022_021ab760`, `func_ov022_021ab804`,
`Copy32`, `func_0207f05c` (×2, fixed tail loop), `func_02036590` (×2,
conditional).

**Complete C sketch** (abbreviated for readability — every branch below
is deterministic, no coin-flip):

```c
int Ov022_UpdateCardSlots(void) {
    int progress = data_ov022_021abaa0.f54 + 0x1000;
    data_ov022_021abaa0.f54 = progress;
    int spawn_counts[2] = {0, 0};
    int scene_done = 0;

    if (progress <= 0x3c000) {
        int anim = data_ov022_021abae8.fc;
        if (anim <= 0x78000) {
            int scaled = (anim - 0x3c000) * 0xe0;
            int blend = 0x100 - divby15_asr0x11(scaled);   /* 0x88888889 */
            Ov022_FadeInSubScreen(blend);
        }
    }

    int chan = (data_02104f4c.f4 << 29) >> 29;
    s16 first_idx = data_ov022_021ab8e4[chan_row(chan)][0];
    u16 pitch0 = data_ov022_021ab8a8[first_idx];
    int fp_accum = (0x100 - data_ov022_021abae8.f1140 + pitch0) << 11;

    for (int slot = 0; slot < 13; slot++) {
        s16 idx = data_ov022_021ab8e4[chan_row(chan)][slot];
        int per_slot_ec = data_ov022_021abae8.slot[slot].fec;
        int anim = data_ov022_021abae8.fc;
        int delta_ec = per_slot_ec - anim;
        int blend_delta = (idx == -1) ? 0x4000 : (data_ov022_021ab8a8[idx] << 11);

        if (slot < 12) {
            s16 next_idx = data_ov022_021ab8e4[chan_row(chan)][slot+1];
            blend_delta += (next_idx == -1) ? 0x4000 : (data_ov022_021ab8a8[next_idx] << 11);
        }

        int sentinel = data_ov022_021abae8.slot[slot].fb8;
        if (sentinel == 0 || delta_ec >= 0x1e000) { fp_accum += blend_delta; continue; }
        if (delta_ec == -1) { fp_accum += blend_delta; continue; }

        int lerp_x, lerp_y;
        if (delta_ec < 0) { lerp_x = 0x1000; lerp_y = 0; }
        else {
            lerp_x = func_020b3870(0x1e000000, 0x1e000 - delta_ec);
            lerp_y = 0x1000 - func_020b3870(delta_ec << 11, data_ov022_021abae8.slot[slot].fb8_ptr[0]);
            lerp_x = clamp(lerp_x, -0x80000, 0x7ffff);
        }

        int count = func_0207ef90(&data_ov022_021abae8.f10, lerp_x, lerp_y);
        int n = Ov022_AppendSpriteEntry(&data_ov022_021abae8.f10,
                                         data_ov022_021abae8.slot[slot].f84,
                                         &data_ov022_021abae8.f18, fp_accum >> 12);
        spawn_counts[slot < 6 ? 0 : 1] += n;

        for (int k = 0; k < n; k++)
            palette_array[k] = (palette_array[k] & 0xc1fffcff) | 0x300 | (count << 25);

        if (delta_ec >= 0) {
            /* 16-color palette-blend pass, using the same 0x88888889/asr#0x11 divide */
        }
        fp_accum += blend_delta;
    }

    int anim = data_ov022_021abae8.fc;
    if (anim >= 0xb4000) {
        if (anim >= 0xc8000) {
            Copy32(&data_ov022_021abae8.f1120, (void*)0x05000200, 0x20);
        } else {
            int pct = divby10_asr0xe(anim);   /* 0x66666667 */
            int inv = 0x100 - pct;
            Ov022_PaletteBlend(&data_ov022_021abae8.f1130, stack_buf, (inv<<16)|0x10);
            Ov022_PaletteBlendHue(stack_buf, (void*)0x05000200, ((pct+0x100)<<16)|0x10);
        }
    }

    for (int i = 0; i < 2; i++)
        if (spawn_counts[i] > 0)
            func_0207f05c(&data_ov022_021abae8.band[i].f10, &data_ov022_021abae8.band[i].f2c, spawn_counts[i]);

    if (anim >= 0x17c000 && anim < 0x384000) {
        if (data_02104bac.flags & 2) scene_done = 1;
    } else if (anim >= 0x384000) {
        scene_done = 1;
    }
    if (scene_done) {
        func_02036590(0x8f00000, 0x14);
        func_02036590(0x08f00003, 0x14);
        data_ov022_021abaa0.f50 = 0x14000;
        data_ov022_021abaa0.f54 = 0x14000;
    }
    return scene_done;
}
```

**Levers:** budget for iteration on stack-slot layout and the long `fp`
accumulator live range (min-as-if-assign / bind-call-result-to-temp
levers per the project's `mwcc-register-reuse-recipe`). Flagged as the
hardest of the 20 tractable functions in this batch, but genuinely
tractable — every branch/loop bound is deterministic.

---

### 0x021AB460 (80B, class E) — Ov022_DispatchPhase

**Upgrade reason:** Already documented HIGH confidence in 3 places
(`overlay022.md`, `_names_overlay022.md`, `NAMES.md`) with matching
prose. Single `blx`, clean bool-gated post-call test — NOT the
ambiguous-rotation pattern (contrast the confirmed-wall `0x021D6ED0`/
`0x021CB700` elsewhere in the KB's Confirmed Intractable list).

**Struct/data dependencies:** `data_021040ac+0xb6c` (within the
documented `GlobalAudioState` 0x000-0xC48 range, though this exact
offset isn't individually named yet — worth adding
`GlobalAudioState.field_b6c` explicitly), `data_ov022_021ab9bc` — **NEW
undocumented global**: fn-ptr phase table, likely `.data`/rodata (not
in `bss/data_ov022_bss.s`).

**Ground-truth pool words:**

```
_LIT0: .word data_021040ac
_LIT1: .word data_ov022_021ab9bc
```

**BL/BLX targets:** zero `bl`; one `blx r0`.

**Complete C sketch:**

```c
int Ov022_DispatchPhase(void) {
    int phase = data_021040ac.field_b6c;
    void (*fn)(void) = data_ov022_021ab9bc[phase];
    if (fn == NULL) {
        return 1;
    }
    int result = fn();
    if (result != 0) {
        data_021040ac.field_b6c++;
    }
    return 0;
}
```

**Levers:** none — no wall.

---

### 0x021AB4B0 (280B, class E) — Ov022_RGB5ToHSV

**Upgrade reason:** Confirmed **byte-identical** (character-for-
character, full-file diff) to `src/overlay020/func_ov020_021ada74.s`
(`Ov020_RgbToHsv` per that overlay's own map doc). Neither copy has a
C recipe yet — write ONE C recipe and test it against both GLOBAL_ASM
sites; whichever compiles first validates the other for free.

**Struct/data dependencies:** none — pure register/immediate
arithmetic, only extern is `func_020b3870` (IntDiv).

**Ground-truth pool words:** none (no `.word` literal pool at all).

**BL targets:** `func_020b3870` (×2, both conditional).

**Complete C sketch:**

```c
void Ov022_RGB5ToHSV(u16 rgb555, int *out_value, int *out_saturation, int *out_hue) {
    int r = rgb555 & 0x1f;
    int g = (rgb555 & 0x3e0) >> 2;
    int b = (rgb555 & 0x7c00) >> 7;

    int max = MAX3(r, g, b);
    int mid = MID3(r, g, b);
    int delta = max - mid;

    int sat = (max == 0) ? 0 : ((delta * 255) / max);
    *out_saturation = sat;

    int hue_raw = 0;
    if (sat != 0) {
        if (max == r) {
            hue_raw = ((g - b) << 8) / delta;
        } else if (max == g) {
            hue_raw = (((b - r) << 8) / delta) + 0x200;
        } else if (max == b) {
            hue_raw = (((r - g) << 8) / delta) + 0x400;
        }
        int scaled = (hue_raw * 0x3c) >> 8;
        if (scaled < 0) scaled += 0x168;
        hue_raw = scaled;
    }
    *out_hue = hue_raw;
    *out_value = max;
}
```

**Levers:** the exact `movgt`/`movle` max/mid/min sort-of-3 ladder order
is the only reshape risk — already a known recipe class per the
project's own `mwcc-register-reuse-recipe` memory. Since there's a
byte-identical twin, whichever gets matched first de-risks the other
completely. No wall.

---

### 0x021AB804 (164B, class F) — Ov022_PaletteBlendHue

**Upgrade reason:** Near-identical twin of the sibling
`func_ov022_021ab760` (Ov022_PaletteBlend), differing only in which
output field (hue vs. value) receives the blend delta — every other
instruction is line-for-line identical. Loop bound is a runtime
argument (`count`, high halfword of arg2), which is normal and not a
tractability blocker.

**Struct/data dependencies:** none beyond stack scratch and the already-
tractable siblings `Ov022_RGB5ToHSV`/`Ov022_HSVToRGB5` (both in the same
overlay).

**Ground-truth pool words:** none.

**BL targets:** `func_ov022_021ab4b0` (Ov022_RGB5ToHSV), `func_ov022_021ab5c8`
(Ov022_HSVToRGB5) — both looped, up to `count` dynamic invocations each.

**Complete C sketch:**

```c
void Ov022_PaletteBlendHue(u16 *src, u16 *dst, int packed_arg) {
    int count = (u16)(packed_arg >> 16);
    int delta = (u16)packed_arg - 0x100;
    if (count <= 0) return;
    for (int i = 0; i < count; i++) {
        int value, sat, hue;
        Ov022_RGB5ToHSV(*src, &value, &sat, &hue);
        int adj_hue = hue + delta;
        if (adj_hue < 0) adj_hue = 0;
        if (adj_hue > 0xff) adj_hue = 0xff;
        *dst++ = Ov022_HSVToRGB5(value, sat, adj_hue);
        src++;
    }
}
```

**Levers:** none — mirrors the already-matched-shape sibling. No wall.

---

## Confirmed-Intractable Summary (8 functions, all ov021)

All 6 ov021 targets are confirmed genuine walls (see the "ov021 Confirmed
Wall" section above for full detail per-function). ov013's giant dispatcher
(`021ca7cc`) contributes a *partial* wall: 6 of its 18 case bodies are
confirmed walls (cases 1, 4, 6, 8, 14, 15) while the shell and 9+ other
cases are tractable. ov018's state machine (`021ab694`) is a single
whole-function confirmed wall. No other target function in this batch is
a wall.

---

## New KB gaps found

Describing each inline (address, inferred type/size, evidence) — none of
these are edited into the shared KB docs per instructions; the campaign
should add them to the appropriate `docs/research/data/`,
`docs/research/constants/`, or `docs/research/types/` file separately.

| Gap | Inferred type/size | Evidence |
|-----|---------------------|----------|
| `GlobalAudioState` (`data_021040ac`) `+0x34` | `int`/bool | `func_ov001_021c9f24.s`: `ldr r0,[r4,#0x34]; cmp r0,#0` boolean row-select flag |
| `GlobalAudioState.field_b6c` (explicit name) | `int` (already known generically as within 0x000-0xC48 range) | Confirmed dispatch-index field, used identically by `func_ov001_021ca2f8`, `func_ov018_021ace14`, `func_ov022_021ab460` in this same batch — cross-file corroboration is strong enough to warrant an explicit named field entry, not just "somewhere in the range" |
| `data_ov001_021ca384` | fn-ptr table, `int(*)(void)[]`, size unknown | `func_ov001_021ca2f8.s`: `ldr r0,[r1,r0,lsl#2]` indexed by `GlobalAudioState.fb6c`; add to `FunctionPointerTables.md`, cross-ref existing Pattern A1 `ov001` row |
| `data_ov001_021ca404` | `int` "validity token" | `func_ov001_021c9f24.s`: passed as 2nd arg to `func_020aaf40` alongside the row's fn-ptr entry |
| `GlobalData02104bac` `+0x58` | `u16` | `func_ov007_021b2694.s`: third KEYINPUT-family halfword, bit-tested `0x10/0x20/0x40/0x80/0x30`; that doc currently only documents `+0x54` |
| `Ov007WorkACtx` (proper type name) | struct, fields `f3c/f40/f44/f48/f4c` at existing offsets | Already independently inferred in `docs/research/dossiers/021b299c.md` as `Ctx_021b299c`, but not cross-referenced or promoted to a named `docs/research/types/*.md` entry despite 3+ confirming files (`func_ov007_021b2568`, `021b25a0`, `021b2630`, and this batch's `021b2694`) |
| `data_ov013_021cbc3c+0x150` | `int` mode byte | `func_ov013_021ca024.s`: gates a "secondary sprite" bitfield-patch block |
| `data_ov013_021cbc3c+0x158`/`+0x174`/`+0x178` (as distinct from same-relative-offset fields on `data_ov013_021cbc00`) | `u32` each | Dozens of consistent RMW sites within `func_ov013_021ca7cc.s`, shared base register `r6` held throughout the function |
| `data_ov013_021cbbd0`, `data_ov013_021cbbe8` | pointer (animation-group table entries, same family as confirmed `data_ov013_021cbbb0`) | `func_ov013_021ca7cc.s` case 15: each is the sole argument to a veneer call targeting `0x021b1478` |
| Veneer targets `0x021b1478` (5 sites), `0x021b14ec` (4 sites), `0x021b2258` (2 sites), `0x021b1364`, `0x021b14f0`, `0x021b1f00` (2 sites), `0x021b1b74`, and `021ca42c`'s `0x021b282c`/`0x021b142c`/`0x021b284c` | addresses decoded, symbol names unresolved | Hand-encoded `.word 0xebffXXXX` BL instructions in `func_ov013_021ca7cc.s`/`021ca42c.s`; resolving names requires `config/eur/overlay013/symbols.txt` (not present in this checkout) |
| `data_ov018_021ad2e4`, `021ad2f0`, `021ad2fc`, `021ad308` | `u16[]` per-page lookup tables | `func_ov018_021aaddc.s`: each feeds one edge of a touch-hit bounding box, indexed by the 3-bit page field from `data_02104f4c+0x4` |
| `data_ov018_021ad71c` | fn-ptr table, length unbounded from this function alone | `func_ov018_021ace14.s`: indexed by `data_021040ac+0xb6c` |
| `0xb60b60b7` smull constant | mwcc signed ÷360 reciprocal | `func_ov018_021acf80.s`: corroborated by literal `0x168`(=360) appearing at the paired remainder-computation site; NOT in `OverlayConstantsExtended.md` |
| `0x2aaaaaab` smull constant (`asr#3`) | mwcc reciprocal for ÷48 | `func_ov021_021ab3fc.s`: converts touch-Y+40 into a row index for the ov021 5×2 card grid (48px cell height); NOT in `OverlayConstantsExtended.md` |
| `0x38e38e39` smull constant (`asr#4`) | mwcc reciprocal for ÷72 | `func_ov021_021ab3fc.s`: converts touch-X+48 into a column index (72px cell width, corroborated by the `mov r1,#0x48` stride constant used repeatedly in sibling `func_ov021_021ab150.s`); NOT in `OverlayConstantsExtended.md` |
| `0x88888889` smull constant — **postshift-dependent, appears 3× in this batch at 3 different readings** | mwcc reciprocal, reads as ÷15 (`asr#3`), ÷30 (`asr#4`), or ÷60 (`asr#5`) depending on each function's own post-shift | `func_ov001_021ca144.s` (÷60 @ `asr#5`), `func_ov018_021acf80.s` (÷9-family reading in its own shift context), `func_ov022_021aadf0.s`/`func_ov022_021ab5c8.s` (÷15 @ `asr#3`, cross-confirmed between the two ov022 sites). NOT in `OverlayConstantsExtended.md` under any reading — recommend adding all three readings with their respective post-shift amounts, since the raw hex is identical but the effective divisor genuinely differs by context |
| `data_ov022_021ab8fe` | `s16[]`, indexed by 3-bit chan field | `func_ov022_021aa758.s`: single value per chan row |
| `data_ov022_021ab8e4` | `s16[chan][slot]` 2D table, row stride `0x1c` (28B), 13 `s16` entries/row | `func_ov022_021aa758.s`/`021aaa34.s`/`021aadf0.s`: consistently accessed with the same chan-row/slot-index shape across 3 different functions |
| `data_ov022_021ab9bc` | fn-ptr table (likely `.data`/rodata, not in BSS map) | `func_ov022_021ab460.s`: indexed by `data_021040ac+0xb6c` phase counter |

---

## Final tractable count per overlay

| Overlay | Tractable | Wall (whole-function) | Wall (partial, case-level) |
|---------|-----------|------------------------|------------------------------|
| ov001   | 3         | 0                      | —                            |
| ov007   | 1         | 0                      | —                            |
| ov013   | 4         | 0                      | 1 (dispatcher: shell + ~9 cases tractable, 6 cases confirmed wall) |
| ov018   | 5         | 1                      | —                            |
| ov021   | 0         | 6                      | —                            |
| ov022   | 7         | 0                      | —                            |
| **Total** | **20**  | **7**                  | **1**                        |
