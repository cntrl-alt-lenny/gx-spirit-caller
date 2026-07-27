typedef unsigned short u16;
extern char data_ov002_022cd3f4[];

struct Self02005ac {
    u16 f_0;
    u16 bit0 : 1;
    u16 : 5;
    u16 kind : 6;
    u16 : 4;
    char _pad[0x14 - 4];
    int f_14;
};

extern int func_ov002_021bbf50(int bit0);
extern int func_ov002_021ff2b8(void *self, int bit0);

int func_ov002_022005ac(struct Self02005ac *self) {
    if (self->kind != 0x12)
        return 0;
    if (self->f_14 == 0)
        return 0;
    if (*(int *)data_ov002_022cd3f4 == self->bit0)
        return 0;
    if (func_ov002_021bbf50(self->bit0) == 0)
        return 0;
    return func_ov002_021ff2b8(self, self->bit0) != 0;
}
