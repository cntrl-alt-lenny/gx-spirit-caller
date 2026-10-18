#include "ov002_core.h"

struct Rec3c50 { unsigned int id : 13; };

extern int func_0202b8a8(int id);

int func_ov002_021c3c50(int arg0, int arg1) {
    int off = (arg0 & 1) * 0x868;
    unsigned int i;
    int n;

    n = i = 0;
    if (i < *(unsigned int *)(data_ov002_022cf178 + off)) {
        struct Rec3c50 *p;
        char *row = data_ov002_022cf16c + off;
        p = (struct Rec3c50 *)(row + 0x120);
        do {
            if (func_0202b8a8(p->id) >= arg1)
                n++;
            i++;
            p++;
        } while (i < *(unsigned int *)(row + 0xc));
    }
    return n;
}
