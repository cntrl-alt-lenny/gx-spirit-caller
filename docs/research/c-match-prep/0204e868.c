/* CAMPAIGN-PREP candidate for func_0204e868 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     strchr(src,0) cached r7; do/while when count>0; addeq early-out -1
 *   risk:       the two early-outs use addeq;mvneq;ldmeqia (conditional epilogue). mwcc -O4 usually emits these from `return -1` inside the test, but may instead branch to a shared epilogue. reshape-able if it branches (keep returns inline); else permuter-class.
 *   confidence: med
 */
// func_0204e868 — strchr-bounded token scan (class C, counted loop)
// func_020ab088(s, ch) == strchr(s, ch). r9=src cursor, r4=dst, r8=count.
// r7 holds strchr(src,0) (end-of-string) computed once up front.

extern char *func_020ab088(char *s, int ch);   // strchr
extern void  func_02094688(char *dst, char *src, int n);  // memcpy

int func_0204e868(char *dst, char *src, int count) {
    char *end0 = func_020ab088(src, 0);   // r7
    int i = 0;                            // r6

    if (count > 0) {
        do {
            char *p = func_020ab088(src, '/');
            if (p == 0) return -1;
            i++;
            src = p + 1;
        } while (i < count);
    }

    {
        char *p = func_020ab088(src, '/');
        if (p == 0) p = end0;
        if (src == p) return -1;
        {
            int len = p - src;             // r5
            func_02094688(src, dst, len);
            dst[len] = 0;
            return len;
        }
    }
}
