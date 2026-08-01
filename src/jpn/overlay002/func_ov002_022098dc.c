#include "ov002_core.h"

struct Ov002LevelWordPad {
    unsigned int id : 13;
    unsigned int half : 1;
    unsigned int : 8;
    unsigned int level : 8;
    unsigned int : 2;
    char _pad[16];
};

struct Ov002Field4 {
    u16 : 6;
    u16 val : 9;
    u16 : 1;
};

extern int func_ov002_022574e0(void *self, int player, int idx);

int func_ov002_022098dc(void *self) {
    int counter = 0;
    for (int player = 0; player < 2; player++) {
        struct Ov002LevelWordPad *slot = (struct Ov002LevelWordPad *)(data_ov002_022cf08c + (player & 1) * 0x868 + 0x30);
        for (int idx = 0; idx <= 10; idx++) {
            if (func_ov002_022574e0(self, player, idx) != 0) {
                int computed = slot[idx].half + (slot[idx].level << 1);
                struct Ov002Field4 *f4 = (struct Ov002Field4 *)((char *)self + 4);
                if (f4->val != computed) {
                    counter++;
                }
            }
        }
    }
    return counter >= 2;
}
