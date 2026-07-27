struct SlotU16 {
    unsigned short id : 13;
};

struct Ov02889ecSelf {
    char _pad0[2];
    unsigned short f_2;
    char _pad4[0x14 - 4];
    unsigned f_14;
};

extern char data_ov002_022d0170[];
extern int func_0202b89c(int id);

int func_ov002_022888dc(struct Ov02889ecSelf *self) {
    unsigned field6;
    unsigned idx;
    int result;

    field6 = (unsigned)(self->f_2 << 20) >> 26;
    if (field6 != 0x16)
        goto ret0;
    idx = (unsigned)(self->f_14 << 23) >> 21;
    result = func_0202b89c(((struct SlotU16 *)(data_ov002_022d0170 + idx))->id);
    return (result >= 0x5dc) ? 1 : 0;
ret0:
    return 0;
}
