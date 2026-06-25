/* CAMPAIGN-PREP candidate for func_02074b38 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind b->_c in one reg; load _82c once, reuse on +=; unsigned types for bcc
 *   risk:       the `size < end-cur` test must stay UNSIGNED (asm bcc); if size/cur are signed, mwcc emits blt and diverges. reshape-able (use unsigned).
 *   confidence: med
 */
/* func_02074b38: ring/arena accessor. b = owner->_c.
 *   avail = b->_828 - b->_82c   (UNSIGNED compare: bcc)
 *   if (size < avail) { b->_82c += size; return; }
 *   else free b->_824 (if set) via fn-ptr data_0219ef0c, then b->_824 = 0.
 * b bound once in r4; b->_82c (cur) loaded once and reused on the += path. */
typedef void (*FreeFn)(void *);
extern FreeFn data_0219ef0c;

void func_02074b38(unsigned size, void *owner) {
    char *b = *(char **)((char *)owner + 0xc);
    unsigned end = *(unsigned *)(b + 0x828);
    unsigned cur = *(unsigned *)(b + 0x82c);
    if (size < end - cur) {
        *(unsigned *)(b + 0x82c) = cur + size;
        return;
    }
    if (*(void **)(b + 0x824) != 0) {
        FreeFn fn = data_0219ef0c;
        fn(*(void **)(b + 0x824));
    }
    *(void **)(b + 0x824) = 0;
}
