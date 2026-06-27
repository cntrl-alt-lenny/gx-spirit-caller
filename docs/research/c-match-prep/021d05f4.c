/* CAMPAIGN-PREP candidate for func_021d05f4 (ov004, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     absolute volatile MMIO ptrs; exact store-order; bic/orr RMW per field
 *   risk:       struct-guessed: trailing func_0208e2f4 arg list (6,-8) and the dead 'sub r2,#0xe' are inferred; wrong signature -> arg-setup diverges. Also volatile RMW ordering of the 0x1ff/0x4c pair vs the gate ldr.
 *   confidence: low
 */
/* func_ov004_021d05f4 (ov004, cls D): MMIO bitfield bic/orr with strict
 * store-order. arg!=0 path programs 0x04001048-block (16-bit regs) then a
 * gate on base0220b500+0x3000+0xc84 selects two strh values, then clears
 * bits at 0x04001000 and calls func_0208e2f4(reg+0x50, 6, -8). arg==0 path
 * clears 0xe000 at 0x04001000 and zeros [+0x50]. The trailing call args 6/-8
 * are inferred (orig derives -8 as 6-0xe). Store order is load-bearing. */

typedef unsigned short u16;
typedef unsigned int   u32;

extern char data_ov004_0220b500[];
extern void func_0208e2f4(volatile u16 *p, int a, int b);

void func_ov004_021d05f4(int enable) {
    volatile u16 *r48  = (volatile u16 *)0x04001048;
    volatile u32 *r00  = (volatile u32 *)0x04001000;
    volatile u16 *r00h = (volatile u16 *)0x04001000;

    if (enable == 0) {
        r00[0] = r00[0] & ~0xe000u;
        r00h[0x50 / 2] = 0;
        return;
    }

    r48[0] = (r48[0] & ~0x3fu) | 0x3f;
    r48[1] = (r48[1] & ~0x3fu) | 0x1f;

    if (*(int *)(data_ov004_0220b500 + 0x3000 + 0xc84) != 0) {
        *(volatile u16 *)((char *)r48 - 8) = 0x1ff;
        *(volatile u16 *)((char *)r48 - 4) = 0x4c;
    } else {
        *(volatile u16 *)((char *)r48 - 8) = 0x1ff;
        *(volatile u16 *)((char *)r48 - 4) = 0x64c0;
    }

    r00[0] = (r00[0] & ~0xe000u) | 0x2000;
    func_0208e2f4((volatile u16 *)((char *)r00 + 0x50), 6, -8);
}
