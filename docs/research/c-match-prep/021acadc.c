/* CAMPAIGN-PREP candidate for func_021acadc (ov005, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield insert via explicit <<30>>26 + bic; signed *8/16 divmod; store-order 0x40/0x44/0x48
 *   risk:       two fragile codegen spots: the bit4 insert may need a real `unsigned short bf:2` struct, and `*8/16` may fold to /2 (lsr) instead of emitting lsl#3 + signed-div. struct-guessed.
 *   confidence: low
 */
/* func_ov005_021acadc: if p1==0 return. Insert (p1&3) into the 2-bit field at
 * bit4 of the u16 at 0x5c; store p2/p3/p5 at 0x40/0x44/0x48; then alloc and
 * cache at 0x3c a buffer sized p1 * (((h16*8)/16 + 2) * 0x60), where h16 is the
 * unsigned halfword at 0x16. */
extern int Task_PostLocked(int, int, int);

void func_ov005_021acadc(void *obj, int p1, int p2, int p3, int p5) {
    if (p1 == 0)
        return;
    {
        unsigned short *h = (unsigned short *)((char *)obj + 0x5c);
        *h = (unsigned short)((*h & ~0x30) | (((unsigned short)p1 << 30) >> 26));
    }
    *(int *)((char *)obj + 0x40) = p2;
    *(int *)((char *)obj + 0x44) = p3;
    *(int *)((char *)obj + 0x48) = p5;
    {
        int cells = (int)(unsigned short)(*(unsigned short *)((char *)obj + 0x16)) * 8 / 16 + 2;
        *(int *)((char *)obj + 0x3c) = Task_PostLocked(p1 * (cells * 0x60), 4, 0);
    }
}
