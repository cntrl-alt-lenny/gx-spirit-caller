typedef unsigned short u16;
typedef struct {
    char pad0[0x888];
    int duration;
    int progress;
    char pad890[0xc];
    int target;
    u16 palette[16];
    int phase;
    int period;
    char pad8c8[0x188];
    unsigned int unused : 8;
    unsigned int active : 1;
    unsigned int unused2 : 23;
} State;
extern char data_ov020_021ae060[];
extern State data_ov020_021ae0a8;
extern int func_020b3870(int, int);
extern void func_020944a4(int unused0, int unused1, int unused2);
extern void func_ov020_021add24(u16 *src, u16 *dst, unsigned int packed);
void func_ov020_021aaa80(int index) {
    State *p = &data_ov020_021ae0a8;
    int y = index * 40 + 24;
    if (*(int *)(data_ov020_021ae060 + 0x8d0) > 0) {
        int delta = (p->target - index) * 40;
        int progress;
        p->progress -= 0x1000;
        if (p->progress < 0) p->progress = 0;
        progress = p->progress;
        y += func_020b3870(delta * progress, p->duration);
        if (progress == 0) p->duration = 0;
    }
    *(volatile unsigned int *)0x04000018 = ((-y << 16) & 0x01ff0000) | 0x1fc;
    if (!p->active) {
        func_020944a4((int)p->palette, 0x05000180, 0x20);
    } else {
        p->phase -= 0x1000;
        if (p->phase < 0) p->phase = p->period;
        func_ov020_021add24(p->palette, (u16 *)0x05000180,
            ((unsigned int)(u16)func_020b3870(p->phase * 360, p->period) << 16) | 0x10);
    }
}


