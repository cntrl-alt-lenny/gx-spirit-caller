/* CAMPAIGN-PREP candidate for func_021c9ef0 (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload global each call (don't bind); a0/o reuse r4; signed v/2; early return
 *   risk:       reshape-able: data_02102c90 must RELOAD per call — bind it to one local and 3 ldr collapse to 1; also `0x80 - v/2` needs signed int v so the `add r0,r0,lsr#31;asr#1` /2 emits.
 *   confidence: med
 */
/* func_ov004_021c9ef0 (ov004, class C): call sequence, signed /2 scale.
 * h = func_0208df0c(); func_02001d0c(D,0x20,2); func_02094504(0,h+0x820,0x800);
 * if(a0==0) return; o = func_0202c0c0(a0); v = func_020054a4(o,0xc);
 * func_02004f58(D, o, h+0x820, 0x80 - v/2, 0, 0xc);
 * func_02001e94(D, func_0208e1cc()+0x580, 0x41, 0);
 * D = data_02102c90 is RELOADED each call (3 separate ldr) — keep inline. */
extern char data_02102c90[];
extern int func_0208df0c(void);
extern void func_02001d0c(void *p, int a, int b);
extern void func_02094504(int a, int b, int c);
extern int func_0202c0c0(int x);
extern int func_020054a4(int x, int n);
extern void func_02004f58(void *p, int a, int b, int c, int d, int e);
extern int func_0208e1cc(void);
extern void func_02001e94(void *p, int a, int b, int c);

void func_ov004_021c9ef0(int a0) {
    int h = func_0208df0c();
    func_02001d0c(data_02102c90, 0x20, 2);
    func_02094504(0, h + 0x820, 0x800);
    if (a0 == 0) return;
    {
        int o = func_0202c0c0(a0);
        int v = func_020054a4(o, 0xc);
        func_02004f58(data_02102c90, o, h + 0x820, 0x80 - v / 2, 0, 0xc);
        func_02001e94(data_02102c90, func_0208e1cc() + 0x580, 0x41, 0);
    }
}
