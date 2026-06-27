/* CAMPAIGN-PREP candidate for func_0202a998 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind base 0x04000000 (r1); +0x1000 inline; 0x1048 via separate literal; exact store order
 *   risk:       reshape-able/permuter-class: orig holds io in r1 across 6 accesses + a separate ip for 0x1048; if mwcc rematerialises 0x04000000 per use (extra movs) or fuses ip into base+0x1048, several ldr/str diverge.
 *   confidence: med
 */
/* func_0202a998 (main, class D): two func_0208c884 calls, then an MMIO RMW
 * sequence in EXACT store order. Base 0x04000000 bound once (used for the u32
 * clear, 0x48/0x4a/0x50 halfwords); 0x04001000 reached as base+0x1000; the
 * 0x04001048 block uses a SEPARATE literal pointer (ip), not base+0x1048.
 * Field RMWs: (x & ~0x3f)|0x20 (low6) and (x & ~0x3f00)|0x2000 (next6). */
extern int func_0208c884(int reg, int v);

int func_0202a998(void) {
    volatile char *io = (volatile char *)0x04000000;   /* r1 base */
    volatile char *b  = (volatile char *)0x04001048;   /* ip, separate literal */

    func_0208c884(0x0400006c, 0);
    func_0208c884(0x0400106c, 0);

    *(volatile unsigned *)io          &= ~0xe000;
    *(volatile unsigned *)(io + 0x1000) &= ~0xe000;

    *(volatile unsigned short *)(io + 0x48) = (*(volatile unsigned short *)(io + 0x48) & ~0x3f)   | 0x20;
    *(volatile unsigned short *)(io + 0x48) = (*(volatile unsigned short *)(io + 0x48) & ~0x3f00) | 0x2000;
    *(volatile unsigned short *)(io + 0x4a) = (*(volatile unsigned short *)(io + 0x4a) & ~0x3f)   | 0x20;

    *(volatile unsigned short *)b       = (*(volatile unsigned short *)b       & ~0x3f)   | 0x20;
    *(volatile unsigned short *)b       = (*(volatile unsigned short *)b       & ~0x3f00) | 0x2000;
    *(volatile unsigned short *)(b + 2) = (*(volatile unsigned short *)(b + 2) & ~0x3f)   | 0x20;

    *(volatile unsigned short *)(io + 0x50) = 0;
    *(volatile unsigned short *)(b + 8)     = 0;
    return 1;
}
