/* CAMPAIGN-PREP candidate for func_022449e4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     r1*0x14 product + mla idx*0x868 base; field4&1 mask; reload globals
 *   risk:       orig: 'mul r3,r1,0x14' then 'ldrh [r3, r2]' with r2=mla base — addends commute; if mwcc emits 'add base+product' in the other order or binds the base, the addr-calc instrs differ. reshape-able (operand-order / inline product).
 *   confidence: med
 */
// func_ov002_022449e4  ov002  mla indexed base + and-mask

typedef unsigned short u16;
typedef unsigned char  u8;
typedef int            s32;

struct Glob_cd3f4 {
    s32 field4;        // [0x4]
    u8  pad8[0x20-0x8];
    s32 field20;       // [0x20]
};

extern struct Glob_cd3f4 data_ov002_022cd3f4;
extern u8                data_ov002_022cf1a4[];     // _LIT2 base
extern void func_ov002_021d6714(int a, int b, int c);
extern void func_ov002_021e2b1c(int v);

int func_ov002_022449e4(void)
{
    s32 r0 = data_ov002_022cd3f4.field4;
    s32 r1 = data_ov002_022cd3f4.field20;
    int idx = r0 & 1;
    u16 *base = (u16 *)(data_ov002_022cf1a4 + idx * 0x868);
    u16 v = *(u16 *)((char *)base + r1 * 0x14);
    if (v == 0) {
        func_ov002_021d6714(data_ov002_022cd3f4.field4,
                            data_ov002_022cd3f4.field20, 1);
        func_ov002_021e2b1c(0x1e);
        func_ov002_021d6714(data_ov002_022cd3f4.field4,
                            data_ov002_022cd3f4.field20, 0);
    }
    return 1;
}
