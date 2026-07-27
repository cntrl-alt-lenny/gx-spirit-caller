#include "ov002_core.h"

struct CdBit13 {
    unsigned id : 13;
};

extern int func_ov002_021bbf50(int arg0);

int func_ov002_021bbf98(int arg0) {
    int result;

    result = func_ov002_021bbf50(arg0);
    if (!(D016C->f_d0 & 1))
        return result;
    if (arg0 == *(int *)(data_ov002_022cd3f4 + 0) &&
        ((struct CdBit13 *)(data_ov002_022cd3f4 + 0xc4))->id != 0)
        result += 1;
    if (arg0 != *(int *)(data_ov002_022cd3f4 + 4))
        return result;
    if (((struct CdBit13 *)(data_ov002_022cd3f4 + 0xd8))->id != 0)
        result += 1;
    return result;
}
