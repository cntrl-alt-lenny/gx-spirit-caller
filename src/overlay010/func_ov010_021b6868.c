/* func_ov010_021b6868: sibling of 021b4090 on the second manager (021b9890) —
 * select/toggle, bind/release, flag, toast id 86, refresh. */
#include "ov010_core.h"
extern int func_ov005_021ac9d0(int a, int b);
extern int func_ov005_021ab384(int a, int b, int c);
extern void func_ov005_021ab354(int a, int b, int c);
extern void func_ov005_021ab32c(int a, int b, int c);
extern void func_ov005_021ab6ac(int a);
extern void func_02037208(int a, int b, int c, int d);
extern int func_ov010_021b6814(void);
extern void func_ov010_021b2450(int a, int b, int c);
int func_ov010_021b6868(int arg0, int arg1) {
    char *m = data_ov010_021b9890;
    int sel = arg1;
    int ret;
    if (arg1 < 0) sel = func_ov005_021ac9d0(*(int *)(m + 136), arg0);
    if (func_ov005_021ab384(*(int *)(m + 132), sel, 2) != 0) {
        func_ov005_021ab354(*(int *)(m + 132), sel, 2);
        *(int *)(m + 856) |= 2;
        ret = 0;
    } else {
        func_ov005_021ab32c(*(int *)(m + 132), sel, 2);
        ret = 1;
    }
    *(int *)(m + 856) = (*(int *)(m + 856) & ~1) | 1;
    func_02037208(86, -1, 0, 1);
    func_ov010_021b2450(*(int *)(m + 52), 0, func_ov010_021b6814());
    func_ov005_021ab6ac(*(int *)(m + 136));
    *(int *)(m + 4) = sel;
    return ret;
}
