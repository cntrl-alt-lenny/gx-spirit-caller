#include "ov002_core.h"

extern int func_ov002_0227d8c4(int arg0, int arg1, int zero);
extern int func_ov002_0227d6f8(int arg0, int id, int arg2, int j, u16 *out);
extern char data_ov002_022d0250[];

struct SmallSlot3 { u16 id:13; u16 rest:3; };

int func_ov002_0227da08(int arg0, int arg1, int arg2) {
    u16 buf[4];
    struct SmallSlot3 *slotptr = (struct SmallSlot3 *)((char *)data_ov002_022d0250 + arg1 * 4);
    int id = slotptr->id;
    int count = func_ov002_0227d8c4(arg0, arg1, 0);
    int j;
    for (j = 0; j < count; j++) {
        int r = func_ov002_0227d6f8(arg0, id, arg2, j, buf);
        if (r == -1) return 0;
        buf[j] = (u16)r;
    }
    return 1;
}
