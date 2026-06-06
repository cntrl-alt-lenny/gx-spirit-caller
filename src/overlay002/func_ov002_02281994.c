/* func_ov002_02281994: 1 if query (u16)arg1 holds (func_ov002_021c3ae4) or the
 * fallback func_ov002_021bbd14 does. */
#include "ov002_core.h"
extern int func_ov002_021c3ae4(void *a, int b);
extern int func_ov002_021bbd14(void *a, int b);
int func_ov002_02281994(void *arg0, int arg1) {
    if (func_ov002_021c3ae4(arg0, (u16)arg1) != 0) return 1;
    return func_ov002_021bbd14(arg0, arg1) != 0;
}
