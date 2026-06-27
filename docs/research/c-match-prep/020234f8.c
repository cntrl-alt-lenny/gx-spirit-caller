/* CAMPAIGN-PREP candidate for func_020234f8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: bind base in one local across Fill32+stores; count read once; do-while scan
 *   risk:       reshape-able: orig recomputes `base + i*0xd0` via `mul r5,r3,0xd0` then reuses r5 offset for all three (add r0,r6,r5 / str r4,[r6,r5]). If mwcc re-muls or fails to reuse the byte offset, ~1-2 insn diverge — fix by hoisting `off=i*0xd0` into a temp.
 *   confidence: med
 */
/* func_020234f8: scan the data_0219a8dc slot array for the first empty
 * (slot[0]==0) entry, bounded by the count at +4. If a free slot is found
 * (index < count), zero it (Fill32 0xd0), store arg0 at slot+0, init via
 * func_02023d88, and return the slot pointer; else return 0.
 *
 * Slot stride 0xd0. Manager: { void *array; int count; } at data_0219a8dc.
 * The base (array ptr) is held in r6 across Fill32 and reused for the post-
 * call stores (bind, do NOT reload). count read once into r5.
 */

typedef struct { unsigned char b[0xd0]; } slot_0219a8dc_t;
typedef struct { slot_0219a8dc_t *array; int count; } mgr_0219a8dc_t;

extern mgr_0219a8dc_t data_0219a8dc;
extern void Fill32(int v, void *dst, int size);
extern int func_02023d88(void *slot);

void *func_020234f8(int arg0) {
    int count = data_0219a8dc.count;
    int i = 0;
    slot_0219a8dc_t *base;
    slot_0219a8dc_t *slot;

    if (count > 0) {
        slot_0219a8dc_t *p = data_0219a8dc.array;
        do {
            if (*(int *)p == 0) break;
            i++;
            p += 1;
        } while (i < count);
    }
    if (i >= count) return 0;

    base = data_0219a8dc.array;
    slot = (slot_0219a8dc_t *)((char *)base + i * 0xd0);
    Fill32(0, slot, 0xd0);
    *(int *)slot = arg0;
    func_02023d88(slot);
    return slot;
}
