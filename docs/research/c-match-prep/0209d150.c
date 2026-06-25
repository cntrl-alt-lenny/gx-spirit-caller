/* CAMPAIGN-PREP candidate for func_0209d150 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     INIT byte-store order; independent absolute-addr stores (no base-fold)
 *   risk:       mwcc -O4 may CSE the common high address into one pool base+offset (folds the 9 separate words) — main divergence risk
 *   confidence: med
 */
/* file: src/main/func_0209d150.c  (default mwcc 2.0/sp1p5)
 * Frameless leaf, plain `bx lr` => default .c (sp1p5/sp2p3 identical for
 * a no-frame leaf). Cartridge-command writer: spin while ROMCTRL
 * (0x040001a4) bit31 (busy) is set, raise the command byte at
 * 0x040001a1=0xC0, then write w0 big-endian into 0x040001a8..ab and w1
 * big-endian into 0x040001ac..af via 8 byte ports. Each port is its own
 * pool word in the orig => write each as an INDEPENDENT absolute-address
 * volatile store (no shared base variable) so mwcc emits 9 separate pool
 * loads instead of folding base+offset. Stores in exact asm order. */

void func_0209d150(unsigned w0, unsigned w1) {
    while (*(volatile unsigned *)0x040001a4 & 0x80000000) {
        /* wait for ROMCTRL not busy */
    }
    *(volatile unsigned char *)0x040001a1 = 0xc0;
    *(volatile unsigned char *)0x040001a8 = (unsigned char)(w0 >> 24);
    *(volatile unsigned char *)0x040001a9 = (unsigned char)(w0 >> 16);
    *(volatile unsigned char *)0x040001aa = (unsigned char)(w0 >> 8);
    *(volatile unsigned char *)0x040001ab = (unsigned char)(w0);
    *(volatile unsigned char *)0x040001ac = (unsigned char)(w1 >> 24);
    *(volatile unsigned char *)0x040001ad = (unsigned char)(w1 >> 16);
    *(volatile unsigned char *)0x040001ae = (unsigned char)(w1 >> 8);
    *(volatile unsigned char *)0x040001af = (unsigned char)(w1);
}
