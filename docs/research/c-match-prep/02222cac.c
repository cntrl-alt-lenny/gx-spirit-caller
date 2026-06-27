/* CAMPAIGN-PREP candidate for func_02222cac (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :2/:6/:5 bitfield decode + side*0x868 mla base + sub*0x14 record; packed rhs compare
 *   risk:       struct-guessed: _LIT2/_LIT3 constants (the f0 jump-table base + the bgt/bge bounds) are not in the batch slice, so the second switch is a stub. The mla base+sub*0x14 may CSE differently. struct-guessed.
 *   confidence: low
 */
// func_ov002_02222cac — ov002, class D (packed-field decode + mla 2D-index + jump-table)
#include <stdint.h>
typedef unsigned short u16; typedef unsigned char u8; typedef int s32; typedef unsigned int u32;

struct Ent { u16 f0; u16 f2; u16 f4; };

extern u8 data_ov002_022cf16c[];   // _LIT0 base, _LIT1 = 0x868 stride
extern void func_ov002_021de910(void);
extern void func_ov002_0220e75c(void);
extern void func_ov002_02210104(void);
extern void func_ov002_0221074c(void);
extern void func_ov002_0221a798(void);
extern void func_ov002_0221b6d4(void);
extern void func_ov002_02220340(void);
extern void func_ov002_02221fc0(void);
extern void func_ov002_0222623c(void);

int func_ov002_02222cac(struct Ent *e)
{
    u16 f2 = e->f2;
    int typ = (f2 << 0x12) >> 0x1e;       // bits[13:12] :2 field
    if (typ == 1 && (((f2 << 0x14) >> 0x1a) == 5)) {   // bits[11:6] :6 == 5
        int side = (f2 << 0x1f) >> 0x1f;                // bit0
        int sub  = (f2 << 0x1a) >> 0x1b;                // bits[5:1] :5
        u8 *base = data_ov002_022cf16c + (side & 1) * 0x868 + 0x30;
        u16 f4 = e->f4;
        u32 w = *(u32 *)(base + sub * 0x14);
        int lhs = (f4 << 0x11) >> 0x17;                 // bits[14:9] :6 of f4
        int rhs = (((w << 2) >> 0x18) << 1) + ((w << 0x12) >> 0x1f);
        if (lhs != rhs) return 0;
        func_ov002_021de910();
        return 0;
    }
    switch (e->f0 - /*_LIT2*/ 0) {   // jump-table over f0; see note
    default: return 0;
    }
}
