/* func_ov011_021d0ffc: read the 2-bit unk8 field of coord-array[arg0]
 * (stride 0x28); out-of-range -> 1. */
#include "ov011_core.h"
unsigned int func_ov011_021d0ffc(int arg0) {
    char *b = data_ov011_021d4660;
    if (arg0 >= 0x10)
        return 1;
    return (unsigned int)(*(int *)(b + arg0 * 0x28 + 8) << 0x1E) >> 0x1E;
}
