/* CAMPAIGN-PREP candidate for func_0208f9f0 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     threshold dispatch, threshold 0x1c, large=93fb8 small=944a4
 *   risk:       same as f850 (handle reuse, p reg); threshold 0x1c and the two call targets differ
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned int u32;

extern int data_0210249c;
extern u8 *func_0208df94(void *a);
extern void func_02093fb8(int handle, void *a, void *src, u32 size);
extern void func_020944a4(void *a, void *src, u32 size);

void func_0208f9f0(void *a, int b, u32 c)
{
    u8 *p = func_0208df94(a);
    int handle = data_0210249c;
    if (handle != -1 && c > 0x1c)
        func_02093fb8(handle, a, p + b, c);
    else
        func_020944a4(a, p + b, c);
}
