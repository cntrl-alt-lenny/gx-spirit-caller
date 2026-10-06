typedef struct {
    int            sock;
    int            f4;
    int            f8;
    int            fc;
    char           _10[0x10];
    int            f20;
    int            f24;
    char           _28[0x4];
    int            f2c;
    unsigned short f30;
    unsigned char  f32;
    unsigned char  f33;
    int            f34;
    int            f38;
    int            f3c;
} conn_020657c0_t;

extern int data_0219e3f0;
extern int func_0206588c(void);
extern conn_020657c0_t *func_02065ee0(void);
extern int func_02054e8c(int domain, int type, int proto);
extern void func_02065e78(conn_020657c0_t *c);
extern void func_02065acc(conn_020657c0_t *c);

int func_020657c0(int a, int b, int c, int d, int e, int f) {
    conn_020657c0_t *s;

    if (data_0219e3f0 != 1) {
        return 2;
    }
    if (func_0206588c() == 0) {
        return 3;
    }
    s = func_02065ee0();
    if (s == 0) {
        return 1;
    }
    s->f4 = a;
    s->fc = c;
    s->f8 = b;
    s->f34 = d;
    s->f38 = e;
    s->f3c = f;
    s->sock = func_02054e8c(2, 2, 0);
    s->f20 = 0;
    s->f32 = 0;
    s->f33 = 0;
    s->f2c = 0;
    s->f30 = 0;
    s->f24 = 0;
    if (s->sock == -1) {
        func_02065e78(s);
        return 2;
    }
    func_02065acc(s);
    return 0;
}
