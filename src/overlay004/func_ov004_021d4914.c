/* func_ov004_021d4914: seed a timer record's unk30 from 02033390 (16 if 1, else
 * 39), raise unk38, reset unk3C. Sibling of 021d4004/021d4238. */
#include "ov004_core.h"
extern void *func_0203268c(void);
extern int func_02033390(void *ctx);
void func_ov004_021d4914(void *rec) {
    char *p = rec;
    if (*(int *)(p + 0x38) != 0) *(int *)(p + 0x38) = 0;
    *(int *)(p + 0x30) = func_02033390(func_0203268c()) == 1 ? 16 : 39;
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3C) = 0;
}
