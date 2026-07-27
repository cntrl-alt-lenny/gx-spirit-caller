struct Ov0293a5cSelf {
    char _pad0[2];
    unsigned short b0 : 1;
};

extern int func_ov002_02259e8c(int bit);
extern int func_ov002_021be2a4(int bit, int i, int one);

int func_ov002_0229394c(struct Ov0293a5cSelf *self) {
    int i;
    int accum;
    int result;

    accum = 0;
    result = func_ov002_02259e8c(self->b0);
    if (result == 0)
        return accum;
    for (i = 0; i <= 4; i++) {
        accum += func_ov002_021be2a4(self->b0, i, 1);
    }
    return (accum >= 2) ? 1 : 0;
}
