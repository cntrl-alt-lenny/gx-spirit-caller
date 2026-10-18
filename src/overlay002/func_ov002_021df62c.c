#include "ov002_core.h"

struct SlotU16 {
    u16 id : 13;
};

extern struct SlotU16 data_ov002_022d0250[];

void func_ov002_021df62c(int arg0, int arg1, int idx)
{
    struct SlotU16 *slot = (struct SlotU16 *)((char *)data_ov002_022d0250 + (idx << 2));
    int id = slot->id;
    func_ov002_021d479c((u16)((arg0 ? 0x8000 : 0) | 0x2e), (u16)arg1, (u16)id, (u16)idx);
}
