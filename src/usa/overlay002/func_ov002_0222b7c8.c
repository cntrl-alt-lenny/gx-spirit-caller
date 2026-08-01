#include "ov002_core.h"

struct Ov002LevelWord {
    unsigned int id : 13;
    unsigned int half : 1;
    unsigned int : 8;
    unsigned int level : 8;
    unsigned int : 2;
};

struct Ov002Field4 {
    u16 : 6;
    u16 val : 9;
    u16 : 1;
};

extern void func_ov002_021d92f0(int player, int idx, int flag);

int func_ov002_0222b7c8(void *self) {
    u16 field2 = *(u16 *)((char *)self + 2);
    int player = (unsigned)(field2 << 31) >> 31;
    int idx = (unsigned)(field2 << 26) >> 27;
    struct Ov002LevelWord *w = (struct Ov002LevelWord *)((data_ov002_022cf08c + (player & 1) * 0x868 + 0x30) + idx * 0x14);
    int computed = w->half + (w->level << 1);
    struct Ov002Field4 *f4 = (struct Ov002Field4 *)((char *)self + 4);
    if (f4->val != computed) {
        return 0;
    }
    if (*(u16 *)((data_ov002_022cf0c4 + (player & 1) * 0x868) + idx * 0x14) == 0) {
        return 0;
    }
    func_ov002_021d92f0(player, idx, 1);
    return 0;
}
