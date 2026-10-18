#include "ov002_core.h"

struct Hdr8a14 {
    u16 f0;
    u16 b0 : 1;
};

struct Slot8a14 {
    u32 lo : 13;
    u32 bit : 1;
    u32 mid : 8;
    u32 hi : 8;
    u32 top : 2;
};

extern char data_ov002_022cf16c[];
extern int func_0202b878(int x);
extern int func_ov002_021c23ac(int a, int b);
extern int func_ov002_021c8940(int a, int b);
extern int func_ov002_021ca5bc(int x);

int func_ov002_021f8a14(u32 a, int b, int c) {
    int r;
    if (a != (*(struct Hdr8a14 **)(data_ov002_022ce288 + 0x48c))->b0) return 0;
    if (b <= 4) {
        if (func_ov002_021c23ac(a, b + c) == 0) return 0;
        r = func_ov002_021c8940(a, b + c);
        if (r == 11 || r == 12 || r == 16) return 0x800;
    } else if (b == 11) {
        struct Slot8a14 *row = (struct Slot8a14 *)(data_ov002_022cf16c + (a & 1) * 0x868 + 0x120);
        if (func_ov002_021ca5bc(row[c].hi * 2 + row[c].bit) == 0) return 0;
        r = func_0202b878(row[c].lo);
        switch (r) {
        case 11:
        case 12:
        case 16:
            return 0x800;
        }
    }
    return 0;
}
