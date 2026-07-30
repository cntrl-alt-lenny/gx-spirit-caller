/* func_ov002_02209940: guard chain on arg1 (null, IsValue12D3Or147E, then
 * if arg1's field5 (bits1-5 of +2) >= 5 requires func_0202e234 AND
 * func_0202e270 on arg1->f0), plus field5==13 excluded, then tail-call
 * func_ov002_021ff354(self, arg1). */
#include "ov002_core.h"

extern int IsValue12D3Or147E(int a0);
extern int func_0202e234(int id);
extern int func_0202e270(int id);
extern int func_ov002_021ff354(int self, int arg);

int func_ov002_02209940(int self, struct Ov002Self *arg1) {
    unsigned int field5;

    if (arg1 == 0)
        return 0;
    if (IsValue12D3Or147E(*(unsigned short *)arg1) != 0)
        return 0;

    field5 = (unsigned)(*(unsigned short *)((char *)arg1 + 2) << 26) >> 27;
    if (field5 >= 5) {
        if (func_0202e234(*(unsigned short *)arg1) == 0)
            return 0;
        if (func_0202e270(*(unsigned short *)arg1) == 0)
            return 0;
    }

    field5 = (unsigned)(*(unsigned short *)((char *)arg1 + 2) << 26) >> 27;
    if (field5 == 13)
        return 0;

    return func_ov002_021ff354(self, (int)arg1);
}
