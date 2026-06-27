/* CAMPAIGN-PREP candidate for func_0201a920 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     default val=0 pre-set; sparse-value switch binary tree; :16 bitfield low-half insert at obj+0x18
 *   risk:       reshape-able/struct-guessed: mwcc must reproduce the bgt/bge binary-search tree over these 6 sparse keys; case order is set to match. func_02018b94(key) arg is inferred from r0 still=key at the call.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0201a920 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Sparse power-of-two switch -> magic constant (val, r4=0 default),
 * then insert val into low-16 bitfield of obj+0x18, notify, return val.
 *   val<<16>>16 insert => :16 bitfield; obj = func_02018b94(key).
 */
extern void *func_02018b94(int);
extern void func_02018a84(int, int);

struct objf18 { unsigned lo16 : 16; unsigned hi16 : 16; };

int func_0201a920(int key) {
    int val;
    void *obj;
    switch (key) {
    case 0x8000:   val = 0x161d; break;
    case 0x10000:  val = 0x154c; break;
    case 0x20000:  val = 0x132f; break;
    case 0x40000:  val = 0x119b; break;
    case 0x80000:  val = 0x1798; break;
    case 0x100000: val = 0x18f6; break;
    default:       val = 0;      break;
    }
    obj = func_02018b94(key);
    ((struct objf18 *)((char *)obj + 0x18))->lo16 = val;
    func_02018a84(val, 1);
    return val;
}
