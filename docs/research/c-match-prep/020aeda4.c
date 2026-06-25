/* CAMPAIGN-PREP candidate for func_020aeda4 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     varargs home (stmdb r0-r3) + va_start round (bic;add) + forward call
 *   risk:       exact stmdb/va_start dance depends on project stdarg/va_list typedef; arg count/types of callee guessed
 *   confidence: med
 */
/* func_020aeda4 - varargs forwarder. homes r0-r3, builds a va_list
 * just past the 3rd named arg, and forwards (a,b,c,ap) to func_020aedcc,
 * returning its result. depends on MSL char*-based va_list lowering. */

#include <stdarg.h>

extern int func_020aedcc(void *a, const char *b, int c, va_list ap);

int func_020aeda4(void *a, const char *b, int c, ...)
{
    va_list ap;
    int r;
    va_start(ap, c);
    r = func_020aedcc(a, b, c, ap);
    va_end(ap);
    return r;
}
