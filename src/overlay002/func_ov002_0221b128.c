/* func_ov002_0221b128: gate function with per-player+row table lookups.
 *  - if BIT2(field_04), return 0.
 *  - out = func_ov002_0223df38(p, 0, &buf); if 0, return 0.
 *  - b0 = buf & 0xff (byte 0); bit0 = b0 & 1; b1 = byte 1 of buf.
 *  - if !LOW13(cf16c[bit0][b1].f30), return 0.
 *  - if !cf1a4[bit0][b1] (u16), return 0.
 *  - r5 = (field_00==0x138d) ? func_ov002_021c8470(b0,b1) : 0x3e8;
 *  - func_ov002_021e2b3c();
 *  - if (func_ov002_0220e518(p)) { df818(p,!bit0_of_f02,r5); df818(p,bit0_of_f02,r5); }
 *  - func_ov002_021e2c5c(); return 0.
 *
 * Bitfield extraction uses the original's exact shift-pair widths
 * (see docs/research/codegen-walls.md C-46 extension 2). The byte0/
 * midbyte-of-buf recipe matches the already-shipped func_ov002_0220e518.c
 * exactly (half = (unsigned short)buf; b1 = (half >> 8) & 0xff;).
 */
#include "ov002_core.h"

#define BIT2(x)  (((unsigned)((x) << 29)) >> 31)
#define BIT0(x)  (((unsigned)((x) << 31)) >> 31)
#define LOW13(x) (((unsigned)((x) << 19)) >> 19)

typedef struct {
    unsigned short field_00;
    unsigned short field_02;
    unsigned short field_04;
} arg_0221b128_t;

extern int  func_ov002_0223df38(void *self, int flag, int *outPtr);
extern int  func_ov002_021c8470(int a, int b);
extern int  func_ov002_0220e518(void *self);
extern void func_ov002_021df818(void *p, int flag, int val);

int func_ov002_0221b128(arg_0221b128_t *p) {
    int buf;
    unsigned short half;
    int b0, bit0, b1;
    int r5;
    int lowval;
    unsigned short tabval;

    if (BIT2(p->field_04)) {
        return 0;
    }

    if (!func_ov002_0223df38(p, 0, &buf)) {
        goto ret0;
    }

    b0 = buf & 0xff;
    bit0 = b0 & 1;
    half = (unsigned short)buf;
    b1 = (half >> 8) & 0xff;

    lowval = LOW13(*(volatile unsigned int *)((data_ov002_022cf16c + bit0 * 0x868 + 0x30) + b1 * 20));
    if (!lowval) {
        goto ret0;
    }

    tabval = *(unsigned short *)(data_ov002_022cf1a4 + bit0 * 0x868 + b1 * 20);
    if (!tabval) {
        goto ret0;
    }

    if (p->field_00 == 0x138d) {
        r5 = func_ov002_021c8470(b0, b1);
    } else {
        r5 = 0x3e8;
    }

    func_ov002_021e2b3c();

    if (func_ov002_0220e518(p)) {
        func_ov002_021df818(p, 1 - BIT0(p->field_02), r5);
        func_ov002_021df818(p, BIT0(p->field_02), r5);
    }

    func_ov002_021e2c5c();
    return 0;

ret0:
    return 0;
}
