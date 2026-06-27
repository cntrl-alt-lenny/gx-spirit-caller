/* CAMPAIGN-PREP candidate for func_021b5b70 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Copy32(src,dst,8) into stack buf; store-order zero C[3]/C[4]; switch on buf[0]; bind B
 *   risk:       struct-guessed: Copy32 arg order (assumed src,dst,n) and func_021ca264's 3rd arg in case1 (orig leaves r2=0 from the earlier zero-store, so passes 0) are inferred; confirm Copy32 signature.
 *   confidence: med
 */
/* func_ov006_021b5b70 (ov006, class D): copy 8 bytes (2 ints) from global A
 * into a stack buffer, zero C[3]/C[4], then switch on buf[0]: case1 register a
 * task (func_021ca264(B,0x19,..)) and stash its result in C[5]; case2 push two
 * actions and a final register with buf[1]. Clean stores in source order.
 *
 * Copy32(src,dst,n): src=A=022f398, dst=&buf, n=8. C=022f38c, B=0225e068. */

extern void Copy32(void *src, void *dst, int n);
extern int  data_ov006_0224f398[];   /* A (copy source) */
extern int  data_ov006_0225e068[];   /* B */
extern int  data_ov006_0224f38c[];   /* C */
extern int  func_02008888(void);
extern void func_ov006_021ca264(int *b, int a, int c);
extern void func_ov006_021ca3e0(int *b, int a, int c);
extern void func_ov006_021ca3f0(int *b, int a, int c);

int func_ov006_021b5b70(void) {
    int buf[2];

    Copy32(data_ov006_0224f398, buf, 8);
    data_ov006_0224f38c[0xc / 4] = 0;    /* C[3] */
    data_ov006_0224f38c[0x10 / 4] = 0;   /* C[4] */

    switch (buf[0]) {
    case 1:
        func_ov006_021ca264(data_ov006_0225e068, 0x19, 0);
        data_ov006_0224f38c[0x14 / 4] = func_02008888();   /* C[5] */
        break;
    case 2:
        func_ov006_021ca3e0(data_ov006_0225e068, 2, 1);
        func_ov006_021ca3f0(data_ov006_0225e068, 0xb, 2);
        func_ov006_021ca264(data_ov006_0225e068, buf[1], 0);
        break;
    }
    return 1;
}
