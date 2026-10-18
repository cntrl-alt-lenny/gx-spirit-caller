#include "ov002_core.h"

struct Entry0650 {
    u16 f_0;
    u16 kind : 4;
    u16 sub : 4;
    u16 : 8;
    u16 f_4;
    u16 next;
};

extern char data_ov002_022cf16c[];
extern char data_ov002_022d0656[];
extern struct Entry0650 data_ov002_022d0650[];
extern int func_ov002_021b1d48(int a0);

void func_ov002_021b1f20(int a0, int a1, int a2, int a3, int a4) {
    int newIdx;
    u16 *p;
    u16 idx;
    unsigned char lo;
    unsigned char hi;
    struct Entry0650 *e;
    char *base;

    newIdx = func_ov002_021b1d48(a0);
    base = data_ov002_022cf16c + (a0 & 1) * 0x868;
    e = &data_ov002_022d0650[newIdx];
    p = (u16 *)(base + 0x3a + a1 * 0x14);

    idx = *p;
    while (idx != 0) {
        p = (u16 *)(data_ov002_022d0656 + idx * 8);
        idx = *p;
    }

    *p = (u16)newIdx;

    lo = a2 & 0xf;
    hi = (a2 & 0xf0) >> 4;
    e->kind = lo;
    e->sub = hi;
    e->f_0 = a3;
    e->f_4 = a4;
    e->next = 0;
}
