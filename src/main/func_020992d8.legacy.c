typedef struct {
    int f0;
    int f4;
    void *buf_a;
    void *buf_b;
    void *fn_a;
    void *fn_b;
    void *fn_c;
} Desc;

extern Desc data_0210268c;
extern void func_02099370(void);
extern void func_0209956c(void);
extern void func_020996c8(void);
extern void func_02099718(int a0, int a1, int a2, int a3, int a4, Desc *desc);

void func_020992d8(int a0, int a1, int a2, int a3, int a4) {
    char small[0x14];
    Desc desc;
    char large[0x68];
    desc = data_0210268c;
    desc.buf_a = large;
    desc.buf_b = small;
    desc.fn_a = func_020996c8;
    desc.fn_b = func_0209956c;
    desc.fn_c = func_02099370;
    func_02099718(a0, a1, a2, a3, a4, &desc);
}
