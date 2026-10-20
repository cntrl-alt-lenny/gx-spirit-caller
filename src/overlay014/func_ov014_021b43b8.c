typedef struct { unsigned short count; } state_0201ef3c_t;
typedef struct { int f0, f4, f8, fc; } Req;
typedef struct { int f0, f4; } Out;
typedef struct {
    char pad0[0x18];
    state_0201ef3c_t *f18;
    int f1c;
    void *f20;
    void *f24;
    int f28;
    char pad2c[0x28];
    unsigned short f54;
} SelfT;
extern signed char data_ov014_021b4eb4[], data_ov014_021b4ed4[];
extern signed char data_ov014_021b4ef4[], data_ov014_021b4f14[];
extern int data_ov014_022350e0[];
extern int OS_SPrintf(signed char *buffer, const signed char *format, ...);
extern void func_0201ef3c(state_0201ef3c_t *p, void **tasks1, void **tasks2);
extern void func_0201e7e0(void);
extern void func_0201ef90(int *a0, int *a1, int *a2, int a3, int s0, int s1, Req *r, int s3, int s4, Out *out);
extern int func_0201ede4(int arg0, int arg1);
void func_ov014_021b43b8(SelfT *self) {
    signed char bufs[4][0x40];
    void *table[4];
    int scratch;
    int result;
    int i;
    OS_SPrintf(bufs[0], data_ov014_021b4eb4, (unsigned int)(self->f54 << 16) >> 24);
    OS_SPrintf(bufs[1], data_ov014_021b4ed4, (unsigned int)(self->f54 << 16) >> 24);
    OS_SPrintf(bufs[2], data_ov014_021b4ef4, (unsigned int)(self->f54 << 16) >> 24);
    OS_SPrintf(bufs[3], data_ov014_021b4f14, (unsigned int)(self->f54 << 16) >> 24);
    for (i = 0; i < 4; i++) table[i] = bufs[i];
    if (self->f24 != 0) {
        func_0201ef3c(self->f18, &self->f20, &self->f24);
        self->f28 = 0;
        self->f24 = 0;
    }
    func_0201e7e0();
    func_0201ef90((int *)&self->f18, &self->f1c, (int *)&self->f20, 0x6000, 0x200, 1, (Req *)table, 1, -1, (Out *)&self->f24);
    result = func_0201ede4((int)&scratch, (int)table[3]);
    data_ov014_022350e0[1] = result;
}
