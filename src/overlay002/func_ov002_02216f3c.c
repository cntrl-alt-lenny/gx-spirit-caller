#include "ov002_core.h"

struct Self02216f3c {
    char _pad[0x14];
    unsigned nine : 9;
    unsigned bit9 : 1;
    unsigned idx4 : 4;
    unsigned rest : 18;
};

extern int func_ov002_021d8904(int bit9, int idx, int nine, int id);
extern void func_ov002_021de598(void *self, int bit9, int idx);

int func_ov002_02216f3c(struct Self02216f3c *self) {
    char *base = (char *)data_ov002_022cf16c + (self->bit9 & 1) * 0x868;
    int idx = self->idx4;
    int id = ((struct Ov002Slot *)(base + idx * 20 + 0x30))->id;
    if (id == 0)
        goto done;
    func_ov002_021d8904(self->bit9, self->idx4, self->nine, id);
    func_ov002_021de598(self, self->bit9, self->idx4);
done:
    return 0;
}
