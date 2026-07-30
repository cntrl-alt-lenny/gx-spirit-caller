/* func_ov002_0220d4d0: guard func_ov002_021ca2b8(bit0)==0 -> 0. If cf17c
 * per-player int is 0, resolve val=func_ov002_0223f6c4(self) and guard
 * func_ov002_022536e8(bit0,f0,val)==0 -> 0. Else return 1. */
typedef unsigned short u16;
struct S0220d4d0F2 { u16 bit0 : 1; u16 pad : 15; };
struct S0220d4d0 { u16 f0; struct S0220d4d0F2 f2; };

extern char data_ov002_022cf17c[];
extern int func_ov002_021ca2b8(int bit0);
extern int func_ov002_0223f6c4(struct S0220d4d0 *self);
extern int func_ov002_022536e8(int bit0, unsigned short f0, int val);

int func_ov002_0220d4d0(struct S0220d4d0 *self) {
    if (func_ov002_021ca2b8(self->f2.bit0) == 0)
        return 0;
    if (*(int *)(data_ov002_022cf17c + (self->f2.bit0 & 1) * 0x868) == 0) {
        int val = func_ov002_0223f6c4(self);
        if (func_ov002_022536e8(self->f2.bit0, self->f0, val) == 0)
            return 0;
    }
    return 1;
}
