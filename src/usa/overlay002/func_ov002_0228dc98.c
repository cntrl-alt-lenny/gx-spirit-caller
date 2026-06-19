/* func_ov002_0228dc98: read slot arg1's id (Ov002Slot.id at +48) for player
 * (arg0&1) and dispatch via func_ov002_02267d0c. Tail-call. */
#include "ov002_core.h"
extern int func_ov002_02267d0c(int id);
int func_ov002_0228dc98(int arg0, int arg1) {
    char *base = data_ov002_022cf08c + (arg0 & 1) * 0x868;
    struct Ov002Slot *s = (struct Ov002Slot *)(base + arg1 * 20 + 48);
    return func_ov002_02267d0c(s->id);
}
