/* CAMPAIGN-PREP candidate for func_021c669c (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     MMIO RMW via volatile u16*; bind base reg in r3 (single reg local).
 *   risk:       orig does orr#0x218 then orr#0x400 (two imms). mwcc folds 0x218|0x400=0x618 then re-splits; split order may differ. reshape-able (write |0x618, or swap the two | terms to flip split order).
 *   confidence: med
 */
/* func_ov006_021c669c (ov006, D) - MMIO bic/orr setup then a linear DMA/VRAM
 * config sequence. Reg at 0x0400100e: clear bits0,1 set bit1; reload, mask
 * #0x43, set 0x218|0x400; word at +0xe = 0. Returns 1. */
extern char data_ov006_021cb7e0[];
extern char data_ov006_021cb800[];
extern void func_02001d0c(void *p, int a, int b);
extern void func_02001e94(void *p, int a, int b, int c);
extern int  func_0208dd9c(void);
extern int  func_0208df94(void);
extern void func_0208ff84(void *p, int a, int b);
extern int  func_02094504(int a, int b, int c);

int func_ov006_021c669c(char *obj) {
    volatile unsigned short *reg = (volatile unsigned short *)0x0400100e;
    *reg = (*reg & ~3) | 2;
    *reg = (*reg & 0x43) | 0x218 | 0x400;
    *(volatile unsigned int *)(0x0400100e + 0xe) = 0;
    func_02094504(0, func_0208df94(), 0x800);
    func_02001d0c(obj + 8, 0x20, 3);
    func_02001e94(obj + 8, func_0208df94(), 2, 4);
    func_02001d0c(obj + 8, 0x20, 0x12);
    func_02001e94(obj + 8, func_0208df94() + 0xc0, 0x62, 5);
    func_02094504(0, func_0208dd9c() + 0x40, 0xc00);
    func_02094504(0, func_0208dd9c() + 0xc40, 0x4800);
    func_0208ff84(data_ov006_021cb7e0, 0x80, 0x20);
    func_0208ff84(data_ov006_021cb800, 0xa0, 0x20);
    return 1;
}
