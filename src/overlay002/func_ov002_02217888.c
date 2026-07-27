/* func_ov002_02217888: resolve an out-param packed (player,idx) via
 * func_ov002_0223df38(arg0,0,&local); if resolved, look up the sub-slot
 * at row+0x30+idx*0x14 and, if its id is nonzero, copy arg0->f_8 into
 * arg1->f_8. */
#include "ov002_core.h"
extern int func_ov002_0223df38(void *self, int flag, int *out);

struct Ov002SelfF8 {
    char _pad[8];
    unsigned short f_8;
};

int func_ov002_02217888(struct Ov002SelfF8 *arg0, struct Ov002SelfF8 *arg1) {
    int local;
    unsigned char byte0;
    int player, idx;
    char *row;
    struct Ov002Slot *slot;
    if (func_ov002_0223df38(arg0, 0, &local) == 0) {
        goto done;
    }
    byte0 = (unsigned char)local;
    player = byte0 & 1;
    idx = ((unsigned short)local >> 8) & 0xff;
    row = data_ov002_022cf16c + player * 0x868;
    slot = (struct Ov002Slot *)(row + 0x30 + idx * 0x14);
    if (slot->id != 0) {
        arg1->f_8 = arg0->f_8;
    }
done:
    return 0;
}
