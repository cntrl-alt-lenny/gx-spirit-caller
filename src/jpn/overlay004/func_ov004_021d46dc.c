/* func_ov004_021d46dc: timer-setter — settle 020336b8, run 021d3d2c, seed unk30
 * to 12, raise unk38, reset unk3C. */
#include "ov004_core.h"
extern void *func_02032638(void);
extern void func_02033668(void *ctx);
extern void func_ov004_021d3c4c(void *rec, int on);
void func_ov004_021d46dc(void *rec) {
    char *p = rec;
    if (*(int *)(p + 0x38) != 0) *(int *)(p + 0x38) = 0;
    func_02033668(func_02032638());
    func_ov004_021d3c4c(rec, 1);
    *(int *)(p + 0x30) = 12;
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3C) = 0;
}
