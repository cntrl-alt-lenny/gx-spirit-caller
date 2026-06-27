/* CAMPAIGN-PREP candidate for func_021b2644 (ov014, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order: clear ~0x1f00 on both MMIO regs in sequence (bind r1=0x4000000, r2=r1+0x1000); guard if-chains; calls in asm order; return 1
 *   risk:       Orig derives regB as r1+0x1000 (add) from the shared 0x4000000 base in r1, not a fresh literal; if mwcc loads 0x4001000 as its own constant the add becomes an ldr (reshape-able: regB = (char*)regA + 0x1000). f44/f2c offsets guessed (struct-guessed).
 *   confidence: med
 */
/* ov014 021b2644 — class D: init, MMIO clear (~0x1f00 on 0x4000000/0x4001000)
 * + guard branches. Returns 1. */

extern unsigned char data_ov014_021b5040[];   /* _LIT0: struct base, +0x44 read, *base=3 store */
extern unsigned char data_ov014_021b5088[];   /* _LIT3 */
extern unsigned char data_ov014_02235094[];   /* _LIT1: struct base, +0x2c read */
extern unsigned char data_ov014_022350f4[];   /* _LIT2 */
extern int func_02001ba4(void);
extern int func_02005c60(int a);
extern int func_02006918(void);
extern int func_0202af40(void);
extern int func_0202c1ac(void);
extern int func_ov005_021ad030(void *p, int flags);
extern int func_ov014_021b280c(void *p);
extern int func_ov014_021b3fc4(void *p);

struct Cfg021b5040 {
    int pad[0x44 / 4];  /* up to 0x44 */
    int f44;            /* 0x44 */
};
struct Cfg02235094 {
    int pad[0x2c / 4];  /* up to 0x2c */
    int f2c;            /* 0x2c */
};

int func_ov014_021b2644(void) {
    volatile unsigned int *regA = (volatile unsigned int *)0x4000000;
    volatile unsigned int *regB = (volatile unsigned int *)0x4001000;
    struct Cfg021b5040 *cfg0 = (struct Cfg021b5040 *)data_ov014_021b5040;
    struct Cfg02235094 *cfg1 = (struct Cfg02235094 *)data_ov014_02235094;

    *regA = *regA & ~0x1f00;
    *regB = *regB & ~0x1f00;

    if (cfg0->f44 == 0) {
        func_ov014_021b280c(data_ov014_02235094);
        func_ov014_021b3fc4(data_ov014_022350f4);
    }

    func_02005c60(2);
    func_02005c60(1);
    func_02001ba4();

    if (cfg1->f2c != 0) {
        func_ov005_021ad030(data_ov014_021b5088, 0x80000);
        *(int *)data_ov014_021b5040 = 3;
    } else {
        func_0202c1ac();
        func_0202af40();
        func_02006918();
    }
    return 1;
}
