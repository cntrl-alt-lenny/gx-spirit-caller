typedef unsigned short u16;
struct Self { u16 f0; u16 b0 : 1; u16 rest : 15; };

extern int func_ov002_022576d8(struct Self *self);
extern int func_ov002_0228c864(int b0, int p, void *fn);
extern int func_ov002_021bd5f4(int b0, int i);

int func_ov002_02294504(struct Self *self) {
    int p = func_ov002_0228c864(self->b0, func_ov002_022576d8(self), (void *)func_ov002_021bd5f4);
    if (p >= 0) {
        if (func_ov002_021bd5f4(self->b0, p) != 0) return 1;
    }
    return 0;
}
