/* func_ov011_021d0e0c: set coord-slot arg0's unk8 id field (bits 18:11) to
 * arg1 and flag unk18 bit-9, unless the id already equals arg1. */
#include "ov011_core.h"
void func_ov011_021d0e0c(int arg0, int arg1) {
    char *s = data_ov011_021d4580 + arg0 * 0x28;
    int v = *(int *)(s + 8);
    if (arg1 == (int)((unsigned int)(v << 13) >> 24))
        return;
    *(int *)(s + 8) = (v & 0xFFF807FF) | ((unsigned int)(arg1 << 24) >> 13);
    *(int *)(s + 0x18) |= 0x200;
}
