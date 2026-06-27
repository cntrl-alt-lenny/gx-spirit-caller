/* CAMPAIGN-PREP candidate for func_022440d8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: bitfield lsl;lsr narrows, mla table base, decl-order f6 then bit0/f5
 *   risk:       struct-guessed: table data_022cf16c stride 0x868/0x14/+0x30 and word bit-fields (22-29,13) inferred; clone of 022437b4 .L_24 math — if struct wrong both diverge identically.
 *   confidence: low
 */
// func_ov002_022440d8 — bitfield extracts + mla indexed table compare (cls D)
// obj+0x2 -> field6 (bits6..11). if ==2 return 1.
// else bit0(:1), table data_022cf16c + bit0*0x868 + field5(bits1-5)*0x14 + 0x30 -> word
// lhs = obj+0x4 bits6..14 ; rhs = ((word>>22)&0xff)*2 + ((word>>13)&1); if !=, ret1; else tail-call

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern void func_ov002_0223fb48(u16 *obj);

int func_ov002_022440d8(u16 *obj) {
    u16 h2 = obj[1];                 /* obj+0x2 */
    u32 f6 = (u32)(h2 << 0x14) >> 0x1a;     /* bits6..11 */
    if (f6 == 2)
        return 1;
    {
        u32 bit0 = (u32)(h2 << 0x1f) >> 0x1f;
        u32 f5   = (u32)(h2 << 0x1a) >> 0x1b;   /* bits1..5 */
        u8 *base = data_ov002_022cf16c + bit0 * 0x868;
        u16 h4 = obj[2];                         /* obj+0x4 */
        u32 word = *(u32 *)(base + f5 * 0x14 + 0x30);
        u32 lhs  = (u32)(h4 << 0x11) >> 0x17;    /* bits6..14 */
        u32 rhs  = (((word << 0x2) >> 0x18) << 0x1) + ((word << 0x12) >> 0x1f);
        if (lhs != rhs)
            return 1;
    }
    func_ov002_0223fb48(obj);
    return 0;   /* tail: r0 from func_ov002_0223fb48 (bl then ldmia pc) */
}
