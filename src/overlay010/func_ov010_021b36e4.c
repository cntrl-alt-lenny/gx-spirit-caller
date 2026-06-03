/* func_ov010_021b36e4: load a scroll window's geometry from arg1 (x/y/w/h
 * shorts) into arg0 and derive its row count (height / line-height). */
#include "ov010_core.h"
extern int func_020b3870(int a, int b);
void func_ov010_021b36e4(void *arg0, short *arg1) {
    char *p = arg0;
    *(short *)(p + 84) = arg1[0];
    *(short *)(p + 86) = arg1[1];
    *(short *)(p + 88) = arg1[2];
    *(short *)(p + 90) = arg1[3];
    *(int *)(p + 96) = 0;
    *(int *)(p + 100) = func_020b3870(*(short *)(p + 90) - *(short *)(p + 86), *(short *)(p + 108)) - 1;
}
