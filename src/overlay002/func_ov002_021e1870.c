#include "ov002_core.h"

extern char data_ov002_022d0250[];
extern int func_ov002_021ca5bc(int arg0);

struct SmallSlotU16 {
    unsigned short id : 13;
    unsigned short rest : 3;
};
extern int func_0202e2c8(int id);
extern int func_ov002_02244fe4(int a, int b);
extern int func_ov002_021e1414(int a, int b, int c);

void func_ov002_021e1870(int arg0, int idx, int arg2) {
    int id = ((struct SmallSlotU16 *)(data_ov002_022d0250 + idx * 4))->id;

    if (func_ov002_021ca5bc(idx) == 0) {
        int cmd = (func_0202e2c8(id) != 0) ? 0xc : 0xd;
        int gateFlag = (arg2 != 0) ? 1 : 0;
        int packed = (arg0 != 0) ? 0x8000 : 0;
        packed |= 0x33;
        func_ov002_021d479c((unsigned short)packed, (unsigned short)cmd, (unsigned short)gateFlag, (unsigned short)idx);
        func_ov002_02244fe4(0x24, 0);
    } else {
        func_ov002_021e1414(arg0, idx, arg2);
    }
}
