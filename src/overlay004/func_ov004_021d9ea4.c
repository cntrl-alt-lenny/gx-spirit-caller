/* func_ov004_021d9ea4: tear down record A handles (021c9f94), clear b500.220;
 * when armed (unk48==1), stop the active stream (02033864 if 02034844) and run
 * the 020338b8 settle. */
#include "ov004_core.h"
extern void func_ov004_021c9f94(void *rec);
extern int func_02034844(void);
extern void *func_0203268c(void);
extern void func_02033864(void *ctx);
extern void func_020338b8(void *ctx);
void func_ov004_021d9ea4(void) {
    char *b;
    func_ov004_021c9f94(data_ov004_02211490);
    b = data_ov004_0220b500;
    *(int *)(b + 0x220) = 0;
    if (*(int *)(b + 0x48) != 1) return;
    if (func_02034844() != 0) func_02033864(func_0203268c());
    func_020338b8(func_0203268c());
}
