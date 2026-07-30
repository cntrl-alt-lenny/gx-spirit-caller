#include "ov002_core.h"

extern int func_0202e234(int a);
extern int func_ov002_021baca8(int player, int idx, int arg1);

void func_ov002_021c2934(int player, int arg1, int arg2) {
    int i, iend;
    if (func_0202e234(arg1) != 0) {
        i = 0;
        iend = 4;
    } else {
        i = 5;
        iend = 9;
    }
    if (i <= iend) {
        char *row = (char *)data_ov002_022cf16c + (player & 1) * 0x868 + i * 20;
        do {
            if (func_ov002_021baca8(player, i, arg1) != 0) {
                *(int *)(row + 0x3c) += arg2;
            }
            i++;
            row += 20;
        } while (i <= iend);
    }
}
