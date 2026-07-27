#include "ov002_core.h"

struct NodeEntry {
    u16 f_0;
    u16 kind : 4;
    u16 : 12;
    char _pad4[2];
    u16 f_6;
};

struct Ov002B2240Arg {
    char _pad[0xa];
    u16 f_a;
};

extern struct NodeEntry data_ov002_022d0650[];
extern void func_ov002_021b1d84(int id);

void func_ov002_021b2240(struct Ov002B2240Arg *self) {
    unsigned idx;
    struct NodeEntry *entry;
    unsigned next;

    idx = self->f_a;
    if (idx == 0)
        return;
    do {
        entry = &data_ov002_022d0650[idx];
        next = entry->f_6;
        if (entry->kind >= 6 || entry->f_0 != 0x164f)
            func_ov002_021b1d84(idx);
        idx = next;
    } while (idx != 0);
}
