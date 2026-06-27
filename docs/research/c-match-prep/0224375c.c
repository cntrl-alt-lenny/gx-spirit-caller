/* CAMPAIGN-PREP candidate for func_0224375c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     (x<<0x17)>>0x17 :9 extract; r reload of field14 for 3rd arg
 *   risk:       hi = high byte of (u16)r via lsl16;lsr16;asr8;and. Written as nested casts; mwcc may fold the redundant &0xff or pick different shift. reshape-able (shift-expr shaping). field14 reloaded (orig re-ldr) not bound — matched.
 *   confidence: med
 */
// func_ov002_0224375c  ov002  shift-mask extract, asr byte, single guard

typedef unsigned short u16;
typedef unsigned char  u8;
typedef int            s32;

struct Obj0224375c {
    u8  pad[0x14];
    s32 field14;       // [0x14]
};

extern int  func_ov002_021b947c(int v);
extern void func_ov002_0223de04(void *obj, int a1, int a2, int a3);

int func_ov002_0224375c(struct Obj0224375c *obj)
{
    int x = obj->field14;
    int r = func_ov002_021b947c((x << 0x17) >> 0x17);   // :9 zero-ext of field14 low bits
    int hi = ((int)((unsigned)(r << 0x10) >> 0x10) >> 8) & 0xff;
    if (hi == 0xe) {
        func_ov002_0223de04(obj,
                            r & 0xff,
                            0xe,
                            (obj->field14 << 0x17) >> 0x17);
    }
    return 1;
}
