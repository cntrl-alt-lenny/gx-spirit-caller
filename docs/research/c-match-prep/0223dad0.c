/* CAMPAIGN-PREP candidate for func_0223dad0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two-:8 bitfield holder at +6 (count = hi byte); count read before store; arr[count]=val store-order
 *   risk:       struct-guessed: arr base is +8 = &count holder +2, index *2 (u16). The asm reads count, computes count+1 (u16 trunc), bic #0xff00 + insert <<8, strh, THEN arr store. If field decl gives `and` not the insert, byte differs; confirm Buf layout.
 *   confidence: med
 */
/* func_ov002_0223dad0 (ov002, class D, leaf): self->f6 packs (lo:8, count:8);
 * read count, store r1 into the u16 array at +8 indexed by count, then write
 * count+1 back (byte-masked, truncated to u8). strh store-order. */
typedef unsigned short u16;
typedef unsigned int   u32;

struct Buf { u16 f0; u16 f2; u16 f4; u16 lo : 8; u16 count : 8; u16 arr[1]; };

void func_ov002_0223dad0(struct Buf *b, u16 val) {
    unsigned ip = b->count;
    b->count = (u16)(ip + 1);
    b->arr[ip] = val;
}
