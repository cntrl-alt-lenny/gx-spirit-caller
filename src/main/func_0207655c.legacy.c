typedef struct { unsigned char pad[0x14]; unsigned int count_hi, count_lo; unsigned char buf[64]; } ShaCtx;
typedef struct { unsigned char pad[0x10]; unsigned int count_lo, count_hi; unsigned char buf[64]; } MdCtx;
extern void func_0207850c(ShaCtx *c, unsigned char *data, unsigned int len);
extern void func_02077ecc(MdCtx *c, unsigned char *data, unsigned int len);
extern void func_020785cc(unsigned int *self);
extern void func_02077f8c(unsigned int *self);
extern void func_02078498(void *a0, void *a1);
extern void func_02077e58(char *a, char *b);
extern void func_02078e3c(void *dst, unsigned char *key, int len);
void func_0207655c(unsigned char *self) {
    int a, b, c;
    int total;
    int i, j, offset;
    unsigned char buf[21];
    unsigned char *ctx;
    switch (*(unsigned short *)(self + 0x32)) {
    case 4: a = 16; b = 16; c = 0; break;
    case 5: a = 20; b = 16; c = 0; break;
    }
    total = (a + b + c) * 2;
    for (i = 0; i * 16 < total; i++) {
        ctx = self + 0x348;
        func_020785cc((unsigned int *)ctx);
        buf[0] = i + 0x41;
        for (j = 0; j < i + 1; j++) func_0207850c((ShaCtx *)ctx, buf, 1);
        func_0207850c((ShaCtx *)ctx, self, 0x30);
        func_0207850c((ShaCtx *)ctx, self + 0x54, 0x20);
        func_0207850c((ShaCtx *)ctx, self + 0x34, 0x20);
        func_02078498(ctx, buf + 1);
        ctx = self + 0x3fc;
        func_02077f8c((unsigned int *)ctx);
        func_02077ecc((MdCtx *)ctx, self, 0x30);
        func_02077ecc((MdCtx *)ctx, buf + 1, 0x14);
        func_02077e58((char *)ctx, (char *)(self + 0x74 + i * 16));
    }
    if (self[0x454]) {
        *(unsigned char **)(self + 0x1d4) = self + 0x74;
        *(unsigned char **)(self + 0x1d8) = *(unsigned char **)(self + 0x1d4) + a * 2;
        *(unsigned char **)(self + 0xbc) = self + 0x74 + a;
        *(unsigned char **)(self + 0xc0) = *(unsigned char **)(self + 0xbc) + a + b;
    } else {
        *(unsigned char **)(self + 0xbc) = self + 0x74;
        *(unsigned char **)(self + 0xc0) = *(unsigned char **)(self + 0xbc) + a * 2;
        *(unsigned char **)(self + 0x1d4) = self + 0x74 + a;
        *(unsigned char **)(self + 0x1d8) = *(unsigned char **)(self + 0x1d4) + a + b;
    }
    func_02078e3c(self + 0x1e0, *(unsigned char **)(self + 0x1d8), 16);
    func_02078e3c(self + 0xc8, *(unsigned char **)(self + 0xc0), 16);
}

