/* CAMPAIGN-PREP candidate for func_0207db8c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D :1 byte flag (and#ff;lsl16;lsr16;ands#1); align-down mask; cmp lo for fail
 *   risk:       reshape-able: the [obj-4] byte read modeled as ((u8*)h)[-4] then masked to :16 then tested :1; if mwcc emits ldrb (and#ff only) instead of the lsl16;lsr16 pair, widen via a u16 load. unsigned compare (cmp/blo) needs the operands unsigned — both newp & h->lo as unsigned int.
 *   confidence: med
 */
/* func_0207db8c (main, class D, 0x6c) — align-mask alloc bump + :1 byte flag.
 * obj: +0x0 lo-limit, +0x4 cur (top-down bump pointer), byte-flag at [obj-4]
 * (header preceding obj). Aligns DOWN: new = (cur - size) & ~(align-1). If
 * new < lo-limit -> return 0. Else, if header byte&1 -> Fill32(0, new, cur-new),
 * set cur=new, return new.
 */
extern void Fill32(int fill, void *dst, int n);

typedef struct Heap_b8c {
    int   lo;    /* +0x00 */
    int   cur;   /* +0x04 */
} Heap_b8c;

int func_0207db8c(Heap_b8c *h, int size, int align) {
    int cur = h->cur;
    int mask = ~(align - 1);
    int newp = mask & (cur - size);     /* and r4, ~(align-1), (cur-size) */
    if (newp < h->lo) return 0;
    {
        unsigned int flag = ((unsigned char *)h)[-4]; /* ldr [r5,#-4] */
        int span = cur - newp;                        /* sub r2, r3, r4 */
        flag = (unsigned short)(flag & 0xff);         /* and #ff; lsl16; lsr16 */
        if (flag & 1) {
            Fill32(0, (void *)newp, span);
        }
    }
    h->cur = newp;
    return newp;
}
