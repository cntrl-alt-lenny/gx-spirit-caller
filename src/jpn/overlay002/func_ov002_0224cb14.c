/* func_ov002_0224cb14: post kind-13 for indices 0..min(row[0x10],3)-1. */
#include "ov002_core.h"

void func_ov002_0224cb14(int player)
{
    int i = 0;
    char *row = (char *)data_ov002_022cf08c + (player & 1) * 0x868;

    while (i < *(u32 *)(row + 0x10) && i < 3) {
        func_ov002_02253370(player, 13, i);
        i++;
    }
}
