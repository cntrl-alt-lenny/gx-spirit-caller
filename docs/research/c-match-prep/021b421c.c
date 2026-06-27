/* CAMPAIGN-PREP candidate for func_021b421c (ov010, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     stride via if-else (movs/moveq/movne); two stack bufs at sp+0/sp+0x20; ldmia r6->{r4,r5}.
 *   risk:       reshape-able: the `movs r7,r0`+`moveq/movne r4` select must come from `if(r0==0)stride=..;else..;` with r7 preserved; if mwcc spills buffers in a different frame order the 02097ea4 arg (r4 vs stride) reg may diverge.
 *   confidence: med
 */
/* func_ov010_021b421c: build a render request on a 0x68-byte stack frame
 * twice. r4 selects a stride: (idx<<4) if r0==0 else (idx<<4)+8. First
 * pass primes/clears the frame and issues it; if the issued list's second
 * word (count) is 0 it bails with 0, else a second pass re-issues with the
 * incremented r0 and returns that count.
 *
 *   movs r7,r0; moveq r4,r2,lsl#4; movne r0,r2,lsl#4; addne r4,r0,#8
 *   ...build (02098388/020945f4/021b4144/02098038/02097ea4/02092904/02038ad4/02097ff0)
 *   ldmia r6,{r4,r5}; if r5==0 return 0;
 *   ...rebuild with (r7+1) and r2=r5 ... return r5
 */

extern void func_02038ad4(void *a, void *b, int c);
extern void func_02092904(void *a, int b);
extern void func_020945f4(void *a, int b, int c);
extern void func_02097ea4(void *a, int b, int c);
extern void func_02097ff0(void *a);
extern void func_02098038(void *a, void *b);
extern void func_02098388(void *a);
extern void func_ov010_021b4144(void *a, int b);

int func_ov010_021b421c(int r0, void *r6, int idx) {
    char buf0[0x20];
    char buf20[0x48];
    int r4, r5;
    int stride;

    if (r0 == 0)
        stride = idx << 4;
    else
        stride = (idx << 4) + 8;

    func_02098388(buf20);
    func_020945f4(buf0, 0, 0x20);
    func_ov010_021b4144(buf0, 0);
    func_02098038(buf20, buf0);
    func_02097ea4(buf20, stride, 0);
    func_02092904(r6, 0x200);
    func_02038ad4(buf20, r6, 8);
    func_02097ff0(buf20);

    r4 = ((int *)r6)[0];
    r5 = ((int *)r6)[1];
    if (r5 == 0)
        return 0;

    func_02098388(buf20);
    func_020945f4(buf0, 0, 0x20);
    func_ov010_021b4144(buf0, r0 + 1);
    func_02098038(buf20, buf0);
    func_02097ea4(buf20, r4, 0);
    func_02092904(r6, 0x200);
    func_02038ad4(buf20, r6, r5);
    func_02097ff0(buf20);

    return r5;
}
