/* CAMPAIGN-PREP candidate for func_02243f38 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: addls pc jump-table, bit0 narrow + rsb(1-x), reload global per use
 *   risk:       struct-guessed: _LIT3 (case3 r1 arg) value not in extract — placeholder; data_022d0e6c +0xb0/+0xb2 are u16 fields inferred. rsb arg order reshape-able if it diverges.
 *   confidence: low
 */
// func_ov002_02243f38 — jump-table state machine (cls D)
// step at base+0x5b8: switch(step){0->.L_1a0;1->.L_1d4;2->.L_218;3->.L_244; default(>3)->ret1}
// bitfield bit0 narrows from obj+0x2; rsb -> 1-bit0; data_022d0e6c fields at +0xb0/+0xb2

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022ce288[];
extern u8 data_ov002_022d0e6c[];

extern void func_ov002_0223dad0(void *obj, u16 b);
extern void func_ov002_0226b0b0(u32 a, u32 b, u16 c);
extern void func_ov002_0226b0f0(u32 a, u16 b, u32 c, u32 d);
extern void func_ov002_0226b158(u32 a, u16 b);

int func_ov002_02243f38(u16 *obj) {
    int step = *(int *)(data_ov002_022ce288 + 0x5b8);
    switch (step) {
    default:
        return 1;                       /* .L_288 */
    case 0: {                           /* .L_1a0 */
        u16 h2 = obj[1];
        u16 h0 = obj[0];
        func_ov002_0226b0f0((u32)(h2 << 0x1f) >> 0x1f, h0, 1, 0xff);
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    }
    case 1: {                           /* .L_1d4 */
        func_ov002_0223dad0(obj, *(u16 *)(data_ov002_022d0e6c + 0xb2));
        {
            u16 h2 = obj[1];
            u32 bit0 = (u32)(h2 << 0x1f) >> 0x1f;
            u16 v = *(u16 *)(data_ov002_022d0e6c + 0xb2);
            func_ov002_0226b0b0(1 - bit0, 0x171f, v);
        }
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    }
    case 2: {                           /* .L_218 */
        u16 h2 = obj[1];
        u16 h0 = obj[0];
        func_ov002_0226b158((u32)(h2 << 0x1f) >> 0x1f, h0);
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    }
    case 3: {                           /* .L_244 */
        func_ov002_0223dad0(obj, *(u16 *)(data_ov002_022d0e6c + 0xb0));
        {
            u16 h2 = obj[1];
            u32 bit0 = (u32)(h2 << 0x1f) >> 0x1f;
            u16 v = *(u16 *)(data_ov002_022d0e6c + 0xb0);
            func_ov002_0226b0b0(1 - bit0, 0xb158 /*r1=_LIT3*/, v);
        }
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    }
    }
}
