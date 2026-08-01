typedef struct {
    char pad0[0x48];
    int f48;
    char pad1[0x54 - 0x48 - 4];
    int f54;
    char pad2[0x74 - 0x54 - 4];
    int f74;
    char pad3[0x94 - 0x74 - 4];
    int f94;
    char pad4[0x9c - 0x94 - 4];
    int f9c;
    int fa0;
} T0220b500_021cc97c;

extern T0220b500_021cc97c data_ov004_0220b500;
extern int data_ov004_022915e8;

extern int func_0202046c(void);
extern void func_0201d364(void);
extern void func_0201d050(int x);
extern void func_0201d384(void);
extern void func_02037208(int a, int b, int c, int d);
extern void *func_0208e0a0(void);
extern void func_02094504(int a, void *b, int c);

void func_ov004_021cc97c(void) {
    T0220b500_021cc97c *t = &data_ov004_0220b500;
    void *p;

    t->f9c = 0;
    t->fa0 = 0;

    if (func_0202046c() != 0) {
        func_0201d364();
        func_0201d050(0);
    } else {
        func_0201d384();
    }

    int flag = data_ov004_022915e8 ? 1 : 0;
    if (flag == 0) {
        if (func_0202046c() != 0) {
            t->f54 = 1;
        } else {
            t->f48 = 0xb;
        }
        func_02037208(0x42, 0x42 - 0x43, 0, 1);
    }

    if (t->f94 == 0) {
        return;
    }

    p = func_0208e0a0();
    func_02094504(0, (char *)p + 0x200, 0x280);
    t->f94 = 0;
    t->f74 = 0;
}
