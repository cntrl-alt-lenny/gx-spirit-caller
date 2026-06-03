/* func_ov004_021d8cd0: if the record's mode (unk18 low nibble) isn't 1, flag
 * unk0=3; else push its unkC value into the sub-engine BLDALPHA pair
 * (0x04001010/14). */
#include "ov004_core.h"
void func_ov004_021d8cd0(void *rec) {
    char *p = rec;
    if ((*(int *)(p + 0x18) & 0xF) != 1) {
        *(int *)p = 3;
        return;
    }
    *(int *)p = 0;
    *(volatile unsigned int *)0x04001010 = (*(int *)(p + 0xC) << 16) & 0x01FF0000;
    *(volatile unsigned int *)0x04001014 = (*(int *)(p + 0xC) << 16) & 0x01FF0000;
}
