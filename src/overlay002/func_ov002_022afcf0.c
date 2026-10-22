struct F022afb8c_Self {
    int f0, f4, f8, fc, f10, f14, f18, f1c, f20;
    unsigned char f24; char pad25[3];
    int f28, f2c, f30, f34;
    unsigned char f38; char pad39[3];
    int f3c, f40, f44, f48;
};
extern void func_02006110(int *out_a, int *out_b);
extern void func_0200612c(int *out_a, int *out_b);
extern unsigned int func_02006164(void);
extern unsigned int func_02006194(void);
extern int func_020b3870(int a, int b);
extern void func_ov002_022afb8c(struct F022afb8c_Self *self, int n);
extern int func_ov002_022afc0c(struct F022afb8c_Self *self, int x, int y);
static inline int position(struct F022afb8c_Self *s) {
    if (s->f14 == 3) return s->f18;
    return func_020b3870((s->f34 - s->f30) * (s->f3c - s->f40) + (s->f44 - s->f40) / 2, s->f44 - s->f40);
}
int func_ov002_022afcf0(struct F022afb8c_Self *s) {
    int x, y;
    if (s->f24 == 0) return 0;
    func_0200612c(&x, &y);
    if (func_ov002_022afc0c(s, x, y) == 0) return 0;
    func_02006110(&x, &y);
    s->fc = func_ov002_022afc0c(s, x, y);
    if (s->fc == 3) s->f18 = position(s);
    x -= s->f4;
    y -= s->f8;
    if (s->f38) { int t = x; x = y; y = t; }
    s->f10 = 0;
    if (func_02006194()) {
        if (s->f14 == 3) {
            s->fc = 3;
            y -= s->f2c + s->f1c;
            func_ov002_022afb8c(s, y);
        } else {
            if (s->fc != 0 && func_02006164()) {
                s->f14 = s->fc;
                s->f20 = 0;
                if (s->fc == 3) s->f1c = y - (s->f2c + position(s));
            }
            if (s->f14 == s->fc) {
                if ((s->f20 & 15) == 0) {
                    switch (s->fc) {
                    case 1:
                        if (s->f24) s->f3c += s->f3c < s->f44;
                        break;
                    case -1:
                        if (s->f24) s->f3c -= s->f3c > s->f40;
                        break;
                    case 2:
                        if (s->f24) {
                            int n = s->f3c + s->f48;
                            s->f3c = n < s->f44 ? n : s->f44;
                        }
                        break;
                    case -2:
                        if (s->f24) {
                            int n = s->f3c - s->f48;
                            s->f3c = n > s->f40 ? n : s->f40;
                        }
                        break;
                    }
                }
                s->f10 = s->fc;
                if (s->f20 < 16) s->f20++;
                else s->f20 = 14;
            }
        }
    } else {
        s->f14 = 0;
        s->f18 = 0;
        s->f1c = -1;
    }
    return 1;
}
