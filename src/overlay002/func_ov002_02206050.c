#include "ov002_core.h"

struct Ov002_02206050Self {
    u16 b0 : 1;
    u16 _pad0 : 15;
};

extern int func_ov002_021bb90c(int bit0, int c);
extern char data_ov002_022cf178[];

int func_ov002_02206050(void *arg0)
{
    struct Ov002_02206050Self *s = (struct Ov002_02206050Self *)((char *)arg0 + 2);

    if (func_ov002_021bb90c(s->b0, 0x15ca) == 0)
        return 0;
    if (func_ov002_021bb90c(s->b0, 0x15cb) == 0)
        return 0;
    if (func_ov002_021bb90c(s->b0, 0x15cc) == 0)
        return 0;
    if (*(int *)(data_ov002_022cf178 + ((1 - s->b0) & 1) * 0x868) != 0)
        return 2;
    return 1;
}
