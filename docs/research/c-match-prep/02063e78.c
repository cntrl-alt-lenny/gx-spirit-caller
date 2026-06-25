/* CAMPAIGN-PREP candidate for func_02063e78 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     field==1 guard (beq) + field store=5 + zero-arg bool tail call
 *   risk:       empty sub sp,#4 frame and the store/zero-arg scheduling (ip=5, r2/r3 reuse r1) must reproduce; fC offset guessed
 *   confidence: med
 */
/* func_02063e78: if p->fC != 1, return (func_020643d8(p) != 0).
 * Otherwise set p->fC = 5 and return (func_02061c5c(p, 0, 0, 0) != 0).
 */

typedef struct {
    char _pad[0xc];
    int fC;
} Obj_02063e78;

extern int func_020643d8(Obj_02063e78 *);
extern int func_02061c5c(Obj_02063e78 *, int, int, int);

int func_02063e78(Obj_02063e78 *p) {
    if (p->fC != 1) {
        return func_020643d8(p) != 0;
    }
    p->fC = 5;
    return func_02061c5c(p, 0, 0, 0) != 0;
}
