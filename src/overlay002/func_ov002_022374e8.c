#include "ov002_core.h"

extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e2c5c(void);
extern int func_ov002_021df818(void *self, int a, int b);
extern int func_ov002_02257750(void *self, void *fn);
extern void func_ov002_021de408(void *self, int val);
extern int func_ov002_021e961c(void *self, int player, int idx);

int func_ov002_022374e8(struct Ov002Self *self)
{
    func_ov002_021e2b3c();
    func_ov002_021df818(self, 1 - self->b0, 0x12c);
    func_ov002_021de408(self, func_ov002_02257750(self, (void *)func_ov002_021e961c));
    func_ov002_021e2c5c();
    return 0;
}
