/* CAMPAIGN-PREP candidate for func_021c4574 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     MMIO RMW two strh in order, capture-then-pass each call's helper result
 *   risk:       TRUNCATED asm (tail past 3rd func_0208ff84 cut) + struct-guessed reg layout (the +0xe store width and LIT3 target unconfirmed). reshape-able body but tail/return unverifiable from given asm.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov006_021c4574 (ov006, class D) — brief 494.
 * UNVERIFIED build-free + TRUNCATED asm (size 332, tail cut after LIT3 calls).
 * linear MMIO setup, bic/orr store-order. RMW halfword reg data_021cb6f8:
 *  v = (v & ~3) | 2; store; v = (v & 0x43) | 0x218 | 0x400; store; [+0xe]=0;
 * then linear call chain (func_0208df94 capture, func_02094504 fills,
 *  func_02001d0c/func_02001e94 channel setup on self+0x10, func_0208dd9c bases,
 *  func_0208ff84 on data_021cb778/798 tables).
 * recipe: store-order on MMIO RMW (two strh in order), capture-then-pass call args.
 */
typedef unsigned short u16;
extern u16  data_ov006_021cb6f8[];        /* MMIO-ish reg block; [0]=ctrl, +0xe word */
extern int  data_ov006_021cb778;
extern int  data_ov006_021cb798;
extern int  func_02001d0c(void *p, int a, int b);
extern int  func_02001e94(void *p, int a, int b, int c);
extern int  func_0208dd9c(void);
extern int  func_0208df94(void);
extern int  func_0208ff84(void *p, int a, int b);
extern int  func_02094504(int a, int b, int c);

int func_ov006_021c4574(char *self) {
    u16 *reg = data_ov006_021cb6f8;
    reg[0] = (u16)((reg[0] & ~3) | 2);
    reg[0] = (u16)((reg[0] & 0x43) | 0x218 | 0x400);
    *(int *)((char *)reg + 0xe) = 0;
    func_02094504(0, func_0208df94(), 0x800);
    func_02001d0c(self + 0x10, 0xd, 3);
    func_02001e94(self + 0x10, func_0208df94(), 2, 4);
    func_02001d0c(self + 0x10, 0x13, 3);
    func_02001e94(self + 0x10, func_0208df94() + 0x1a, 0x29, 5);
    func_02001d0c(self + 0x10, 0x20, 3);
    func_02001e94(self + 0x10, func_0208df94() + 0x540, 0x62, 6);
    func_02094504(0, func_0208dd9c() + 0x40, 0x4e0);
    func_02094504(0, func_0208dd9c() + 0x520, 0x720);
    func_02094504(0, func_0208dd9c() + 0xc40, 0xc00);
    func_0208ff84(&data_ov006_021cb778, 0x80, 0x20);
    func_0208ff84(&data_ov006_021cb798, 0xa0, 0x20);
    /* TRUNCATED: one more func_0208ff84(data_021cb6f8?, 0xc0, 0x20) + return */
    return 1;
}
