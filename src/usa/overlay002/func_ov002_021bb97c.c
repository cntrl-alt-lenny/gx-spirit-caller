#include "ov002_core.h"

extern int func_0202e1e0(int arg1);
extern int func_ov002_021b9dec(int self, int playerRow);

int func_ov002_021bb97c(int self, int arg1, int arg2) {
    int lo;
    int hi;
    int playerRow;
    int count;
    unsigned char *row;
    unsigned int f40;
    unsigned short f38;
    int check;

    count = 0;

    if (func_0202e1e0(arg1) != 0) {
        lo = count;
        hi = 4;
    } else {
        lo = 5;
        hi = 10;
    }

    if (lo <= hi) {
        row = data_ov002_022cf08c + (self & 1) * 0x868 + lo * 20;
        playerRow = lo;
        do {
            check = func_ov002_021b9dec(self, playerRow);
            if (check == arg1) {
                f40 = *(unsigned int *)(row + 0x40);
                f38 = *(unsigned short *)(row + 0x38);
                if ((f38 & ~((f40 >> 6) & 1) & ~(((f40 >> 1) | (f40 >> 2)) & 1)) != 0) {
                    if (arg2 == *(int *)(row + 0x3c)) {
                        count++;
                    }
                }
            }
            playerRow++;
            row += 0x14;
        } while (playerRow <= hi);
    }

    return count;
}
