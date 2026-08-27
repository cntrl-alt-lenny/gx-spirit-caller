struct Self {
    char _pad0[2];
    struct {
        unsigned short bit0   : 1;
        unsigned short subrow : 5;
        unsigned short _rest  : 10;
    } f2;
};

extern int data_ov002_022cf09c[];
extern int func_ov002_021c22cc(int bit0, int subrow);
extern int func_ov002_021ca1d8(int bit0);
extern int func_ov002_021ff1c8(void *self, int bit0);
extern int func_ov002_021bc1a8(int bit0, int subrow);

/* func_ov002_02209e58: gate func_ov002_021c22cc(bit0,subrow) and
 * func_ov002_021ca1d8(bit0); require
 * func_ov002_021ff1c8(self,bit0)+func_ov002_021bc1a8(bit0,subrow) >= 2;
 * final result is data_ov002_022cf09c[bit0*0x868] >= 2. */
int func_ov002_02209e58(struct Self *self) {
    if (func_ov002_021c22cc(self->f2.bit0, self->f2.subrow) == 0)
        return 0;

    if (func_ov002_021ca1d8(self->f2.bit0) == 0)
        return 0;

    int a = func_ov002_021ff1c8(self, self->f2.bit0);
    int b = func_ov002_021bc1a8(self->f2.bit0, self->f2.subrow);
    if (a + b < 2)
        return 0;

    unsigned int count =
        *(unsigned int *)((char *)data_ov002_022cf09c + (self->f2.bit0 & 1) * 0x868);
    return count >= 2;
}
