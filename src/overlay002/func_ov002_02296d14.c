typedef unsigned short u16;
typedef struct {
    u16 f0;
    u16 b0 : 1;
    u16 kind : 5;
} Self02296d14;

extern int func_ov002_02257ab8(Self02296d14 *self, int notb0);
extern char data_ov002_022cf1a8[];

int func_ov002_02296d14(Self02296d14 *self) {
    int r0 = func_ov002_02257ab8(self, 1 - self->b0);
    unsigned threshold = *(unsigned *)(data_ov002_022cf1a8 + (self->b0 & 1) * 0x868 + self->kind * 0x14);
    return (unsigned)r0 >= threshold;
}
