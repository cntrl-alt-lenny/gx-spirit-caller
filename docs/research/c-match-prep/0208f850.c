/* CAMPAIGN-PREP candidate for func_0208f850 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     threshold dispatch; bind handle (reuse r0), free add base p+b
 *   risk:       reg-alloc: handle must reuse the loaded r0 not reload; ip vs callee-save for p may flip
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned int u32;

extern int data_0210249c;
extern u8 *func_0208deec(void *a);
extern void func_02094030(int handle, void *a, void *src, u32 size);
extern void Copy32(void *a, void *src, u32 size);

void func_0208f850(void *a, int b, u32 c)
{
    u8 *p = func_0208deec(a);
    int handle = data_0210249c;
    if (handle != -1 && c > 0x30)
        func_02094030(handle, a, p + b, c);
    else
        Copy32(a, p + b, c);
}
