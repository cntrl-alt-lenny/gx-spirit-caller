/* func_ov002_0228dda8: read slot arg1's id (Ov002Slot.id at +48) for player
 * (arg0&1) and dispatch via func_ov002_02267df4. Tail-call. */
#include "ov002_core.h"
extern int func_ov002_02267df4(int id);
int func_ov002_0228dda8(int arg0, int arg1) {
    char *base = data_ov002_022cf16c + (arg0 & 1) * 0x868;
    struct Ov002Slot *s = (struct Ov002Slot *)(base + arg1 * 20 + 48);
    return func_ov002_02267df4(s->id);
}
