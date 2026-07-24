struct F021ff6d0_F2 {
    unsigned short b0     : 1;
    unsigned short multi5 : 5;
    unsigned short        : 10;
};
struct F021ff6d0_Self {
    unsigned short f0;
    struct F021ff6d0_F2 f2;
};

extern int func_ov002_021bcd80(unsigned int bit0, int mask);

int func_ov002_021ff6d0(struct F021ff6d0_Self *self) {
    unsigned int b0 = self->f2.b0;
    return func_ov002_021bcd80(
               b0,
               (unsigned short)((unsigned char)b0 |
                                ((unsigned char)self->f2.multi5 << 8))) > 0;
}
