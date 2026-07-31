#include "ov002_core.h"

struct S02257704 {
    char _pad0[8];
    int f8;
};

extern struct S02257704 *func_ov002_0225737c(void *self);
extern int func_ov002_02257668(void *self, int val);

int func_ov002_0225761c(void *self)
{
    struct S02257704 *r = func_ov002_0225737c(self);
    int result;

    if (r == 0 || r->f8 == 0)
        return -1;
    CE288->f_5c0 = 1;
    result = func_ov002_02257668(self, r->f8);
    CE288->f_5c0 = 0;
    return result;
}
