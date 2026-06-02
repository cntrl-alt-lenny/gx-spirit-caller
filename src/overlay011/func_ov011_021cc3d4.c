/* func_ov011_021cc3d4: reset the first 5 actor-table entries (stride 0x14) via
 * the 021ac770/021ac7c4 pair, then clear the 403c.268 bit-4 flag. */
#include "ov011_core.h"
extern void func_ov000_021ac770(void *e);
extern void func_ov000_021ac7c4(void *e, int v);
void func_ov011_021cc3d4(void) {
    char *b = data_ov011_021d403c;
    char *e = data_ov011_021d41a0;
    int i;
    for (i = 0; i < 5; i++) {
        func_ov000_021ac770(e);
        func_ov000_021ac7c4(e, 0);
        e += 0x14;
    }
    *(int *)(b + 0x268) &= ~0x10;
}
