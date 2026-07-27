#include "ov002_core.h"

struct SlotU16 {
    u16 id : 13;
};

extern char data_ov002_022d0170[];
extern int func_0202b0ac(int a0);
extern int func_ov002_0229cd4c(void *buf, void *self, int result);

int func_ov002_021ae3dc(void *self, int idx)
{
    char buf[256];
    struct SlotU16 *slot = (struct SlotU16 *)(data_ov002_022d0170 + idx * 4);
    int result = func_0202b0ac(slot->id);

    func_ov002_0229cd4c(buf, self, result);
    return func_ov002_0229acd0(0x31, 1, (int)buf, idx);
}
