#include "ov004_core.h"
struct FlagBits { unsigned char bits:3; };
struct StateRows { int prefix[46]; int rows[5][8]; };
extern char data_02104f4c[];
extern char data_02105989[];
extern void func_020aadf8(void *a, const void *b, int c, int d);
extern int func_ov004_021da978(void);
extern int func_ov004_021daa48(void);
void func_ov004_021dab1c(void) {
    char *b = data_ov004_0220b500;
    unsigned char flags;
    int value;
    int i;
    *(int *)(b + 0x9c) = 0;
    *(int *)(b + 0xa0) = 0;
    *(int *)(b + 0xb0) = -1;
    if (*(int *)(b + 0x8c) <= 0x100) return;
    flags = ((struct FlagBits *)(data_02104f4c + 0xa3c))->bits;
    value = *(int *)(data_02104f4c + 0xa64);
    *(int *)(b + 0xb8) = 5;
    *(unsigned char *)(b + 0xc0) = flags;
    *(int *)(b + 0xbc) = value;
    func_020aadf8(b + 0xc1, data_02105989, value, flags);
    for (i = 1; i < 5; i++) ((struct StateRows *)b)->rows[i][0] = 0;
    *(int *)(b + 0xa4) = 0;
    if (*(int *)(b + 0x8c) != 0x200) return;
    *(int *)(b + 0x9c) = func_ov004_021da978();
    *(int *)(b + 0xa0) = func_ov004_021daa48();
}
