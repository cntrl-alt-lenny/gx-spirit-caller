/* CAMPAIGN-PREP candidate for func_022442e4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sel1 :1 mla index; packed-bit recombine; chained blx temps in call order
 *   risk:       the 4x blx (021afb74/ba0) feeding 0223de04 rotate r7/r6/r5/ip with a post-call mov shuffle. Operand pick + scheduling of the recombine almost certainly differs. permuter-class.
 *   confidence: low
 */
// func_ov002_022442e4  ov002  switch + mla base + post-blx reg shuffle chain

typedef unsigned short u16;
typedef unsigned char  u8;
typedef int            s32;

struct Obj022442e4 {
    u16 field0;        // [0x0]
    u16 sel1 : 1;      // [0x2] bit0
    u16 pad2 : 15;
};

// _LIT2 base + sel1*0x868 + 0x418, indexed [r0<<2]; element is packed 32-bit
struct Rec022442e4 { s32 packed; };

struct Glob5b8 { u8 pad[0x5b8]; s32 step; };

extern struct Glob5b8 data_ov002_022ce288;
extern u8             data_ov002_022cf16c[];      // _LIT2 base
extern int  func_ov002_0220b004(void);
extern int  func_ov002_021c2e34(int bit);
extern void func_ov002_0223de04(void *obj, int a1, int a2, int a3);
extern void func_ov002_0223fa20(void *obj, int a1);
extern void *func_ov002_021afb74(void);
extern void *func_ov002_021afba0(void);

static int pack_de04(s32 w) {
    // r2 = ((w<<2)>>0x18)<<1 ; r3 = (w<<0x12)>>0x1f ; arg = r2 + r3
    return (((unsigned)(w << 2) >> 0x18) << 1) + ((unsigned)(w << 0x12) >> 0x1f);
}

int func_ov002_022442e4(struct Obj022442e4 *obj, int r5)
{
    int step = data_ov002_022ce288.step;
    if (step == 0) {
        if (func_ov002_0220b004() == 0)
            return 1;
        /* fallthrough to step==1 body */
        func_ov002_0223fa20(obj, r5);
        return 1;
    }
    if (step == 1) {
        func_ov002_0223fa20(obj, r5);
        return 1;
    }
    if (step == 2) {
        int bit = obj->sel1;
        int r0 = func_ov002_021c2e34(bit);
        if (r0 >= 0) {
            int idx = obj->sel1 & 1;
            s32 *base = (s32 *)(data_ov002_022cf16c + idx * 0x868 + 0x418);
            s32 w = base[r0];
            func_ov002_0223de04(obj, 0xe, 0xe, pack_de04(w));
            {
                void *p7 = func_ov002_021afb74();
                void *p6 = func_ov002_021afba0();
                void *p5 = func_ov002_021afb74();
                void *pi = func_ov002_021afb74();
                s32 w7 = *(s32 *)p7;
                s32 w5 = *(s32 *)p5;
                s32 wi = *(s32 *)pi;
                int a1 = (int)((unsigned)(w7 << 0x12) >> 0x1f);
                int a3 = (((unsigned)(wi << 2) >> 0x18) << 1)
                         + ((unsigned)(w5 << 0x12) >> 0x1f);
                func_ov002_0223de04(obj, a1, (int)(long)p6, a3);
            }
        }
    }
    return 1;
}
