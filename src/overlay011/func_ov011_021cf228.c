/* func_ov011_021cf228: per-frame update of the 5 actor-table slots — on slot 4
 * push the mode flag via 021cf1f8, hide idle slots (021ac578) when no overlay
 * is active, and tick each via 021ac72c. */
#include "ov011_core.h"
extern void func_ov011_021cf1f8(int i, int on);
extern void func_ov000_021ac578(void *e);
extern void func_ov000_021ac72c(void *e);
void func_ov011_021cf228(void) {
    char *s = data_ov011_021d403c;
    unsigned int i;
    char *e = data_ov011_021d41a0;
    for (i = 0; i < 5; i++) {
        if (i == 4) {
            if (*(int *)(s + 0x264) == 0) func_ov011_021cf1f8(i, 0);
            else func_ov011_021cf1f8(i, 1);
        }
        if (((unsigned int)(*(int *)(s + 0x274) << 11) >> 24) == 0 &&
            ((unsigned int)(*(int *)(s + 0x268) << 28) >> 28) == 0)
            func_ov000_021ac578(e);
        func_ov000_021ac72c(e);
        e += 0x14;
    }
}
