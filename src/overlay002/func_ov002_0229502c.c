typedef unsigned short u16;
struct Self { u16 f0; u16 bit0 : 1; u16 rest : 15; };
struct Side { int value; char pad[0x864]; };
extern struct Side data_ov002_022cf16c[];
extern int func_ov002_022576d8(int arg0);
extern int func_ov002_0228c864(int arg0, unsigned int mask, int (*callback)(int, int));
extern int func_ov002_021c848c(int a, int b);
extern void func_ov002_0228db8c(void *p);
int func_ov002_0229502c(struct Self *self) {
    int mask = func_ov002_022576d8((int)self);
    int index = func_ov002_0228c864(self->bit0, mask, (void *)func_ov002_0228db8c);
    if (index >= 0) {
        int value = func_ov002_021c848c(self->bit0, index);
        if (data_ov002_022cf16c[(1 - self->bit0) & 1].value <= value / 2) return 1;
    }
    return 0;
}

