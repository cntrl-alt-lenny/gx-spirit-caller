struct Ov0280c4Self {
    unsigned short f_0;
    unsigned short b0 : 1;
};

extern int data_ov002_022cd664[];
extern char data_ov002_022cf09c[];
extern void func_ov002_021af8f0(int a, int b, int c, int d);

int func_ov002_02227fd4(struct Ov0280c4Self *self) {
    unsigned bit0 = self->b0;

    if (*(int *)(data_ov002_022cf09c + ((1 - bit0) & 1) * 0x868) == 0)
        goto ret0;
    if (data_ov002_022cd664[bit0] != 0)
        goto ret0;
    func_ov002_021af8f0(bit0, 5, self->f_0, 0);
ret0:
    return 0;
}
