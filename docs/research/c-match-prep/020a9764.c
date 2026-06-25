/* CAMPAIGN-PREP candidate for func_020a9764 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     variadic snprintf thunk: forward (buf,size,fmt,va) — stdarg hack
 *   risk:       varargs prologue (stmdb {r0-r3}) is SP-revision sensitive; mwcc 2.0 must spill+align exactly like 1.2 sibling
 *   confidence: med
 */
/* func_020a9764 (main, class B) — variadic snprintf-style thunk. Three
 * named args (buf,size,fmt) forwarded unchanged; a va_list pointing past
 * fmt is built with the project's no-<stdarg.h> hack and passed as arg4.
 *   bic+add on (sp+0x10) == ((u32)&fmt & ~3) + 1word.
 *   recipe: varargs forward -> worker(buf,size,fmt,va) (cf. func_0209150c)
 */
extern int func_020a96fc(void *buf, int size, const char *fmt, void *va);

int func_020a9764(void *buf, int size, const char *fmt, ...)
{
    void *va = (void *)((unsigned long *)((unsigned long)&fmt & ~0x3) + 1);
    return func_020a96fc(buf, size, fmt, va);
}
