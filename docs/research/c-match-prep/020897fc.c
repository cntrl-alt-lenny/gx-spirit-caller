/* CAMPAIGN-PREP candidate for func_020897fc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: bic align as (n&~0x1f); store fields in asm order 8,c,10,14; +0x20 tail
 *   risk:       struct-guessed: field offsets/heap-at-0 inferred. Also store-order: asm interleaves ldr [sp,#0x18] between str 0x10 and 0x14 — mwcc may hoist the load, reordering stores 1-2 slots.
 *   confidence: med
 */
/* func_020897fc (main, class D): round-up-to-32 + 32 header, alloc,
 * then store-order field init (0x8,0xc,0x10,0x14), return base+0x20.
 *   add r0,r7,#0x1f; bic r1,r0,#0x1f; add r1,#0x20  => ((n+0x1f)&~0x1f)+0x20
 *   movs r4,r0; moveq -> NULL check on alloc result.
 *   5th arg read from [sp,#0x18] -> stack param arg4. */
extern int   func_0207cfc8(void *p, int v);
extern void  func_0207d12c(void *a0, void *blk);
extern void *func_0207dab4(int heap, int size, int align);

typedef struct {
    int heap;           /* +0x00 */
    char _pad_04[0x04]; /* +0x04 (sub-allocator at +0x4) */
    int field08;        /* +0x08 */
    int field0c;        /* +0x0c */
    int field10;        /* +0x10 */
    int field14;        /* +0x14 */
} Blk_020897fc;

void *func_020897fc(void *self, int size, int arg2, int arg3, int arg4) {
    Blk_020897fc *s = (Blk_020897fc *)self;
    Blk_020897fc *blk;

    blk = (Blk_020897fc *)func_0207dab4(s->heap, ((size + 0x1f) & ~0x1f) + 0x20, 0x20);
    if (blk == 0) {
        return 0;
    }
    func_0207cfc8((char *)s + 4, 0);
    blk->field08 = size;
    blk->field0c = arg2;
    blk->field10 = arg3;
    blk->field14 = arg4;
    func_0207d12c(s, blk);
    return (char *)blk + 0x20;
}
