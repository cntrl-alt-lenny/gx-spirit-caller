#include "ov002_core.h"
void func_ov002_02249398(int player) {
    int i = 0;
    int p = 1 - player;
    char *base = (char *)data_ov002_022cf16c + (p & 1) * 0x868;
    for (; (unsigned int)i < *(unsigned int *)(base + 0x10) && i < 5; i++) {
        func_ov002_02253458(p, 13, i);
    }
}
