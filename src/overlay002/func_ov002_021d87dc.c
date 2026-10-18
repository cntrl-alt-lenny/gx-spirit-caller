#include "ov002_core.h"
struct Row87dc {
    char pad[0x260];
    unsigned int p0 : 13;
    unsigned int f1 : 1;
    unsigned int p1 : 8;
    unsigned int f2 : 8;
    unsigned int p2 : 2;
    char rest[0x868 - 0x264];
};
void func_ov002_021d87dc(int arg0) {
    int flag = arg0 ? 0x8000 : 0;
    struct Row87dc *row = (struct Row87dc *)data_ov002_022cf16c + (arg0 & 1);
    func_ov002_021d479c((u16)(flag | 0x29), 0xd, (u16)(row->f2 * 2 + row->f1), 0);
}
