/* CAMPAIGN-PREP candidate for func_0206b8fc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload *data_0219ecd4 each use (3 ldr); a-call then b-call; rsbeq negate
 *   risk:       orig reloads `*data_0219ecd4` 3 separate times (ldr _LIT0; ldr [r1]) for f498/f498/f49c. If mwcc CSEs the pointer into one reg, those 3 ldr collapse to 1. permuter-class (mwcc CSE policy; may need separate read helpers or escape).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0206b8fc (main, class C) - brief 494.
 * UNVERIFIED build-free draft. recipe: global (*data_0219ecd4) RELOADED at
 * every use (do not CSE); two symmetric calls; conditional rsb-negate tail.
 */
/* func_0206b8fc: a=func_02068ab4(*arg0,(*g)->f498,data_02101df8);
 * b=func_02068ab4(*arg1,(*g)->f498,data_02101df8);
 * r=func_020aaf40(a,b); if((*g)->f49c==0) r=-r; return r;  g=data_0219ecd4. */

typedef struct { char _pad[0x498]; void *f498; void *f49c; } Glob;

extern Glob *data_0219ecd4;
extern const char data_02101df8[];
extern int func_02068ab4(void *a, void *b, const char *c);
extern int func_020aaf40(int a, int b);

int func_0206b8fc(void **arg0, void **arg1)
{
    int a = func_02068ab4(*arg0, data_0219ecd4->f498, data_02101df8);
    int b = func_02068ab4(*arg1, data_0219ecd4->f498, data_02101df8);
    int r = func_020aaf40(a, b);
    if (data_0219ecd4->f49c == 0)
        r = -r;
    return r;
}
