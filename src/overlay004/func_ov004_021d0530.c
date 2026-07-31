typedef struct {
    unsigned int a;
    unsigned int b;
    unsigned char _pad8[0x14];
    struct {
        unsigned int low8 : 8;
        unsigned int : 24;
    };
    unsigned char _pad20[0x4];
    struct {
        unsigned int : 17;
        unsigned int mid4 : 4;
        unsigned int : 11;
    };
} state_t;

typedef struct {
    unsigned char _pad0[4];
    unsigned int low3 : 3;
    unsigned int : 29;
} T02104f4c;

extern state_t data_02102c90;
extern T02104f4c data_02104f4c;
extern void func_02001d0c(state_t *p, int a, int b);
extern void func_02001d68(int arg);
extern void *Vram_GetBankBaseE(void);
extern void func_02094504(int a, void *b, int c);
extern int func_0202c0c0(void *self);
extern int func_020054a4(int a, int b);
extern void func_02004f58(void *p, int b, void *c, int d, int e, int f);
extern void *func_0208e1ac(void);
extern void func_02001e94(void *p, void *dst, int val, int shift);

void func_ov004_021d0530(void *self) {
    func_02001d0c(&data_02102c90, 0x20, 2);
    func_02001d68(data_02104f4c.low3);
    func_02094504(0, (char *)Vram_GetBankBaseE() + 0xda0, 0x800);

    if (self != 0) {
        int r5 = func_0202c0c0(self);
        void *r4 = Vram_GetBankBaseE();
        int val = func_020054a4(r5, 0xc);

        func_02004f58(&data_02102c90, r5, (char *)r4 + 0xda0, 0x80 - val / 2, 2, 0xc);
        func_02001e94(&data_02102c90, (char *)func_0208e1ac() + 0x280, 0x6d, 1);
    }
}
