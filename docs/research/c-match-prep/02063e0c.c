/* CAMPAIGN-PREP candidate for func_02063e0c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     field==1 guard (beq) + multi-call tail + bool-normalized returns
 *   risk:       func_02061fa4 declared void (return discarded; r0 reloaded after); callee-saved r4/r5/r6 alloc may shuffle; fC offset guessed
 *   confidence: med
 */
/* func_02063e0c: if p->fC != 1, return (func_020643d8(p) != 0).
 * Otherwise: call func_02061fa4(p) (result discarded); if
 * func_020628fc(p) == 0 return 0; else return
 * (func_02061c5c(p, 2, b, c) != 0).
 */

typedef struct {
    char _pad[0xc];
    int fC;
} Obj_02063e0c;

extern int func_020643d8(Obj_02063e0c *);
extern void func_02061fa4(Obj_02063e0c *);
extern int func_020628fc(Obj_02063e0c *);
extern int func_02061c5c(Obj_02063e0c *, int, int, int);

int func_02063e0c(Obj_02063e0c *p, int b, int c) {
    if (p->fC != 1) {
        return func_020643d8(p) != 0;
    }
    func_02061fa4(p);
    if (func_020628fc(p) == 0) return 0;
    return func_02061c5c(p, 2, b, c) != 0;
}
