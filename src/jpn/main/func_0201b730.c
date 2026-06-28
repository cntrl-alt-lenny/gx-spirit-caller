/* CAMPAIGN-PREP candidate for func_0201b730 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Bind-base GetSystemWork; guard skip; orr accumulate; mvn/and field read tail
 *   risk:       func_02013980 declared int here (matched def is void) - harmless across TUs; orr operand order (mask first) must hold for r4 dest.
 *   confidence: high
 */
/* func_0201b730: build a clear-mask from two helper calls (unless gated), then
 * AND it out of the system-work flag word at +0x8f4 and return the result.
 *   sys = GetSystemWork();          (bound in r5)
 *   mask = 0;                        (r4)
 *   if (func_02013980() != 2) {
 *       mask  = func_0201b694(0xc);
 *       mask |= func_0201b694(8);
 *   }
 *   return *(int*)(sys+0x8f4) & ~mask;
 */

extern char *GetSystemWork(void);
extern int   func_02013980(void);
extern int   func_0201b694(int);

int func_0201b730(void) {
    char *sys;
    int mask;
    sys = GetSystemWork();
    mask = 0;
    if (func_02013980() != 2) {
        mask = func_0201b694(0xc);
        mask |= func_0201b694(8);
    }
    return *(int *)(sys + 0x8f4) & ~mask;
}
