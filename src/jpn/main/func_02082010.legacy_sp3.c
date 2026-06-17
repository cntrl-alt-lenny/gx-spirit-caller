/* func_02082010: shape-clone of func_02081fd0 — same lazy-init pattern
 * on data_021a17d8.f_fc, but returns a different state object
 * (&data_021a1908 instead of &data_021a1938).
 */

#include <nitro/types.h>

typedef struct {
    u8 _pad[0xfc];
    u32 f_fc;
} state_021a18b8_t;

extern state_021a18b8_t data_021a17d8;
extern state_021a18b8_t data_021a1908;
extern void func_02082050(void);

state_021a18b8_t *func_02082010(void) {
    if (!(data_021a17d8.f_fc & 0x80)) {
        func_02082050();
        data_021a17d8.f_fc |= 0x80;
    }
    return &data_021a1908;
}
