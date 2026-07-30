#include "ov002_core.h"

extern int func_ov002_022536e8(int b0, int f0, int idx);
extern char data_ov002_022cf178[];

struct Self02205f80 { unsigned short f0; unsigned short b0 : 1; };

int func_ov002_02205f80(struct Self02205f80 *self) {
    int b0;
    unsigned int idx;
    unsigned int count;
    b0 = self->b0;
    if (((int (*)(int))func_ov002_021ca2b8)(b0) == 0) {
        return 0;
    }
    b0 = self->b0;
    count = *(int *)(data_ov002_022cf178 + (b0 & 1) * 0x868);
    idx = 0;
    if (count > idx) {
        do {
            if (func_ov002_022536e8(b0, self->f0, idx) != 0) {
                return 1;
            }
            idx++;
            b0 = self->b0;
        } while (idx < *(unsigned int *)((char *)data_ov002_022cf16c + (b0 & 1) * 0x868 + 0xc));
    }
    return 0;
}
