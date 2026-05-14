/* func_ov017_021b7b5c: byte-identical clone of func_ov016_021b5a28 (separate
 * TU in overlay 17). Disables BG0/BG1 of sub-engine DISPCNT, resets their
 * scroll regs, clears arg->f_8. See ov016 file for the shape comment.
 */

#include <nitro/types.h>

#define REG_DISPCNT_B (*(vu32 *)0x04001000)
#define REG_BG0HOFS_B (*(vu32 *)0x04001010)
#define REG_BG1HOFS_B (*(vu32 *)0x04001014)

typedef struct {
    u8 _pad0[8];
    int f_8;
} state_021b7b5c_t;

int func_ov017_021b7b5c(state_021b7b5c_t *p) {
    int enable, kept;
    p->f_8 = 0;
    enable = (REG_DISPCNT_B & 0x1f00) >> 8;
    kept = enable & ~0x3;
    REG_DISPCNT_B = (REG_DISPCNT_B & ~0x1f00) | (kept << 8);
    REG_BG0HOFS_B = 0;
    REG_BG1HOFS_B = 0;
    return 1;
}
