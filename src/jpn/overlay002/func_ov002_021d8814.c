#include "ov002_core.h"

struct Ov002LevelWord {
    unsigned int id : 13;
    unsigned int half : 1;
    unsigned int : 8;
    unsigned int level : 8;
    unsigned int : 2;
};

extern void func_ov002_021d88ac(int player, int idx, int flag);
extern int func_ov002_021d46ac(int packed, int a, int b, int c);

void func_ov002_021d8814(int player, int idx, int value) {
    if (idx <= 10) {
        char *rowptr = data_ov002_022cf08c + (player & 1) * 0x868;
        struct Ov002LevelWord *w = (struct Ov002LevelWord *)((rowptr + 0x30) + idx * 0x14);
        int computed = w->half + (w->level << 1);
        if (value == computed) {
            func_ov002_021d88ac(player, idx, 1);
        }
    }
    int packed = (player != 0) ? 0x8000 : 0;
    packed |= 0x43;
    func_ov002_021d46ac((u16)packed, (u16)idx, (u16)value, 0);
}
