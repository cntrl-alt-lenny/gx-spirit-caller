/* CAMPAIGN-PREP candidate for func_02077aec (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     unsigned bound-guard early-return; bind handle+result; reload index
 *   risk:       unsigned cmp must yield cs (declare index unsigned); handle/result reg binding could flip
 *   confidence: med
 */
/* func_02077aec: bounded lookup. If the global index data_02101ecc is
 * out of range (>=0x20, unsigned) bail with -1. Otherwise fetch the
 * active handle (data_021a63d0.f4, kept in a callee-saved reg across
 * both calls), query it (result kept across the second call), notify it
 * with the index, and return the query result.
 */
extern unsigned data_02101ecc;          /* index, compared unsigned */
extern struct { char _pad[4]; void *f4; } data_021a63d0;
extern int  func_02091814(void *handle);
extern void func_0209181c(void *handle, unsigned idx);

int func_02077aec(void) {
    void *handle;
    int result;

    if (data_02101ecc >= 0x20)
        return -1;

    handle = data_021a63d0.f4;
    result = func_02091814(handle);
    func_0209181c(handle, data_02101ecc);
    return result;
}
