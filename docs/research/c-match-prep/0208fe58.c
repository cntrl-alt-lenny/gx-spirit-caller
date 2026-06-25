/* CAMPAIGN-PREP candidate for func_0208fe58 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard (handle!=-1 && n>imm) -> 2-way void tail dispatch; +const base; bind global
 *   risk:       bls is unsigned so n must be unsigned for cmp; mvn -1 compare order; Copy32 arg order (dst,src,n) assumed
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0208fe58 (main, class B) - p_0033.
 * UNVERIFIED build-free draft: drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: handle!=-1 && size>0x30 guard -> 2-way void tail dispatch, +const base, bind global
 */
/* func_0208fe58: if the global DMA handle is valid (!=-1) and the byte
 * count exceeds 0x30, route through func_02094030; otherwise fall back
 * to a synchronous Copy32. The src pointer is biased by 0x7000000. */

extern void Copy32(void *dst, void *src, int n);
extern void func_02094030(int handle, void *dst, void *src, int n);
extern int data_0210249c;

void func_0208fe58(void *dst, int src, int n) {
    int handle = data_0210249c;
    if (handle != -1 && n > 0x30)
        func_02094030(handle, dst, (void *)(src + 0x7000000), n);
    else
        Copy32(dst, (void *)(src + 0x7000000), n);
}
