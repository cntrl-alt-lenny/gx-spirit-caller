/* CAMPAIGN-PREP candidate for func_0206b6bc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     load-once temp; if/else preserves r1 reuse; setter store
 *   risk:       the unused sp slot (sub/add sp #4) is implicit; if/else may collapse to one call losing the two-branch shape
 *   confidence: med
 */
/* func_0206b6bc: load p->_5d0 once; if nonzero call func_02068964(v, old)
 * (reusing the loaded reg), else func_02068964(v, 0); then p->_5d0 = v.
 *
 *     ldr r1,[r5,#0x5d0]; cmp r1,#0; bne L
 *       func_02068964(v, 0)
 *     L: func_02068964(v, r1=old)
 *     str r4,[r5,#0x5d0]
 */

typedef struct Mgr Mgr;

extern void func_02068964(void *p, int value);

struct Mgr {
    char _pad_00[0x5d0];
    void *slot;            /* +0x5d0 */
};

void func_0206b6bc(Mgr *p, void *v) {
    void *old = p->slot;
    if (old != 0)
        func_02068964(v, (int)old);
    else
        func_02068964(v, 0);
    p->slot = v;
}
