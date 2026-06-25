/* CAMPAIGN-PREP candidate for func_0224345c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0 :1 bitfield; bind 0x5b8 base; reload step after str
 *   risk:       orig holds _LIT0 base in r1 across load+store of 0x5b8 (re-ldr after str). If mwcc keeps base bound vs reloads, the trailing ldr/str pair diverges. reshape-able (bind/reload flip).
 *   confidence: med
 */
// func_ov002_0224345c  ov002  step-dispatch, bit0 extract shared

typedef unsigned short u16;
typedef unsigned char  u8;
typedef int            s32;

struct Obj0224345c {
    u16 field0;       // [0x0]
    u16 bit0 : 1;     // [0x2] bit0
    u16 pad2 : 15;
};

struct Glob5b8 {
    u8  pad[0x5b8];
    s32 step;         // [0x5b8]
};
struct Glob5b8_d0e6c { u8 pad[0xb2]; u16 v; };

extern struct Glob5b8        data_ov002_022ce288;
extern struct Glob5b8_d0e6c  data_ov002_022d0e6c;
extern void func_ov002_0223de04(void *obj, int a1, int a2, int a3);
extern int  func_ov002_022536e8(int bit, u16 f0);
extern void func_ov002_0226b194(int neg, u16 f0);

int func_ov002_0224345c(struct Obj0224345c *obj)
{
    int bit = obj->bit0;
    int step = data_ov002_022ce288.step;
    if (step == 0) {
        if (func_ov002_022536e8(bit, obj->field0) == 0)
            return -1;
        data_ov002_022ce288.step = data_ov002_022ce288.step + 1;
        return 0;
    }
    if (step == 1) {
        func_ov002_0226b194(1 - bit, obj->field0);
        data_ov002_022ce288.step = data_ov002_022ce288.step + 1;
        return 0;
    }
    if (step == 2) {
        func_ov002_0223de04(obj, bit, 0xe, data_ov002_022d0e6c.v);
    }
    return 1;
}
