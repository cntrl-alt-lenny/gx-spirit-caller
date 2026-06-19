/* func_ov011_021d0dc4: find the active coord slot (unk18 bit-5 set) whose unk8
 * id (bits 18:11) equals arg0; return its index, or -1. */
#include "ov011_core.h"
int func_ov011_021d0dc4(int arg0) {
    char *p = data_ov011_021d4580;
    int i;
    for (i = 0; i < 10; i++) {
        if (((unsigned int)(*(int *)(p + 0x18) << 26) >> 31) != 0
            && arg0 == (int)((unsigned int)(*(int *)(p + 8) << 13) >> 24))
            return i;
        p += 0x28;
    }
    return -1;
}
