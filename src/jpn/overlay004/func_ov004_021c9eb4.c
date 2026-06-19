/* func_ov004_021c9eb4: release the two pending handles on a record (unk90/unk94
 * via func_02006e00), then clear both. */
#include "ov004_core.h"
extern void func_02006e00(int h);
void func_ov004_021c9eb4(void *rec) {
    char *p = rec;
    if (*(int *)(p + 0x90) != 0) func_02006e00(*(int *)(p + 0x90));
    if (*(int *)(p + 0x94) != 0) func_02006e00(*(int *)(p + 0x94));
    *(int *)(p + 0x90) = 0;
    *(int *)(p + 0x94) = 0;
}
