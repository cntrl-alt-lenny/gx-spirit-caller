/* func_ov002_02237960: 0 while paused (d016c+208 bit0) or arg0 has no timer
 * (u16 +12); else delegate to func_ov002_02211b64 (arg1 passed through). */
#include "ov002_core.h"
extern int func_ov002_02211b64(void *a, int b);
int func_ov002_02237960(void *arg0, int arg1) {
    if (*(int *)(data_ov002_022d016c + 208) & 1) return 0;
    if (*(u16 *)((char *)arg0 + 12) == 0) return 0;
    return func_ov002_02211b64(arg0, arg1);
}
