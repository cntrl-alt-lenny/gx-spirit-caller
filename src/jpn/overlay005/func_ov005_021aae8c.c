#include "ov005_core.h"
extern void func_02006e00(int);
extern int func_02006bf0(int, int, int);
extern void func_ov005_021aaecc(int *, int);
void func_ov005_021aae8c(int *o, int a1) {
    if (o[0]) func_02006e00(o[0]);
    o[0] = func_02006bf0(a1, 4, 0);
    func_ov005_021aaecc(o, o[0]);
}
