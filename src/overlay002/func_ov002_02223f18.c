#include "ov002_core.h"

extern char data_ov002_022ce288[];
extern char data_ov002_022d0e6c[];
extern void func_ov002_021e1870(int a, int b, int c);
extern void func_ov002_0226b054(int a);
extern void func_ov002_0226b194(int a, int b, int c);

int func_ov002_02223f18(struct Ov002Self *self) {
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        func_ov002_0226b194(1 - self->b0, self->f0, 0);
        return 0x7f;
    case 0x7f:
        if (*(u16 *)(data_ov002_022d0e6c + 0xb0) == 0) return 0x7e;
        func_ov002_021e1870(1 - self->b0, *(u16 *)(data_ov002_022d0e6c + 0xb2), 1);
        return 0x7d;
    case 0x7e:
        func_ov002_0226b054(self->b0);
        return 0x7d;
    case 0x7d:
        func_ov002_021e286c(1 - self->b0);
        return 0;
    }
    return 0;
}
