/* CAMPAIGN-PREP candidate for func_020552dc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-guard + alloc(size+1) + cond init call + return ptr
 *   risk:       movs r5/r4 callee-save assignment and the movs-based null tests may flip reg-alloc; otherwise clean
 *   confidence: med
 */
/* func_020552dc: if(!p) return 0; n = func_020aaddc() + 1; q = func_020453e8(n);
 *   if(q) func_020aadf8(q, p); return q;
 */

extern int func_020aaddc(void);
extern void *func_020453e8(int size);
extern void func_020aadf8(void *q, void *p);

void *func_020552dc(void *p) {
    void *q;
    if (p == 0) return 0;
    q = func_020453e8(func_020aaddc() + 1);
    if (q != 0)
        func_020aadf8(q, p);
    return q;
}
