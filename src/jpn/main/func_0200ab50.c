/* func_0200ab50: shape-clone of func_0200aac8 — same flag-dispatch but
 * calls func_0200886c instead of func_0200852c on the bit-3 path.
 * See func_0200aac8.c for full asm/shape notes.
 */

#include <nitro/types.h>

typedef struct {
    u8  _pad[0x54];
    u16 flags;
} state_0200ab6c_t;

extern state_0200ab6c_t data_02104acc;
extern int func_0200886c(state_0200ab6c_t *p);
extern void func_0200aa44(int mask);

int func_0200ab50(void) {
    if (data_02104acc.flags & 0x8) {
        func_0200886c(&data_02104acc);
        return 1;
    }
    if (data_02104acc.flags & 0x2f07) {
        return 1;
    }
    func_0200aa44(0x2f07);
    return 0;
}
