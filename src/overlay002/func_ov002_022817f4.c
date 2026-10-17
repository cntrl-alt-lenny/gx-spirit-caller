#include "ov002_core.h"

extern int func_ov002_021b8fcc(int player, int idx);
extern int func_ov002_022815a4(int id, int flag);

int func_ov002_022817f4(int player) {
    int i;
    int result = 0;
    char *id_ptr = data_ov002_022cf16c + (player & 1) * 0x868 + 0x30;
    char *row = data_ov002_022cf16c + (player & 1) * 0x868;

    for (i = 0; i <= 10; i++, id_ptr += 0x14, row += 0x14) {
        if (((struct Ov002Slot *)id_ptr)->id != 0) {
            if (i < 5) {
                if (func_ov002_021b8fcc(player, i) == 0)
                    continue;
            }
            if (*(unsigned short *)(row + 0x38) != 0 || ((*(unsigned int *)(row + 0x40) >> 8) & 1) != 0) {
                if (func_ov002_022815a4(((struct Ov002Slot *)id_ptr)->id, 1) != 0)
                    result++;
            }
        }
    }
    return result;
}
