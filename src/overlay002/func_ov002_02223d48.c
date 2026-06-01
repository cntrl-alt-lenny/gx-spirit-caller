/* func_ov002_02223d48: unless cd3f4.unk14 is set, run 021de4b0(arg0, cd3f4.unk4,
 * cd3f4.unk20). */
#include "ov002_core.h"
extern void func_ov002_021de4b0(void *arg0, int a, int b);

int func_ov002_02223d48(void *arg0) {
    if (*(int *)(data_ov002_022cd3f4 + 0x14) != 0)
        return 0;
    func_ov002_021de4b0(arg0, *(int *)(data_ov002_022cd3f4 + 4),
                        *(int *)(data_ov002_022cd3f4 + 0x20));
    return 0;
}
