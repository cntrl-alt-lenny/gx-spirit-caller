#include "ov002_core.h"

struct Rec3a6c { unsigned int id : 13; };

extern int func_0202b878(int id);

int func_ov002_021c3a6c(int arg0, int arg1) {
    int off = (arg0 & 1) * 0x868;
    unsigned int i;
    int n;

    i = n = 0;
    if (i < *(unsigned int *)(data_ov002_022cf178 + off)) {
        struct Rec3a6c *p;
        char *row = data_ov002_022cf16c + off;
        p = (struct Rec3a6c *)(row + 0x120);
        do {
            if (arg1 == func_0202b878(p->id))
                n++;
            i++;
            p++;
        } while (i < *(unsigned int *)(row + 0xc));
    }
    return n;
}
