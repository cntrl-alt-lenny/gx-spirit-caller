/* CAMPAIGN-PREP candidate for func_02283bc8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-assign max (movgt); goto-shared skip; dual bases bound to slot/row locals
 *   risk:       reshape-able: orig binds slot ptr in r6 and row ptr in r7 (both pre-incremented +0x14/+0x2c), counter in r4, max in r5; if mwcc reindexes via i*stride instead of pointer-walk the addressing instrs flip.
 *   confidence: med
 */
/* func_ov002_02283bc8 (ov002, class C) — loop, dual mla bases, guard call, max via field.
 * Walk up to 5 slots of player idx; for each non-empty slot that passes the optional
 * guard, track the max of the second-array field at +0x28. Returns max (init -1). */
typedef unsigned int u32;

struct Slot3bc8 { u32 id : 13; char pad[16]; };   /* 0x14 */

extern char data_ov002_022cd524[];
extern char data_ov002_022cf16c[];
extern int  func_ov002_021be4a0(int idx, int i, int one);

int func_ov002_02283bc8(int idx, int limit, int flag) {
    struct Slot3bc8 *slot =
        (struct Slot3bc8 *)(data_ov002_022cf16c + (idx & 1) * 0x868 + 0x30);
    char *row = data_ov002_022cd524 + idx * 0xdc;
    int best = -1;
    int i;
    for (i = 0; i <= 4; i++) {
        int v;
        if (i == limit) goto next;
        if (slot[i].id == 0) goto next;
        if (flag != 0) {
            if (func_ov002_021be4a0(idx, i, 1) == 0) goto next;
        }
        v = *(int *)(row + i * 0x2c + 0x28);
        if (v > best) best = v;
    next: ;
    }
    return best;
}
