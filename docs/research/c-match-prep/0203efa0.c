/* CAMPAIGN-PREP candidate for func_0203efa0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     2-bit mid bitfield -> lsl#26;lsr#30; moveq/movne; 64-bit /const helper, movcc early-ret
 *   risk:       struct-guessed (0xd0c/0xd13/0x444 + 0xcb0 stamp). The early-return ldmccia (movcc r0,#0xc; pop) vs my `if(<0xa)return` may emit an extra branch -> reshape to a single comparison; otherwise permuter-class on the cmp/cmpeq fusion.
 *   confidence: low
 */
/* func_0203efa0 — gate, then either 2-bit bitfield(0xd0c bits[5:4])==1 ? 0xf:0xd,
 * or 64-bit timer delta /0x01ff6210 threshold 0xa -> 0xc, else set flag, 0xb.
 * Class D: 2-bit bitfield + 64-bit divmod helper. */
extern int  func_0206eb08(void);
extern void func_0203eca4(void *);
extern void func_020930b0(void);
extern unsigned long long func_020b3808(unsigned long long, unsigned);
extern unsigned long long Timer_read(void);

typedef struct Ctx {
    unsigned char _p0[0xcb0];
    unsigned long long stamp;          /* 0xcb0/0xcb4 */
    unsigned char _p1[0xd0c - 0xcb8];
    unsigned char f_d0c_lo4 : 4;       /* 0xd0c bits[3:0] */
    unsigned char f_d0c_mid : 2;       /* 0xd0c bits[5:4] -> lsl#26;lsr#30 */
    unsigned char f_d0c_hi  : 2;
    unsigned char _p2[0xd13 - 0xd0d];
    unsigned char f_d13;               /* 0xd13 index */
    unsigned char _p3[0x444 - 0xd14];
    unsigned char arr444[1];           /* 0x444 stride 4 */
} Ctx;

int func_0203efa0(void *ctx) {
    Ctx *c = (Ctx *)ctx;
    if (func_0206eb08() != 0) {
        func_0203eca4(c);
        return c->f_d0c_mid == 1 ? 0xf : 0xd;
    }
    if (func_020b3808((Timer_read() - c->stamp) << 6, 0x01ff6210) < 0xa)
        return 0xc;
    (&c->arr444[0])[c->f_d13 << 2] = 1;
    return 0xb;
}
