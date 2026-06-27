/* CAMPAIGN-PREP candidate for func_02241d04 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch jump-table; :1 bit0; cd744[bit0] guard; movlt early-return; 0xd70/d74/d78 add
 *   risk:       asm truncated inside .L_100 (case2/4 shared body after d70/d74 loads missing); cb_LIT2 const + case0 epilogue inferred. The movlt<2 -> movlt#1+ldmltia early return must compile as if(<2)return1. struct-guessed + truncated-target.
 *   confidence: low
 */
/* func_ov002_02241d04  ov002  class D  MED  (asm TRUNCATED mid case 2 / .L_100)
 * jump-table 0..4 on 0x5b8 step (case0->.L_158, case1,3 distinct, case2/4 share .L_100).
 * recipe: switch jump-table; :1 bit0; table[bit0] guard; 0xd70/d74/d78 triple.
 */
typedef unsigned short u16;
typedef unsigned char  u8;
typedef int            s32;

struct ObjD04 { u16 field0; u16 bit0:1; u16 pad2:15; };
struct Glob5b8 { u8 pad[0x5b8]; s32 step; };
struct Glob_d016c { u8 pad[0xd70]; s32 d70; s32 d74; s32 d78; };

extern struct Glob5b8    data_ov002_022ce288;
extern s32               data_ov002_022cd744[2];    /* _LIT1 table indexed by bit0 */
extern struct Glob_d016c data_ov002_022d016c;
extern void func_ov002_021ae400(int bit0, int code);
extern void func_ov002_0223dcc0(void *obj, s32 a1, s32 a2, s32 a3);
extern void func_ov002_0223fd74(void);
extern int  func_ov002_022577dc(void);
extern void func_ov002_0225935c(int bit0, u16 f0, void *cb);
extern int  func_ov002_022593f4(void);
extern void func_ov002_0228df3c(void *obj, int r4, u16 f0);

extern void *cb_LIT2;   /* _LIT2 callback const passed as r2 to 0225935c */

int func_ov002_02241d04(struct ObjD04 *obj, int r4)
{
    s32 step = data_ov002_022ce288.step;
    switch (step) {
    case 0: default:
        return 0;    /* b .L_158 epilogue (not shown) */
    case 1: {
        if (func_ov002_022577dc() < 2)
            return 1;
        func_ov002_021ae400(obj->bit0, 0x92);
        if (data_ov002_022cd744[obj->bit0] == 1) {
            func_ov002_0228df3c(obj, r4, obj->field0);
            data_ov002_022ce288.step = data_ov002_022ce288.step + 2;
            return 0;
        }
        func_ov002_0225935c(obj->bit0, obj->field0, cb_LIT2);
        data_ov002_022ce288.step = data_ov002_022ce288.step + 1;
        return 0;
    }
    case 3:
        func_ov002_021ae400(obj->bit0, 0x93);
        func_ov002_0225935c(obj->bit0, obj->field0, cb_LIT2);
        data_ov002_022ce288.step = data_ov002_022ce288.step + 1;
        return 0;
    case 2:  /* shares .L_100 with case 4 */
        if (func_ov002_022593f4() != 0) {
            func_ov002_0223dcc0(obj, data_ov002_022d016c.d70,
                                data_ov002_022d016c.d74 + data_ov002_022d016c.d78, 0);
        }
        return 0;    /* TRUNCATED: .L_100 body after the d70 loads is cut */
    }
}
