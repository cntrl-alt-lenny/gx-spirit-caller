/* CAMPAIGN-PREP candidate for func_0208f210 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     proven 020900a0 template; bind handle; const base b+0x068a0000 (b-first); 6-arg call w/ 2 stack zeros vs Copy32
 *   risk:       two [sp]/[sp,#4] zeros come from one shared 0; ip/callee-save reg-alloc for the a/b/n spill may flip. reshape-able — sibling 020900a0 byte-matched with this exact form; only the base constant differs.
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_0208f210 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Marshalling wrapper — clone of the PROVEN
 * func_020900a0 / 0208f6b0 family template. handle = data_0210249c read once;
 * dst = b + 0x068a0000 (const base, b-operand-first per `add r2,r4(b),r2(const)`).
 * handle!=-1 -> func_02093e38(handle, a, dst, n, 0, 0) with two trailing stack
 * zeros; else Copy32(a, dst, n). Orig stashes a/b/n in callee-saved r5/r4/r3
 * before the -1 compare (marshalling spill). */
extern void Copy32(void *dst, void *src, int n);
extern void func_02093e38(int handle, void *src, void *dst, int n, int e, int f);
extern int  data_0210249c;

void func_0208f210(void *a, int b, int n)
{
    int handle = data_0210249c;
    char *dst = (char *)(b + 0x068a0000);
    if (handle != -1)
        func_02093e38(handle, a, dst, n, 0, 0);
    else
        Copy32(a, dst, n);
}
