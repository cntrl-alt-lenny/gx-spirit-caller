/* CAMPAIGN-PREP candidate for func_0206c8ac (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard chain; each &-flag test its own tail; ldrsh-masked flags; constant returns
 *   risk:       At .L_680 orig calls func_0206c84c ONCE then conditionally rewrites r0 (mvnne -0x1a) keeping the call result on the ==1 path; my double-call duplicates it. reshape-able: assign r=func(); if(...)r=-0x1a; return r. Whole body is register-rotation heavy -> permuter-class.
 *   confidence: low
 */
/* func_0206c8ac (main, class D) — dense flag-test guard chain, many tails. */
typedef signed short s16;

extern int   func_0206e4a4(void *a);
extern int   func_0206c84c(void *cmd);
extern void *data_02101e48;

int func_0206c8ac(void *cmd, int a, int b)
{
    char *p = (char *)cmd;

    if (func_0206e4a4(p) != 0 || (*(s16 *)(p + 0x70) & 0x8) != 0) {
        return -0x1c;
    }
    if (!(p != 0 && (*(s16 *)(p + 0x70) & 0x1))) {
        return -0x27;
    }
    {
        signed char st = *(signed char *)(p + 0x73);
        if (st == 0 || st == 4) {
            if (*(s16 *)(p + 0x70) & 0x4) {
                if (*(signed char *)(p + 0x72) == 1) {
                    return -0x1e;
                }
                return 0;
            }
            if (*(s16 *)(p + 0x70) & 0x2) {
                if (*(s16 *)(p + 0x70) & 0x40) {
                    return *(int *)(p + 0x6c);
                }
                return *(int *)data_02101e48;
            }
            *(unsigned short *)(p + 0x76) = (unsigned short)a;
            *(int *)(p + 0x78) = b;
            func_0206c84c(p);
            if (*(signed char *)(p + 0x72) != 1) {
                return -0x1a;
            }
            /* falls through: r0 = func_0206c84c result */
            return func_0206c84c(p);
        }
    }
    *(unsigned short *)(p + 0x76) = (unsigned short)a;
    *(int *)(p + 0x78) = b;
    return 0;
}
