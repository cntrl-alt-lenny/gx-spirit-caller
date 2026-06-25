/* CAMPAIGN-PREP candidate for func_021cc21c (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ordered stores [0x48]/[0x54]++/[0xcd0]; literal-derived -1 via 0x3a-0x3b
 *   risk:       reshape-able: func_020aadf8's 4th reg arg is leftover/garbage (r3 never set) — guessed 0; `0x3a-0x3b` reproduces `mov #0x3a;sub #0x3b`. If r3 matters this struct-guessed arg diverges.
 *   confidence: med
 */
/* func_ov004_021cc21c (ov004, class C): straight marshalling + ordered stores.
 * func_ov004_021cc0e0(1); b = (signed char)data_021040ac[0xbcc]; buf[0]=b;
 * func_020aadf8(&buf[1], data_02104c7a, b, ?, 3); func_02020d00(&frame, 0);
 * STORE ORDER: *(int*)(D+0x48)=1; (*(int*)(D+0x54))++; *(int*)(E+0xcd0)=1;
 * func_02037208(0x3a, 0x3a-0x3b, 0, 1). */
extern char data_021040ac[];
extern char data_02104c7a[];
extern char data_ov004_0220b500[];
extern char data_ov004_0220e500[];
extern void func_ov004_021cc0e0(int x);
extern void func_020aadf8(void *out, void *fmt, int v, int u, int n);
extern void func_02020d00(void *p, int a);
extern void func_02037208(int a, int b, int c, int d);

void func_ov004_021cc21c(void) {
    char buf[0x18];
    char frame[0x20];
    char *D = data_ov004_0220b500;
    signed char b;
    func_ov004_021cc0e0(1);
    b = *(signed char *)(data_021040ac + 0xbcc);
    buf[0] = b;
    func_020aadf8(&buf[1], data_02104c7a, b, 0, 3);
    func_02020d00(frame, 0);
    *(int *)(D + 0x48) = 1;
    *(int *)(D + 0x54) = *(int *)(D + 0x54) + 1;
    *(int *)(data_ov004_0220e500 + 0xcd0) = 1;
    func_02037208(0x3a, 0x3a - 0x3b, 0, 1);
}
