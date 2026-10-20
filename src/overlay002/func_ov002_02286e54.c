struct Self { unsigned short f0; unsigned short b0 : 1; unsigned short rest : 15; };
struct Player { int value; char pad[0x864]; };
extern struct Player data_ov002_022cf16c[];
extern int func_ov002_022576d8(int arg0);
extern int func_ov002_0228c864(int arg0, unsigned int mask, int (*callback)(int, int));
extern int func_ov002_021c848c(int a, int b);
extern void func_ov002_0228db8c(void *p);

int func_ov002_02286e54(struct Self *self) {
    int mask = func_ov002_022576d8((int)self);
    int result = func_ov002_0228c864(self->b0, mask, (void *)func_ov002_0228db8c);
    if (result >= 0) {
        int value = func_ov002_021c848c(self->b0, result);
        if (data_ov002_022cf16c[(1 - self->b0) & 1].value <= value)
            return 1;
    }
    return 0;
}

