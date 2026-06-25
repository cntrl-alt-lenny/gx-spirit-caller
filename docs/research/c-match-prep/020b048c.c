/* CAMPAIGN-PREP candidate for func_020b048c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: hold lo/hi as 64-bit pair (r9/r8); declare ten,zhi,zr5,zr4 to match r6/fp/r5/r4 zero-regs; reverse via two ptrs
 *   risk:       permuter-class: the do-loop holds value-lo/hi in r9/r8 and three zero constants in fp/r5/r4 across the body; mwcc will likely re-materialize zeros and pick different call-result regs. Quotient hi-in-r1 retrieval is also unmodelable in plain C.
 *   confidence: low
 */
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned int u32;

struct Num {
    u8  flag0;   /* 0x0 */
    u8  pad1;
    s16 exp;     /* 0x2 */
    u8  len;     /* 0x4 */
    u8  digits[1];/* 0x5 */
};

/* 64-bit divmod helpers: lo=r0,hi=r1,dlo=r2,dhi=r3 */
extern u32 func_020b3814(u32 lo, u32 hi, u32 dlo, u32 dhi);            /* remainder lo */
extern u32 func_020b3808(u32 lo, u32 hi, u32 dlo, u32 dhi);            /* quotient (lo in r0, hi in r1) */

extern void func_020b048c(struct Num *p, u32 lo, u32 hi);

void func_020b048c(struct Num *p, u32 lo, u32 hi) {
    p->flag0 = 0;
    p->len = 0;
    if (hi != 0 || lo != 0) {
        int ten = 10;
        int zhi = 0;
        int zr5 = 0;
        int zr4 = 0;
        do {
            u8 oldlen = p->len;
            u8 dig;
            p->len = oldlen + 1;
            dig = (u8)func_020b3814(lo, hi, ten, zhi);
            p->digits[oldlen] = dig;
            {
                u32 q = func_020b3808(lo, hi, 10, 0);
                hi = ((u32 *)&q)[1]; /* hi returned in r1 */
                lo = q;
            }
        } while (hi != (u32)zr5 || lo != (u32)zr4);
    }
    {
        u8 *lo_p = &p->digits[0];
        u8 *hi_p = &p->digits[p->len] - 1;
        while ((unsigned)lo_p < (unsigned)hi_p) {
            u8 a = *hi_p;
            u8 b = *lo_p;
            *lo_p++ = a;
            *hi_p-- = b;
        }
    }
    p->exp = (s16)(p->len - 1);
}
