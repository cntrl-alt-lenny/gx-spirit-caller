/* func_ov002_021ae6d0: 0229ade0 packed-event wrapper — post event 0x31/0xA
 * with a u16 payload (type|0x10|flags<<8) in the high half, seq in the low. */
#include "ov002_core.h"

void func_ov002_021ae6d0(int arg0, int arg1, int arg2, int arg3) {
    func_ov002_0229ade0(0x31, 0xA, arg0,
        ((u16)((arg2 & 0xF) | 0x10 | ((u8)arg3 << 8)) << 16) | (u16)arg1);
}
