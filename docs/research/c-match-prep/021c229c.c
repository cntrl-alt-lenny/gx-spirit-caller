/* CAMPAIGN-PREP candidate for func_021c229c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: halfword :1/:5 bitfield inserts in asm store-order; 6-word zero-fill; pass 5th stack arg
 *   risk:       struct-guessed + reshape-able: orig interleaves the +2 strh/ldrh re-mask 3x with the zero-fills in an exact order (str ip at +4..+14 emitted late). bitfield write/zero-store interleaving will likely reorder vs asm; needs field-store sequencing.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_021c229c (ov002, class D, MED tier).
 * UNVERIFIED build-free draft; iteration expected.
 *   halfword bitfield-insert store-order into a 0x18-byte stack struct, then tail call.
 *   struct: word0 = arg2; +2 halfword packs bit0=(1-arg0), bits1..5 = arg3(5b), and
 *   clears bits12..13. rest of struct zeroed (6 words). 5th caller arg passed through.
 *   Store-order matters: the +2 halfword is written, reloaded, re-masked 3x in asm.
 */
struct Packet {
    unsigned short w0;
    unsigned short a:1;     /* bit0  = 1-arg0          */
    unsigned short b:5;     /* bits1..5 = arg3 (5-bit) */
    unsigned short :6;
    unsigned short c:2;     /* bits12..13 cleared      */
    unsigned short :2;
    unsigned char  rest[20];
};

extern int func_ov002_021c2084(struct Packet *p, int arg0, int arg1, int arg4);

int func_ov002_021c229c(int arg0, int arg1, int arg2, int arg3, int arg4)
{
    struct Packet p;
    *(int *)&p = 0;
    p.a = 1 - arg0;
    p.w0 = (unsigned short)arg2;
    p.b = arg3;
    p.c = 0;
    *(int *)((char *)&p + 0x4) = 0;
    *(int *)((char *)&p + 0x8) = 0;
    *(int *)((char *)&p + 0xc) = 0;
    *(int *)((char *)&p + 0x10) = 0;
    *(int *)((char *)&p + 0x14) = 0;
    return func_ov002_021c2084(&p, arg0, arg1, arg4);
}
