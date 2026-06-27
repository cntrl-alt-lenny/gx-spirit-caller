/* CAMPAIGN-PREP candidate for func_021ab108 (ov005, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     inline i*0xc (mla, no shared base); && short-circuit to else; kept++ in comma; backtrack while
 *   risk:       source asm is TRUNCATED after the final `cmp r7,#0x0` so the post-loop tail/return is reconstructed (assumed ctx[0x14]); plus worklist reg-alloc. permuter-class + needs-real-tail.
 *   confidence: low
 */
/* func_ov005_021ab108: worklist/backtrack builder. If (ctx[0x18]&1)==0 return
 * ctx[0x14]. Alloc A=n*0xc-struct array and B=n int array; seed B[0]=ab274(
 * ctx,0,&A[0]); walk while B[i]!=0: if ab384(,1)&&ab260&&ab384(,2) advance
 * (i++, B[i]=ab274(ctx,B[i-1],&A[i])) else B[i]=ab2e0(ctx,&A[i]) and backtrack
 * while it is 0. NOTE: source asm truncated after `cmp r7,#0x0` (return tail
 * unknown -- assumed ctx[0x14]). */
#define ASLOT(i) ((char *)A + (i) * 0xc)
#define BAT(i)   (*(int *)(B + (i) * 4))
extern int Task_PostLocked(int, int, int);
extern int func_ov005_021ab274(void *obj, int idx, void *out);
extern int func_ov005_021ab2e0(void *obj, void *slot);
extern int func_ov005_021ab260(void *obj, int idx);
extern int func_ov005_021ab384(void *obj, int idx, unsigned int mask);

int func_ov005_021ab108(int *ctx, int n) {
    int kept = 0;
    int i = 0;
    char *A, *B;
    if ((ctx[6] & 1) == 0)
        return ctx[5];
    A = (char *)Task_PostLocked(n * 0xc, 4, 0);
    B = (char *)Task_PostLocked(n * 4, 4, 0);
    *(int *)B = func_ov005_021ab274(ctx, 0, A);
    while (BAT(i) != 0) {
        int idx = BAT(i);
        if (func_ov005_021ab384(ctx, idx, 1)
            && (kept++, func_ov005_021ab260(ctx, idx))
            && func_ov005_021ab384(ctx, idx, 2)) {
            i++;
            BAT(i) = func_ov005_021ab274(ctx, BAT(i - 1), ASLOT(i));
        } else {
            BAT(i) = func_ov005_021ab2e0(ctx, ASLOT(i));
            if (BAT(i) == 0) {
                while (i > 0) {
                    i--;
                    BAT(i) = func_ov005_021ab2e0(ctx, ASLOT(i));
                    if (BAT(i) != 0) break;
                }
            }
        }
    }
    return ctx[5];
}
