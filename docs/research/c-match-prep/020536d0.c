/* CAMPAIGN-PREP candidate for func_020536d0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     arg-shuffle + call + single SETTER store
 *   risk:       reg-alloc-walled per .s header: r4/r5 save-reg choice for a1/self may flip; 0x7ff pool placement; offset guessed
 *   confidence: low
 */
/* func_020536d0: shuffle args, call helper, then a single field store.
 *   func_02053748(self, a2, 0, 0x7ff);
 *   self->f_4 = a1;
 * r4 saves a1, r5 saves self across the call; r3=0x7ff from a literal pool.
 * (Flagged reg-alloc-walled in ship-as-.s; best-effort reshape.) */

typedef struct {
    char _pad[0x4];
    int  f_4;    /* 0x4 */
} obj_t;

extern void func_02053748(void *self, int b, int c, int d);

void func_020536d0(obj_t *self, int a1, int a2) {
    func_02053748(self, a2, 0, 0x7ff);
    self->f_4 = a1;
}
