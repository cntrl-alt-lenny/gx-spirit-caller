/* func_ov002_022530a8: for both players, post kind 14 for each slot whose
 * id maps nonzero, flag bit20 clear and bit19 set. */
#include "ov002_core.h"
extern int func_0202e234(int a);
struct Ov002Slot2 { unsigned int id : 13; unsigned int pad : 6; unsigned int a : 1; unsigned int b : 1; };
struct Ov002Row { char pad[0x14]; unsigned int count; struct Ov002Slot2 slots[1]; };
void func_ov002_022530a8(int player) {
    unsigned int j;
    int i;
    int p;
    struct Ov002Slot2 *s;
    struct Ov002Row *row;
    for (i = 0; i < 2; i++) {
        p = player ^ i;
        row = (struct Ov002Row *)((char *)data_ov002_022cf16c + (p & 1) * 0x868);
        j = 0;
        if (j < row->count) {
            s = (struct Ov002Slot2 *)((char *)row + 0x418);
            do {
                if (func_0202e234(s->id) != 0 && s->b == 0 && s->a != 0)
                    func_ov002_02253458(p, 14, j);
                j++;
                s++;
            } while (j < row->count);
        }
    }
}
