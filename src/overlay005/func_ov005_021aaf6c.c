#include "ov005_core.h"
extern void func_02006e1c(int);
extern int func_02006c0c(int, int, int);
extern void func_ov005_021aafac(int *, int);
void func_ov005_021aaf6c(int *o, int a1) {
    if (o[0]) func_02006e1c(o[0]);
    o[0] = func_02006c0c(a1, 4, 0);
    func_ov005_021aafac(o, o[0]);
}
