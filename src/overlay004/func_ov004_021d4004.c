/* func_ov004_021d4004: seed a timer record's unk30 from the global mode
 * (0203268c.EB8 == 2 ? 17 : 23), raise unk38, reset unk3C. */
#include "ov004_core.h"
extern char *func_0203268c(void);
void func_ov004_021d4004(void *rec) {
    char *p = rec;
    int t = *(int *)(func_0203268c() + 0xEB8) != 2;
    *(int *)(p + 0x30) = t ? 23 : 17;
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3C) = 0;
}
