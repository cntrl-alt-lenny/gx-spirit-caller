#include "ov002_core.h"

struct Rec3ae4 { unsigned int id : 13; unsigned int rest : 19; };

extern int func_0202df78(int id, int arg);

int func_ov002_021c3ae4(int arg0, int arg1) {
    int off = (arg0 & 1) * 0x868;
    unsigned int i;
    int count;
    struct Rec3ae4 *p;
    char *row;

    count = 0;
    i = count;
    if (i < *(unsigned int *)(data_ov002_022cf178 + off)) {
        row = data_ov002_022cf16c + off;
        p = (struct Rec3ae4 *)(row + 0x120);
        do {
            if (func_0202df78(p->id, arg1) != 0)
                count++;
            i++;
            p++;
        } while (i < *(unsigned int *)(row + 0xc));
    }
    return count;
}
