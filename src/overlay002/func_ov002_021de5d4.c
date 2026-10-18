struct QB {
    unsigned short h0;
    unsigned short bit : 1;
};

struct Q {
    struct QB b;
    int w4;
    int w8;
    int wc;
    int w10;
    int w14;
};

extern int func_ov002_021de134(struct Q *q, int mask, int cmd, int arg);

static inline void Q_init(struct Q *p, int a) {
    int *ip = (int *)p;
    ip[0] = 0;
    ip[1] = 0;
    ip[2] = 0;
    ip[3] = 0;
    ip[4] = 0;
    ip[5] = 0;
    p->b.bit = (unsigned short)a;
}

int func_ov002_021de5d4(int a, int b, int c) {
    struct Q q;
    int mask = 1 << (b + a * 16);
    Q_init(&q, a);
    return (mask & func_ov002_021de134(&q, mask, 0xf, c)) != 0;
}
