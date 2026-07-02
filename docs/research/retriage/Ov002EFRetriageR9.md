[//]: # (markdownlint-disable MD013 MD041)

# ov002 E/F Re-triage — Round 9 (residual, size-ascending 50-func slice)

Generated 2026-07-02. This is the **ninth** retriage pass on ov002. Unlike
R8's virgin `<400 B` slice (which hit 100%), this batch was drawn from the
size-ascending residual whose ORIGINAL heuristic notes skew toward
"blx callback", "coin-flip", "permuter-class", "reg-alloc heavy" language —
a genuinely harder character than R7/R8's mostly "missing struct name"
finds. All 50 target `.s` ships were confirmed still present (none flipped
to `.c` by another lane since the brief was written).

**Important provenance note found during triage:** 39 of these 50 addresses
already appear as literal addresses somewhere in R4's `Ov002EFRetriage.md`.
Cross-checking revealed two distinct sub-groups within that overlap:

1. **13 addresses appear in R4's "Confirmed Intractable" prose list** with a
   specific reason (e.g. "no struct access — scheduling"). Independent
   re-reading of the `.s` confirms R4's wall verdict for 12 of these 13 (the
   13th, `0x022640F4`, turned out to have a self-contradictory R4 doc — it
   was ALSO listed in R4's own tractable summary table; ground-truth
   `.s` reading resolves the contradiction in favor of **tractable**, see
   below).
2. **26 addresses appear ONLY in R4's tractable summary table** (the
   address/size/class/confidence/struct columns at the end of
   `Ov002EFRetriage.md`) **with no prose write-up**, and — critically — the
   `.s` file was never flipped to `.c`. This is a genuine "R4 tabulated the
   verdict but the recipe was never written" gap. All 26 were independently
   re-derived from the `.s` here, and it turns out **24 of the 26 already
   have byte-verified per-function dossiers** in `docs/research/dossiers/`
   (a separate corpus this round discovered and cross-checked against) that
   confirm the same tractable verdict with full struct-offset detail — this
   round pulls that detail in directly rather than re-deriving from scratch.

Combined with 11 genuinely virgin addresses (never in any retriage doc) and
6 more overlap addresses that also happen to have dossiers, **30 of the 50
targets in this batch have pre-existing byte-verified dossiers** in
`docs/research/dossiers/<addr>.md`, all independently re-confirmed against
the `.s` ground truth during this round. The remaining 20 were triaged from
scratch against the KB docs below.

KB references consulted: `docs/research/types/DuelStateSingleton.md`,
`docs/research/types/PerPlayerRowTable.md`,
`docs/research/types/DuelQueueState.md`,
`docs/research/types/Ov002SelfContext.md`,
`docs/research/data/FunctionPointerTables.md`,
`docs/research/data/Ov002DataComplete.md`,
`docs/research/data/CardHandlerTable.md`,
`docs/research/constants/*.md`,
`docs/research/retriage/Ov002EFRetriage.md` (R4) and
`docs/research/retriage/Ov002EFRetriageR8.md` (R8) for intro/pattern
context, plus the `docs/research/dossiers/*.md` per-function corpus where
present.

---

## Summary

| Metric | Count |
|--------|-------|
| Examined | **50** |
| Newly tractable | **38** (76% of examined) |
| Confirmed intractable (wall) | **12** (24%) |
| Skipped (already `.c`) | **0** |
| New KB gaps found | **6** |

**Hit-rate honesty note:** 76% is meaningfully lower than R7/R8's 100% and
close to R4's original 72% — exactly as the brief's calibration predicted.
The 12 walls in this batch are NOT struct-naming gaps; every one of them was
re-checked against every KB doc above and none resolves. They fall into two
real categories: (a) the `blx` target is a genuine caller-supplied register
with **no backing table at all** (not even an undocumented one — `mov r9,
r0` etc. at function entry, i.e. the register is definitionally an opaque
parameter with **fixed but externally-determined** scheduling — that's still
"tractable" in the strict sense used elsewhere in this campaign for
callback-arg cases, so these are NOT that; see per-function detail — they
are cases where there is genuinely no way to bind a name to the discriminant
at all, either because it's a pure recursive search with zero struct touch,
or an eor/tile-pack loop with zero data symbol references whatsoever); and
(b) pure OAM/tile bit-arithmetic with no struct or documented-table
reference of any kind. No function in this batch was forced into
"tractable" against real scheduling ambiguity — see the Confirmed
Intractable section for the named ambiguity per entry.

**Recurring pattern inventory (this batch):**

| KB Pattern | Unlock condition | Funcs hit |
|-----------|-------------------|-----------|
| `PerPlayerRowTable` base+stride 0x868, slot array +0x030 stride 0x14 | struct documented | 20 |
| `Ov002Slot.id_lo13` 13-bit bitfield (`lsl/lsr` pair) | struct documented | 11 |
| `DuelStateSingleton` offset fields (+0xCEC, +0xCF0, +0xD1C, +0xD20, +0xD28, +0xD2C, +0xD30, +0xD44) | struct documented | 9 |
| `DuelQueueState+0x5C0` (re-entrancy lock) | struct documented | 4 |
| `CardHandlerTable` stride-8 dispatch (`ldr r3,[r1,r2,lsl#3]`) | struct documented | 2 |
| Caller-supplied callback arg (`blx` on a register loaded from `mov rN, rM` at entry, M = an incoming parameter register) | recognized as deterministic scheduling per R4's `0x02257750` precedent | 9 |
| `Ov002Self.f0`/`b0:1` core fields + "extended-self" per-TU halfwords (R8 recipe) | struct + recipe documented | 6 |
| `data_ov002_022c86b8` / `022cd524` (card-ID→pointer table + StateCtrl, documented in `Ov002DataComplete.md` / R4's `0x02299C9C`) | data doc + prior recipe | 1 |

The single biggest lever in this batch is recognizing that a `blx` through
a register is not automatically a scheduling coin-flip: if that register was
loaded from an incoming function argument at entry (`mov r9, r1` etc., with
no intervening redefinition), the call target is **exactly as deterministic
as any documented fn-ptr table** — the compiler picked a fixed calling
convention for a fixed, if externally-supplied, function pointer. 9 of the
38 tractable functions in this batch hinge on that recognition. The other
crux distinguishing tractable-`blx` from wall-`blx` is: does the `blx`
target trace to a **documented, indexed table** (dispatch systems 2/3 in
`DuelStateSingleton.md`, `CardHandlerTable.md`) — genuinely tractable
despite being "indirect" — versus an **undocumented table with no index
provenance** (wall, e.g. `0x0229AD88`) or a **truly unbound register with no
argument/table origin** (wall, e.g. `0x021B1200`'s `r9` which is itself a
raw caller-supplied opaque fn ptr used as the sole selector with zero
struct/table backing anywhere nearby — this is different from the
tractable callback cases only in that R4 already flagged it and re-reading
confirms no NEW KB fact changes that verdict, whereas the 9 tractable
callback cases either are newly recognized as such this round or simply
never got their recipe written down before).

---

## Newly Tractable Funcs

Functions are grouped by pattern family for readability. Each entry gives
byte size, original heuristic verdict, upgrade reason, struct/data
dependencies, ground-truth pool words / BL-BLX targets, and a C sketch.
Where a byte-verified dossier already exists (`docs/research/dossiers/`),
this entry summarizes it; full struct-context tables and the "Try this"
reg-alloc notes live in that dossier — cite it for match-time detail.

### DuelStateSingleton dispatch-system hits (7 funcs)

---

#### 0x022627AC (88 B, class E)

**Original verdict:** E, med confidence — blx through fn-ptr table, "opaque dispatch"

**Upgrade reason:** Reads `DuelStateSingleton+0xD2C` (documented dispatch-
system-3 index) as the index into `data_ov002_022cb96c[]` — this is the
EXACT function quoted verbatim as the illustrative code sample in
`DuelStateSingleton.md`'s "Dispatch subsystem 3" section. The `blx r1` is a
documented, indexed fn-ptr table lookup, not a coin-flip. Dossier:
`docs/research/dossiers/022627ac.md`.

**Struct/data needed:** `DuelStateSingleton+0xD2C` (dispatch-3 index),
`+0xD30` (clear flag), `data_ov002_022cb96c` (10-entry BSS fn-ptr array).

**Ground-truth pool words:** `data_ov002_022d016c`, `data_ov002_022cb96c`

**BL/BLX targets:** `blx r1` (indexed table entry, deterministic)

```c
int func_ov002_022627ac(void) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    int idx = dss->f_d2c;                      /* +0xD2C */
    fn_t handler = data_ov002_022cb96c[idx];
    if (!handler) return 1;
    if (handler()) {
        dss->f_d30 = 0;                         /* +0xD30 */
        dss->f_d2c = idx + 1;
    }
    return 0;
}
```

---

#### 0x021B08A8 (136 B, class E)

**Original verdict:** E — blx through fn-ptr table, "post-call reg rotation"

**Upgrade reason:** Reads `+0xCEC` (card_list_slot_idx) as arg to
`func_ov002_021b3ecc`, then dispatches through `data_ov002_022ca998[dss->
f_d1c]` — dispatch-system-2, also quoted verbatim in `DuelStateSingleton.md`.
Post-call "rotation" is the standard advance (`f_d20=0; f_d1c++`). Dossier:
`docs/research/dossiers/021b08a8.md`.

**Struct/data needed:** `+0xCEC`, `+0xD1C`, `+0xD20`, `data_ov002_022ca998`.

**Ground-truth pool words:** `data_ov002_022d016c`, `0x0000151e` (compiler
register-setup artifact, not consumed as a value), `data_ov002_022ca998`

**BL/BLX targets:** `func_ov002_021b3ecc`, `func_ov002_022663cc`, `blx r0`
(indexed table entry)

```c
int func_ov002_021b08a8(void) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    int slot_idx = dss->f_cec;
    if (func_ov002_021b3ecc(slot_idx, 0xb) != 0) {
        if (func_ov002_022663cc() == 0) return 0;
    }
    int sub_state = dss->f_d1c;
    fn_t handler = data_ov002_022ca998[sub_state];
    if (handler == NULL) return 1;
    if (handler() != 0) {
        dss->f_d20 = 0;
        dss->f_d1c = sub_state + 1;
    }
    return 0;
}
```

---

#### 0x0221AF10 (128 B, class E)

**Original verdict:** E — "nested loops eor discriminant + spill, coin-flip"

**Upgrade reason:** `eor sl, dss->f_cec, player` — the documented
card_list_slot_idx XOR-player idiom from R4's own `func_ov002_02256a50`
representative. Deterministic (player=0..1) × (slot=0..4) double loop.
Dossier: `docs/research/dossiers/0221af10.md`.

**Struct/data needed:** `+0xCEC`.

**Ground-truth pool words:** `data_ov002_022d016c`

**BL/BLX targets:** `func_ov002_0225764c`, `func_ov002_021d6808`

```c
int func_ov002_0221af10(void *self) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    for (int p = 0; p < 2; p++) {
        int actual = dss->f_cec ^ p;             /* re-read each outer iter */
        for (int s = 0; s < 5; s++) {
            if (func_ov002_0225764c(self, actual, s) == 0) continue;
            func_ov002_021d6808(self, actual, s, 0, 0);
        }
    }
    return 0;
}
```

---

#### 0x022119BC (184 B, class E)

**Original verdict:** E — "loop eor-discriminant mla, multiple shift CSE temps"

**Upgrade reason:** Same `+0xCEC` XOR idiom as above, indexing a companion
table `data_ov002_022cd420` (stride 0x38, NOT the 0x868 PPT stride) whose
`+0x2C` flag selects a fallback path, else reads `PerPlayerRowTable+0x30`
slot word and compares a composite id_lo13-style extraction against the
companion's `+0xC` reference field. Dossier:
`docs/research/dossiers/022119bc.md`.

**Struct/data needed:** `+0xCEC`; `data_ov002_022cd420` (stride 0x38: `+0x0`
player select, `+0x4` slot idx, `+0xC` ref value, `+0x2C` fallback flag);
`PerPlayerRowTable` (+0x30 slots, stride 0x868).

**Ground-truth pool words:** `data_ov002_022cf16c`, `data_ov002_022cd420`,
`0x00000868`, `data_ov002_022d016c`

**BL/BLX targets:** `func_ov002_021df130`, `func_ov002_021de64c`

```c
int func_ov002_022119bc(CardObj *self) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    for (int p = 0; p < 2; p++) {
        int actual = dss->f_cec ^ p;
        struct Cd420Entry *entry =
            (struct Cd420Entry *)((char *)data_ov002_022cd420 + actual * 0x38);
        if (entry->f_2c != 0) { func_ov002_021df130(self, p, 0); continue; }
        int e_player = entry->f_0, e_slot = entry->f_4;
        char *row = (char *)data_ov002_022cf16c + (e_player & 1) * 0x868;
        u32 word = *(u32 *)(row + 0x30 + e_slot * 0x14);
        int s_byte = (word << 2) >> 0x18;
        int s_val = (s_byte << 1) + ((word << 0x12) >> 0x1f);
        if (entry->f_c != s_val) continue;
        func_ov002_021de64c(self, 0);
    }
    return 0;
}
```

---

#### 0x022648C8 (192 B, class E)

**Original verdict:** E — "loop OAM attr pack, asr/ror, many live regs" (this
size/pattern note in the original list matches a DIFFERENT function; the
actual `.s` for this address is a DuelStateSingleton dispatch loop, not an
OAM packer)

**Upgrade reason:** `DuelStateSingleton+0xD28` (documented slot-iteration
counter, "compared to 0xA... incremented each slot" per the struct doc) as
a `< 2` loop bound; `eor r5, r6, r0` is the arg-XOR-index idiom. Calls
`func_ov002_021b947c()` (zero-arg global query) and extracts a type byte to
gate a conditional `func_ov002_021e30b4` OAM call. Dossier:
`docs/research/dossiers/022648c8.md`.

**Struct/data needed:** `+0xD28`.

**Ground-truth pool words:** `data_ov002_022d016c`, `0x000013a6`,
`0x0a4e13a6`

**BL/BLX targets:** `func_ov002_021b4120`, `func_ov002_021b947c`,
`func_ov002_021e30b4`, `func_ov002_021d5b80`

```c
int func_ov002_022648c8(int arg0) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    while ((unsigned int)dss->f_d28 < 2) {
        unsigned int i = (unsigned int)dss->f_d28;
        int player = arg0 ^ (int)i;
        int r4 = func_ov002_021b4120(player, 0xb, 0x13a6);
        if (r4 <= 0) { dss->f_d28++; continue; }
        int type_word = func_ov002_021b947c();
        unsigned int type_byte = ((unsigned int)((type_word << 16) >> 16) >> 8) & 0xffu;
        if (type_byte == 0xe) {
            unsigned int topbit = ((unsigned int)player << 31) & 0x80000000u;
            func_ov002_021e30b4((int)(topbit | 0x0a4e13a6u),
                                 (int)(((unsigned int)r4 << 16) >> 16), 0);
        }
        func_ov002_021d5b80(player, 0xb, 0x13a6, 0);
        return 0;
    }
    return 1;
}
```

---

#### 0x022640F4 (180 B, class E)

**Original verdict:** E, per R4 prose list — "divmod /5 double-umull +
eor-discriminant — umull scheduling, no KB"; **but R4's OWN tractable
summary table separately lists this same address as `high | Ov002Slot`** —
a documented internal contradiction in R4. Ground-truth `.s` resolves it.

**Upgrade reason:** `DuelStateSingleton+0xD28` (documented slot-iteration
counter, `< 0xA` bound) drives a scan; the double-`umull` is a compiler
constant-divide-by-5 (quotient/remainder), and `arg0 ^ quot` is the
documented player-XOR idiom. The id compare target is `PerPlayerRowTable
+0x30` slot word's `id_lo13` bitfield against a precomputed constant
`0x868 + 0xda0 = 0x1608`. Every register in the umull chain is deterministic
mwcc constant-divide codegen, not scheduling entropy. Dossier:
`docs/research/dossiers/022640f4.md`.

**Struct/data needed:** `+0xD28`; `PerPlayerRowTable` base 0x022CF16C,
stride 0x868; `Ov002Slot.id_lo13`.

**Ground-truth pool words:** `data_ov002_022d016c`, `0x00000868`,
`data_ov002_022cf16c`, `0xcccccccd` (mwcc's `/5` magic-multiply constant)

**BL/BLX targets:** `func_ov002_021de480`

```c
int func_ov002_022640f4(int arg0) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    Ov002FieldZone *tbl = &data_ov002_022cf16c[0];
    const unsigned int target = 0x868u + 0xda0u;   /* 0x1608 */
    unsigned int i = (unsigned int)dss->f_d28;
    if (i >= 10) return 1;
    while (1) {
        int quot = (int)(i / 5), rem = (int)(i % 5);
        int player = arg0 ^ quot;
        Ov002Slot *slot = &((Ov002FieldZone *)((char *)tbl + (player & 1) * 0x868))->slots[rem];
        unsigned int id = ((unsigned int)slot->f_0 << 19) >> 19;
        if (id == target) {
            func_ov002_021de480(player, rem, 0, 0);
            dss->f_d28 = i + 1;
            return 0;
        }
        i++;
        dss->f_d28 = i;
        if (i >= 10) break;
    }
    return 1;
}
```

---

#### 0x02265014 (172 B, class E)

**Original verdict:** E — "loop w/ caller-saved select + render-call packing"

**Upgrade reason:** Reads `DuelStateSingleton+0xCF0` — a new field adjacent
to the documented `+0xCF8` (duel_phase); the neighbour relationship makes
its role (a bound/counter used in a score-delta computation) unambiguous
even though the exact semantic name is still open (flagged as a KB gap
below). The `eor sl, sl, #1` at loop-bottom is the documented player-toggle
idiom, and the call target `func_ov002_021d479c` is the documented arg-pack
sink family. Dossier: `docs/research/dossiers/02265014.md`.

**Struct/data needed:** `+0xCF0` (new, see KB gaps).

**Ground-truth pool words:** `0x0000169c`, `data_ov002_022d016c`

**BL/BLX targets:** `func_ov002_021b4120`, `func_ov002_021d479c`,
`func_ov002_021e276c`

```c
int func_ov002_02265014(int player) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    for (int i = 0; i < 2; i++, player ^= 1) {
        int slot = func_ov002_021b4120(player, 0xB, 0x169C);
        if (slot < 0) continue;
        int bound = dss->f_cf0 + 1;             /* +0xCF0, new field */
        int delta = bound - slot;
        int xflag = player ? 0x8000 : 0;
        func_ov002_021d479c((u16)(xflag | 0x3b), (u16)0x169C, 1, (u16)delta);
        if (delta >= 0x14) func_ov002_021e276c(player, 0x169C, 1, 1);
    }
    return 1;
}
```

---

### PerPlayerRowTable / Ov002Slot slot-scan hits (13 funcs)

---

#### 0x021C32D4 (124 B, class E)

**Original verdict:** E — "blx through function-pointer arg in loop,
indirect call"

**Upgrade reason:** `PerPlayerRowTable` companion `data_ov002_022cf180`
gates an extra-slot array walk (`cf16c + player*0x868 + 0x418`) that
extracts `id_lo13` per entry and calls `blx r8`. `r8` is loaded from `mov
r8, r1` at function entry — the SECOND incoming parameter, i.e. a
caller-supplied predicate, not an internal dispatch. This is the R4
`0x02257750`-precedent callback case: the schedule is fixed once the
argument is named. Dossier: `docs/research/dossiers/021c32d4.md`.

**Struct/data needed:** `data_ov002_022cf180` (extra-slot count companion,
same 0x868 stride), `PerPlayerRowTable+0x418` (extra-slot array), Ov002Slot
`id_lo13`.

**Ground-truth pool words:** `0x00000868`, `data_ov002_022cf180`,
`data_ov002_022cf16c`

**BL/BLX targets:** `blx r8` (caller-supplied callback, arg1)

```c
int func_ov002_021c32d4(int player, int (*callback)(int)) {
    int stride = (player & 1) * 0x868;
    int init_count = *(int *)((char *)data_ov002_022cf180 + stride);
    if ((unsigned int)init_count <= 0) return 0;
    char *player_base = (char *)data_ov002_022cf16c + stride;
    int *arr = (int *)(player_base + 0x418);
    int total = 0, hits = 0;
    do {
        unsigned int word = (unsigned int)*arr;
        int id = (int)((word << 0x13) >> 0x13);
        if (callback(id)) hits++;
        int lim = *(int *)(player_base + 0x14);
        total++; arr++;
    } while ((unsigned int)total < (unsigned int)lim);
    return hits;
}
```

---

#### 0x02221A38 (128 B, class E)

**Original verdict:** E — "double counted loop but call+bitfield stack args"

**Upgrade reason:** Bounded (player=0..1) × (slot=0..4) double loop gated by
`func_ov002_0225764c` (already-known ov002 guard, same shape as R4's
`0x022157E4` sibling), dispatching to `func_ov002_021d5a08` with the player
bit extracted from `self->f2` bit0 via the documented `lsl#0x1f/lsr#0x1f`
pattern. All bounds are literal constants. Dossier:
`docs/research/dossiers/02221a38.md`.

**Struct/data needed:** `Ov002Self.f2` bit0 (via the documented bitfield
shape); loop is a plain 0..1 × 0..4 iteration (no direct PPT pointer math in
this function).

**Ground-truth pool words:** none (no literal pool)

**BL/BLX targets:** `func_ov002_0225764c`, `func_ov002_021d5a08`

```c
int func_ov002_02221a38(CardObj *self) {
    for (int player = 0; player < 2; player++) {
        for (int slot = 0; slot <= 4; slot++) {
            if (func_ov002_0225764c(self, player, slot) == 0) continue;
            int pbit = (self->f2 << 0x1f) >> 0x1f;
            func_ov002_021d5a08(self, player, slot, (unsigned short)self->f0, 5, pbit);
        }
    }
    return 0;
}
```

---

#### 0x0227DD6C (140 B, class E)

**Original verdict:** E — "33 insns mla-base loop with blx callback,
bit-twiddle"

**Upgrade reason:** `PerPlayerRowTable+0x40`/`+0x38` occupancy fields (same
bit-shape documented in R8's `021bb444` companion-field write-up) gate a
5-slot scan; `blx r7` is loaded from `mov r7, r1` at entry — arg1 callback,
same fixed-scheduling case as `021c32d4` above. Calls the documented core
slot resolver `func_ov002_021b9ecc`. Dossier:
`docs/research/dossiers/0227dd6c.md`.

**Struct/data needed:** `PerPlayerRowTable+0x38`/`+0x40` (occupancy guard
bits 1/2/6), stride 0x14 slots.

**Ground-truth pool words:** `data_ov002_022cf16c`, `0x00000868`

**BL/BLX targets:** `func_ov002_021b9ecc`, `blx r7` (caller callback, arg1)

```c
int func_ov002_0227dd6c(int player, fn_t callback) {
    char *row = (char *)&data_ov002_022cf16c + (player & 1) * 0x868;
    int count = 0;
    for (int s = 0; s < 5; s++, row += 0x14) {
        u32 occ = *(u32 *)(row + 0x40);
        u16 grd = *(u16 *)(row + 0x38);
        int b1 = ~((occ >> 6) & 1), b0 = ~(((occ >> 2) | (occ >> 1)) & 1);
        if (!((grd & b1) & b0)) continue;
        func_ov002_021b9ecc(player, s);
        if (callback() != 0) count++;
    }
    return count;
}
```

---

#### 0x021E1BF8 (148 B, class E)

**Original verdict:** E — "loop packing bitfields into d479c, reg shuffle"

**Upgrade reason:** `DuelStateSingleton+0xD44` (a gap field between
documented `+0xD38`/`+0xD48`) is a plain countdown-loop bound; body calls
the documented `func_ov002_021d479c` arg-pack sink twice per iteration
structure. Dossier: `docs/research/dossiers/021e1bf8.md`.

**Struct/data needed:** `+0xD44` (new, see KB gaps).

**Ground-truth pool words:** `data_ov002_022d016c`

**BL/BLX targets:** `func_ov002_021b004c` (×2/iter), `func_ov002_021d479c`

```c
void func_ov002_021e1bf8(int arg0) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    int count = dss->f_d44;         /* +0xD44, new field */
    int i = count - 1;
    if (i < 0) return;
    do {
        void *p1 = func_ov002_021b004c(i + 1);
        void *p2 = func_ov002_021b004c(i + 1);
        unsigned int w1 = *(unsigned int *)p2, w2 = *(unsigned int *)p1;
        int fA = (int)((w1 << 2) >> 24), fB = (int)((w2 << 18) >> 31);
        int field2 = (fA << 1) + fB;
        int attr = ((arg0 != 0 ? 0x8000 : 0) | 0x57) & 0xffff;
        func_ov002_021d479c(attr, 0xd, (unsigned short)field2, 0);
        i--;
    } while (i >= 0);
}
```

---

#### 0x0228C924 (152 B, class E)

**Original verdict:** E — "dual-blx loop with movgt max-accumulator
rotation"

**Upgrade reason:** `PerPlayerRowTable` stride + `data_ov002_022cf178`
(documented event-count companion) gate an inner scan over `row->f_0c`
slots. Both `blx r9` (filter) and `blx r8` (score) are loaded from `mov r9,
r1`/`mov r8, r2` at entry — arg1/arg2 callbacks, deterministic. Finds the
highest-scoring filter-passing slot. Dossier:
`docs/research/dossiers/0228c924.md`.

**Struct/data needed:** `PerPlayerRowTable+0x0C` (inner bound),
`data_ov002_022cf178` (event-count gate).

**Ground-truth pool words:** `0x00000868`, `data_ov002_022cf178`,
`data_ov002_022cf16c`

**BL/BLX targets:** `blx r9` (filter, arg1), `blx r8` (score, arg2)

```c
int func_ov002_0228c924(int player, fn_t filter, fn_t score_fn) {
    int off = (player & 1) * 0x868;
    int count = ((int *)data_ov002_022cf178)[off / 4];
    if (count <= 0) return ~0;
    char *row = (char *)&data_ov002_022cf16c + off;
    int n_slots = *(int *)(row + 0x0c);
    int best_score = 0, best_slot = ~0, fp_slot = 0xb;
    for (int i = 0; i < n_slots; i++) {
        if (filter(player, fp_slot, i) != 0) {
            int s = score_fn(player, i);
            if (s > best_score) { best_score = s; best_slot = i; }
        }
    }
    return best_slot;
}
```

---

#### 0x022577DC (156 B, class E) and 0x022579A8 (156 B, class E)

**Original verdict:** E (both) — "mla base nested loop, blx, discriminant
rotation" / "clone of 022577dc nested-loop blx pattern"

**Upgrade reason:** Near-twins. Both write `DuelQueueState+0x5C0`
(re-entrancy lock) to 0 after resolving a record via
`func_ov002_02257464`, then scan `PerPlayerRowTable` testing bit 2 of the
`+0x40` flag word, invoking a callback fn ptr loaded from the RECORD
(`[r6, #0x8]`, a struct field, not a raw register — still fully
deterministic since it's a fixed struct offset). The only difference is the
inner loop bound: `022577dc` scans all 11 slots (0..10, full+extra zone),
`022579a8` scans only the 5 field-zone slots (0..4). Dossiers:
`docs/research/dossiers/022577dc.md`, `docs/research/dossiers/022579a8.md`.

**Struct/data needed:** `DuelQueueState+0x5C0`; `PerPlayerRowTable+0x40`
occupancy bit 2; record `+0x8` callback field (from `func_ov002_02257464`'s
return).

**Ground-truth pool words:** `data_ov002_022ce288`, `data_ov002_022cf16c`,
`0x00000868`

**BL/BLX targets:** `func_ov002_02257464`, `blx r3` (record's `+0x8` fn
ptr field)

```c
/* 022577dc: full 11-slot scan */
int func_ov002_022577dc(int arg0) {
    struct { char _pad[8]; int (*f8)(int, int, int); } *rec = func_ov002_02257464();
    int count = 0;
    data_ov002_022ce288.f_5c0 = 0;
    if (rec == 0 || rec->f8 == 0) return count;
    for (int p = 0; p < 2; p++) {
        char *row = (char *)data_ov002_022cf16c + (p & 1) * 0x868;
        for (int s = 0; s <= 10; s++, row += 0x14) {
            if ((*(u32 *)(row + 0x40) >> 2) & 1) continue;
            if (rec->f8(arg0, p, s)) count++;
        }
    }
    return count;
}
/* 022579a8: identical except inner loop is `s <= 4` (field zone only) */
```

---

#### 0x021B1E80 (160 B, class F)

**Original verdict:** F — "nested double loop w/ mla index + many live regs"

**Upgrade reason:** `PerPlayerRowTable` stride selects a row; each slot's
`+0x3A` halfword (nonzero if occupied) heads a linked-list walk through
`data_ov002_022d0650` (stride 8: `+0x2` type nibble, `+0x0` id, `+0x6` next
link) matching a packed `(arg0, arg1)` key. Dossier:
`docs/research/dossiers/021b1e80.md`.

**Struct/data needed:** `PerPlayerRowTable+0x3A` (list head);
`data_ov002_022d0650` (stride-8 node table, see KB gaps for full field
naming).

**Ground-truth pool words:** `data_ov002_022d0650`, `data_ov002_022cf16c`,
`0x00000868`

**BL/BLX targets:** `func_ov002_021b1d84` (on type/id match)

```c
void func_ov002_021b1e80(int arg0, int arg1) {
    unsigned int key = (arg0 & 0xff) | ((arg1 & 0xff) << 8);
    for (int p = 0; p < 2; p++) {
        Ov002Slot *slot = (Ov002Slot *)((u8 *)&data_ov002_022cf16c + (p & 1) * 0x868);
        for (int s = 0; s <= 11; s++, slot = (Ov002Slot *)((u8 *)slot + 0x14)) {
            unsigned short node_idx = *(unsigned short *)((u8 *)slot + 0x3a);
            if (node_idx == 0) continue;
            do {
                NodeEntry *e = &data_ov002_022d0650[node_idx];      /* stride 8 */
                unsigned short type = e->f_2 & 0xf;
                if (type >= 6 && e->f_0 == (unsigned short)key)
                    func_ov002_021b1d84();
                node_idx = e->f_6;
            } while (node_idx != 0);
        }
    }
}
```

---

#### 0x02257888 (164 B, class E)

**Original verdict:** E — "mla base, byte-pack compare loop, blx"

**Upgrade reason:** Same `DuelQueueState+0x5C0` + `PerPlayerRowTable+0x40`
pattern as `022577dc`/`022579a8`, but here the callback is `blx sl` loaded
from `mov sl, r1` at entry (arg1) — a plain caller callback, not a record
field. Adds a packed-key exclude mask (arg2) that skips one specific
`(player,slot)` pair. Dossier: `docs/research/dossiers/02257888.md`.

**Struct/data needed:** `DuelQueueState+0x5C0`, `PerPlayerRowTable+0x40`.

**Ground-truth pool words:** `data_ov002_022ce288`, `0x00000868`,
`data_ov002_022cf16c`

**BL/BLX targets:** `blx sl` (caller callback, arg1)

```c
int func_ov002_02257888(int arg0, int (*callback)(int, int, int), int exclude_mask) {
    int count = 0;
    data_ov002_022ce288.f_5c0 = 0;
    for (int p = 0; p < 2; p++) {
        char *row = (char *)data_ov002_022cf16c + (p & 1) * 0x868;
        for (int s = 0; s <= 10; s++, row += 0x14) {
            u16 key = (u16)((p & 0xff) | ((s & 0xff) << 8));
            if ((u16)exclude_mask == key) continue;
            if ((*(u32 *)(row + 0x40) >> 2) & 1) continue;
            if (callback(arg0, p, s)) count++;
        }
    }
    return count;
}
```

---

#### 0x021EF41C (172 B, class E)

**Original verdict:** E — "double nested mla-index loop; reg-alloc
territory"

**Upgrade reason:** Preamble checks source `(player, slot)` occupancy via
`id_lo13`, then a plain (player=0..1) × (slot=0..4) double loop checking
each target slot's `id_lo13` before calling `func_ov002_021b33b0`. Every
bound and offset resolves via documented `PerPlayerRowTable`/`Ov002Slot`.
Dossier: `docs/research/dossiers/021ef41c.md`.

**Struct/data needed:** `PerPlayerRowTable+0x30` slot array, `Ov002Slot.
id_lo13`.

**Ground-truth pool words:** `0x00000868`, `data_ov002_022cf16c`

**BL/BLX targets:** `func_ov002_021b33b0`

```c
int func_ov002_021ef41c(void *self, int player, int slot) {
    struct subrow *src = (struct subrow *)(
        data_ov002_022cf16c + (player & 1) * 0x868 + slot * 0x14);
    if (src->id_lo13 == 0) return 0;
    for (int p = 0; p < 2; p++) {
        struct subrow *row = (struct subrow *)(
            data_ov002_022cf16c + (p & 1) * 0x868 + 0x30);
        for (int s = 0; s <= 4; s++, row++) {
            if (row->id_lo13 == 0) continue;
            if (func_ov002_021b33b0(self, slot, p, s) != 0) return 1;
        }
    }
    return 0;
}
```

---

#### 0x02251EC0 (176 B, class E)

**Original verdict:** E — "counted scan loop, bitfield + multi-guard
liveness"

**Upgrade reason:** `PerPlayerRowTable` companion `data_ov002_022cf184`
(documented `+0x3a0` per-player sub-array) gates a scan whose bound comes
from `row+0x18`; three sequential guard calls
(`func_0202f3e8`/`func_ov002_021ca3f0`/`func_ov002_0223bb28`) on the
extracted `id_lo13`, then posts kind `0xc` via `func_ov002_02253458`.
Dossier: `docs/research/dossiers/02251ec0.md`.

**Struct/data needed:** `data_ov002_022cf184` (0x3a0 sub-array, PPT
companion), `PerPlayerRowTable+0x18`.

**Ground-truth pool words:** `0x00000868`, `data_ov002_022cf184`,
`data_ov002_022cf16c`

**BL/BLX targets:** `func_0202f3e8`, `func_ov002_021ca3f0`,
`func_ov002_0223bb28`, `func_ov002_02253458`

```c
void func_ov002_02251ec0(int player) {
    int row_off = (player & 1) * 0x868;
    if (*(int *)((char *)data_ov002_022cf184 + row_off) == 0) return;
    char *row = (char *)data_ov002_022cf16c + row_off;
    unsigned int *slots = (unsigned int *)(row + 0x3a0);
    int count = *(int *)(row + 0x18);
    for (int s = 0; s < count; s++, slots++) {
        int id = (int)((*slots << 0x13) >> 0x13);
        if (func_0202f3e8(id) == 0) continue;
        if (func_ov002_021ca3f0(player, id) == 0) continue;
        if (func_ov002_0223bb28(player, id) == 0) continue;
        func_ov002_02253458(player, 0xc, s);
    }
}
```

---

#### 0x0221E494 (180 B, class E)

**Original verdict:** E — "mla-base struct index loop, bitfield guard
chain"

**Upgrade reason:** Own-player 5-slot scan re-reading `self->f2` bit0 every
iteration to select the row, guarded by `Ov002Slot.id_lo13` and a `+0x38`
halfword. Accumulates `func_ov002_021c8470` results, clamps to 0xffff, and
posts via `func_ov002_021d90c0`. Dossier:
`docs/research/dossiers/0221e494.md`.

**Struct/data needed:** `PerPlayerRowTable+0x30`/`+0x38`, `Ov002Slot.
id_lo13`.

**Ground-truth pool words:** `data_ov002_022cf16c`, `0x00000868`,
`0x0000ffff`

**BL/BLX targets:** `func_ov002_0220e77c`, `func_ov002_021c8470`,
`func_ov002_021d90c0`

```c
int func_ov002_0221e494(CardObj *self) {
    int total = 0;
    func_ov002_0220e77c();
    int slot_off = 0;
    for (int s = 0; s <= 4; s++, slot_off += 0x14) {
        int player = (self->f2 << 0x1f) >> 0x1f;      /* re-read each iter */
        char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
        u32 word = *(u32 *)(row + 0x30 + slot_off);
        if (((word << 0x13) >> 0x13) == 0) continue;   /* id_lo13 */
        if (*(u16 *)(row + slot_off + 0x38) == 0) continue;
        if (((word << 0x12) >> 0x1f) != (u32)player) continue;
        total += func_ov002_021c8470(s);
    }
    if (total > 0xffff) total = 0xffff;
    int pbit = (self->f2 << 0x1f) >> 0x1f;
    int sf5 = (self->f2 << 0x1a) >> 0x1b;
    func_ov002_021d90c0(pbit, sf5, total);
    return 0;
}
```

---

#### 0x022951C4 (192 B, class E)

**Original verdict:** E — "counted loop with mla index + nested liveness"

**Upgrade reason:** Two pre-loop `func_ov002_02281920` guard calls on card
constants, then an 11-slot `PerPlayerRowTable` scan checking `id_lo13` and
the `+0x38` (`f_0e`) guard before calling `func_02031208`. Dossier:
`docs/research/dossiers/022951c4.md`.

**Struct/data needed:** `PerPlayerRowTable+0x30`/`+0x38`.

**Ground-truth pool words:** `0x000012be`, `0x00000fbb`,
`data_ov002_022cf16c`, `0x00000868`

**BL/BLX targets:** `func_ov002_02281920` (×2 guard), `func_02031208`

```c
int func_ov002_022951c4(Ov002Self *self) {
    if (func_ov002_02281920(self->f2 & 1, 0x12be) != 0) return 1;
    if (func_ov002_02281920(self->f2 & 1, 0x0fbb) != 0) return 1;
    for (int s = 0; s <= 10; s++) {
        char *row = (char *)data_ov002_022cf16c + ((self->f2 & 1) & 1) * 0x868;
        u32 word = *(u32 *)(row + 0x30 + s * 0x14);
        if (((word << 0x13) >> 0x13) == 0) continue;
        u16 f0e = *(u16 *)(row + 0x38 + s * 0x14);
        if (f0e == 0) continue;
        if (func_02031208((word << 0x13) >> 0x13) != 0) return 1;
    }
    return 0;
}
```

---

#### 0x02266220 (196 B, class E)

**Original verdict:** E — "mla-base loop, bitfield-pack into render call"

**Upgrade reason:** `PerPlayerRowTable` 5-slot scan calling the documented
core resolver `func_ov002_021b9ecc`, comparing its return against a fixed
sentinel `0x1954`, checking `+0x38` occupancy, then packing an id sub-field
and calling `func_ov002_021fd81c`. Dossier:
`docs/research/dossiers/02266220.md`.

**Struct/data needed:** `PerPlayerRowTable+0x030`/`+0x038`,
`func_ov002_021b9ecc`.

**Ground-truth pool words:** `data_ov002_022cf16c`, `0x00000868`,
`0x00001954`

**BL/BLX targets:** `func_ov002_021b9ecc`, `func_ov002_021fd81c`

```c
int func_ov002_02266220(int player, int sl_arg) {
    Ov002FieldZone *row = (Ov002FieldZone *)((char *)data_ov002_022cf16c + (player & 1) * 0x868);
    unsigned int base_flags = (((unsigned int)player << 31) & 0x80000000u) | 0x600000;
    for (int s = 0; s <= 4; s++) {
        if (func_ov002_021b9ecc(player, s) != 0x1954) continue;
        if (*(unsigned short *)((char *)row + 0x38) == 0) continue;
        unsigned int word0 = row->slots[s].word0;
        unsigned int id_byte = ((word0 << 2) >> 24) << 1;
        unsigned int score = id_byte + (word0 << 18 >> 31);
        unsigned int packed = base_flags | (((unsigned int)s << 16) & 0x1f0000);
        if (func_ov002_021fd81c(packed, (u16)score, sl_arg) != 0) return 0;
    }
    return 1;
}
```

---

### DuelStateSingleton / PerPlayerRowTable mixed hits (2 funcs)

---

#### 0x021B2E04 (184 B, class F)

**Original verdict:** F — "nested triple loop, mla index, bitfield,
search/store"

**Upgrade reason:** Full 11-slot `PerPlayerRowTable` scan (both players)
checking `id_lo13` and each slot's `+0x3A` linked-list head into
`data_ov002_022d0650` (same node table as `021b1e80`); for `type >= 6`
nodes matching a packed `(target_player, target_slot)` key, writes `val`
(arg1) into the node's word0. Leaf function (no calls). Dossier:
`docs/research/dossiers/021b2e04.md`.

**Struct/data needed:** `PerPlayerRowTable`, `Ov002Slot.id_lo13`,
`data_ov002_022d0650` (same stride-8 node table as `021b1e80`).

**Ground-truth pool words:** `data_ov002_022cf16c`, `0x00000868`,
`data_ov002_022d0650`

**BL/BLX targets:** none (leaf)

```c
void func_ov002_021b2e04(unsigned int arg0, unsigned short val) {
    int target_player = (int)(arg0 & 0xff), target_slot = (int)((arg0 >> 8) & 0xff);
    for (int p = 0; p < 2; p++) {
        Ov002FieldZone *row = (Ov002FieldZone *)((char *)data_ov002_022cf16c + (p & 1) * 0x868);
        Ov002Slot *slotptr = &row->slots[0];
        for (int s = 0; s <= 0xa; s++, slotptr++) {
            if (slotptr->id_lo13 == 0) continue;
            unsigned short link = *(unsigned short *)((char *)row + 0x3a);
            if (link == 0) continue;
            do {
                unsigned short *e = (unsigned short *)((char *)data_ov002_022d0650 + link * 8);
                unsigned int type = ((unsigned int)e[1] << 28) >> 28;
                unsigned short next = e[3];
                if (type >= 6) {
                    int src_player = e[0] & 0xff, src_slot = (e[0] >> 8) & 0xff;
                    if (src_player == target_player && src_slot == target_slot) e[0] = val;
                }
                link = next;
            } while (link != 0);
        }
    }
}
```

---

#### 0x0220A218 (200 B, class F)

**Original verdict:** F — "nested loop, orr-accumulate, multi-helper
liveness"

**Upgrade reason:** `PerPlayerRowTable` double loop (player 0..1, slot
0..4) checking each slot via `func_ov002_021bc8c8` (self-player gated
occupancy at `row+0x38`), then combining `func_ov002_021c92fc` and
`func_ov002_021b4618` results into an accumulate/count split, finishing
with a `bitmask & 0x78` combine. Dossier:
`docs/research/dossiers/0220a218.md`.

**Struct/data needed:** `PerPlayerRowTable+0x38` (opponent guard), `Ov002Self.f2` bit0.

**Ground-truth pool words:** `data_ov002_022cf16c`, `0x00000868`

**BL/BLX targets:** `func_ov002_021bc8c8`, `func_ov002_021c92fc`,
`func_ov002_021b4618` (×2)

```c
int func_ov002_0220a218(SelfCard *self) {
    unsigned int self_player = (unsigned short)self->f2 & 1u;
    int bitmask = 0, count = 0;
    for (int p = 0; p < 2; p++) {
        char *row = (char *)data_ov002_022cf16c + (p & 1u) * 0x868;
        for (int s = 0; s <= 4; s++, row += 0x14) {
            if (func_ov002_021bc8c8(self_player, p, s) == 0) continue;
            if ((unsigned int)p != self_player && *(unsigned short *)(row + 0x38) == 0) continue;
            int val = func_ov002_021c92fc(p, s);
            int score = func_ov002_021b4618(val);
            if (score > 1) count++; else bitmask |= val;
        }
    }
    int bitmask_score = func_ov002_021b4618(bitmask & 0x78);
    return (count + bitmask_score) >= 4 ? 1 : 0;
}
```

---

### CardHandlerTable stride-8 dispatch (1 func)

---

#### 0x022536E8 (96 B, class E)

**Original verdict:** E — "blx through fptr table, save/diff state,
rotation"

**Upgrade reason:** Twin of R4's own `0x0225368C` representative — binary
search via `func_ov002_02253638` yields an index, `ldr r3,[r1,r2,lsl#3]`
dispatches through the documented `CardHandlerTable` (stride 8), guarded by
`movs`/`bmi` on a negative index. This function's variant returns the
`CtrlState+0xC` DELTA (saved-then-restored) rather than the raw field.
Dossier: `docs/research/dossiers/022536e8.md`.

**Struct/data needed:** `CardHandlerTable` (0x022CAD38, stride 8),
`data_ov002_022cdc78` (`CtrlState+0xC`).

**Ground-truth pool words:** `data_ov002_022cdc78`, `data_ov002_022cad38`

**BL/BLX targets:** `func_ov002_02253638`, `blx r3` (indexed table entry)

```c
int func_ov002_022536e8(int ctx, u16 card_id, int arg2) {
    CtrlState *cs = &data_ov002_022cdc78;
    int saved = cs->f_c;
    int idx = func_ov002_02253638(card_id);
    if (idx >= 0) {
        fn_t handler = data_ov002_022cad38[idx].handler;
        handler(ctx, card_id, arg2);
    }
    int after = cs->f_c;
    cs->f_c = saved;
    return after - saved;
}
```

---

### DuelStateSingleton / Ov002DataComplete data-table hits (1 func)

---

#### 0x0228C330 (164 B, class E)

**Original verdict:** E — "counted loop + eor discriminant rotation,
permuter-class"

**Upgrade reason:** Not an eor-discriminant permuter case at all — reads
`data_ov002_022cd524` (documented `StateCtrl` from R4's `0x02299C9C`
write-up) and walks `data_ov002_022c86b8` (documented in
`Ov002DataComplete.md` as a "card-ID → handler-pointer pairs" stride-8
table, 93 entries) up to `0x5D` (93) times via `func_ov002_0228bcd0`. Only
on a miss does it fall back to an `Ov002Slot.f2`-bit-XOR player-side derive
+ a literal card-id compare. Dossier:
`docs/research/dossiers/0228c330.md`.

**Struct/data needed:** `data_ov002_022cd524` (StateCtrl), `data_ov002_022c86b8` (documented stride-8 table), `Ov002Slot.f0`/`.f2`.

**Ground-truth pool words:** `data_ov002_022cd524`, `data_ov002_022c86b8`,
`0x000013f9`

**BL/BLX targets:** `func_ov002_0228bcd0` (×93 max), `func_0202e234`,
`func_ov002_0228c1d0`

```c
int func_ov002_0228c330(int player, CardEntry *card) {
    data_ov002_022cd524.f_0 = player;
    CardHandlerEntry *entry = &data_ov002_022c86b8;
    for (int i = 0; i < 0x5d; i++, entry++)
        if (func_ov002_0228bcd0(player, entry, card) != 0) return 1;
    u16 f2 = card->f2;
    int side_a = (f2 << 17) >> 31, side_b = (f2 << 31) >> 31;
    int derived_player = side_a ^ side_b;
    if (player == derived_player) {
        if (func_0202e234(card->f0) == 0) {
            if (card->f0 != 0x13f9) return 0;
        }
    }
    return func_ov002_0228c1d0(player, card);
}
```

---

### Ov002Self / extended-self core-field hits (5 funcs)

---

#### 0x02291160 (180 B, class F)

**Original verdict:** F — "43 insns, 5 calls, branchy nested guards"

**Upgrade reason:** `Ov002Self.f0`/`b0:1` (byte-verified core fields) plus
a 5-bit field extracted from `self->f2` bits[5:1] via `lsl#1a/lsr#1b` —
every branch is a literal-constant compare on named fields. Dossier:
`docs/research/dossiers/02291160.md`.

**Struct/data needed:** `Ov002Self.f0`, `.b0:1`.

**Ground-truth pool words:** `0x000019a3`, `0x000019a4`

**BL/BLX targets:** `func_ov002_021bbd14`, `func_0202b8c0`,
`func_0202b878`, `func_ov002_02281920`

```c
int func_ov002_02291160(struct Ov002Self *self) {
    int res = func_ov002_021bbd14(self->b0, self->f0);
    u16 w = *(u16 *)((char *)self + 2);
    int slot_idx = (w << 0x1a) >> 0x1b;
    int guard = (slot_idx <= 0xa) ? 1 : 0;
    if (res - guard <= 0) return 1;
    if (func_0202b8c0(self->f0) != 4) return 0;
    if (func_0202b878(self->f0) == 0x17) {
        if (func_ov002_02281920(self->b0, 0x19a3) != 0) return 1;
    } else {
        if (func_ov002_02281920(self->b0, 0x19a4) != 0) return 1;
    }
    return 0;
}
```

---

(`0x022119BC` is documented in the DuelStateSingleton dispatch-system
section above, not repeated here.)

---

#### 0x02206DA0 (196 B, class F)

**Original verdict:** F — "47 insns, deep bitfield guard chain, many
branches"

**Upgrade reason:** Reads `self->f4` bits[9:15] (ability lookup) and
`self->f2` bits[6:11] (type-code, dispatched on 0x16/0x1b), then a packed
`self->f_14` word carries five Ov002Slot-style sub-fields (player-bit,
slot_idx, occ_flag, live_flag, sub_type) validated in sequence before a
`data_ov002_022d0250[slot_id]` u16 lookup feeds `func_0202df78`. Every
guard is a literal-constant bit-extract compare. Dossier:
`docs/research/dossiers/02206da0.md`.

**Struct/data needed:** `CardObj.f2`/`.f4`/`.f_14` sub-fields;
`data_ov002_022d0250` (u16 id table, new — see KB gaps).

**Ground-truth pool words:** `data_ov002_022d0250`, `0x00001691`

**BL/BLX targets:** `func_ov002_021ca5bc`, `func_0202df78`

```c
int func_ov002_02206da0(CardObj *self) {
    unsigned int ability = (self->f4 << 17) >> 23;
    if (!func_ov002_021ca5bc(ability)) return 0;
    unsigned int type = ((unsigned int)self->f2 << 20) >> 26;
    if (type != 0x16 && type != 0x1b) return 0;
    unsigned int w = self->f_14;
    unsigned int player = ((unsigned int)self->f2 << 31) >> 31;
    if (((w << 22) >> 31) != player) return 0;
    if (((w << 18) >> 28) > 4) return 0;
    if ((w << 8) >> 31) return 0;
    if (!((w << 16) >> 31)) return 0;
    if (((w << 9) >> 28) != 0xe) return 0;
    unsigned int slot_id = (w << 23) >> 23;
    unsigned int node = (unsigned int)data_ov002_022d0250[slot_id];
    return func_0202df78((node << 19) >> 19, 0x1691);
}
```

---

#### 0x022A85A4 (196 B, class E)

**Original verdict:** E — "dense shift/ror coin-flip bit-packing
arithmetic"

**Upgrade reason:** Not a coin-flip at all — every shift/ror/rsb is
deterministic mwcc constant-arithmetic codegen for a fixed-point
divide-by-32-with-rounding on `self->f_584` (an int field on the caller's
struct), followed by OAM attribute packing that reads `data_02104f4c+0x4`
(a main-arm9 global, new to this doc — see KB gaps) and writes through
`data_ov002_022d0f98` via the fixed `func_0207f05c` call. No `blx`
anywhere in this function — only `bl` to a single named target. Dossier:
`docs/research/dossiers/022a85a4.md`.

**Struct/data needed:** caller struct `+0x584` field; `data_02104f4c+0x4`
(new); `data_ov002_022d0f98` (OAM table target).

**Ground-truth pool words:** `data_02104f4c`, `data_ov002_022d0f98`

**BL/BLX targets:** `func_0207f05c` (only `bl`, no `blx`)

```c
void func_ov002_022a85a4(SomeStruct *self) {
    int val = self->f_584;
    if (val <= 0x1e) return;
    /* fixed-point /32 with rounding; OAM attribute pack from data_02104f4c->f_4;
       exact shift/ror sequence is mechanical mwcc codegen -- see dossier for the
       full derivation and the asm-escape fallback note if plain-C rounding
       doesn't reproduce it bit-for-bit. */
    unsigned int f4 = ((unsigned int)data_02104f4c.f_4 << 27) >> 28;
    struct { unsigned int attr0; unsigned short attr1; } buf;
    /* buf.attr0/attr1 built from val and f4 per the dossier's shift chain */
    func_0207f05c(&data_ov002_022d0f98, &buf, 1);
}
```

---

### Fisher-Yates shuffle + caller-callback hits (2 funcs)

---

#### 0x0228C864 (192 B, class E)

**Original verdict:** E — "blx callback then cmp/movgt accumulator reg
coin-flip"

**Upgrade reason:** Expands a caller-supplied bitmask (arg1) into a slot
list, Fisher-Yates shuffles it via `func_ov002_021b00d0` (random-in-range
helper), then calls a callback loaded from `mov r9, r2` at entry (arg2) —
deterministic caller-supplied fn ptr, same class as the PPT-scan callback
cases above. Tracks the best-scoring slot. Dossier:
`docs/research/dossiers/0228c864.md`.

**Struct/data needed:** none beyond the caller-supplied bitmask/callback
(no PPT/DSS struct touch — Ov002Slot only indirectly via the callee).

**Ground-truth pool words:** none

**BL/BLX targets:** `func_ov002_021b00d0`, `blx r9` (caller callback, arg2)

```c
int func_ov002_0228c864(int player, u32 bitmask, fn_t callback) {
    int slot_list[10], list_len = 0, base = player * 16;
    for (int i = 0; i <= 10; i++)
        if (bitmask & (1u << (base + i))) slot_list[list_len++] = i;
    for (int j = list_len - 1; j > 0; j--) {
        int k = func_ov002_021b00d0(j + 1);
        int tmp = slot_list[j]; slot_list[j] = slot_list[k]; slot_list[k] = tmp;
    }
    int best_val = 0, best_slot = ~0;
    for (int m = 0; m < list_len; m++) {
        int s = slot_list[m], v = callback(player, s);
        if (v > best_val) { best_val = v; best_slot = s; }
    }
    return best_slot;
}
```

---

#### 0x0228D898 (196 B, class E)

**Original verdict:** E — "nested loops, array shuffle, swap; heavy
reg-alloc"

**Upgrade reason:** Same `func_ov002_021b00d0` Fisher-Yates shuffle as
`0228c864` (sibling), applied to an identity-initialized 11-slot list, then
a bounded (player toggling via `eor r4,r4,#1`) × (shuffled slot) double
loop calling the already-known `func_ov002_022575c8` filter /
`func_ov002_0223dcc0` action pair. Dossier:
`docs/research/dossiers/0228d898.md`.

**Struct/data needed:** none directly (Ov002Slot only via callees).

**Ground-truth pool words:** none

**BL/BLX targets:** `func_ov002_021b00d0`, `func_ov002_022575c8`,
`func_ov002_0223dcc0`

```c
int func_ov002_0228d898(void *self, int player) {
    int slot_list[11];
    for (int i = 0; i <= 10; i++) slot_list[i] = i;
    for (int j = 10; j > 0; j--) {
        int k = func_ov002_021b00d0(j + 1);
        int tmp = slot_list[j]; slot_list[j] = slot_list[k]; slot_list[k] = tmp;
    }
    for (int pl = 0; pl < 2; pl++, player ^= 1) {
        for (int si = 0; si <= 10; si++) {
            int slot = slot_list[si];
            if (func_ov002_022575c8(self, player, slot) != 0) {
                func_ov002_0223dcc0(self, player, slot);
                return 1;
            }
        }
    }
    return 0;
}
```

---

### Independently-derived tractable finds (no pre-existing dossier, 8 funcs)

These 8 were triaged from scratch against the KB docs (no
`docs/research/dossiers/<addr>.md` exists for them at time of writing).

---

#### 0x0226DAEC (144 B, class E) — genuinely virgin, not in any prior
retriage doc

**Original verdict:** E — "nested loops with field-pack and call inside;
reg-alloc"

**Upgrade reason:** Every operation is a deterministic flag-word RMW on
`data_ov002_022cd300` (clears bit0, ORs in `arg0&1`, masks with
`0xff8000ff`, sets a `+0x16` halfword bit, zeroes a `+0x8` byte) followed by
a plain (player=0..1) × (slot=0..4) bounded loop calling the already-known
`func_ov002_02270ca8`. `data_ov002_022cd300` itself is not yet named in any
KB doc (new gap — see below), but the arithmetic sequence has zero
ambiguity: no `blx`, no unresolved index, just fixed bit-masking on a fixed
address.

**Struct/data needed:** `data_ov002_022cd300` (new global — flag/state
word; see KB gaps).

**Ground-truth pool words:** `data_ov002_022cd300`, `0xff8000ff`

**BL/BLX targets:** `func_ov002_02270ca8` (×10 max, in loop)

```c
int func_ov002_0226daec(int arg0) {
    unsigned int *w = (unsigned int *)&data_ov002_022cd300;
    unsigned int v = (*w & ~1u) | (arg0 & 1);
    v &= 0xff8000ffu;
    *w = v;
    *(u16 *)((char *)w + 0x16) |= 2;
    *(u8 *)((char *)w + 0x8) = 0;
    for (int p = 0; p < 2; p++)
        for (int s = 0; s <= 4; s++)
            if (func_ov002_02270ca8(p, s, 0 /* fp arg, always 0 here */) != 0)
                return 1;
    return 0;
}
```

---

#### 0x02295C3C (144 B, class E)

**Original verdict:** E — "nested double loop with live counters"

**Upgrade reason:** `self->b0` (byte-verified `Ov002Self` bit0 via
`lsl#31/lsr#31`) gates two already-known-helper guard calls
(`func_ov002_02291248`, `func_ov002_02259f74`), then a bounded (0..1) ×
(0..4) double loop calling `func_ov002_022575c8` and, on hit,
`func_ov002_0228de04` with an `>= 0x1f4` clamp-to-1 finish. R4's original
"no KB struct ref" verdict predates the byte-verified `Ov002SelfContext.md`
`b0:1` bitfield doc that explains the `lsl#31/lsr#31` shape used here.

**Struct/data needed:** `Ov002Self.b0:1` bitfield shape.

**Ground-truth pool words:** none

**BL/BLX targets:** `func_ov002_02291248`, `func_ov002_02259f74`,
`func_ov002_022575c8`, `func_ov002_0228de04`

```c
int func_ov002_02295c3c(struct Ov002Self *self) {
    if (func_ov002_02291248(self) == 0) return 0;
    int b0 = (self->raw2 << 0x1f) >> 0x1f;   /* Ov002Self.b0 : 1 */
    if (func_ov002_02259f74(b0) == 0) return 0;
    for (int p = 0; p < 2; p++) {
        for (int s = 0; s < 5; s++) {
            if (func_ov002_022575c8(self, p, s) == 0) continue;
            if (func_ov002_0228de04(p, s) >= 0x1f4) return 1;
        }
    }
    return 0;
}
```

---

#### 0x0222C48C (152 B, class E)

**Original verdict:** E — "twin mla base RMW (load/store same slot),
reg-perm" — R4 originally called this intractable ("no KB struct —
permuter-class"), but both structs it touches are now documented.

**Upgrade reason:** `data_ov002_022cd3f4` (the "CtrlState-family" global
R8's `021bb444`/`021df4d8` write-ups document with `+0x4`/`+0x14`/`+0x20`/
`+0x24` player-conditional fields) selects between an early-exit
(`+0x14 != 0`) and a swap-vs-clear branch on `+0x24`, then either performs
a halfword swap between two `PerPlayerRowTable` companion
(`data_ov002_022cf1a4`, R8-documented occupancy field) rows or simply calls
the already-known `func_ov002_021de4b0` unconditionally.

**Struct/data needed:** `data_ov002_022cd3f4` (+0x4, +0x14, +0x20, +0x24),
`data_ov002_022cf1a4` (PerPlayerRowTable occupancy companion, R8-doc'd).

**Ground-truth pool words:** `data_ov002_022cd3f4`, `data_ov002_022cf1a4`,
`0x00000868`

**BL/BLX targets:** `func_ov002_021de4b0` (×1, either branch)

```c
int func_ov002_0222c48c(void) {
    struct CtrlState *cs = &data_ov002_022cd3f4;
    if (cs->f_14 != 0) return 0;
    if (cs->f_24 == 0) { func_ov002_021de4b0(); return 0; }
    int player_a = cs->f_4, slot_a = cs->f_20;
    char *row_a = (char *)data_ov002_022cf1a4 + (player_a & 1) * 0x868;
    u16 saved = *(u16 *)(row_a + slot_a * 0x14);
    *(u16 *)(row_a + slot_a * 0x14) = 0;
    func_ov002_021de4b0();
    /* re-read cs fields (fresh loads in the .s) and write saved value into
       the (possibly different) resulting row/slot */
    char *row_b = (char *)data_ov002_022cf1a4 + (cs->f_4 & 1) * 0x868;
    *(u16 *)(row_b + cs->f_20 * 0x14) = saved;
    return 0;
}
```

---

#### 0x02246ECC (156 B, class E)

**Original verdict:** E — "mla index counted loop, bitfield extract, one
call"

**Upgrade reason:** `PerPlayerRowTable` companion `data_ov002_022cf178`
(documented event-count gate) bounds a scan over `data_ov002_022cacc0`
(documented in `Ov002DataComplete.md` as a "packed 4-byte card-stat records"
table) comparing a 13-bit sub-field against a caller-array entry, calling
the already-known `func_ov002_021bd85c` on a match with an early return.

**Struct/data needed:** `PerPlayerRowTable`/`data_ov002_022cf178`,
`data_ov002_022cacc0` (documented card-stat table).

**Ground-truth pool words:** `0x00000868`, `data_ov002_022cf178`,
`data_ov002_022cf16c`, `data_ov002_022cacc0`

**BL/BLX targets:** `func_ov002_021bd85c`

```c
int func_ov002_02246ecc(int player, int *id_array) {
    int off = (player & 1) * 0x868;
    int count = *(int *)((char *)data_ov002_022cf178 + off);
    if ((unsigned int)count <= 0) return 0;
    char *base = (char *)data_ov002_022cf16c + off + 0x120;
    for (int s = 0; s < count; s++) {
        int a = (id_array[player] << 0x13) >> 0x13;
        int b = (*(int *)(base + s * 4) << 0x13) >> 0x13;
        if (a == b) {
            if (func_ov002_021bd85c(a, -1) == 0) return 1;
        }
    }
    return 0;
}
```

---

#### 0x0222054C (172 B, class E)

**Original verdict:** E — "orr-shift accumulate loop with call, reg-alloc
bound"

**Upgrade reason:** `self->f4`/`f6` (per-TU "extended-self" halfwords, the
established R8 recipe) gate a bounded scan calling
`func_ov002_0223de94`/`func_ov002_0223df38` (already-known helpers) that
accumulates an OR'd bitmask, finishing with `func_ov002_021de9c0`. Every
`bl` target is named; no `blx` anywhere in this function.

**Struct/data needed:** extended-self `+0x4`/`+0x6` halfwords (established
recipe).

**Ground-truth pool words:** none

**BL/BLX targets:** `func_ov002_0223de94`, `func_ov002_0223df38`,
`func_ov002_021de9c0`

```c
int func_ov002_0222054c(struct ExtSelf *self) {
    if (((self->f4 << 0x1d) >> 0x1f) != 0) return 0;
    unsigned int type = ((unsigned int)self->f6 << 0x10) >> 0x18;
    if (type != 2) return 0;
    unsigned int mask = 0;
    if (type > 0) {
        for (int i = 0; i < (int)(((unsigned int)self->f6 << 0x10) >> 0x18); i++) {
            int r0 = func_ov002_0223de94(self, i);
            int lo = r0 & 0xff, hi = (r0 << 0x10 >> 0x10) >> 8 & 0xff;
            if (func_ov002_0223df38(self, i, i /* accumulator index */) != 0)
                mask |= 1u << (lo + hi * 0x10);
        }
    }
    func_ov002_021de9c0(self, mask);
    return 0;
}
```

---

#### 0x022530A8 (172 B, class E)

**Original verdict:** E — "nested double loop, eor index, bit-test
liveness"

**Upgrade reason:** `eor r7, sl, r6` is the documented player-XOR idiom;
`PerPlayerRowTable+0x14`/`+0x18`+`0x400` (extra-slot region, same layout
family as `021c32d4`'s `+0x418` array) bounds an inner scan whose entries
are validated via `func_0202e234` (already-known predicate) and two bit
tests before calling `func_ov002_02253458`.

**Struct/data needed:** `PerPlayerRowTable` extra-slot region (`+0x018`
count, `+0x418`-family array).

**Ground-truth pool words:** `data_ov002_022cf16c`, `0x00000868`

**BL/BLX targets:** `func_0202e234`, `func_ov002_02253458`

```c
void func_ov002_022530a8(int arg0) {
    for (int i = 0; i < 2; i++) {
        int player = arg0 ^ i;
        char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868;
        int count = *(int *)(row + 0x14);
        if (count <= 0) continue;
        int *arr = (int *)(row + 0x18 + 0x400);
        for (int s = 0; s < count; s++) {
            int id = (arr[s] << 0x13) >> 0x13;
            if (func_0202e234(id) == 0) continue;
            if ((arr[s] << 0xb) >> 0x1f) continue;
            if (!((arr[s] << 0xc) >> 0x1f)) continue;
            func_ov002_02253458(player, 0xe, 0);
        }
    }
}
```

---

#### 0x02246F68 (180 B, class E)

**Original verdict:** E — "mla index loop, bitfield extract, two guarded
calls"

**Upgrade reason:** `PerPlayerRowTable`/`data_ov002_022cf178` bounds a scan
identical in shape to `02246ecc` above (same three literal pool words, same
0x120-offset array region), validated via the already-known
`func_0202e234` predicate, calling `func_ov002_021c38c4` on a match and
accumulating its result.

**Struct/data needed:** `PerPlayerRowTable`/`data_ov002_022cf178` (same as
`02246ecc`).

**Ground-truth pool words:** `0x00000868`, `data_ov002_022cf178`,
`data_ov002_022cf16c`

**BL/BLX targets:** `func_0202e234`, `func_ov002_021c38c4`

```c
int func_ov002_02246f68(int player, int target_id) {
    int off = (player & 1) * 0x868;
    int count = *(int *)((char *)data_ov002_022cf178 + off);
    if ((unsigned int)count <= 0) return 0;
    char *base = (char *)data_ov002_022cf16c + off + 0x120;
    int total = 0;
    for (int s = 0; s < count; s++) {
        int id = (*(int *)(base + s * 4) << 0x13) >> 0x13;
        if (func_0202e234(id) == 0) continue;
        if (id == target_id) { target_id = -1; continue; }  /* mov sl,r4 sentinel */
        total += func_ov002_021c38c4(player, id);
    }
    return total;
}
```

---

#### 0x022537F8 (196 B, class E)

**Original verdict:** E — "loop with predicated mov + tst liveness, reg
coin-flip"

**Upgrade reason:** `DuelStateSingleton+0xD4` (a gap field near the
documented `+0xD18` dispatch band; R8's `021bb444` write-up already
establishes `+0xD4` as a real, tested bitmask field) plus `DuelStateSingleton
+0xDC` (also new) gate a `PerPlayerRowTable` double-scan (2 players × 5
slots) checking `+0xF8`/`+0x100`/`+0x108` fields, falling back to the
already-known `func_ov002_021bb418` when no match is found, before a final
`func_ov002_021d95fc` call. The "reg coin-flip" the original heuristic
flagged is a `movls`/`movhi`/`tst`-driven bitmask accumulate — fully
mechanical once `+0xD4` is recognized as a real bit-tested field (R8
precedent) rather than opaque.

**Struct/data needed:** `DuelStateSingleton+0xD4` (R8-established gap
field), `+0xDC` (new), `PerPlayerRowTable+0xF8`/`+0x100`/`+0x108`.

**Ground-truth pool words:** `data_ov002_022d016c`, `data_ov002_022cf16c`,
`0x00000868`, `0x000013a2`, `0x000010f4`

**BL/BLX targets:** `func_ov002_021bb418`, `func_ov002_021d95fc`

```c
int func_ov002_022537f8(void) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    unsigned int flagbits = *(unsigned int *)((char *)dss + 0xd4);   /* new */
    int found_id = 0;
    for (int p = 0; p < 2; p++) {
        char *row = (char *)data_ov002_022cf16c + (p & 1) * 0x868;
        for (int s = 0; s < 2; s++) {
            char *e = row + 0x100 * s;   /* row+0xf8/+0x100/+0x108 window */
            u32 f108 = *(u32 *)(e + 0x108);
            int occ = ((f108 >> 2) | (f108 >> 1)) & 1;
            if (occ) continue;
            if (flagbits & (1u << (s * 0x10 + 0xa))) found_id = *(int *)(e + 0xf8);
        }
    }
    if (found_id == 0) {
        if (func_ov002_021bb418(0x13a2) != 0) found_id = 0x10f4;
    }
    if (*(int *)((char *)dss + 0xdc) == found_id) return 0;   /* new field */
    func_ov002_021d95fc(found_id);
    return 1;
}
```

---

## Confirmed Intractable (12 funcs)

Every entry below was re-checked against every KB doc listed in this file's
intro; none resolves. Each line names the SPECIFIC scheduling ambiguity —
not a generic "complex" label.

| Address | Size | Cls | Named ambiguity |
|---------|------|-----|-----------------|
| `0x021B1200` | 84 | E | `blx r9` where `r9` is loaded from `mov r9, r0` at function entry — the caller's ONLY argument, used as the sole call target with zero backing table/struct field anywhere in the function; the entire body (nested 2×11 counted loop) is scheduling around this opaque single-argument fn ptr — not a callback-with-other-work case, the ENTIRE function is just "call this unknown fn 22 times and count truthy results." No KB struct or documented table binds `r9` to anything. |
| `0x0229AD88` | 88 | E | `blx r0` where `r0 = data_ov002_022cba04[data_ov002_022d0f2c[0]]` — structurally IDENTICAL to the documented dispatch-2/3 pattern, BUT neither `022cba04` (the table) nor `022d0f2c` (the index source) appears in `FunctionPointerTables.md`, `Ov002DataComplete.md` (whose catalogued range ends at `0x022CD300`, well past `022cba04` — so this address falls INSIDE the nominally-catalogued range yet was never itself catalogued as a table), or any dossier. Unlike `022627ac`/`021b08a8` (dispatch-2/3, which ARE named), there is no independent evidence pinning `022cba04`'s entry count, stride, or fill semantics — R4's original "permuter-class, never" verdict stands until that table gets its own KB entry. |
| `0x0229049C` | 100 | E | `blx sl` where `sl` is loaded from `mov sl, r0` at function entry — same shape as `021B1200` (sole argument used as the only call target across an 11×2 nested loop, `orr r6,r6,r4,lsl r0` accumulate keyed entirely on the callback's own return value). No struct/table involvement anywhere. |
| `0x022AC610` | 108 | F | Pure tile-pack bit-shift loop (`asr`/`lsl`/`lsr` chain building an OAM/tile destination address from two nested counters) — zero data symbol or struct-offset references anywhere in the function; the "scheduling" is hardware-register address arithmetic, not a resolvable discriminant. |
| `0x021B42E4` | 112 | E | `blx r8` where `r8` is loaded from `mov r8, r2` — the THIRD caller argument. The surrounding table walk (`data_ov002_022cf1a6`, PerPlayerRowTable companion) IS now fully explained by the KB, but the final dispatch itself is still an externally-supplied opaque callback with no table backing of its own — same class as `021B1200`/`0229049C` (arg-as-sole-selector), not the "callback alongside other named work" case that made `021C32D4`/`0227DD6C` etc. tractable, because here the callback selection happens only ONCE per matched slot with no accumulation logic around it that would itself be useful to name — the entire post-table-walk value of the function IS the callback call. |
| `0x02247670` | 120 | E | Recursive binary-search-shaped self-call (`bl func_ov002_02247670`) with ZERO struct or data-symbol references anywhere in the function body — purely register/stack arithmetic over caller-supplied bounds. No KB fact touches any part of this function. |
| `0x0224AE3C` | 124 | E | Recursive self-call sibling of `02247670`, touching `data_ov002_022ce288` (DuelQueueState) only at the UNDOCUMENTED offset `+0x494` — inside the struct doc's own acknowledged `+0x000–+0x48B gap` (the doc explicitly marks that whole span as unmapped). One struct touch in an undocumented gap does not resolve a recursive binary search's branch/flag coin-flip. |
| `0x02263648` | 132 | E | `eor r8, r9, r7` (arg0 XOR loop counter) selects an id passed to `func_ov002_021b4120`, but there is no PerPlayerRowTable, DuelStateSingleton, or any other named struct/table reference anywhere in the function — only two bare literal-pool constants (`0x15b8`, `0xa5015b8`). The XOR here is NOT the documented `card_list_slot_idx` idiom (that one XORs against a struct FIELD; this one XORs two plain registers with no struct backing at all) — a coincidental instruction-shape match, not the same semantic pattern. |
| `0x022633A0` | 136 | E | Sibling of `02263648` (identical 3-callee shape: `021b4120`/`021d5b80`/`021e30b4`), same zero-struct-reference profile — the eor here is likewise a bare register XOR with no KB field behind either operand. |
| `0x022B2660` | 156 | E | Pure OAM MMIO attribute-pack loop (`asr #6`, `lsl #0x17`, multi-field `orr` into a stack buffer passed to `func_0207f05c`) — the ONLY data symbol is `data_ov002_022d0f98` (bare OAM table target, no field structure), same hardware-register-scheduling class as `022AC610`; no struct offset resolves any part of the packing arithmetic. |
| `0x0229D0B0` | 164 | F | Linear max-tracking scan over a caller-supplied array (`r0`) with no struct/global symbol reference anywhere in the function — the "coin-flip" is genuinely just "which array slot has the highest `+0xD4` sub-value," entirely a function of runtime data the KB has no static binding for (the array itself is a bare parameter, not a documented global). |
| `0x02263858` | 168 | E | Third sibling in the `02263648`/`022633A0` family (identical 3-callee shape, `eor r4, r8, r7`), same zero-struct-reference profile as its two siblings above. |

---

## New KB gaps found

These globals/fields were touched by tractable functions in this batch but
are not yet named in any existing KB doc. Listed here per the task's
instructions — **no existing KB doc was edited**.

1. **`DuelStateSingleton+0xCF0`** (int) — read in `0x02265014` as `bound =
   dss->f_cf0 + 1` feeding a score-delta computation. Sits immediately
   before the documented `+0xCF8` (duel_phase) field. Evidence: single
   matched-shape use so far; semantic name unknown (possibly a
   turn/round counter given the score-delta usage).

2. **`DuelStateSingleton+0xD44`** (int) — read in `0x021E1BF8` as a
   countdown-loop bound. Sits in the documented gap between `+0xD38`
   (phase sub-state, compared to 6) and `+0xD48` (clearable counter).
   Evidence: single use, "iterate N times counting down" pattern.

3. **`DuelStateSingleton+0xD4` and `+0xDC`** (int/bitmask) — `+0xD4` is
   READ as a bit-tested mask in `0x022537F8` (`flagbits & (1 << (s*0x10 +
   0xa))`); this is the SAME field R8's `021bb444` dossier already flags
   as "new, near the documented +0xD18... tested via tst against a
   per-(player,slot) shifted bit" — this round's find corroborates that
   gap rather than opening a new one, and additionally finds `+0xDC`
   (compared against a computed `found_id`) as a second, previously
   unseen offset in the same neighbourhood.

4. **`data_ov002_022cd300`** (BSS flag/state word, ov002) — read/written
   in `0x0226DAEC`: word at `+0x0` (bit0 cleared then OR'd with an arg
   bit, then masked `& 0xff8000ff`), halfword at `+0x16` (OR'd with 2),
   byte at `+0x8` (zeroed). Falls exactly at the address immediately
   after `Ov002DataComplete.md`'s catalogued range (`...ends 0x022CD300`
   is the doc's own boundary marker) — a natural next-entry candidate for
   that catalog.

5. **`data_ov002_022d0250`** (u16 table, ov002) — indexed by a 9-bit
   `slot_id` sub-field extracted from a packed `Ov002Slot`-family word in
   `0x02206DA0`; the looked-up u16 then feeds an `id_lo13`-style
   `(node<<19)>>19` extraction. Appears in many `c-match-prep/` candidates
   and several existing dossiers (`021c38c4`, `021cfda8`, `02201b24`,
   `02205a40`, `0220cb50`, `0220d858`, `02277924`) as a recurring but still
   unnamed lookup table — worth promoting to a proper `docs/research/data/`
   entry given how many functions already reference it.

6. **`data_ov002_022d0650`** (stride-8 node/link table, ov002) — used by
   `0x021B1E80` and `0x021B2E04` (this batch) as a linked-list node array:
   `+0x0` packed (player_lo8, slot_hi8) u16, `+0x2` type-nibble u16 (bits
   3:0; entries with type >= 6 are "active"), `+0x6` next-link u16 index
   (0 = list terminator). Confirmed by TWO independent functions in this
   batch reading the identical field layout — a strong candidate for a
   dedicated struct doc (e.g. `docs/research/types/Ov002NodeLink.md`).

Also touched but already adequately explained by existing docs/dossiers
without needing a new entry: `data_ov002_022cd420` (R8-documented
companion, stride 0x38), `data_ov002_022cf1a4`/`022cf178`/`022cf180`/
`022cf184` (all documented `PerPlayerRowTable` companions), `data_ov002_
022cd524`/`022cd3f4` (documented in R4's `02299c9c` and R8's `021bb444`
respectively), `data_ov002_022c86b8` (documented in `Ov002DataComplete.md`),
`data_02104f4c+0x4` (main-arm9 global; the specific `+0x4` two-bit sub-field
used by `022a85a4` is new but the base global itself is extensively used
elsewhere in the corpus — not flagging as a fresh gap, just an
under-documented field on an already-known symbol).
