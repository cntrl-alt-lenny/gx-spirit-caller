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

extern state_t data_02102bb0;
extern T02104f4c data_02104e6c;
extern void func_02001cec(state_t *p, int a, int b);
extern void func_02001d48(int arg);
extern void *func_0208de04(void);
extern void func_02094410(int a, void *b, int c);
extern int func_0202c06c(void *self);
extern int func_02005488(int a, int b);
extern void func_02004f3c(void *p, int b, void *c, int d, int e, int f);
extern void *func_0208e0c4(void);
extern void func_02001e74(void *p, void *dst, int val, int shift);

void func_ov004_021d0450(void *self) {
    func_02001cec(&data_02102bb0, 0x20, 2);
    func_02001d48(data_02104e6c.low3);
    func_02094410(0, (char *)func_0208de04() + 0xda0, 0x800);

    if (self != 0) {
        int r5 = func_0202c06c(self);
        void *r4 = func_0208de04();
        int val = func_02005488(r5, 0xc);

        func_02004f3c(&data_02102bb0, r5, (char *)r4 + 0xda0, 0x80 - val / 2, 2, 0xc);
        func_02001e74(&data_02102bb0, (char *)func_0208e0c4() + 0x280, 0x6d, 1);
    }
}
