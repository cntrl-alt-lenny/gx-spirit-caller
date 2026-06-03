/* func_ov004_021d4958: timer-setter — only when armed (unk254); seed unk30=11
 * if 020336a4 accepts, else hand off to 021d4004. */
#include "ov004_core.h"
extern void *func_0203268c(void);
extern int func_020336a4(void *ctx);
extern void func_ov004_021d4004(void *rec);
void func_ov004_021d4958(void *rec) {
    char *p = rec;
    if (*(int *)(p + 0x38) != 0) *(int *)(p + 0x38) = 0;
    if (*(int *)(p + 0x254) == 0) return;
    if (func_020336a4(func_0203268c()) != 0) {
        *(int *)(p + 0x30) = 11;
        *(int *)(p + 0x38) = 1;
        *(int *)(p + 0x3C) = 0;
        return;
    }
    func_ov004_021d4004(rec);
}
