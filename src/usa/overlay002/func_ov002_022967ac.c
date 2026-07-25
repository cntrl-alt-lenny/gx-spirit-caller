/* func_ov002_022967ac: per-player (self->b0) row at data_ov002_022cf08c,
 * compare the 13-bit id field at +0xf8 against the constant 0x175e. */
#include "ov002_core.h"

struct Ov002F8Row { char _pad[0xf8]; struct Ov002Slot id_field; };

int func_ov002_022967ac(struct Ov002Self *self) {
    int player = self->b0 & 1;
    struct Ov002F8Row *row = (struct Ov002F8Row *)(data_ov002_022cf08c + player * 0x868);
    return 0x175e == row->id_field.id;
}
