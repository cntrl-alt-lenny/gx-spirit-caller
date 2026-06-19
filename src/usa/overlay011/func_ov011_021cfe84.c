/* func_ov011_021cfe84: resolve the actor id in 4000.2C0; if its unk8 byte is
 * >= 0x10, remap it to +0x55. */
#include "ov011_core.h"
extern int *func_02018b8c(int id);
unsigned int func_ov011_021cfe84(void) {
    unsigned int var = (unsigned int)(*(int *)(data_ov011_021d3f20 + 0x2C0) << 4) >> 0x18;
    if (((unsigned int)(*(int *)((char *)func_02018b8c(var) + 8) << 0x18) >> 0x18) >= 0x10)
        var = ((unsigned int)(*(int *)((char *)func_02018b8c(var) + 8) << 0x18) >> 0x18) + 0x55;
    return var;
}
