/* func_ov002_021de4b0: test bit (arg2 + arg1*16) of the mask returned by
 * func_ov002_021de408. */
#include "ov002_core.h"
extern int func_ov002_021de408(int a, int mask);
int func_ov002_021de4b0(int arg0, int arg1, int arg2) {
    int mask = 1 << (arg2 + arg1 * 16);
    return (func_ov002_021de408(arg0, mask) & mask) != 0;
}
