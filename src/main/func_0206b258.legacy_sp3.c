extern void        *data_02101d84;
extern int          data_0219eccc;
extern void  func_0206a314(void *ctx, int v);
extern void  func_0206aa68(void *ctx);
extern unsigned int func_020aaddc(void *h);
extern int   func_020ab054(void *a, void *h, unsigned int n);

typedef void (*VFn)(unsigned char *, int, int, int);

void func_0206b258(unsigned char *ctx) {
    unsigned int n;
    void        *h0;
    void        *h1;
    void        *base;

    n = *(unsigned int *)(ctx + 0x80);
    if ((int)n > 0) {
        h0 = data_02101d84;
        if (n > func_020aaddc(h0)) {
            base = *(void **)(ctx + 0x7c);
            h1   = data_02101d84;
            if (func_020ab054(base, h1, func_020aaddc(h1)) == 0) {
                func_0206a314(ctx, (int)base + (int)func_020aaddc(h0));
                (*(VFn *)(ctx + 0x488))(ctx, 5, data_0219eccc,
                                        *(int *)(ctx + 0x494));
            }
        }
    }

    (*(VFn *)(ctx + 0x488))(ctx, 4, data_0219eccc, *(int *)(ctx + 0x494));
    func_0206aa68(ctx);
}
