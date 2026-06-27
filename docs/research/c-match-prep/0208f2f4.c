/* CAMPAIGN-PREP candidate for func_0208f2f4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     proven 020900a0 template; bind handle; const base b+0x06898000 (b-first); 6-arg call w/ 2 stack zeros vs Copy32
 *   risk:       shared-zero stack stores + ip/callee-save spill alloc may flip. reshape-able — byte-twin of 0208f210/020900a0; only the base constant differs.
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_0208f2f4 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Identical to func_0208f210 except the const
 * base is 0x06898000. Clone of the PROVEN func_020900a0 marshalling template.
 * handle=data_0210249c (read once); dst = b + 0x06898000 (b-operand-first);
 * handle!=-1 -> func_02093e38(handle, a, dst, n, 0, 0) else Copy32(a, dst, n). */
extern void Copy32(void *dst, void *src, int n);
extern void func_02093e38(int handle, void *src, void *dst, int n, int e, int f);
extern int  data_0210249c;

void func_0208f2f4(void *a, int b, int n)
{
    int handle = data_0210249c;
    char *dst = (char *)(b + 0x06898000);
    if (handle != -1)
        func_02093e38(handle, a, dst, n, 0, 0);
    else
        Copy32(a, dst, n);
}
