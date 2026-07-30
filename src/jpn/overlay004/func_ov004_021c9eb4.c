/* func_ov004_021c9eb4: release the two pending handles on a record (unk90/unk94
 * via Task_Invoke), then clear both. */
#include "ov004_core.h"
extern void Task_Invoke(int h);
void func_ov004_021c9eb4(void *rec) {
    char *p = rec;
    if (*(int *)(p + 0x90) != 0) Task_Invoke(*(int *)(p + 0x90));
    if (*(int *)(p + 0x94) != 0) Task_Invoke(*(int *)(p + 0x94));
    *(int *)(p + 0x90) = 0;
    *(int *)(p + 0x94) = 0;
}
