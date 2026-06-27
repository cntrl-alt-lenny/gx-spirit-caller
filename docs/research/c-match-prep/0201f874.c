/* CAMPAIGN-PREP candidate for func_0201f874 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     singleton-base loads; do-while bit-scan with strhih wrap-clamp; tst mask<<n; tail dispatch
 *   risk:       reshape-able/struct-guessed: the wrap is `cmp #0x10; strhih ip(=1)` — a predicated store, not an if; writing `if(x>0x10)x=1` may emit a branch instead of strhih. Also func_0209ecc8 arg regs (r0=func ptr,r1=data) inferred from the two ldr just before the bl.
 *   confidence: low
 */
/* func_0201f874 (main, class D) — state-gated bit-scan/dispatch. sys =
 * data_02191f40. If sys[0x30]!=2 call func_02093bfc and force code=0. Read
 * link mask via func_0209e4f8: ==0x8000 -> error 3; ==0 -> error 0x16.
 * If sys.u16[0x2]==0, scan a counter at sys+0x84 (1..0x10 wrap, strhih clamp)
 * for the first set bit of mask, else use the stored u16[0x2]. Then
 * func_0209e308 -> sys.u16[0x86], store sys[0x80]=data_02192020,
 * func_0209ecc8 -> ==2 returns 1 else error path via func_0201f19c returns 0. */
extern char data_02191f40[];
extern int  data_02191fc0[];
extern int  data_02192020[];
extern void func_0201f19c(int code);
extern int  func_0201f954(void);
extern void func_02093bfc(void);
extern int  func_0209e308(void);
extern int  func_0209e4f8(void);
extern int  func_0209ecc8(int *a, int *b);

int func_0201f874(void) {
    char *sys = data_02191f40;
    int mask;
    unsigned int n;
    if (*(int *)(sys + 0x30) != 2) {
        func_02093bfc();
    }
    mask = func_0209e4f8();
    if (mask == 0x8000) {
        func_0201f19c(3);
        return 0;
    }
    if (mask == 0) {
        func_0201f19c(0x16);
        return 0;
    }
    if (*(unsigned short *)(sys + 0x2) == 0) {
        do {
            n = *(unsigned short *)(sys + 0x84) + 1;
            *(unsigned short *)(sys + 0x84) = (unsigned short)n;
            if (*(unsigned short *)(sys + 0x84) > 0x10)
                *(unsigned short *)(sys + 0x84) = 1;
            n = *(unsigned short *)(sys + 0x84) - 1;
        } while ((mask & (1 << n)) == 0);
    } else {
        *(unsigned short *)(sys + 0x84) = *(unsigned short *)(sys + 0x2);
    }
    *(unsigned short *)(sys + 0x86) = (unsigned short)func_0209e308();
    *(int *)(sys + 0x80) = (int)data_02192020;
    if (func_0209ecc8((int *)func_0201f954, data_02191fc0) == 2)
        return 1;
    func_0201f19c(0);
    return 0;
}
