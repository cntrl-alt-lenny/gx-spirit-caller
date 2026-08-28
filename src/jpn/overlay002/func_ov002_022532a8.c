/* func_ov002_022532a8: pick a per-player count table by kind (12-15),
 * then post kind to func_ov002_02253370 for idx 0..count-1. */
#include "ov002_core.h"

extern int data_ov002_022cf0a0[];
extern int data_ov002_022cf0a8[];

void func_ov002_022532a8(int player, int unused, int kind) {
    int i;
    int count;

    switch (kind) {
    case 14:
        count = *(int *)((char *)data_ov002_022cf0a0 + (player & 1) * 0x868);
        break;
    case 12:
        count = *(int *)((char *)data_ov002_022cf0a4 + (player & 1) * 0x868);
        break;
    case 15:
        count = *(int *)((char *)data_ov002_022cf0a8 + (player & 1) * 0x868);
        break;
    case 13:
        count = *(int *)((char *)data_ov002_022cf09c + (player & 1) * 0x868);
        break;
    }

    for (i = 0; i < count; i++) {
        func_ov002_02253370(player, kind, i);
    }
}
