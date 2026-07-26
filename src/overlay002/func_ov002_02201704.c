typedef unsigned short u16;

struct Self { u16 f0; u16 b0 : 1; u16 : 5; u16 kind : 6; };

extern int func_ov002_021bcd80(int a, int b);

int func_ov002_02201704(struct Self *self) {
    if (self->kind != 0x23) {
        if (func_ov002_021bcd80(self->b0, -1) == 0)
            return 0;
    }
    if (func_ov002_021bcd80(1 - self->b0, -1) == 0)
        return 0;
    return 1;
}
