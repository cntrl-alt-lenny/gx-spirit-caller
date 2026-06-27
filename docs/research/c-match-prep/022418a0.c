/* CAMPAIGN-PREP candidate for func_022418a0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch jump-table; eor CSE; (h4>>6)&0x1ff bitfield; 0x418 packed-table recombine
 *   risk:       asm truncated mid case 3 (0223de04 arg list + case 4 + .L_854 epilogue all missing); word_cec/TBL_STRIDE/eor base struct all inferred. struct-guessed + truncated-target.
 *   confidence: low
 */
/* func_ov002_022418a0  ov002  class D  MED  (asm TRUNCATED mid case 3)
 * jump-table 0..4 on 0x5b8 step; eor of step-base words; packed table recombine.
 * recipe: switch jump-table; eor CSE x; mla idx into 0x418 table; bitfield recombine.
 */
typedef unsigned short u16;
typedef unsigned char  u8;
typedef int            s32;

struct Obj18a0 { u16 field0; u16 h2; u16 h4; };          /* [0],[4] used */
struct Glob5b8 { u8 pad[0x5b8]; s32 step; s32 stepbc; }; /* 0x5b8 step, 0x5bc word */
struct Glob_d016c { u8 pad[0xd44]; s32 d44; };
struct Glob_d0e6c { u8 pad[0xb0]; u16 hb0; };

extern struct Glob5b8    data_ov002_022ce288;
extern struct Glob_d016c data_ov002_022d016c;       /* + 0xcec word here */
extern u8                data_ov002_022cf16c[];      /* _LIT4 stride? unused-direct */
extern struct Glob_d0e6c data_ov002_022d0e6c;
extern int  func_ov002_021b99b4(int x, u16 hb0);
extern int  func_ov002_021bc618(int x);
extern int  func_ov002_021ca2b8(int x);
extern int  func_ov002_022536e8(int x, u16 f0, int field4_9);
extern void func_ov002_0226b174(int x, u16 f0, int field4_9);
extern void func_ov002_0223de04(void *obj, int a1, int a2, int a3);

extern s32 word_cec;   /* [_LIT1+0xcec] */
extern s32 TBL_STRIDE; /* _LIT4 stride constant */

int func_ov002_022418a0(struct Obj18a0 *obj)
{
    s32 step = data_ov002_022ce288.step;
    s32 x = word_cec ^ data_ov002_022ce288.stepbc;   /* eor r4,r4,r2 */
    switch (step) {
    case 0: default:
        return 0;   /* b .L_854 (epilogue, not shown) */
    case 1:
        data_ov002_022ce288.stepbc = 0;
        data_ov002_022ce288.step = step + 1;
        return 0;
    case 2: {
        int field4_9 = (obj->h4 >> 6) & 0x1ff;   /* (h4<<0x11)>>0x17 */
        if (func_ov002_021bc618(x) == 0) goto adv2;
        if (func_ov002_021ca2b8(x) == 0) goto adv2;
        if (func_ov002_022536e8(x, obj->field0, field4_9) == 0) goto adv2;
        func_ov002_0226b174(x, obj->field0, field4_9);
        data_ov002_022ce288.step = data_ov002_022ce288.step + 1;
        return 0;
    adv2:
        data_ov002_022ce288.step = data_ov002_022ce288.step + 2;
        return 0;
    }
    case 3: {
        int r0 = func_ov002_021b99b4(x, data_ov002_022d0e6c.hb0);
        s32 *t = (s32 *)(data_ov002_022cf16c + (x & 1) * (int)TBL_STRIDE + 0x418);
        s32 w = t[r0];
        int a3 = (int)((unsigned)(w << 0x12) >> 0x1f)
               + (((unsigned)(w << 2) >> 0x18) << 1);
        func_ov002_0223de04(obj, a3, 0, 0);   /* TRUNCATED: full 0223de04 args + case 4 unknown */
        return 0;
    }
    }
}
