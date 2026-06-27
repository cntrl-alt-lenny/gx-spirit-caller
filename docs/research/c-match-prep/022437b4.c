/* CAMPAIGN-PREP candidate for func_022437b4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: bitfield lsl;lsr narrows, mla table base, bind step reload, store order
 *   risk:       struct-guessed: table data_022cf16c offsets 0x868/0x14/0x30 and word bit-fields (22-29,13) inferred from shifts; if real struct differs, ldr offset/decode diverge.
 *   confidence: low
 */
// func_ov002_022437b4 — ov002 step-dispatch state handler (cls D)
// state struct base data_ov002_022ce288, step counter at +0x5b8
// packed halfword at obj+0x2 -> bit0 (:1), bits1-5 (:5)
// halfword at obj+0x4 -> bits6..14 (:9 after lsl17;lsr23) compared to table-word decode
// table: data_ov002_022cf16c + bit0*0x868 + field5*0x14 + 0x30 -> word; decode (>>22 &0xff)*2 + (>>13 &1)

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022ce288[];
extern u8 data_ov002_022cf16c[];
extern u8 data_ov002_022d0e6c[];

extern void func_ov002_021d90c0(u32 a, u32 b, u32 c);
extern void func_ov002_0223dad0(void *obj, u32 b);
extern void func_ov002_0226b0b0(u32 a, u32 b, u32 c);
extern void func_ov002_0226b0f0(u32 a, u32 b, u32 c, u32 d);

int func_ov002_022437b4(u16 *obj) {
    int step = *(int *)(data_ov002_022ce288 + 0x5b8);
    if (step == 0) {
        u16 h2 = obj[1];        /* obj+0x2 */
        u16 h4 = obj[2];        /* obj+0x4 */
        u32 bit0 = (h2 << 0x1f) >> 0x1f;
        u32 f5   = (h2 << 0x1a) >> 0x1b;
        u8 *base = data_ov002_022cf16c + bit0 * 0x868;
        u32 word = *(u32 *)(base + f5 * 0x14 + 0x30);
        u32 lhs  = (h4 << 0x11) >> 0x17;
        u32 rhs  = (((word << 0x2) >> 0x18) << 0x1) + ((word << 0x12) >> 0x1f);
        if (lhs != rhs)
            return 1;
        func_ov002_0226b0f0(obj[0], 1, 0xff, /*r3 already 0xff via reg*/ 0xff);
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    } else if (step == 1) {
        u16 h2 = obj[1];
        u16 v = *(u16 *)(data_ov002_022d0e6c + 0xb2);
        func_ov002_021d90c0((h2 << 0x1f) >> 0x1f, (h2 << 0x1a) >> 0x1b, v);
        func_ov002_0223dad0(obj, v);
        {
            u16 h2b = obj[1];
            u32 inv = 1 - (((h2b << 0x1f) >> 0x1f));
            func_ov002_0226b0b0(inv, 0x171f, v);
        }
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    }
    return 1;
}
