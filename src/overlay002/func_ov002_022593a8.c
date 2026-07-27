/* func_ov002_022593a8: if data_ov002_022cd744[a] == 1, tail-call the
 * dispatch table func_ov002_0228fa1c(a,b,c). Otherwise stash a,b,c into the
 * D016C per-player scratch record (kind=10). */
#include "ov002_core.h"
extern int data_ov002_022cd744[];
extern int func_ov002_0228fa1c(int a, int b, int c);

int func_ov002_022593a8(int a, int b, int c) {
    if (data_ov002_022cd744[a] == 1) {
        return func_ov002_0228fa1c(a, b, c);
    }
    D016C->f_d48 = 10;
    D016C->f_d84 = c;
    D016C->f_d54 = 0;
    D016C->f_d50 = 0;
    D016C->f_d6c = a;
    D016C->f_d58 = b;
}
