/* func_ov004_021d7b14: drive the b500.54 phase — on enter (arg0!=0) latch
 * unk90=-1/unk54=2 if early and clear unk88; on leave bump unk54=4/clear unk58
 * (unless idle). */
#include "ov004_core.h"
void func_ov004_021d7b14(int arg0) {
    char *b = data_ov004_0220b2a0;
    int v = *(int *)(b + 0x54);
    if (arg0 != 0) {
        if (v < 2) {
            *(int *)(b + 0x90) = -1;
            *(int *)(b + 0x54) = 2;
        }
        *(int *)(b + 0x88) = 0;
        return;
    }
    if (v == 0) return;
    *(int *)(b + 0x54) = 4;
    *(int *)(b + 0x58) = 0;
}
