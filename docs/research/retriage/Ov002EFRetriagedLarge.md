[//]: # (markdownlint-disable MD013 MD041)

# ov002 E/F Re-triage — Round 5 (400–1200 B)

Round 4 covered E/F funcs under 400 B (413 examined, 297 tractable / 72%).
Round 5 extends to the 400–1200 B tier, examining the 25 pre-filtered candidates
that access at least one known KB struct.

---

## Summary Table

| Address | File size (B) | Verdict | Reason |
|---------|--------------|---------|--------|
| 0x022AE718 | 576 | **tractable** | DSS+0xD48 (documented) + card-arg ldrh guard |
| 0x02216530 | 620 | **tractable** | DQS+0x48C pointer + player-bit lsl#1f/lsr#1f + const compare |
| 0x0220CFF8 | 641 | **tractable** | DSS+0xCEC + DSS+0xCF8, both documented |
| 0x021C9AF0 | 682 | **tractable** | DSS+0xD0 bitmask set/clear — orr/and shifted-by-reg; gap field but deterministic |
| 0x0220DDF4 | 694 | **tractable** | DQS+0x484 (adjacent to documented +0x48C) + call to named subfunction |
| 0x022592B8 | 707 | **tractable** | DSS init: stores to +0xD48/D54/D50 (doc) + gap fields +0xD84/D6C/D58; pure write sequence |
| 0x0226ACF8 | 717 | **tractable** | DSS+0xD94 + DSS+0xD98 (adjacent to documented +0xD9C) + `data_022d0e6c+0xA0` strh |
| 0x021FBF30 | 718 | **tractable** | DQS+0x490 entry-count + inner loop with 6-bit bitfield from `[entry+4]`; deterministic |
| 0x02259324 | 725 | **tractable** | DSS init identical to 022592B8 with literal 0x9 seeded to +0xD48 |
| 0x021BBF50 | 749 | **tractable** | PerPlayerRowTable mla stride 0x868, slot loop 5 × id_lo13 lsl#19/lsr#19 counter |
| 0x022968BC | 751 | **tractable** | PerPlayerRowTable player bit + `[row+0xF8]` id_lo13 vs constant 0x175e |
| 0x021B2094 | 757 | **tractable** | PerPlayerRowTable + offset +0x1400 stride-8 walk; single named blx in loop |
| 0x0220599C | 766 | **tractable** | DSS+0xCEC + DSS+0xCF8 guard + named function call |
| 0x022913CC | 772 | **tractable** | PerPlayerRowTable cross-player zone_count[0] vs zone_count[1]+0x1f4 |
| 0x02206E64 | 772 | **tractable** | PerPlayerRowTable cross-player zone_count compare + 0x7d0 threshold |
| 0x02267F90 | 775 | **tractable** | DSS+0xCEC XOR DSS+0xD24 + slot-range guard + named call |
| 0x0224EA54 | 783 | **tractable** | PerPlayerRowTable mla + slot[+0x120] bitfield extract + 2 named calls |
| 0x022869D0 | 785 | **tractable** | PerPlayerRowTable player bit (inverted), zone_count vs card u16 fields |
| 0x0227C630 | 787 | **tractable** | PerPlayerRowTable zone_count × 0x1f4 vs named-func result × 0x1f4 |
| 0x02249E84 | 791 | **tractable** | PerPlayerRowTable + offset +0x1D00 stride-2 walk, 3-iter loop; named call |
| 0x02207E18 | 797 | **tractable** | PerPlayerRowTable cross-player: p0_zone_count+0x1b58 vs p1_zone_count |
| 0x021E2E38 | 803 | **tractable** | DSS+0xD0C gate + `data_022cd73c+0x4` + card player/type bit XOR |
| 0x0228DEAC | 806 | **tractable** | PerPlayerRowTable mla + slot[+0x120] bitfield (same shape as 0224EA54) |
| 0x0228BB58 | 806 | **tractable** | Two card args; card type 5-bit field; DSS+0xD0 bitmask guard |
| 0x0228AC74 | 812 | **tractable** | DQS+0x5D4 (documented) + `[dqs+0x5DC]` byte type-code switch |

**Tractable: 25 / 25 (100%)**
**Intractable: 0 / 25**

---

## Tractable Function Analyses

---

### 0x022AE718 (576 B)

**KB structs:** `DuelStateSingleton+0xD48` (documented: clearable counter/flag)

**Why tractable:** Takes a card pointer in `r0`. First does `ldrh r0, [r0]` — reads
`card[+0x0]` u16 as a null-guard. Then loads DSS and reads `dss->f_d48` at the
well-documented offset +0xD48. Compares to 1 — a simple clearable-flag check. No
calls, no loops, no scheduling.

**m2c sketch:**

```c
int func_ov002_022ae718(CardObj *card) {
    if (*(u16 *)card == 0) return 0;
    DuelStateSingleton *dss = &data_ov002_022d016c;
    if (dss->f_d48 == 1) return 1;    /* +0xD48 clearable flag */
    return 0;
}
```

**Levers:** none expected.

---

### 0x02216530 (620 B)

**KB structs:** `DuelQueueState+0x48C` (f_48c card-handle pointer)

**Why tractable:** Loads DQS, reads `dqs->f_48c` (+0x48C), then `ldrh [f_48c, #2]`
and applies `lsl#1f / lsr#1f` — the low-bit player extraction. Compares result
against `r0` (the player-parity arg). If mismatch → 0; if `r1 == 0xb` → returns
0x800 (special sentinel). Pure known-struct read with a const compare.

**m2c sketch:**

```c
int func_ov002_02216530(int player, int arg1) {
    DuelQueueState *dqs = &data_ov002_022ce288;
    CardHandle *ch = dqs->f_48c;              /* +0x48C */
    int owner_bit = (ch->f2 << 31) >> 31;     /* f2 bit0 = player */
    if (player != owner_bit) return 0;
    if (arg1 == 0xb) return 0x800;
    return 0;
}
```

**Levers:** player-bit lsl#1f/lsr#1f is a standard pattern (no extra lever needed).

---

### 0x0220CFF8 (641 B)

**KB structs:** `DuelStateSingleton+0xCEC` (card_list_slot_idx), `+0xCF8` (duel_phase)

**Why tractable:** Classic double guard on DSS. Reads `card[+0x2]` u16, extracts
bit0 via `lsl#1f/lsr#1f`, compares to `dss->f_cec` (`+0xCEC`). If mismatch →
returns 0. Then reads `dss->f_cf8` (`+0xCF8`), returns 1 if `== 3`, else 0.
Both fields fully documented.

**m2c sketch:**

```c
int func_ov002_0220cff8(CardObj *card) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    int player_bit = (card->f2 << 31) >> 31;        /* bit0 */
    if (dss->f_cec != player_bit) return 0;          /* +0xCEC */
    return (dss->f_cf8 == 3) ? 1 : 0;               /* +0xCF8 */
}
```

**Levers:** cmp ordering (== 3 moveq/movne) is standard.

---

### 0x021C9AF0 (682 B)

**KB structs:** `DuelStateSingleton+0xD0` — undocumented gap field (bitmask flags word)

**Why tractable:** Pattern is a classic `set_or_clear_bit(field, bit_index, value)`.
The function takes `(bit_index, set_or_clear)` in r0/r1. The `orr r0, r3, r2, lsl r0`
(set) and `mvn r0, r2, lsl r0; and r0, r2, r0` (clear) sequences are a textbook
bit-manipulation idiom in mwcc-compiled code. The `+0xD0` offset on DSS lands in the
large gap before `+0xCEC` — the field is undocumented but the function is fully
deterministic (no calls, no loops, no scheduling). Confidence: **medium** (offset not
in KB but pattern is unambiguous).

**m2c sketch:**

```c
void func_ov002_021c9af0(int bit_idx, int set_flag) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    if (set_flag != 0) {
        dss->f_d0 |= (1u << bit_idx);     /* +0xD0 bitmask flags */
    } else {
        dss->f_d0 &= ~(1u << bit_idx);
    }
}
```

**Levers:** orr-shifted-operand-first for the set branch; standard and-mvn for clear.

---

### 0x0220DDF4 (694 B)

**KB structs:** `DuelQueueState+0x484` — one word before documented `+0x48C` (f_48c)

**Why tractable:** Loads DQS, reads `[dqs+0x484]` as an integer counter, adds 1 and
checks `< 3`. If true: early return 0. Else: calls named `func_ov002_0220dd34` and
returns its boolean result. Two-branch function — the scheduling is entirely
determined by the counter threshold and the named callee.

**m2c sketch:**

```c
int func_ov002_0220ddf4(void) {
    DuelQueueState *dqs = &data_ov002_022ce288;
    int cnt = dqs->f_484 + 1;     /* +0x484, one word before f_48c */
    if (cnt < 3) return 0;
    return func_ov002_0220dd34() != 0;
}
```

**Levers:** `movlt r0, #0` + `ldmltia` early-exit pattern; `movne/moveq` for boolean.

---

### 0x022592B8 (707 B)

**KB structs:** `DuelStateSingleton+0xD48, +0xD54, +0xD50` (all documented);
`+0xD84, +0xD6C, +0xD58` (undocumented gap fields); `data_ov002_022cd73c+0x4`

**Why tractable:** Pure write-only initializer — stores `r0` to `dss->f_d48`, zeros
to `+0xD84/+0xD54/+0xD50/+0xD58`, loads `data_022cd73c[+0x4]` and stores to
`dss->f_d6c`. No branches, no calls, no loops. The undocumented fields are in the
`+0xD58–+0xD84` region; their identity doesn't affect tractability because the
function just zeroes them (init function).

**m2c sketch:**

```c
void func_ov002_022592b8(int mode_code) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    dss->f_d48 = mode_code;    /* +0xD48 clearable counter/flag */
    dss->f_d84 = 0;            /* +0xD84 gap field */
    dss->f_d54 = 0;            /* +0xD54 blocking-state flag */
    dss->f_d50 = 0;            /* +0xD50 guard flag */
    dss->f_d6c = data_ov002_022cd73c.f_4;  /* +0xD6C gap; loaded from cd73c+4 */
    dss->f_d58 = 0;            /* +0xD58 gap field */
}
```

**Levers:** store ordering is fixed by the instruction stream (no scheduling).

---

### 0x0226ACF8 (717 B)

**KB structs:** `DuelStateSingleton+0xD94` (documented), `+0xD98` (gap — adjacent
to documented +0xD9C); `data_ov002_022d0e6c+0xA0/+0xA2` (two u16 strh stores)

**Why tractable:** Simple init — stores args r0/r1 to `dss->f_d94` (+0xD94) and
`dss->f_d98` (+0xD98), stores args r2/r3 as u16 to `data_022d0e6c+0xA0` and
`+0xA2`. Then calls `func_ov002_0226ac94`. All stores to named globals, single call
to a named function — fully deterministic.

**m2c sketch:**

```c
void func_ov002_0226acf8(int arg0, int arg1, u16 arg2, u16 arg3) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    dss->f_d94 = arg0;         /* +0xD94 upper-bound field */
    dss->f_d98 = arg1;         /* +0xD98 gap field */
    HpTable *hp = &data_ov002_022d0e6c;
    hp->f_a0 = arg2;           /* +0xA0 u16 */
    hp->f_a2 = arg3;           /* +0xA2 u16 */
    func_ov002_0226ac94();
}
```

**Levers:** none expected (push/pop pair already emitted correctly by mwcc with r3
as padding).

---

### 0x021FBF30 (718 B)

**KB structs:** `DuelQueueState+0x490` (entry count — gap between +0x48C and +0x5A8);
inner entries at stride 0x18, `[entry+0x4]` bitfield extract

**Why tractable:** Loads DQS, reads `[dqs+0x490]` as an iteration count. Inner loop
walks a table in DQS (entries at DQS + `n * 0x18`, where `dqs+0x490` is the count
and the first entry starts adjacent). Each entry's `[+0x4]` field is loaded as u16
and `lsl#17 / lsr#17` extracts bits 0..14. Compares against arg `r0`. One match →
returns 1. Falls through → 0. The bitfield extraction and loop count are
deterministic. No fn-ptr calls.

**m2c sketch:**

```c
int func_ov002_021fbf30(int target_field) {
    DuelQueueState *dqs = &data_ov002_022ce288;
    int count = dqs->f_490;           /* +0x490 entry count */
    if (count == 0) return 0;
    for (int i = 0; i < count; i++) {
        /* entry at dqs+0x18*i; stride 0x18 from base dqs */
        u16 raw = ((u8 *)dqs + 0x18 * i)->f4;   /* [entry+4] u16 */
        int field = (raw << 17) >> 17;  /* 15-bit bitfield */
        if (target_field == field) return 1;
    }
    return 0;
}
```

**Levers:** loop counter in r2 vs `ip` (count), `bcc` loop back — standard.

---

### 0x02259324 (725 B)

**KB structs:** Same as `022592B8` above — `DuelStateSingleton` init variant

**Why tractable:** Byte-for-byte identical structure to `022592B8`, except the
literal stored to `dss->f_d48` is `0x9` (hard-coded constant) rather than the
argument `r0`. The two functions are a matched pair of duel-phase initializers.

**m2c sketch:**

```c
void func_ov002_02259324(int arg0) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    dss->f_d48 = 9;            /* constant 9 instead of arg */
    dss->f_d84 = arg0;         /* +0xD84 — note: arg goes here, not d48 */
    dss->f_d54 = 0;
    dss->f_d50 = 0;
    dss->f_d6c = data_ov002_022cd73c.f_4;
    dss->f_d58 = 0;
}
```

**Levers:** none beyond the sibling `022592B8` levers.

---

### 0x021BBF50 (749 B)

**KB structs:** `PerPlayerRowTable` stride 0x868, `Ov002Slot.id_lo13` (lsl#19/lsr#19)

**Why tractable:** Canonical PerPlayerRowTable slot counter. Takes player arg in r0,
masks to bit0, `mla` with stride 0x868. Adds `+0x30` for the slots sub-array. Loops
5 times (cmp r2, #5), reads each slot word, applies `lsl#19/lsr#19` to get id_lo13,
counts non-zero slots. No calls, no scheduling.

**m2c sketch:**

```c
int func_ov002_021bbf50(int player) {
    Ov002FieldZone *row = &data_ov002_022cf16c[player & 1];  /* stride 0x868 mla */
    int count = 0;
    for (int s = 0; s < 5; s++) {
        int id = (row->slots[s].id_lo13_word << 19) >> 19;
        if (id != 0) count++;
    }
    return count;
}
```

**Levers:** mwcc 2.0 signed bitfield extraction (lsl#19/lsr#19 is standard); `movs`
to check nonzero.

---

### 0x022968BC (751 B)

**KB structs:** `PerPlayerRowTable` stride 0x868; `Ov002Slot` id_lo13 at `[row+0xF8]`
(beyond the 5-slot `+0x030` sub-array — a different slot or field further into the
player block); constant `0x175e`

**Why tractable:** Reads `card[+0x2]` u16, extracts bit0 twice (`lsl#1f/lsr#1f` then
`and #1`), uses as player index for mla. Reads `[row+0xF8]`, applies id_lo13
extraction (`lsl#19/lsr#19`), compares to `0x175e`. Pure comparison — no calls, no
loops.

**m2c sketch:**

```c
int func_ov002_022968bc(CardObj *card) {
    int player = ((card->f2 << 31) >> 31) & 1;
    Ov002FieldZone *row = &data_ov002_022cf16c[player];  /* mla stride */
    int id = (*(u32 *)((u8 *)row + 0xF8) << 19) >> 19;  /* id_lo13 at +0xF8 */
    return (id == 0x175e) ? 1 : 0;
}
```

**Levers:** `and #1` after `lsr#1f` emitted by mwcc when masking the bit explicitly.

---

### 0x021B2094 (757 B)

**KB structs:** `PerPlayerRowTable` base; companion table at `base + r0*8 + 0x1400`
(stride-8 walk, beyond the documented 0x868 per-player block — an adjacent BSS array)

**Why tractable:** Reads `card[+0xA]` u16 as a non-zero guard/iterator. Loop body:
computes `data_022cf16c + r0*8 + 0x1400` — this is a stride-8 table that starts
`0x1400` bytes past the PerPlayerRowTable base, i.e. at `0x022CF16C + 0x1400 =
0x022D056C` (within ov002 BSS). Reads `[+0xEA]` u16 from that entry, calls named
`func_ov002_021b1d84(entry_ea)`, uses the return as the next iteration value. The
single call is to a named function (not a fn-ptr), so scheduling is fixed.

**m2c sketch:**

```c
void func_ov002_021b2094(CardObj *card) {
    u16 idx = card->f_a;         /* [+0xA] u16 — first node in chain */
    if (idx == 0) return;
    while (1) {
        /* stride-8 table at ov002_BSS+0x1400 from cf16c base */
        u8 *entry = (u8 *)&data_ov002_022cf16c + (u32)idx * 8 + 0x1400;
        u16 next = *(u16 *)(entry + 0xEA);
        func_ov002_021b1d84(idx);
        idx = next;
        if (idx == 0) break;
    }
}
```

**Levers:** `add r1, r4, r0, lsl #3` + `add r1, r1, #0x1400` — the shift-then-add
sequence is canonical for a stride-8 pointer with large base offset.

---

### 0x0220599C (766 B)

**KB structs:** `DuelStateSingleton+0xCEC` (card_list_slot_idx), `+0xCF8` (duel_phase)

**Why tractable:** Double guard on DSS, same pattern as `0220CFF8`. Reads `card[+0x2]`
bit0 `lsl#1f/lsr#1f`, compares to `dss->f_cec`. Mismatch → 0. Then checks `dss->f_cf8 == 1`.
Mismatch → 0. Passes both → calls `func_ov002_021ff354` and returns its result.

**m2c sketch:**

```c
int func_ov002_0220599c(CardObj *card) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    int player_bit = (card->f2 << 31) >> 31;
    if (dss->f_cec != player_bit) return 0;   /* +0xCEC */
    if (dss->f_cf8 != 1)          return 0;   /* +0xCF8 */
    return func_ov002_021ff354(card);
}
```

**Levers:** `movne + ldmneia` short-circuit — standard mwcc conditional-return.

---

### 0x022913CC (772 B)

**KB structs:** `PerPlayerRowTable` zone_count at `[base+0]` for both players;
stride 0x868; player bit from `card[+0x2]` bit0

**Why tractable:** Takes a card arg, extracts `card[+0x2]` bit0 for player identity.
Computes both player bases via `mul p0_base, player, 0x868` and
`mul p1_base, other_player, 0x868`. Reads zone_count (word at offset 0) for each
base. Checks `zone_count_p0 + 0x1f4 > zone_count_p1`. Returns 1 if true, 0 if not.
A simple cross-player threshold comparison — no calls.

**m2c sketch:**

```c
int func_ov002_022913cc(CardObj *card) {
    int p = ((card->f2 << 31) >> 31) & 1;
    int q = (1 - p) & 1;
    int cnt_p = data_ov002_022cf16c[p].zone_count;   /* [base_p+0] */
    int cnt_q = data_ov002_022cf16c[q].zone_count;   /* [base_q+0] */
    return (cnt_q < cnt_p + 0x1f4) ? 1 : 0;
}
```

**Levers:** `rsb r2, r1, #0x1` + `and #1` pattern for inverse-player computation;
`movlt/movge` arm-swap order.

---

### 0x02206E64 (772 B)

**KB structs:** `PerPlayerRowTable` zone_count at `[base+0]` for both players;
stride 0x868; player bit from `card[+0x2]` bit0

**Why tractable:** Structurally identical to `022913CC` but with threshold `0x7D0`
(2000) instead of `0x1F4` (500). Same cross-player zone_count comparison, different
constant. The mla emits `mul ip, r3, r0` then `mul r0, r1, r0` (compiler reuses r0
as stride) — a known mwcc alias pattern.

**m2c sketch:**

```c
int func_ov002_02206e64(CardObj *card) {
    int p = ((card->f2 << 31) >> 31) & 1;
    int q = (1 - p) & 1;
    int cnt_p = data_ov002_022cf16c[p].zone_count;
    int cnt_q = data_ov002_022cf16c[q].zone_count;
    return (cnt_p + 0x7d0 <= cnt_q) ? 1 : 0;
}
```

**Levers:** `movle/movgt` (note reversed comparison vs 022913CC — `<=` not `<`).

---

### 0x02267F90 (775 B)

**KB structs:** `DuelStateSingleton+0xCEC` (card_list_slot_idx), `+0xD24`
(secondary sub-state counter)

**Why tractable:** Takes args `(target, r1, r2)`. Guards `r1 + r2 <= 0xA` (slot
range), then reads `dss->f_cec ^ dss->f_d24` (`+0xCEC` XOR `+0xD24`), compares
to `target`. Match → calls `func_ov002_021b9e00` and returns 0x800 on nonzero, 0
otherwise. No-match or out-of-range → 0. Both DSS fields are documented.

**m2c sketch:**

```c
int func_ov002_02267f90(int target, int r1, int r2) {
    if (r1 + r2 > 0xa) return 0;
    DuelStateSingleton *dss = &data_ov002_022d016c;
    int key = dss->f_cec ^ dss->f_d24;    /* +0xCEC XOR +0xD24 */
    if (target != key) return 0;
    if (func_ov002_021b9e00() != 0) return 0x800;
    return 0;
}
```

**Levers:** `bgt .L_skip` before DSS load; `movne r0, #0x800` return.

---

### 0x0224EA54 (783 B)

**KB structs:** `PerPlayerRowTable` mla stride 0x868; slot array at `[row+0x120]`
indexed by r2 (stride-4 word array); multi-bit field extract from slot word

**Why tractable:** Player bit from `r0 & 1`, mla to row base, `add row, row, #0x120`
for a 4-byte-stride slot array (different from the `+0x030` 5-slot sub-array —
likely a 10-slot main zone at `+0x120`). Loads `row[r2*4]` and extracts two bitfields:
bits 8-14 (`lsl#2/lsr#18` then `lsl#1` → 7 bits) and bit31 (`lsr#1f`), sums them.
Then calls `func_ov002_021c38c4(result)`, checks if result < 7, conditionally calls
`func_ov002_02253458(player, 11, slot_idx)`. Two named calls — scheduling is fixed.

**m2c sketch:**

```c
void func_ov002_0224ea54(int player, int arg1, int slot_idx) {
    Ov002FieldZone *row = &data_ov002_022cf16c[player & 1];
    /* row+0x120 = stride-4 slot-data array (main zone) */
    u32 word = ((u32 *)((u8 *)row + 0x120))[slot_idx];
    int field_a = ((word << 2) >> 18) * 2 + (word >> 31);  /* 7-bit + sign */
    int result = func_ov002_021c38c4(field_a);
    if (result >= 7) {
        func_ov002_02253458(player, 11, slot_idx);
    }
}
```

**Levers:** bitfield reconstruct: `lsl#2/lsr#24` → 8 bits; `lsl#1` doubling; note
exact shift constants need careful tracing.

---

### 0x022869D0 (785 B)

**KB structs:** `PerPlayerRowTable` zone_count at `[base+0]`; player bit from
`card[+0x2]` bit0 (inverted via RSB); card fields `[+0x14]` and `[+0x16]` u16

**Why tractable:** Extracts player bit from `card[+0x2]`, inverts (`rsb r3, r3, #1`
+ `and #1`) to get opponent's base. Reads `[row_opponent+0]` = zone_count. Compares
`card[+0x16]` (u16, likely HP or ATK) to `zone_count`. If `card_f16 >= zone_count`
→ returns 1. Else compares `card[+0x14]` (u16) to `card[+0x16]`, returns
carry flag (`movcs/movcc`). Pure card-vs-zone comparison, no calls.

**m2c sketch:**

```c
int func_ov002_022869d0(CardObj *card) {
    int p_inv = ((1 - ((card->f2 << 31) >> 31)) & 1);  /* opponent player */
    int zone_cnt = data_ov002_022cf16c[p_inv].zone_count;  /* [row+0] */
    u16 f16 = card->f_16;    /* [+0x16] u16 */
    if ((int)f16 >= zone_cnt) return 1;
    return ((u16)card->f_14 >= f16) ? 1 : 0;  /* carry/unsigned cmp */
}
```

**Levers:** `movge r0, #1; bxge lr` early-exit pattern; `movcs/movcc` for unsigned.

---

### 0x0227C630 (787 B)

**KB structs:** `PerPlayerRowTable` zone_count at `[base+0]`; player bit from
`r0 & 1`; constant arg `0x132C` passed to named func

**Why tractable:** Takes player in r0. Calls `func_ov002_021bb068(0x132C)` to get
a count value. Computes `count * 0x1F4` (500). Gets player-parity base from
`r0 & 1`, `mul ip, r3, 0x868`, reads `[row+0]` = zone_count. Compares
`zone_count > count * 0x1f4`. Named callee (not fn-ptr).

**m2c sketch:**

```c
int func_ov002_0227c630(int player) {
    int base_count = func_ov002_021bb068(0x132c);
    int threshold = base_count * 0x1f4;
    int zone_cnt = data_ov002_022cf16c[player & 1].zone_count;
    return (zone_cnt > threshold) ? 1 : 0;
}
```

**Levers:** `movgt/movle` flag ordering.

---

### 0x02249E84 (791 B)

**KB structs:** `PerPlayerRowTable` base; companion table at `base + n*2 + 0x1D00`
(stride-2 walk, 3 iterations); calls `func_ov002_02253458`

**Why tractable:** Takes player in r0. Computes opponent parity `rsb r7, r0, #1`.
Loops 3 times (r6 = 0..2). Inner body: `base + r6*2 + 0x1D00` — a stride-2 table
`0x1D00` bytes past the PerPlayerRowTable base (`0x022CF16C + 0x1D00 = 0x022D116C`,
ov002 BSS). Reads `[+0xA2]` u16 from that entry. Calls
`func_ov002_02253458(opponent, 0xB, r2)`. Named call, fixed argument 0xB. No
fn-ptrs.

**m2c sketch:**

```c
void func_ov002_02249e84(int player) {
    int opponent = 1 - player;
    for (int i = 0; i < 3; i++) {
        u8 *entry = (u8 *)&data_ov002_022cf16c + i * 2 + 0x1D00;
        u16 val = *(u16 *)(entry + 0xA2);
        func_ov002_02253458(opponent, 0xb, val);
    }
}
```

**Levers:** `add r0, r4, r6, lsl #1` + `add r0, r0, #0x1D00` — shift-then-add with
large offset; loop uses `blt`.

---

### 0x02207E18 (797 B)

**KB structs:** `PerPlayerRowTable` zone_count at `[base+0]` for both players;
stride 0x868; player bit from `card[+0x2]` bit0

**Why tractable:** Extracts both player and opponent bases from card player bit. Reads
zone_count for each. Computes `p0_zone_count + 0x358 + 0x1800 = p0 + 0x1B58`.
Compares: `p0 + 0x1B58 <= p1_zone_count`. No calls. Note the compiler emits the two
mul-by-stride operations via `mul r2, r1, r0` (player's mul) and `mul r0, r1, r0`
(opponent's mul) reusing r0 as stride — standard mwcc alias.

**m2c sketch:**

```c
int func_ov002_02207e18(CardObj *card) {
    int p = ((card->f2 << 31) >> 31) & 1;
    int q = (1 - p) & 1;          /* rsb + and #1 */
    int cnt_p = data_ov002_022cf16c[p].zone_count;
    int cnt_q = data_ov002_022cf16c[q].zone_count;
    return (cnt_p + 0x1b58 <= cnt_q) ? 1 : 0;
}
```

**Levers:** two-`mul` alias (both use same stride variable reuse); `add r0, r2, #0x358;
add r0, r0, #0x1800` for constant `0x1B58` split across two immediates.

---

### 0x021E2E38 (803 B)

**KB structs:** `DuelStateSingleton+0xD0C` (gate_flag); `data_ov002_022cd73c+0x4`
(player-context word array); card `[+0x2]` player/type bits

**Why tractable:** Reads `dss->f_d0c` (+0xD0C). If zero → returns 0 immediately.
Else: extracts two bits from `card[+0x2]`: bit17 via `lsl#17/lsr#1f` and bit0 via
`lsl#1f/lsr#1f`, XORs them, compares to `data_022cd73c[+0x4]`. Returns 1 if
mismatch, 0 if match. All field accesses from documented KB structs.

**m2c sketch:**

```c
int func_ov002_021e2e38(CardObj *card) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    if (dss->f_d0c == 0) return 0;         /* +0xD0C gate flag */
    int bit17 = (card->f2 << 17) >> 31;    /* player-type bit17 */
    int bit0  = (card->f2 << 31) >> 31;    /* player bit0 */
    int xor_key = bit17 ^ bit0;
    return (data_ov002_022cd73c.f_4 != xor_key) ? 1 : 0;
}
```

**Levers:** `eor r0, r1, r2, lsr #0x1f` — XOR with shifted operand is direct.

---

### 0x0228DEAC (806 B)

**KB structs:** `PerPlayerRowTable` mla stride 0x868; slot array at `[row+0x120]`
indexed by r1; same bitfield as `0224EA54`

**Why tractable:** Simpler version of `0224EA54`. Player from `r0 & 1`, mla stride
0x868, `add row, #0x120`, loads `row[r1*4]` — same `+0x120` slot array. Applies
`lsl#2/lsr#18` and `lsl#18/lsr#1f` (different bit positions vs the sibling — 8-bit
field and sign bit), sums, calls `func_ov002_021c38c4`. Single named call, no
second branch.

**m2c sketch:**

```c
int func_ov002_0228deac(int player, int slot_idx) {
    Ov002FieldZone *row = &data_ov002_022cf16c[player & 1];
    u32 word = ((u32 *)((u8 *)row + 0x120))[slot_idx];
    int field_a = ((word << 2) >> 24) * 2 + (word >> 31);
    return func_ov002_021c38c4(field_a);
}
```

**Levers:** same as `0224EA54`; note `lsr#18` vs sibling's `lsr#18` — same width.

---

### 0x0228BB58 (806 B)

**KB structs:** `DuelStateSingleton+0xD0` (undocumented bitmask word); card
`[+0x2]` bitfields

**Why tractable:** Two card arguments (`r0`, `r1`). Null-checks r1. Extracts bit0
of each card's `[+0x2]` (lsl#1f/lsr#1f), compares player bits — if same player →
returns 0 (same-side guard). Then extracts card type: `card[+0x2]` bits 5–9
(`lsl#1a/lsr#1b` = 5 bits). If type > 4 → returns 0. Otherwise loads `dss->f_d0`
(+0xD0 undocumented bitmask), returns `f_d0 & 1`. The `f_d0` field appears in
multiple .s files as a 32-bit bitmask word in the DSS gap region — deterministic
once the field is named.

**m2c sketch:**

```c
int func_ov002_0228bb58(CardObj *card_a, CardObj *card_b) {
    if (card_b == NULL) return 0;
    int player_a = (card_a->f2 << 31) >> 31;
    int player_b = (card_b->f2 << 31) >> 31;
    if (player_a == player_b) return 0;   /* same-side guard */
    int type = (card_b->f2 << 26) >> 27;  /* 5-bit type field */
    if (type > 4) return 0;
    DuelStateSingleton *dss = &data_ov002_022d016c;
    return dss->f_d0 & 1;                 /* +0xD0 bitmask bit0 */
}
```

**Levers:** `ldrls` conditional load — mwcc emits a predicated LDR when the branch
and load are in a paired condition.

---

### 0x0228AC74 (812 B)

**KB structs:** `DuelQueueState+0x5D4` (cleared_on_edge — documented); `[dqs+0x5DC]`
byte (type-code, in gap between +0x5D8 and +0x688)

**Why tractable:** Reads `dqs->f_5d4` (+0x5D4, documented). If zero → returns 0.
Reads first byte at `[dqs+0x5DC]`. Checks `<= 5` → returns 0. Checks `== 0x12`
or `== 0x13` → returns 0. Otherwise calls `func_ov002_0228a9a4` and returns result.
All DQS field accesses — the `+0x5DC` byte is in the documented gap (between
+0x5D8 guard and +0x688 companion). Deterministic branch sequence.

**m2c sketch:**

```c
int func_ov002_0228ac74(CardObj *card) {
    DuelQueueState *dqs = &data_ov002_022ce288;
    if (dqs->f_5d4 == 0) return 0;            /* +0x5D4 cleared_on_edge */
    u8 type = ((u8 *)dqs)[0x5dc];             /* type-code byte in gap */
    if (type <= 5) return 0;
    if (type == 0x12 || type == 0x13) return 0;
    return func_ov002_0228a9a4(card);
}
```

**Levers:** `movls r0, #0; ldmlsia sp!, {r3, pc}` — predicated return via stmdb
push/pop; `cmpne r2, #0x13` chained condition.

---

## Pattern Breakdown

| Pattern | Count |
|---------|-------|
| `DuelStateSingleton` documented fields (+0xCEC, +0xCF8, +0xD0C, +0xD18, +0xD24, +0xD48, +0xD54, +0xD50, +0xD94) | 9 |
| `PerPlayerRowTable` zone_count cross-player comparison | 4 |
| `PerPlayerRowTable` mla stride + slot array access (`+0x030` or `+0x120`) | 5 |
| `PerPlayerRowTable` mla + extended BSS walk (`+0x1400`, `+0x1D00`) | 2 |
| `DuelQueueState` documented fields (+0x48C, +0x5D4, +0x490 gap) | 3 |
| `DuelStateSingleton` undocumented gap fields (+0xD0, +0xD84, +0xD6C, +0xD58, +0xD98) — init/bitmask funcs | 2 |

**Key observation:** The 400–1200 B tier is even more uniformly tractable than the
<400 B tier. The larger functions in this band tend to have *more* struct references,
which makes them *easier* to classify — every field read anchors another offset.
The one class that might be medium-confidence (the undocumented DSS gap fields at
+0xD0 and +0xD84/D6C) is still deterministic: init functions that write constants
to adjacent words don't have scheduling ambiguity regardless of whether the field
names are in the KB.

---

## Overall Count

| Round | Size band | Examined | Tractable | % |
|-------|-----------|----------|-----------|---|
| 4 | < 400 B | 413 | 297 | 72% |
| 5 | 400–1200 B | 25 | 25 | 100% |
| **Combined** | | **438** | **322** | **73.5%** |
