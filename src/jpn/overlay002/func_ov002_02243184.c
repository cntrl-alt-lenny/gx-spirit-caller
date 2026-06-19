/* func_ov002_02243184: if the 5-bit kind field (bits 5..9 of arg0[2]) exceeds 4,
 * return 1; else delegate to func_ov002_0223fa60 (arg passed through). */
#include "ov002_core.h"
extern int func_ov002_0223fa60(void *a, int b);
int func_ov002_02243184(void *arg0, int arg1) {
    if (((unsigned)(*(u16 *)((char *)arg0 + 2) << 26) >> 27) > 4) return 1;
    return func_ov002_0223fa60(arg0, arg1);
}
