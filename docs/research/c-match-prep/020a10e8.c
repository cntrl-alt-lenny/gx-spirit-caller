/* CAMPAIGN-PREP candidate for func_020a10e8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     stack-byte setup + reload global twice + two calls
 *   risk:       Global data_021a98fc reloaded twice (separate ldr) — must stay un-CSE'd; the 1-byte stack temp address passed to 5c80 may alloc differently.
 *   confidence: med
 */
/* func_020a10e8: strb p0 -> local; func_020a5c80(&buf, data_021a98fc);
 * func_020a2cbc(6, p1, data_021a98fc).  Global reloaded each use. */

extern void *data_021a98fc;
extern void func_020a5c80(void *buf, void *ctx);
extern void func_020a2cbc(int a, int b, void *ctx);

void func_020a10e8(int p0, int p1) {
    unsigned char buf;
    buf = (unsigned char)p0;
    func_020a5c80(&buf, data_021a98fc);
    func_020a2cbc(6, p1, data_021a98fc);
}
