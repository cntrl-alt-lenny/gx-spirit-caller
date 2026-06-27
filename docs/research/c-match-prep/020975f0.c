/* CAMPAIGN-PREP candidate for func_020975f0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order + read-field-back reload idiom + NULL->default if-assign
 *   risk:       f2c/f34/f50 use store-then-reload (ldr;str). If mwcc value-forwards instead of reloading the struct field, those 3 diverge. Reshape-able (force the read).
 *   confidence: med
 */
/* func_020975f0 - initialize alarm/list-node parameter block.
 * Class C: many field stores with store-then-reload ordering.
 * Recipe: stores emitted in asm order; the 'store f3c then copy to
 * f2c' idiom is modeled by READING the struct field back (not reusing
 * the incoming value), which is what produces the ldr/str reload pair.
 * Two NULL params are replaced by default fn ptrs via if(!p)p=default. */

typedef struct Node {
    char _pad00[0x1c];
    unsigned int f1c;   /* +0x1c flags */
    char _pad20[0x28 - 0x20];
    void *f28;          /* +0x28 */
    char _pad2c[0x2c - 0x2c]; /* fields below are dense */
    void *f2c;          /* +0x2c */
    void *f30;          /* +0x30 */
    void *f34;          /* +0x34 */
    void *f38;          /* +0x38 */
    void *f3c;          /* +0x3c */
    int   f40;          /* +0x40 */
    int   f44;          /* +0x44 */
    void *f48;          /* +0x48 */
    void *f4c;          /* +0x4c */
    void *f50;          /* +0x50 */
} Node;

extern void func_02097d0c(void);
extern void func_02097d38(void);

int func_020975f0(Node *o, void *a1, void *a2, void *a3,
                  void *a4, void *a5, void *a6, void *a7) {
    o->f28 = a1;
    o->f30 = a3;
    o->f3c = a2;
    o->f2c = o->f3c;
    o->f38 = a5;
    o->f40 = (int)a4;
    o->f34 = (void *)o->f40;
    if (a6 == 0) a6 = (void *)func_02097d38;
    o->f48 = a6;
    if (a7 == 0) a7 = (void *)func_02097d0c;
    o->f4c = a7;
    o->f50 = o->f48;
    o->f44 = 0;
    o->f1c |= 0x2;
    return 1;
}
