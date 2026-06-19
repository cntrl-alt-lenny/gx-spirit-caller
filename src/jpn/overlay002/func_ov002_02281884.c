/* func_ov002_02281884: 1 if query (u16)arg1 holds (func_ov002_021c3a04) or the
 * fallback func_ov002_021bbc34 does. */
#include "ov002_core.h"
extern int func_ov002_021c3a04(void *a, int b);
extern int func_ov002_021bbc34(void *a, int b);
int func_ov002_02281884(void *arg0, int arg1) {
    if (func_ov002_021c3a04(arg0, (u16)arg1) != 0) return 1;
    return func_ov002_021bbc34(arg0, arg1) != 0;
}
