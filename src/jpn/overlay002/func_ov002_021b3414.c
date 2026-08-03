#include "ov002_core.h"

typedef unsigned char u8;

struct Rec0650 {
    u16 f0;
    unsigned short kind : 4;
    unsigned short _pad2 : 12;
    u16 f4;
    u16 next;
};

extern char data_ov002_022cf0c6[];
extern struct Rec0650 data_ov002_022d0570[];

int func_ov002_021b3414(int row_sel, int col_idx, int lo_want, int hi_want)
{
    struct Ov002Slot *slot;
    unsigned int field;
    u16 idx;
    char *row;

    row = (char *)data_ov002_022cf08c + (row_sel & 1) * 0x868 + 0x30;
    slot = (struct Ov002Slot *)(row + col_idx * 20);
    if (slot->id == 0)
        return 0;

    idx = *(u16 *)((char *)data_ov002_022cf0c6 + (row_sel & 1) * 0x868 + col_idx * 20);
    if (idx == 0)
        goto not_found;

    do {
        struct Rec0650 *rec = &data_ov002_022d0570[idx];
        u16 next;

        field = rec->kind;
        next = rec->next;
        if (field >= 6) {
            u16 f0 = rec->f0;
            u8 lo_byte = f0;
            u8 hi_byte = f0 >> 8;
            if (lo_byte == lo_want && hi_byte == hi_want)
                return field;
        }
        idx = next;
    } while (idx != 0);

not_found:
    return 0;
}
