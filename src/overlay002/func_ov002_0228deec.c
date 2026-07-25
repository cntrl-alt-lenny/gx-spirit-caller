/* func_ov002_0228deec: look up ((row+0x120) as Ov002Slot[])[b].id, then
 * combine func_0202b9b0(id) and func_ov002_022815a4(id, 0) into
 * (3 - r1) + r2. */
#include "ov002_core.h"
extern int func_0202b9b0(int id);
extern int func_ov002_022815a4(int id, int b);

int func_ov002_0228deec(int a, int b) {
    char *row = data_ov002_022cf16c + (a & 1) * 0x868;
    struct Ov002Slot *table = (struct Ov002Slot *)(row + 0x120);
    int id = table[b].id;
    int r1 = func_0202b9b0(id);
    int r2 = func_ov002_022815a4(id, 0);
    return (3 - r1) + r2;
}
