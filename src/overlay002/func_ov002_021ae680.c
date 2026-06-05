/* func_ov002_021ae680: post command (49,9) with player arg0 and a payload of
 * (u16)arg1 | 0xFF0000. Tail-call. */
#include "ov002_core.h"
int func_ov002_021ae680(int arg0, int arg1) {
    return func_ov002_0229ade0(49, 9, arg0, (u16)arg1 | 0xFF0000);
}
