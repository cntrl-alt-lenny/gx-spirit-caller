/* CAMPAIGN-PREP candidate for func_021ac2ac (ov008, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D store-order: volatile MMIO RMW in exact asm sequence; literal reg addrs; bic+orr masks
 *   risk:       reshape-able (store-order/bind): the first reg's two loads (orig ldr ip;ldr r0;ldr r2 = two reads of same addr held in ip) and the `0400104a - 0x4a` base-derivation must reload exactly; double-read vs CSE is the likely diverge.
 *   confidence: low
 */
/* func_ov008_021ac2ac — MMIO register-bank read-modify-write setup. Pure
 * store-order over volatile hardware regs; addrs are literal constants. */
extern unsigned char data_ov008_021b2dc0[];
extern void func_0208e2f4(int, int, int);
extern void func_02094504(void *, int, int);

#define REG_4001000 (*(volatile unsigned int  *)0x04001000)
#define REG_400104a (*(volatile unsigned short *)0x0400104a)
#define REG_4001000h6 (*(volatile unsigned int *)(0x0400104a - 0x4a))

void func_ov008_021ac2ac(void) {
    unsigned int  v;
    unsigned short h;
    func_02094504(data_ov008_021b2dc0, 0, 8);
    v = REG_4001000;
    v = (REG_4001000 & ~0x1f00u)
        | ((((REG_4001000 & 0x1f00u) >> 8) & ~0x2u | 0x8u) << 8);
    REG_4001000 = v;
    func_0208e2f4(0x04001000 + 0x50, 0x10, 0x10 - 0x18);
    h = *(volatile unsigned short *)0x0400104a;
    *(volatile unsigned short *)0x0400104a = (h & ~0x3f00u) | 0x3000u;
    h = *(volatile unsigned short *)0x0400104a;
    *(volatile unsigned short *)0x0400104a = (h & ~0x3fu) | 0x1fu;
    *(volatile unsigned int *)0x04001000 =
        (*(volatile unsigned int *)0x04001000 & ~0xe000u) | 0x8000u;
    *(unsigned short *)(data_ov008_021b2dc0 + 6) =
        (*(unsigned short *)(data_ov008_021b2dc0 + 6) & ~0xffu) | 0x1a;
}
