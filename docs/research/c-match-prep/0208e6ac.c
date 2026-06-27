/* CAMPAIGN-PREP candidate for func_0208e6ac (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early-return eq-path; store-order (035c before 60 RMW); shifted-or seed c<<8 first; bic field-clear
 *   risk:       the 0x60 RMW: orig reloads reg (ldrh r3) AFTER building the insert value; if mwcc reads reg before building or reorders the &~mask vs the |built, ldrh/orr order diverges. reshape-able (operand/decl-order).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0208e6ac (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 * Two-path MMIO bitfield insert. a==0: clear bits 7/12/13 of reg 0x04000060.
 * a!=0: store arg (4th) to 0x0400035c FIRST, then read-modify-write 0x04000060
 * inserting (c<<8)|(b<<6)|0x80 over the 0x3f40 field (bit7=0x80 always set).
 * STORE-ORDER: the 0x0400035c store precedes the 0x60 RMW; the shifted-or seed
 * is (c<<8) first so r0 is picked there, then |(b<<6) then |0x80, then OR'd with
 * the bic'd reg as orr(bic_reg, built). */
typedef unsigned short u16;

void func_0208e6ac(int a, int b, int c, int d)
{
    if (a == 0) {
        *(volatile u16 *)0x04000060 = *(volatile u16 *)0x04000060 & 0xcf7f;
        return;
    }
    *(volatile u16 *)0x0400035c = (u16)d;
    *(volatile u16 *)0x04000060 =
        (*(volatile u16 *)0x04000060 & ~0x3f40) | ((c << 8) | (b << 6) | 0x80);
}
