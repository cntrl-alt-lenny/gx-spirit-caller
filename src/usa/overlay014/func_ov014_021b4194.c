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

extern char data_ov014_021b4d34[];
extern char data_ov014_021b4d54[];
extern char data_ov014_021b4d74[];
extern char data_ov014_021b4d94[];
extern int data_ov014_02234fe0;

extern void OS_SPrintf(void *out, void *fmt, int v);
extern void func_0201eee8(void *a, void *b, void *c);
extern void func_0201e78c(void);
extern void func_0201ef3c(void *a, void *b, void *c, int d, int e, int f,
                           void *g, int h, int i, void *j);
extern int func_0201ed90(int arg0, int arg1);

void func_ov014_021b4194(SelfT *self) {
    char bufs[4][0x40];
    void *table[4];
    int scratch;
    int result;
    int i;

    OS_SPrintf(bufs[0], data_ov014_021b4d34, (unsigned int)(self->f54 << 24) >> 24);
    OS_SPrintf(bufs[1], data_ov014_021b4d54, (unsigned int)(self->f54 << 24) >> 24);
    OS_SPrintf(bufs[2], data_ov014_021b4d74, (unsigned int)(self->f54 << 24) >> 24);
    OS_SPrintf(bufs[3], data_ov014_021b4d94, (unsigned int)(self->f54 << 24) >> 24);

    for (i = 0; i < 4; i++) {
        table[i] = bufs[i];
    }

    if (self->f10 != 0) {
        func_0201eee8(self->f4, &self->fc, &self->f10);
        self->f14 = 0;
        self->f10 = 0;
    }

    func_0201e78c();

    func_0201ef3c(&self->f4, &self->f8, &self->fc, 0, 0, 1,
                  table, 1, -1, &self->f10);

    result = func_0201ed90((int)&scratch, (int)table[3]);
    data_ov014_02234fe0 = result;
}
