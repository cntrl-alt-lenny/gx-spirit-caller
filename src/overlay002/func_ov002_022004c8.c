struct Self0 {
    unsigned short f0;
    unsigned short b0 : 1;
    unsigned short : 5;
    unsigned short f2hi6 : 6;
    unsigned short : 4;
    char _pad4[16];
    unsigned int : 9;
    unsigned int bit9 : 1;
    unsigned int : 4;
    unsigned int bit14 : 1;
    unsigned int bit15 : 1;
    unsigned int : 16;
};

int func_ov002_022004c8(struct Self0 *self) {
    int b0;
    if (self->f2hi6 != 11) goto ret0;
    b0 = self->b0;
    if (self->bit9 != (1 - b0)) return 0;
    if (self->bit15 == 0) return 0;
    return self->bit14 != 0;
ret0:
    return 0;
}
