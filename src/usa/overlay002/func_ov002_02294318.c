/* func_ov002_02294318: query(b0,1-b0,-1,1,1) < 0x9c4 -> 0; else tail-call
 * 022943c4(self,arg). */
#include "ov002_core.h"

extern int func_ov002_02280a64(unsigned int a, unsigned int b, int c, int d, int e);
extern int func_ov002_022942b4(void *self, int arg);

int func_ov002_02294318(struct Ov002Self *self, int arg)
{
    if (func_ov002_02280a64(self->b0, 1 - self->b0, -1, 1, 1) < 0x9c4)
        return 0;
    return func_ov002_022942b4(self, arg);
}
