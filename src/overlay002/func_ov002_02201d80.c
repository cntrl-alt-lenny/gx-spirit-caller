struct Ov0201d80Self {
    char _pad0[2];
    unsigned short b0 : 1;
    unsigned short : 5;
    unsigned short field6 : 6;
    unsigned short : 4;
    char _pad4[0x14 - 4];
    unsigned f_14;
};

int func_ov002_02201d80(struct Ov0201d80Self *self) {
    switch (self->field6) {
    case 0xf:
        if (((self->f_14 << 10) >> 31) == self->b0)
            return 1;
        goto ret0;
    case 0x10:
        if (((self->f_14 << 15) >> 31) == self->b0)
            return 1;
        goto ret0;
    default:
    ret0:
        return 0;
    }
}
