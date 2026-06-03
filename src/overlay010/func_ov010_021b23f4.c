/* func_ov010_021b23f4: clamp arg1 into [unk60, unk5C], store it (unk68), and
 * project it onto the row span -> unk04 (0 when the range is degenerate). */
#include "ov010_core.h"
extern int func_020b3870(int a, int b);
void func_ov010_021b23f4(void *arg0, int arg1) {
    char *p = arg0;
    int span = *(short *)(p + 86) - *(short *)(p + 78);
    int q;
    if (arg1 < *(int *)(p + 96)) arg1 = *(int *)(p + 96);
    if (arg1 > *(int *)(p + 92)) arg1 = *(int *)(p + 92);
    *(int *)(p + 104) = arg1;
    if (*(int *)(p + 96) == *(int *)(p + 92)) q = 0;
    else q = func_020b3870(span * (arg1 - *(int *)(p + 96)), *(int *)(p + 92) - *(int *)(p + 96));
    *(int *)(p + 4) = q;
}
