#include "ov002_core.h"

struct Rec0650 {
    u16 f0;
    unsigned short kind : 4;
    unsigned short _pad2 : 12;
    u16 f4;
    u16 next;
};

extern char data_ov002_022cf1a6[];
extern struct Rec0650 data_ov002_022d0650[];

int func_ov002_021b3314(int player, int idx)
{
    int count;
    u16 cur;

    count = 0;
    cur = *(u16 *)(data_ov002_022cf1a6 + (player & 1) * 0x868 + idx * 0x14);
    if (cur == 0)
        return count;

    do {
        struct Rec0650 *rec = &data_ov002_022d0650[cur];
        u16 next = rec->next;

        if (rec->kind >= 10) {
            u16 f0 = rec->f0;
            u8 side = f0;
            u8 slot = f0 >> 8;
            struct Ov002Slot *s = (struct Ov002Slot *)(data_ov002_022cf16c + (side & 1) * 0x868 + slot * 0x14 + 0x30);
            if (s->id != 0)
                count++;
        }
        cur = next;
    } while (cur != 0);
    return count;
}
