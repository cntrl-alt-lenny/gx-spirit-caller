/* func_ov002_02291f10: if arg0's state (bits 12..13 of +2) is 0, run
 * func_ov002_02291050 (arg1 passed through); else 1 iff func_ov002_0227d570 is
 * non-negative. */
#include "ov002_core.h"
extern int func_ov002_02291050(void *a, int b);
extern int func_ov002_0227d570(int a, int b);
struct S02292020 { u16 b0 : 1; u16 pad : 11; u16 f12 : 2; };
int func_ov002_02291f10(void *arg0, int arg1) {
    struct S02292020 *s = (struct S02292020 *)((char *)arg0 + 2);
    if (s->f12 == 0) return func_ov002_02291050(arg0, arg1);
    return func_ov002_0227d570(s->b0, 0) >= 0;
}
