extern void func_020945f4(void *dst, int val, int size);
extern void func_02018be8(void);
extern int func_02007e8c(void);
extern void func_02007278(void);
extern void func_020138b8(void);
extern void func_0200a454(void);
extern void func_0200a26c(int mode);
extern void func_02007f38(void);

extern char data_02104f4c[];
extern char data_02104f3c[];
extern char data_02105f3c[];

typedef struct {
    char pad_0[0x62];
    short field_62;
    char pad_64[0x68 - 0x64];
    short field_68;
} T0210593c;

extern T0210593c data_0210593c;

void func_02007f58(void) {
    unsigned int v;

    func_020945f4(data_02104f4c, 0, 0x1b0c);
    func_02018be8();

    data_0210593c.field_62 = 1;
    data_0210593c.field_68 = 1;
    *(int *)(data_02104f3c + 0xa70) = 500;

    v = func_02007e8c();
    *(unsigned int *)(data_02104f3c + 0x14) =
        (*(unsigned int *)(data_02104f3c + 0x14) & ~7) | (v & 7);

    func_02007278();

    *(int *)(data_02105f3c + 0x858) = -1;

    func_020138b8();
    func_0200a454();
    func_0200a26c(2);
    func_0200a26c(1);
    func_0200a26c(0);
    func_02007f38();
}
