typedef signed char s8;
typedef signed short s16;
typedef signed int s32;
typedef signed long long s64;
#include "ov002_core.h"

s32 func_ov002_021b3e28(s32, s32, int);               /* extern */
s32 func_ov002_021b9ecc(s32, s32);                  /* extern */
int func_ov002_021d5b80(s32, s32, int, int);              /* extern */
int func_ov002_021d91e0(s32, s32, s32);               /* extern */
extern char data_ov002_022cf1ac[];

s32 func_ov002_02256ac8(void) {
    s32 temp_r6;
    s32 temp_sl;
    s32 var_r7;
    s32 var_r8;
    u32 temp_r1;
    char *var_r9;

    var_r8 = 0;
loop_1:
    var_r7 = 0;
    temp_r6 = (*(int *)(data_ov002_022d016c + 0xcec)) ^ var_r8;
    temp_sl = (temp_r6 & 1) * 0x868;
    var_r9 = data_ov002_022cf16c + temp_sl;
loop_2:
    if ((func_ov002_021b9ecc(temp_r6, var_r7) == 0x1817) && ((*(u16 *)(var_r9 + 0x38)) != 0)) {
        temp_r1 = (u32) (*(int *)(var_r9 + 0x40));
        if (!(((temp_r1 >> 1) | (temp_r1 >> 2)) & 1) && (func_ov002_021b3e28(temp_r6, var_r7, 0x1817) != 0)) {
            if (!(((u32) *(int *)((var_r7 * 0x14) + (data_ov002_022cf1ac + temp_sl)) >> 6) & 1)) {
                func_ov002_021d91e0(temp_r6, var_r7, func_ov002_021b3e28(temp_r6, var_r7, 0x1817));
            }
            func_ov002_021d5b80(temp_r6, var_r7, 0x1817, 1);
            return 1;
        }
    }
    var_r7 += 1;
    var_r9 += 0x14;
    if (var_r7 > 4) {
        var_r8 += 1;
        if (var_r8 >= 2) {
            return 0;
        }
        goto loop_1;
    }
    goto loop_2;
}
