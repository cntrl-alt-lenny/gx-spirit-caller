typedef unsigned short u16;
typedef struct { u16 f0; u16 b0 : 1; } Self0220776c;

extern char data_ov002_022cf180[];

int func_ov002_0220776c(Self0220776c *self) {
    int threshold = 1;
    if (self->f0 == 0x14f0)
        goto is_f0;
    if (self->f0 == 0x16dc)
        threshold = 0x1e;
    goto merge;
is_f0:
    threshold = 0xf;
merge:
    {
        unsigned value = *(unsigned *)(data_ov002_022cf180 + (self->b0 & 1) * 0x868);
        return value >= (unsigned)threshold;
    }
}
