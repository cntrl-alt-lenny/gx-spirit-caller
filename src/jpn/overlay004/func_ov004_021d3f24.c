/* func_ov004_021d3f24: seed a timer record's unk30 from the global mode
 * (0203268c.EB0 == 2 ? 17 : 23), raise unk38, reset unk3C. */
#include "ov004_core.h"
extern char *func_02032638(void);
void func_ov004_021d3f24(void *rec) {
    char *p = rec;
    int t = *(int *)(func_02032638() + 0xEB0) != 2;
    *(int *)(p + 0x30) = t ? 23 : 17;
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3C) = 0;
}
