/* CAMPAIGN-PREP candidate for func_020536bc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     SETTER two-store, preserve arg order + store order
 *   risk:       offsets 0x4/0x8 guessed; trivial leaf — should byte-match (confirmed by sibling func_02052e90.c caller)
 *   confidence: high
 */
/* func_020536bc: two-store leaf setter. self->f_4=a1; self->f_8=a2; (in order) */

typedef struct {
    char _pad[0x4];
    int  f_4;    /* 0x4 */
    int  f_8;    /* 0x8 */
} obj_t;

void func_020536bc(obj_t *self, int a1, int a2) {
    self->f_4 = a1;
    self->f_8 = a2;
}
