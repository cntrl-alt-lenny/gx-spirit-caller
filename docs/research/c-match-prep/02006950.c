/* CAMPAIGN-PREP candidate for func_02006950 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: align math (bic #3 both, sub), Fill32 marshal, store -1 pair order
 *   risk:       reshape-able-ish: arg signatures (esp. func_020983f4 second call passes only r1=r4, r0 stale) and store order of the two -1 writes (asm: negc then neg8) are inferred; the final func_020983f4 r0 reuse is struct-guessed and likely diverges.
 *   confidence: low
 */
/* func_02006950: marshal-heavy init. Fill32(dst,0,0x20); set two -1 words
 * at +0x8/+0xc of global; a sequence of calls; align math
 *   r4 = alloc_top; r0b = alloc_cur;
 *   size = (alloc_top+3 & ~3) - (alloc_cur & ~3);  // bic r0,#3 on both, sub
 * Then more calls; store result at global[+0x1c]; two Task posts.
 * Call ORDER is load-bearing; r4 reused as size then as task handle. */
typedef struct {
    char _pad_00[0x8];
    int neg8;     /* +0x8  = -1 */
    int negc;     /* +0xc  = -1 */
    char _pad_10[0xc];
    int p1c;      /* +0x1c stores func_0207d4dc result */
} Glob_02104f1c;

extern Glob_02104f1c data_02104f1c;
extern void Fill32(unsigned int value, void *dst, unsigned int size);
extern void Task_PostLocked(int a0, int a1, int a2);
extern int  func_0207d4dc(int a0, int a1, int a2);
extern void func_02090624(int a0);
extern int  func_020929ac(int a0, int a1, int a2);
extern int  func_02092c78(int a0);
extern int  func_02092c8c(int a0);
extern int  func_020983f4(int a0, int a1);

void func_02006950(void) {
    int top, cur, size, handle;
    Fill32(0, &data_02104f1c, 0x20);
    data_02104f1c.negc = -1;
    data_02104f1c.neg8 = -1;
    top = func_02092c78(0);
    cur = func_02092c8c(0);
    size = ((top + 3) & ~3) - (cur & ~3);
    func_020929ac(0, size, 4);
    data_02104f1c.p1c = func_0207d4dc(0, size, 0);
    func_02090624(0x40000);
    handle = func_020983f4(0, 0);
    Task_PostLocked(handle, 4, 4);
    func_020983f4(handle, 0/*r1 set from blx? actually mov r1,r4 only*/);
}
