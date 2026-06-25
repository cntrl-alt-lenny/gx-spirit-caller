/* CAMPAIGN-PREP candidate for func_0208f988 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     threshold dispatch (clone of f850, inner=df60)
 *   risk:       same as f850: handle r0-reuse and p reg choice
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned int u32;

extern int data_0210249c;
extern u8 *func_0208df60(void *a);
extern void func_02094030(int handle, void *a, void *src, u32 size);
extern void Copy32(void *a, void *src, u32 size);

void func_0208f988(void *a, int b, u32 c)
{
    u8 *p = func_0208df60(a);
    int handle = data_0210249c;
    if (handle != -1 && c > 0x30)
        func_02094030(handle, a, p + b, c);
    else
        Copy32(a, p + b, c);
}
