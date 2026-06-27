/* CAMPAIGN-PREP candidate for func_021ce190 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: bic mask-clears with store-order; RELOAD g268 per use (two reads); bitfield (x<<23)>>28; conditional store.
 *   risk:       struct-guessed: source asm TRUNCATED -- case 0 (.L_610) body and _LIT1 (af358 arg) are missing; case-1 chain is faithful but cannot byte-match without the cut tail/literal.
 *   confidence: low
 */
/* func_ov011_021ce190 (ov011, class D): mode dispatch (arg0 = 0 | 1) running a
 * long sequential init/teardown chain with bic-mask field clears and two nibble
 * bitfield extracts that RELOAD g403c[0x268] (separate ldr each -> two reads).
 * NOTE: source asm is TRUNCATED -- only case 1 (arg0==1) is shown in full;
 * case 0 (label .L_610) is cut after its first `ldr r0,[r4,#0x280]`, so the
 * case-0 body is a stub to be filled from the complete asm. _LIT1 (passed to
 * func_ov000_021af358) is also outside the truncated pool; declared as an extern
 * data symbol placeholder.
 *
 * case 1: g268 &= ~0x1e000; t = g280 & ~0xff; if(arg2==0) u = g270 & ~0xff;
 *   g264 = 1; g280 = t; if(arg2==0) g270 = u; ca524(); cb3b4(g264); ca324();
 *   cc9b4(); cdb94(); cd048((g268>>5)&0xf); cd190((g268>>5)&0xf);  [reloads g268]
 *   ace4c( ((g280>>22)&1) ? 0 : 1 ); af358(LIT1); af338(0xc); c9da0();
 *   if(arg1==0) ceebc(); ccf8c(); func_0208c8cc(1,0,0); cada4(1); */
extern void func_0208c8cc(int a, int b, int c);
extern void func_ov000_021ace4c(int v);
extern void func_ov000_021af338(int v);
extern void func_ov000_021af358(void *p);
extern void func_ov011_021c9da0(void);
extern void func_ov011_021ca324(void);
extern void func_ov011_021ca524(void);
extern void func_ov011_021cada4(int v);
extern void func_ov011_021cb3b4(int v);
extern void func_ov011_021cc9b4(void);
extern void func_ov011_021ccf8c(void);
extern void func_ov011_021cd048(int v);
extern void func_ov011_021cd190(int v);
extern void func_ov011_021cdb94(void);
extern void func_ov011_021ceebc(void);
extern unsigned char data_ov011_021d403c[];
extern unsigned char data_ov011_021ce190_lit1[];   /* placeholder: _LIT1 truncated */

void func_ov011_021ce190(int mode, int arg1, int arg2) {
    unsigned char *g = data_ov011_021d403c;

    if (mode == 0) {
        /* TRUNCATED in source asm: body begins `ldr r0,[g+0x280]`; fill in. */
        (void)*(unsigned int *)(g + 0x280);
        return;
    }

    if (mode == 1) {
        *(unsigned int *)(g + 0x268) &= ~0x1e000u;
        if (arg2 == 0)
            *(unsigned int *)(g + 0x270) &= ~0xffu;
        *(int *)(g + 0x264) = 1;
        *(unsigned int *)(g + 0x280) &= ~0xffu;

        func_ov011_021ca524();
        func_ov011_021cb3b4(*(int *)(g + 0x264));
        func_ov011_021ca324();
        func_ov011_021cc9b4();
        func_ov011_021cdb94();
        func_ov011_021cd048((int)((*(unsigned int *)(g + 0x268) << 23) >> 28));
        func_ov011_021cd190((int)((*(unsigned int *)(g + 0x268) << 23) >> 28));

        if (((*(unsigned int *)(g + 0x280) << 9) >> 31) != 0)
            func_ov000_021ace4c(0);
        else
            func_ov000_021ace4c(1);

        func_ov000_021af358(data_ov011_021ce190_lit1);
        func_ov000_021af338(0xc);
        func_ov011_021c9da0();
        if (arg1 == 0)
            func_ov011_021ceebc();
        func_ov011_021ccf8c();
        func_0208c8cc(1, 0, 0);
        func_ov011_021cada4(1);
    }
}
