/* func_ov002_0223b07c: if CE288->f_5a8==0x80, call
 * func_ov002_0223de04(arg0,0) then func_ov002_021b98d4(bit0,t); if that's
 * <0 return 0. Either way, tail-call func_ov002_0221d198(arg0,arg1).
 * Retry 2: use Ov002Self's b0 bitfield for bit0 instead of manual `h&1`
 * (diagnostic showed AND r0,r2,#1 where orig has MOV r0,r2,LSL#31).
 */
#include "ov002_core.h"

extern int func_ov002_0223de04(void *a, int b);
extern int func_ov002_021b98d4(int bit0, int t);
extern int func_ov002_0221d198(void *a, int b);

int func_ov002_0223b07c(void *arg0, int arg1) {
    struct Ov002Self *self = (struct Ov002Self *)arg0;
    int t;
    int v;

    if (CE288->f_5a8 == 0x80) {
        t = func_ov002_0223de04(arg0, 0);
        v = func_ov002_021b98d4(self->b0, t);
        if (v < 0) return 0;
    }
    return func_ov002_0221d198(arg0, arg1);
}
