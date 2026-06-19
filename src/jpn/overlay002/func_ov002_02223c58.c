/* func_ov002_02223c58: unless cd3f4.unk14 is set, run 021de4b0(arg0, cd3f4.unk4,
 * cd3f4.unk20). */
#include "ov002_core.h"
extern void func_ov002_021de3c0(void *arg0, int a, int b);

int func_ov002_02223c58(void *arg0) {
    if (*(int *)(data_ov002_022cd314 + 0x14) != 0)
        return 0;
    func_ov002_021de3c0(arg0, *(int *)(data_ov002_022cd314 + 4),
                        *(int *)(data_ov002_022cd314 + 0x20));
    return 0;
}
