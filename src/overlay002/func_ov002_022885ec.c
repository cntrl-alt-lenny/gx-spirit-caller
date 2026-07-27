typedef unsigned short u16;
typedef struct { u16 f0; u16 b0 : 1; } Self022885ec;

extern int func_ov002_02280980(int b0);
extern int func_ov002_02281760(Self022885ec *self, int notb0, int one);
extern int func_ov002_022817f4(int notb0);

int func_ov002_022885ec(Self022885ec *self) {
    if (func_ov002_02280980(self->b0) >= 0)
        return 0;
    int r1 = func_ov002_02281760(self, 1 - self->b0, 1);
    int r2 = func_ov002_022817f4(1 - self->b0);
    return (r1 + r2) != 0;
}
