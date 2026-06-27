/* CAMPAIGN-PREP candidate for func_02241fec (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :1 bit0; movs+bmi -> signed if(r4<0)return -1; (r4&0xffff) narrow; cd744[bit0] guard
 *   risk:       step==1 'movne r0,#1 / mvneq r0,#0' is ternary !=0?1:-1 — ternary-vs-if-assign could pick different cond regs; and func_021b947c() result is discarded between two calls (ordering). reshape-able (if-assign vs ternary).
 *   confidence: med
 */
/* func_ov002_02241fec  ov002  class D  MED  (COMPLETE asm)
 * 0x5b8 step machine (0,1,else) if-chain; movs/bmi signed-return; cd744[bit0] guard.
 * recipe: :1 bit0; movs r4 then bmi -> signed (r4<0) early return; bind step base.
 */
typedef unsigned short u16;
typedef unsigned char  u8;
typedef int            s32;

struct ObjFEC { u16 field0; u16 bit0:1; u16 pad2:15; };
struct Glob5b8 { u8 pad[0x5b8]; s32 step; };
struct Glob_d016c { u8 pad[0xd44]; s32 d44; };

extern struct Glob5b8    data_ov002_022ce288;
extern s32               data_ov002_022cd744[2];    /* _LIT2 table indexed by bit0 */
extern struct Glob_d016c data_ov002_022d016c;
extern void func_ov002_021ae4bc(int code, int r4);
extern int  func_ov002_021b4120(int bit0, int code, int magic);
extern int  func_ov002_021b947c(void);
extern void func_ov002_021d5b80(int bit0, int code, u16 f0, int zero);
extern void func_ov002_0223dad0(void *obj, u16 r4lo);

int func_ov002_02241fec(struct ObjFEC *obj)
{
    s32 step = data_ov002_022ce288.step;
    if (step == 0) {
        s32 r4 = func_ov002_021b4120(obj->bit0, 0xb, 0x1415);
        if (r4 < 0)
            return -1;
        func_ov002_021b947c();
        func_ov002_0223dad0(obj, (u16)r4);
        func_ov002_021d5b80(obj->bit0, 0xb, obj->field0, 0);
        if (data_ov002_022cd744[obj->bit0] == 1) {
            data_ov002_022d016c.d44 = 1;
        } else {
            func_ov002_021ae4bc(0x35, r4);
        }
        data_ov002_022ce288.step = data_ov002_022ce288.step + 1;
        return 0;
    }
    if (step == 1) {
        return (data_ov002_022d016c.d44 != 0) ? 1 : -1;
    }
    return 1;
}
