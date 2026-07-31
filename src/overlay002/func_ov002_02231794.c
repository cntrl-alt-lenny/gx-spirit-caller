#include "ov002_core.h"

struct Node794 {
    u16 f0;      /* +0x0 */
    u16 b0 : 1;  /* +0x2 */
    char _pad[8];
    u16 fc;      /* +0xc */
};

struct Slot518 {
    unsigned int id     : 13;  /* bits 0-12 */
    unsigned int flag13 : 1;   /* bit 13 */
    unsigned int _pad   : 8;   /* bits 14-21 */
    unsigned int sub    : 8;   /* bits 22-29 */
    unsigned int _pad2  : 2;   /* bits 30-31 */
};

struct SlotU16_794 { u16 id : 13; };

extern char data_ov002_022d0250[];

extern int func_ov002_0223df38(void *self, int a, int b);
extern int func_ov002_0225764c(int a, int b, int c);
extern int func_ov002_021de910(int a, int b, int c);
extern int func_ov002_021b9aa8(int a, int b);
extern unsigned int func_0202b8a8(int id);
extern int func_ov002_021ff46c(void *self, int arg1);
extern int func_ov002_02290500(int a, u16 b, void *c);
extern void func_ov002_022107b4(void);
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_0227adb8(int a, int b, int c, int d);

int func_ov002_02231794(struct Node794 *self, int arg1) {
    int bit, field;

    switch (CE288->f_5a8) {
    case 0x80:
        if (func_ov002_0223df38(self, 0, 0) == 0)
            goto case80_fail;

        {
            int v = func_ov002_0223de94(self, 0);
            bit = (u8)v;
            field = (u8)((u16)v >> 8);
        }

        if (func_ov002_0225764c((int)self, bit, field) == 0)
            goto case80_fail;

        {
            struct Slot518 *slot = (struct Slot518 *)((char *)data_ov002_022cf16c + (bit & 1) * 0x868 + 0x30 + field * 20);
            CE288->f_5ac = slot->sub * 2 + slot->flag13;
        }

        func_ov002_021de910((int)self, bit, field);
        return 0x7f;

    case80_fail:
        return 0;

    case 0x7f: {
        int r = func_ov002_021b9aa8(self->b0, CE288->f_5ac);
        if (r < 0)
            return 0;
        self->fc = (u16)func_0202b8a8(((struct SlotU16_794 *)(data_ov002_022d0250 + CE288->f_5ac * 4))->id);
        if (func_ov002_021ff46c(self, arg1) != 0)
            return 0x7d;
        return 0;
    }

    case 0x7d:
        if (data_ov002_022cd744[self->b0] == 1) {
            func_ov002_02290500(self->b0, self->f0, (void *)func_ov002_022107b4);
        } else {
            func_ov002_021ae400(self->b0, 0x11e);
            func_ov002_022592ec((int)func_ov002_022107b4);
        }
        return 0x7c;

    case 0x7c:
        if (func_ov002_022593f4() == 0)
            return 0x7d;
        func_ov002_0227adb8(self->b0,
            (int)((char *)data_ov002_022cf16c + (self->b0 & 1) * 0x868 + 0x120 + D016C->f_d78 * 4),
            1, self->f0 << 16);
        return 0;

    case 0x7e:
    default:
        return 0;
    }
}
