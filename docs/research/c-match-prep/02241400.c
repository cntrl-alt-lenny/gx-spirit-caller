/* CAMPAIGN-PREP candidate for func_02241400 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :1 + (x<<0x1a)>>0x1b bits[5:1] bitfields; bind 0x5b8 base; rsb 1-bit0
 *   risk:       step==2 arg order: orig does rsb r0,r3,#1 then loads _LIT2=0x1357 into r1 — my 4-arg sig for 0226b0b0 (neg,?,hb0,magic) guesses how 0x1357 and rsb feed it; reshape-able (operand-order/arg-count).
 *   confidence: med
 */
/* func_ov002_02241400  ov002  class D  MED  (COMPLETE asm)
 * 0x5b8 step machine (3 cases, if-chain), :1 and multi-bitfield extracts.
 * recipe: :1 bitfield; (x<<0x1a)>>0x1b -> bits[5:1]; bind step base; rsb 1-x.
 */
typedef unsigned short u16;
typedef unsigned char  u8;
typedef int            s32;

struct Obj1400 { u16 field0; u16 bit0:1; u16 f5_1:5; u16 pad6:10; }; /* [2] bit0 + bits[5:1] */
struct Glob5b8 { u8 pad[0x5b8]; s32 step; };
struct Glob_d0e6c { u8 pad[0xb0]; u16 hb0; };

extern struct Glob5b8   data_ov002_022ce288;
extern struct Glob_d0e6c data_ov002_022d0e6c;
extern void func_ov002_021d90c0(int bit0, int f5_1, u16 hb0);
extern void func_ov002_0223dad0(void *obj, u16 hb0);
extern void func_ov002_0226b0b0(int neg, int bit0, u16 hb0, int magic);
extern void func_ov002_0226b158(int bit0, u16 f0);

int func_ov002_02241400(struct Obj1400 *obj)
{
    s32 step = data_ov002_022ce288.step;
    if (step == 0) {
        func_ov002_0226b158(obj->bit0, obj->field0);
        data_ov002_022ce288.step = data_ov002_022ce288.step + 1;
        return 0;
    }
    if (step == 1) {
        func_ov002_021d90c0(obj->bit0, obj->f5_1, data_ov002_022d0e6c.hb0);
        func_ov002_0223dad0(obj, data_ov002_022d0e6c.hb0);
        data_ov002_022ce288.step = data_ov002_022ce288.step + 1;
        return 0;
    }
    if (step == 2) {
        func_ov002_0226b0b0(1 - obj->bit0, 0x1357, data_ov002_022d0e6c.hb0, 0x1357);
        data_ov002_022ce288.step = data_ov002_022ce288.step + 1;
        return 0;
    }
    return 1;
}
