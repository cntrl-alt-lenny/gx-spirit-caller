/* func_ov011_021d17c0: reset all 10 coord-array slots (stride 0x28) via the
 * 021d1514 per-slot initialiser. */
#include "ov011_core.h"
extern void func_ov011_021d1450(void *slot);
void func_ov011_021d17c0(void) {
    unsigned int i = 0;
    char *p = data_ov011_021d4580;
    for (; i < 10; i++) {
        func_ov011_021d1450(p);
        p += 0x28;
    }
}
