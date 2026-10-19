typedef struct {
    char _pad0[4];
    void *f4;
    void *f8;
    void *fc;
    int f10;
    int f14;
    char _pad14[0x54 - 0x18];
    unsigned short f54;
    unsigned short f56;
    unsigned int f58;
} SelfT;
extern void func_ov014_021b4294(SelfT *self);
extern void func_ov014_021b43b8(SelfT *self);
#define DISPCNT (*(volatile unsigned int *)0x04000000)
int func_ov014_021b41b8(SelfT *self) {
    if (self->f58 != 0) {
        unsigned int planes = (DISPCNT & 0x1f00) >> 8;
        DISPCNT = (DISPCNT & ~0x1f00) | ((planes & ~0x10) << 8);
        if (self->f58 & 1) {
            func_ov014_021b4294(self);
        }
        if (self->f58 & 2) {
            func_ov014_021b43b8(self);
        }
        return 1;
    } else {
        unsigned int planes = (DISPCNT & 0x1f00) >> 8;
        DISPCNT = (DISPCNT & ~0x1f00) | ((planes | 0x10) << 8);
        return 1;
    }
}
