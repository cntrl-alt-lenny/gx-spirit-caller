struct Ov0220980cSelf {
    char _pad0[2];
    unsigned short b0 : 1;
};

extern char data_ov002_022cf09c[];
extern char data_ov002_022cf098[];

int func_ov002_0220971c(struct Ov0220980cSelf *self) {
    unsigned bit0 = self->b0;

    if (*(int *)(data_ov002_022cf09c + (bit0 & 1) * 0x868) != 0)
        goto ret1;
    if (*(int *)(data_ov002_022cf098 + ((1 - bit0) & 1) * 0x868) == 0)
        return 0;
ret1:
    return 1;
}
