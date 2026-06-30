/* CAMPAIGN-PREP candidate for func_02071944 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     call+null-guard, field clears, unsigned range-guard, void tail call (.legacy.c)
 *   risk:       func_020723e0 arg count guessed (a,b passed through); shared 0-const reg for f8/f4 stores may not hold across; offsets guessed.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02071944 (main, class A).
 * UNVERIFIED build-free draft. Route -> src/main/func_02071944.legacy.c
 * (mwcc 1.2/sp2p3): stmdb{r4,lr} (even reg count => no sub sp,#4) + 2-step
 * (ldmia{r4,lr}; bx lr / ldmeqia / ldmhiia) epilogue => Style A .legacy.c.
 *   recipe:     call+null-guard, field clears (u8 + word) with unsigned
 *               range guard ((f4-1)>1) early-return, one void tail call
 */
/* func_02071944: p = func_020723e0(?, ?); if !p return; func_020917e8();
 * p->f8 = 0; if ((unsigned)(p->f4 - 1) > 1) return; p->f4 = 0;
 * func_020918f0(p->f0). */

typedef struct Node {
    void         *f0;       /* +0x0 (arg to func_020918f0) */
    int           f4;       /* +0x4 (ldr/str, range-guarded) */
    unsigned char f8;       /* +0x8 (strb = 0) */
} Node;

extern Node *func_020723e0(int a, int b);
extern void  func_020917e8(void);
extern void  func_020918f0(void *p);

void func_02071944(int a, int b) {
    Node *p = func_020723e0(a, b);
    if (p == 0)
        return;
    func_020917e8();
    p->f8 = 0;
    if ((unsigned)(p->f4 - 1) > 1)
        return;
    p->f4 = 0;
    func_020918f0(p->f0);
}
