#include "ov002_core.h"

extern int func_ov002_021c3ae4(void *a, int b);

int func_ov002_021b025c(void *self) {
    if (func_ov002_021c3ae4(self, 0xfb7) == 0) return 0;
    if (func_ov002_021c3ae4(self, 0xfb8) == 0) return 0;
    if (func_ov002_021c3ae4(self, 0xfb9) == 0) return 0;
    if (func_ov002_021c3ae4(self, 0xfba) == 0) return 0;
    return func_ov002_021c3ae4(self, 0xfbb) != 0;
}
