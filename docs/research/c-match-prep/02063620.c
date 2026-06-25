/* CAMPAIGN-PREP candidate for func_02063620 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     field-compare early-return, !=-as-0/1 arg, bool-normalize tail
 *   risk:       `t != 6` -> moveq/movne 0/1 may instead subtract; field 0xc type; const args 2/(t!=6)
 *   confidence: med
 */
/* func_02063620: t = p->_0xc; if (t == 7) return 1;
 * return func_020643ec(p, 2, t != 6) ? 1 : 0;
 * (the moveq r2,#0 / movne r2,#1 materializes the (t!=6) boolean). */

extern int func_020643ec(void *p, int a, int flag);

typedef struct Obj {
    char _pad_00[0xc];
    int  field_c;            /* +0xc */
} Obj;

int func_02063620(Obj *p) {
    int t = p->field_c;
    if (t == 7)
        return 1;
    return func_020643ec(p, 2, t != 6) ? 1 : 0;
}
