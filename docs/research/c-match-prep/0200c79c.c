/* CAMPAIGN-PREP candidate for func_0200c79c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     idx*0x58 mul-index off base[0]; tst->bool byte stores in order; bit31 RMW
 *   risk:       reshape-able: byte 0x42/0x43 store-order interleaves with tst#8 in asm; if mwcc reorders, swap the two assignments. struct-guessed: 0x58 stride/base@0 inferred
 *   confidence: med
 */
/* func_0200c79c @ 0x0200c79c (main, class D)
 * mul index (0x58 stride) into base[0], 4 tst->bool byte stores at 0x40..0x43,
 * then OR bit31 into field 0x7c. Negative-idx path clears bit31 of 0x7c.
 *
 * r0 = obj, r1 = idx (signed), r2 = mask bits. returns 1, or 0 if elem==0.
 *
 *   if (idx < 0) { obj->f7c &= ~0x80000000; return 1; }
 *   elem = obj->base + idx*0x58;          // base is *(int*)(obj+0)
 *   if (elem == 0) return 0;
 *   elem->b40 = (mask & 1) != 0;
 *   elem->b41 = (mask & 2) != 0;
 *   elem->b42 = (mask & 4) != 0;
 *   elem->b43 = (mask & 8) != 0;
 *   obj->f7c = (obj->f7c & ~0x80000000) | 0x80000000;  // == set bit31
 *   return 1;
 */

struct Elem0200c79c {
    char _pad[0x40];
    unsigned char b40;   /* 0x40 */
    unsigned char b41;   /* 0x41 */
    unsigned char b42;   /* 0x42 */
    unsigned char b43;   /* 0x43 */
};

struct Obj0200c79c {
    struct Elem0200c79c *base;  /* 0x00 : element array base */
    char _pad[0x7c - 4];
    unsigned int f7c;           /* 0x7c */
};

int func_0200c79c(struct Obj0200c79c *obj, int idx, int mask)
{
    struct Elem0200c79c *elem;

    if (idx < 0) {
        obj->f7c &= ~0x80000000u;
        return 1;
    }
    elem = (struct Elem0200c79c *)((char *)obj->base + idx * 0x58);
    if (elem == 0) {
        return 0;
    }
    elem->b40 = (unsigned char)((mask & 0x1) != 0);
    elem->b41 = (unsigned char)((mask & 0x2) != 0);
    elem->b42 = (unsigned char)((mask & 0x4) != 0);
    elem->b43 = (unsigned char)((mask & 0x8) != 0);
    obj->f7c = (obj->f7c & ~0x80000000u) | 0x80000000u;
    return 1;
}
