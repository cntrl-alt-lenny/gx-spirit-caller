[//]: # (markdownlint-disable MD013 MD041)

# R5 Supplementary Retriage — KB Gap-Fill Unlocks

Round 5 filled several KB gaps that Round 4 flagged as "conditional" blockers.
This doc reassesses exactly those funcs whose original verdict depended on the
now-documented fields.

> Branch: `kb/retriage-round5`
> Companion to [Ov002EFRetriage.md](Ov002EFRetriage.md) and [MainEFRetriage.md](MainEFRetriage.md).

---

## Summary

| Module | Func | Size | Old verdict | New verdict | Gap filled |
|--------|------|------|------------|-------------|-----------|
| main | `func_0204bf44` | 244 B | conditional — GS+0x464/468 unknown | **TRACTABLE** | GS+0x464 (fn_ptr), GS+0x468 (int arg) |
| main | `func_0204ca70` | 444 B | conditional — GS+0x348 + scheduling | **TRACTABLE (needs scheduler)** | GS+0x348 (counter) |
| ov002 | `func_ov002_022627ac` | 52 B | conditional — DSS+0xD2C/D30 unknown | **TRACTABLE** | DSS+0xD2C (index), DSS+0xD30 (flag) |
| ov002 | `func_ov002_021b08a8` | 68 B | conditional — DSS+0xD1C unknown | **TRACTABLE** | DSS+0xD1C (index), DSS+0xD20 (sub-state) |
| ov002 | `func_ov002_02262804` | 220 B | conditional — DSS+0xD2C init unknown | **TRACTABLE** | DSS+0xD2C, DSS+0xD30, DSS+0xD9C |

Total newly tractable: **5 funcs** (2 main, 3 ov002)

---

## Main E/F — Conditional → Tractable

### func_0204bf44  (244 bytes, class F)

**Gap filled:** GameSingleton+0x464 (fn_ptr) and +0x468 (int arg) — now documented.

**Upgrade reason:** The `blx ip` instruction at the end of the main branch loaded
`ip = GS->f464` — an undocumented offset. The round 4 verdict was "coin-flip" because
the indirect call target was unknown. Now that +0x464 is documented as a function
pointer field and +0x468 as its accompanying argument, the entire control flow is
deterministic:

```c
int func_0204bf44(int mode) {
    if (!mode) { func_0204c120(); return 0; }
    func_0204f3c0();
    GameSingleton *gs = func_020498f0();
    u8 phase = gs->f15;                  /* +0x015 — phase code */
    if (phase == 2 || phase == 3) {
        int context = gs->f20c;          /* +0x20C — existing field */
        int flag    = !context;
        context     = func_02049120(context);
        fn_t handler = gs->f464;         /* +0x464 — fn ptr */
        int extra    = gs->f468;         /* +0x468 — int arg */
        return handler(context, 1, flag, extra);
    }
    if (phase == 0 && mode == 1) { func_0204f0a8(0); func_0204aaf4(); return 0; }
    if (phase == 1 && mode == 1) { func_0204cf7c(0, 0, 0); }
    return 0;
}
```

**Levers needed:** standard — the phase conditional ordering (2→3) may need
decl-order or branch-order lever.

---

### func_0204ca70  (444 bytes, class F)

**Gap filled:** GameSingleton+0x348 (counter), +0x1A8 (u8 flag) — now documented.

**Upgrade reason:** Two fields (+0x348 and +0x1A8) were unknown in Round 4, making
the loop body's address arithmetic unresolvable. Both are now filled.

**Remaining concern:** The function calls `func_020498f0()` (GameSingleton getter)
**five separate times** within a single loop iteration, storing results into r6/r7/r8/r9/r0.
mwcc 2.0/sp1p5 does not deduplicate calls across getter calls (pure-function opt is
off), so each redundant call is a scheduling point. This is **genuine scheduling
pressure**, not just a KB gap — multiple getter loads competing for caller-save
registers.

**Verdict:** Tractable at the C level with the right shapes, but requires
scheduler-lever iteration (call-result binding, register reuse across the 5 loads).
Not a trivial match.

```c
int func_0204ca70(void) {
    GameSingleton *gs = func_020498f0();
    int count = gs->fd;                   /* +0x00D — u8, loop bound */
    if (count < 1) goto cleanup;
    for (int i = 1; i <= count; i++) {
        /* 5 getter calls — each a scheduling point */
        GameSingleton *g9 = func_020498f0();
        GameSingleton *g8 = func_020498f0();
        GameSingleton *g7 = func_020498f0();
        GameSingleton *g6 = func_020498f0();
        GameSingleton *g0 = func_020498f0();
        int   counter_ptr = (int)&g6->f348;        /* +0x348 — pass addr of counter */
        int   counter_val = g0->f348 + 1;
        u16   slot_id     = *(u16 *)((u8 *)g7 + i*2 + 0xa4);  /* +0xa4 array */
        int   val_f4      = *(int *)((u8 *)g9 + i*4 + 0xf4);  /* +0xf4 */
        int   val_24      = *(int *)((u8 *)g8 + i*4 + 0x24);  /* +0x024 */
        if (func_0204ead0(i*10, counter_ptr, counter_val, val_f4, val_24, slot_id))
            return 1;
    }
cleanup:
    func_020498f0()->f17 = 0;        /* +0x017 */
    func_020498f0()->f20 = 0;        /* +0x020 */
    func_020498f0()->f1a8 = 1;       /* +0x1A8 — set flag */
    func_02062530(func_020498f0()->f4->f0);  /* vtable call */
    func_020498f0()->f1a8 = 0;       /* +0x1A8 — clear flag */
    return 0;
}
```

**Levers needed:** reg-reuse for 5 getter calls in loop body; may need call-result
binding to a named temp to control which register mwcc assigns each load to.

---

## ov002 E/F — Conditional → Tractable

### func_ov002_022627ac  (52 bytes, class E)

**Gap filled:** DSS+0xD2C (dispatch-table-3 index) and DSS+0xD30 (dispatch flag).

**Upgrade reason:** The `ldr r1, [r2, r1, lsl #0x2]; blx r1` was the original
coin-flip label. Now that +0xD2C is documented as the fn-ptr array index and
`data_022cb96c` as the BSS handler table, the entire function is a straight
dispatch driver — no scheduling ambiguity.

```c
int func_ov002_022627ac(void) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    fn_t handler = data_ov002_022cb96c[dss->f_d2c];
    if (!handler) return 1;
    if (handler()) {
        dss->f_d30 = 0;
        dss->f_d2c++;
    }
    return 0;
}
```

**Levers needed:** none expected — fully deterministic, no scheduling.

---

### func_ov002_021b08a8  (68 bytes, class E)

**Gap filled:** DSS+0xD1C (dispatch-table-2 index) and DSS+0xD20 (sub-state reset).

**Upgrade reason:** `[r0, #0xd1c]` used as array index into `data_022ca998`
was previously an undocumented offset, making the `blx r0` a coin-flip. Now
the pattern is a documented parallel dispatch driver (system 2), identical in
structure to system 3 above.

```c
int func_ov002_021b08a8(void) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    /* Early exit if current CEC slot matches game constant 0x151E */
    if (!func_ov002_021b3ecc(dss->f_cec, 0xb, 0x151e)) {
        fn_t handler = data_ov002_022ca998[dss->f_d1c];
        if (!handler) return 1;
        if (handler()) {
            dss->f_d20 = 0;    /* reset sub-state */
            dss->f_d1c++;      /* advance to next handler */
        }
        return 0;
    }
    if (!func_ov002_022663cc()) return 0;
    return 0;
}
```

**Levers needed:** none expected — standard mwcc conditional layout.

---

### func_ov002_02262804  (220 bytes, class E)

**Gap filled:** DSS+0xD2C, DSS+0xD30, DSS+0xD9C (all now documented).

**Upgrade reason:** This is the dispatch-phase initializer. It sets `f_d2c = 6`
and `f_d30 = 1` to start a new dispatch sequence, then calls `func_022627ac`
(the dispatch driver) when in phase 1. Previously the "stored literal 6 to an
unknown DSS field" was the coin-flip. Now it's a clean phase-init + step.

```c
int func_ov002_02262804(int player, int arg1) {
    DuelStateSingleton *dss = &data_ov002_022d016c;
    int phase = dss->f_d9c;   /* sub-state: 0 = init, 1 = step, else done */
    if (phase == 0) {
        /* Initialize dispatch-3 sequence at slot 6 */
        dss->f_d2c = 6;
        dss->f_d30 = 1;
        func_ov002_021e2cd4(0, 0);
        func_ov002_021e2d20(player, 0x13, 1);
        if (arg1) {
            /* Optional card animation path */
            LocalCtrl *lc = &data_ov002_022cd3f4;
            u16 parity_flag = lc->f_0 ? 0x8000 : 0x0;
            func_ov002_021d479c(parity_flag | 0x1b, lc->f_1c, 1, 0);
        }
        lc->f_14 = 1;
        dss->f_d9c++;
        return 0;
    }
    if (phase == 1) {
        /* Run one dispatch-3 step */
        if (func_ov002_022627ac()) return 0;  /* not done */
        return (dss->f_d2c >= 9) ? 1 : 0;
    }
    return 0;
}
```

**Levers needed:** decl-order for the phase 0 branch; `data_ov002_022cd3f4`
is the `LocalCtrl` sub-struct (symbol at 022CD3F4).

---

## Impact Summary

| Gap filled | Doc updated | Funcs unblocked |
|-----------|-------------|-----------------|
| DSS +0xD1C/D20 | DuelStateSingleton.md | `func_021b08a8` + ~10 funcs that use D1C |
| DSS +0xD2C/D30/D34 | DuelStateSingleton.md | `func_022627ac` + `func_02262804` + ~8 funcs |
| DSS +0xD9C | DuelStateSingleton.md | `func_02262804` specifically |
| GS +0x464/468 | GameSingleton.md | `func_0204bf44` (confirmed tractable) |
| GS +0x348 | GameSingleton.md | `func_0204ca70` (tractable with scheduler) |

The dispatch-table documentation (`FunctionPointerTables.md` sections 8+9)
unlocks all callers of `func_022627ac` and `func_021b08a8` since those drivers
are now understood — any func that calls them as a sub-call can express the
sub-call in C directly.
