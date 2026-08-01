extern char data_ov006_021cde2c[];

typedef struct {
    int field_0;
    unsigned int bits : 3;
} S_02104f4c_t;
extern S_02104f4c_t data_02104f4c;

extern void *func_0208dd9c(void);
extern void func_02094504(int a, void *b, int c);
extern void func_02001d0c(void *ctx, int mode, int n);
extern void func_02001d68(int val);
extern void func_02001d98(void *ctx, int val);
extern void *func_0202c0c0(int id);
extern int func_02005554(void *handle, int a, int b);
extern void func_02004f58(void *ctx, void *a, void *b, int c, int d, int e);

int func_ov006_021c4ec4(char *a) {
    char *p = (char *)func_0208dd9c() + 0x2040 + 0x4000;
    int v;
    int mode;

    func_02094504(0, p, 0xc00);

    v = *(short *)(data_ov006_021cde2c + *(int *)(a + 0x58) * 4);
    mode = (v == 2) ? 2 : 1;

    if (mode == 2) {
        int step = 0xc;
        void *h;

        func_02001d0c(a + 0x10, 0x10, 3);
        func_02001d68(data_02104f4c.bits);
        func_02001d98(a + 0x10, 5);

        for (int i = 0; i < 2; i++) {
            int r;
            h = func_0202c0c0(i + 0x45b);
            r = func_02005554(h, step, 5);
            int base = (i == 0) ? 0x43 : 0x3b;
            int c1 = base - ((int)(r + ((unsigned int)r >> 31)) >> 1);
            int arg5 = (i == *(int *)(a + 0x64)) ? 5 : 6;
            int bit3 = data_02104f4c.bits;
            int c3 = c1 + (bit3 == 0 ? 4 : 6);
            void *pofs = p + (i == 0 ? 0 : 0x600);

            func_02004f58(a + 0x10, h, pofs, c3, arg5, step);
        }

        func_02001d98(a + 0x10, -1);
    } else {
        void *h;
        int r;
        int c1;

        func_02001d0c(a + 0x10, 0x20, 3);
        func_02001d68(data_02104f4c.bits);
        func_02001d98(a + 0x10, 5);

        h = func_0202c0c0(0x45b);
        r = func_02005554(h, 0xc, 5);
        c1 = 0x80 - ((int)(r + ((unsigned int)r >> 31)) >> 1);

        func_02004f58(a + 0x10, h, p, c1, 5, 0xc);
        func_02001d98(a + 0x10, -1);
    }

    return 1;
}
