/* func_ov002_021f914c: func_ov002_021b939c(field9) result decomposed into
 * byte1 (gate <=4) and hi u16; if hi!=0, dispatch func_ov002_021df1d4 with
 * a flag from comparing cd3f4.f_4/f_20 against self->b0/field5; else
 * forward to func_ov002_021dea38(bit0, field5). Always returns 1. */
#include "ov002_core.h"

extern int func_ov002_021b939c(int val);
extern void func_ov002_021df1d4(int flag);
extern void func_ov002_021dea38(int bit0, int field5);

int func_ov002_021f914c(struct Ov002Self *self) {
    int field9 = (unsigned)(*(unsigned short *)((char *)self + 4) << 17) >> 23;
    int result = func_ov002_021b939c(field9);
    unsigned short lo = (unsigned short)result;
    int byte1 = (lo >> 8) & 0xff;

    if ((unsigned)byte1 <= 4) {
        unsigned short hi = (unsigned short)((unsigned)result >> 16);
        if (hi != 0) {
            int flag = 0;
            if (self->b0 == *(int *)(data_ov002_022cd314 + 4)) {
                int field5 = (unsigned)(*(unsigned short *)((char *)self + 2) << 26) >> 27;
                if (field5 == *(int *)(data_ov002_022cd314 + 0x20))
                    flag = 1;
            }
            func_ov002_021df1d4(flag);
        } else {
            int bit0 = self->b0;
            int field5 = (unsigned)(*(unsigned short *)((char *)self + 2) << 26) >> 27;
            func_ov002_021dea38(bit0, field5);
        }
    }
    return 1;
}
