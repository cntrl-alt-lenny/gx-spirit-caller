/* CAMPAIGN-PREP candidate for func_02207250 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D bitfield: shift-pair extracts; unencodable mask -> shift; tail-call as !=0
 *   risk:       reshape-able: compare ((w>>9)&1)==(v&1) — asm keeps v<<31 in a reg then lsr inline; mwcc may emit one extra mov reducing both bits before cmp.
 *   confidence: med
 */
/* func_ov002_02207250 (ov002, cls D): leaf bitfield guard chain + tail call.
 * Entity *r0: u16 @+2 (type6=bits[11:6], bit0), u32 @+0x14 (bit9, bits[22:19],
 * bits[8:0]). data_022d0250 is a u16 table; byte index = field9*4. Final extract
 * (x<<0x13)>>0x13 == x & 0x1fff (mask unencodable -> shift pair). Returns 0/1. */
struct Ent {
    char _0[2];
    unsigned short f2;          /* +0x2  */
    char _4[0x10];
    unsigned int  f14;          /* +0x14 */
};
extern unsigned short data_ov002_022d0250[];
extern int func_0202e234(int);

int func_ov002_02207250(struct Ent *c) {
    unsigned short v;
    unsigned int   w;
    v = c->f2;
    if (((v << 0x14) >> 0x1a) != 0x16)
        return 0;
    w = c->f14;
    if (((w << 0x16) >> 0x1f) == ((v << 0x1f) >> 0x1f))
        return 0;
    if (((w << 0x9) >> 0x1c) != 0xe)
        return 0;
    return func_0202e234(*(unsigned short *)((char *)data_ov002_022d0250 +
               ((w << 0x17) >> 0x15)) & 0x1fff) != 0;
}
