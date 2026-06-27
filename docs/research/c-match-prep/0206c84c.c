/* CAMPAIGN-PREP candidate for func_0206c84c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     alloc; null-tail (mvneq -0x21); ordered 0x10/0x12/0x14 copies; flag orr; tail-call ret
 *   risk:       Orig evaluates the s8 arg (ldrsb r2) before the fn/obj args; mwcc arg-eval order may load it last (1 mov reorder). reshape-able via arg-order / temp; mid-copy 'mov r0,r4' scheduling is permuter-class.
 *   confidence: med
 */
/* func_0206c84c (main, class D) — alloc + ordered field copies + flag orr. */
typedef unsigned short u16;
typedef unsigned long  u32;
typedef signed short   s16;

extern void *func_0206bf94(void *fn, void *obj, int arg);
extern int   func_0206be54(void *obj);
extern int   func_0206c7c0(void *cmd);

int func_0206c84c(void *obj)
{
    char *p = (char *)obj;
    char *n = (char *)func_0206bf94((void *)func_0206c7c0, p, *(signed char *)(p + 0x72));

    if (n == 0) {
        return -0x21;
    }
    *(u16 *)(n + 0x10) = *(u16 *)(p + 0x74);
    *(u16 *)(n + 0x12) = *(u16 *)(p + 0x76);
    *(u32 *)(n + 0x14) = *(u32 *)(p + 0x78);
    *(s16 *)(p + 0x70) |= 0x2;
    return func_0206be54(p);
}
