extern void func_02094500(void *dst, int val, int size);
extern void func_02018bb4(void);
extern int func_02007e70(void);
extern void func_0200725c(void);
extern void func_02013884(void);
extern void func_0200a438(void);
extern void func_0200a250(int mode);
extern void func_02007f1c(void);

extern char data_02104e6c[];
extern char data_02104e5c[];
extern char data_02105e5c[];

typedef struct {
    char pad_0[0x62];
    short field_62;
    char pad_64[0x68 - 0x64];
    short field_68;
} T0210593c;

extern T0210593c data_0210585c;

void func_02007f3c(void) {
    unsigned int v;

    func_02094500(data_02104e6c, 0, 0x1b0c);
    func_02018bb4();

    data_0210585c.field_62 = 1;
    data_0210585c.field_68 = 1;
    *(int *)(data_02104e5c + 0xa70) = 500;

    v = func_02007e70();
    *(unsigned int *)(data_02104e5c + 0x14) =
        (*(unsigned int *)(data_02104e5c + 0x14) & ~7) | (v & 7);

    func_0200725c();

    *(int *)(data_02105e5c + 0x858) = -1;

    func_02013884();
    func_0200a438();
    func_0200a250(2);
    func_0200a250(1);
    func_0200a250(0);
    func_02007f1c();
}
