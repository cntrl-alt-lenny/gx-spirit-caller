#include "ov002_core.h"

extern char data_ov002_022cdc78[];
extern struct Ov002Slot data_ov002_022cdc88[];
extern int func_ov002_0227e76c(int index);

int func_ov002_0227e784(int target) {
    unsigned index;
    for (index = 0; index < *(unsigned *)(data_ov002_022cdc78 + 0xc); index++) {
        if (func_ov002_0227e76c(index) == 0) {
            if (target == (int)data_ov002_022cdc88[index].id)
                return index;
        }
    }
    return -1;
}
