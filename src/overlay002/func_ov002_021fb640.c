struct S640 {
    unsigned short f0;
    unsigned short b0 : 1;
    unsigned short pad : 15;
    unsigned short f4;
    unsigned short f6;
    unsigned short f8;
    unsigned short fa;
    unsigned short fc;
    unsigned short fe;
    unsigned short f10;
    unsigned short f12;
    unsigned int id : 9;
    unsigned int rest : 23;
};

struct E640 {
    unsigned short card : 13;
    unsigned short rest : 3;
    unsigned short other;
};

extern struct E640 data_ov002_022d0250[];

extern int func_ov002_021ff3bc(struct S640 *self);
extern unsigned int func_ov002_021b947c(unsigned int id);
extern int func_0202e234(int x);
extern int func_ov002_021c33e4(int a, int b, int c);
extern int func_ov002_021f4a84(struct S640 *self, int arg1);
extern int func_ov002_021f4a4c(struct S640 *self, int arg1);

int func_ov002_021fb640(struct S640 *self, int arg1) {
    unsigned int v;
    unsigned char lo;
    unsigned short hi;
    unsigned short a;
    int r;

    if (func_ov002_021ff3bc(self) == 0) return -1;
    v = func_ov002_021b947c(self->id);
    a = v;
    lo = v;
    hi = v >> 16;
    if (((a >> 8) & 0xff) == 0xe) {
        if (func_0202e234(data_ov002_022d0250[self->id].card) != 0) {
            if (func_ov002_021c33e4(self->b0, lo, hi) != 0) {
                r = func_ov002_021f4a84(self, arg1);
                if (r == 1) func_ov002_021f4a4c(self, arg1);
                return r;
            }
        }
    }
    return -1;
}
