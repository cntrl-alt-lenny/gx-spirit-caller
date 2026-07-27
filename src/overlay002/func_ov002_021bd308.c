#include "ov002_core.h"

int func_ov002_021bd308(int player) {
    char *row;
    int i;
    char *id_ptr;
    char *slot_ptr;
    int result;

    result = 0;
    row = data_ov002_022cf16c + (player & 1) * 0x868;
    i = 5;
    id_ptr = row + 0x94;
    slot_ptr = row + 0x64;
    for (; i < 10; i++) {
        if (((struct Ov002Slot *)id_ptr)->id != 0 && *(u16 *)(slot_ptr + 0x38) == 0)
            result++;
        id_ptr += 0x14;
        slot_ptr += 0x14;
    }
    return result;
}
