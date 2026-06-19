/* func_ov002_0223b340: for arg0 <= 20, 1 iff func_021c8940(arg1, arg2) equals
 * arg0; else hand (arg1, arg2, arg0) to func_021ba104. */
#include "ov002_core.h"
extern int func_ov002_021c8860(int a, int b);
extern int func_ov002_021ba024(int a, int b, int c);
int func_ov002_0223b340(int arg0, int arg1, int arg2) {
    if (arg0 <= 20) return func_ov002_021c8860(arg1, arg2) == arg0;
    return func_ov002_021ba024(arg1, arg2, arg0);
}
