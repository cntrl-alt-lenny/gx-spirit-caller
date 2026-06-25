/* CAMPAIGN-PREP candidate for func_0209413c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard + blx through function-pointer field; arg load hoisted above branch
 *   risk:       Frame is sub sp,#4 for the blx call; struct offsets (0x10 cb / 0x14 arg) guessed; arg-load scheduling above the cmp may differ.
 *   confidence: med
 */
/* func_0209413c: clears a flag in a global struct then fires its callback
 * (struct->cb at +0x10) with struct->arg (+0x14) if the callback is non-null.
 * The arg is loaded unconditionally (hoisted above the null check). */
typedef struct {
    int field0;          /* 0x00 */
    int pad[3];          /* 0x04..0x0c */
    void (*cb)(int);     /* 0x10 */
    int arg;             /* 0x14 */
} CbRec_021a6710;
extern CbRec_021a6710 data_021a6710;

void func_0209413c(void) {
    void (*cb)(int) = data_021a6710.cb;
    data_021a6710.field0 = 0;
    if (cb)
        cb(data_021a6710.arg);
}
