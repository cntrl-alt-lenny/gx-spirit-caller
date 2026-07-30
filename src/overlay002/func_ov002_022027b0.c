#include "ov002_core.h"

extern int func_ov002_021c8940(int a, int b);

struct SelfF2Bits { u16 bit0:1; u16 field5:5; u16 rest:10; };

int func_ov002_022027b0(void *self) {
    struct SelfF2Bits *bits = (struct SelfF2Bits *)((char *)self + 2);
    if (*(int *)(data_ov002_022cd3f4 + 0x0) == bits->bit0 &&
        *(int *)(data_ov002_022cd3f4 + 0x1c) == bits->field5) {
        return func_ov002_021c8940(*(int *)(data_ov002_022cd3f4 + 0x4), *(int *)(data_ov002_022cd3f4 + 0x20)) == 0xf;
    }
    if (*(int *)(data_ov002_022cd3f4 + 0x4) == bits->bit0 &&
        *(int *)(data_ov002_022cd3f4 + 0x20) == bits->field5) {
        return func_ov002_021c8940(*(int *)(data_ov002_022cd3f4 + 0x0), *(int *)(data_ov002_022cd3f4 + 0x1c)) == 0xf;
    }
    return 0;
}
