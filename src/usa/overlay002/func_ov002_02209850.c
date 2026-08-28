/* func_ov002_02209850: guard chain on arg1 (null, IsValue12D3Or147E, then
 * if arg1's field5 (bits1-5 of +2) >= 5 requires func_0202e1e0 AND
 * func_0202e21c on arg1->f0), plus field5==13 excluded, then tail-call
 * func_ov002_021ff264(self, arg1). */
#include "ov002_core.h"

extern int IsValue12D3Or147E(int a0);
extern int func_0202e1e0(int id);
extern int func_0202e21c(int id);
extern int func_ov002_021ff264(int self, int arg);

int func_ov002_02209850(int self, struct Ov002Self *arg1) {
    unsigned int field5;

    if (arg1 == 0)
        return 0;
    if (IsValue12D3Or147E(*(unsigned short *)arg1) != 0)
        return 0;

    field5 = (unsigned)(*(unsigned short *)((char *)arg1 + 2) << 26) >> 27;
    if (field5 >= 5) {
        if (func_0202e1e0(*(unsigned short *)arg1) == 0)
            return 0;
        if (func_0202e21c(*(unsigned short *)arg1) == 0)
            return 0;
    }

    field5 = (unsigned)(*(unsigned short *)((char *)arg1 + 2) << 26) >> 27;
    if (field5 == 13)
        return 0;

    return func_ov002_021ff264(self, (int)arg1);
}
