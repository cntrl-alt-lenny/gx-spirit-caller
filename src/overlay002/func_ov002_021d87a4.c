/* func_ov002_021d87a4: arg-pack post — kind 41 (+0x8000 when arg0 set), three u16
 * payload words. Tail-call. */
#include "ov002_core.h"
int func_ov002_021d87a4(int arg0, int arg1, int arg2) {
    return func_ov002_021d479c((u16)((arg0 ? 0x8000 : 0) | 41), (u16)arg1, (u16)arg2, 0);
}
