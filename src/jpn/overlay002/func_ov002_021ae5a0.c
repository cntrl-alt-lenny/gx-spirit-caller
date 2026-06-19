/* func_ov002_021ae5a0: post command (49,9) with player arg0 and a payload of
 * (u16)arg1 | 0xFF0000. Tail-call. */
#include "ov002_core.h"
int func_ov002_021ae5a0(int arg0, int arg1) {
    return func_ov002_0229acd0(49, 9, arg0, (u16)arg1 | 0xFF0000);
}
