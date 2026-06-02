/* func_ov011_021d1884: reset all 10 coord-array slots (stride 0x28) via the
 * 021d1514 per-slot initialiser. */
#include "ov011_core.h"
extern void func_ov011_021d1514(void *slot);
void func_ov011_021d1884(void) {
    unsigned int i = 0;
    char *p = data_ov011_021d4660;
    for (; i < 10; i++) {
        func_ov011_021d1514(p);
        p += 0x28;
    }
}
