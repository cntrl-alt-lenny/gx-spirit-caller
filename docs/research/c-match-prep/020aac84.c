/* CAMPAIGN-PREP candidate for func_020aac84 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     variadic sscanf thunk: forward (str,fmt,va) — stdarg hack
 *   risk:       varargs spill/align SP-revision sensitive; the {r0-r3}+{r3,lr} prologue must match mwcc 2.0 exactly
 *   confidence: med
 */
/* func_020aac84 (main, class B) — variadic sscanf-style thunk. Two named
 * args (str,fmt) forwarded; a va_list pointing past fmt (the 2nd named
 * param) is built with the project's no-<stdarg.h> hack and passed as
 * arg3 to the scan worker (which itself null/empty-checks str).
 *   recipe: varargs forward -> worker(str,fmt,va) (cf. func_02091554)
 */
extern int func_020aac30(const char *str, const char *fmt, void *va);

int func_020aac84(const char *str, const char *fmt, ...)
{
    void *va = (void *)((unsigned long *)((unsigned long)&fmt & ~0x3) + 1);
    return func_020aac30(str, fmt, va);
}
