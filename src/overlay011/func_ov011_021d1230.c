/* func_ov011_021d1230: set coord-slot arg0's unk18 enable bit (bit 8) to arg1;
 * when enabling, default its 2-bit mode to 1 if the slot is idle, then run the
 * 021d11c8 settle. */
#include "ov011_core.h"
extern int func_ov011_021d0ffc(int slot);
extern void func_ov011_021d11c8(int slot, int on);
void func_ov011_021d1230(int arg0, int arg1) {
    char *slot = data_ov011_021d4660 + arg0 * 40;
    *(int *)(slot + 0x18) = (*(int *)(slot + 0x18) & ~0x100) | ((unsigned int)(arg1 << 31) >> 23);
    if (arg1 != 0) {
        if (func_ov011_021d0ffc(arg0) == 0)
            *(int *)(slot + 0x18) = (*(int *)(slot + 0x18) & ~0xC00) | 0x400;
        func_ov011_021d11c8(arg0, 1);
    } else {
        func_ov011_021d11c8(arg0, 0);
    }
}
