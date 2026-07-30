#include "ov002_core.h"

struct RowB9830 {
    unsigned int id     : 13;
    unsigned int bit13  : 1;
    unsigned int _pad   : 8;
    unsigned int fieldA : 8;
    unsigned int _pad2  : 2;
    char _pad3[16];
};

int func_ov002_021b9750(int target) {
    int player;

    for (player = 0; player < 2; player++) {
        struct RowB9830 *row = (struct RowB9830 *)((char *)data_ov002_022cf08c + (player & 1) * 0x868 + 0x30);
        int idx;
        for (idx = 0; idx <= 10; idx++) {
            if (row[idx].id == 0) continue;
            if (row[idx].fieldA * 2 + row[idx].bit13 == target) {
                return (unsigned short)((unsigned char)player | ((unsigned char)idx << 8));
            }
        }
    }
    return -1;
}
