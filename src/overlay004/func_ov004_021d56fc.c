/* func_ov004_021d56fc: advance a timer record — once unk3C reaches unk44, latch
 * unk40 into unk30, raise the unk38 flag and reset unk3C. */
#include "ov004_core.h"
void func_ov004_021d56fc(void *rec) {
    char *p = rec;
    if (*(int *)(p + 0x38) != 0) *(int *)(p + 0x38) = 0;
    if ((unsigned int)*(int *)(p + 0x3C) < (unsigned int)*(int *)(p + 0x44)) return;
    *(int *)(p + 0x30) = *(int *)(p + 0x40);
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3C) = 0;
}
