/* CAMPAIGN-PREP candidate for func_02052ecc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD/early-return null check + conditional call result
 *   risk:       offsets 0x1c/0x24 guessed; r2/r1 zero-init order may flip the two mov #0; bl-not-tail forces frame
 *   confidence: med
 */
/* func_02052ecc: null guard then conditional call.
 *   p = self->f_1c; if(!p) return 0; return func_02053560(p, self->f_24);
 * Frame is stmfd{lr}/sub sp,#4 (the call shape). r2 holds the 0 default. */

typedef struct {
    char _pad[0x1c];
    void *f_1c;       /* 0x1c */
    char _pad2[0x4];
    int   f_24;       /* 0x24 */
} obj_t;

extern int func_02053560(void *p, int v);

int func_02052ecc(obj_t *self) {
    void *p = self->f_1c;
    if (p == 0) return 0;
    return func_02053560(p, self->f_24);
}
