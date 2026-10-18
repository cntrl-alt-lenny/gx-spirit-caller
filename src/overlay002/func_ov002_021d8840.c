#include "ov002_core.h"

struct Ent {
    char _p0[0x6];
    u16 f6;
    u16 f8;
    char _p1[0x14 - 0xa];
};

struct Wd {
    u32 cnt : 13;
    u32 : 19;
    char _p[0x10];
};

void func_ov002_021d8840(unsigned player, unsigned mask) {
    int i, cnt;
    u32 v;
    struct Wd *w;
    struct Ent *e = (struct Ent *)(data_ov002_022cf16c + (player & 1) * 0x868);

    v = *(u32 *)(data_ov002_022d016c + 0xce4);
    cnt = 0;
    w = (struct Wd *)((char *)e + 0x30);
    for (i = 0; i < 5; i++, w++, e++) {
        if (w->cnt != 0 && *(u16 *)((char *)e + 0x38) == 0 && *(u16 *)((char *)e + 0x36) != 0) {
            cnt++;
        } else {
            mask &= ~(1 << i);
        }
    }
    if (cnt > 1) {
        func_ov002_021d479c((u16)((player != 0 ? 0x8000 : 0) | 0x49), (u16)v, (u16)(v >> 16), (u16)mask);
    }
}
