#include "ov002_core.h"

typedef unsigned short u16;

struct Ov002Field4 {
    u16 : 6;
    u16 val : 9;
    u16 : 1;
};

struct Ov002LevelWord {
    unsigned int id : 13;
    unsigned int half : 1;
    unsigned int : 8;
    unsigned int level : 8;
    unsigned int : 2;
};

extern void func_ov002_021df728(void *self, int player, int ms);

int func_ov002_0221dc18(void *self) {
    u16 field4 = *(u16 *)((char *)self + 4);
    int bit2 = (unsigned)(field4 << 29) >> 31;
    if (bit2 != 0) {
        return 0;
    }
    struct Ov002Field4 *f4 = (struct Ov002Field4 *)((char *)self + 4);
    int val9 = f4->val;
    u16 field2 = *(u16 *)((char *)self + 2);
    int player = (unsigned)(field2 << 31) >> 31;
    int idx = (unsigned)(field2 << 26) >> 27;
    struct Ov002LevelWord *w = (struct Ov002LevelWord *)((data_ov002_022cf08c + (player & 1) * 0x868 + 0x30) + idx * 0x14);
    int computed = w->half + (w->level << 1);
    if (val9 != computed) {
        return 0;
    }
    if (*(u16 *)((char *)self + 8) != 0) {
        func_ov002_021df728(self, 1 - player, 500);
    }
    return 0;
}
