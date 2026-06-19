/* func_ov002_021df5e4: post a 0x2F event (high bit = arg0), payload arg1,1. */
#include "ov002_core.h"
void func_ov002_021df5e4(int arg0, int arg1) {
    func_ov002_021d46ac((u16)((arg0 ? 0x8000 : 0) | 0x2F), (u16)arg1, 1, 0);
}
