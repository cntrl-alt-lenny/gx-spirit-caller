/* func_ov004_021d4878: timer-setter — only when armed (unk254); seed unk30=11
 * if 020336a4 accepts, else hand off to 021d4004. */
#include "ov004_core.h"
extern void *func_02032638(void);
extern int func_02033654(void *ctx);
extern void func_ov004_021d3f24(void *rec);
void func_ov004_021d4878(void *rec) {
    char *p = rec;
    if (*(int *)(p + 0x38) != 0) *(int *)(p + 0x38) = 0;
    if (*(int *)(p + 0x254) == 0) return;
    if (func_02033654(func_02032638()) != 0) {
        *(int *)(p + 0x30) = 11;
        *(int *)(p + 0x38) = 1;
        *(int *)(p + 0x3C) = 0;
        return;
    }
    func_ov004_021d3f24(rec);
}
