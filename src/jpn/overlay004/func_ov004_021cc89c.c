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

extern T0220b500_021cc97c data_ov004_0220b2a0;
extern int data_ov004_02291388;

extern int func_02020418(void);
extern void func_0201d310(void);
extern void func_0201cffc(int x);
extern void func_0201d330(void);
extern void func_020371b8(int a, int b, int c, int d);
extern void *func_0208dfb8(void);
extern void func_02094410(int a, void *b, int c);

void func_ov004_021cc89c(void) {
    T0220b500_021cc97c *t = &data_ov004_0220b2a0;
    void *p;

    t->f9c = 0;
    t->fa0 = 0;

    if (func_02020418() != 0) {
        func_0201d310();
        func_0201cffc(0);
    } else {
        func_0201d330();
    }

    int flag = data_ov004_02291388 ? 1 : 0;
    if (flag == 0) {
        if (func_02020418() != 0) {
            t->f54 = 1;
        } else {
            t->f48 = 0xb;
        }
        func_020371b8(0x42, 0x42 - 0x43, 0, 1);
    }

    if (t->f94 == 0) {
        return;
    }

    p = func_0208dfb8();
    func_02094410(0, (char *)p + 0x200, 0x280);
    t->f94 = 0;
    t->f74 = 0;
}
