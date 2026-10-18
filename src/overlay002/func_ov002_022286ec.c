#include "ov002_core.h"

struct Self022286ec {
    unsigned short f0;
    unsigned short b0 : 1;
    unsigned short rest : 15;
    char _pad4[16];
    int f14;
};

struct Slot { unsigned short id : 13; unsigned short rest : 3; unsigned short hi; };
extern struct Slot data_ov002_022d0250[];
extern int func_0202e234(int x);
extern int func_ov002_021b947c(int arg0);
extern int func_ov002_021c33e4(int a, int b, int c);
extern int func_ov002_0227adb8(int a, int b, int c, int d);

int func_ov002_022286ec(struct Self022286ec *self) {
    int callResult;
    unsigned int byte1;
    unsigned int byte0;
    unsigned int high16;

    if (func_ov002_021ff3bc((struct Ov002Self *)self) == 0) {
        return 0;
    }
    callResult = func_ov002_021b947c(self->f14);
    byte1 = ((unsigned short)callResult >> 8) & 0xff;
    byte0 = callResult & 0xff;
    high16 = (unsigned short)((unsigned int)callResult >> 16);

    if (byte1 == 0xe) {
        if (func_0202e234(data_ov002_022d0250[self->f14].id) != 0) {
            if (func_ov002_021c33e4(self->b0, byte0, high16) != 0) {
                char *rowBase = data_ov002_022cf16c + (byte0 & 1) * 0x868;
                int *arr = (int *)(rowBase + 0x418);
                func_ov002_0227adb8(self->b0, (int)&arr[high16], 1, (int)self->f0 << 16);
            }
        }
    }
    return 0;
}
