/* func_ov004_021d4834: seed a timer record's unk30 from 02033390 (16 if 1, else
 * 39), raise unk38, reset unk3C. Sibling of 021d4004/021d4238. */
#include "ov004_core.h"
extern void *func_02032638(void);
extern int func_02033340(void *ctx);
void func_ov004_021d4834(void *rec) {
    char *p = rec;
    if (*(int *)(p + 0x38) != 0) *(int *)(p + 0x38) = 0;
    *(int *)(p + 0x30) = func_02033340(func_02032638()) == 1 ? 16 : 39;
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3C) = 0;
}
