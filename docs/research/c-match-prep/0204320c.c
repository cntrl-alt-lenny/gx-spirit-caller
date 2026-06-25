/* CAMPAIGN-PREP candidate for func_0204320c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     BIND-vs-RELOAD (reload global after call) + tail-ish call seq
 *   risk:       0x11dc/base reload scheduling may reuse a reg instead of reloading; struct offsets assume byte ptr
 *   confidence: med
 */
/* func_0204320c: load BSS singleton base, call two workers at base+0x11dc,
 * returning the word at base+0x1000. Only r4 is callee-saved (holds the
 * return), so the base pointer is reloaded from data_0219d9f0 after the call. */

extern char *data_0219d9f0;            /* BSS pointer to base struct */
extern void func_020927b8(void *p);
extern int  func_02092748(void *p);

int func_0204320c(void) {
    char *base = data_0219d9f0;
    int r4;

    func_020927b8(base + 0x11dc);
    base = data_0219d9f0;               /* reload after call (no callee-saved) */
    r4 = *(int *)(base + 0x1000);
    func_02092748(base + 0x11dc);
    return r4;
}
