#include "ov002_core.h"

struct SlotU16 {
    u16 id : 13;
};

extern char data_ov002_022d0250[];
extern int func_0202b100(int a0);
extern int func_ov002_0229ce5c(void *buf, void *self, int result);

int func_ov002_021ae4bc(void *self, int idx)
{
    char buf[256];
    struct SlotU16 *slot = (struct SlotU16 *)(data_ov002_022d0250 + idx * 4);
    int result = func_0202b100(slot->id);

    func_ov002_0229ce5c(buf, self, result);
    return func_ov002_0229ade0(0x31, 1, (int)buf, idx);
}
