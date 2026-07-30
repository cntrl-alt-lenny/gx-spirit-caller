/* func_ov002_0227e7e8: scan data_ov002_022cdc88 slots (count at
 * data_ov002_022cdc78+0xc, same precheck/for-loop idiom as
 * func_ov002_0227e784), skipping any index for which func_ov002_0227e76c
 * returns nonzero. For the first surviving slot whose id fails the
 * func_ov002_02281994 self-query, return its index if either
 * func_ov002_022815a4(id,0) is nonzero or func_0202b9b0(id) < 3. Returns -1
 * if no index qualifies. */
#include "ov002_core.h"

extern char data_ov002_022cdc78[];
extern struct Ov002Slot data_ov002_022cdc88[];
extern int func_ov002_0227e76c(int index);
extern int func_ov002_02281994(void *self, int id);
extern int func_ov002_022815a4(int id, int b);
extern int func_0202b9b0(int id);

int func_ov002_0227e7e8(void *self) {
    unsigned index;
    for (index = 0; index < *(unsigned *)(data_ov002_022cdc78 + 0xc); index++) {
        int id;
        if (func_ov002_0227e76c(index) != 0)
            continue;
        id = data_ov002_022cdc88[index].id;
        if (func_ov002_02281994(self, id) != 0)
            continue;
        if (func_ov002_022815a4(id, 0) != 0)
            return index;
        if (func_0202b9b0(id) < 3)
            return index;
    }
    return -1;
}
