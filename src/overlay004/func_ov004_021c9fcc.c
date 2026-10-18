typedef struct { int f0, f4, f8, fc; } Req;
typedef struct { int f0, f4; } Out;
extern void func_ov004_021c9f94(void *rec);
extern int OS_SPrintf(signed char *buffer, const signed char *format, ...);
extern void func_0201ef90(int *a0, int *a1, int *a2, int a3, int s0, int s1, Req *r, int s3, int s4, Out *out);
extern int data_ov004_02200dbc[4];
extern signed char data_ov004_02209ad4[];
void func_ov004_021c9fcc(void *rec, int a, int b, int c, int d) {
    signed char *strings[4];
    int values[4];
    signed char buffers[4][32];
    int i;
    signed char *p;
    int mode;
    char *self = rec;
    func_ov004_021c9f94(rec);
    *(Req *)values = *(Req *)data_ov004_02200dbc;
    p = buffers[0];
    for (i = 0; i < 4; i++) {
        OS_SPrintf(p, data_ov004_02209ad4, a, values[i]);
        strings[i] = p;
        p += 32;
    }
    mode = b == 1 ? 1 : 2;
    func_0201ef90((int *)(self + 8), (int *)(self + 12), (int *)(self + 16), c,
                 d << 9, mode, (Req *)strings, d > 0 ? 1 : 0, 512, (Out *)(self + 144));
    ((int *)self)[0] = d;
    ((int *)self)[1] = c;
}


