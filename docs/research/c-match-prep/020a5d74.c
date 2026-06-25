/* CAMPAIGN-PREP candidate for func_020a5d74 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     store (arg-2) field, call, store result + const field
 *   risk:       data_021a9928 field offsets +0/+4/+8 guessed; store scheduling of the two trailing stores may reorder
 *   confidence: med
 */
/* func_020a5d74: record (arg-2), call func_020b3870(0x1e), store result + const.
 * sp2p3 (.legacy.c).
 *
 *   data_021a9928.f0 = arg - 2;
 *   r0 = func_020b3870(0x1e);
 *   data_021a9928.f4 = r0;
 *   data_021a9928.f8 = 0x1e;
 */

extern int func_020b3870(int x);

typedef struct {
    int f0;   /* +0x0 */
    int f4;   /* +0x4 */
    int f8;   /* +0x8 */
} data_021a9928_t;
extern data_021a9928_t data_021a9928;

void func_020a5d74(int arg) {
    data_021a9928.f0 = arg - 2;
    data_021a9928.f4 = func_020b3870(0x1e);
    data_021a9928.f8 = 0x1e;
}
