typedef unsigned short u16;

struct Self {
    u16 f_0;
    u16 bit0 : 1;
    u16 : 5;
    u16 kind : 6;
    u16 : 4;
};

extern int func_ov002_021bc16c(int x, int a, int b);
extern int func_ov002_021bbf50(int x);

int func_ov002_0228887c(struct Self *self) {
    int r;
    if (self->kind != 3)
        return 0;
    r = func_ov002_021bc16c(self->bit0, 0, 1);
    if (r == 0)
        return 0;
    if (r != func_ov002_021bbf50(self->bit0))
        return 0;
    return func_ov002_021bc16c(1 - self->bit0, 1, 0) > 0;
}
