/* func_ov002_0220cf80: unpack the slot word at +2 (bit0 flag, bits1..5 kind) and
 * forward with the u16 at +0 to func_ov002_021b3fb8. Tail-call. */
#include "ov002_core.h"
struct S0220d070 { u16 b0 : 1; u16 f1 : 5; };
extern int func_ov002_021b3fb8(int a, int b, int c);
int func_ov002_0220cf80(void *arg0) {
    struct S0220d070 *s = (struct S0220d070 *)((char *)arg0 + 2);
    return func_ov002_021b3fb8(s->b0, s->f1, *(u16 *)arg0);
}
