/* CAMPAIGN-PREP candidate for func_021b5c3c (ov010, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     MMIO field stores in exact order (8,a,c,e,10,14,18,1c); bic/orr mask pairs; bind hw in r1
 *   risk:       Function TRUNCATED (ends mid-tail at str r0,[r4,#0xf8]). field_2c->field_70 (offset 0x70) unverified; the sp-stored arg slot and lit ordering guessed. struct-guessed + incomplete-asm.
 *   confidence: low
 */
typedef struct Hw021b5c3c {
    /* 0x00 */ unsigned int field_0;
    /* 0x04 */ char _pad4[0x4];
    /* 0x08 */ unsigned short field_8;
    /* 0x0a */ unsigned short field_a;
    /* 0x0c */ unsigned short field_c;
    /* 0x0e */ unsigned short field_e;
    /* 0x10 */ int field_10;
    /* 0x14 */ int field_14;
    /* 0x18 */ int field_18;
    /* 0x1c */ int field_1c;
} Hw021b5c3c;

typedef struct Ctx021b5c3c {
    /* 0x000 */ char _pad0[0x4];
    /* 0x004 */ int field_4;
    /* 0x008 */ char _pad8[0x8];
    /* 0x010 */ int field_10;
    /* 0x014 */ char _pad14[0x18];
    /* 0x02c */ Hw021b5c3c *field_2c;
    /* 0x030 */ char _pad30[0xc8];
    /* 0x0f8 */ unsigned int field_f8;
} Ctx021b5c3c;

typedef struct Ext021b5c3c {
    /* 0x00 */ char _pad0[0x64];
    /* 0x64 */ int field_64;
} Ext021b5c3c;

extern int data_ov010_021b8d44;
extern Ctx021b5c3c data_ov010_021b9260;
extern Ext021b5c3c data_ov010_021b9270;
extern int data_ov010_021b9294;
extern Hw021b5c3c data_ov010_021b9484;
extern void func_0207ec68(int a);
extern void func_0207ed94(void);
extern void func_0207f05c(int a, int b, int c);
extern int func_0208c844(int a);
extern void func_0208c884(int a, int b);
extern int func_ov010_021b2924(int a, int b, void *c);
extern int func_ov010_021b4884(void *a);

void func_ov010_021b5c3c(void)
{
    Ctx021b5c3c *ctx = &data_ov010_021b9260;
    Hw021b5c3c *hw = &data_ov010_021b9484;
    int spv;
    int r5;
    int r6;
    int t;

    spv = (int)&data_ov010_021b8d44;
    r5 = func_0208c844((int)&data_ov010_021b9294);

    hw->field_0 = (hw->field_0 & ~0x1f00) | 0x1f00;
    hw->field_8 = (unsigned short)((hw->field_8 & ~0x3) | 0x2);
    hw->field_a = (unsigned short)(hw->field_a & ~0x3);
    hw->field_c = (unsigned short)((hw->field_c & ~0x3) | 0x1);
    hw->field_e = (unsigned short)((hw->field_e & ~0x3) | 0x3);
    hw->field_10 = 0x1dc0000;
    hw->field_14 = 0;
    hw->field_18 = 0;
    hw->field_1c = 0;
    hw->field_0 = hw->field_0 | 0x10000;

    func_0207ed94();
    func_0207ec68((int)&data_ov010_021b9294);
    r6 = func_ov010_021b4884(&spv);
    t = func_ov010_021b2924((int)&data_ov010_021b9270, (int)&data_ov010_021b9294, &spv);
    t = r6 + t;
    if (t > 0) {
        func_0207f05c(ctx->field_10 + 0x10, (int)&data_ov010_021b8d44, (t << 16) >> 16);
    }

    func_0208c884((int)&data_ov010_021b9484, r5);

    if (((Ext021b5c3c *)&data_ov010_021b9270)->field_64 == 0) {
        ctx->field_2c->field_70 &= ~0x2;
        ctx->field_4 = 2;
        ctx->field_f8 &= ~0x1;
    }
}
