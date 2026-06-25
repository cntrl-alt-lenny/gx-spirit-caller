/* CAMPAIGN-PREP candidate for func_02098c98 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     3-call wrapper, bound offset arith, BIND-vs-RELOAD (A)
 *   risk:       must keep `end=f8+fc` bound then `end-f8` for arg2 (not fc); if mwcc folds it back to fc the sub disappears
 *   confidence: med
 */
/* func_02098c98: read f4(base), f8(off), fc(len); compute end = f8 + fc, then
 *   func_02092940(f4, end);
 *   func_020928cc(f4, end);
 *   return func_020945f4(f4 + f8, 0, end - f8);
 * The third arg is written as end - f8 (NOT fc) to reproduce `sub r2, r4, r5`
 * -- the value end is bound in a register and reused across all three calls. */

typedef struct {
    char _pad0[0x4];
    int  f_4;    /* +0x04 base   */
    int  f_8;    /* +0x08 offset */
    int  f_c;    /* +0x0c length */
} Ctx_02098c98;

extern void func_02092940(int base, int end);
extern void func_020928cc(int base, int end);
extern int  func_020945f4(int start, int zero, int len);

int func_02098c98(Ctx_02098c98 *p) {
    int base = p->f_4;
    int off  = p->f_8;
    int end  = off + p->f_c;
    func_02092940(base, end);
    func_020928cc(base, end);
    return func_020945f4(base + off, 0, end - off);
}
