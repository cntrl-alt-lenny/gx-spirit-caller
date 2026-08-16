/* func_ov006_021cae24: sub-engine BG2 setup. Clears then re-applies bits of
 * BG2CNT_SUB (0x0400100c, two RMW passes -- each needs its own volatile
 * re-read), then packs -self->f_10 and -self->f_14 (each masked to 9 bits,
 * the DS scroll-offset range) into the combined BG2HOFS/VOFS_SUB register
 * at 0x04001018. Finally hands the two VRAM-bank pointers to a region-clear
 * utility.
 */
#include <nitro/types.h>

#define REG_BG2CNT_SUB   (*(vu16 *)0x0400100c)
#define REG_BG2OFS_SUB   (*(vu32 *)0x04001018)

extern int func_0208e0a0(void);
extern int func_0208de4c(void);
extern void func_02094504(int val, void *dst, int n);

int func_ov006_021cae24(void *self_) {
    int *self = (int *)self_;
    int negX, negY;

    REG_BG2CNT_SUB &= ~0x3;
    REG_BG2CNT_SUB = (REG_BG2CNT_SUB & 0x43) | 0x490;

    negX = -self[4];
    negY = -self[5];
    REG_BG2OFS_SUB = (negX & 0x1ff) | (0x1ff0000 & (negY << 16));

    func_02094504(0, (void *)func_0208e0a0(), 0x800);
    func_02094504(0, (void *)func_0208de4c(), 0x2040);
    return 1;
}
