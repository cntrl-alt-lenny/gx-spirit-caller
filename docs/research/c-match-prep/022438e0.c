/* CAMPAIGN-PREP candidate for func_022438e0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     idx1 :1 index into _LIT1 table; bind 0x5b8 base across step1 store
 *   risk:       in step==1 path orig reuses r1 (_LIT0 base still live from the cmp) for 'str 0 [r1,#0x5b8]'. If mwcc reloads data_ov002_022ce288 there, one ldr diverges. reshape-able (bind/reload flip).
 *   confidence: med
 */
// func_ov002_022438e0  ov002  step-machine; bitfield narrow + bind 0x5b8 base

typedef unsigned short u16;
typedef unsigned char  u8;
typedef int            s32;

struct Obj022438e0 {
    u16 field0;        // [0x0]
    u16 idx1 : 1;      // [0x2] bit0
    u16 pad2 : 15;
    u16 padc[5];       // up to 0xc
    u16 fieldC;        // [0xc]
};

struct Glob5b8 { u8 pad[0x5b8]; s32 step; };
struct Glob_d016c { u8 pad[0xd44]; s32 flagd44; };

extern struct Glob5b8   data_ov002_022ce288;
extern s32              data_ov002_022cd744[2];   // _LIT1 table indexed by idx1
extern struct Glob_d016c data_ov002_022d016c;
extern void func_ov002_021ae484(int v);
extern int  func_ov002_021ff500(void *obj);
extern int  func_ov002_0223fa20(void *obj, int a1);

int func_ov002_022438e0(struct Obj022438e0 *obj, int r5)
{
    int step;
    if (func_ov002_021ff500(obj) == 0)
        return 1;
    if (obj->fieldC == 0) {
        step = data_ov002_022ce288.step;
        if (step == 0) {
            if (data_ov002_022cd744[obj->idx1] == 1) {
                data_ov002_022d016c.flagd44 = 1;
            } else {
                func_ov002_021ae484(0x2f);
            }
            data_ov002_022ce288.step = data_ov002_022ce288.step + 1;
            return 0;
        }
        if (step == 1) {
            if (data_ov002_022d016c.flagd44 == 0)
                return 1;
            data_ov002_022ce288.step = 0;
            obj->fieldC = 1;
            return 0;
        }
    }
    return func_ov002_0223fa20(obj, r5);
}
