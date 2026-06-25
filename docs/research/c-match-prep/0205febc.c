/* CAMPAIGN-PREP candidate for func_0205febc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard->4, hit->3, else store src->fc/f10 to adjacent slots passed via ldmia pair, then func_02058528
 *   risk:       the str-then-ldmia {r1,r2} two-word pass (pair0/pair1 must be adjacent stack locals) may not reproduce as a register pair; reshape-able via local adjacency. struct-guessed.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0205febc (main, class C).
 * UNVERIFIED build-free draft. Drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe:  guard returns 4; ==true branch returns 3; else store f.c/f.10 into adjacent stack slots and pass as a pair via ldmia (struct-copy idiom)
 *   risk:    the str f.c/f.10 -> ldmia {r1,r2} pair (two adjacent stack locals passed together) must reproduce; offsets/copy-shape guessed
 *   confidence: med
 */
/* func_0205febc: validate (func_020603cc) else 4; if func_020ab054 hit, log +
 * notify, return 3; else copy src->f.c/f.10 into a node and call func_02058528;
 * fall through to func_0205bd58(r6,src). */

extern void *func_020453e8(int size);
extern int   func_02058528(void *c, void *src, void *node, int a, int b);
extern int   func_020585d4(void *c, int a1, int a2);
extern void  func_0205bd58(void *c, void *src);
extern void  func_0205ffc0(void *c, void *arg);
extern void  func_0205ffd4(void *c, int a1, void *arg);
extern int   func_020603cc(void *c, void *key, int a2);
extern int   func_020ab054(void *key, void *arg, int a2);
extern unsigned char data_021011ec[];
extern unsigned char data_021011f4[];
extern unsigned char data_02101224[];

typedef struct Src {
    char _p00[0x0c];
    int  fc;             /* +0x0c */
    int  f10;            /* +0x10 */
} Src;

int func_0205febc(void *c, Src *src, void *key) {
    int pair0, pair1;
    int *node;

    if (func_020603cc(c, key, 1) != 0) {
        return 4;
    }
    if (func_020ab054(key, data_021011ec, 4) != 0) {
        func_0205ffd4(c, 1, data_021011f4);
        func_020585d4(c, 3, 1);
        return 3;
    }
    pair0 = src->fc;
    pair1 = src->f10;
    if (pair0 == 0) {
        func_0205bd58(c, src);
        return 0;
    }
    node = (int *)func_020453e8(4);
    if (node == 0) {
        func_0205ffc0(c, data_02101224);
        return 1;
    }
    node[0] = 0;
    {
        int r = func_02058528(c, src, 0, pair0, pair1);
        if (r != 0) return r;
    }
    func_0205bd58(c, src);
    return 0;
}
