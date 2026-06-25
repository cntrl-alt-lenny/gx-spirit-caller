/* CAMPAIGN-PREP candidate for func_020a1bf8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard + global-index store (base+(i-1)*4+0x1000)->f_4e8 + tail call
 *   risk:       Struct offsets guessed (inner array at +0x1000 stride 4, field +0x4e8). If func_020a099c is non-void other than 0/nonzero the guard sense holds; tail-call reg moves stable.
 *   confidence: med
 */
/* func_020a1bf8: if(func_020a099c(p0)){ (data_021a98fc + 0x1000)
 *   [ (p0-1) ].f_4e8 = p1; }  return func_020a1bbc(p0, p1, p2). */

typedef struct {
    char _pad[0x4e8];
    int  f_4e8;
    char _pad2[0x1000 - 0x4e8 - 4 + 4]; /* stride forces 0x4 element step via int[] view */
} slot_t;

extern int   func_020a099c(int x);
extern int   func_020a1bbc(int a, int b, int c);
extern char *data_021a98fc;

int func_020a1bf8(int p0, int p1, int p2) {
    if (func_020a099c(p0) != 0) {
        int *slot = (int *)(data_021a98fc + (p0 - 1) * 4 + 0x1000);
        slot[0x4e8 / 4] = p1;
    }
    return func_020a1bbc(p0, p1, p2);
}
