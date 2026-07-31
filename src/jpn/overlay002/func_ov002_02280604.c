#include "ov002_core.h"

extern int data_ov002_022cd444[];
extern int func_ov002_022535a4(int arg0);
extern int func_ov002_0227ef2c(int a, int b, int c);
extern void func_ov002_021afa84(void);
extern void func_ov002_021afe6c(int a, int b);

int func_ov002_02280604(int arg0, int arg1, int arg2, int limit) {
    int result = func_ov002_022535a4(arg0);
    if (limit >= result)
        limit = result;
    *(int *)data_ov002_022cd444 = arg0;
    int i;
    for (i = 0; i < limit; i++) {
        int v = func_ov002_0227ef2c(arg0, arg1, arg2);
        if (v < 0)
            break;
        func_ov002_021afa84();
        func_ov002_021afe6c(v, i + 1);
    }
    D016C->f_d44 = i;
    return i;
}
