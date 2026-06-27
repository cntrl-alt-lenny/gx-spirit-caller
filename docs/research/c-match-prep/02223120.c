/* CAMPAIGN-PREP candidate for func_02223120 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: side*0x868 mla base; sub*0x14 record; packed rhs compare; f4|=8 store; (lo|b5<<8) pack
 *   risk:       reshape-able: the asr#8 on packed (signed hi byte) must use a signed type — if mwcc uses lsr the byte diverges; cast packed result to s16 before >>8. Also decode decl-order. reshape-able.
 *   confidence: med
 */
// func_ov002_02223120 — ov002, class D (packed-field decode + mla index + bitfield store)
#include <stdint.h>
typedef unsigned short u16; typedef unsigned char u8; typedef int s32; typedef unsigned int u32; typedef signed char s8;

struct Ent { u16 f0; u16 f2; u16 f4; };

extern u8 data_ov002_022cf16c[];   // _LIT0 base / _LIT1 = 0x868 stride
extern void func_ov002_021d5d48(int,int);
extern int  func_ov002_0223de94(int,int);
extern int  func_ov002_0223df38(int,int,int);
extern int  func_ov002_0225764c(int,int,int);

int func_ov002_02223120(struct Ent *e)
{
    u16 f2 = e->f2;
    u16 f4 = e->f4;
    int side = (f2 << 0x1f) >> 0x1f;
    int sub  = (f2 << 0x1a) >> 0x1b;
    u8 *base = data_ov002_022cf16c + (side & 1) * 0x868 + 0x30;
    u32 w = *(u32 *)(base + sub * 0x14);
    int lhs = (f4 << 0x11) >> 0x17;
    int rhs = (((w << 2) >> 0x18) << 1) + ((w << 0x12) >> 0x1f);
    if (lhs != rhs) return 0;
    if ((f4 << 0x1d) >> 0x1f) {          // bit2 of f4 set
        e->f4 = (u16)(f4 | 0x8);
        return 0;
    }
    if (func_ov002_0223df38(0, 0, 0) == 0) goto fail;
    {
        int packed = func_ov002_0223de94((int)e, 0);
        int lo = packed & 0xff;
        int hi = ((packed << 0x10) >> 0x10) >> 8;   // sign? asr#8 of (packed<<16>>16)
        if (func_ov002_0225764c((int)e, lo, hi & 0xff) == 0) goto fail;
        u16 g2 = e->f2;
        int b0 = (g2 << 0x1f) >> 0x1f;
        int b5 = (g2 << 0x1a) >> 0x1b;
        int arg = (u16)((b0 & 0xff) | ((b5 & 0xff) << 8));
        func_ov002_021d5d48((packed << 0x10) >> 0x10, arg);
        return 0;
    }
fail:
    e->f4 = (u16)(e->f4 | 0x8);
    return 0;
}
