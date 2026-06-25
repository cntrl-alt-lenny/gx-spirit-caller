/* CAMPAIGN-PREP candidate for func_020a978c (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     variadic sprintf thunk: worker(buf,-1,fmt,va); -1 size literal
 *   risk:       varargs spill/align is SP-revision sensitive; arg order of -1 vs va and the bic/add scheduling may differ
 *   confidence: med
 */
/* func_020a978c (main, class B) — variadic sprintf-style thunk: two named
 * args (buf,fmt); an unbounded size of -1 (mvn r1,#0) is injected and the
 * worker is the same snprintf core. va_list is built past fmt (the 2nd
 * named param) via the no-<stdarg.h> hack and passed as arg4.
 *   recipe: varargs forward -> worker(buf,-1,fmt,va); mvn size literal
 */
extern int func_020a96fc(void *buf, int size, const char *fmt, void *va);

int func_020a978c(void *buf, const char *fmt, ...)
{
    void *va = (void *)((unsigned long *)((unsigned long)&fmt & ~0x3) + 1);
    return func_020a96fc(buf, -1, fmt, va);
}
