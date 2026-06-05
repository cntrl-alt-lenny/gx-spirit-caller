/* func_ov002_0226b274: forward to func_ov002_0226acf8 with kind 22, (u16)arg1,
 * and (u16)(arg2-1). Tail-call. */
#include "ov002_core.h"
extern int func_ov002_0226acf8(int a, int b, int c, int d);
int func_ov002_0226b274(int arg0, int arg1, int arg2) {
    return func_ov002_0226acf8(arg0, 22, (u16)arg1, (u16)(arg2 - 1));
}
