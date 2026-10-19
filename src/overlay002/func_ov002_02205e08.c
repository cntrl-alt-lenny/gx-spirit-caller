struct Self {
    unsigned short id;
    unsigned short player : 1;
    unsigned short slot : 5;
    unsigned short rest : 8;
    unsigned short flip : 1;
    unsigned short last : 1;
};
extern int func_ov002_021ca2b8();
extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern int func_ov002_021bc8c8(int a, int b, int c);
extern int func_ov002_021ff2b8(int unused_a, int b);
extern int func_ov002_021bc288(int a, int b);
extern int func_ov002_0223f6c4(struct Self *self);
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
extern int data_ov002_022cf17c[];

int func_ov002_02205e08(struct Self *self) {
    int other = self->player ^ self->flip;
    if (func_ov002_021ca2b8(other) == 0) return 0;
    if (*(int *)((char *)data_ov002_022cf17c + (self->player & 1) * 0x868) == 0) {
        int value = func_ov002_0223f6c4(self);
        if (func_ov002_022536e8((void *)self->player, self->id, value) == 0) return 0;
    }
    if (func_ov002_021b3ecc(self->player, 11, 0xfa7) != 0) return 0;
    if (func_ov002_021bc8c8(other, self->player, self->slot) == 0) return 0;
    if (func_ov002_021ff2b8((int)self, other) != 0 ||
        (other == self->player && func_ov002_021bc288(self->player, self->slot) != 0)) return 1;
    return 0;
}


