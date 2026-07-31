#include "ov002_core.h"
extern char data_ov002_022cf0c4[];
extern int func_ov002_021bc7e8(int a);

int func_ov002_021eab98(int unused0, int side, int idx) {
    if (func_ov002_021bc7e8(D016C->f_cec) == 0) return 0;
    char *row = data_ov002_022cf0c4 + (side & 1) * 0x868;
    return *(unsigned short *)(row + idx * 0x14) != 0;
}
