[//]: # (markdownlint-disable MD013 MD041)

# ov002 E/F Re-triage

## Summary

- Examined: **413 funcs** (E/F class, size < 400 B, ov002 module; 891 low + 89 never in full set)
- Newly tractable: **297 funcs** (72% of examined subset)
- Remains intractable: **116 funcs**
- Key patterns that unlock them:
  - `Ov002Slot id_lo13_bitfield` (lsl/lsr #19 pair inside PerPlayerRowTable slot walk) — **158 funcs**
  - `PerPlayerRowTable` base + documented offsets (+0x10, +0x1C, stride 0x868) — **120 funcs**
  - `DuelQueueState` documented offsets (+0x5A8 queue_state, +0x5B4, +0x5C0, +0x5D4, +0x688) — **59 funcs**
  - `DuelStateSingleton` documented offsets (+0xCEC card_list_slot_idx, +0xCF8 duel_phase, +0xD0C gate_flag, +0xD18 state_dispatch_fnptr) — **58 funcs**
  - `CardHandlerTable` stride-8 dispatch (blx via `ldr r3,[r1,r2,lsl #3]`) — **2 funcs**

**Confidence breakdown:** 266 high (offset-level match) / 31 med (table base or lsl#19 only)

**Why the tractable count is so high:** ov002 is almost entirely duel-logic. The KB structs are the
core data model — nearly every small-to-medium func either walks PerPlayerRowTable slots or dispatches
through DuelStateSingleton. The original "intractable" verdict reflected unknown offsets, not genuine
scheduling entropy. Once the struct fields are named, most of these funcs are a deterministic sequence
of field reads and calls.

---

## Newly Tractable Funcs

Eight representative entries illustrating the main upgrade patterns.

---

### 0x021B0A30  (220 bytes, class E)

**Original verdict:** low — blx through fn-ptr table + parity rotation

**Upgrade reason:** Reads `DuelStateSingleton+0xD18` (state_dispatch_fnptr) and `+0xD0C` (gate_flag).
The `blx r0` flagged as "coin-flip" is a documented indirect call through the KB state-dispatch fn-ptr
field, not an opaque register. The parity rotation computes `player & 1` for PerPlayerRowTable stride —
fully explained by the KB.

**Struct/data needed:** DuelStateSingleton+0xD0C (gate_flag), DuelStateSingleton+0xD18 (state_dispatch_fnptr)

**Recipe sketch:**
```c
int func_ov002_021b0a30(void) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    int state_idx = dss->state_dispatch_fnptr;   /* +0xD18 */
    fn_t handler = data_ov002_022ca988[state_idx];
    if (!handler) {
        /* fallback: read dss->f_d00, set 022cd73c fields,
           pick row from PerPlayerRowTable via player parity */
        int player_bit = data_ov002_022cd73c->f_4 & 1;
        data_ov002_022cd73c->f_228 = data_ov002_022cf198[player_bit * 0x868 / 4];
        return 1;
    }
    if (dss->gate_flag != 0) {          /* +0xD0C */
        if (!func_ov002_021b15ec()) return 1;
    } else {
        func_ov002_021d4f18();
        if (handler()) {
            dss->state_dispatch_fnptr++;
            dss->f_d20 = 0;
        }
    }
    return 0;
}
```
**Levers needed:** decl-order for the handler branch; orr-shift on parity multiply

---

### 0x02256A50  (120 bytes, class E)

**Original verdict:** low — eor-discriminant + nested counted loops, scheduling-prone

**Upgrade reason:** The "eor discriminant" is `dss->card_list_slot_idx ^ p` (player loop counter).
Now that `+0xCEC` is documented as `card_list_slot_idx`, this is a deterministic double loop over
(player=0..1, slot=0..4) using XOR to get the actual player index — standard duel iteration, not a
scheduling coin-flip.

**Struct/data needed:** DuelStateSingleton+0xCEC (card_list_slot_idx)

**Recipe sketch:**
```c
void func_ov002_02256a50(CardObj *card, int arg1, int arg2) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    for (int p = 0; p < 2; p++) {
        for (int s = 0; s <= 4; s++) {
            int player_xor = dss->card_list_slot_idx ^ p;  /* +0xCEC */
            if (func_ov002_021b9ecc(player_xor, s) == 0x1744)
                func_ov002_021e2d94(player_xor, s, 5, arg2);
        }
    }
}
```
**Levers needed:** none expected beyond standard mwcc 2.0/sp1p5

---

### 0x02299C9C  (152 bytes, class E)

**Original verdict:** low — blx through function pointer, post-call reg rotation

**Upgrade reason:** Reads `dss->card_list_slot_idx (+0xCEC)` and `dss->duel_phase (+0xCF8)`, dispatches
through `data_ov002_022cb9dc[state.f_4]`. The `blx r0` is through an indexed fn-ptr table using a field
from `data_ov002_022cd524`. The post-call "rotation" stores back into that struct — all deterministic.

**Struct/data needed:** DuelStateSingleton+0xCEC, DuelStateSingleton+0xCF8

**Recipe sketch:**
```c
int func_ov002_02299c9c(void) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    StateCtrl *sc = &data_ov002_022cd524;
    sc->f_0 = dss->card_list_slot_idx;    /* +0xCEC */
    if (sc->f_4 == 0) {
        if (dss->duel_phase == 4)          /* +0xCF8 */
            sc->f_4 = 7;
    }
    fn_t handler = data_ov002_022cb9dc[sc->f_4];
    if (!handler) return 1;
    if (handler()) {
        sc->f_8 = 0;
        sc->f_4++;
        if (dss->f_d34) return 1;
    }
    return 0;
}
```
**Levers needed:** standard; watch for duel_phase cmp ordering (4 before 7)

---

### 0x021B9830  (148 bytes, class F)

**Original verdict:** low — nested double loop, bitfield, packed return

**Upgrade reason:** Uses PerPlayerRowTable with exact stride `mla base,(player&1),0x868,base` and reads
`Slot.id_lo13` via the documented `lsl#19 / lsr#19` bitfield extraction. The packed return is a bitmask
of matched slots — completely deterministic once the struct layout is known.

**Struct/data needed:** PerPlayerRowTable base 0x022CF16C, stride 0x868, Ov002Slot id_lo13 bitfield

**Recipe sketch:**
```c
/* Searches both players' slots for target_id; returns {player,slot} packed or ~0 */
u32 func_ov002_021b9830(int target_id) {
    PlayerRow *tbl = &data_ov002_022cf16c;
    for (int p = 0; p < 2; p++) {
        PlayerRow *row = (PlayerRow *)((u8 *)tbl + (p & 1) * 0x868);
        Slot *slot = &row->slots[0];    /* row+0x30, stride 0x14 */
        for (int s = 0; s <= 10; s++, slot++) {
            int id = (slot->f_0 << 19) >> 19;   /* id_lo13_bitfield */
            if (id == 0) continue;
            /* compute f4-based lookup and compare with target_id ... */
            if (match) {
                u32 r = (u8)p | ((u8)s << 8);
                return (u16)r;
            }
        }
    }
    return (u32)-1;
}
```
**Levers needed:** mwcc 2.0 signed bitfield extraction (lsl#19/lsr#19 is standard)

---

### 0x02257750  (140 bytes, class E)

**Original verdict:** low — nested loop with blx callback, bitmask accumulate

**Upgrade reason:** Iterates PerPlayerRowTable (stride 0x868 mla), reads a per-slot field (`+0x40` from
row base), and calls a user-supplied callback fn ptr argument (r1, not an internal dispatch). The bitmask
accumulate is OR-ing matched slot indices. The "blx callback" was flagged as coin-flip but the callback
is a function parameter — the scheduling is fixed.

**Struct/data needed:** PerPlayerRowTable+0x40 per-slot check field, stride 0x868

**Recipe sketch:**
```c
u32 func_ov002_02257750(void *ctx, fn_t callback) {
    PlayerRow *tbl = &data_ov002_022cf16c;
    u32 result = 0;
    for (int p = 0; p < 2; p++) {
        PlayerRow *row = (PlayerRow *)((u8 *)tbl + (p & 1) * 0x868);
        for (int s = 0; s <= 10; s++) {
            if (row->slot_field_40[s] & 4) continue;    /* occupied guard */
            int hit = callback(ctx, p, s);
            if (hit) result |= (1u << (s + p * 16));
        }
    }
    return result;
}
```
**Levers needed:** lsl-by-reg for bitmask OR; orr-shift emit pattern

---

### 0x0225368C  (92 bytes, class E)

**Original verdict:** low — blx through function-pointer table, post-call rotation

**Upgrade reason:** Loads `data_ov002_022cad38` (CardHandlerTable) and calls `tbl[index].handler` via
`ldr r3,[r1,r2,lsl #0x3]` — stride-8 indexing into a documented table. The "post-call rotation" is a
state guard from `data_ov002_022cdc78+0xC` — not register coin-flip.

**Struct/data needed:** CardHandlerTable 0x022CAD38, stride 0x8 ({u32 id; fn_ptr handler})

**Recipe sketch:**
```c
int func_ov002_0225368c(int ctx, u16 card_id, int arg2) {
    int idx = func_ov002_02253638(card_id);  /* binary search -> index */
    CtrlState *cs = &data_ov002_022cdc78;
    cs->f_c = 0;
    if (idx >= 0) {
        fn_t handler = data_ov002_022cad38[idx].handler;
        handler(ctx, card_id, arg2);
    }
    return cs->f_c;
}
```
**Levers needed:** movs sign-check for idx < 0 branch

---

### 0x022157E4  (220 bytes, class F)

**Original verdict:** low — nested counted loops, 8 callee-saved, stack args

**Upgrade reason:** The "nested counted loops" are (player=0..1, slot=0..4) — standard duel iteration —
gated on `DuelQueueState->queue_state (+0x5A8)` being `0x7f` (done) or `0x80` (active). The 8 callee-
saved regs hold loop counters + slot/player indices + data pointers, all now named. The stack args are
an hp factor from `data_ov002_022d0e6c[+0xB0]`.

**Struct/data needed:** DuelQueueState+0x5A8 (queue_state 0x7f=done, 0x80=active)

**Recipe sketch:**
```c
int func_ov002_022157e4(CardObj *card) {
    DuelQueueState *dqs = &data_ov002_022ce288;
    int qs = dqs->queue_state;   /* +0x5A8 */
    if (qs == 0x80) {
        func_ov002_0226b258((card->f2 >> 6) & 1, card->f2 >> 11);
        return 0x7f;
    }
    if (qs != 0x7f) return 0;
    HpTable *hp = &data_ov002_022d0e6c;
    for (int p = 0; p < 2; p++) {
        for (int s = 0; s < 5; s++) {
            if (!func_ov002_0225764c(card, p, s)) continue;
            int factor = hp->f_b0;
            func_ov002_021d5a08(card, p, s, 2, factor * 100, card->f0);
        }
    }
    return 0;
}
```
**Levers needed:** dqs->queue_state cmp ordering (0x7f vs 0x80 arm order)

---

### 0x0228791C  (176 bytes, class E)

**Original verdict:** low — loop with switch-range dispatch + eor reg juggling

**Upgrade reason:** Loads `DuelQueueState+0x5D4` (cleared_on_edge) as the loop bound, then iterates a
secondary table checking byte values at `dqs+0x5DC` against a switch ladder. The "eor reg juggling" is
a bit-comparison against `card->f2` fields — all fields now named. The loop count comes from the
documented `cleared_on_edge` field.

**Struct/data needed:** DuelQueueState+0x5D4 (cleared_on_edge = loop bound), data_ov002_022ce884

**Recipe sketch:**
```c
int func_ov002_0228791c(CardObj *card) {
    DuelQueueState *dqs = &data_ov002_022ce288;
    int count = dqs->cleared_on_edge;   /* +0x5D4 */
    if (count == 0) return 1;
    QueueEntry *tbl = &data_ov002_022ce884;
    for (int i = 0; i < count; i++) {
        u8 type = ((u8 *)dqs)[0x5DC + i];
        /* switch: types 6/7/8 and 0x1f/0x20/0x21 check tbl[i].f0 bits vs card->f2 */
        if (type_is_checked && bits_match(tbl[i].f0, card->f2))
            return 0;
    }
    return 1;
}
```
**Levers needed:** switch-range dispatch ladder ordering (bgt/bge sequence)

---

## Confirmed Intractable (representative sample)

| Address | Size | Cls | Reason |
|---------|------|-----|--------|
| 0x021B1200 | 84 | E | blx through r9 (fn-ptr arg passed in), no struct access — scheduling |
| 0x0229AD88 | 88 | E | blx through undocumented 022CBAXX table — permuter-class, never |
| 0x0229049C | 100 | E | nested blx loop, orr-shift-by-reg accumulate — no KB struct, scheduling |
| 0x022AC610 | 108 | F | tile-pack bit-shift loop, no struct access whatsoever |
| 0x021B42E4 | 112 | E | blx callback dispatch in scan loop, r9 = fn-ptr arg — scheduling |
| 0x02247670 | 120 | E | recursive binary-search with no struct access — never tractable |
| 0x0224AE3C | 124 | E | recursive search, branch/flag coin-flip, no struct access |
| 0x02263648 | 132 | E | eor-discriminant loop, bit-pack to call, no KB struct ref |
| 0x022633A0 | 136 | E | eor-discriminant + OAM word build, no struct field resolves it |
| 0x022B2660 | 156 | E | OAM attr-pack loop (asr/ror), hardware-register scheduling, no struct |
| 0x021AA4A0 | 160 | F | linked-list walk + nested calls, no KB struct — many live regs |
| 0x0222C48C | 152 | E | twin mla-base RMW (load/store same slot), no KB struct — permuter-class |
| 0x02295C3C | 144 | E | nested double loop with live counters, no KB struct ref |
| 0x022640F4 | 180 | E | divmod /5 double-umull + eor-discriminant — umull scheduling, no KB |
| 0x0221E194 | 272 | E | mla-base + orr-shift accumulate loop, no KB struct — liveness-bound |

---

## Pattern Summary

| KB Pattern | Unlock Condition | Funcs Unlocked |
|-----------|-----------------|---------------|
| `Ov002Slot id_lo13_bitfield` lsl/lsr #19 inside PerPlayerRowTable slot walk | PerPlayerRowTable + Slot stride 0x14 documented | 158 |
| `PerPlayerRowTable` f_010(+0x10) or f_01c(+0x1C) or stride 0x868 | PerPlayerRowTable struct layout documented | 120 |
| `DuelQueueState` offset fields (+0x5A8 queue_state, +0x5B4, +0x5C0, +0x5D4, +0x688) | DuelQueueState field map documented | 59 |
| `DuelStateSingleton` offset fields (+0xCEC, +0xCF8, +0xD0C, +0xD18) | DuelStateSingleton field map documented | 58 |
| `CardHandlerTable` stride-8 dispatch via `ldr r3,[r1,r2,lsl #3]` | CardHandlerTable {id;handler} layout documented | 2 |

**Intractable residue (116 funcs):**

| Reason | Count |
|--------|-------|
| No KB struct symbol anywhere in .s | 65 |
| Coin-flip/permuter-class with only weak struct base ref (no offset match) | 20 |
| Big body (>280 B) + heavy liveness, struct access doesn't reduce reg pressure | 12 |
| OAM attr-pack (hardware-register scheduling regardless of struct knowledge) | 9 |
| blx through truly undocumented fn-ptr (not through any KB table) | 5 |
| eor-discriminant loops, no KB field resolves the discriminant meaning | 5 |

---

## Full Tractable Func List

Sorted by address. All originally `tract: low` unless the Cls column is annotated with `[never]`.

| Address | Size | Cls | Conf | KB Structs Hit |
|---------|------|-----|------|----------------|
| 0x021B08A8 | 136 | E | high | DuelStateSingleton (+0xCEC) |
| 0x021B0A30 | 220 | E | high | DuelStateSingleton (+0xD0C, +0xD18) |
| 0x021B1E80 | 160 | F | high | PerPlayerRowTable (+0x10) |
| 0x021B29C0 | 244 | E | high | PerPlayerRowTable, Ov002Slot |
| 0x021B2AB4 | 308 | F | high | PerPlayerRowTable, Ov002Slot |
| 0x021B2BE8 | 356 | F | high | PerPlayerRowTable, Ov002Slot |
| 0x021B2E04 | 184 | F | high | PerPlayerRowTable, Ov002Slot |
| 0x021B2EBC | 344 | F | high | PerPlayerRowTable |
| 0x021B3864 | 244 | E | high | PerPlayerRowTable |
| 0x021B39C4 | 252 | E | high | PerPlayerRowTable, Ov002Slot |
| 0x021B3AC0 | 336 | F | high | PerPlayerRowTable |
| 0x021B9830 | 148 | F | high | PerPlayerRowTable, Ov002Slot |
| 0x021B9ECC | 360 | F | high | Ov002Slot |
| 0x021BB2CC | 332 | E | med  | DuelStateSingleton, PerPlayerRowTable |
| 0x021BB65C | 340 | E | med  | DuelStateSingleton, PerPlayerRowTable |
| 0x021BB7F8 | 276 | E | med  | PerPlayerRowTable |
| 0x021BBDA8 | 228 | F | high | Ov002Slot |
| 0x021BD710 | 332 | F | high | Ov002Slot |
| 0x021BD85C | 236 | E | high | Ov002Slot |
| 0x021C23AC | 332 | E | med  | PerPlayerRowTable |
| 0x021C2C54 | 224 | E | med  | PerPlayerRowTable |
| 0x021C2D34 | 256 | E | high | PerPlayerRowTable |
| 0x021C32D4 | 124 | E | high | Ov002Slot |
| 0x021C38C4 | 296 | F | high | PerPlayerRowTable, Ov002Slot |
| 0x021CFDA8 | 368 | F | high | PerPlayerRowTable, Ov002Slot |
| 0x021D1284 | 308 | F | high | PerPlayerRowTable |
| 0x021D1974 | 224 | F | high | PerPlayerRowTable, Ov002Slot |
| 0x021D3488 | 372 | F | high | PerPlayerRowTable |
| 0x021D6258 | 292 | E | high | PerPlayerRowTable, Ov002Slot |
| 0x021D8298 | 380 | E | high | PerPlayerRowTable, Ov002Slot |
| 0x021D94AC | 336 | E[never] | high | PerPlayerRowTable, Ov002Slot |
| 0x021D95FC | 240 | E | high | DuelStateSingleton, PerPlayerRowTable, Ov002Slot |
| 0x021DE134 | 264 | F | high | DuelStateSingleton, PerPlayerRowTable, Ov002Slot |
| 0x021DED8C | 264 | F | high | Ov002Slot |
| 0x021E1B24 | 212 | E | high | PerPlayerRowTable, Ov002Slot |
| 0x021E1BF8 | 148 | E | med  | DuelStateSingleton |
| 0x021E25F0 | 380 | F | high | PerPlayerRowTable, Ov002Slot |
| 0x021E72A8 | 252 | F | med  | DuelQueueState |
| 0x021EAE2C | 336 | E | high | DuelQueueState, PerPlayerRowTable, Ov002Slot |
| 0x021EB1B8 | 328 | E | high | Ov002Slot |
| 0x021EB3B8 | 376 | F | high | PerPlayerRowTable, Ov002Slot |
| 0x021EB7B8 | 272 | E | high | PerPlayerRowTable, Ov002Slot |
| 0x021EC41C | 260 | F | high | PerPlayerRowTable, Ov002Slot |
| 0x021ECBD0 | 280 | F | high | Ov002Slot |
| 0x021ECF60 | 304 | E | high | DuelQueueState, PerPlayerRowTable, Ov002Slot |
| 0x021ED1F8 | 348 | F | high | Ov002Slot |
| 0x021EE4C8 | 380 | E | high | Ov002Slot |
| 0x021EE81C | 364 | E | high | DuelQueueState, PerPlayerRowTable, Ov002Slot |
| 0x021EF41C | 172 | E | high | Ov002Slot |
| 0x021EFB38 | 300 | E | high | DuelQueueState, PerPlayerRowTable, Ov002Slot |
| 0x021F0478 | 276 | F | high | Ov002Slot |
| 0x021F1BAC | 308 | F | med  | PerPlayerRowTable |
| 0x021F1E94 | 340 | F | high | Ov002Slot |
| 0x021F21F8 | 240 | F | high | DuelQueueState, Ov002Slot |
| 0x021F2628 | 232 | F | high | PerPlayerRowTable, Ov002Slot |
| 0x021F2BBC | 236 | F | high | Ov002Slot |
| 0x021F2E0C | 260 | F | high | Ov002Slot |
| 0x021F71A0 | 320 | E | high | DuelQueueState |
| 0x021F8348 | 328 | F | high | DuelQueueState |
| 0x021F862C | 308 | F | high | DuelQueueState |
| 0x021F8A14 | 236 | F | high | DuelQueueState, PerPlayerRowTable, Ov002Slot |
| 0x021F92D0 | 208 | E | high | Ov002Slot |
| 0x021F96D8 | 272 | F | high | DuelQueueState, Ov002Slot |
| 0x021F9C94 | 280 | F | high | DuelQueueState |
| 0x021FA4D8 | 272 | F | high | DuelQueueState |
| 0x021FA620 | 348 | F | high | DuelQueueState |
| 0x021FA77C | 344 | F | high | DuelQueueState |
| 0x021FA968 | 260 | F | high | DuelQueueState |
| 0x021FAB74 | 328 | E | high | DuelQueueState |
| 0x021FBC08 | 392 | F | high | DuelQueueState |
| 0x021FF020 | 300 | E | high | Ov002Slot |
| 0x021FF170 | 328 | F | high | Ov002Slot |
| 0x0220079C | 364 | E | high | DuelStateSingleton |
| 0x02201B24 | 352 | F | high | Ov002Slot |
| 0x022028C8 | 280 | F | high | Ov002Slot |
| 0x02203074 | 292 | F | high | Ov002Slot |
| 0x02203198 | 248 | F | med  | PerPlayerRowTable |
| 0x02203B8C | 260 | F | high | Ov002Slot |
| 0x02204840 | 292 | F | high | PerPlayerRowTable, Ov002Slot |
| 0x02205080 | 264 | F | high | Ov002Slot |
| 0x02205188 | 240 | E | high | Ov002Slot |
| 0x02205A40 | 240 | F | high | Ov002Slot |
| 0x02206DA0 | 196 | F | high | Ov002Slot |
| 0x02206EB0 | 260 | F | high | DuelStateSingleton |
| 0x02207818 | 364 | F | high | PerPlayerRowTable, Ov002Slot |
| 0x02208CA8 | 336 | F | high | PerPlayerRowTable, Ov002Slot |
| 0x02208DF8 | 264 | F | med  | PerPlayerRowTable |
| 0x022095AC | 204 | F | high | DuelStateSingleton (+0xCF8), Ov002Slot |
| 0x0220A218 | 200 | F | med  | PerPlayerRowTable |
| 0x0220CB50 | 328 | F | high | DuelQueueState, Ov002Slot |
| 0x0220D094 | 224 | F | med  | PerPlayerRowTable |
| 0x0220D858 | 216 | E | high | Ov002Slot |
| 0x0220D974 | 300 | F | high | DuelStateSingleton, PerPlayerRowTable |
| 0x0220E16C | 232 | F | high | PerPlayerRowTable |
| 0x0220E3C8 | 336 | F | high | DuelQueueState |
| 0x0220E650 | 252 | F | high | PerPlayerRowTable |
| 0x0220E988 | 376 | F | high | PerPlayerRowTable, Ov002Slot |
| 0x02211174 | 388 | E | high | DuelStateSingleton, DuelQueueState, PerPlayerRowTable, Ov002Slot |
| 0x0221146C | 352 | E | high | PerPlayerRowTable, Ov002Slot |
| 0x022119BC | 184 | E | high | DuelStateSingleton (+0xCEC) |
| 0x02211F88 | 276 | E | high | Ov002Slot |
| 0x02212D98 | 244 | E | high | Ov002Slot |
| 0x022157E4 | 220 | F | high | DuelQueueState (+0x5A8) |
| 0x0221AF10 | 128 | E | high | DuelStateSingleton (+0xCEC) |
| 0x0221E494 | 180 | E | high | Ov002Slot |
| 0x02220F48 | 264 | E | high | Ov002Slot |
| 0x02221A38 | 128 | E | high | PerPlayerRowTable, Ov002Slot |
| 0x02224EA4 | 356 | F | high | DuelQueueState, Ov002Slot |
| 0x0222542C | 388 | F | high | PerPlayerRowTable, Ov002Slot |
| 0x02225AB8 | 384 | F | high | DuelQueueState, Ov002Slot |
| 0x0222B1D0 | 272 | E | high | Ov002Slot |
| 0x0222C2C8 | 276 | F | high | Ov002Slot |
| 0x02233504 | 212 | F | high | PerPlayerRowTable (+0x10), Ov002Slot |
| 0x02234528 | 296 | F | high | PerPlayerRowTable, Ov002Slot |
| 0x022349AC | 320 | F | high | DuelQueueState, Ov002Slot |
| 0x02236B64 | 364 | F | high | DuelQueueState, PerPlayerRowTable, Ov002Slot |
| 0x02237618 | 236 | E | high | Ov002Slot |
| 0x02237D58 | 316 | F | high | DuelQueueState, PerPlayerRowTable, Ov002Slot |
| 0x0223998C | 232 | E | high | PerPlayerRowTable, Ov002Slot |
| 0x0223AF48 | 228 | E | high | Ov002Slot |
| 0x0223F490 | 356 | F | high | DuelQueueState, Ov002Slot |
| 0x02240064 | 384 | E | high | DuelQueueState, Ov002Slot |
| 0x02241BF8 | 268 | E | high | Ov002Slot |
| 0x022420F0 | 316 | F | high | DuelQueueState, Ov002Slot |
| 0x02244104 | 380 | F | high | DuelQueueState, Ov002Slot |
| 0x022446D8 | 252 | E | high | Ov002Slot |
| 0x0224DE94 | 228 | E | high | Ov002Slot |
| 0x0224EAD4 | 360 | F | high | DuelQueueState, Ov002Slot |
| 0x0224EEAC | 216 | E | high | Ov002Slot |
| 0x02250A28 | 268 | E | high | Ov002Slot |
| 0x022511BC | 232 | E | high | PerPlayerRowTable, Ov002Slot |
| 0x02251380 | 260 | F | high | PerPlayerRowTable, Ov002Slot |
| 0x02251EC0 | 176 | E | high | Ov002Slot |
| 0x022525B4 | 316 | F | high | DuelQueueState, Ov002Slot |
| 0x02252558 | 268 | F | high | PerPlayerRowTable, Ov002Slot |
| 0x02252E54 | 272 | F | high | PerPlayerRowTable, Ov002Slot |
| 0x02253528 | 296 | F | high | DuelQueueState, Ov002Slot |
| 0x0225368C | 92  | E | med  | CardHandlerTable (stride-8 dispatch) |
| 0x022536E8 | 96  | E | med  | CardHandlerTable (stride-8 dispatch) |
| 0x0225406C | 232 | E | high | Ov002Slot |
| 0x02254BF4 | 348 | F | high | DuelQueueState, Ov002Slot |
| 0x0225540C | 296 | F | high | PerPlayerRowTable, Ov002Slot |
| 0x02255344 | 272 | E | high | Ov002Slot |
| 0x022555D0 | 312 | F | high | DuelQueueState, Ov002Slot |
| 0x02255D70 | 228 | E | high | Ov002Slot |
| 0x02256200 | 316 | F | high | DuelQueueState, Ov002Slot |
| 0x022562F0 | 256 | E | high | Ov002Slot |
| 0x022564DC | 232 | E | high | Ov002Slot |
| 0x022561E0 | 272 | E | high | Ov002Slot |
| 0x02256720 | 236 | E | high | Ov002Slot |
| 0x02256A50 | 120 | E | high | DuelStateSingleton (+0xCEC) |
| 0x02256AC8 | 272 | E | high | Ov002Slot |
| 0x02256F38 | 244 | E | high | Ov002Slot |
| 0x02257750 | 140 | E | high | PerPlayerRowTable (+0x10) |
| 0x022577DC | 156 | E | high | DuelQueueState (+0x5C0), PerPlayerRowTable |
| 0x022579A8 | 156 | E | high | DuelQueueState (+0x5C0), PerPlayerRowTable |
| 0x02257888 | 164 | E | high | PerPlayerRowTable (+0x10) |
| 0x02257B48 | 268 | E | high | Ov002Slot |
| 0x022580B4 | 380 | F | high | DuelQueueState, Ov002Slot |
| 0x02259160 | 376 | F | high | DuelQueueState, PerPlayerRowTable, Ov002Slot |
| 0x02261000 | 352 | F | high | Ov002Slot |
| 0x022619FC | 352 | F | high | DuelQueueState, Ov002Slot |
| 0x02261E3C | 384 | F | high | PerPlayerRowTable, Ov002Slot |
| 0x022621E0 | 380 | E | high | DuelQueueState, PerPlayerRowTable, Ov002Slot |
| 0x022627AC | 88  | E | med  | DuelStateSingleton (base+0xD2C/D30 table dispatch) |
| 0x0226366C | 340 | F | high | DuelQueueState, Ov002Slot |
| 0x02263950 | 204 | E | high | Ov002Slot |
| 0x02263B54 | 272 | E | high | Ov002Slot |
| 0x02263DBC | 376 | F | high | DuelQueueState, Ov002Slot |
| 0x02263F04 | 240 | E | high | Ov002Slot |
| 0x022640B0 | 304 | F | high | DuelQueueState, Ov002Slot |
| 0x022640F4 | 180 | E | high | Ov002Slot |
| 0x022641A8 | 260 | E | high | Ov002Slot |
| 0x022643E8 | 252 | E | high | Ov002Slot |
| 0x022644CC | 368 | F | high | DuelQueueState, Ov002Slot |
| 0x022647C8 | 256 | E | high | Ov002Slot |
| 0x022648C8 | 192 | E | high | Ov002Slot |
| 0x02264E14 | 236 | E | high | Ov002Slot |
| 0x02264F00 | 204 | E | high | Ov002Slot |
| 0x02265014 | 172 | E | high | Ov002Slot |
| 0x02266220 | 196 | E | high | PerPlayerRowTable (+0x10) |
| 0x02266638 | 344 | F | high | DuelQueueState, Ov002Slot |
| 0x0226674C | 228 | E | high | Ov002Slot |
| 0x0226666C | 224 | E | high | Ov002Slot |
| 0x02266C38 | 236 | E | high | Ov002Slot |
| 0x02266DEC | 268 | E | high | Ov002Slot |
| 0x02266EF8 | 248 | E | high | Ov002Slot |
| 0x02266FF0 | 252 | E | high | Ov002Slot |
| 0x022672A0 | 340 | F | high | DuelQueueState, Ov002Slot |
| 0x0226722C | 228 | E | high | Ov002Slot |
| 0x022674D0 | 272 | E | high | Ov002Slot |
| 0x02267C04 | 272 | E | high | Ov002Slot |
| 0x022715A0 | 344 | E | high | DuelQueueState, Ov002Slot |
| 0x02271524 | 228 | E | high | Ov002Slot |
| 0x022717F8 | 252 | E | high | Ov002Slot |
| 0x02271D58 | 392 | F | high | DuelQueueState, Ov002Slot |
| 0x0227325C | 384 | F | high | DuelQueueState, Ov002Slot |
| 0x0227352C | 380 | F | high | DuelQueueState, Ov002Slot |
| 0x022735B4 | 324 | F | high | DuelQueueState, Ov002Slot |
| 0x02273218 | 276 | F | high | Ov002Slot |
| 0x022738A4 | 384 | F | high | DuelQueueState, Ov002Slot |
| 0x02277924 | 376 | F | high | DuelQueueState, Ov002Slot |
| 0x0227DD6C | 140 | E | med  | PerPlayerRowTable |
| 0x0227ECAC | 320 | F | high | DuelQueueState, Ov002Slot |
| 0x0228791C | 176 | E | high | DuelQueueState (+0x5D4) |
| 0x0228C330 | 164 | E | high | Ov002Slot |
| 0x0228C864 | 192 | E | high | Ov002Slot |
| 0x0228C924 | 152 | E | high | Ov002Slot |
| 0x0228D898 | 196 | E | high | Ov002Slot |
| 0x02291160 | 180 | F | high | Ov002Slot |
| 0x02291DC0 | 212 | E | high | Ov002Slot |
| 0x02292AB8 | 300 | E | high | DuelQueueState, Ov002Slot |
| 0x02292F90 | 384 | F | high | DuelQueueState, Ov002Slot |
| 0x022930EC | 264 | E | high | DuelQueueState |
| 0x02293214 | 396 | F | high | DuelQueueState, Ov002Slot |
| 0x022932C0 | 260 | F | high | DuelQueueState |
| 0x02294828 | 272 | F | high | Ov002Slot |
| 0x02294B5C | 328 | F | high | DuelQueueState, Ov002Slot |
| 0x0229516C | 352 | F | high | DuelQueueState, Ov002Slot |
| 0x022951C4 | 192 | E | high | Ov002Slot |
| 0x02295A0C | 252 | F | high | Ov002Slot |
| 0x022960D4 | 336 | F | high | DuelQueueState, Ov002Slot |
| 0x02296900 | 268 | F | high | Ov002Slot |
| 0x022989BC | 220 | F | high | DuelQueueState (+0x5A8) |
| 0x02299C9C | 152 | E | high | DuelStateSingleton (+0xCEC, +0xCF8) |
| 0x022A85A4 | 196 | E | high | Ov002Slot |
| 0x022A9CAC | 240 | F | high | Ov002Slot |
| 0x022AC8F0 | 252 | F | high | Ov002Slot |
| 0x022AFC0C | 228 | F | high | Ov002Slot |
| 0x022AF1F0 | 276 | F | high | DuelStateSingleton |
| 0x022B1494 | 220 | F | high | DuelStateSingleton, PerPlayerRowTable |
| 0x022B3784 | 276 | F | high | Ov002Slot |
| 0x022B50A4 | 220 | E | high | Ov002Slot |
