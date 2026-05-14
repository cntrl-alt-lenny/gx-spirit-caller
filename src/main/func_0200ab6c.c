/* func_0200ab6c: shape-clone of func_0200aae4 — same flag-dispatch but
 * calls func_02008888 instead of func_02008548 on the bit-3 path.
 * See func_0200aae4.c for full asm/shape notes.
 */

#include <nitro/types.h>

typedef struct {
    u8  _pad[0x54];
    u16 flags;
} state_0200ab6c_t;

extern state_0200ab6c_t data_02104bac;
extern int func_02008888(state_0200ab6c_t *p);
extern void func_0200aa60(int mask);

int func_0200ab6c(void) {
    if (data_02104bac.flags & 0x8) {
        func_02008888(&data_02104bac);
        return 1;
    }
    if (data_02104bac.flags & 0x2f07) {
        return 1;
    }
    func_0200aa60(0x2f07);
    return 0;
}
