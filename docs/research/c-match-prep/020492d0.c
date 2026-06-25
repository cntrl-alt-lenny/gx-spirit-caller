/* CAMPAIGN-PREP candidate for func_020492d0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD g->f18 + stack-arg pack + single call
 *   risk:       stack-slot order [sp]/[sp+4] may reorder; func ptr passed as data
 *   confidence: med
 */
/* func_020492d0: if g->f18 == 0 return; else call
 * func_02055c70(a0, *a1, 0, 0, func_020484c0, 0) with the last two on stack.
 * r0 (a0) is passed through untouched; a1 is dereferenced. */

typedef struct {
    char _pad[0x18];
    int  f18; /* +0x18 */
} State020492d0;

extern State020492d0 *data_0219dc80;
extern void func_020484c0(void);
extern void func_02055c70(int a0, int b, int c, int d, void *e, int f);

void func_020492d0(int a0, int *a1) {
    if (data_0219dc80->f18 == 0) return;
    func_02055c70(a0, *a1, 0, 0, (void *)func_020484c0, 0);
}
