typedef struct {
    int f_0;
    int f_4;
} out_t;

typedef struct {
    char _pad0[4];
    int  f_4;
} gstate_t;

typedef struct {
    unsigned short a : 1;
    unsigned short b : 5;
    unsigned short c : 8;
    unsigned short d : 1;
    unsigned short e : 1;
} bits_t;

typedef struct {
    unsigned char  f_0;
    unsigned char  _p1;
    unsigned char  f_2;
    unsigned char  f_3;
    unsigned short _p4;
    unsigned short f_6;
    unsigned short f_8;
    bits_t         f_a;
    int            f_c;
    int            f_10;
} obj_t;

extern gstate_t data_ov002_022cd73c;
extern char data_ov002_022d1410[];

extern void func_ov002_0229d2ec(obj_t *p);
extern void func_ov002_022a6e04(out_t *out, char *tbl, int a, int b, int c);

void func_ov002_0229d184(obj_t *p, int arg1, bits_t *arg2) {
    out_t cp;
    out_t out;

    p->f_0 = 1;
    p->f_c = arg1;
    p->f_a = *arg2;
    func_ov002_0229d2ec(p);
    p->f_3 = p->f_a.d << 3;
    p->f_2 = ((((p->f_a.a == (data_ov002_022cd73c.f_4 ^ 1)) * 2 - p->f_a.e) & 3) << 3);
    func_ov002_022a6e04(&out, data_ov002_022d1410, p->f_a.a, p->f_a.b, p->f_a.c);
    cp = out;
    p->f_6 = cp.f_0;
    p->f_8 = cp.f_4;
    p->f_10 = 0;
}
