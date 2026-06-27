/* CAMPAIGN-PREP candidate for func_0207dbf8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D :1 byte flag; align-up mask; cmp hi for fail (movhi r0,#0); return base
 *   risk:       reshape-able: same byte-flag widening idiom as 0207db8c — keep the (x&0xff)<<16>>16 so mwcc emits lsl16;lsr16 not a bare ldrb. The fail compare is UNSIGNED hi (cmp r4,r2; movhi) — operands must be unsigned; return value is `base` (r5) while span uses `cur` (r0).
 *   confidence: med
 */
/* func_0207dbf8 (main, class D, 0x64) — align-mask alloc bump (up) + :1 byte flag.
 * obj: +0x0 cur (bottom-up bump pointer), +0x4 hi-limit, byte-flag at [obj-4].
 * Aligns UP: base = (cur + (align-1)) & ~(align-1); end = base + size. If
 * end > hi-limit -> return 0. Else if header byte&1 -> Fill32(0, cur, end-cur);
 * set cur=end, return base.
 */
extern void Fill32(int fill, void *dst, int n);

typedef struct Heap_bf8 {
    int   cur;   /* +0x00 */
    int   hi;    /* +0x04 */
} Heap_bf8;

int func_0207dbf8(Heap_bf8 *h, int size, int align) {
    int cur = h->cur;
    int mask = ~(align - 1);
    int base = mask & (cur + (align - 1)); /* and r5, ~(align-1), cur+(align-1) */
    int end  = size + base;                /* add r4, r1, r5 */
    if ((unsigned)end > (unsigned)h->hi) return 0;
    {
        unsigned int flag = ((unsigned char *)h)[-4];
        int span = end - cur;              /* sub r2, r4, r0 */
        flag = (unsigned short)(flag & 0xff);
        if (flag & 1) {
            Fill32(0, (void *)cur, span);
        }
    }
    h->cur = end;
    return base;
}
