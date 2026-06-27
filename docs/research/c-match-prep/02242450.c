/* CAMPAIGN-PREP candidate for func_02242450 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch jump-table + case1->case3 fallthrough; :1 bit0; (lo&0xff)|((sum&0xff)<<8) pack; 0xd70 triple
 *   risk:       byte-pack 'and r1,r5,#0xff / and r0,r6,#0xff / orr r0,r1,r0,lsl#8' — operand-first matters: must keep r5(lo) as the OR base. Also case4 sharing .L_88 with case2 is assumed. reshape-able (shifted-or operand-first); cb const struct-guessed.
 *   confidence: med
 */
/* func_ov002_02242450  ov002  class D  MED  (COMPLETE asm)
 * jump-table 0..4 on 0x5b8 step (case0->.L_108 ret 1; case1->.L_30 falls into .L_54;
 * case3->.L_54; case2/4 share .L_88). 0x100 stack buffer. byte-pack -> 0223dad0.
 * recipe: switch jump-table w/ fallthrough; :1 bit0; AND-0xff byte pack OR<<8; 0xd70/d74/d78.
 */
typedef unsigned short u16;
typedef unsigned char  u8;
typedef int            s32;

struct Obj2450 { u16 field0; u16 bit0:1; u16 pad2:15; };
struct Glob5b8 { u8 pad[0x5b8]; s32 step; };
struct Glob_d016c { u8 pad[0xd70]; s32 d70; s32 d74; s32 d78; };

extern struct Glob5b8    data_ov002_022ce288;
extern struct Glob_d016c data_ov002_022d016c;
extern void func_ov002_021ae400(void *buf, int bit0);
extern void func_ov002_021d8770(s32 lo, s32 sum);
extern void func_ov002_0223dad0(void *obj, u16 packed);
extern void func_ov002_022423dc(void);
extern void func_ov002_022593a8(int bit0, u16 f0, void *cb);
extern int  func_ov002_022593f4(void);
extern void func_ov002_0229cf10(void *buf, int a, int b);

extern void *cb_022423dc;   /* _LIT1 = func_ov002_022423dc passed as r2 */

int func_ov002_02242450(struct Obj2450 *obj)
{
    s32 step = data_ov002_022ce288.step;
    char buf[0x100];
    switch (step) {
    case 0: default:
        return 1;            /* .L_108 */
    case 1:                  /* .L_30 -> falls into .L_54 */
        func_ov002_0229cf10(buf, 0x9b, 2);
        func_ov002_021ae400(buf, obj->bit0);
        /* fallthrough */
    case 3:                  /* .L_54 */
        func_ov002_022593a8(obj->bit0, obj->field0, cb_022423dc);
        data_ov002_022ce288.step = data_ov002_022ce288.step + 1;
        return 0;
    case 2:                  /* .L_88, shared with case 4 */
        if (func_ov002_022593f4() != 0) {
            s32 lo  = data_ov002_022d016c.d70;
            s32 sum = data_ov002_022d016c.d74 + data_ov002_022d016c.d78;
            u16 packed;
            func_ov002_021d8770(lo, sum);
            packed = (u16)((lo & 0xff) | ((sum & 0xff) << 8));
            func_ov002_0223dad0(obj, packed);
            data_ov002_022ce288.step = data_ov002_022ce288.step + 1;
            return 0;
        }
        data_ov002_022ce288.step = data_ov002_022ce288.step - 1;
        return 0;
    }
}
