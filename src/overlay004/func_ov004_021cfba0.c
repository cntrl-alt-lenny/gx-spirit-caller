/* func_ov004_021cfba0: release the three pending handles on a record (unk0/4/8
 * via Task_Invoke), then clear all three. Sibling of 021c9f94. */
#include "ov004_core.h"
extern void Task_Invoke(int h);
void func_ov004_021cfba0(void *rec) {
    char *p = rec;
    if (*(int *)(p + 0) != 0) Task_Invoke(*(int *)(p + 0));
    if (*(int *)(p + 4) != 0) Task_Invoke(*(int *)(p + 4));
    if (*(int *)(p + 8) != 0) Task_Invoke(*(int *)(p + 8));
    *(int *)(p + 0) = 0;
    *(int *)(p + 4) = 0;
    *(int *)(p + 8) = 0;
}
