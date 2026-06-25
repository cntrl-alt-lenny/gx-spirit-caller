/* CAMPAIGN-PREP candidate for func_02024024 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: clone of 020234f8; bind base across Fill32+stores; count once; do-while scan
 *   risk:       reshape-able: same as 020234f8 — orig reuses the `mul r5,r3,0x88` byte offset for all three post-call addresses (add r0,r6,r5 / str r4,[r6,r5]). If mwcc re-multiplies or drops the offset-reuse, ~1-2 insn; hoist `off=i*0x88`.
 *   confidence: med
 */
/* func_02024024: clone of func_020234f8 with data_0219a8e4 (slot stride 0x88)
 * and init helper func_02024368. Scan for first empty slot bounded by count
 * at +4; if found, zero (Fill32 0x88), store arg0 at slot+0, init, return
 * slot; else return 0.
 *
 * Manager { void *array; int count; }. Base bound in r6 across Fill32 and
 * reused for the stores; count read once into r5.
 */

typedef struct { unsigned char b[0x88]; } slot_0219a8e4_t;
typedef struct { slot_0219a8e4_t *array; int count; } mgr2_0219a8e4_t;

extern mgr2_0219a8e4_t data_0219a8e4;
extern void Fill32(int v, void *dst, int size);
extern int func_02024368(void *slot);

void *func_02024024(int arg0) {
    int count = data_0219a8e4.count;
    int i = 0;
    slot_0219a8e4_t *base;
    slot_0219a8e4_t *slot;

    if (count > 0) {
        slot_0219a8e4_t *p = data_0219a8e4.array;
        do {
            if (*(int *)p == 0) break;
            i++;
            p += 1;
        } while (i < count);
    }
    if (i >= count) return 0;

    base = data_0219a8e4.array;
    slot = (slot_0219a8e4_t *)((char *)base + i * 0x88);
    Fill32(0, slot, 0x88);
    *(int *)slot = arg0;
    func_02024368(slot);
    return slot;
}
