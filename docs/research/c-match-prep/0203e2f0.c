/* CAMPAIGN-PREP candidate for func_0203e2f0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch->jump-table; r5 pre-init=9; 2-bit hi bitfield gives lsl#24;lsr#30
 *   risk:       struct-guessed (0xd0c/0xd0e/0xd13/0x444 offsets inferred); also mwcc may emit cmp-chain not addls pc jump-table for the sparse 0/4/7/10/12/13 cases (permuter-class/escape).
 *   confidence: low
 */
/* func_0203e2f0 — dispatcher on func_0207b5f8() return, returns status in r5.
 * Class D: jump-table (addls pc,pc,r0,lsl#2) + 2-bit bitfield at byte 0xd0c bits[7:6]. */
extern int  func_0203c900(int);   /* (0x10) -> ctx* */
extern int  func_0207b5f8(void);  /* dispatch selector 0..0xc */
extern void func_0203e9ac(int);
extern void func_0203c85c(int);
extern void func_0207b62c(void);
extern void func_0207b888(void);
extern void func_0207bc20(void);

typedef struct Ctx {
    unsigned char _pad0[0xd0c];
    unsigned char f_d0c_lo6 : 6;   /* byte 0xd0c bits[5:0] */
    unsigned char f_d0c_hi2 : 2;   /* byte 0xd0c bits[7:6] -> lsl#24;lsr#30 */
    unsigned char _pad1;           /* 0xd0d */
    unsigned char f_d0e;           /* 0xd0e selector */
    unsigned char _pad2[0xd13 - 0xd0f];
    unsigned char f_d13;           /* 0xd13 index */
    unsigned char _pad3[0x444 - 0xd14];
    unsigned char arr444[1];       /* base 0x444, stride 4 via [idx<<2] */
} Ctx;

int func_0203e2f0(void) {
    Ctx *c = (Ctx *)func_0203c900(0x10);
    int r5 = 9;
    switch (func_0207b5f8()) {
    case 4: {
        int sel = c->f_d0e;
        r5 = sel;
        if (c->f_d0c_hi2 == 1) {
            (&c->arr444[0])[c->f_d13 << 2] = 0;
            r5 = 7;
        } else if (sel >= 3 && sel <= 5) {
            func_0203e9ac(sel);
        }
        break;
    }
    case 7:  func_0207bc20(); break;
    case 10: func_0207b888(); break;
    case 12: func_0207b62c(); func_0203c85c(4); r5 = 0x11; break;
    case 13: func_0203c85c(0);                  r5 = 0x11; break;
    default: break;
    }
    return r5;
}
