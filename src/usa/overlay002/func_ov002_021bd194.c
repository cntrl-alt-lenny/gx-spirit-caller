/* func_ov002_021bd194: for i=0..9 over player's cf16c row, if slot.id!=0
 * and the +0x38 flag u16!=0: for i<5 additionally require
 * func_ov002_021b8eec(player,i); then count func_0202b824(id)==0x17.
 * Tracks id_ptr and row as two separate incrementing pointers (matching
 * the original's r6/r7 split), player held separately. */
#include "ov002_core.h"

extern int func_ov002_021b8eec(int player, int idx);
extern unsigned int func_0202b824(int id);

int func_ov002_021bd194(int player) {
    int i;
    int result = 0;
    char *id_ptr = data_ov002_022cf08c + (player & 1) * 0x868 + 0x30;
    char *row = data_ov002_022cf08c + (player & 1) * 0x868;

    for (i = 0; i < 10; i++, id_ptr += 0x14, row += 0x14) {
        if (((struct Ov002Slot *)id_ptr)->id != 0 && *(unsigned short *)(row + 0x38) != 0) {
            if (i < 5) {
                if (func_ov002_021b8eec(player, i) == 0)
                    continue;
            }
            {
                int id = ((struct Ov002Slot *)id_ptr)->id;
                if (func_0202b824(id) == 0x17)
                    result++;
            }
        }
    }
    return result;
}
