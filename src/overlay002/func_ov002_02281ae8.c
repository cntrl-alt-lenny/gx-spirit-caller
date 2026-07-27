/* func_ov002_02281ae8: dispatch (self, &func_ov002_02281a28, 1, 1) to
 * func_ov002_0228d544; if its result is negative return 0, else look up
 * the player row's slot at result*4+0x120 and return whether
 * func_ov002_0227c678(self, 1, id16) returns 0. */
#include "ov002_core.h"
extern int func_ov002_0228d544(int self, void *fn, int a, int b);
extern int func_ov002_0227c678(int self, int a, int id);
extern void func_ov002_02281a28(void);

int func_ov002_02281ae8(int self) {
    int result;
    struct Ov002Slot *entry;
    char *row;
    unsigned short id16;
    result = func_ov002_0228d544(self, (void *)func_ov002_02281a28, 1, 1);
    if (result < 0) {
        return 0;
    }
    row = data_ov002_022cf16c + (self & 1) * 0x868;
    entry = (struct Ov002Slot *)(row + result * 4 + 0x120);
    id16 = (unsigned short)entry->id;
    return func_ov002_0227c678(self, 1, id16) == 0 ? 1 : 0;
}
