[//]: # (markdownlint-disable MD013 MD041)

# ov002 E/F Re-triage

Re-assessment of 980 ov002 E/F class `.s` funcs using the round-1–3 KB
(struct layouts, data-table catalogs, constants). The original classification was
done before the KB existed; many "scheduling coin-flip" verdicts were actually
"unknown struct offset" verdicts.

> Branch: `kb/retriage`
> Read-only analysis — no src/ changes.

---

## Methodology

1. Grep known struct/data-table addresses (`022d016c`, `022cf16c`, `022ce288`,
   `022c357c`, `022cad38`, `022be1ac`) in all 980 ov002 E/F `.s` files.
2. 747 of 980 access at least one known struct — the rest are pure dispatch/math.
3. Filter to size < 300 B + non-"coin-flip"-labeled + non-never-tier → 142 candidates.
4. Read sample `.s` files; apply KB field knowledge to re-assess tractability.

---

## Summary

| Metric | Count |
|--------|-------|
| Total ov002 E/F funcs | 980 |
| Struct-accessing E/F (any known global) | 747 |
| Small (<300 B) non-coin-flip struct-accessing | 142 |
| **Newly tractable (definite)** | **~12** |
| **Newly tractable (KB gap required)** | **~68** |
| Remains intractable (never / large / pure coin-flip) | ~900 |

---

## Pattern Categories

| Pattern | Count | Verdict |
|---------|-------|---------|
| CardHandlerTable dispatch (size < 120 B) | 2 | **Tractable** — table layout known |
| DSS fn-ptr dispatch via undocumented index fields | ~30 | Tractable once DSS+0xD2C/D30 documented |
| PerPlayerRowTable loop + bitfield scan | 225 | Mixed — loop size is true blocker for most |
| DuelQueueState event-sequence (single-path) | ~40 | Tractable when queue fields are known |
| Nested-loop with mla-base + multiple blx callbacks | ~400 | Permuter-class — blx staging is true coin-flip |
| Never tier (recursive / float / 89 permuter-marked) | 89 | Intractable |
| Explicitly "coin-flip" labeled | 12 | Intractable |

---

## Newly Tractable Funcs

### 0x0225368C (92 bytes, class E)

**Original verdict:** `low` — "blx through function-pointer table, post-call rotation"

**Upgrade reason:** `data_ov002_022cad38` is the CardHandlerTable (now fully
catalogued: ~390 entries, 8-byte records `{fn_ptr handler; u32 id}`).
`func_ov002_02253638` is the table-search helper; `data_ov002_022cdc78+0xC`
is a state counter. The "post-call rotation" is a fixed save/restore, not a
register coin-flip.

**Struct/data needed:** CardHandlerTable (`docs/research/data/CardHandlerTable.md`),
`data_ov002_022cdc78` (a small state struct — `+0xC` is used as a counter).

**Recipe sketch:**

```c
int func_ov002_0225368C(int arg0, u16 arg1, int arg2) {
    int idx = func_ov002_02253638(arg1);   /* binary search → record index */
    if (idx >= 0) {
        /* CardHandlerTable records: {fn_ptr handler; u32 id} */
        typedef int (*HandlerFn)(int, u16, int);
        HandlerFn fn = (HandlerFn)data_ov002_022cad38[idx].handler;
        fn(arg0, arg1, arg2);
    }
    return 0;  /* data_022cdc78.f_c unchanged if idx < 0 */
}
```

**Levers:** mwcc2.0/sp1p5 default; CardHandlerTable record layout must be
`{fn_ptr; id}` (fn_ptr at word 0) — note the KB doc may have it inverted.

**KB gap:** `data_ov002_022cdc78` struct needs a field at `+0x0C`.

---

### 0x022536E8 (96 bytes, class E)

**Original verdict:** `low` — "blx through fptr table, save/diff state, rotation"

**Upgrade reason:** Same CardHandlerTable dispatch as 0225368C, plus save/restore
of `data_022cdc78+0xC` to detect side-effect. Pattern is deterministic.

**Struct/data needed:** Same as 0225368C + `data_ov002_022cdc78+0xC` as int counter.

**Recipe sketch:**

```c
int func_ov002_022536E8(int arg0, u16 arg1, int arg2) {
    int idx = func_ov002_02253638(arg1);
    int saved_fc = data_ov002_022cdc78.f_c;
    if (idx >= 0) {
        typedef int (*HandlerFn)(int, u16, int);
        HandlerFn fn = (HandlerFn)data_ov002_022cad38[idx].handler;
        fn(arg0, arg1, arg2);
    }
    int new_fc = data_ov002_022cdc78.f_c;
    data_ov002_022cdc78.f_c = saved_fc;
    return new_fc - saved_fc;  /* delta: 0 if handler wasn't called */
}
```

**Levers:** Same as 0225368C. The sub-return is the key shape.

---

### 0x022627AC (88 bytes, class E)

**Original verdict:** `low` — "blx through function pointer table; post-blx flow"

**Upgrade reason:** Accesses `DuelStateSingleton+0xD2C` (undocumented index field)
and uses it to index an fn-ptr array `data_ov002_022cb96c`. The post-blx reload
of DSS is deterministic (r0-r3 are caller-saved, DSS is reloaded from literal pool).
The "coin-flip" label was incorrect — there is no scheduling choice here since
no callee-saved regs are used.

**KB gap:** Two new DSS fields: `+0xD2C` (int, fn-ptr-array index) and
`+0xD30` (int, presumably a flag or counter). Also `data_ov002_022cb96c` is an
undocumented fn-ptr array (indexed by DSS.f_d2c).

**Recipe sketch:**

```c
/* DSS fields needed: f_d2c (int index), f_d30 (int flag) */
int func_ov002_022627AC(void) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    int idx = dss->f_d2c;
    void (*fn)(void) = data_ov002_022cb96c[idx];
    if (fn == NULL) return 1;
    if (fn() != 0) {
        dss->f_d30 = 0;
        dss->f_d2c++;
    }
    return 0;
}
```

**Levers:** mwcc2.0/sp1p5 default; r3 saved (alignment pad for `ldmia sp, {r3,pc}`).

---

## Conditional Tractable Class: PerPlayerRowTable Loop Funcs

The 225 PerPlayerRowTable loop funcs fall into two sub-classes:

### Class PPT-A: counted scan + single call (tractable)

These iterate over `Ov002FieldZone.slots[5]` with stride `0x14`, test
`slot.id_lo13` or `slot.f_0e`, and make a single conditional call.
With the PPT layout now documented, the C skeleton is clear.

Representative candidates (50–200 B range, single blx):

```
02246ecc  156 B   mla index counted loop, bitfield extract, one call
02251ec0  176 B   counted scan loop, bitfield + multi-guard liveness
02263648  132 B   eor discriminant loop, bit-pack to call
```

Pattern:

```c
/* prototype — exact arg/return types need per-func verification */
int func_ov002_XXXXXXXX(int player) {
    Ov002FieldZone *zone = &data_ov002_022cf16c[player & 1];
    for (int i = 0; i < zone->zone_count; i++) {
        Ov002Slot *slot = &zone->slots[i];
        if ((slot->id_lo13 != 0) && (slot->f_0e != 0)) {
            return some_func(slot, ...);
        }
    }
    return -1;
}
```

**Tractability gate:** `Ov002Slot.id_lo13 : 13` bitfield shape
(`lsl #19; lsr #19` — NOT `& 0x1FFF`) is the match-critical detail.

**Estimated new candidates in this class: ~30–40 funcs.**

### Class PPT-B: nested loops with mla + multiple blx (permuter-class)

Funcs with mla-base indexing, 2+ blx callbacks, and many live regs remain
permuter-class regardless of struct knowledge. The coin-flip is in register
staging across the blx boundaries, not in struct offset confusion.

Representative intractables: `0227dd6c` (140B), `0228c924` (152B), `02257750` (140B).

---

## DuelStateSingleton Access: New Field Discoveries

Scanning ov002 E/F `.s` files found DSS fields NOT yet in `DuelStateSingleton.md`:

| Offset | Observed use | Function (example) |
|--------|-------------|-------------------|
| `+0xD2C` | fn-ptr-array index (r/w) | `func_ov002_022627ac` |
| `+0xD30` | flag or sub-counter (w) | `func_ov002_022627ac` |
| `+0xD1C` | unknown (adjacent to documented D18 fn-ptr slot) | various |
| `+0xD28` | unknown (adjacent range) | various |

These gaps, once filled in `DuelStateSingleton.md`, unlock the DSS dispatch funcs
in the 88–160 B range.

---

## Confirmed Intractable (representative sample)

| Address | Size | Reason |
|---------|------|--------|
| `0x021b1200` | 84 B | nested loop with blx callback — post-blx staging is true coin-flip |
| `0x02247670` | 120 B | recursive + min reg coin-flip; never-tier |
| `0x022b2660` | 156 B | OAM attr pack with asr/ror — many live regs, never-tier |
| `0x021af5a0` | 1072 B | nested loops + stack array — big body, not tractable |
| `0x021b6600` | 4792 B | 958-insn jump-table switch — huge, accept as `.s` |
| `0x0229ad88` | 88 B | explicitly never-tier: permuter-class, indirect dispatch |
| `0x02247670` | 120 B | recursive — never-tier |
| `0x0224ae3c` | 124 B | recursive search — never-tier |
| `0x022577dc` | 156 B | mla-base nested loop + blx — coin-flip in blx staging |

---

## Pattern Summary (for campaign triage)

| Pattern | Estimated new tractable | Key unlock |
|---------|------------------------|------------|
| CardHandlerTable dispatch (< 120 B) | 2 | Table layout confirmed |
| DSS fn-ptr dispatch via f_d2c | ~5–10 | Fill DSS+0xD2C/D30 in KB |
| PerPlayerRowTable PPT-A scan (< 250 B, single blx) | ~30–40 | PPT layout + `:13` bitfield |
| DuelQueueState single-path event (< 200 B) | ~10–15 | DQS field names |
| **Total estimated new pool** | **~50–70 funcs** | |

The ~900 remaining ov002 E/F funcs stay as `.s` — their scheduling walls are
genuine register-allocation coin-flips that predate and post-date the KB.
