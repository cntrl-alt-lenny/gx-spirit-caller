typedef struct {
    char _pad00[0x4];
    int f4;
    char _pad08[0x2c];
    int f34;
} ObjA16;
extern void func_02006110(int *out_a, int *out_b);
extern void func_0200612c(int *out_a, int *out_b);
extern int func_ov002_022a16b0(ObjA16 *s);

int func_ov002_022a1890(ObjA16 *s, int mode)
{
    int x, y;
    int count, top;
    if (mode) func_02006110(&x, &y);
    else func_0200612c(&x, &y);
    count = s->f34;
    top = func_ov002_022a16b0(s);
    if (s->f4 < 0) {
        return (x >= 0x10 && x < 0xf0) && (y >= top && y < top + (count << 3) - 6);
    }
    if (s->f4 == 0xb) return x >= 0x10 && x < 0xf0;
    return (x >= 0x10 && x < 0xf0) && (y >= top && y < top + (count << 3));
}
