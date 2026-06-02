/* func_ov004_021d4238: seed a timer record's unk30 from 020331f8 (8 if 1, else
 * 4), raise unk38, reset unk3C. Sibling of 021d4004/021d4914. */
#include "ov004_core.h"
extern void *func_0203268c(void);
extern int func_020331f8(void *ctx);
void func_ov004_021d4238(void *rec) {
    char *p = rec;
    if (*(int *)(p + 0x38) != 0) *(int *)(p + 0x38) = 0;
    *(int *)(p + 0x30) = func_020331f8(func_0203268c()) == 1 ? 8 : 4;
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3C) = 0;
}
