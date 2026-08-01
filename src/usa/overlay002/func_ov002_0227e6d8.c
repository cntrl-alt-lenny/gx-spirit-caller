/* func_ov002_0227e6d8: scan data_ov002_022cdba8 slots (count at
 * data_ov002_022cdb98+0xc, same precheck/for-loop idiom as
 * func_ov002_0227e674), skipping any index for which func_ov002_0227e65c
 * returns nonzero. For the first surviving slot whose id fails the
 * func_ov002_02281884 self-query, return its index if either
 * func_ov002_02281494(id,0) is nonzero or func_0202b95c(id) < 3. Returns -1
 * if no index qualifies. */
#include "ov002_core.h"

extern char data_ov002_022cdb98[];
extern struct Ov002Slot data_ov002_022cdba8[];
extern int func_ov002_0227e65c(int index);
extern int func_ov002_02281884(void *self, int id);
extern int func_ov002_02281494(int id, int b);
extern int func_0202b95c(int id);

int func_ov002_0227e6d8(void *self) {
    unsigned index;
    for (index = 0; index < *(unsigned *)(data_ov002_022cdb98 + 0xc); index++) {
        int id;
        if (func_ov002_0227e65c(index) != 0)
            continue;
        id = data_ov002_022cdba8[index].id;
        if (func_ov002_02281884(self, id) != 0)
            continue;
        if (func_ov002_02281494(id, 0) != 0)
            return index;
        if (func_0202b95c(id) < 3)
            return index;
    }
    return -1;
}
