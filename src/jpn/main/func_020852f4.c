/* func_020852f4: shape-clone of func_020852b4 — iterate i = 0..(f_18-1)
 * and call func_02085378 (vs func_02085334) on each index.
 */

#include <nitro/types.h>

typedef struct {
    u8 _pad[0x18];
    u8 f_18;
} state_020853dc_t;

extern void func_02085378(state_020853dc_t *p, int i, int arg2);

void func_020852f4(state_020853dc_t *p, int arg1) {
    u32 i;
    for (i = 0; i < p->f_18; i++) {
        func_02085378(p, i, arg1);
    }
}
