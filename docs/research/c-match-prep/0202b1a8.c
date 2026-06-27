/* CAMPAIGN-PREP candidate for func_0202b1a8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early-return guard on **g; two linear stream blocks over one 0x48 ctx; size in r4/r5
 *   risk:       reshape-able: func_0202b0b4 return type is INFERRED (r0<<3 consumed) — declare it returning int not void or the shift vanishes; sub r4,r1,r5 needs both h[0] and h[2] read in that order. Largely linear, low alloc risk.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0202b1a8 (main, class C) — brief p_0010.
 * UNVERIFIED build-free draft. Drop into src/, ninja + objdiff, tweak per risk.
 *   recipe:     early-return guard on **g; then two near-identical stream blocks (init/seek/read/decode/flush) over one 0x48 stack ctx
 *   risk:       r4/r5 hold sizes across the bl chain; second block reuses r4 from first; mostly linear so reg-alloc is tame
 *   confidence: med
 */
extern int *data_0219a93c;     /* _LIT0: **g guard */
extern char data_020c6a24;     /* _LIT1 */
extern char data_020c6a38;     /* _LIT3 */
extern int  data_0219a948;     /* _LIT2: stream/context handle */

extern void func_0202b0b4(void);
extern void func_0202b100(void);
extern int  func_0202b0b4_r(void);   /* alias: returns count in r0 (see note) */
extern void func_02038ad4(void *ctx, void *h, int n);
extern void func_02092904(void *h, int n);
extern void func_02097ea4(void *ctx, int off, int a);
extern void func_02097ff0(void *ctx);
extern void func_02098038(void *ctx, void *src);
extern void func_02098388(void *ctx);

/* func_0202b0b4 actually returns a value (r0<<3 used); declare properly */
extern int func_0202b0b4v(void);

int func_0202b1a8(void) {
    char ctx[0x48];
    int *p0 = data_0219a93c;
    int off, len;

    if (*(int *)p0[0] != 0) {     /* ldr;ldr;ldr; cmp; bne */
        func_0202b100();
        return 0;
    }

    off = func_0202b0b4v() << 3;     /* mov r4, r0,lsl#3 */

    func_02098388(ctx);
    func_02098038(ctx, &data_020c6a24);
    func_02097ea4(ctx, off, 0);
    func_02092904((void *)&data_0219a948, 0x200);
    func_02038ad4(ctx, (void *)&data_0219a948, 0xc);
    func_02097ff0(ctx);

    {
        int *h = (int *)&data_0219a948;
        int start = h[0];            /* ldr r5,[r1] */
        len = h[2] - start;          /* ldr [r1,#0x8]; sub r4,r1,r5 */

        func_02098388(ctx);
        func_02098038(ctx, &data_020c6a38);
        func_02097ea4(ctx, start, 0);
        func_02092904((void *)&data_0219a948, 0x200);
        func_02038ad4(ctx, (void *)&data_0219a948, len);
        func_02097ff0(ctx);
    }
    return 0;
}
