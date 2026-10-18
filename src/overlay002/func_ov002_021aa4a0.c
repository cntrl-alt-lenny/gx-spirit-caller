#include "ov002_core.h"

struct NodeEntry {
    u16 f_0;
    u16 kind : 4;
    u16 : 12;
    char _pad4[2];
    u16 f_6;
};

struct Slot {
    u16 head;
    char _pad[0x12];
};

struct Side {
    struct Slot slot[0x868 / 0x14];
    char _pad[0x868 - (0x868 / 0x14) * 0x14];
};

extern struct Side data_ov002_022cf1a6[];
extern struct NodeEntry data_ov002_022d0650[];
extern int func_ov002_021baca8(int a, int b, int c);
extern int func_ov002_021de480(int a, int b, int c, int d);

void func_ov002_021aa4a0(unsigned player, int idx, int arg2, int flag) {
    unsigned cur;
    struct NodeEntry *e;
    int lo, hi;

    cur = data_ov002_022cf1a6[player & 1].slot[idx].head;
    if (cur == 0)
        return;
    do {
        e = &data_ov002_022d0650[cur];
        cur = e->f_6;
        if (e->kind == 10) {
            lo = e->f_0 & 0xff;
            hi = (e->f_0 >> 8) & 0xff;
            if (func_ov002_021baca8(lo, hi, arg2) != 0) {
                if (flag != 0)
                    func_ov002_021de480(lo, hi, 0, 0);
                else
                    flag = 1;
            }
        }
    } while (cur != 0);
}
