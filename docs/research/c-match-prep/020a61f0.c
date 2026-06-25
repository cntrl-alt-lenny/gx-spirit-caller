/* CAMPAIGN-PREP candidate for func_020a61f0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     masked-eq guard + conditional strh + tail call
 *   risk:       the (b&0x3f)==1 predication may branch instead of predicate; data_021a9938 +0 halfword offset
 *   confidence: med
 */
/* func_020a61f0: if ((arg2 & 0x3f) == 1) set data_021a9938->f0 = 1 and
 * return; else tail-call func_02093bfc(). arg1 (r0) is unused. sp2p3
 * (.legacy.c).
 *
 *   if ((b & 0x3f) == 1) { data_021a9938.f0 = 1; return; }
 *   func_02093bfc();
 */

extern void func_02093bfc(void);

typedef struct {
    unsigned short f0;   /* +0x0 */
    unsigned short f2;   /* +0x2 */
} data_021a9938_t;
extern data_021a9938_t data_021a9938;

void func_020a61f0(int a, int b) {
    (void)a;
    if ((b & 0x3f) == 1) {
        data_021a9938.f0 = 1;
        return;
    }
    func_02093bfc();
}
