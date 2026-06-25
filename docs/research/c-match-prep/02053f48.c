/* CAMPAIGN-PREP candidate for func_02053f48 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     assert(arg2==0 path); stack out-args str r4/[sp]+sp+8; field loads from r6 in asm order
 *   risk:       STACK-passed args (str r4,[sp]; str sp+8,[sp,#4]) and func_02053b38 arity/order are struct-guessed; sub r0,r0,r2 = ret-f14 second-source order. struct-guessed + permuter-class on the stack-slot layout.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02053f48 (main, class C) - brief 0015.
 * UNVERIFIED build-free draft. recipe: assert(arg2!=0), build a local out-
 * struct, chained calls passing field loads from r6 in asm order.
 * STRUCT-GUESSED: out-param layout and the two stack slots are inferred.
 */
extern char data_020ffb04[];
extern char data_020ffb30[];
extern void func_020a6d54(char *file, char *expr, int zero, int line);
extern int  func_02053b38(void *b, int f14, int f00, int f08,
                          int outv, void *outp);
extern int  func_020b3870(int a0, int f08, int f14);
extern void func_02053fc4(void *r6, void *r5, int r2);

typedef struct {
    int   f00;      /* +0x00 */
    int   _f04;     /* +0x04 */
    int   f08;      /* +0x08 */
    int   _f0c;     /* +0x0c */
    int   _f10;     /* +0x10 */
    int   f14;      /* +0x14 */
} Hdr02053f48;

int func_02053f48(Hdr02053f48 *r6, void *r5, int r2) {
    int outv;
    int outbuf[2];
    int t;

    if (r2 == 0)
        func_020a6d54(data_020ffb30, data_020ffb04, 0, 0xb7);

    outv = r2;
    t = func_02053b38(r5, r6->f14, r6->f00, r6->f08, outv, &outbuf[0]);
    t = func_020b3870(t - r6->f14, r6->f08, r6->f14);
    func_02053fc4(r6, r5, t);
    return t;
}
