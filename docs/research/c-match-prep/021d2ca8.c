/* CAMPAIGN-PREP candidate for func_021d2ca8 (ov011, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store fields in order; bic guards; conditional call; dead stack stores
 *   risk:       the four stack stores (order 0x8,0xc,0x0,0x4) are dead from C's view; mwcc will likely elide them or reorder -> store-order/dead-store divergence. reshape-able only if a real callee consumes the scratch (struct-guessed)
 *   confidence: low
 */
/* func_ov011_021d2ca8: setter. Stash two params into the object, clear a
 * flag at +0x34, and if a worker handle at +0x20 is live, invoke it (locked)
 * and null it. Finally clear bit 0x100 at +0x40.
 * The orig also writes the two params into a 0x10-byte stack scratch in the
 * order [sp+0x8],[sp+0xc],[sp+0x0],[sp+0x4] (high pair first) — modelled as a
 * local pair-of-pairs so the dead stores are emitted in that order. */
extern void Task_InvokeLocked(void *p);

typedef struct { int a, b; } Pair;

void func_ov011_021d2ca8(void *obj, int p1, int p2) {
    char *o = (char *)obj;
    Pair hi;     /* sp+0x8 / sp+0xc */
    Pair lo;     /* sp+0x0 / sp+0x4 */
    void *h;

    *(int *)(o + 0x2c) = p1;
    *(int *)(o + 0x30) = p2;
    *(unsigned int *)(o + 0x34) &= ~0x1;
    h = *(void **)(o + 0x20);
    hi.a = p1; hi.b = p2;
    lo.a = p1; lo.b = p2;
    if (h != 0) {
        Task_InvokeLocked(h);
        *(void **)(o + 0x20) = 0;
    }
    *(unsigned int *)(o + 0x40) &= ~0x100;
}
