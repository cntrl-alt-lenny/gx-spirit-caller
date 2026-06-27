/* CAMPAIGN-PREP candidate for func_022859e8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     keep f38 re-read twice (no CSE); strneh pair => predicated stores after cmp!=0
 *   risk:       reshape-able/permuter-class: orig holds slot.id in r5, base in r7, idx in r8, const 0/1 in sl/r9 across loop; the two strneh stores come from `if(call)` predication—if mwcc emits a branch+unconditional store instead of strneh, the tail diverges.
 *   confidence: med
 */
/* func_ov002_022859e8 (ov002, class C) — loop, flag tests, paired strneh stores.
 * For each of 5 slots of player idx: if slot.id:13 != 0, run a guard chain; on the
 * final guard's success clear the +0x36 halfword and set the +0x38 halfword to 1. */
typedef unsigned short u16;
typedef unsigned int   u32;

struct Slot59e8 { u32 id : 13; char pad[2]; u16 f36; u16 f38; char pad2[8]; }; /* 0x14 */

extern char data_ov002_022cf16c[];
extern int  func_0202f9e8(int id);
extern int  func_ov002_021bd948(int idx, int i);
extern int  func_ov002_021c9fc4(int idx);

void func_ov002_022859e8(int idx) {
    struct Slot59e8 *slot =
        (struct Slot59e8 *)(data_ov002_022cf16c + (idx & 1) * 0x868 + 0x30);
    int i;
    for (i = 0; i < 5; i++) {
        u32 id = slot[i].id;
        if (id == 0) continue;
        if (slot[i].f38 == 0) {
            if (func_ov002_021c9fc4(idx) == 0) continue;
        }
        if (slot[i].f38 == 0) {
            if (func_0202f9e8(id) != 0) continue;
        }
        if (slot[i].f36 == 0) continue;
        if (func_ov002_021bd948(idx, i) != 0) {
            slot[i].f36 = 0;
            slot[i].f38 = 1;
        }
    }
}
