/* func_ov004_021d9c90: tear down record A handles (021c9f94), clear b500.220;
 * when armed (unk48==1), stop the active stream (02033864 if 02034844) and run
 * the 020338b8 settle. */
#include "ov004_core.h"
extern void func_ov004_021c9eb4(void *rec);
extern int func_020347f4(void);
extern void *func_02032638(void);
extern void func_02033814(void *ctx);
extern void func_02033868(void *ctx);
void func_ov004_021d9c90(void) {
    char *b;
    func_ov004_021c9eb4(data_ov004_02211230);
    b = data_ov004_0220b2a0;
    *(int *)(b + 0x220) = 0;
    if (*(int *)(b + 0x48) != 1) return;
    if (func_020347f4() != 0) func_02033814(func_02032638());
    func_02033868(func_02032638());
}
