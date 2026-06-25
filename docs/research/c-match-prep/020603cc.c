/* CAMPAIGN-PREP candidate for func_020603cc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind base=*p early, conditional byte-store as if-then, double !!-flatten into func_020585d4 bool arg
 *   risk:       the double bool-flatten (movne1/moveq0 twice) reproduces only if the bool is materialized then re-tested; mwcc may emit a single flatten - reshape-able via temp int b=(x!=0). struct-guessed f418.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_020603cc (main, class D).
 * UNVERIFIED build-free draft. Drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe:  bind base=*p (r4) early; conditional byte-store (streqb) as if-then; double !!-flatten of func_020ab0c4 result into the arg3 bool of func_020585d4
 *   risk:    the double bool-flatten (movne1/moveq0 x2) reproduces only if written as a (x!=0) passed where 0/1 needed; streqb store-order; offsets guessed
 *   confidence: med
 */
/* func_020603cc: if func_020ab054(arg1,key0,7) hit return 0; else base=(*arg0);
 * func_020602c4(arg1,key1,&buf,0x10) -> if ok base->f418 = func_020ace00(&buf);
 * func_020602c4(arg1,key2,base,0x100) -> if 0, *(char*)base = 0;
 * if arg2: func_020585d4(arg0,4,(func_020ab0c4(arg1,key3)!=0)); return 1. */

extern int   func_020585d4(void *p, int a1, int a2);
extern int   func_020602c4(void *h, void *key, void *dst, int len);
extern int   func_020ab054(void *h, void *key, int a2);
extern int   func_020ab0c4(void *h, void *key);
extern int   func_020ace00(void *buf);
extern unsigned char data_02101314[];
extern unsigned char data_0210131c[];
extern unsigned char data_02101324[];
extern unsigned char data_02101330[];

typedef struct Base {
    char _p000[0x418];
    int  f418;           /* +0x418 */
} Base;

int func_020603cc(void **pp, void *h, int arg2) {
    Base *base = (Base *)*pp;
    int buf;

    if (func_020ab054(h, data_02101314, 7) != 0) {
        return 0;
    }
    if (func_020602c4(h, data_0210131c, &buf, 0x10) != 0) {
        base->f418 = func_020ace00(&buf);
    }
    if (func_020602c4(h, data_02101324, base, 0x100) == 0) {
        *(char *)base = 0;
    }
    if (arg2 != 0) {
        func_020585d4(pp, 4, func_020ab0c4(h, data_02101330) != 0);
    }
    return 1;
}
