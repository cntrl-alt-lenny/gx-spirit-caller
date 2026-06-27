/* CAMPAIGN-PREP candidate for func_0221dd08 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     identical-to-0221d028 extract+guard; trailing f8!=0 guard; rsb 1-player arg
 *   risk:       reshape-able: 'rsb r1,r1,#1' = 1-player; player is the bit0 value (r1) reused, so keep it bound (don't re-read h2). Risk same as d028: the bit2 gate may fold to 'and' (re-type as :1 bitfield if so).
 *   confidence: med
 */
/* func_ov002_0221dd08 (ov002, class D) — sibling of 0221d028: same guard +
 * per-player slot bitfield-equality check, but a different trailing call.
 * r0=self. h4 bit2 gates. h2: bit0=player, bits[1..5]=slot. rec=*(int*)(
 * cf16c + player*0x868 + slot*0x14 + 0x30). lhs=(h4>>6)&0x1ff vs rhs=
 * ((rec>>22)&0xff)<<1 + ((rec>>13)&1). Match AND self->f8!=0 ->
 * func_021df818(!player /*1-player*/, 0x1f4). r0=self. */
extern char data_ov002_022cf16c[];
extern int  func_ov002_021df818(int a, int b);

struct Self_dd08 { unsigned short f0; unsigned short f2; unsigned short f4; unsigned short f6; unsigned short f8; };

int func_ov002_0221dd08(void *self) {
    struct Self_dd08 *s = (struct Self_dd08 *)self;
    unsigned int h2, h4, player, slot, rec, lhs, rhs;
    int *base;
    h4 = s->f4;
    if ((h4 >> 2) & 1) return 0;
    h2 = s->f2;
    player = h2 & 1;
    slot = (h2 >> 1) & 0x1f;
    base = (int *)(data_ov002_022cf16c + player * 0x868 + slot * 0x14 + 0x30);
    rec = (unsigned int)*base;
    lhs = ((unsigned int)(h4 << 17)) >> 23;
    rhs = ((((unsigned int)(rec << 2)) >> 24) << 1) + (((unsigned int)(rec << 18)) >> 31);
    if (lhs != rhs) return 0;
    if (s->f8 == 0) return 0;
    func_ov002_021df818(1 - player, 0x1f4);
    return 0;
}
