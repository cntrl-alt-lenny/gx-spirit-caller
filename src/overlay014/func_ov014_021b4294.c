typedef struct {
    char _pad0[4];
    void *f4;
    void *f8;
    void *fc;
    int f10;
    int f14;
    char _pad14[0x54 - 0x18];
    unsigned short f54;
} SelfT;

extern char data_ov014_021b4e34[];
extern char data_ov014_021b4e54[];
extern char data_ov014_021b4e74[];
extern char data_ov014_021b4e94[];
extern int data_ov014_022350e0;

extern void OS_SPrintf(void *out, void *fmt, int v);
extern void func_0201ef3c(void *a, void *b, void *c);
extern void func_0201e7e0(void);
extern void func_0201ef90(void *a, void *b, void *c, int d, int e, int f,
                           void *g, int h, int i, void *j);
extern int func_0201ede4(int arg0, int arg1);

void func_ov014_021b4294(SelfT *self) {
    char bufs[4][0x40];
    void *table[4];
    int scratch;
    int result;
    int i;

    OS_SPrintf(bufs[0], data_ov014_021b4e34, (unsigned int)(self->f54 << 24) >> 24);
    OS_SPrintf(bufs[1], data_ov014_021b4e54, (unsigned int)(self->f54 << 24) >> 24);
    OS_SPrintf(bufs[2], data_ov014_021b4e74, (unsigned int)(self->f54 << 24) >> 24);
    OS_SPrintf(bufs[3], data_ov014_021b4e94, (unsigned int)(self->f54 << 24) >> 24);

    for (i = 0; i < 4; i++) {
        table[i] = bufs[i];
    }

    if (self->f10 != 0) {
        func_0201ef3c(self->f4, &self->fc, &self->f10);
        self->f14 = 0;
        self->f10 = 0;
    }

    func_0201e7e0();

    func_0201ef90(&self->f4, &self->f8, &self->fc, 0, 0, 1,
                  table, 1, -1, &self->f10);

    result = func_0201ede4((int)&scratch, (int)table[3]);
    data_ov014_022350e0 = result;
}
