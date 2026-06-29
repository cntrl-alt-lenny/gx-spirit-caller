[//]: # (markdownlint-disable MD013 MD041)

# MED Candidate → KB Docs Cross-Reference

What structs/data/constants each MED candidate cluster needs. Use this as a
lookup when picking up a candidate to match.

---

## How to use this document

1. Identify the module (ov002, main, ov006, …) and look up that section below.
2. Scan the **Common structs needed** table to find which KB docs cover the
   globals your candidate touches.
3. Check the **Common blocking risks** list to pre-empt the most frequent
   divergence classes before you build.
4. For quick symbol-→-doc lookup, jump straight to the **Quick lookup table**
   at the end.

The data is derived from parsing `INDEX.json` (2,699 MED candidates) and
sampling ~10 candidate `.c` files per major module from
`docs/research/c-match-prep/`.

---

## ov002 MED candidates (1,408 total)

### Common structs needed

| Struct / Global | KB Doc | Frequency in sample | Access pattern |
|-----------------|--------|---------------------|----------------|
| `data_ov002_022ce950` (Ov002ActionState, ~0x81C B) | no dedicated doc yet — see comment in `021ae7b8.c` / `021cab30.c` | 40/200 scanned | `u16[+0]` flag bit 15, `u16[+2]` idx, `int[+0x80C/0x810]` |
| `data_ov002_022cf16c` (PerPlayerRowTable) | [PerPlayerRowTable.md](../types/PerPlayerRowTable.md) | 226/200 refs (multi-ref per file) | `(player & 1) * 0x868 + offset`; row +0x30 + idx*0x14 slot sub-array |
| `data_ov002_022d016c` (DuelStateSingleton) | [DuelStateSingleton.md](../types/DuelStateSingleton.md) | 100/200 refs | offsets +0xCEC, +0xCF4, +0xCF8, +0xD00, +0xD0C, +0xE0 |
| `data_ov002_022d0650` (second large BSS singleton) | no dedicated doc yet — size ~0x81C; accessed by initiliser calls | 49/200 refs | `func_ov002_0229cd5c(ptr, size)` bulk zero-init |
| `data_ov002_022cd73c` (player-context word array) | no dedicated doc yet | 44/200 refs | `[+0x4]` player-side flag, `[+0x8]/[+0xC]` mode test vs 2, `[+0x224/228]` scratch |
| `data_ov002_022cd3f4` (scratch struct ~0x130 B) | no dedicated doc yet — see `021cab30.c` | 42/200 refs | store-order field array (S[0..10]) |
| `data_ov002_022cf17c` (per-player list base) | [PerPlayerRowTable.md](../types/PerPlayerRowTable.md) §companion | 31/200 refs | `(player & 1) * 0x868 / 4` as word index |
| `data_ov002_022cf1a6` (u16 node lookup table) | [PerPlayerRowTable.md](../types/PerPlayerRowTable.md) §companion | 32/200 refs | `ldrh` with `0x868` stride |
| `data_ov002_022ce288` (DuelQueueState) | [DuelQueueState.md](../types/DuelQueueState.md) | used in init functions; 2/10 sampled | `[+0x5C0]` re-entrancy lock, `[+0x5A8]` 0x7F/0x80 state |
| `data_ov002_022cdc78` (state word array ~0x610 B) | no dedicated doc yet | 17/200 refs | `[+0x4]` == 4 state test, `[+0x4]` == 0x4a test |
| `data_ov002_022cdc88` (word table) | no dedicated doc yet | 10/200 refs | stride-4 ldr; bit13 test `(x<<18)>>31`; `:13` bitfield return `(x<<19)>>19` |
| `struct Ov002Self` (4-byte card handle) | [Ov002SelfContext.md](../types/Ov002SelfContext.md) | all `self` arg functions | `self->f0` (u16 card id), `self->b0 : 1` (player side) |

### Common blocking risks

1. **reshape-able (705 / 1,408)** — mwcc reorders loads or emits `bne` over
   predicated blocks. Fix: reorder C statements exactly, use intermediate temps
   to force load-before-store sequencing, or add `volatile` to force reloads.
2. **permuter-class (520 / 1,408)** — instruction scheduling or register
   rotation diverges from orig. These rarely close via C reshape. Route to
   permuter or accept as `.s`.
3. **struct-guessed (178 / 1,408)** — field offsets inferred from shift-extract
   patterns; need confirmed field widths. Use the KB docs listed above to
   verify before building.
4. **bitfield instruction shape** — `:13` must use `unsigned int id : 13` over
   a 32-bit ldr-loaded word (not `u16 : 13`) to emit `lsl#19;lsr#19` not
   `lsl#3;lsr#3`. Similarly `: 1` player bit must not be replaced by `& 1`.

### Sample candidates by risk class

```c
/* func_ov002_021ae7b8 — risk: reshape-able (predicated guard) */
/* key patterns: 9× func_ov002_0229cd5c bulk-zero init on the main ov002 globals;
 *   data_ov002_022d016c offsets +0xCF8 (phase) and +0xD0C (gate);
 *   data_ov002_022cd73c offsets +0x8/+0xC vs 2 guard */
```

```c
/* func_ov002_021b0388 — risk: permuter-class + struct-guessed */
/* key patterns: parity-mul index (1-arg0)&1 *0x868 into data_ov002_022cf16c;
 *   data_ov002_022d016c offsets +0xCEC, +0xCF0, +0xCF4, +0xE0;
 *   predicate call chain func_021b4054(d016c.cec, 0xb, cf194/cf16c, N) */
```

```c
/* func_ov002_021b04c8 — risk: reshape-able (CSE cmp chain) */
/* key patterns: data_ov002_022d016c offsets +0xD0C gate and +0xD00 verdict;
 *   data_ov002_022cd744[d016c.cec] == 2 guard;
 *   data_ov002_022cd73c[+0x4] player-side bit;
 *   data_ov002_022cf198 parity-store (s&1)*0x868 and ((s^1)&1)*0x868 */
```

---

## main MED candidates (967 total)

### Common structs needed

| Struct / Global | KB Doc | Frequency in sample | Access pattern |
|-----------------|--------|---------------------|----------------|
| `data_021040ac` (GlobalAudioState, ≥0xC4C B) | [GlobalAudioState.md](../types/GlobalAudioState.md) | 51/100 refs in sample | offsets +0x3C, +0x3C–+0x44 (snapshot), +0xB64 state, +0xB68 scratch |
| `data_02102c7c` (GlobalData02102c7c) | [GlobalData02102c7c.md](../types/GlobalData02102c7c.md) | 34/100 refs | offsets +0x4, +0x8, +0x10; bitfields at +0x24, +0x38; pointer table at +0x88–+0xA8 |
| `data_02104f4c` (SysPageSel-adjacent, `:3` chan field) | see [GlobalData02104e6c.md](../types/GlobalData02104e6c.md) for pattern | 27/100 refs | `[+0x4] : 3` bitfield read via `lsl;lsr` |
| `data_02104f3c` (system control word, `:4` bitfield) | no dedicated doc yet | 24/100 refs | `lsl#15;lsr#28` → `:4` unsigned bitfield |
| `data_02103d6c` / `data_02103d74` (audio sub-state pair) | no dedicated doc yet | 21/15 refs | paired counters/flags, offsets +0..+0x10 |
| `data_02104f1c` (GlobalData02104f1c, frame/timer) | [GlobalData02104f1c.md](../types/GlobalData02104f1c.md) | 12/100 refs | offsets +0x00, +0x04, +0x10, +0x14, +0x18, +0x1C |
| `data_02105904` (snapshot stack ~0x80 entries×16 B) | no dedicated doc yet | 11/100 refs | `[+0x80/4]` count word; `[n<<4]` 16-B slot; holds func_02000cb4() + data_021040ac[+0x3C/40/44] |
| `data_02102c60` (return-value scratch int) | no dedicated doc yet | 9/100 refs | written from func_02000c4c() return; read by callers |
| `data_02103da4` (mixed state, ~12 fields) | no dedicated doc yet | 9/100 refs | offsets +0..+0x30; parallel to 02103d6c group |
| `data_020c3bc0` (card-index → value map) | no dedicated doc yet | 6/100 refs | `data_020c3bc0[idx]`; sentinel == -1; high-byte set → return raw |
| `data_020c4204` (16-B struct array, 147 entries) | see [DataArrayStrides.md](../types/DataArrayStrides.md) | 6/100 refs | `data_020c4204[v].f_0/f_4/f_8` |
| `data_02104bac` (GlobalData02104bac, u16 flags) | [GlobalData02104bac.md](../types/GlobalData02104bac.md) | referenced by 0x2F07 flag checks | `data_02104bac.flags` at +0x54 |
| `func_020498f0()` → `GameSingleton` | [GameSingleton.md](../types/GameSingleton.md) | large candidates calling through getter | offsets +0xB64 (state), +0xB68 (scratch), +0x3C/40/44 (snapshot cluster) |

### Common blocking risks

1. **reshape-able (515 / 967)** — store-order divergence is the dominant
   failure mode: `data_021040ac` snapshot copy at +0x3C/+0x40/+0x44 must
   interleave ldr–str–ldr–str (not load-all then store-all). Use intermediate
   temps to fix.
2. **permuter-class (360 / 967)** — jump-table switch lowering + register
   assignment for functions already shipped as `.s` (noted in risk field).
   Very few reshape opportunities; accept as `.s` or queue for permuter.
3. **struct-guessed (91 / 967)** — function argument ordering for large-arg
   calls (>8 args) and stack-arg mapping at `sp+0xN` offsets are inferred,
   not confirmed. Always check the calling-convention section of the
   relevant type doc.

### Sample candidates by risk class

```c
/* func_02000cc4 / func_02000d0c / func_02000d4c — risk: reshape-able (store-order) */
/* key patterns: data_021040ac offsets +0x3C, +0x40, +0x44 snapshot;
 *   data_02105904 +0x80 count word; 16-B slot stride;
 *   store-order must be: ldr+0x3c → str slot+4 → ldr+0x40 → str slot+8 → ... */
```

```c
/* func_02000d9c — risk: reshape-able (reload vs bind) */
/* key patterns: data_021040ac offsets +0x3C/40/44 (restored snapshot),
 *   +0xB64 state machine (values 0x16/0x36/0x2e/0x38/0x26 = pending-action codes);
 *   data_02105904 count; keep g = data_021040ac as a single local, reload
 *   g->0xb64 in loop body */
```

```c
/* func_020037d0 — risk: permuter-class (already .s-shipped) */
/* key patterns: data_02102c7c.f_88/.f_90/.f_98/.f_a0/.f_a8 pointer table
 *   (stride-8 from +0x88); jump-table switch on (idx-8)/2 selects stride+base+tag;
 *   tail-calls func_02001f18(ptr, a3, *a0, a2, a4, a5, tag) */
```

---

## ov006 MED candidates (73 total)

### Common structs needed

| Struct / Global | KB Doc | Frequency in sample | Access pattern |
|-----------------|--------|---------------------|----------------|
| `data_ov006_0225cbb8` (GSrc, state-record src) | no dedicated doc yet — struct in `021b28c0.c` | 4/10 sampled | `[+0x50]` sel (switch discriminant), `[+0x54]` payload (halfword-packed) |
| `data_ov006_021cf140` / `data_ov006_0224f290` (GCmd output) | no dedicated doc yet | 4/10 sampled | `f0` mode code, `f10`/`f14` = payload>>16 / payload&0xFFFF (store order matters) |
| `data_ov006_0225e068` (copy/archive target) | no dedicated doc yet | 4/10 sampled | passed as arg to `func_ov006_021c9ef4(src, dst)` |
| `data_ov006_021cf158` / `data_ov006_021cf1b0` (local work buffers) | no dedicated doc yet | 2/10 sampled | passed to `Fill32` / `func_ov005_021ad018` / `func_ov005_021ad030` |
| `data_ov006_0224e068` / `data_ov006_0224f398` (B/A state pair) | no dedicated doc yet — see `021b5a54.c` | 2/10 sampled | A[0], A[1] = dispatch codes; B[0] bool-normalize; B[0x4C/4] = sel, B[0x48/4] flag |
| `data_02104f4c` (`:3` chan bitfield at +0x4) | [GlobalData02104e6c.md](../types/GlobalData02104e6c.md) | confirmed in ov006_core | read as `(x << N) >> N` or `:3` bitfield; equals-to-0 chan test |

### Common blocking risks

1. **reshape-able (37 / 73)** — store-order in switch arms: ov006 heavily uses
   jump-table dispatch where individual cases have strict store sequences
   (`f10` then `f14` then `f0` is NOT the same as ascending order). Read the
   case body order from the `.c` draft.
2. **permuter-class (32 / 73)** — loop-invariant hoist vs in-loop reload;
   the `v >> 16` / `v & 0xFFFF` halfword unpack relies on the compiler keeping
   `v` in one register across both extractions.
3. **struct-guessed (4 / 73)** — `func_ov006_021b6be0` return type (pointer),
   argument order of cross-overlay calls, and `Copy32` src/dst/n signature.

### Sample candidates by risk class

```c
/* func_ov006_021b28c0 — risk: reshape-able (case store-order) */
/* key patterns: data_ov006_0225cbb8.f50 (sel) and .f54 (payload);
 *   data_ov006_021cf140 → f0 mode code, f10/f14 halfword unpack;
 *   STORE ORDER: case3 must emit f10 THEN f14 THEN f0 exactly */
```

```c
/* func_ov006_021b29b0 — risk: reshape-able (teq idiom) */
/* key patterns: data_02104f4c.chan :3 == 0 test (lsl;lsr pair, NOT and);
 *   func_ov006_021b6be0(ptr, 2, 0) return value as bool (*p == 0);
 *   equality via `teq` of two 0/1 bools — use (a==0)==(b==0) form */
```

```c
/* func_ov006_021b5a54 — risk: reshape-able (bool normalize) */
/* key patterns: data_ov006_0224e068[0] bool-normalize → int x=(B[0]!=0);
 *   data_ov006_0224f398[0]/[1] = A state codes (1/2/0x1a/0x1c);
 *   data_ov006_0224f38c[0] = 3 if flag set;
 *   switch on B[0x4C/4] - 0x18 → 5 cases */
```

---

## ov004 MED candidates (44 total)

### Common structs needed

| Struct / Global | KB Doc | Frequency in sample | Access pattern |
|-----------------|--------|---------------------|----------------|
| `data_02102c90` (render/draw context ptr) | no dedicated doc yet | 3/10 sampled | reloaded each call (3× ldr, do NOT bind to one local); passed as first arg to draw calls |
| `data_021040ac` (GlobalAudioState) | [GlobalAudioState.md](../types/GlobalAudioState.md) | 1/5 sampled | `[+0xBCC]` (signed char) state field |
| `data_ov004_02200dbc` (template 16-B record) | no dedicated doc yet | 1/5 sampled | `ldm`/`stm` 16-B struct-copy |
| `data_ov004_02209ad4` (entity build descriptor) | no dedicated doc yet | 1/5 sampled | passed to `func_02091554` |
| `data_ov004_0220b500` / `data_ov004_0220e500` (per-module state) | no dedicated doc yet | 1/5 sampled | offsets +0x48, +0x54 (counter), +0xCD0 |
| `data_02104c7a` (format string / table) | no dedicated doc yet | 1/5 sampled | passed to `func_020aadf8` |

### Common blocking risks

1. **permuter-class (22 / 44)** — outgoing stack-arg store scheduling for
   large-arg calls (8–12 args). The compiler's store order for the stack slots
   is the most common wall. Siblings of matched ov004 functions note that
   `0x24`/`0x20` pairs store first (descending offset order) before the
   lower slots — this is scheduling-sensitive.
2. **reshape-able (15 / 44)** — `data_02102c90` must be reloaded 3× (do not
   bind to one local); signed integer division `/2` needs `signed int v` to
   emit the `add lsr#31; asr#1` idiom; `<<9` scale on struct field.
3. **struct-guessed (7 / 44)** — `sp+0xN` stack-arg offsets for incoming
   parameters and large-call argument roles are inferred; `s_38`/`s_3c`
   mapping is the most common unresolved question.

### Sample candidates by risk class

```c
/* func_ov004_021c9ef0 — risk: reshape-able (reload + signed /2) */
/* key patterns: data_02102c90 RELOAD 3× (three separate ldr, no bind);
 *   signed int v for `0x80 - v/2` → add+lsr#31+asr#1 idiom;
 *   func_0208df0c() / func_0202c0c0() / func_020054a4() getter chain */
```

```c
/* func_ov004_021ca128 — risk: permuter-class (12-arg store order) */
/* key patterns: pair[1]=a3<<12 BEFORE pair[0]=a2<<12 (descending order);
 *   func_0201eaa0 12-arg call; a0[0]<<9; stack slots [sp+0x24]/[sp+0x20] first */
```

```c
/* func_ov004_021cc21c — risk: reshape-able (literal arithmetic) */
/* key patterns: data_021040ac[+0xBCC] as signed char;
 *   `0x3a - 0x3b` literal arithmetic → mwcc emits mov#0x3a; sub#0x3b (do NOT fold);
 *   store ORDER: D+0x48 → D+0x54++ → E+0xCD0 */
```

---

## ov011 MED candidates (41 total)

### Common structs needed

| Struct / Global | KB Doc | Frequency in sample | Access pattern |
|-----------------|--------|---------------------|----------------|
| `data_ov011_021d403c` (MMIO/HW register block) | no dedicated doc yet — see `021ca630.c` / `021cc814.c` | 3/5 sampled | `[+0x218]` interpolation factor; `[+0x264]` dispatch selector; `[+0x268]` nibble-equality word; `[+0x280]` bic/orr 4-bit field RMW |
| `data_ov011_021d4000` (HW register block, guards) | no dedicated doc yet — see `021ca630.c` | 2/5 sampled | `[+0x2A4]` guard word for 4-bit field `lsl#15;lsr#28` |
| `data_ov011_021d4110` / `data_ov011_021d4174` (handle tables) | no dedicated doc yet — see `021cc194.c` / `021cc27c.c` | 2/5 sampled | `((void**)data)[idx]` → handle; passed to `func_0201e800` / `func_0201eaa0` |
| `GetSystemWork()` → `SysWork` struct | no dedicated doc yet — see `021ca03c.c` | 1/5 sampled | `[+0x900]` two-bit field at bits 9–10 via `lsl#21;lsr#30` |
| `func_0201eaa0` (12-arg render/cell setup sink) | no dedicated doc yet | 3/5 sampled | arg3 = `(p2<<16)>>16` halfword; stack args 5–12 include 0xDD80/0x160 literals |

### Common blocking risks

1. **permuter-class (24 / 41)** — `stmib sp, {r0, r5, r6, ip}` / `{r0, r5, r6}`
   arg-grouping coin-flip for `func_0201eaa0` is the most-documented wall.
   Three siblings already ship as `.s` (documented in `ov011_core.h`). Do not
   attempt C reshape for any candidate whose risk mentions the `eaa0 stmib wall`.
2. **reshape-able (14 / 41)** — bitfield guard shape: if `and+lsr` appears
   instead of `lsl#15;lsr#28`, switch to unsigned `:4` bitfield at bit13.
   Cross-overlay `bl` targets also require real extern names (not placeholders).
3. **struct-guessed (3 / 41)** — `w0` field bit positions and `cc424` 6-arg
   roles are inferred from shift patterns; divisor magic constants (smull)
   unknown in two candidates.

### Sample candidates by risk class

```c
/* func_ov011_021ca630 — risk: reshape-able (bitfield guard shape) */
/* key patterns: data_ov011_021d4000[+0x2A4] → (x<<15)>>28 guard (`:4` bitfield at bit13);
 *   data_ov011_021d403c[+0x280] → bic 0x3c0000 / orr 0xc0000 (set bits 18-19) */
```

```c
/* func_ov011_021cc194 / 021cc27c — risk: permuter-class (stmib wall, ships .s) */
/* key patterns: data_ov011_021d4110[idx] or 021d4174[idx] handle lookup;
 *   func_0201eaa0 12-arg call; halfword (p2<<16)>>16; literals 0xDD80/0x160;
 *   NOTE: both already shipped .s — do not re-attempt C match */
```

```c
/* func_ov011_021cc814 — risk: permuter-class (load-dest reg wall) */
/* key patterns: data_ov011_021d403c[+0x218] interpolation factor;
 *   /4096 idiom → mul;asr;add lsr;asr triple;
 *   [+0x264] switch dispatch; [+0x268] nibble-equality (bits 12:9 == bits 16:13) */
```

---

## Quick lookup table

| I'm working on… | First check… |
|-----------------|--------------|
| ov002 MED candidate accessing `022d016c` | [DuelStateSingleton.md](../types/DuelStateSingleton.md) — offsets +0xCEC, +0xCF8, +0xD0C, +0xE0 |
| ov002 MED candidate accessing `022cf16c` | [PerPlayerRowTable.md](../types/PerPlayerRowTable.md) — `(player&1)*0x868` base, slot stride 0x14 |
| ov002 MED candidate accessing `022ce288` | [DuelQueueState.md](../types/DuelQueueState.md) — +0x5C0 lock, +0x5A8 state |
| ov002 MED candidate with `:13` bitfield | [PerPlayerRowTable.md](../types/PerPlayerRowTable.md) §`Ov002Slot.id_lo13` — must use `: 13` not `& 0x1FFF` |
| ov002 MED candidate with player-side `: 1` bit | [Ov002SelfContext.md](../types/Ov002SelfContext.md) — `self->b0 : 1` must use `: 1` syntax |
| ov002 MED candidate with `(player&1)*0x868` index | [PerPlayerRowTable.md](../types/PerPlayerRowTable.md) §access pattern |
| ov002 MED bulk-zero init (`func_ov002_0229cd5c`) | no dedicated doc — see `021ae7b8.c` for the full table of zeroed globals |
| main MED candidate accessing `021040ac` | [GlobalAudioState.md](../types/GlobalAudioState.md) — offsets +0x3C/40/44 snapshot, +0xB64 state, +0xB68 |
| main MED candidate accessing `02102c7c` | [GlobalData02102c7c.md](../types/GlobalData02102c7c.md) — +0x4/+0x8 int fields; bitfields at +0x24/+0x38; ptr table +0x88–+0xA8 |
| main MED candidate accessing `021040ac` + store-order risk | [GlobalAudioState.md](../types/GlobalAudioState.md) — interleave ldr–str not load-all/store-all |
| main MED candidate with `0x2F07` flag mask | [GlobalData02104bac.md](../types/GlobalData02104bac.md) — `flags` at +0x54 |
| main MED candidate with `data_02104f1c` | [GlobalData02104f1c.md](../types/GlobalData02104f1c.md) — offsets +0x00, +0x04, +0x10, +0x14, +0x18, +0x1C |
| main MED candidate calling `func_020498f0()` | [GameSingleton.md](../types/GameSingleton.md) — do not cache the pointer across calls |
| main MED candidate with `data_020c4204[v].f_4` | [DataArrayStrides.md](../types/DataArrayStrides.md) — 16-B struct, 147 entries at 0x020C4204 |
| ov006 MED candidate with halfword unpack `v>>16` / `v&0xFFFF` | no dedicated doc — see `021b28c0.c` §GCmd struct; store f10 BEFORE f14 BEFORE f0 |
| ov006 MED candidate with `:3` chan bitfield | [GlobalData02104e6c.md](../types/GlobalData02104e6c.md) — same field pattern in data_02104f4c and data_02104e6c |
| ov006 MED candidate with `teq` bool equality | no dedicated doc — use `(a == 0) == (b == 0)` C form; see `021b29b0.c` |
| ov004 MED candidate reloading `data_02102c90` | no dedicated doc — RELOAD 3× each call, do NOT bind to one local |
| ov004 MED candidate with signed `/2` scale | no dedicated doc — use `signed int v`; `0x80 - v/2` → `add lsr#31; asr#1` |
| ov004 MED candidate with 12-arg stack call | no dedicated doc — emit pair[1] before pair[0] (descending offset order) |
| ov011 MED candidate with `lsl#15;lsr#28` bitfield | no dedicated doc — switch to unsigned `:4` bitfield at bit13 if `and+lsr` appears |
| ov011 MED candidate with `stmib` arg wall | no dedicated doc — if risk mentions `eaa0 stmib wall`, accept as `.s`; do NOT re-attempt C |
| ov011 MED candidate accessing `021d403c` | no dedicated doc — see `021cc814.c` for `/4096` idiom and nibble-equality pattern |
| any MED candidate with `lsl#19;lsr#19` | unsigned 13-bit bitfield — use `unsigned int id : 13` over a 32-bit ldr word |
| any MED candidate with `(x<<18)>>31` | 1-bit test at bit 13 — use `(x >> 13) & 1` or `unsigned : 1` at bit 13 |
| any candidate with `0x3a - 0x3b` literal | do NOT fold to -1; keep as `0x3a - 0x3b` to force `mov+sub` pair |
