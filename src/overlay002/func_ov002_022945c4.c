struct Self {
    unsigned short f0;
    struct {
        unsigned short bit0 : 1;
        unsigned short rest : 15;
    } f2;
};

extern int func_ov002_02280980(unsigned int bit0);
extern int func_ov002_02280df4(struct Self *self, unsigned int v, int k, int z);
extern int func_ov002_021c8470(unsigned int v, int r);

int func_ov002_022945c4(struct Self *self) {
    int r;
    if (func_ov002_02280980(self->f2.bit0) >= 0) return 0;
    r = func_ov002_02280df4(self, 1 - self->f2.bit0, -1, 0);
    if (r >= 0 && func_ov002_021c8470(1 - self->f2.bit0, r) >= 0x514) return 1;
    return 0;
}
