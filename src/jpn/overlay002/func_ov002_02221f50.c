/* func_ov002_02221f50: send event (d016c+3308, (u16)*arg0, 1, 0); return 0. */
#include "ov002_core.h"
extern void func_ov002_021e267c(int a, int b, int c, int d);
int func_ov002_02221f50(void *arg0) {
    func_ov002_021e267c(*(int *)(data_ov002_022d008c + 3308), *(u16 *)arg0, 1, 0);
    return 0;
}
