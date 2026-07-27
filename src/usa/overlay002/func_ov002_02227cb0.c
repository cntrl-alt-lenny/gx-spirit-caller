/* func_ov002_02227cb0: gate on func_ov002_0223de48(self,0,NULL), split
 * func_ov002_0223dda4(self,0)'s u16 result into two bytes, and if
 * func_ov002_02257564(self,byte0,byte1) is nonzero notify
 * func_ov002_021d90f0(byte0,byte1,1). Always returns 0. */
#include "ov002_core.h"
extern int func_ov002_0223de48(void *self, int a, int *out);
extern int func_ov002_02257564(void *self, int a, int b);
extern void func_ov002_021d90f0(int a, int b, int c);

int func_ov002_02227cb0(void *self) {
    int byte0, byte1;
    int v;
    if (func_ov002_0223de48(self, 0, 0) == 0) {
        goto done;
    }
    v = func_ov002_0223dda4(self, 0);
    byte0 = v & 0xff;
    byte1 = ((unsigned short)v >> 8) & 0xff;
    if (func_ov002_02257564(self, byte0, byte1) != 0) {
        func_ov002_021d90f0(byte0, byte1, 1);
    }
done:
    return 0;
}
