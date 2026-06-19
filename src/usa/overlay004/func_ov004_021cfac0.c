/* func_ov004_021cfac0: release the three pending handles on a record (unk0/4/8
 * via func_02006e00), then clear all three. Sibling of 021c9f94. */
#include "ov004_core.h"
extern void func_02006e00(int h);
void func_ov004_021cfac0(void *rec) {
    char *p = rec;
    if (*(int *)(p + 0) != 0) func_02006e00(*(int *)(p + 0));
    if (*(int *)(p + 4) != 0) func_02006e00(*(int *)(p + 4));
    if (*(int *)(p + 8) != 0) func_02006e00(*(int *)(p + 8));
    *(int *)(p + 0) = 0;
    *(int *)(p + 4) = 0;
    *(int *)(p + 8) = 0;
}
