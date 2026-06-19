/* func_ov004_021c9c80: play the voice/se for index b (0..24) via 0202c0c0
 * (base id 1601); 0 if out of range. */
#include "ov004_core.h"
extern int func_0202c06c(int id);
int func_ov004_021c9c80(int a, int b) {
    if (b < 0 || b >= 25) return 0;
    return func_0202c06c(b + 1601);
}
