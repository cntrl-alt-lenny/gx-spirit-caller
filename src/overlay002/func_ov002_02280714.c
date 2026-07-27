#include "ov002_core.h"

extern int data_ov002_022cd524[];
extern int func_ov002_0225368c(int arg0);
extern int func_ov002_0227f03c(int a, int b, int c);
extern void func_ov002_021afb64(void);
extern void func_ov002_021aff4c(int a, int b);

int func_ov002_02280714(int arg0, int arg1, int arg2, int limit) {
    int result = func_ov002_0225368c(arg0);
    if (limit >= result)
        limit = result;
    *(int *)data_ov002_022cd524 = arg0;
    int i;
    for (i = 0; i < limit; i++) {
        int v = func_ov002_0227f03c(arg0, arg1, arg2);
        if (v < 0)
            break;
        func_ov002_021afb64();
        func_ov002_021aff4c(v, i + 1);
    }
    D016C->f_d44 = i;
    return i;
}
