/* CAMPAIGN-PREP candidate for func_021abb00 (ov005, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield: u16 :2 member => lsl#30;lsr#30 (not &3); switch->jump-table (cmp#3;addls pc); shifted-and fold (diff<<16)&0x01ff0000; ldrsh signed f0e
 *   risk:       Per-arm op order: orig loads f30 into r3 before computing diff, masks &0xff after the sub; mwcc may hoist b's mask, shifting one and/ldr per arm (permuter-class scheduling). Struct offsets guessed (struct-guessed).
 *   confidence: med
 */
/* ov005 021abb00 — class D: 2-bit bitfield switch (lsl#30;lsr#30) + MMIO
 * store-order. 4 arms differ only by target MMIO reg (0x4001010..1c).
 * val = (b&0xff) | (((a&0xff) - sh) << 16 & 0x01ff0000). */

struct Obj021abb00 {
    char pad0[0xe];
    short f0e;        /* 0xe  (ldrsh, signed) */
    char pad1[0x30 - 0x10];
    int f30;          /* 0x30 */
    int f34;          /* 0x34 */
    char pad2[0x5c - 0x38];
    unsigned short sel : 2;  /* 0x5c bits[1:0] — bitfield => lsl#30;lsr#30 (NOT plain &3=and) */
    unsigned short f5c_rest : 14;
};

void func_ov005_021abb00(struct Obj021abb00 *o) {
    unsigned int sel = o->sel;             /* :2 bitfield -> lsl#30;lsr#30 */
    int a = o->f34 & 0xff;
    int b = o->f30 & 0xff;
    int diff = a - o->f0e;                  /* (a&0xff) - (short)f0e */
    int val = b | (((diff << 16)) & 0x01ff0000);

    switch (sel) {
    case 0: *(volatile unsigned int *)0x04001010 = val; break;
    case 1: *(volatile unsigned int *)0x04001014 = val; break;
    case 2: *(volatile unsigned int *)0x04001018 = val; break;
    case 3: *(volatile unsigned int *)0x0400101c = val; break;
    default: break;                         /* bx lr (no store) */
    }
}
