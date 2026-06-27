/* CAMPAIGN-PREP candidate for func_0206d404 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-assign clamp chain (movgt); lsl#1 = <<1; load cap pre-branch; decl-order g,n,cap
 *   risk:       reshape-able/struct-guessed: orig does NOT save OS_DisableIrq return (no str of r0) yet restores — implies RestoreIrq gets the same global-derived val; my saved=0 is a guess. _LIT0 deref [+4] then [+0xa4] chain may mismatch if struct layout off.
 *   confidence: low
 */
/* func_0206d404 @ main : class C (irq-bracketed clamp, conditional mul exit) */
typedef int OSIntrMode;
typedef struct Glob Glob;
typedef struct GobjA GobjA;
typedef struct Caps Caps;
struct GobjA {
    char pad00[0x2c];
    unsigned short s2c;   /* 0x2c */
    unsigned short s2e;   /* 0x2e */
};
struct Glob {
    char pad00[0xa4];
    GobjA *a4;            /* 0xa4 */
};
struct Caps {
    char pad00[0x24];
    int cap24;            /* 0x24 */
};

extern OSIntrMode OS_DisableIrq(void);
extern void OS_RestoreIrq(OSIntrMode mode);
extern int func_020b3870(void *self, int n);
extern Glob *const data_021a63d0;   /* _LIT0: [+4] -> Glob* */
extern Caps  data_0219ecec;         /* _LIT1: [+0x24] cap */

int func_0206d404(void *self)
{
    GobjA *g;
    int n;
    int cap;

    g = (*(Glob **)((char *)&data_021a63d0 + 4))->a4;
    OS_DisableIrq();
    cap = data_0219ecec.cap24;
    if (g != 0 && g->s2e != 0 && g->s2c != 0) {
        int v = g->s2e;
        if (v > g->s2c) v = g->s2c;
        if (v > cap) v = cap;
        n = v << 1;
    } else {
        n = cap << 1;
    }
    OS_RestoreIrq(/*saved*/0);
    if (n > 0) {
        int r = func_020b3870(self, n);
        if (r > 0) {
            return n * r;
        }
    }
    return (int)(unsigned long)self;
}
