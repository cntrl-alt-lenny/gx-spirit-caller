/* CAMPAIGN-PREP candidate for func_02063dc8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard call + (eq?0:1) ternary arg + bool-normalized tail call
 *   risk:       tail moveq#0-before-movne#1 order may flip vs idiomatic !=0 (reshape to ?1:0 if so); fC offset guessed
 *   confidence: med
 */
/* func_02063dc8: if func_020628fc(p) == 0 return 0; else call
 * func_020643ec(p, 2, (p->fC == 6) ? 0 : 1) and return it as a bool.
 */

typedef struct {
    char _pad[0xc];
    int fC;
} Obj_02063dc8;

extern int func_020628fc(Obj_02063dc8 *);
extern int func_020643ec(Obj_02063dc8 *, int, int);

int func_02063dc8(Obj_02063dc8 *p) {
    if (func_020628fc(p) == 0) return 0;
    return func_020643ec(p, 2, p->fC == 6 ? 0 : 1) != 0;
}
