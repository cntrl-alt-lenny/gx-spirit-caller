/* func_ov002_021df590: post a 0x30 event — special arg0<0 form (kind 1), else
 * high bit = arg0. */
#include "ov002_core.h"
void func_ov002_021df590(int arg0, int arg1) {
    if (arg0 < 0) {
        func_ov002_021d46ac(0x30, (u16)arg1, 1, 0);
        return;
    }
    func_ov002_021d46ac((u16)((arg0 ? 0x8000 : 0) | 0x30), (u16)arg1, 0, 0);
}
