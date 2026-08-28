extern void        *data_02101ca4;
extern int          data_0219ebec;
extern void  func_0206a2a0(void *ctx, int v);
extern void  func_0206a9f4(void *ctx);
extern unsigned int func_020aace8(void *h);
extern int   func_020aaf60(void *a, void *h, unsigned int n);

typedef void (*VFn)(unsigned char *, int, int, int);

void func_0206b1e4(unsigned char *ctx) {
    unsigned int n;
    void        *h0;
    void        *h1;
    void        *base;

    n = *(unsigned int *)(ctx + 0x80);
    if ((int)n > 0) {
        h0 = data_02101ca4;
        if (n > func_020aace8(h0)) {
            base = *(void **)(ctx + 0x7c);
            h1   = data_02101ca4;
            if (func_020aaf60(base, h1, func_020aace8(h1)) == 0) {
                func_0206a2a0(ctx, (int)base + (int)func_020aace8(h0));
                (*(VFn *)(ctx + 0x488))(ctx, 5, data_0219ebec,
                                        *(int *)(ctx + 0x494));
            }
        }
    }

    (*(VFn *)(ctx + 0x488))(ctx, 4, data_0219ebec, *(int *)(ctx + 0x494));
    func_0206a9f4(ctx);
}
