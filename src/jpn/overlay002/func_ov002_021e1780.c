#include "ov002_core.h"

extern char data_ov002_022d0170[];
extern int func_ov002_021ca4dc(int arg0);

struct SmallSlotU16 {
    unsigned short id : 13;
    unsigned short rest : 3;
};
extern int func_0202e274(int id);
extern int func_ov002_02244efc(int a, int b);
extern int func_ov002_021e1324(int a, int b, int c);

void func_ov002_021e1780(int arg0, int idx, int arg2) {
    int id = ((struct SmallSlotU16 *)(data_ov002_022d0170 + idx * 4))->id;

    if (func_ov002_021ca4dc(idx) == 0) {
        int cmd = (func_0202e274(id) != 0) ? 0xc : 0xd;
        int gateFlag = (arg2 != 0) ? 1 : 0;
        int packed = (arg0 != 0) ? 0x8000 : 0;
        packed |= 0x33;
        func_ov002_021d46ac((unsigned short)packed, (unsigned short)cmd, (unsigned short)gateFlag, (unsigned short)idx);
        func_ov002_02244efc(0x24, 0);
    } else {
        func_ov002_021e1324(arg0, idx, arg2);
    }
}
