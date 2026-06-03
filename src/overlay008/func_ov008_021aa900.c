#include "ov008_core.h"
extern int func_ov008_021aa540(int);
void func_ov008_021aa900(void) {
    char *row = data_ov008_021b2790;
    int i;
    for (i = 0; i < 26; i++) {
        *(unsigned short *)(row + 12) -= func_ov008_021aa540(i);
        *(int *)(row + 16) = 0;
        *(int *)(row + 20) = 0;
        *(int *)(row + 44) = 0;
        *(int *)(row + 48) = 0;
        row += 52;
    }
}
