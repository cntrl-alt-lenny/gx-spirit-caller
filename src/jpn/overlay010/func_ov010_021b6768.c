/* func_ov010_021b6768: sibling of 021b4090 on the second manager (021b9890) —
 * select/toggle, bind/release, flag, toast id 86, refresh. */
#include "ov010_core.h"
extern int func_ov005_021ac8c8(int a, int b);
extern int func_ov005_021ab2a4(int a, int b, int c);
extern void func_ov005_021ab274(int a, int b, int c);
extern void func_ov005_021ab24c(int a, int b, int c);
extern void func_ov005_021ab5cc(int a);
extern void func_020371b8(int a, int b, int c, int d);
extern int func_ov010_021b6714(void);
extern void func_ov010_021b2350(int a, int b, int c);
int func_ov010_021b6768(int arg0, int arg1) {
    char *m = data_ov010_021b9790;
    int sel = arg1;
    int ret;
    if (arg1 < 0) sel = func_ov005_021ac8c8(*(int *)(m + 136), arg0);
    if (func_ov005_021ab2a4(*(int *)(m + 132), sel, 2) != 0) {
        func_ov005_021ab274(*(int *)(m + 132), sel, 2);
        *(int *)(m + 856) |= 2;
        ret = 0;
    } else {
        func_ov005_021ab24c(*(int *)(m + 132), sel, 2);
        ret = 1;
    }
    *(int *)(m + 856) = (*(int *)(m + 856) & ~1) | 1;
    func_020371b8(86, -1, 0, 1);
    func_ov010_021b2350(*(int *)(m + 52), 0, func_ov010_021b6714());
    func_ov005_021ab5cc(*(int *)(m + 136));
    *(int *)(m + 4) = sel;
    return ret;
}
