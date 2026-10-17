struct F021f526c_F2 {
    unsigned short a : 1;
    unsigned short b : 5;
    unsigned short pad : 8;
    unsigned short c : 1;
    unsigned short d : 1;
};
struct F021f526c_Self {
    unsigned short pad0;
    struct F021f526c_F2 f2;
    unsigned short pad4;
    unsigned short pad6;
    unsigned short f8;
};

extern int func_ov002_021b3618(int a, int b);
extern int func_ov002_021deb84(int a, int b);
extern unsigned short func_ov002_021b9ecc(int a, int b);

int func_ov002_021f526c(struct F021f526c_Self *self) {
    int r = func_ov002_021b3618(self->f2.a, self->f2.b);
    int a = self->f2.a;
    unsigned int mask = 0;
    int hi, lo;
    mask |= 1 << (a * 16 + self->f2.b);
    lo = r & 0xff;
    hi = ((unsigned short)r >> 8) & 0xff;
    mask |= 1 << (hi + lo * 16);
    func_ov002_021deb84(a ^ self->f2.c, mask);
    self->f8 = func_ov002_021b9ecc(lo, hi);
    return 1;
}
