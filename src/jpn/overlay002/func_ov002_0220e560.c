#include "ov002_core.h"

struct Self0220e650 {
    unsigned short f0;
    unsigned short b0 : 1;
    unsigned short mid : 13;
    unsigned short b14 : 1;
    unsigned short b15 : 1;
    unsigned short _pad4;
    unsigned short f6_lo : 8;
    unsigned short f6_hi : 8;
};

extern int func_ov002_021bc538(int arg0);
extern int func_ov002_021c9ff4(int arg0, int arg1);
extern int func_ov002_0223de04(void *self, int idx);
extern int func_ov002_021b939c(void);
extern int func_ov002_021c3304(int a, int b, int c);
extern int func_ov002_0227acc8(int a, int b, int c, int d);

int func_ov002_0220e560(struct Self0220e650 *self) {
    int xorFlag = self->b0 ^ self->b14;

    if (func_ov002_021bc538(xorFlag) == 0) {
        return 0;
    }
    if (func_ov002_021c9ff4(self->b0, self->f0) == 0) {
        return 0;
    }
    if (self->f6_hi != 1) {
        goto fail;
    }
    {
        int callResult;
        unsigned int byte1;
        unsigned int byte0;
        unsigned int high16;

        func_ov002_0223de04(self, 0);
        callResult = func_ov002_021b939c();
        byte1 = ((unsigned short)callResult >> 8) & 0xff;
        byte0 = callResult & 0xff;
        high16 = (unsigned short)((unsigned int)callResult >> 16);

        if (byte1 != 0xe) {
            goto fail;
        }
        if (func_ov002_021c3304(xorFlag, byte0, high16) == 0) {
            goto fail;
        }
        {
            char *rowBase = data_ov002_022cf08c + (byte0 & 1) * 0x868;
            int *arr = (int *)(rowBase + 0x418);
            func_ov002_0227acc8(xorFlag, (int)&arr[high16], 1, (int)self->f0 << 16);
        }
    }
    return 1;

fail:
    return 0;
}
