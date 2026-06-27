/* CAMPAIGN-PREP candidate for func_021b4f1c (ov019, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch returns input n or const; unsigned>= (movcs); n>7 ==45 special
 *   risk:       reshape-able: default/cases 0,1,2,5 must return n unchanged (orig 'bx lr' passthrough) — if mwcc zero-inits a result var instead, diverges; case6/7 split (>C then ==C&&y>=C2) may fold to one cmp. Use unsigned ops to hold movcs/movhi.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov019_021b4f1c (ov019, class D) — brief 494.
 * UNVERIFIED build-free draft. recipe: switch(n=[r0+0xc0]) jump-table returning
 * the input n by default, or a constant when a sub-condition (unsigned >=) holds.
 * n>7 branch: special-case n==45 -> 0x49. Uses unsigned compares (movcs/movhi).
 */
extern int data_02104f4c[];   /* +0x928, +0x92c counters */

struct Obj4f1c { char _pad[0xc0]; int sel; };

#define D(off) (*(unsigned int *)((char *)data_02104f4c + (off)))

int func_ov019_021b4f1c(struct Obj4f1c *o) {
    int n = o->sel;
    if (n > 7) {
        if (n == 0x2d) return 0x49;
        return n;
    }
    switch (n) {
    case 3:
        if (D(0x928) >= 0x24) return 0x4a;
        return n;
    case 4:
        if (D(0x928) >= 0x29) return 0x5e;
        return n;
    case 6:
        if (D(0x928) > 0x17) return 0x4b;
        if (D(0x928) == 0x17 && D(0x92c) >= 4) return 0x4b;
        return n;
    case 7:
        if (D(0x928) > 0x2b) return 0x3f;
        if (D(0x928) == 0x2b && D(0x92c) >= 3) return 0x3f;
        return n;
    default:
        return n;
    }
}
