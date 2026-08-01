#include "ov002_core.h"

typedef struct {
    u16 f0;
    u16 b0 : 1;      /* +0x2 bit0 */
    u16 f1_5 : 5;    /* +0x2 bits[5:1] */
    u16 _pad2 : 10;
    u16 _pad4a : 2;
    u16 b2 : 1;      /* +0x4 bit2 */
    u16 _pad4b : 3;
    u16 f6_14 : 9;   /* +0x4 bits[14:6] */
} Ov002_1d6ec_Self;

typedef struct {
    u16 f0;
    u16 b0 : 1;      /* +0x2 bit0 */
    u16 f1_5 : 5;    /* +0x2 bits[5:1] */
    u16 _pad2 : 10;
    union {
        u16 raw4;
        struct {
            u16 bit0 : 1;
            u16 bit1 : 1;
            u16 bit2 : 1;
            u16 bit3 : 1;
            u16 _pad4_5_2 : 2;
            u16 f6_14 : 9;
        };
    } f4;
} Ov002_1d6ec_Info;

extern char data_ov002_022d0e6c[];

extern unsigned int func_0202b878(int id);
extern int func_ov002_021d8904(int player, int idx, int value);
extern int func_ov002_021de598(int arg0, int arg1, int arg2);
extern int func_ov002_021ff14c(int arg0, int arg1, int arg2, int arg3, int arg4);
extern void func_ov002_0226ada4(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_0226b094(int arg0, int arg1);

int func_ov002_0221d6ec(Ov002_1d6ec_Self *self, Ov002_1d6ec_Info *info) {
    if (self->b2) {
        return 0;
    }

    if (CE288->f_5a8 == 0x7e) {
        goto state_7e;
    }
    if (CE288->f_5a8 == 0x7f) {
        goto state_7f;
    }
    if (CE288->f_5a8 != 0x80) {
        goto ret_zero;
    }

    if (func_ov002_021ff14c(1 - self->b0, 1, 0, 0, 1) == 0) {
        return 0x7e;
    }
    func_ov002_0226b094(1 - self->b0, self->f0);
    return 0x7f;

state_7f:
    if (*(u16 *)(data_ov002_022d0e6c + 0xb0) == 0) {
        return 0x7e;
    }
    func_ov002_0226ada4(1 - self->b0, 1, 7, 1);
    return 0;

state_7e:
    if (info == 0) {
        goto state_7e_ret0;
    }
    if (func_0202b878(info->f0) != 0x16) {
        goto state_7e_ret0;
    }
    info->f4.bit1 = 1;
    info->f4.bit2 = info->f4.bit1;
    info->f4.bit3 = info->f4.bit2;
    func_ov002_021d8904(info->b0, info->f1_5, info->f4.f6_14);
    func_ov002_021de598((int)self, info->b0, info->f1_5);
state_7e_ret0:
    return 0;

ret_zero:
    return 0;
}
