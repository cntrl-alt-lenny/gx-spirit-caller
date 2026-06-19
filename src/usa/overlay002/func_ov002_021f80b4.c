/* func_ov002_021f80b4: route arg0 by slot kind (bits 5..9 of +2) — <=4 to the
 * default handler (021f4a4c), else the special one (021f5824); arg1 passed through. */
#include "ov002_core.h"
extern int func_ov002_021f5734(void *a, int b);
extern int func_ov002_021f495c(void *a, int b);
int func_ov002_021f80b4(void *arg0, int arg1) {
    if (((unsigned)(*(u16 *)((char *)arg0 + 2) << 26) >> 27) <= 4)
        return func_ov002_021f495c(arg0, arg1);
    return func_ov002_021f5734(arg0, arg1);
}
