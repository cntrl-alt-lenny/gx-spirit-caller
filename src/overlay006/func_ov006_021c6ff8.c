/* CAMPAIGN-PREP candidate for func_021c6ff8 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Paired MMIO RMW exact store-order; separate reg reads; ptr-getters not bound.
 *   risk:       4 halfword RMW to +0/+2: mwcc may CSE the two reg[0] reads or reorder the +0 vs +2 store pair vs orig ldrh/strh interleave. reshape-able (keep reads separate, preserve store order).
 *   confidence: med
 */
/* func_ov006_021c6ff8 (ov006, D) - paired MMIO bic/orr setup (regs +0/+2 at
 * 0x0400000c, store-order), then a linear VRAM/DMA config sequence using two
 * base-pointer getters. Returns 1. */
extern char data_020b4728[];
extern void func_02001d0c(void *p, int a, int b);
extern void func_02001e94(void *p, int a, int b, int c);
extern int  func_0208e014(void);
extern int  func_0208e120(void);
extern void func_0208ffec(void *p, int a, int b);
extern int  func_02094504(int a, int b, int c);

int func_ov006_021c6ff8(char *obj) {
    volatile unsigned short *reg = (volatile unsigned short *)0x0400000c;
    reg[0] = reg[0] & ~3;
    reg[0] = (reg[0] & 0x43) | 0xe00;
    reg[1] = reg[1] & ~3;
    reg[1] = (reg[1] & 0x43) | 0xf00;
    func_02094504(0, func_0208e120(), 0x800);
    func_02094504(0, func_0208e014(), 0x800);
    func_02001d0c(obj + 4, 0x20, 3);
    func_02001e94(obj + 4, func_0208e120(), 1, 1);
    func_02001d0c(obj + 4, 0x20, 2);
    func_02001e94(obj + 4, func_0208e014() + 0x580, 0x61, 2);
    func_02001d0c(obj + 4, 0x13, 0x13);
    func_02001e94(obj + 4, func_0208e014() + 0xd8, 0xa1, 2);
    func_0208ffec(data_020b4728, 0x20, 0x20);
    func_0208ffec(data_020b4728, 0x40, 0x20);
    return 1;
}
