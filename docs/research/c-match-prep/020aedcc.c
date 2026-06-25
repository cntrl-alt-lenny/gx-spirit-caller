/* CAMPAIGN-PREP candidate for func_020aedcc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: stack struct arg first-used order; bind r0/r1 to r5/r4; if-assign cmp branches
 *   risk:       return-value/type guessed: the cmp<0 and cmp>=r4 early-returns drop into ldmltia with r0 live (not reset). reshape-able once true return type/value confirmed; struct-guessed on Arg layout.
 *   confidence: low
 */
typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;

struct Arg020aedcc {
    int a;
    int b;
    int c;
};

extern int func_020ae474(void *fn, struct Arg020aedcc *arg);
extern int func_020aed64(void);

extern s16 *func_020aedcc(int r0, int r1);

s16 *func_020aedcc(int r0, int r1) {
    struct Arg020aedcc tmp;
    int idx;

    tmp.a = r0;
    tmp.b = r1;
    tmp.c = 0;
    idx = func_020ae474((void *)func_020aed64, &tmp);
    if (idx < 0)
        return 0;
    if ((unsigned int)idx >= (unsigned int)r1) {
        *(s16 *)((char *)r0 + (r1 << 1) - 2) = 0;
        return (s16 *)-1;
    }
    *(s16 *)((char *)r0 + (idx << 1)) = 0;
    return (s16 *)0; /* r0 path returns nothing meaningful; placeholder */
}
