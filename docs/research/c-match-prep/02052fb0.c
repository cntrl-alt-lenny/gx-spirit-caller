/* CAMPAIGN-PREP candidate for func_02052fb0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bic clear ctx[0x20]&=~1 store-order before call; 0x400 stack buf; CRC poly 0xedb88320
 *   risk:       The &=~1 result is stored back BEFORE func_020a67cc (str precedes bl); if mwcc sinks the store after the call, order diverges. x20/x3c offsets guessed. reshape-able + struct-guessed.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02052fb0 (main, class D, MED tier) — brief 497.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bic flag clear ctx[0x20]&=~1 store-order before call; 0x400 stack buf; CRC poly literal 0xedb88320
 *   risk:       the bic clears bit0 of ctx->x20 and the result is STORED BACK before func_020a67cc runs (str precedes bl); if mwcc sinks the store after the call the order diverges. r0 holds &buf[0] (0x400 stack) passed to both calls. _LIT0=0xedb88320 (CRC32 poly) is the 2nd arg to func_020a67cc. reshape-able (write the &=~1 store as its own statement before the call) + struct-guessed (x20/x3c offsets).
 *   confidence: med
 */
/* func_02052fb0 — main, cls D. r4=obj. obj->x20 &= ~1 (bic, stored back first).
   func_020a67cc(&buf, 0xedb88320) over a 0x400 stack buffer, then
   obj->x3c = func_020a66e8(&buf, obj, 0x3c). */
typedef struct Obj {
    unsigned char _p00[0x20];
    int           x20;    /* +0x20 */
    unsigned char _p24[0x18];
    int           x3c;    /* +0x3c */
} Obj;

extern void func_020a67cc(void *buf, unsigned int seed);
extern int  func_020a66e8(void *buf, Obj *obj, int n);

void func_02052fb0(Obj *obj)
{
    unsigned char buf[0x400];

    obj->x20 &= ~1;
    func_020a67cc(buf, 0xedb88320u);
    obj->x3c = func_020a66e8(buf, obj, 0x3c);
}
