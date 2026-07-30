typedef unsigned short u16;
extern char data_ov002_022cd314[];

struct Self02005ac {
    u16 f_0;
    u16 bit0 : 1;
    u16 : 5;
    u16 kind : 6;
    u16 : 4;
    char _pad[0x14 - 4];
    int f_14;
};

extern int func_ov002_021bbe70(int bit0);
extern int func_ov002_021ff1c8(void *self, int bit0);

int func_ov002_022004bc(struct Self02005ac *self) {
    if (self->kind != 0x12)
        return 0;
    if (self->f_14 == 0)
        return 0;
    if (*(int *)data_ov002_022cd314 == self->bit0)
        return 0;
    if (func_ov002_021bbe70(self->bit0) == 0)
        return 0;
    return func_ov002_021ff1c8(self, self->bit0) != 0;
}
