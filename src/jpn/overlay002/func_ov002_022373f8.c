#include "ov002_core.h"

extern void func_ov002_021e2a4c(void);
extern void func_ov002_021e2b6c(void);
extern int func_ov002_021df728(void *self, int a, int b);
extern int func_ov002_02257668(void *self, void *fn);
extern void func_ov002_021de318(void *self, int val);
extern int func_ov002_021e952c(void *self, int player, int idx);

int func_ov002_022373f8(struct Ov002Self *self)
{
    func_ov002_021e2a4c();
    func_ov002_021df728(self, 1 - self->b0, 0x12c);
    func_ov002_021de318(self, func_ov002_02257668(self, (void *)func_ov002_021e952c));
    func_ov002_021e2b6c();
    return 0;
}
