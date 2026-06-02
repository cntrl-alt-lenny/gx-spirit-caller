/* func_ov004_021c9d60: play the voice/se for index b (0..24) via 0202c0c0
 * (base id 1601); 0 if out of range. */
#include "ov004_core.h"
extern int func_0202c0c0(int id);
int func_ov004_021c9d60(int a, int b) {
    if (b < 0 || b >= 25) return 0;
    return func_0202c0c0(b + 1601);
}
