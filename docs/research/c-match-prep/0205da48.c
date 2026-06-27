/* CAMPAIGN-PREP candidate for func_0205da48 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind c=*p, reload c->count per use, first-used-first-decl, bounds-assert if-branch
 *   risk:       source asm is TRUNCATED at third loop .L_104 so the tail is reconstructed; will not byte-match until full asm supplied. struct-guessed.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_0205da48 (main, class C).
 * UNVERIFIED build-free draft. Drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe:  bind c=*p (single ldr held in r9); reload c->count each use; first-used-first-declared locals; bounds-assert as if-branch
 *   risk:    ASM IS TRUNCATED mid third loop (.L_104) - tail reconstructed, will NOT byte-match as-is; struct offsets guessed.
 *   confidence: low
 */
/* func_0205da48: gather matching child nodes of c->f424 list into an alloc'd
 * pointer array (size c->f210), tag each child->parent->f13c, then two more
 * passes. c = *arg0. (Third pass body is truncated in the source asm.)
 */

extern void *func_020453e8(int size);
extern int   func_0205dba4(void *self);
extern void  func_0205ffc0(void *self, void *arg);
extern void  func_020a6d54(void *a, void *b, int c, int d);
extern unsigned char data_02100e20[];
extern unsigned char data_02100e30[];
extern unsigned char data_02100e50[];

typedef struct Node {
    int          f0;     /* +0x00  type tag (==3) */
    struct Obj  *f4;     /* +0x04  parent/owner */
    char         _p08[0x14 - 0x08];
    int          f14;    /* +0x14  state (!=5) */
    char         _p18[0x1c - 0x18];
    int          f1c;    /* +0x1c  filled in pass 2 */
    char         _p20[0x20 - 0x20];
    struct Node *f20;    /* +0x20  next */
} Node;

typedef struct Obj {
    char _p000[0x13c];
    int  f13c;           /* +0x13c  visited flag */
} Obj;

typedef struct Container {
    char  _p000[0x210];
    int   f210;          /* +0x210  capacity / count */
    char  _p214[0x424 - 0x214];
    Node *f424;          /* +0x424  list head */
} Container;

int func_0205da48(Container **pp) {
    Container *c = *pp;
    int i = 0;
    Node **arr;
    Node *n;
    int j;

    if (c->f210 <= 0) {
        /* L_140 (truncated tail) */
        return 0;
    }
    arr = (Node **)func_020453e8(c->f210 << 2);
    if (arr == 0) {
        func_0205ffc0(pp, data_02100e20);
        return 1;
    }
    n = c->f424;
    if (n != 0) {
        do {
            if (n->f0 == 3 && n->f14 != 5 && n->f4->f13c == 0) {
                if (i >= c->f210) {
                    func_020a6d54(data_02100e30, data_02100e50, i, 0);
                }
                arr[i] = n;
                n->f4->f13c = 1;
                i++;
            }
            n = n->f20;
        } while (n != 0);
    }
    for (j = 0; j < i; j++) {
        int r = func_0205dba4(pp);
        if (r != 0) {
            arr[j]->f1c = r;
        }
    }
    /* third pass (asm truncated): walks arr[0..i) reading ->f4 */
    for (j = 0; j < i; j++) {
        (void)arr[j]->f4;
    }
    return 0;
}
