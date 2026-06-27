/* CAMPAIGN-PREP candidate for func_02222df8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: state 7f/80 if-chain; side*0x868 mla base; sub*0x14 record; packed rhs compare
 *   risk:       reshape-able: decode block (lhs/rhs) order is the lever — orig allocs lr(bit0) before r3(:5) and folds f4 shift last; if mwcc reorders the three shifts, swap local decl order. reshape-able.
 *   confidence: med
 */
// func_ov002_02222df8 — ov002, class D (state dispatch + bitfield + mla index)
#include <stdint.h>
typedef unsigned short u16; typedef unsigned char u8; typedef int s32; typedef unsigned int u32;

struct Ent { u16 f0; u16 f2; u16 f4; };

extern u8 data_ov002_022ce288[];   // _LIT0 (+0x5a8 state)
extern u8 data_ov002_022cf16c[];   // _LIT1 base / _LIT2 = 0x868 stride
extern void func_ov002_021afb64(int);
extern int  func_ov002_021afb74(void);
extern void func_ov002_021de9d4(int,int,int,int);
extern int  func_ov002_0225368c(int,int,int);
extern int  func_ov002_02257b48(void);
extern void func_ov002_0227adb8(int,int,int,int);

int func_ov002_02222df8(struct Ent *e)
{
    int state = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (state == 0x7f) {                       // .L_838
        int side = (e->f2 << 0x1f) >> 0x1f;
        func_ov002_0225368c(side, e->f0, 0);
        func_ov002_021afb64(0);
        int r = func_ov002_021afb74();
        int s2 = (e->f2 << 0x1f) >> 0x1f;
        func_ov002_0227adb8(s2, r, 1, 0);
        return 0;
    }
    if (state != 0x80) return 0;              // .L_880
    // state == 0x80
    u16 f2 = e->f2;
    u16 f4 = e->f4;
    int side = (f2 << 0x1f) >> 0x1f;
    int sub  = (f2 << 0x1a) >> 0x1b;
    u8 *base = data_ov002_022cf16c + (side & 1) * 0x868 + 0x30;
    u32 w = *(u32 *)(base + sub * 0x14);
    int lhs = (f4 << 0x11) >> 0x17;
    int rhs = (((w << 2) >> 0x18) << 1) + ((w << 0x12) >> 0x1f);
    if (lhs != rhs) return 0;
    if (func_ov002_02257b48() == 0) return 0;
    int s = (e->f2 << 0x1f) >> 0x1f;
    int sb = (e->f2 << 0x1a) >> 0x1b;
    func_ov002_021de9d4((int)e, s, sb, 0);   // note: arg order r0=e,r1=bit0,r2=:5
    return 0x7f;
}
