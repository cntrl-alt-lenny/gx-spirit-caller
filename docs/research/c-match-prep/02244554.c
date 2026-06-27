/* CAMPAIGN-PREP candidate for func_02244554 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     addls pc jump-table; eor of two :1 bitfields CSE'd into x; blx temps
 *   risk:       truncated asm (.L_11c body missing) + the 4x-blx rotation (r7/r6/r4/ip) feeding 0223de04. case-3 body unknown and reg rotation won't reshape. permuter-class (plus truncated-target).
 *   confidence: low
 */
// func_ov002_02244554  ov002  jump-table + eor bitfield CSE + post-blx reg rotation

typedef unsigned short u16;
typedef unsigned char  u8;
typedef int            s32;

struct Obj02244554 {
    u16 field0;        // [0x0]
    u16 a1 : 1;        // [0x2] bit0  (lsl#0x1f lsr#0x1f)
    u16 a17: 1;        // [0x2] bit14 (lsl#0x11 lsr#0x1f)
    u16 pad2 : 14;
};

struct Glob5b4 { u8 pad[0x5b4]; s32 step; };
extern struct Glob5b4 data_ov002_022ce288;
extern void func_ov002_021ae400(int x, int y);
extern void func_ov002_021af9d0(int x, int a, u16 f0, int z);
extern void func_ov002_0223de04(void *obj, int a1, int a2, int a3);
extern int  func_ov002_022536e8(int x, u16 f0, int z);
extern void *func_ov002_021afb74(void);
extern void *func_ov002_021afba0(void);

int func_ov002_02244554(struct Obj02244554 *obj, int r4)
{
    u16 h = obj->field0;
    int x = ((h >> 14) & 1) ^ (h & 1);     // eor r6,r2,r6 ; r2=bit14 r6=bit0
    int step = data_ov002_022ce288.step;
    switch (step) {
    case 0:
        if (func_ov002_022536e8(x, obj->field0, 0) == 0)
            return 1;
        func_ov002_021ae400(x, 0x5e);
        data_ov002_022ce288.step = data_ov002_022ce288.step + 1;
        return 0;
    case 1:
        func_ov002_021af9d0(x, 6, obj->field0, 0);
        data_ov002_022ce288.step = data_ov002_022ce288.step + 1;
        return 0;
    case 2:
        {
            void *p7 = func_ov002_021afb74();
            void *p6 = func_ov002_021afba0();
            void *p4 = func_ov002_021afb74();
            void *pi = func_ov002_021afb74();
            s32 w4 = *(s32 *)p4;
            s32 wi = *(s32 *)pi;
            s32 w7 = *(s32 *)p7;
            int a3 = (((unsigned)(wi << 2) >> 0x18) << 1)
                     + ((unsigned)(w4 << 0x12) >> 0x1f);
            int a1 = (int)((unsigned)(w7 << 0x12) >> 0x1f);
            func_ov002_0223de04(obj, a1, (int)(long)p6, a3);
            data_ov002_022ce288.step = data_ov002_022ce288.step + 1;
            return 0;
        }
    case 3:
    default:
        return 1;
    }
}
