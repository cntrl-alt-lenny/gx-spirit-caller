/* func_020820f8: shape-clone of func_020820b8 — same lazy-init pattern
 * on data_021a18b8.f_fc, but returns a different state object
 * (&data_021a19e8 instead of &data_021a1a18).
 */

#include <nitro/types.h>

typedef struct {
    u8 _pad[0xfc];
    u32 f_fc;
} state_021a18b8_t;

extern state_021a18b8_t data_021a18b8;
extern state_021a18b8_t data_021a19e8;
extern void func_02082138(void);

state_021a18b8_t *func_020820f8(void) {
    if (!(data_021a18b8.f_fc & 0x80)) {
        func_02082138();
        data_021a18b8.f_fc |= 0x80;
    }
    return &data_021a19e8;
}
