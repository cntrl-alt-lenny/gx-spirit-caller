#include "ov002_core.h"

extern char data_ov002_022cdb98[];
extern struct Ov002Slot data_ov002_022cdba8[];
extern int func_ov002_0227e65c(int index);

int func_ov002_0227e674(int target) {
    unsigned index;
    for (index = 0; index < *(unsigned *)(data_ov002_022cdb98 + 0xc); index++) {
        if (func_ov002_0227e65c(index) == 0) {
            if (target == (int)data_ov002_022cdba8[index].id)
                return index;
        }
    }
    return -1;
}
