/* CAMPAIGN-PREP candidate for func_02241a14 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch jump-table; :1 bit0; signed gt/ge/eq compare-tree selects 0x4b/0x4c/0x4d code
 *   risk:       compare-tree thresholds (_LIT1/2/3) are placeholders and the tail (.L_110 step++ + cases 3/4) is truncated; the bgt/bge ordering of the tree is the codegen-sensitive part. struct-guessed + truncated-target.
 *   confidence: low
 */
/* func_ov002_02241a14  ov002  class D  MED  (asm TRUNCATED mid case 1 compare-tree)
 * jump-table 0..4 on 0x5b8 step; case 1 = nested signed compare tree -> sub-id select.
 * recipe: switch jump-table; :1 bitfield; gt/ge/eq compare tree picks call arg.
 */
typedef unsigned short u16;
typedef unsigned char  u8;
typedef short          s16;
typedef int            s32;

struct Obj1a14 { s16 field0; u16 bit0:1; u16 pad2:15; };   /* [0] SIGNED compare, [2] bit0 */
struct Glob5b8 { u8 pad[0x5b8]; s32 step; };

extern struct Glob5b8 data_ov002_022ce288;
extern void func_ov002_021ae400(int bit0, int code);
extern void func_ov002_021af9d0(int bit0, int code, int zero, int zero2);
extern void func_ov002_021d90c0(void);
extern void func_ov002_0223dad0(void);
extern void func_ov002_0226b0d0(void);

int func_ov002_02241a14(struct Obj1a14 *obj)
{
    s32 step = data_ov002_022ce288.step;
    switch (step) {
    case 0: default:
        return 0;    /* b .L_194 epilogue (not shown) */
    case 1:
        func_ov002_021ae400(obj->bit0, 0x91);
        data_ov002_022ce288.step = data_ov002_022ce288.step + 1;
        return 0;
    case 2: {
        s16 id = obj->field0;
        int code;
        int hit = 1;
        /* nested signed compare tree against _LIT1 / _LIT2 / _LIT3 (placeholders) */
        if (id == 0x4b00) code = 0x4b;          /* .L_c0 */
        else if (id == 0x4d00) code = 0x4d;     /* .L_dc (_LIT2+0x200) */
        else { code = 0x4c; }                   /* .L_f8 / fallthrough .L_110 */
        if (hit)
            func_ov002_021af9d0(obj->bit0, code, 0, 0);
        return 0;    /* TRUNCATED: .L_110 step-advance tail + cases 3,4 unknown */
    }
    }
}
